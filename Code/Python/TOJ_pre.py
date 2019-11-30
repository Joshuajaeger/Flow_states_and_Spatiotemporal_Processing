#!/usr/bin/env python
# -*- coding: utf-8 -*-
"""
This experiment was created using PsychoPy3 Experiment Builder (v3.0.5),
    on November 30, 2019, at 19:34
If you publish work using this script please cite the PsychoPy publications:
    Peirce, JW (2007) PsychoPy - Psychophysics software in Python.
        Journal of Neuroscience Methods, 162(1-2), 8-13.
    Peirce, JW (2009) Generating stimuli for neuroscience using PsychoPy.
        Frontiers in Neuroinformatics, 2:10. doi: 10.3389/neuro.11.010.2008
"""

from __future__ import absolute_import, division
from psychopy import locale_setup, sound, gui, visual, core, data, event, logging, clock
from psychopy.constants import (NOT_STARTED, STARTED, PLAYING, PAUSED,
                                STOPPED, FINISHED, PRESSED, RELEASED, FOREVER)
import numpy as np  # whole numpy lib is available, prepend 'np.'
from numpy import (sin, cos, tan, log, log10, pi, average,
                   sqrt, std, deg2rad, rad2deg, linspace, asarray)
from numpy.random import random, randint, normal, shuffle
import os  # handy system and path functions
import sys  # to get file system encoding


# Ensure that relative paths start from the same directory as this script
_thisDir = os.path.dirname(os.path.abspath(__file__))
os.chdir(_thisDir)

# Store info about the experiment session
psychopyVersion = '3.0.5'
expName = 'Flow_endo_pre'  # from the Builder filename that created this script
expInfo = {'Session': '001', 'Participant': ''}
dlg = gui.DlgFromDict(dictionary=expInfo, title=expName)
if dlg.OK == False:
    core.quit()  # user pressed cancel
expInfo['date'] = data.getDateStr()  # add a simple timestamp
expInfo['expName'] = expName
expInfo['psychopyVersion'] = psychopyVersion

# Data file name stem = absolute path + name; later add .psyexp, .csv, .log, etc
filename = _thisDir + os.sep + 'data/%s_%s_%s_%s' %(expName, expInfo['Participant'], expInfo['Session'], expInfo['date'])

# An ExperimentHandler isn't essential but helps with data saving
thisExp = data.ExperimentHandler(name=expName, version='',
    extraInfo=expInfo, runtimeInfo=None,
    originPath='C:\\Users\\Manfred Mustermann\\OneDrive\\Dokumente\\Science\\Scotts lab\\Flow_states_and_Spatiotemporal_Processing\\Code\\Python\\TOJ_pre_lastrun.py',
    savePickle=True, saveWideText=True,
    dataFileName=filename)
logging.console.setLevel(logging.WARNING)  # this outputs to the screen, not a file

endExpNow = False  # flag for 'escape' or other condition => quit the exp

# Start Code - component code to be run before the window creation

# Setup the Window
win = visual.Window(
    size=[1920, 1080], fullscr=True, screen=0,
    allowGUI=True, allowStencil=False,
    monitor='testMonitor', color='white', colorSpace='rgb',
    blendMode='avg', useFBO=True,
    units='cm')
# store frame rate of monitor if we can measure it
expInfo['frameRate'] = win.getActualFrameRate()
if expInfo['frameRate'] != None:
    frameDur = 1.0 / round(expInfo['frameRate'])
else:
    frameDur = 1.0 / 60.0  # could not measure, so guess

# Initialize components for Routine "instructs"
instructsClock = core.Clock()

