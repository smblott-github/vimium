$ = (id) -> document.getElementById id
$$ = (element, selector) -> element.querySelector selector


instantiateHtmlTemplate = (parentNode, templateId, callback) ->
  templateContent = document.querySelector(templateId).content
  node = document.importNode templateContent, true
  parentNode.appendChild node
  callback parentNode.lastElementChild

DomUtils.documentReady ->
  container = $ "commandOptionsList"
  for option in Commands.commandOptions
    instantiateHtmlTemplate container, "#commandOption", (element) ->
      $$(element, ".commandOptionHeader").textContent = option.title
      $$(element, ".commandOptionExplanation").innerHTML = option.explanation
      $$(element, ".commandOptionExamples").innerHTML = option.examples.join "<br />"
