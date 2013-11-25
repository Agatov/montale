class Countdown
  constructor: (@start_time = "05:24:13") ->

  init: ->
    @reset()
    window.tick = =>
      @tick()
    setInterval(window.tick, 1000)

  reset: ->
    time = @start_time.split(':')
    @hours = parseInt(time[0])
    @minutes = parseInt(time[1])
    @seconds = parseInt(time[2])
    @updateTarget()

  tick: ->
    [seconds, minutes, hours] = [@seconds, @minutes, @hours]
    if seconds > 0 or minutes > 0
      if seconds is 0
        @minutes = minutes - 1
        @seconds = 59
      else
        @seconds = seconds - 1
    @updateTarget()

  updateTarget: ->

    hours = @hours
    hours = '0' + hours if hours < 10

    minutes = @minutes
    minutes = '0' + minutes if minutes < 10


    seconds = @seconds
    seconds = '0' + seconds if seconds < 10


    $('#hours').text(hours)
    $('#minutes').text(minutes)
    $('#seconds').text(seconds)


#    if @hours < 10
#      $('#hours-first').text('0')
#      $('#hours-last').text(@hours)
#
#    if @minutes < 10
#      $('#minutes-first').text('0')
#      $('#minutes-last').text(@minutes)
#    else
#      $('#minutes-first').text("#{@minutes}"[0])
#      $('#minutes-last').text("#{@minutes}"[1])
#
#
#    if @seconds < 10
#      $('#seconds-first').text('0')
#      $('#seconds-last').text(@seconds)
#    else
#      $('#seconds-first').text "#{@seconds}"[0]
#      $('#seconds-last').text  "#{@seconds}"[1]


$ ->

  timer = new Countdown()
  timer.init()
  $('#timer').unbind('click')