instructText = visual.TextStim(win=win, name='instructText',
    text='Welcome and thank you for your participation in the following experiment!\n\nYour task for this experiment is to indicate as accurately as possible which of two lines appear first on the screen. \nIn each trial you will be presented with two squares on the right and left side of a fixation cross (+). Please try to look at this fixation cross at the beginning of and throughout each trial. After a certain amount of time a horizontal and vertical line will appear. Please use the RIGHT and LEFT arrow keys to indicate which line appeared first. \nFor example, if you think the line appearing in the left box appeared first, you should push the LEFT arrow key. If you are unsure, please make your best guess. \nShortly before the lines appear, an arrow in the middle of the screen will point to one side or the other. This arrow gives you no information about the order of the lines, and you can ignore it.\nIf you have any further questions, please ask.\n\nWhen you are ready, start the experiment with the "space bar".\n',
    font='Arial',
    units='cm', pos=(0, 0), height=0.5, wrapWidth=None, ori=0, 
    color='black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);

# Initialize components for Routine "Endogenous"
EndogenousClock = core.Clock()


fixation = visual.TextStim(win=win, name='fixation',
    text='+',
    font='Arial',
    units='cm', pos=(0, 0), height=0.5, wrapWidth=None, ori=0, 
    color='black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-2.0);
rectangle_left = visual.Rect(
    win=win, name='rectangle_left',units='cm', 
    width=(1.6, 1.6)[0], height=(1.6, 1.6)[1],
    ori=0, pos=(-4.6, 0),
    lineWidth=4, lineColor='black', lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-3.0, interpolate=True)
rectangle_right = visual.Rect(
    win=win, name='rectangle_right',units='cm', 
    width=(1.6, 1.6)[0], height=(1.6, 1.6)[1],
    ori=0, pos=(4.6, 0),
    lineWidth=4, lineColor='black', lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-4.0, interpolate=True)
cue = visual.ImageStim(
    win=win, name='cue',units='cm', 
    image='images/arrow-left.png', mask=None,
    ori=1.0, pos=(0, 0), size=(1.5, 1.5),
    color=[1,1,1], colorSpace='rgb', opacity=1,
    flipHoriz=False, flipVert=False,
    texRes=128, interpolate=True, depth=-5.0)
TargetX = visual.Line(
    win=win, name='TargetX',units='cm', 
    start=(-(1.2, 1.2)[0]/2.0, 0), end=(+(1.2, 1.2)[0]/2.0, 0),
    ori=1.0, pos=[0,0],
    lineWidth=4, lineColor='black', lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-6.0, interpolate=True)
TargetY = visual.Line(
    win=win, name='TargetY',units='cm', 
    start=(-(1.2, 1.2)[0]/2.0, 0), end=(+(1.2, 1.2)[0]/2.0, 0),
    ori=1.0, pos=[0,0],
    lineWidth=4, lineColor='black', lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-7.0, interpolate=True)


# Initialize components for Routine "pause"
pauseClock = core.Clock()

instructText_2 = visual.TextStim(win=win, name='instructText_2',
    text='Short break!\n\nAgain you will be presented with two squares on the right and left side of a fixation cross (+). Please try to look at this fixation cross at the beginning of and throughout each trial. After a certain amount of time a horizontal and vertical line will appear. Please use the RIGHT and LEFT arrow keys to indicate which line appeared first. \nFor example, if you think the line appearing in the left box appeared first, you should push the LEFT arrow key. If you are unsure, please make your best guess. \nShortly before the lines appear, a rectangle around one of the two squares will appear. This rectangle gives you no information about the order of the lines, and you can ignore it.\nIf you have any further questions, please ask.\n\nWhen you are ready, start the experiment with the "space bar".\n',
    font='Arial',
    units='cm', pos=(0, 0), height=0.5, wrapWidth=None, ori=0, 
    color='black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);

# Initialize components for Routine "Exogenous"
ExogenousClock = core.Clock()


fixation_2 = visual.TextStim(win=win, name='fixation_2',
    text='+',
    font='Arial',
    units='cm', pos=(0, 0), height=0.5, wrapWidth=None, ori=0, 
    color='black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-2.0);
rectangle_left_2 = visual.Rect(
    win=win, name='rectangle_left_2',units='cm', 
    width=(1.6, 1.6)[0], height=(1.6, 1.6)[1],
    ori=0, pos=(-4.6, 0),
    lineWidth=4, lineColor='black', lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-3.0, interpolate=True)
rectangle_right_2 = visual.Rect(
    win=win, name='rectangle_right_2',units='cm', 
    width=(1.6, 1.6)[0], height=(1.6, 1.6)[1],
    ori=0, pos=(4.6, 0),
    lineWidth=4, lineColor='black', lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-4.0, interpolate=True)
CueExo = visual.Rect(
    win=win, name='CueExo',units='cm', 
    width=(1.7, 1.7)[0], height=(1.7, 1.7)[1],
    ori=0, pos=[0,0],
    lineWidth=12, lineColor='black', lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-5.0, interpolate=True)
TargetX_2 = visual.Line(
    win=win, name='TargetX_2',units='cm', 
    start=(-(1.2, 1.2)[0]/2.0, 0), end=(+(1.2, 1.2)[0]/2.0, 0),
    ori=1.0, pos=[0,0],
    lineWidth=4, lineColor='black', lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-6.0, interpolate=True)
TargetY_2 = visual.Line(
    win=win, name='TargetY_2',units='cm', 
    start=(-(1.2, 1.2)[0]/2.0, 0), end=(+(1.2, 1.2)[0]/2.0, 0),
    ori=1.0, pos=[0,0],
    lineWidth=4, lineColor='black', lineColorSpace='rgb',
    fillColor=[1,1,1], fillColorSpace='rgb',
    opacity=1, depth=-7.0, interpolate=True)


# Initialize components for Routine "Time_passage"
Time_passageClock = core.Clock()

Time_pas_text = visual.TextStim(win=win, name='Time_pas_text',
    text="Lastly, we'd like to ask you a purely hypothetical question:\n\nNext Wednesday’s meeting has been moved forward two days. On what day will the meeting now take place?",
    font='Arial',
    pos=(0, 1), height=0.7, wrapWidth=None, ori=0, 
    color='Black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);
Time_pas_Ans = visual.RatingScale(win=win, name='Time_pas_Ans', stretch=2.0,
textColor='Black',
acceptPreText='Please use the mouse to choose a weekday',
singleClick=True, 
choices = ['Monday','Tuesday   ','   Wednesday   ','   Thursday','Friday','Saturday','Sunday'],
acceptSize=3.3,
minTime=1.1)

# Initialize components for Routine "finish"
finishClock = core.Clock()

finishMsg = visual.TextStim(win=win, name='finishMsg',
    text='You did it!\n\nMany thanks for your participation!\n\nPlease call the test instructor.',
    font='Arial',
    units='cm', pos=(0, 0), height=0.7, wrapWidth=None, ori=0, 
    color='black', colorSpace='rgb', opacity=1, 
    languageStyle='LTR',
    depth=-1.0);

# Create some handy timers
globalClock = core.Clock()  # to track the time since experiment started
routineTimer = core.CountdownTimer()  # to track time remaining of each (non-slip) routine 

# ------Prepare to start Routine "instructs"-------
t = 0
instructsClock.reset()  # clock
frameN = -1
continueRoutine = True
# update component parameters for each repeat
win.mouseVisible = False
keyToStart = event.BuilderKeyResponse()
# keep track of which components have finished
instructsComponents = [instructText, keyToStart]
for thisComponent in instructsComponents:
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED

# -------Start Routine "instructs"-------
while continueRoutine:
    # get current time
    t = instructsClock.getTime()
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    
    # *instructText* updates
    if t >= 0.0 and instructText.status == NOT_STARTED:
        # keep track of start time/frame for later
        instructText.tStart = t
        instructText.frameNStart = frameN  # exact frame index
        instructText.setAutoDraw(True)
    
    # *keyToStart* updates
    if t >= 0.0 and keyToStart.status == NOT_STARTED:
        # keep track of start time/frame for later
        keyToStart.tStart = t
        keyToStart.frameNStart = frameN  # exact frame index
        keyToStart.status = STARTED
        # keyboard checking is just starting
        event.clearEvents(eventType='keyboard')
    if keyToStart.status == STARTED:
        theseKeys = event.getKeys(keyList=['space'])
        
        # check for quit:
        if "escape" in theseKeys:
            endExpNow = True
        if len(theseKeys) > 0:  # at least one key was pressed
            # a response ends the routine
            continueRoutine = False
    
    # check for quit (typically the Esc key)
    if endExpNow or event.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in instructsComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "instructs"-------
for thisComponent in instructsComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)

# the Routine "instructs" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# --------Prepare to start Staircase "Stair" --------
# set up handler to look after next chosen value etc
Stair = data.StairHandler(startVal=81, extraInfo=expInfo,
    stepSizes=[1], stepType='lin',
    nReversals=14, nTrials=1, 
    nUp=1, nDown=3,
    minVal=65, maxVal=160,
    originPath=-1, name='Stair')
thisExp.addLoop(Stair)  # add the loop to the experiment
level = thisStair = 81  # initialise some vals

for thisStair in Stair:
    currentLoop = Stair
    level = thisStair
    
    # ------Prepare to start Routine "Endogenous"-------
    t = 0
    EndogenousClock.reset()  # clock
    frameN = -1
    continueRoutine = True
    # update component parameters for each repeat
    import random
    
    cueOri = random.choice([0,180])
    
    Stair.addOtherData('cueOri', cueOri)
    
    targetOri = random.choice([0,90])
    
    
    targetXOri = 90-targetOri
    targetYOri = targetOri-0
    
    Stair.addOtherData('targetXOri', targetXOri)
    
    targetPos= random.choice([-1,1])
    
    targetXPos = 4.6*targetPos
    targetYPos = -4.6*targetPos
    
    Stair.addOtherData('targetXPos', targetXPos)
    
    win.mouseVisible = False
    if targetPos > 0:
        CorrectAns = 'right'
    else: 
        CorrectAns = 'left'
        
    
    Stair.addOtherData('CorrectAns', CorrectAns)
    
    
    
    
    cue.setOri(cueOri)
    TargetX.setPos((targetXPos, 0))
    TargetX.setOri(targetXOri)
    TargetY.setPos((targetYPos, 0))
    TargetY.setOri(targetYOri)
    keyPress = event.BuilderKeyResponse()
    
    # keep track of which components have finished
    EndogenousComponents = [fixation, rectangle_left, rectangle_right, cue, TargetX, TargetY, keyPress]
    for thisComponent in EndogenousComponents:
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    
    # -------Start Routine "Endogenous"-------
    while continueRoutine:
        # get current time
        t = EndogenousClock.getTime()
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        
        
        # *fixation* updates
        if t >= 0.0 and fixation.status == NOT_STARTED:
            # keep track of start time/frame for later
            fixation.tStart = t
            fixation.frameNStart = frameN  # exact frame index
            fixation.setAutoDraw(True)
        
        # *rectangle_left* updates
        if t >= 0.0 and rectangle_left.status == NOT_STARTED:
            # keep track of start time/frame for later
            rectangle_left.tStart = t
            rectangle_left.frameNStart = frameN  # exact frame index
            rectangle_left.setAutoDraw(True)
        
        # *rectangle_right* updates
        if t >= 0.0 and rectangle_right.status == NOT_STARTED:
            # keep track of start time/frame for later
            rectangle_right.tStart = t
            rectangle_right.frameNStart = frameN  # exact frame index
            rectangle_right.setAutoDraw(True)
        
        # *cue* updates
        if t >= 1 and cue.status == NOT_STARTED:
            # keep track of start time/frame for later
            cue.tStart = t
            cue.frameNStart = frameN  # exact frame index
            cue.setAutoDraw(True)
        frameRemains = 1 + 0.045- win.monitorFramePeriod * 0.75  # most of one frame period left
        if cue.status == STARTED and t >= frameRemains:
            cue.setAutoDraw(False)
        
        # *TargetX* updates
        if frameN >= 65 and TargetX.status == NOT_STARTED:
            # keep track of start time/frame for later
            TargetX.tStart = t
            TargetX.frameNStart = frameN  # exact frame index
            TargetX.setAutoDraw(True)
        
        # *TargetY* updates
        if frameN >= level and TargetY.status == NOT_STARTED:
            # keep track of start time/frame for later
            TargetY.tStart = t
            TargetY.frameNStart = frameN  # exact frame index
            TargetY.setAutoDraw(True)
        
        # *keyPress* updates
        if t >= 1.09 and keyPress.status == NOT_STARTED:
            # keep track of start time/frame for later
            keyPress.tStart = t
            keyPress.frameNStart = frameN  # exact frame index
            keyPress.status = STARTED
            # keyboard checking is just starting
            win.callOnFlip(keyPress.clock.reset)  # t=0 on next screen flip
        if keyPress.status == STARTED:
            theseKeys = event.getKeys(keyList=['left', 'right'])
            
            # check for quit:
            if "escape" in theseKeys:
                endExpNow = True
            if len(theseKeys) > 0:  # at least one key was pressed
                keyPress.keys = theseKeys[-1]  # just the last key pressed
                keyPress.rt = keyPress.clock.getTime()
                # was this 'correct'?
                if (keyPress.keys == str(CorrectAns)) or (keyPress.keys == CorrectAns):
                    keyPress.corr = 1
                else:
                    keyPress.corr = 0
                # a response ends the routine
                continueRoutine = False
        
        
        # check for quit (typically the Esc key)
        if endExpNow or event.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in EndogenousComponents:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # -------Ending Routine "Endogenous"-------
    for thisComponent in EndogenousComponents:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    
    
    # check responses
    if keyPress.keys in ['', [], None]:  # No response was made
        keyPress.keys=None
        # was no response the correct answer?!
        if str(CorrectAns).lower() == 'none':
           keyPress.corr = 1;  # correct non-response
        else:
           keyPress.corr = 0;  # failed to respond (incorrectly)
    # store data for Stair (StairHandler)
    Stair.addResponse(keyPress.corr)
    Stair.addOtherData('keyPress.rt', keyPress.rt)
    Stair.addOtherData('keyPress.rl', keyPress.keys)
    # the Routine "Endogenous" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset()
    thisExp.nextEntry()
    
# staircase completed


# ------Prepare to start Routine "pause"-------
t = 0
pauseClock.reset()  # clock
frameN = -1
continueRoutine = True
# update component parameters for each repeat
win.mouseVisible = False
keyToStart_2 = event.BuilderKeyResponse()
# keep track of which components have finished
pauseComponents = [instructText_2, keyToStart_2]
for thisComponent in pauseComponents:
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED

# -------Start Routine "pause"-------
while continueRoutine:
    # get current time
    t = pauseClock.getTime()
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    
    # *instructText_2* updates
    if t >= 0.0 and instructText_2.status == NOT_STARTED:
        # keep track of start time/frame for later
        instructText_2.tStart = t
        instructText_2.frameNStart = frameN  # exact frame index
        instructText_2.setAutoDraw(True)
    
    # *keyToStart_2* updates
    if t >= 0.0 and keyToStart_2.status == NOT_STARTED:
        # keep track of start time/frame for later
        keyToStart_2.tStart = t
        keyToStart_2.frameNStart = frameN  # exact frame index
        keyToStart_2.status = STARTED
        # keyboard checking is just starting
        event.clearEvents(eventType='keyboard')
    if keyToStart_2.status == STARTED:
        theseKeys = event.getKeys(keyList=['space'])
        
        # check for quit:
        if "escape" in theseKeys:
            endExpNow = True
        if len(theseKeys) > 0:  # at least one key was pressed
            # a response ends the routine
            continueRoutine = False
    
    # check for quit (typically the Esc key)
    if endExpNow or event.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in pauseComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "pause"-------
for thisComponent in pauseComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)

# the Routine "pause" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# --------Prepare to start Staircase "Stair2" --------
# set up handler to look after next chosen value etc
Stair2 = data.StairHandler(startVal=81, extraInfo=expInfo,
    stepSizes=[1], stepType='lin',
    nReversals=14, nTrials=1, 
    nUp=1, nDown=3,
    minVal=65, maxVal=160,
    originPath=-1, name='Stair2')
thisExp.addLoop(Stair2)  # add the loop to the experiment
level = thisStair2 = 81  # initialise some vals

for thisStair2 in Stair2:
    currentLoop = Stair2
    level = thisStair2
    
    # ------Prepare to start Routine "Exogenous"-------
    t = 0
    ExogenousClock.reset()  # clock
    frameN = -1
    continueRoutine = True
    # update component parameters for each repeat
    import random
    
    cueExoPosChoice = random.choice([-1,1])
    
    cueExoPos = 4.6*cueExoPosChoice
    
    
    
    Stair2.addOtherData('cueExoPos', cueExoPos)
    
    targetOri = random.choice([0,90])
    
    
    targetXOri = 90-targetOri
    targetYOri = targetOri-0
    
    Stair.addOtherData('targetXOri', targetXOri)
    
    targetPos= random.choice([-1,1])
    
    targetXPos = 4.6*targetPos
    targetYPos = -4.6*targetPos
    
    Stair2.addOtherData('targetXPos', targetXPos)
    
    win.mouseVisible = False
    if targetPos > 0:
        CorrectAns = 'right'
    else: 
        CorrectAns = 'left'
        
    
    Stair2.addOtherData('CorrectAns', CorrectAns)
    
    
    CueExo.setPos([cueExoPos, 0])
    TargetX_2.setPos((targetXPos, 0))
    TargetX_2.setOri(targetXOri)
    TargetY_2.setPos((targetYPos, 0))
    TargetY_2.setOri(targetYOri)
    keyPress_2 = event.BuilderKeyResponse()
    
    
    # keep track of which components have finished
    ExogenousComponents = [fixation_2, rectangle_left_2, rectangle_right_2, CueExo, TargetX_2, TargetY_2, keyPress_2]
    for thisComponent in ExogenousComponents:
        if hasattr(thisComponent, 'status'):
            thisComponent.status = NOT_STARTED
    
    # -------Start Routine "Exogenous"-------
    while continueRoutine:
        # get current time
        t = ExogenousClock.getTime()
        frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
        # update/draw components on each frame
        
        
        
        # *fixation_2* updates
        if t >= 0.0 and fixation_2.status == NOT_STARTED:
            # keep track of start time/frame for later
            fixation_2.tStart = t
            fixation_2.frameNStart = frameN  # exact frame index
            fixation_2.setAutoDraw(True)
        
        # *rectangle_left_2* updates
        if t >= 0.0 and rectangle_left_2.status == NOT_STARTED:
            # keep track of start time/frame for later
            rectangle_left_2.tStart = t
            rectangle_left_2.frameNStart = frameN  # exact frame index
            rectangle_left_2.setAutoDraw(True)
        
        # *rectangle_right_2* updates
        if t >= 0.0 and rectangle_right_2.status == NOT_STARTED:
            # keep track of start time/frame for later
            rectangle_right_2.tStart = t
            rectangle_right_2.frameNStart = frameN  # exact frame index
            rectangle_right_2.setAutoDraw(True)
        
        # *CueExo* updates
        if t >= 1 and CueExo.status == NOT_STARTED:
            # keep track of start time/frame for later
            CueExo.tStart = t
            CueExo.frameNStart = frameN  # exact frame index
            CueExo.setAutoDraw(True)
        frameRemains = 1 + 0.045- win.monitorFramePeriod * 0.75  # most of one frame period left
        if CueExo.status == STARTED and t >= frameRemains:
            CueExo.setAutoDraw(False)
        
        # *TargetX_2* updates
        if frameN >= 65 and TargetX_2.status == NOT_STARTED:
            # keep track of start time/frame for later
            TargetX_2.tStart = t
            TargetX_2.frameNStart = frameN  # exact frame index
            TargetX_2.setAutoDraw(True)
        
        # *TargetY_2* updates
        if frameN >= level and TargetY_2.status == NOT_STARTED:
            # keep track of start time/frame for later
            TargetY_2.tStart = t
            TargetY_2.frameNStart = frameN  # exact frame index
            TargetY_2.setAutoDraw(True)
        
        # *keyPress_2* updates
        if t >= 1.09 and keyPress_2.status == NOT_STARTED:
            # keep track of start time/frame for later
            keyPress_2.tStart = t
            keyPress_2.frameNStart = frameN  # exact frame index
            keyPress_2.status = STARTED
            # keyboard checking is just starting
            win.callOnFlip(keyPress_2.clock.reset)  # t=0 on next screen flip
        if keyPress_2.status == STARTED:
            theseKeys = event.getKeys(keyList=['left', 'right'])
            
            # check for quit:
            if "escape" in theseKeys:
                endExpNow = True
            if len(theseKeys) > 0:  # at least one key was pressed
                keyPress_2.keys = theseKeys[-1]  # just the last key pressed
                keyPress_2.rt = keyPress_2.clock.getTime()
                # was this 'correct'?
                if (keyPress_2.keys == str(CorrectAns)) or (keyPress_2.keys == CorrectAns):
                    keyPress_2.corr = 1
                else:
                    keyPress_2.corr = 0
                # a response ends the routine
                continueRoutine = False
        
        
        # check for quit (typically the Esc key)
        if endExpNow or event.getKeys(keyList=["escape"]):
            core.quit()
        
        # check if all components have finished
        if not continueRoutine:  # a component has requested a forced-end of Routine
            break
        continueRoutine = False  # will revert to True if at least one component still running
        for thisComponent in ExogenousComponents:
            if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
                continueRoutine = True
                break  # at least one component has not yet finished
        
        # refresh the screen
        if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
            win.flip()
    
    # -------Ending Routine "Exogenous"-------
    for thisComponent in ExogenousComponents:
        if hasattr(thisComponent, "setAutoDraw"):
            thisComponent.setAutoDraw(False)
    
    
    # check responses
    if keyPress_2.keys in ['', [], None]:  # No response was made
        keyPress_2.keys=None
        # was no response the correct answer?!
        if str(CorrectAns).lower() == 'none':
           keyPress_2.corr = 1;  # correct non-response
        else:
           keyPress_2.corr = 0;  # failed to respond (incorrectly)
    # store data for Stair2 (StairHandler)
    Stair2.addResponse(keyPress_2.corr)
    Stair2.addOtherData('keyPress_2.rt', keyPress_2.rt)
    Stair.addOtherData('keyPress_2.rl', keyPress_2.keys)
    # the Routine "Exogenous" was not non-slip safe, so reset the non-slip timer
    routineTimer.reset()
    thisExp.nextEntry()
    
# staircase completed


# ------Prepare to start Routine "Time_passage"-------
t = 0
Time_passageClock.reset()  # clock
frameN = -1
continueRoutine = True
# update component parameters for each repeat
win.mouseVisible = True
Time_pas_Ans.reset()
# keep track of which components have finished
Time_passageComponents = [Time_pas_text, Time_pas_Ans]
for thisComponent in Time_passageComponents:
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED

# -------Start Routine "Time_passage"-------
while continueRoutine:
    # get current time
    t = Time_passageClock.getTime()
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    
    # *Time_pas_text* updates
    if t >= 0.0 and Time_pas_text.status == NOT_STARTED:
        # keep track of start time/frame for later
        Time_pas_text.tStart = t
        Time_pas_text.frameNStart = frameN  # exact frame index
        Time_pas_text.setAutoDraw(True)
    # *Time_pas_Ans* updates
    if t >= 0.0 and Time_pas_Ans.status == NOT_STARTED:
        # keep track of start time/frame for later
        Time_pas_Ans.tStart = t
        Time_pas_Ans.frameNStart = frameN  # exact frame index
        Time_pas_Ans.setAutoDraw(True)
    continueRoutine &= Time_pas_Ans.noResponse  # a response ends the trial
    
    # check for quit (typically the Esc key)
    if endExpNow or event.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in Time_passageComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "Time_passage"-------
for thisComponent in Time_passageComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)

# store data for thisExp (ExperimentHandler)
thisExp.addData('Time_pas_Ans.response', Time_pas_Ans.getRating())
thisExp.addData('Time_pas_Ans.rt', Time_pas_Ans.getRT())
thisExp.nextEntry()
# the Routine "Time_passage" was not non-slip safe, so reset the non-slip timer
routineTimer.reset()

# ------Prepare to start Routine "finish"-------
t = 0
finishClock.reset()  # clock
frameN = -1
continueRoutine = True
routineTimer.add(10.000000)
# update component parameters for each repeat
win.mouseVisible = False
# keep track of which components have finished
finishComponents = [finishMsg]
for thisComponent in finishComponents:
    if hasattr(thisComponent, 'status'):
        thisComponent.status = NOT_STARTED

# -------Start Routine "finish"-------
while continueRoutine and routineTimer.getTime() > 0:
    # get current time
    t = finishClock.getTime()
    frameN = frameN + 1  # number of completed frames (so 0 is the first frame)
    # update/draw components on each frame
    
    
    # *finishMsg* updates
    if t >= 0.0 and finishMsg.status == NOT_STARTED:
        # keep track of start time/frame for later
        finishMsg.tStart = t
        finishMsg.frameNStart = frameN  # exact frame index
        finishMsg.setAutoDraw(True)
    frameRemains = 0.0 + 10- win.monitorFramePeriod * 0.75  # most of one frame period left
    if finishMsg.status == STARTED and t >= frameRemains:
        finishMsg.setAutoDraw(False)
    
    # check for quit (typically the Esc key)
    if endExpNow or event.getKeys(keyList=["escape"]):
        core.quit()
    
    # check if all components have finished
    if not continueRoutine:  # a component has requested a forced-end of Routine
        break
    continueRoutine = False  # will revert to True if at least one component still running
    for thisComponent in finishComponents:
        if hasattr(thisComponent, "status") and thisComponent.status != FINISHED:
            continueRoutine = True
            break  # at least one component has not yet finished
    
    # refresh the screen
    if continueRoutine:  # don't flip if this routine is over or we'll get a blank screen
        win.flip()

# -------Ending Routine "finish"-------
for thisComponent in finishComponents:
    if hasattr(thisComponent, "setAutoDraw"):
        thisComponent.setAutoDraw(False)











# these shouldn't be strictly necessary (should auto-save)
thisExp.saveAsWideText(filename+'.csv')
thisExp.saveAsPickle(filename)
# make sure everything is closed down
thisExp.abort()  # or data files will save again on exit
win.close()
core.quit()
