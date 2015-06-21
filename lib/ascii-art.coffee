AsciiArtView = require './ascii-art-view'
{CompositeDisposable} = require 'atom'

module.exports = AsciiArt =
  activate: ->
    atom.commands.add 'atom-workspace', "ascii-art:convert", => @convert()

  convert: ->
    editor = atom.workspace.getActivePaneItem()
    selection = editor.getLastSelection()

    figlet = require 'figlet'
    figlet selection.getText(), {font: "Larry 3D 2"}, (error, asciiArt) ->
      if error
        console.error(error)
      else
        selection.insertText("\n#{asciiArt}\n")
