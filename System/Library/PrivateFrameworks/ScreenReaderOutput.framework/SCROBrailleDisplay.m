@interface SCROBrailleDisplay
+ (BOOL)brailleDriverClassIsValid:(Class)a3;
+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5;
- (BOOL)_attemptLoad;
- (BOOL)_currentChordShouldExecuteEvenDuringTyping;
- (BOOL)_hasBrailleChord;
- (BOOL)_hasKeyChord;
- (BOOL)_hasPressedBrailleKeys;
- (BOOL)_inputPaused;
- (BOOL)_isMemorizingKeys;
- (BOOL)autoAdvanceEnabled;
- (BOOL)automaticBrailleTranslationEnabled;
- (BOOL)blinkingCursorEnabled;
- (BOOL)delegateWantsDisplayCallback;
- (BOOL)hasEdits;
- (BOOL)inputAllowed;
- (BOOL)isInputContracted;
- (BOOL)isInputEightDot;
- (BOOL)isLoaded;
- (BOOL)isValid;
- (BOOL)wordWrapEnabled;
- (NSAttributedString)editingString;
- (NSData)imageData;
- (NSString)inputTableIdentifier;
- (NSString)outputTableIdentifier;
- (NSTimer)autoAdvanceTimer;
- (SCRO2DBrailleData)planarData;
- (SCROBrailleLine)testingBrailleLine;
- (double)autoAdvanceDuration;
- (double)brailleKeyDebounceTimeout;
- (id)_initWithDriver:(id)a3 driverIdentifier:(id)a4 ioElement:(id)a5 delegate:(id)a6;
- (id)_newBrailleKeyForCurrentBrailleChord;
- (id)_newBrailleKeyForCurrentKeyChord;
- (id)_statusStringWithDictionary:(id)a3;
- (id)aggregatedStatus;
- (id)brailleInputManager;
- (id)canvasDescriptor;
- (id)configuration;
- (id)driverIdentifier;
- (id)driverModelIdentifier;
- (id)eventHandled;
- (id)ioElement;
- (id)keyArrayForBrailleStringWithCurrentModifiers:(id)a3;
- (id)lineDescriptor;
- (id)newBrailleKeyboardKeyForText:(id)a3 modifiers:(unsigned int)a4;
- (id)realStatus;
- (id)virtualStatus;
- (int)inputContractionMode;
- (int)outputContractionMode;
- (int)token;
- (int)virtualStatusAlignment;
- (int64_t)lineOffset;
- (int64_t)mainSize;
- (int64_t)masterStatusCellIndex;
- (int64_t)statusSize;
- (int64_t)tokenForRouterIndex:(int64_t)a3 location:(int64_t *)a4 appToken:(id *)a5;
- (unint64_t)brailleLineGenerationID;
- (unint64_t)numberOfTextLinesInPlanarBraille;
- (unsigned)_blinkingCursorSetting;
- (unsigned)persistentKeyModifiers;
- (void)_aggregatedStatusHandler:(id)a3;
- (void)_autoAdvancePanHandler:(id)a3;
- (void)_beginAutoAdvanceIfEnabled;
- (void)_blinkerEventHandler;
- (void)_blinkingCursorSetting;
- (void)_brailleDisplayStringDidChangeHandler:(id)a3 brailleSelection:(id)a4;
- (void)_bulkStatusAttributesHandler:(id)a3;
- (void)_configurationChangeHandler;
- (void)_configurationChangeNotification:(id)a3;
- (void)_delayedConfigurationChangeNotification;
- (void)_delayedDisplayLoad;
- (void)_delayedSleepNotification:(id)a3;
- (void)_delayedUnloadNotification;
- (void)_inputEventHandler;
- (void)_panHandler:(id)a3;
- (void)_pauseInput;
- (void)_processKeyEvents:(id)a3;
- (void)_replaceRange:(_NSRange)a3 withString:(id)a4 cursor:(unint64_t)a5;
- (void)_runThread;
- (void)_setBatchUpdates:(id)a3;
- (void)_setBrailleFormatter:(id)a3;
- (void)_setBrailleFormatterHandler:(id)a3;
- (void)_setBrailleKeyDebounceTimeoutHandler:(double)a3;
- (void)_setDelegateWantsDisplayCallbackHandler:(id)a3;
- (void)_setPlanarDataHandler:(id)a3;
- (void)_setTactileGraphicsImageDataHandler:(id)a3;
- (void)_simulateKeypressHandler:(id)a3;
- (void)_singleLetterInputHandler:(id)a3;
- (void)_sleepNotification:(id)a3;
- (void)_startEditingText;
- (void)_statusDisplayHandler:(id)a3;
- (void)_stopMemorization;
- (void)_textSearchModeHandler:(id)a3;
- (void)_translateBrailleStringAndPostEvent;
- (void)_translateBrailleToClipboard;
- (void)_unloadHandler;
- (void)_unloadNotification:(id)a3;
- (void)_unpauseInput;
- (void)_unpauseInputAndProcessKeyEvents;
- (void)_updateDisplay;
- (void)beginUpdates;
- (void)brailleDisplayDeletedCharacter:(id)a3;
- (void)brailleDisplayInsertedCharacter:(id)a3 modifiers:(id)a4;
- (void)brailleDriverDidReceiveInput;
- (void)dealloc;
- (void)didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4;
- (void)didInsertScriptString:(id)a3;
- (void)endUpdates;
- (void)handleCommandDeleteKeyEvent:(id)a3 forDispatcher:(id)a4;
- (void)handleCommandEscapeKeyEvent:(id)a3 forDispatcher:(id)a4;
- (void)handleCommandForwardDeleteKeyEvent:(id)a3 forDispatcher:(id)a4;
- (void)handleCommandMoveLeftForDispatcher:(id)a3;
- (void)handleCommandMoveRightForDispatcher:(id)a3;
- (void)handleCommandPanLeftForDispatcher:(id)a3;
- (void)handleCommandPanRightForDispatcher:(id)a3;
- (void)handleCommandReturnBrailleEvent:(id)a3 forDispatcher:(id)a4;
- (void)handleCommandRouterKeyEvent:(id)a3 forDispatcher:(id)a4;
- (void)handleCommandToggleContractedBrailleEvent:(id)a3 forDispatcher:(id)a4;
- (void)handleCommandToggleEightDotBrailleEvent:(id)a3 forDispatcher:(id)a4;
- (void)handleCommandTranslateForDispatcher:(id)a3;
- (void)handleCommandWordDescriptionEvent:(id)a3 forDispatcher:(id)a4;
- (void)handleEvent:(id)a3;
- (void)handlePlanarPanFailedIsLeft:(BOOL)a3;
- (void)handleUnsupportedKeyEvent:(id)a3 forDispatcher:(id)a4;
- (void)insertTypingString:(id)a3;
- (void)invalidate;
- (void)panBeginning;
- (void)panEnd;
- (void)panLeft;
- (void)panRight;
- (void)planarPanLeft;
- (void)planarPanRight;
- (void)replaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(unint64_t)a5;
- (void)requestFlushLine;
- (void)scriptSelectionDidChange:(_NSRange)a3;
- (void)setAggregatedStatus:(id)a3;
- (void)setAutoAdvanceDuration:(double)a3;
- (void)setAutoAdvanceEnabled:(BOOL)a3;
- (void)setAutoAdvanceTimer:(id)a3;
- (void)setAutomaticBrailleTranslationEnabled:(BOOL)a3;
- (void)setBlinkingCursorEnabled:(BOOL)a3;
- (void)setBrailleFormatter:(id)a3;
- (void)setBrailleKeyDebounceTimeout:(double)a3;
- (void)setDelegateWantsDisplayCallback:(BOOL)a3;
- (void)setEventHandled:(id)a3;
- (void)setImageData:(id)a3;
- (void)setInputAllowed:(BOOL)a3;
- (void)setInputContractionMode:(int)a3;
- (void)setInputShowEightDot:(BOOL)a3;
- (void)setMasterStatusCellIndex:(int64_t)a3;
- (void)setOutputContractionMode:(int)a3;
- (void)setOutputShowEightDot:(BOOL)a3;
- (void)setPersistentKeyModifiers:(unsigned int)a3;
- (void)setPlanarData:(id)a3;
- (void)setPrepareToMemorizeNextKey:(BOOL)a3 immediate:(BOOL)a4;
- (void)setSingleLetterInputIsOn:(BOOL)a3;
- (void)setStatusAttributesWithMasterCellIndex:(int64_t)a3 virtualAlignment:(int)a4;
- (void)setTextSearchModeOn:(BOOL)a3;
- (void)setVirtualStatusAlignment:(int)a3;
- (void)setWordWrapEnabled:(BOOL)a3;
- (void)simulateKeypress:(id)a3;
- (void)translateBrailleToClipboard;
- (void)unpauseInputOnBrailleFormatterChange;
- (void)updateBlinkingCursorTimer:(BOOL)a3;
@end

@implementation SCROBrailleDisplay

+ (BOOL)brailleDriverClassIsValid:(Class)a3
{
  return [(objc_class *)a3 conformsToProtocol:&unk_26CCF9E60]
      && -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_interfaceVersion)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_loadDriverWithIOElement_)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_unloadDriver)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_isDriverLoaded)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_isSleeping)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_modelIdentifier)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_supportsBlinkingCursor)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:", sel_isInputEnabled)&& -[objc_class instancesRespondToSelector:](a3, "instancesRespondToSelector:",
                         sel_postsKeyboardEvents)
      && [(objc_class *)a3 instancesRespondToSelector:sel_brailleInputMode]&& [(objc_class *)a3 instancesRespondToSelector:sel_getInputEvents]&& [(objc_class *)a3 instancesRespondToSelector:sel_mainSize]&& [(objc_class *)a3 instancesRespondToSelector:sel_statusSize]&& [(objc_class *)a3 instancesRespondToSelector:sel_setMainCells_length_]&& ([(objc_class *)a3 instancesRespondToSelector:sel_setStatusCells_length_] & 1) != 0;
}

+ (id)displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v10 = 0;
  if (v7 && v8)
  {
    v11 = [MEMORY[0x263F086E0] brailleDriverBundleWithIdentifier:v8];
    v12 = v11;
    if (v11)
    {
      v13 = (objc_class *)[v11 principalClass];
      if (+[SCROBrailleDisplay brailleDriverClassIsValid:v13])
      {
        id v14 = objc_alloc_init(v13);
        v15 = v14;
        if (v14)
        {
          if ([v14 interfaceVersion] == 4)
          {
            v16 = (void *)[objc_alloc((Class)objc_opt_class()) _initWithDriver:v15 driverIdentifier:v8 ioElement:v7 delegate:v9];
            v10 = v16;
            if (v16) {
              [v16 _delayedDisplayLoad];
            }
            goto LABEL_15;
          }
          NSLog(&cfstr_ErrorInvalidPr.isa, v8);
        }
        else
        {
          NSLog(&cfstr_ErrorUnableToI.isa, v8);
        }
        v10 = 0;
LABEL_15:

        goto LABEL_16;
      }
      NSLog(&cfstr_ErrorInvalidPr.isa, v8);
    }
    else
    {
      NSLog(&cfstr_ErrorCouldNotF.isa, v8);
    }
    v10 = 0;
LABEL_16:
  }

  return v10;
}

- (id)_initWithDriver:(id)a3 driverIdentifier:(id)a4 ioElement:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v38.receiver = self;
  v38.super_class = (Class)SCROBrailleDisplay;
  v15 = [(SCROBrailleDisplay *)&v38 init];
  v16 = v15;
  if (!v15) {
    goto LABEL_5;
  }
  v17 = 0;
  if (v11 && v12)
  {
    v15->_isValid = 1;
    uint64_t v18 = +[SCROBrailleDisplayInput sharedInstance];
    input = v16->_input;
    v16->_input = (SCROBrailleDisplayInput *)v18;

    [(SCROBrailleDisplayInput *)v16->_input setQuietSince:-3061152000.0];
    [(SCROBrailleDisplayInput *)v16->_input setBusySince:-3061152000.0];
    [(SCROBrailleDisplayInput *)v16->_input setNextWillMemorizeNotificationTime:-3061152000.0];
    [(SCROBrailleDisplayInput *)v16->_input setMemorizeNextKeyImmediatelyTimeout:-3061152000.0];
    v20 = (const CFSetCallBacks *)MEMORY[0x263EFFFA0];
    [(SCROBrailleDisplayInput *)v16->_input setDownKeys:CFSetCreateMutable(0, 0, MEMORY[0x263EFFFA0])];
    [(SCROBrailleDisplayInput *)v16->_input setIsQuiet:1];
    [(SCROBrailleDisplayInput *)v16->_input setDownBrailleDots:CFSetCreateMutable(0, 0, v20)];
    [(SCROBrailleDisplayInput *)v16->_input setLastBrailleChordPosted:-3061152000.0];
    [(SCROBrailleDisplayInput *)v16->_input setBrailleCharExponentialMovingAverage:1.0];
    [(SCROBrailleDisplayInput *)v16->_input setBrailleTranslationTimeout:1.0];
    v16->_brailleKeyDebounceTimeout = 0.5;
    v21 = objc_alloc_init(SCROBrailleDisplayStatus);
    status = v16->_status;
    v16->_status = v21;

    [(SCROBrailleDisplayStatus *)v16->_status setVirtualAlignment:0];
    inputTableIdentifier = v16->_inputTableIdentifier;
    v16->_inputTableIdentifier = (NSString *)&stru_26CCE0B50;

    outputTableIdentifier = v16->_outputTableIdentifier;
    v16->_outputTableIdentifier = (NSString *)&stru_26CCE0B50;

    v16->_automaticBrailleTranslationEnabled = 1;
    v25 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    contentLock = v16->_contentLock;
    v16->_contentLock = v25;

    v37.version = 0;
    memset(&v37.retain, 0, 24);
    v37.info = v16;
    CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
    v16->_inputEventTimer = CFRunLoopTimerCreate(0, Current, 0.1, 0, 0, (CFRunLoopTimerCallBack)_inputEventHandler, &v37);
    objc_storeStrong((id *)&v16->_brailleDriver, a3);
    objc_storeStrong((id *)&v16->_driverIdentifier, a4);
    objc_storeStrong((id *)&v16->_ioElement, a5);
    id v28 = objc_storeWeak((id *)&v16->_delegate, v14);
    uint64_t v29 = objc_msgSend(v14, "newBrailleDisplayCommandDispatcher", *(_OWORD *)&v37.version, *(_OWORD *)&v37.retain, v37.copyDescription);
    commandDispatcher = v16->_commandDispatcher;
    v16->_commandDispatcher = (SCROBrailleDisplayCommandDispatcherProtocol *)v29;

    [(SCROBrailleDisplayCommandDispatcherProtocol *)v16->_commandDispatcher setDelegate:v16];
    v16->_delegateWantsDisplayCallback = 1;
    v16->_inputAllowed = 1;
    v31 = [[SCROBrailleEventDispatcher alloc] initWithTarget:v16];
    eventDispatcher = v16->_eventDispatcher;
    v16->_eventDispatcher = v31;

    v16->_latinEscapeEnabled = 0;
    v33 = [MEMORY[0x263F08A00] defaultCenter];
    [v33 addObserver:v16 selector:sel__unloadNotification_ name:@"SCROBrailleDriverProtocolUnloadNotification" object:v16->_brailleDriver];

    v34 = [MEMORY[0x263F08A00] defaultCenter];
    [v34 addObserver:v16 selector:sel__configurationChangeNotification_ name:@"SCROBrailleDriverProtocolConfigurationChangeNotification" object:v16->_brailleDriver];

    v35 = [MEMORY[0x263F08A00] defaultCenter];
    [v35 addObserver:v16 selector:sel__sleepNotification_ name:@"SCROBrailleDriverProtocolSleepNotification" object:v16->_brailleDriver];

LABEL_5:
    v17 = v16;
  }

  return v17;
}

- (void)_delayedDisplayLoad
{
}

- (BOOL)_attemptLoad
{
  return [(SCROBrailleDriverProtocol *)self->_brailleDriver loadDriverWithIOElement:self->_ioElement] == 0;
}

- (void)_runThread
{
  uint64_t v29 = *MEMORY[0x263EF8340];
  v3 = (void *)MEMORY[0x21D4AD500](self, a2);
  uint64_t v4 = [(NSLock *)self->_contentLock lock];
  if (self->_isValid && self->_brailleDriver)
  {
    v5 = (void *)MEMORY[0x21D4AD500](v4);
    BOOL v6 = [(SCROBrailleDisplay *)self _attemptLoad];
    id v7 = _SCROD_LOG();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      brailleDriver = self->_brailleDriver;
      ioElement = self->_ioElement;
      int v23 = 138543874;
      v24 = brailleDriver;
      __int16 v25 = 2114;
      v26 = ioElement;
      __int16 v27 = 1024;
      BOOL v28 = v6;
      _os_log_impl(&dword_21C66E000, v7, OS_LOG_TYPE_DEFAULT, "Load driver %{public}@ with element: %{public}@ : result: %d", (uint8_t *)&v23, 0x1Cu);
    }

    if (v6)
    {
      int v10 = 1;
      id v11 = [(SCROBrailleDriverProtocol *)self->_brailleDriver modelIdentifier];
      driverModelIdentifier = self->_driverModelIdentifier;
      self->_driverModelIdentifier = v11;

      uint64_t v13 = [(SCROBrailleDriverProtocol *)self->_brailleDriver mainSize];
      self->_mainSize = v13 & ~(v13 >> 63);
      uint64_t v14 = [(SCROBrailleDriverProtocol *)self->_brailleDriver statusSize];
      self->_statusSize = v14 & ~(v14 >> 63);
      self->_postsKeyboardEvents = [(SCROBrailleDriverProtocol *)self->_brailleDriver postsKeyboardEvents];
      self->_brailleInputMode = [(SCROBrailleDriverProtocol *)self->_brailleDriver brailleInputMode];
      v15 = [[SCROBrailleLine alloc] initWithDriver:self->_brailleDriver mainSize:self->_mainSize statusSize:self->_statusSize];
      brailleLine = self->_brailleLine;
      self->_brailleLine = v15;

      [(SCROBrailleLine *)self->_brailleLine setTranslationDelegate:self];
      self->_runLoop = CFRunLoopGetCurrent();
      [(SCROBrailleDisplay *)self updateBlinkingCursorTimer:[(SCROBrailleDisplay *)self _blinkingCursorSetting] != 0];
      int v17 = [(SCROBrailleDriverProtocol *)self->_brailleDriver isInputEnabled];
      self->_inputEnabled = v17;
      if (v17) {
        CFRunLoopAddTimer(self->_runLoop, self->_inputEventTimer, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      }
      runLoop = self->_runLoop;
      [(SCROBrailleEventDispatcher *)self->_eventDispatcher start];
      if (objc_opt_respondsToSelector()) {
        [(SCROBrailleDriverProtocol *)self->_brailleDriver setBrailleDriverDelegate:self];
      }
      BOOL v6 = 1;
    }
    else
    {
      runLoop = 0;
      int v10 = 1;
    }
  }
  else
  {
    int v10 = 0;
    runLoop = 0;
    BOOL v6 = 0;
  }
  [(NSLock *)self->_contentLock unlock];
  if (v10)
  {
    v19 = (void *)MEMORY[0x21D4AD500]();
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v21 = WeakRetained;
    if (v6)
    {
      [WeakRetained brailleDisplay:self driverDidLoad:1];

      do
      {
        v22 = (void *)MEMORY[0x21D4AD500]();
        CFRunLoopRun();
      }
      while (runLoop == self->_runLoop);
    }
    else
    {
      [WeakRetained brailleDisplay:self driverDidLoad:0];
    }
  }
}

- (unsigned)_blinkingCursorSetting
{
  uint64_t v5 = 0;
  BOOL v6 = &v5;
  uint64_t v7 = 0x2020000000;
  v2 = (unsigned int (*)(void))get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr;
  id v8 = get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr;
  if (!get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_ptr)
  {
    v4[0] = MEMORY[0x263EF8330];
    v4[1] = 3221225472;
    v4[2] = __get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_block_invoke;
    v4[3] = &unk_264414650;
    v4[4] = &v5;
    __get_AXSPrefersNonBlinkingCursorIndicatorSymbolLoc_block_invoke((uint64_t)v4);
    v2 = (unsigned int (*)(void))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    -[SCROBrailleDisplay _blinkingCursorSetting]();
  }
  return v2() == 0;
}

- (void)dealloc
{
  [(SCROBrailleDisplay *)self invalidate];
  id v3 = objc_alloc_init(MEMORY[0x263EFF980]);
  uint64_t v4 = self->_contentLock;
  [(NSLock *)v4 lock];
  [v3 addObject:self->_contentLock];
  contentLock = self->_contentLock;
  self->_contentLock = 0;

  if (self->_status)
  {
    objc_msgSend(v3, "addObject:");
    status = self->_status;
    self->_status = 0;
  }
  if (self->_input)
  {
    objc_msgSend(v3, "addObject:");
    input = self->_input;
    self->_input = 0;
  }
  if (self->_driverIdentifier)
  {
    objc_msgSend(v3, "addObject:");
    driverIdentifier = self->_driverIdentifier;
    self->_driverIdentifier = 0;
  }
  if (self->_driverModelIdentifier)
  {
    objc_msgSend(v3, "addObject:");
    driverModelIdentifier = self->_driverModelIdentifier;
    self->_driverModelIdentifier = 0;
  }
  if (self->_ioElement)
  {
    objc_msgSend(v3, "addObject:");
    ioElement = self->_ioElement;
    self->_ioElement = 0;
  }
  [(NSLock *)v4 unlock];

  v11.receiver = self;
  v11.super_class = (Class)SCROBrailleDisplay;
  [(SCROBrailleDisplay *)&v11 dealloc];
}

- (void)invalidate
{
  id v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  [(SCROBrailleEventDispatcher *)self->_eventDispatcher invalidate];
  [(NSLock *)self->_contentLock lock];
  self->_isValid = 0;
  inputEventTimer = self->_inputEventTimer;
  if (inputEventTimer)
  {
    CFRunLoopTimerInvalidate(inputEventTimer);
    CFRelease(self->_inputEventTimer);
    self->_inputEventTimer = 0;
  }
  blinkerEventTimer = self->_blinkerEventTimer;
  if (blinkerEventTimer)
  {
    CFRunLoopTimerInvalidate(blinkerEventTimer);
    CFRelease(self->_blinkerEventTimer);
    self->_blinkerEventTimer = 0;
  }
  runLoop = self->_runLoop;
  if (runLoop)
  {
    self->_runLoop = 0;
    CFRunLoopStop(runLoop);
  }
  [(SCROBrailleDriverProtocol *)self->_brailleDriver unloadDriver];
  brailleLine = self->_brailleLine;
  self->_brailleLine = 0;

  brailleDriver = self->_brailleDriver;
  self->_brailleDriver = 0;

  commandDispatcher = self->_commandDispatcher;
  self->_commandDispatcher = 0;

  [(NSLock *)self->_contentLock unlock];
}

- (BOOL)isValid
{
  [(NSLock *)self->_contentLock lock];
  BOOL isValid = self->_isValid;
  [(NSLock *)self->_contentLock unlock];
  return isValid;
}

- (BOOL)isLoaded
{
  [(NSLock *)self->_contentLock lock];
  char v3 = [(SCROBrailleDriverProtocol *)self->_brailleDriver isDriverLoaded];
  [(NSLock *)self->_contentLock unlock];
  return v3;
}

- (id)driverIdentifier
{
  [(NSLock *)self->_contentLock lock];
  driverIdentifier = self->_driverIdentifier;
  if (driverIdentifier) {
    uint64_t v4 = (void *)[(NSString *)driverIdentifier copy];
  }
  else {
    uint64_t v4 = 0;
  }
  [(NSLock *)self->_contentLock unlock];

  return v4;
}

- (id)driverModelIdentifier
{
  [(NSLock *)self->_contentLock lock];
  driverModelIdentifier = self->_driverModelIdentifier;
  if (driverModelIdentifier) {
    uint64_t v4 = (void *)[(NSString *)driverModelIdentifier copy];
  }
  else {
    uint64_t v4 = 0;
  }
  [(NSLock *)self->_contentLock unlock];

  return v4;
}

- (id)lineDescriptor
{
  [(NSLock *)self->_contentLock lock];
  id v3 = [(SCROBrailleLine *)self->_brailleLine newLineDescriptor];
  [(NSLock *)self->_contentLock unlock];

  return v3;
}

- (id)ioElement
{
  return self->_ioElement;
}

- (int)token
{
  return [(SCROIOElementProtocol *)self->_ioElement identifier];
}

- (int64_t)mainSize
{
  [(NSLock *)self->_contentLock lock];
  int64_t mainSize = self->_mainSize;
  [(NSLock *)self->_contentLock unlock];
  return mainSize;
}

- (int64_t)statusSize
{
  [(NSLock *)self->_contentLock lock];
  int64_t statusSize = self->_statusSize;
  [(NSLock *)self->_contentLock unlock];
  return statusSize;
}

- (void)setInputAllowed:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSLock *)self->_contentLock lock];
  if (self->_inputAllowed != v3) {
    self->_inputAllowed = v3;
  }
  contentLock = self->_contentLock;

  [(NSLock *)contentLock unlock];
}

- (void)setWordWrapEnabled:(BOOL)a3
{
  self->_wordWrapEnabled = a3;
  -[SCROBrailleLine setWordWrapEnabled:](self->_brailleLine, "setWordWrapEnabled:");
}

- (BOOL)wordWrapEnabled
{
  return self->_wordWrapEnabled;
}

- (void)setAutoAdvanceEnabled:(BOOL)a3
{
  uint64_t v5 = @"NO";
  if (a3) {
    uint64_t v5 = @"YES";
  }
  NSLog(&cfstr_AutoadvanceSet.isa, a2, v5);
  self->_autoAdvanceEnabled = a3;

  [(SCROBrailleDisplay *)self _beginAutoAdvanceIfEnabled];
}

- (void)setAutoAdvanceDuration:(double)a3
{
  double autoAdvanceDuration = self->_autoAdvanceDuration;
  self->_double autoAdvanceDuration = a3;
  if (autoAdvanceDuration != a3)
  {
    NSLog(&cfstr_AutoadvanceSet_0.isa, a2, *(void *)&a3);
    [(SCROBrailleDisplay *)self _beginAutoAdvanceIfEnabled];
  }
}

- (BOOL)autoAdvanceEnabled
{
  return self->_autoAdvanceEnabled;
}

- (void)setBlinkingCursorEnabled:(BOOL)a3
{
  if (self->_blinkingCursorEnabled != a3)
  {
    self->_blinkingCursorEnabled = a3;
    -[SCROBrailleLine setBlinkEnabled:](self->_brailleLine, "setBlinkEnabled:");
    v5[0] = MEMORY[0x263EF8330];
    v5[1] = 3221225472;
    v5[2] = __47__SCROBrailleDisplay_setBlinkingCursorEnabled___block_invoke;
    v5[3] = &unk_2644145D8;
    v5[4] = self;
    BOOL v6 = a3;
    dispatch_async(MEMORY[0x263EF83A0], v5);
  }
}

uint64_t __47__SCROBrailleDisplay_setBlinkingCursorEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateBlinkingCursorTimer:*(unsigned __int8 *)(a1 + 40)];
}

- (void)updateBlinkingCursorTimer:(BOOL)a3
{
  if (self->_runLoop)
  {
    if (a3
      && [(SCROBrailleDriverProtocol *)self->_brailleDriver supportsBlinkingCursor])
    {
      if (!self->_blinkerEventTimer)
      {
        v7.version = 0;
        memset(&v7.retain, 0, 24);
        v7.info = self;
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        uint64_t v5 = CFRunLoopTimerCreate(0, Current, 0.5, 0, 0, (CFRunLoopTimerCallBack)_blinkerEventHandler, &v7);
        self->_blinkerEventTimer = v5;
        CFRunLoopAddTimer(self->_runLoop, v5, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
      }
    }
    else
    {
      blinkerEventTimer = self->_blinkerEventTimer;
      if (blinkerEventTimer)
      {
        CFRunLoopTimerInvalidate(blinkerEventTimer);
        CFRelease(self->_blinkerEventTimer);
        self->_blinkerEventTimer = 0;
      }
    }
  }
}

- (void)setImageData:(id)a3
{
  eventDispatcher = self->_eventDispatcher;
  id v4 = +[SCROBrailleEvent eventWithType:43 data:a3 data2:0 data3:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (NSData)imageData
{
  return [(SCROBrailleLine *)self->_brailleLine imageData];
}

- (void)setPlanarData:(id)a3
{
  objc_storeStrong((id *)&self->_planarData, a3);
  id v5 = a3;
  eventDispatcher = self->_eventDispatcher;
  id v7 = +[SCROBrailleEvent eventWithType:44 data:v5 data2:0 data3:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v7];
}

- (void)_beginAutoAdvanceIfEnabled
{
  objc_initWeak(&location, self);
  double autoAdvanceDuration = self->_autoAdvanceDuration;
  BOOL autoAdvanceEnabled = self->_autoAdvanceEnabled;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __48__SCROBrailleDisplay__beginAutoAdvanceIfEnabled__block_invoke;
  v5[3] = &unk_264414628;
  objc_copyWeak(v6, &location);
  BOOL v7 = autoAdvanceEnabled;
  v6[1] = *(id *)&autoAdvanceDuration;
  dispatch_async(MEMORY[0x263EF83A0], v5);
  objc_destroyWeak(v6);
  objc_destroyWeak(&location);
}

void __48__SCROBrailleDisplay__beginAutoAdvanceIfEnabled__block_invoke(uint64_t a1)
{
  v2 = (id *)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v4 = [WeakRetained autoAdvanceTimer];
  [v4 invalidate];

  if (*(unsigned char *)(a1 + 48) && (double v5 = *(double *)(a1 + 40), v5 > 0.0))
  {
    BOOL v6 = (void *)MEMORY[0x263EFFA20];
    v10[0] = MEMORY[0x263EF8330];
    v10[1] = 3221225472;
    v10[2] = __48__SCROBrailleDisplay__beginAutoAdvanceIfEnabled__block_invoke_2;
    v10[3] = &unk_264414600;
    objc_copyWeak(&v11, v2);
    BOOL v7 = [v6 scheduledTimerWithTimeInterval:1 repeats:v10 block:v5];
    id v8 = objc_loadWeakRetained(v2);
    [v8 setAutoAdvanceTimer:v7];

    objc_destroyWeak(&v11);
  }
  else
  {
    id v9 = objc_loadWeakRetained(v2);
    [v9 setAutoAdvanceTimer:0];
  }
}

void __48__SCROBrailleDisplay__beginAutoAdvanceIfEnabled__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = (void *)WeakRetained[16];
    id v4 = WeakRetained;
    BOOL v3 = +[SCROBrailleEvent eventWithType:18 data:MEMORY[0x263EFFA88]];
    [v2 enqueueEvent:v3];

    id WeakRetained = v4;
  }
}

- (id)configuration
{
  [(NSLock *)self->_contentLock lock];
  driverIdentifier = self->_driverIdentifier;
  if (driverIdentifier) {
    id v4 = (void *)[(NSString *)driverIdentifier copy];
  }
  else {
    id v4 = 0;
  }
  driverModelIdentifier = self->_driverModelIdentifier;
  if (driverModelIdentifier) {
    BOOL v6 = (void *)[(NSString *)driverModelIdentifier copy];
  }
  else {
    BOOL v6 = 0;
  }
  int64_t mainSize = self->_mainSize;
  int64_t statusSize = self->_statusSize;
  uint64_t brailleInputMode = self->_brailleInputMode;
  int v10 = self->_ioElement;
  [(NSLock *)self->_contentLock unlock];
  id v11 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:8];
  id v12 = v11;
  if (v4) {
    [v11 setObject:v4 forKey:kSCROBrailleDisplayDriverIdentifier[0]];
  }
  if (v6)
  {
    [v12 setObject:v6 forKey:kSCROBrailleDisplayModelIdentifier[0]];
    uint64_t v13 = [NSNumber numberWithInteger:mainSize];
    [v12 setObject:v13 forKey:kSCROBrailleDisplayMainSize[0]];

    uint64_t v14 = [NSNumber numberWithInteger:statusSize];
    [v12 setObject:v14 forKey:kSCROBrailleDisplayStatusSize[0]];
  }
  if (!v10)
  {
    [v12 setObject:&unk_26CCF0F88 forKey:kSCROBrailleDisplayTransport[0]];
    goto LABEL_23;
  }
  v15 = objc_msgSend(NSNumber, "numberWithInteger:", (int)-[SCROIOElementProtocol identifier](v10, "identifier"));
  [v12 setObject:v15 forKey:kSCROBrailleDisplayToken[0]];

  unsigned int v16 = [(SCROIOElementProtocol *)v10 transport];
  int v17 = [NSNumber numberWithUnsignedInteger:v16];
  [v12 setObject:v17 forKey:kSCROBrailleDisplayTransport[0]];

  if (v16 == 1)
  {
    if (![(SCROIOElementProtocol *)v10 conformsToProtocol:&unk_26CCFAF60]) {
      goto LABEL_23;
    }
    v21 = NSString;
    v22 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SCROIOElementProtocol vendorId](v10, "vendorId"));
    int v23 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SCROIOElementProtocol productId](v10, "productId"));
    v24 = [v21 stringWithFormat:@"%@,%@", v22, v23];
    [v12 setObject:v24 forKeyedSubscript:kSCROBrailleDisplayBrailleVendorProductId[0]];

    __int16 v25 = [(SCROIOElementProtocol *)v10 productName];
    [v12 setObject:v25 forKeyedSubscript:kSCROBrailleDisplayBrailleProductName[0]];

    v19 = [(SCROIOElementProtocol *)v10 manufacturerName];
    v20 = kSCROBrailleDisplayBrailleManufacturerName;
    goto LABEL_22;
  }
  if (v16 == 8)
  {
    if (![(SCROIOElementProtocol *)v10 conformsToProtocol:&unk_26CCFAE88]) {
      goto LABEL_23;
    }
    v19 = [(SCROIOElementProtocol *)v10 bluetoothAddress];
    v20 = kSCROBrailleDisplayBluetoothAddress;
    goto LABEL_22;
  }
  if (v16 == 32
    && [(SCROIOElementProtocol *)v10 conformsToProtocol:&unk_26CCFAD38])
  {
    uint64_t v18 = [(SCROIOElementProtocol *)v10 address];
    [v12 setObject:v18 forKeyedSubscript:kSCROBrailleDisplayBluetoothAddress[0]];

    v19 = [(SCROIOElementProtocol *)v10 name];
    v20 = kSCROBrailleDisplayBrailleProductName;
LABEL_22:
    [v12 setObject:v19 forKeyedSubscript:*v20];
  }
LABEL_23:
  v26 = [NSNumber numberWithBool:self->_postsKeyboardEvents];
  [v12 setObject:v26 forKey:kSCROBrailleDisplayPostsKeyboardEvents[0]];

  __int16 v27 = [NSNumber numberWithInteger:brailleInputMode];
  [v12 setObject:v27 forKey:kSCROBrailleDisplayBrailleInputMode[0]];

  return v12;
}

- (id)canvasDescriptor
{
  if (objc_opt_respondsToSelector())
  {
    BOOL v3 = [(SCROBrailleDriverProtocol *)self->_brailleDriver canvas];
    id v4 = [v3 descriptor];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)requestFlushLine
{
  eventDispatcher = self->_eventDispatcher;
  id v3 = +[SCROBrailleEvent eventWithType:38 data:*MEMORY[0x263EFFB40]];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v3];
}

- (void)beginUpdates
{
  eventDispatcher = self->_eventDispatcher;
  id v3 = +[SCROBrailleEvent eventWithType:34 data:*MEMORY[0x263EFFB40]];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v3];
}

- (void)endUpdates
{
  eventDispatcher = self->_eventDispatcher;
  id v3 = +[SCROBrailleEvent eventWithType:34 data:*MEMORY[0x263EFFB38]];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v3];
}

- (void)setBrailleFormatter:(id)a3
{
  eventDispatcher = self->_eventDispatcher;
  id v4 = +[SCROBrailleEvent eventWithType:28 data:a3 data2:0 data3:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (id)realStatus
{
  [(NSLock *)self->_contentLock lock];
  id v3 = [(SCROBrailleDisplayStatus *)self->_status realData];

  if (v3)
  {
    id v4 = [(SCROBrailleDisplayStatus *)self->_status realData];
    id v3 = (void *)[v4 copy];
  }
  [(NSLock *)self->_contentLock unlock];

  return v3;
}

- (id)virtualStatus
{
  [(NSLock *)self->_contentLock lock];
  id v3 = [(SCROBrailleDisplayStatus *)self->_status virtualData];

  if (v3)
  {
    id v4 = [(SCROBrailleDisplayStatus *)self->_status virtualData];
    id v3 = (void *)[v4 copy];
  }
  [(NSLock *)self->_contentLock unlock];

  return v3;
}

- (void)setAggregatedStatus:(id)a3
{
  eventDispatcher = self->_eventDispatcher;
  id v4 = +[SCROBrailleEvent eventWithType:3 data:a3];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (id)aggregatedStatus
{
  [(NSLock *)self->_contentLock lock];
  id v3 = [(SCROBrailleDisplayStatus *)self->_status aggregatedData];

  if (v3)
  {
    id v4 = [(SCROBrailleDisplayStatus *)self->_status aggregatedData];
    id v3 = (void *)[v4 copy];
  }
  [(NSLock *)self->_contentLock unlock];

  return v3;
}

- (void)setVirtualStatusAlignment:(int)a3
{
  eventDispatcher = self->_eventDispatcher;
  id v5 = [NSNumber numberWithInt:*(void *)&a3];
  id v4 = +[SCROBrailleEvent eventWithType:4 data:v5];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (int)virtualStatusAlignment
{
  [(NSLock *)self->_contentLock lock];
  int v3 = [(SCROBrailleDisplayStatus *)self->_status virtualAlignment];
  [(NSLock *)self->_contentLock unlock];
  return v3;
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  eventDispatcher = self->_eventDispatcher;
  id v5 = [NSNumber numberWithInteger:a3];
  id v4 = +[SCROBrailleEvent eventWithType:5 data:v5];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (int64_t)masterStatusCellIndex
{
  [(NSLock *)self->_contentLock lock];
  int64_t v3 = [(SCROBrailleDisplayStatus *)self->_status masterStatusCellIndex];
  [(NSLock *)self->_contentLock unlock];
  return v3;
}

- (BOOL)delegateWantsDisplayCallback
{
  return self->_delegateWantsDisplayCallback;
}

- (void)setDelegateWantsDisplayCallback:(BOOL)a3
{
  eventDispatcher = self->_eventDispatcher;
  id v5 = [NSNumber numberWithBool:a3];
  id v4 = +[SCROBrailleEvent eventWithType:32 data:v5];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (void)setStatusAttributesWithMasterCellIndex:(int64_t)a3 virtualAlignment:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  eventDispatcher = self->_eventDispatcher;
  id v8 = [NSNumber numberWithInteger:a3];
  BOOL v6 = [NSNumber numberWithInt:v4];
  BOOL v7 = +[SCROBrailleEvent eventWithType:27 data:v8 data2:v6 data3:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v7];
}

- (void)simulateKeypress:(id)a3
{
  eventDispatcher = self->_eventDispatcher;
  id v4 = +[SCROBrailleEvent eventWithType:16 data:a3];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (void)panLeft
{
  [(SCROBrailleDisplay *)self _beginAutoAdvanceIfEnabled];
  eventDispatcher = self->_eventDispatcher;
  id v4 = +[SCROBrailleEvent eventWithType:17 data:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (void)panRight
{
  [(SCROBrailleDisplay *)self _beginAutoAdvanceIfEnabled];
  eventDispatcher = self->_eventDispatcher;
  id v4 = +[SCROBrailleEvent eventWithType:18 data:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (void)panBeginning
{
  eventDispatcher = self->_eventDispatcher;
  id v3 = +[SCROBrailleEvent eventWithType:19 data:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v3];
}

- (void)panEnd
{
  eventDispatcher = self->_eventDispatcher;
  id v3 = +[SCROBrailleEvent eventWithType:20 data:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v3];
}

- (void)planarPanLeft
{
  eventDispatcher = self->_eventDispatcher;
  id v3 = +[SCROBrailleEvent eventWithType:46 data:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v3];
}

- (void)planarPanRight
{
  eventDispatcher = self->_eventDispatcher;
  id v3 = +[SCROBrailleEvent eventWithType:47 data:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v3];
}

- (void)setPrepareToMemorizeNextKey:(BOOL)a3 immediate:(BOOL)a4
{
  BOOL v4 = a4;
  eventDispatcher = self->_eventDispatcher;
  id v8 = [NSNumber numberWithBool:a3];
  BOOL v6 = [NSNumber numberWithBool:v4];
  BOOL v7 = +[SCROBrailleEvent eventWithType:23 data:v8 data2:v6 data3:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v7];
}

- (void)setSingleLetterInputIsOn:(BOOL)a3
{
  eventDispatcher = self->_eventDispatcher;
  id v5 = [NSNumber numberWithBool:a3];
  BOOL v4 = +[SCROBrailleEvent eventWithType:37 data:v5];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (void)setTextSearchModeOn:(BOOL)a3
{
  eventDispatcher = self->_eventDispatcher;
  id v5 = [NSNumber numberWithBool:a3];
  BOOL v4 = +[SCROBrailleEvent eventWithType:39 data:v5];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (void)translateBrailleToClipboard
{
  eventDispatcher = self->_eventDispatcher;
  id v3 = +[SCROBrailleEvent eventWithType:40 data:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v3];
}

- (void)setBrailleKeyDebounceTimeout:(double)a3
{
  eventDispatcher = self->_eventDispatcher;
  id v5 = [NSNumber numberWithDouble:a3];
  BOOL v4 = +[SCROBrailleEvent eventWithType:41 data:v5];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (int64_t)tokenForRouterIndex:(int64_t)a3 location:(int64_t *)a4 appToken:(id *)a5
{
  int64_t v10 = a3;
  [(NSLock *)self->_contentLock lock];
  int64_t v8 = [(SCROBrailleLine *)self->_brailleLine tokenForRouterIndex:&v10 location:a4 appToken:a5];
  [(NSLock *)self->_contentLock unlock];
  return v8;
}

- (void)handleEvent:(id)a3
{
  id v14 = a3;
  switch([v14 type])
  {
    case 3u:
      [(SCROBrailleDisplay *)self _aggregatedStatusHandler:v14];
      break;
    case 4u:
    case 5u:
      [(SCROBrailleDisplay *)self _statusDisplayHandler:v14];
      break;
    case 0x10u:
      [(SCROBrailleDisplay *)self _simulateKeypressHandler:v14];
      break;
    case 0x11u:
    case 0x12u:
    case 0x13u:
    case 0x14u:
      BOOL v4 = [v14 data];
      int v5 = [v4 isEqual:MEMORY[0x263EFFA88]];

      if (v5) {
        [(SCROBrailleDisplay *)self _autoAdvancePanHandler:v14];
      }
      else {
        [(SCROBrailleDisplay *)self _panHandler:v14];
      }
      break;
    case 0x17u:
      [(SCROBrailleDisplayInput *)self->_input setPrepareToMemorizeNextKey:0];
      BOOL v6 = [v14 data];
      -[SCROBrailleDisplayInput setRequestPrepareToMemorizeNextKey:](self->_input, "setRequestPrepareToMemorizeNextKey:", [v6 BOOLValue]);

      BOOL v7 = [v14 data2];
      -[SCROBrailleDisplayInput setMemorizeNextKeyImmediately:](self->_input, "setMemorizeNextKeyImmediately:", [v7 BOOLValue]);

      if ([(SCROBrailleDisplayInput *)self->_input memorizeNextKeyImmediately]) {
        [(SCROBrailleDisplayInput *)self->_input setMemorizeNextKeyImmediatelyTimeout:CFAbsoluteTimeGetCurrent() + *(double *)&kSCROBrailleInputMemorizeNowInterval];
      }
      if ([(SCROBrailleDisplay *)self _isMemorizingKeys]) {
        [(SCROBrailleLine *)self->_brailleLine discardEdits];
      }
      break;
    case 0x18u:
      [(SCROBrailleDisplay *)self _unloadHandler];
      break;
    case 0x19u:
      int64_t v8 = [v14 data];
      int v9 = [v8 BOOLValue];

      if (v9) {
        [(SCROBrailleLine *)self->_brailleLine discardEdits];
      }
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v11 = [v14 data];
      objc_msgSend(WeakRetained, "brailleDisplay:isSleeping:", self, objc_msgSend(v11, "BOOLValue"));
      goto LABEL_26;
    case 0x1Au:
      [(SCROBrailleDisplay *)self _configurationChangeHandler];
      break;
    case 0x1Bu:
      [(SCROBrailleDisplay *)self _bulkStatusAttributesHandler:v14];
      break;
    case 0x1Cu:
      [(SCROBrailleDisplay *)self _setBrailleFormatterHandler:v14];
      break;
    case 0x20u:
      [(SCROBrailleDisplay *)self _setDelegateWantsDisplayCallbackHandler:v14];
      break;
    case 0x22u:
      [(SCROBrailleDisplay *)self _setBatchUpdates:v14];
      break;
    case 0x25u:
      [(SCROBrailleDisplay *)self _singleLetterInputHandler:v14];
      break;
    case 0x26u:
      [(SCROBrailleLine *)self->_brailleLine display];
      break;
    case 0x27u:
      [(SCROBrailleDisplay *)self _textSearchModeHandler:v14];
      break;
    case 0x28u:
      [(SCROBrailleDisplay *)self _translateBrailleToClipboard];
      break;
    case 0x29u:
      id WeakRetained = [v14 data];
      [WeakRetained doubleValue];
      [(SCROBrailleDisplay *)self _setBrailleKeyDebounceTimeoutHandler:"_setBrailleKeyDebounceTimeoutHandler:"];
      goto LABEL_32;
    case 0x2Bu:
      [(SCROBrailleDisplay *)self _setTactileGraphicsImageDataHandler:v14];
      break;
    case 0x2Cu:
      [(SCROBrailleDisplay *)self _setPlanarDataHandler:v14];
      break;
    case 0x2Du:
      id WeakRetained = [v14 data];
      id v11 = [v14 data2];
      [(SCROBrailleDisplay *)self _brailleDisplayStringDidChangeHandler:WeakRetained brailleSelection:v11];
LABEL_26:

LABEL_32:
      break;
    case 0x2Eu:
      [(SCROBrailleLine *)self->_brailleLine planarPanLeft];
      break;
    case 0x2Fu:
      [(SCROBrailleLine *)self->_brailleLine planarPanRight];
      break;
    default:
      break;
  }
  id v12 = [(SCROBrailleDisplay *)self eventHandled];

  if (v12)
  {
    uint64_t v13 = [(SCROBrailleDisplay *)self eventHandled];
    ((void (**)(void, id))v13)[2](v13, v14);
  }

  MEMORY[0x270F9A758]();
}

- (void)_unloadHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained brailleDriverDisconnected:self];

  [(SCROBrailleDisplay *)self invalidate];
}

- (id)_statusStringWithDictionary:(id)a3
{
  id v4 = a3;
  int v5 = [MEMORY[0x263F089D8] string];
  BOOL v6 = [v4 objectForKey:kSCROStatusAttributeCellIndex[0]];
  unint64_t v7 = [v6 unsignedIntegerValue];

  int64_t v8 = [v4 objectForKey:kSCROStatusAttributeCellTitle[0]];
  if (!_statusStringWithDictionary__myBundle)
  {
    int v9 = (void *)MEMORY[0x263F086E0];
    int64_t v10 = self;
    uint64_t v11 = [v9 bundleForClass:v10];
    id v12 = (void *)_statusStringWithDictionary__myBundle;
    _statusStringWithDictionary__myBundle = v11;
  }
  unsigned __int8 v27 = 0;
  uint64_t v13 = [(SCROBrailleDisplayStatus *)self->_status aggregatedData];
  unint64_t v14 = [v13 length];

  if (v7 < v14)
  {
    v15 = [(SCROBrailleDisplayStatus *)self->_status aggregatedData];
    objc_msgSend(v15, "getBytes:range:", &v27, v7, 1);
  }
  if ([v8 length])
  {
    [v5 appendString:v8];
    [v5 appendString:@": "];
  }
  v26 = v8;
  unint64_t v16 = 0;
  do
  {
    int v17 = [v4 objectForKey:kSCROStatusAttributeDotText[v16]];
    int v18 = (v27 >> v16) & 1;
    [(SCROBrailleDisplayStatus *)self->_status masterStatusCellIndex];
    switch((int)v16)
    {
      case 0:
        uint64_t v19 = [(id)_statusStringWithDictionary__myBundle localizedStringForKey:@"unreadAnnouncements" value:&stru_26CCE0B50 table:@"Server"];

        BOOL v20 = [(SCROBrailleLine *)self->_brailleLine anyUnread];
        goto LABEL_13;
      case 1:
        uint64_t v19 = [(id)_statusStringWithDictionary__myBundle localizedStringForKey:@"currentAnnouncementUnread" value:&stru_26CCE0B50 table:@"Server"];

        BOOL v20 = [(SCROBrailleLine *)self->_brailleLine currentUnread];
        goto LABEL_13;
      case 6:
        uint64_t v19 = [(id)_statusStringWithDictionary__myBundle localizedStringForKey:@"canPanLeft" value:&stru_26CCE0B50 table:@"Server"];

        BOOL v20 = [(SCROBrailleLine *)self->_brailleLine canPanLeft];
        goto LABEL_13;
      case 7:
        uint64_t v19 = [(id)_statusStringWithDictionary__myBundle localizedStringForKey:@"canPanRight" value:&stru_26CCE0B50 table:@"Server"];

        BOOL v20 = [(SCROBrailleLine *)self->_brailleLine canPanRight];
LABEL_13:
        int v18 = v20;
        int v17 = (void *)v19;
        break;
      default:
        break;
    }
    unint64_t v21 = v16 + 1;
    if (v17)
    {
      objc_msgSend(v5, "appendFormat:", @"%d ", v16 + 1);
      uint64_t v22 = v18 ? 1 : 2;
      int v23 = +[SCROBrailleSubstitutionManager sharedInstance];
      v24 = [v23 brailleSubstitutionForType:v22 withLanguage:0];
      [v5 appendString:v24];

      [v5 appendString:@" "];
      [v5 appendString:v17];
      if (v16 <= 6) {
        [v5 appendString:@"  "];
      }
    }

    ++v16;
  }
  while (v21 != 8);

  return v5;
}

- (void)_setBrailleFormatterHandler:(id)a3
{
  id v4 = [a3 data];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SCROBrailleDisplay *)self _setBrailleFormatter:v4];
  }
}

- (void)_setTactileGraphicsImageDataHandler:(id)a3
{
  id v4 = [a3 data];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    [(SCROBrailleLine *)self->_brailleLine setImageData:v4];
  }
}

- (void)_setPlanarDataHandler:(id)a3
{
  id v4 = [a3 data];
  [(SCROBrailleLine *)self->_brailleLine setPlanarData:v4];
}

- (unint64_t)numberOfTextLinesInPlanarBraille
{
  return [(SCROBrailleLine *)self->_brailleLine numberOfTextLinesInPlanarBraille];
}

- (void)_unpauseInputAndProcessKeyEvents
{
  [(SCROBrailleDisplay *)self _unpauseInput];
  uint64_t v3 = MEMORY[0x263EFFA68];

  [(SCROBrailleDisplay *)self _processKeyEvents:v3];
}

- (void)unpauseInputOnBrailleFormatterChange
{
  if ([(SCROBrailleDisplay *)self _inputPaused])
  {
    [(SCROBrailleDisplay *)self _unpauseInputAndProcessKeyEvents];
  }
}

- (void)_setBrailleFormatter:(id)a3
{
  id v13 = a3;
  id v4 = [v13 statusText];
  [(NSLock *)self->_contentLock lock];
  if (v4
    && ([v4 attribute:kSCROStatusAttribute[0] atIndex:0 effectiveRange:0],
        (uint64_t v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    BOOL v6 = [(SCROBrailleDisplay *)self _statusStringWithDictionary:v5];
    unint64_t v7 = (void *)[v13 copy];

    [v7 addText:v6 selection:0 token:0 focus:0 isEditableText:0];
    [v7 translate];

    int64_t v8 = (void *)v5;
    id v9 = v7;
  }
  else
  {
    int64_t v8 = 0;
    id v9 = v13;
  }
  id v14 = v9;
  -[SCROBrailleLine setFormatter:](self->_brailleLine, "setFormatter:");
  [(NSLock *)self->_contentLock unlock];
  [(SCROBrailleDisplay *)self unpauseInputOnBrailleFormatterChange];
  [(SCROBrailleDisplay *)self _beginAutoAdvanceIfEnabled];
  int64_t v10 = [v14 outputTableIdentifier];
  uint64_t v11 = [v14 inputTableIdentifier];
  if (v10) {
    objc_storeStrong((id *)&self->_outputTableIdentifier, v10);
  }
  if (v11 && ![(NSString *)self->_inputTableIdentifier isEqualToString:v11])
  {
    objc_storeStrong((id *)&self->_inputTableIdentifier, v11);
    id v12 = (void *)[objc_alloc(MEMORY[0x263F2BAA8]) initWithIdentifier:v11];
    self->_isInputEightDot = [v12 supportsTranslationMode8Dot];
    self->_isInputContracted = [v12 supportsTranslationModeContracted];
  }
  if (![(SCROBrailleLine *)self->_brailleLine hasEdits]) {
    [(SCROBrailleDisplay *)self _updateDisplay];
  }
}

- (NSAttributedString)editingString
{
  return [(SCROBrailleLine *)self->_brailleLine editingString];
}

- (BOOL)hasEdits
{
  return [(SCROBrailleLine *)self->_brailleLine hasEdits];
}

- (void)_statusDisplayHandler:(id)a3
{
  id v11 = a3;
  id v4 = [v11 data];
  uint64_t v5 = [v4 intValue];

  int v6 = [v11 type];
  [(NSLock *)self->_contentLock lock];
  if (v6 != 4)
  {
    if (v6 == 5 && [(SCROBrailleDisplayStatus *)self->_status masterStatusCellIndex] != (int)v5)
    {
      [(SCROBrailleDisplayStatus *)self->_status setMasterStatusCellIndex:(int)v5];
      [(SCROBrailleLine *)self->_brailleLine setMasterStatusCellIndex:[(SCROBrailleDisplayStatus *)self->_status masterStatusCellIndex]];
LABEL_9:
      int v7 = 1;
      goto LABEL_10;
    }
LABEL_6:
    int v7 = 0;
    goto LABEL_10;
  }
  if ([(SCROBrailleDisplayStatus *)self->_status virtualAlignment] == v5) {
    goto LABEL_6;
  }
  [(SCROBrailleDisplayStatus *)self->_status setVirtualAlignment:v5];
  int64_t v8 = [(SCROBrailleDisplayStatus *)self->_status virtualData];

  if (v8)
  {
    brailleLine = self->_brailleLine;
    int64_t v10 = [(SCROBrailleDisplayStatus *)self->_status virtualData];
    [(SCROBrailleLine *)brailleLine setVirtualStatus:v10 alignment:[(SCROBrailleDisplayStatus *)self->_status virtualAlignment]];

    goto LABEL_9;
  }
  int v7 = 0;
LABEL_10:
  [(NSLock *)self->_contentLock unlock];
  if (v7) {
    [(SCROBrailleDisplay *)self _updateDisplay];
  }
}

- (void)_aggregatedStatusHandler:(id)a3
{
  id v18 = a3;
  id v4 = [v18 data];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = v4;
    unint64_t v6 = [v5 length];
    id v7 = objc_alloc_init(MEMORY[0x263EFF8F8]);
    [(NSLock *)self->_contentLock lock];
    int64_t v8 = [(SCROBrailleDisplayStatus *)self->_status aggregatedData];
    [(SCROBrailleDisplayStatus *)self->_status setAggregatedData:v5];
    id v9 = [(SCROBrailleDisplayStatus *)self->_status realData];
    int64_t v10 = [(SCROBrailleDisplayStatus *)self->_status virtualData];
    int64_t statusSize = self->_statusSize;
    if (v6 <= statusSize)
    {
      [(SCROBrailleDisplayStatus *)self->_status setRealData:v5];
      [(SCROBrailleDisplayStatus *)self->_status setVirtualData:v7];
    }
    else
    {
      if (statusSize < 1)
      {
        [(SCROBrailleDisplayStatus *)self->_status setRealData:0];
      }
      else
      {
        id v12 = [v5 subdataWithRange:0];
        [(SCROBrailleDisplayStatus *)self->_status setRealData:v12];
      }
      id v13 = objc_msgSend(v5, "subdataWithRange:", self->_statusSize, v6 - self->_statusSize);
      [(SCROBrailleDisplayStatus *)self->_status setVirtualData:v13];
    }
    brailleLine = self->_brailleLine;
    v15 = [(SCROBrailleDisplayStatus *)self->_status realData];
    [(SCROBrailleLine *)brailleLine setRealStatus:v15];

    unint64_t v16 = self->_brailleLine;
    int v17 = [(SCROBrailleDisplayStatus *)self->_status virtualData];
    [(SCROBrailleLine *)v16 setVirtualStatus:v17 alignment:[(SCROBrailleDisplayStatus *)self->_status virtualAlignment]];

    [(NSLock *)self->_contentLock unlock];
    [(SCROBrailleDisplay *)self _updateDisplay];
  }
}

- (void)_setDelegateWantsDisplayCallbackHandler:(id)a3
{
  id v4 = [a3 data];
  self->_delegateWantsDisplayCallback = [v4 BOOLValue];

  if (self->_delegateWantsDisplayCallback)
  {
    [(SCROBrailleDisplay *)self _updateDisplay];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v5 = [(SCROBrailleLine *)self->_brailleLine newLineDescriptor];
    [WeakRetained brailleDisplay:self didDisplay:v5];
  }
}

- (void)_simulateKeypressHandler:(id)a3
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v4 = [a3 data];
  id v5 = v4;
  if (v4)
  {
    unint64_t v6 = [v4 keyMasks];
    id v7 = [MEMORY[0x263EFF980] array];
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v6;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "intValue", (void)v15);
          id v14 = [NSNumber numberWithInt:v13];
          [v7 addObject:v14];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    [(SCROBrailleDisplay *)self _processKeyEvents:v7];
  }
}

- (void)_bulkStatusAttributesHandler:(id)a3
{
  id v11 = a3;
  id v4 = [v11 data];
  uint64_t v5 = [v4 integerValue];

  unint64_t v6 = [v11 data2];
  uint64_t v7 = [v6 intValue];

  [(NSLock *)self->_contentLock lock];
  [(SCROBrailleDisplayStatus *)self->_status setVirtualAlignment:v7];
  [(SCROBrailleDisplayStatus *)self->_status setMasterStatusCellIndex:v5];
  id v8 = [(SCROBrailleDisplayStatus *)self->_status virtualData];

  if (v8)
  {
    brailleLine = self->_brailleLine;
    uint64_t v10 = [(SCROBrailleDisplayStatus *)self->_status virtualData];
    [(SCROBrailleLine *)brailleLine setVirtualStatus:v10 alignment:[(SCROBrailleDisplayStatus *)self->_status virtualAlignment]];
  }
  [(SCROBrailleLine *)self->_brailleLine setMasterStatusCellIndex:[(SCROBrailleDisplayStatus *)self->_status masterStatusCellIndex]];
  [(NSLock *)self->_contentLock unlock];
  [(SCROBrailleDisplay *)self _updateDisplay];
}

- (void)_setBatchUpdates:(id)a3
{
  id v4 = [a3 data];
  int v5 = [v4 BOOLValue];

  if (self->_shouldBatchUpdates != v5)
  {
    self->_shouldBatchUpdates = v5;
    if ((v5 & 1) == 0 && self->_needsUpdating)
    {
      [(SCROBrailleDisplay *)self _updateDisplay];
    }
  }
}

- (void)_updateDisplay
{
  if (self->_shouldBatchUpdates)
  {
    if (!self->_needsPanUpdating)
    {
      self->_needsUpdating = 1;
      return;
    }
  }
  else
  {
    self->_needsUpdating = 0;
  }
  self->_needsPanUpdating = 0;
  [(NSLock *)self->_contentLock lock];
  uint64_t v3 = self->_brailleLine;
  BOOL v4 = [(SCROBrailleLine *)v3 display];
  if (v4 && self->_delegateWantsDisplayCallback)
  {
    id v6 = [(SCROBrailleLine *)v3 newLineDescriptor];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  }
  else
  {
    id WeakRetained = 0;
    id v6 = 0;
  }

  [(NSLock *)self->_contentLock unlock];
  if (v4 && self->_delegateWantsDisplayCallback) {
    [WeakRetained brailleDisplay:self didDisplay:v6];
  }
}

- (void)_configurationChangeHandler
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  [(NSLock *)self->_contentLock lock];
  uint64_t v4 = [(SCROBrailleDriverProtocol *)self->_brailleDriver mainSize];
  uint64_t v5 = [(SCROBrailleDriverProtocol *)self->_brailleDriver statusSize];
  id obj = [(SCROBrailleDriverProtocol *)self->_brailleDriver modelIdentifier];
  int v6 = [(SCROBrailleDriverProtocol *)self->_brailleDriver postsKeyboardEvents];
  int v7 = [(SCROBrailleDriverProtocol *)self->_brailleDriver brailleInputMode];
  int64_t v8 = v4 & ~(v4 >> 63);
  int64_t v9 = v5 & ~(v5 >> 63);
  BOOL v10 = __PAIR128__(v9, v8) != *(_OWORD *)&self->_mainSize
     || ![obj isEqual:self->_driverModelIdentifier]
     || self->_postsKeyboardEvents != v6
     || v7 != self->_brailleInputMode;
  driverModelIdentifier = self->_driverModelIdentifier;
  self->_int64_t mainSize = v8;
  self->_unint64_t statusSize = v9;
  uint64_t v12 = driverModelIdentifier;
  objc_storeStrong((id *)&self->_driverModelIdentifier, obj);
  self->_postsKeyboardEvents = v6;
  self->_uint64_t brailleInputMode = v7;
  if (v10)
  {
    uint64_t v13 = [(SCROBrailleDisplayStatus *)self->_status aggregatedData];
    unint64_t v14 = [v13 length];

    long long v15 = [(SCROBrailleDisplayStatus *)self->_status realData];
    long long v16 = [(SCROBrailleDisplayStatus *)self->_status virtualData];
    unint64_t statusSize = self->_statusSize;
    [(SCROBrailleDisplayStatus *)self->_status aggregatedData];
    if (v14 <= statusSize) {
      v24 = {;
    }
      [(SCROBrailleDisplayStatus *)self->_status setRealData:v24];

      [(SCROBrailleDisplayStatus *)self->_status setVirtualData:v3];
    }
    else {
      long long v18 = {;
    }
      uint64_t v19 = objc_msgSend(v18, "subdataWithRange:", 0, statusSize);
      [(SCROBrailleDisplayStatus *)self->_status setRealData:v19];

      int64_t v20 = self->_statusSize;
      unint64_t v21 = [(SCROBrailleDisplayStatus *)self->_status aggregatedData];
      uint64_t v22 = objc_msgSend(v21, "subdataWithRange:", v20, v14 - v20);
      [(SCROBrailleDisplayStatus *)self->_status setVirtualData:v22];
    }
    [(SCROBrailleLine *)self->_brailleLine setMainSize:self->_mainSize];
    [(SCROBrailleLine *)self->_brailleLine setStatusSize:self->_statusSize];
    brailleLine = self->_brailleLine;
    v26 = [(SCROBrailleDisplayStatus *)self->_status realData];
    [(SCROBrailleLine *)brailleLine setRealStatus:v26];

    unsigned __int8 v27 = self->_brailleLine;
    BOOL v28 = [(SCROBrailleDisplayStatus *)self->_status virtualData];
    [(SCROBrailleLine *)v27 setVirtualStatus:v28 alignment:[(SCROBrailleDisplayStatus *)self->_status virtualAlignment]];

    int v23 = 1;
  }
  else
  {
    int v23 = 0;
    long long v16 = 0;
    long long v15 = 0;
  }
  [(NSLock *)self->_contentLock unlock];
  if (v23)
  {
    [(SCROBrailleDisplay *)self _updateDisplay];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained configurationChangedForBrailleDisplay:self];
  }
}

- (void)_singleLetterInputHandler:(id)a3
{
  uint64_t v4 = [a3 data];
  uint64_t v5 = [v4 BOOLValue];

  brailleLine = self->_brailleLine;

  [(SCROBrailleLine *)brailleLine setIsSingleLetterInputOn:v5];
}

- (void)_textSearchModeHandler:(id)a3
{
  uint64_t v4 = [a3 data];
  uint64_t v5 = [v4 BOOLValue];

  brailleLine = self->_brailleLine;

  [(SCROBrailleLine *)brailleLine setIsTextSearchModeOn:v5];
}

- (void)_translateBrailleToClipboard
{
  id v4 = [(SCROBrailleLine *)self->_brailleLine translatedBrailleForTableIdentifier:0];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained brailleDisplay:self copyStringToClipboard:v4];
}

- (void)_setBrailleKeyDebounceTimeoutHandler:(double)a3
{
  self->_brailleKeyDebounceTimeout = a3;
}

- (BOOL)_currentChordShouldExecuteEvenDuringTyping
{
  id v3 = [(SCROBrailleDisplay *)self brailleInputManager];
  id v4 = [(SCROBrailleDisplay *)self _newBrailleKeyForCurrentBrailleChord];
  uint64_t v5 = [v3 commandForBrailleKey:v4];

  if (([v5 isEqualToString:@"VOTEventCommandBrailleTranslate"] & 1) != 0
    || ([v5 isEqualToString:@"VOTEventCommandDelete"] & 1) != 0)
  {
    char v6 = 1;
  }
  else
  {
    char v6 = [v5 isEqualToString:@"VOTEventCommandReturn"];
  }

  return v6;
}

- (void)insertTypingString:(id)a3
{
}

- (SCROBrailleLine)testingBrailleLine
{
  return self->_brailleLine;
}

- (void)_startEditingText
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained brailleDidStartEditingWithDisplay:self];
}

- (void)_translateBrailleStringAndPostEvent
{
}

- (BOOL)_inputPaused
{
  return self->_inputPaused && CFAbsoluteTimeGetCurrent() - self->_inputPausedTime < 2.0;
}

- (void)_pauseInput
{
  self->_inputPaused = 1;
  self->_inputPausedTime = CFAbsoluteTimeGetCurrent();
}

- (void)_unpauseInput
{
  self->_inputPaused = 0;
  self->_inputPausedTime = -3061152000.0;
}

- (void)_replaceRange:(_NSRange)a3 withString:(id)a4 cursor:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  if ((SCROCustomBrailleEnabled() & 1) == 0 && (SCROJapaneseBrailleSelected() & 1) == 0) {
    [(SCROBrailleDisplay *)self _pauseInput];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "brailleDisplay:didReplaceRange:withString:cursor:", self, location, length, v9, a5);
}

- (void)_processKeyEvents:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF980] array];
  keyEventsQueue = self->_keyEventsQueue;
  if (!keyEventsQueue)
  {
    int v7 = [MEMORY[0x263EFF980] array];
    int64_t v8 = self->_keyEventsQueue;
    self->_keyEventsQueue = v7;

    keyEventsQueue = self->_keyEventsQueue;
  }
  v102 = v4;
  [(NSMutableArray *)keyEventsQueue addObjectsFromArray:v4];
  id v9 = [MEMORY[0x263F089C8] indexSet];
  if (![(NSMutableArray *)self->_keyEventsQueue count])
  {
    char v105 = 0;
    goto LABEL_162;
  }
  char v105 = 0;
  uint64_t v10 = 0;
  p_input = &self->_input;
  int v92 = *MEMORY[0x263F2BB00];
  int v93 = *MEMORY[0x263F2BAE0];
  int v94 = *MEMORY[0x263F2BAE8];
  int v95 = *MEMORY[0x263F2BAF8];
  int v99 = ~*MEMORY[0x263F2BAF8];
  int v100 = ~*MEMORY[0x263F2BB00];
  int v98 = ~*MEMORY[0x263F2BAE8];
  int v103 = *MEMORY[0x263F2BB08];
  int v96 = ~*MEMORY[0x263F2BB08];
  int v97 = ~*MEMORY[0x263F2BAE0];
  NSUInteger location = (id *)&self->_delegate;
  int v101 = *MEMORY[0x263F2BAF0];
  v110 = v9;
  while (1)
  {
    uint64_t v12 = [(NSMutableArray *)self->_keyEventsQueue objectAtIndexedSubscript:v10];
    if ([(SCROBrailleDisplay *)self _inputPaused]) {
      break;
    }
    [v9 addIndex:v10];
    uint64_t v13 = [v12 unsignedLongValue];
    if ((v13 & 0x10000) != 0)
    {
      switch(v13 & 0xF)
      {
        case 0:
        case 3:
          id v106 = v5;
          uint64_t v19 = self;
          id v20 = v12;
          uint64_t v21 = [v20 unsignedLongValue];
          [(SCROBrailleDisplayInput *)self->_input setNewDown:1];
          if (![(SCROBrailleDisplayInput *)self->_input currentChord]) {
            [(SCROBrailleDisplayInput *)*p_input setCurrentChord:CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70])];
          }
          [(SCROBrailleDisplayInput *)*p_input setRouterEvent:v21];
          uint64_t v22 = v21 & 0xFFFF00FF;
          CFArrayRef v23 = [(SCROBrailleDisplayInput *)*p_input currentChord];
          CFIndex Count = CFArrayGetCount([(SCROBrailleDisplayInput *)*p_input currentChord]);
          __int16 v25 = [NSNumber numberWithUnsignedLong:v22];
          v134.NSUInteger location = 0;
          v134.NSUInteger length = Count;
          CFIndex FirstIndexOfValue = CFArrayGetFirstIndexOfValue(v23, v134, v25);

          if (FirstIndexOfValue < 0)
          {
            unsigned __int8 v27 = [(SCROBrailleDisplayInput *)*p_input currentChord];
            CFArrayAppendValue(v27, (const void *)[NSNumber numberWithUnsignedLong:v22]);
          }
          CFSetSetValue([(SCROBrailleDisplayInput *)*p_input downKeys], v20);

          id v5 = v106;
          id v9 = v110;
          break;
        case 2:
          uint64_t v29 = self;
          id v30 = v12;
          unsigned int v31 = [v30 unsignedLongValue];
          switch(BYTE1(v31))
          {
            case 0:
            case 1:
            case 2:
            case 3:
            case 4:
            case 5:
            case 6:
            case 7:
              unsigned int v32 = v31;
              if (![(SCROBrailleDisplayInput *)*p_input currentBrailleChordContainsSpacebar]&& ![(SCROBrailleDisplayInput *)*p_input currentBrailleChord])
              {
                [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleModifiers:[(SCROBrailleDisplayInput *)*p_input downBrailleModifiers]];
              }
              if (![(SCROBrailleDisplayInput *)*p_input currentBrailleChord]) {
                [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChord:CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70])];
              }
              id v107 = v5;
              if ([(SCROBrailleDisplayInput *)*p_input currentBrailleChordContainsSpacebar]&& !CFArrayGetCount([(SCROBrailleDisplayInput *)*p_input currentBrailleChord]))
              {
                [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChordBeganWithSpacebar:1];
              }
              CFArrayRef v33 = [(SCROBrailleDisplayInput *)*p_input currentBrailleChord];
              CFIndex v34 = CFArrayGetCount([(SCROBrailleDisplayInput *)*p_input currentBrailleChord]);
              v35 = [NSNumber numberWithUnsignedLong:v32];
              v135.NSUInteger location = 0;
              v135.NSUInteger length = v34;
              CFIndex v36 = CFArrayGetFirstIndexOfValue(v33, v135, v35);

              if (v36 < 0) {
                CFArrayAppendValue([(SCROBrailleDisplayInput *)*p_input currentBrailleChord], v30);
              }
              CFSetSetValue([(SCROBrailleDisplayInput *)*p_input downBrailleDots], v30);
              id v5 = v107;
              if (![(SCROBrailleDisplay *)v29 isInputEightDot])
              {
                BOOL v37 = [(SCROBrailleLine *)self->_brailleLine isSingleLetterInputOn];
                if ((v32 & 0xFE00) == 0x600 && !v37) {
                  [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChordContainsNonSpacebarChordableKey:1];
                }
              }
              break;
            case 8:
              if (![(SCROBrailleDisplayInput *)*p_input currentBrailleChordContainsSpacebar]&& ![(SCROBrailleDisplayInput *)*p_input currentBrailleChord])
              {
                [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleModifiers:[(SCROBrailleDisplayInput *)*p_input downBrailleModifiers]];
              }
              [(SCROBrailleDisplayInput *)*p_input setSpacebarIsDown:1];
              [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChordContainsSpacebar:1];
              break;
            case 9:
              v84 = *p_input;
              unsigned int v85 = [(SCROBrailleDisplayInput *)*p_input currentBrailleModifiers];
              int v86 = v103;
              goto LABEL_146;
            case 0xA:
              v84 = *p_input;
              unsigned int v85 = [(SCROBrailleDisplayInput *)*p_input currentBrailleModifiers];
              int v86 = v93;
              goto LABEL_146;
            case 0xB:
              v84 = *p_input;
              unsigned int v85 = [(SCROBrailleDisplayInput *)*p_input currentBrailleModifiers];
              int v86 = v94;
              goto LABEL_146;
            case 0xC:
              v84 = *p_input;
              unsigned int v85 = [(SCROBrailleDisplayInput *)*p_input currentBrailleModifiers];
              int v86 = v95;
              goto LABEL_146;
            case 0xD:
              v84 = *p_input;
              unsigned int v85 = [(SCROBrailleDisplayInput *)*p_input currentBrailleModifiers];
              int v86 = v92;
LABEL_146:
              [(SCROBrailleDisplayInput *)v84 setCurrentBrailleModifiers:v86 | v85];
              [(SCROBrailleDisplayInput *)*p_input setDownBrailleModifiers:[(SCROBrailleDisplayInput *)*p_input downBrailleModifiers] | v86];
              break;
            default:
              break;
          }
          double Current = CFAbsoluteTimeGetCurrent();
          [(SCROBrailleDisplayInput *)self->_input lastBrailleChordTypingTime];
          if (Current - v88 <= self->_brailleKeyDebounceTimeout) {
            int v89 = ![(SCROBrailleDisplay *)v29 _currentChordShouldExecuteEvenDuringTyping];
          }
          else {
            int v89 = 0;
          }
          if (![(SCROBrailleDisplayInput *)*p_input skipBrailleKeyboardKeyTranslation]&& ((v89 | ![(SCROBrailleDisplayInput *)*p_input currentBrailleChordContainsSpacebar]) != 1|| [(SCROBrailleDisplayInput *)*p_input currentBrailleChordContainsNonSpacebarChordableKey])&& [(SCROBrailleDisplayInput *)*p_input currentBrailleChord])
          {
            [(SCROBrailleDisplayInput *)*p_input setSkipBrailleKeyboardKeyTranslation:1];
          }

          id v9 = v110;
          break;
        case 6:
          -[SCROBrailleDisplayInput setCurrentHIDCommand:](*p_input, "setCurrentHIDCommand:", [v12 unsignedLongValue]);
          break;
        default:
          v112 = self;
          id v38 = v12;
          unsigned int v39 = [v38 unsignedLongValue];
          [(SCROBrailleDisplayInput *)self->_input setNewDown:1];
          if (![(SCROBrailleDisplayInput *)self->_input currentChord]) {
            [(SCROBrailleDisplayInput *)*p_input setCurrentChord:CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70])];
          }
          id v40 = v5;
          if ([(SCROBrailleDisplayInput *)*p_input currentBrailleChordContainsSpacebar]&& !CFArrayGetCount([(SCROBrailleDisplayInput *)*p_input currentChord]))
          {
            [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChordBeganWithSpacebar:1];
          }
          CFArrayRef v41 = [(SCROBrailleDisplayInput *)*p_input currentChord];
          CFIndex v42 = CFArrayGetCount([(SCROBrailleDisplayInput *)*p_input currentChord]);
          v43 = [NSNumber numberWithUnsignedLong:v39];
          v136.NSUInteger location = 0;
          v136.NSUInteger length = v42;
          CFIndex v44 = CFArrayGetFirstIndexOfValue(v41, v136, v43);

          if (v44 < 0) {
            CFArrayAppendValue([(SCROBrailleDisplayInput *)*p_input currentChord], v38);
          }
          CFSetSetValue([(SCROBrailleDisplayInput *)*p_input downKeys], v38);

          id v5 = v40;
          break;
      }
    }
    else
    {
      unint64_t v14 = self;
      int v15 = [v12 unsignedLongValue];
      __int16 v16 = v15;
      uint64_t v17 = v15 | 0x10000u;
      if ((v15 & 0xF) == 2)
      {
        switch(BYTE1(v15))
        {
          case 0:
          case 1:
          case 2:
          case 3:
          case 4:
          case 5:
          case 6:
          case 7:
            if ([(SCROBrailleDisplayInput *)*p_input currentBrailleChord])
            {
              long long v18 = [(SCROBrailleDisplayInput *)*p_input downBrailleDots];
              CFSetRemoveValue(v18, (const void *)[NSNumber numberWithUnsignedLong:v17]);
            }
            if ((v16 & 0xFE00) == 0x600) {
              [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChordContainsNonSpacebarChordableKey:0];
            }
            break;
          case 8:
            [(SCROBrailleDisplayInput *)*p_input setSpacebarIsDown:0];
            if ([(SCROBrailleDisplayInput *)*p_input skipBrailleKeyboardKeyTranslation]&& ![(SCROBrailleDisplayInput *)*p_input currentBrailleChord])
            {
              [(SCROBrailleDisplayInput *)*p_input setSkipBrailleKeyboardKeyTranslation:0];
              [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChordContainsSpacebar:0];
              [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChordBeganWithSpacebar:0];
            }
            break;
          case 9:
            v45 = *p_input;
            unsigned int v46 = [(SCROBrailleDisplayInput *)*p_input downBrailleModifiers];
            int v47 = v96;
            goto LABEL_50;
          case 0xA:
            v45 = *p_input;
            unsigned int v46 = [(SCROBrailleDisplayInput *)*p_input downBrailleModifiers];
            int v47 = v97;
            goto LABEL_50;
          case 0xB:
            v45 = *p_input;
            unsigned int v46 = [(SCROBrailleDisplayInput *)*p_input downBrailleModifiers];
            int v47 = v98;
            goto LABEL_50;
          case 0xC:
            v45 = *p_input;
            unsigned int v46 = [(SCROBrailleDisplayInput *)*p_input downBrailleModifiers];
            int v47 = v99;
            goto LABEL_50;
          case 0xD:
            v45 = *p_input;
            unsigned int v46 = [(SCROBrailleDisplayInput *)*p_input downBrailleModifiers];
            int v47 = v100;
LABEL_50:
            [(SCROBrailleDisplayInput *)v45 setDownBrailleModifiers:v46 & v47];
            break;
          default:
            break;
        }
      }
      else if ([(SCROBrailleDisplayInput *)*p_input currentChord])
      {
        BOOL v28 = [(SCROBrailleDisplayInput *)*p_input downKeys];
        CFSetRemoveValue(v28, (const void *)[NSNumber numberWithUnsignedLong:v17]);
      }
    }
    if ([(SCROBrailleDisplayInput *)*p_input routerEvent]
      && ![(SCROBrailleDisplayInput *)*p_input prepareToMemorizeNextKey]
      || !CFSetGetCount([(SCROBrailleDisplayInput *)*p_input downKeys])
      && [(SCROBrailleDisplayInput *)*p_input currentChord])
    {
      v113 = v12;
      unsigned int v48 = [(SCROBrailleDisplayInput *)self->_input routerEvent];
      v49 = self;
      id v111 = [(SCROBrailleDisplay *)v49 _newBrailleKeyForCurrentKeyChord];
      unsigned int v50 = [(SCROBrailleDisplayInput *)self->_input routerEvent];
      input = self->_input;
      if (v50)
      {
        unsigned int v52 = [(SCROBrailleDisplayInput *)input routerEvent];
        v119[0] = BYTE1(v52);
        v115[0] = 0;
        if ((v52 & 0xF) != 0)
        {
          id v53 = 0;
        }
        else
        {
          id v108 = v5;
          uint64_t v124 = 0;
          [(NSLock *)self->_contentLock lock];
          v54 = self->_brailleLine;
          if ([(SCROBrailleLine *)v54 getStatusRouterIndex:&v124 forRawIndex:v119[0]])
          {
            id v53 = 0;
            v119[0] = v124 + self->_statusSize;
          }
          else
          {
            id v130 = 0;
            [(SCROBrailleLine *)v54 tokenForRouterIndex:v119 location:v115 appToken:&v130];
            id v53 = v130;
          }

          [(NSLock *)self->_contentLock unlock];
          id v5 = v108;
        }
        objc_msgSend(v111, "setRouterIndex:token:location:appToken:");
        if ([(SCROBrailleDisplayInput *)*p_input currentChord])
        {
          uint64_t v109 = v10;
          unsigned int v55 = v48;
          id v56 = v5;
          BOOL v57 = [(SCROBrailleDisplayInput *)*p_input prepareToMemorizeNextKey];
          v58 = [(SCROBrailleDisplayInput *)*p_input currentChord];
          CFArrayRef v59 = v58;
          if (v57)
          {
            CFRelease(v58);
            [(SCROBrailleDisplayInput *)*p_input setCurrentChord:0];
            id v5 = v56;
            unsigned int v48 = v55;
            uint64_t v10 = v109;
          }
          else
          {
            CFIndex v60 = CFArrayGetCount([(SCROBrailleDisplayInput *)*p_input currentChord]);
            v61 = [NSNumber numberWithUnsignedLong:v52 & 0xFFFF00FF];
            v137.NSUInteger location = 0;
            v137.NSUInteger length = v60;
            CFIndex v62 = CFArrayGetFirstIndexOfValue(v59, v137, v61);

            id v5 = v56;
            unsigned int v48 = v55;
            uint64_t v10 = v109;
            id v9 = v110;
            if ((v62 & 0x8000000000000000) == 0) {
              CFArrayRemoveValueAtIndex([(SCROBrailleDisplayInput *)*p_input currentChord], v62);
            }
          }
        }
      }
      else if ([(SCROBrailleDisplayInput *)input currentChord])
      {
        CFRelease([(SCROBrailleDisplayInput *)*p_input currentChord]);
        [(SCROBrailleDisplayInput *)*p_input setCurrentChord:0];
      }
      BOOL v63 = [(SCROBrailleDisplay *)v49 _hasPressedBrailleKeys];
      BOOL v64 = [(SCROBrailleDisplayInput *)*p_input newDown];
      if (!v64) {
        goto LABEL_76;
      }
      [(SCROBrailleDisplayInput *)*p_input setNewDown:0];
      if ([(SCROBrailleDisplayInput *)*p_input memorizeNextKeyImmediately])
      {
        if (v63)
        {
          [(SCROBrailleDisplayInput *)*p_input setRouterEvent:0];
          id v65 = 0;
LABEL_81:

          if (v65)
          {
            uint64_t v12 = v113;
            if (![(SCROBrailleLine *)self->_brailleLine wantsEdits] && !v48
              || ([(SCROBrailleDisplayCommandDispatcherProtocol *)self->_commandDispatcher handleBrailleKeyEvent:v65] & 1) == 0)
            {
              [v5 addObject:v65];
            }
          }
          else
          {
            v105 |= v64;
            uint64_t v12 = v113;
          }

          goto LABEL_88;
        }
        id WeakRetained = objc_loadWeakRetained(location);
        [WeakRetained brailleDisplay:v49 memorizedKey:v111];

        [(SCROBrailleDisplayInput *)*p_input setRouterEvent:0];
        id v65 = 0;
LABEL_80:
        [(SCROBrailleDisplay *)v49 _stopMemorization];
        goto LABEL_81;
      }
      if (![(SCROBrailleDisplayInput *)*p_input willMemorizeNow]) {
        id v65 = v111;
      }
      else {
LABEL_76:
      }
        id v65 = 0;
      [(SCROBrailleDisplayInput *)*p_input setRouterEvent:0];
      if (v63) {
        goto LABEL_81;
      }
      goto LABEL_80;
    }
LABEL_88:
    if (!CFSetGetCount([(SCROBrailleDisplayInput *)*p_input downBrailleDots])
      && ([(SCROBrailleDisplayInput *)*p_input currentBrailleChord]
       || ([(SCROBrailleDisplayInput *)*p_input currentBrailleChordContainsSpacebar]|| [(SCROBrailleDisplayInput *)*p_input currentBrailleChordContainsNonSpacebarChordableKey])&& ![(SCROBrailleDisplayInput *)*p_input spacebarIsDown]))
    {
      v67 = self;
      if ([(SCROBrailleDisplayInput *)self->_input skipBrailleKeyboardKeyTranslation])
      {
        if ([(SCROBrailleDisplayInput *)*p_input currentBrailleChord])
        {
          id v68 = [(SCROBrailleDisplay *)v67 _newBrailleKeyForCurrentBrailleChord];
          if ([(SCROBrailleDisplayInput *)*p_input memorizeNextKeyImmediately])
          {
            if (![(SCROBrailleDisplay *)v67 _hasKeyChord])
            {
              id v69 = objc_loadWeakRetained(location);
              [v69 brailleDisplay:v67 memorizedKey:v68];

              [(SCROBrailleDisplay *)v67 _stopMemorization];
            }
LABEL_103:
            id v70 = 0;
          }
          else
          {
            if ([(SCROBrailleDisplayInput *)*p_input willMemorizeNow]) {
              goto LABEL_103;
            }
            id v70 = v68;
          }

          [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleModifiers:[(SCROBrailleDisplayInput *)*p_input downBrailleModifiers]];
          [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChord:0];
        }
        else
        {
          id v70 = 0;
        }
        if (![(SCROBrailleDisplayInput *)*p_input spacebarIsDown])
        {
          [(SCROBrailleDisplayInput *)*p_input setSkipBrailleKeyboardKeyTranslation:0];
          [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChordContainsSpacebar:0];
          [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChordBeganWithSpacebar:0];
        }
      }
      else
      {
        id v70 = 0;
      }
      if (![(SCROBrailleDisplay *)v67 _hasKeyChord]
        && ![(SCROBrailleDisplay *)v67 _hasPressedBrailleKeys])
      {
        [(SCROBrailleDisplay *)v67 _stopMemorization];
      }
      v114 = v12;

      if (v70
        && (![(SCROBrailleLine *)self->_brailleLine wantsEdits]
         && (SCROJapaneseBrailleSelected() & 1) == 0
         && !SCROCustomBrailleEnabled()
         || ([(SCROBrailleDisplayCommandDispatcherProtocol *)self->_commandDispatcher handleBrailleKeyEvent:v70] & 1) == 0))
      {
        [v5 addObject:v70];
        [(SCROBrailleDisplay *)v67 _translateBrailleStringAndPostEvent];
      }
      v71 = v67;
      id v130 = 0;
      v131 = &v130;
      uint64_t v132 = 0x2020000000;
      char v133 = 0;
      uint64_t v124 = 0;
      v125 = &v124;
      uint64_t v126 = 0x3032000000;
      v127 = __Block_byref_object_copy_;
      v128 = __Block_byref_object_dispose_;
      id v72 = v5;
      id v129 = v72;
      id v73 = v72;
      if (![(SCROBrailleDisplayInput *)*p_input skipBrailleKeyboardKeyTranslation])
      {
        BOOL v74 = [(SCROBrailleDisplay *)v71 persistentKeyModifiers] != v103
           && [(SCROBrailleDisplay *)v71 persistentKeyModifiers] != v101;
        v119[0] = MEMORY[0x263EF8330];
        v119[1] = 3221225472;
        v119[2] = ___appendBrailleKeysToArray_block_invoke;
        v119[3] = &unk_2644146B8;
        v75 = v71;
        v120 = v75;
        v121 = &v130;
        BOOL v123 = v74;
        v122 = &v124;
        v76 = (void (**)(void))MEMORY[0x21D4AD760](v119);
        v115[0] = MEMORY[0x263EF8330];
        v115[1] = 3221225472;
        v115[2] = ___appendBrailleKeysToArray_block_invoke_891;
        v115[3] = &unk_2644146E0;
        v77 = v75;
        BOOL v118 = v74;
        v116 = v77;
        v117 = &v124;
        v78 = (void (**)(void))MEMORY[0x21D4AD760](v115);
        if ([(SCROBrailleDisplayInput *)*p_input currentBrailleChordBeganWithSpacebar]&& [(SCROBrailleDisplayInput *)*p_input currentBrailleChord])
        {
          *((unsigned char *)v131 + 24) = 1;
          v76[2](v76);
          [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChordContainsSpacebar:0];
          [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChordBeganWithSpacebar:0];
        }
        else
        {
          v76[2](v76);
          v78[2](v78);
        }
        id v73 = (id) v125[5];
        [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleChord:0];
        [(SCROBrailleDisplayInput *)*p_input setCurrentBrailleModifiers:[(SCROBrailleDisplayInput *)*p_input downBrailleModifiers]];
      }
      if (![(SCROBrailleDisplay *)v71 _hasKeyChord]
        && ![(SCROBrailleDisplay *)v71 _hasPressedBrailleKeys])
      {
        [(SCROBrailleDisplay *)v71 _stopMemorization];
      }
      _Block_object_dispose(&v124, 8);

      _Block_object_dispose(&v130, 8);
      id v5 = v73;

      id v9 = v110;
      uint64_t v12 = v114;
    }
    if ([(SCROBrailleDisplayInput *)*p_input currentHIDCommand])
    {
      if ([(SCROBrailleDisplay *)self _isMemorizingKeys])
      {
        v79 = objc_alloc_init(SCROBrailleKey);
        [(SCROBrailleKey *)v79 addKeyMask:[(SCROBrailleDisplayInput *)self->_input currentHIDCommand]];
        [(SCROBrailleKey *)v79 setDisplayToken:[(SCROIOElementProtocol *)self->_ioElement identifier]];
        id v80 = objc_loadWeakRetained(location);
        [v80 brailleDisplay:self memorizedKey:v79];

        [(SCROBrailleDisplay *)self _stopMemorization];
      }
      else
      {
        if (!v5)
        {
          id v5 = [MEMORY[0x263EFF980] array];
        }
        uint64_t v81 = [(SCROBrailleDisplayInput *)self->_input currentHIDCommand];
        uint64_t v82 = [(SCROIOElementProtocol *)self->_ioElement identifier];
        v83 = objc_alloc_init(SCROBrailleKey);
        [(SCROBrailleKey *)v83 addKeyMask:v81];
        [(SCROBrailleKey *)v83 setDisplayToken:v82];
        [v5 addObject:v83];

        id v5 = v5;
        [(SCROBrailleDisplayInput *)self->_input setCurrentHIDCommand:0];
      }
    }

    if (++v10 >= (unint64_t)[(NSMutableArray *)self->_keyEventsQueue count]) {
      goto LABEL_162;
    }
  }

LABEL_162:
  if ([v9 count])
  {
    id v90 = objc_loadWeakRetained((id *)&self->_delegate);
    [v90 brailleDisplayHadUserInteraction:self];
  }
  [(NSMutableArray *)self->_keyEventsQueue removeObjectsAtIndexes:v9];
  if (([v5 count] != 0) | v105 & 1)
  {
    if ([(SCROBrailleLine *)self->_brailleLine hasEdits]) {
      [(SCROBrailleDisplay *)self _translateBrailleStringAndPostEvent];
    }
    id v91 = objc_loadWeakRetained((id *)&self->_delegate);
    [v91 brailleDisplay:self pressedKeys:v5];
  }
}

- (void)_autoAdvancePanHandler:(id)a3
{
  id v6 = a3;
  if ([v6 type] == 18)
  {
    [(NSLock *)self->_contentLock lock];
    BOOL v4 = [(SCROBrailleLine *)self->_brailleLine canPanRight];
    [(NSLock *)self->_contentLock unlock];
    id v5 = @"@NO";
    if (v4) {
      id v5 = @"YES";
    }
    NSLog(&cfstr_AutoadvancePan.isa, v5);
    if (v4 || ![(SCROBrailleLine *)self->_brailleLine displayMode]) {
      [(SCROBrailleDisplay *)self _panHandler:v6];
    }
  }
}

- (void)_panHandler:(id)a3
{
  id v14 = a3;
  int v4 = [v14 type];
  [(NSLock *)self->_contentLock lock];
  switch(v4)
  {
    case 17:
      if ([(SCROBrailleLine *)self->_brailleLine panLeft]) {
        goto LABEL_9;
      }
      goto LABEL_3;
    case 18:
      if ([(SCROBrailleLine *)self->_brailleLine panRight]) {
        goto LABEL_9;
      }
      goto LABEL_11;
    case 19:
      if ([(SCROBrailleLine *)self->_brailleLine panBeginning]) {
        goto LABEL_9;
      }
LABEL_3:
      uint64_t v5 = [(SCROBrailleLine *)self->_brailleLine appToken];
      int64_t v6 = [(SCROBrailleLine *)self->_brailleLine firstToken];
      goto LABEL_12;
    case 20:
      if ([(SCROBrailleLine *)self->_brailleLine panEnd])
      {
LABEL_9:
        int v7 = 0;
        int64_t v8 = 0;
        uint64_t v9 = 1;
      }
      else
      {
LABEL_11:
        uint64_t v5 = [(SCROBrailleLine *)self->_brailleLine appToken];
        int64_t v6 = [(SCROBrailleLine *)self->_brailleLine lastToken];
LABEL_12:
        int64_t v8 = v6;
        uint64_t v9 = 0;
        int v7 = (void *)v5;
      }
LABEL_13:
      [(NSLock *)self->_contentLock unlock];
      if (v9)
      {
        self->_needsPanUpdating = 1;
        [(SCROBrailleDisplay *)self _updateDisplay];
      }
      if (![(SCROBrailleDisplay *)self inputAllowed]) {
        goto LABEL_23;
      }
      if ([(SCROBrailleLine *)self->_brailleLine hasEdits]) {
        [(SCROBrailleDisplay *)self _translateBrailleStringAndPostEvent];
      }
      if (v4 == 18)
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        id v11 = [NSNumber numberWithBool:v9];
        uint64_t v12 = [NSNumber numberWithInteger:v8];
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[SCROBrailleDisplay lineOffset](self, "lineOffset"));
        [WeakRetained brailleDisplay:self didPanRight:v11 elementToken:v12 appToken:v7 lineOffset:v13];
      }
      else
      {
        if (v4 != 17) {
          goto LABEL_23;
        }
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        id v11 = [NSNumber numberWithBool:v9];
        uint64_t v12 = [NSNumber numberWithInteger:v8];
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithInteger:", -[SCROBrailleDisplay lineOffset](self, "lineOffset"));
        [WeakRetained brailleDisplay:self didPanLeft:v11 elementToken:v12 appToken:v7 lineOffset:v13];
      }

LABEL_23:

      return;
    default:
      int v7 = 0;
      uint64_t v9 = 0;
      int64_t v8 = 0;
      goto LABEL_13;
  }
}

- (unint64_t)brailleLineGenerationID
{
  return [(SCROBrailleLine *)self->_brailleLine generationID];
}

- (int64_t)lineOffset
{
  return [(SCROBrailleLine *)self->_brailleLine lineOffset];
}

- (BOOL)_hasPressedBrailleKeys
{
  if ([(SCROBrailleDisplayInput *)self->_input currentBrailleChordContainsSpacebar]|| [(SCROBrailleDisplayInput *)self->_input currentBrailleChord])
  {
    return 1;
  }
  unsigned int v4 = [(SCROBrailleDisplayInput *)self->_input currentBrailleModifiers];
  return v4 != *MEMORY[0x263F2BAF0];
}

- (BOOL)_isMemorizingKeys
{
  if ([(SCROBrailleDisplayInput *)self->_input requestPrepareToMemorizeNextKey]
    || [(SCROBrailleDisplayInput *)self->_input prepareToMemorizeNextKey]
    || [(SCROBrailleDisplayInput *)self->_input memorizeNextKeyImmediately])
  {
    return 1;
  }
  input = self->_input;

  return [(SCROBrailleDisplayInput *)input willMemorizeNow];
}

- (void)_stopMemorization
{
  [(SCROBrailleDisplayInput *)self->_input setPrepareToMemorizeNextKey:0];
  [(SCROBrailleDisplayInput *)self->_input setMemorizeNextKeyImmediately:0];
  [(SCROBrailleDisplayInput *)self->_input setRequestPrepareToMemorizeNextKey:0];
  input = self->_input;

  [(SCROBrailleDisplayInput *)input setWillMemorizeNow:0];
}

- (BOOL)_hasKeyChord
{
  return [(SCROBrailleDisplayInput *)self->_input currentChord] != 0;
}

- (BOOL)_hasBrailleChord
{
  BOOL v3 = [(SCROBrailleDisplayInput *)self->_input skipBrailleKeyboardKeyTranslation];
  if (v3) {
    LOBYTE(v3) = [(SCROBrailleDisplayInput *)self->_input currentBrailleChord] != 0;
  }
  return v3;
}

- (id)keyArrayForBrailleStringWithCurrentModifiers:(id)a3
{
  id v4 = a3;
  [(SCROBrailleDisplay *)self isInputContracted];
  uint64_t v5 = self->_persistentKeyModifiers | [(SCROBrailleDisplayInput *)self->_input currentBrailleModifiers];
  [(SCROBrailleDisplay *)self isInputEightDot];
  uint64_t v6 = BRLTModeForFlags();
  if ([(SCROBrailleLine *)self->_brailleLine isSingleLetterInputOn]) {
    uint64_t v7 = 2;
  }
  else {
    uint64_t v7 = v6;
  }
  if (SCROCustomBrailleEnabled())
  {
    int64_t v8 = +[SCROBrailleTranslationManager inputManager];
    uint64_t v9 = [v8 textForPrintBraille:v4 language:0 mode:v7 locations:0];

    if ((unint64_t)[v9 length] < 2) {
      goto LABEL_9;
    }
    uint64_t v10 = [v9 substringToIndex:1];
  }
  else
  {
    uint64_t v9 = +[SCROBrailleTranslationManager sharedManager];
    uint64_t v10 = [v9 textForPrintBraille:v4 language:0 mode:v7 locations:0];
  }
  uint64_t v9 = (void *)v10;
LABEL_9:
  id v11 = [(SCROBrailleDisplay *)self newBrailleKeyboardKeyForText:v9 modifiers:v5];
  uint64_t v12 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithObjects:", v11, 0);

  return v12;
}

- (id)brailleInputManager
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  BOOL v3 = [WeakRetained brailleInputManager];

  return v3;
}

- (void)handleCommandPanLeftForDispatcher:(id)a3
{
  id v20 = a3;
  [(NSLock *)self->_contentLock lock];
  if ([(SCROBrailleLine *)self->_brailleLine panLeft])
  {
    id v4 = 0;
    int64_t v5 = 0;
    uint64_t v6 = 1;
  }
  else
  {
    int64_t v7 = [(SCROBrailleLine *)self->_brailleLine firstToken];
    id v4 = [(SCROBrailleLine *)self->_brailleLine appToken];
    uint64_t v6 = 0;
    int64_t v5 = v7;
  }
  [(NSLock *)self->_contentLock unlock];
  if (v6)
  {
    self->_needsPanUpdating = 1;
    [(SCROBrailleDisplay *)self _updateDisplay];
  }
  else if ([(SCROBrailleLine *)self->_brailleLine hasEdits])
  {
    [(SCROBrailleDisplay *)self _translateBrailleStringAndPostEvent];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = [NSNumber numberWithBool:v6];
  uint64_t v10 = [NSNumber numberWithInteger:v5];
  id v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[SCROBrailleDisplay lineOffset](self, "lineOffset"));
  [WeakRetained brailleDisplay:self didPanLeft:v9 elementToken:v10 appToken:v4 lineOffset:v11];

  uint64_t v12 = self;
  [(SCROBrailleDisplayInput *)v12->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v12->_input setBrailleTranslationTimeout:1.0];
  uint64_t v13 = v12;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v12->_input lastBrailleChordPosted];
  double v16 = Current - v15;
  [(SCROBrailleDisplayInput *)v12->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v12->_input setBrailleCharExponentialMovingAverage:v17 * 0.6 + v16 * 0.4];
  [(SCROBrailleDisplayInput *)v12->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v12->_input setBrailleTranslationTimeout:fmin(v18 * 3.5, 10.0)];
  input = v12->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandPanRightForDispatcher:(id)a3
{
  id v20 = a3;
  [(NSLock *)self->_contentLock lock];
  if ([(SCROBrailleLine *)self->_brailleLine panRight])
  {
    id v4 = 0;
    int64_t v5 = 0;
    uint64_t v6 = 1;
  }
  else
  {
    int64_t v7 = [(SCROBrailleLine *)self->_brailleLine firstToken];
    id v4 = [(SCROBrailleLine *)self->_brailleLine appToken];
    uint64_t v6 = 0;
    int64_t v5 = v7;
  }
  [(NSLock *)self->_contentLock unlock];
  if (v6)
  {
    self->_needsPanUpdating = 1;
    [(SCROBrailleDisplay *)self _updateDisplay];
  }
  else if ([(SCROBrailleLine *)self->_brailleLine hasEdits])
  {
    [(SCROBrailleDisplay *)self _translateBrailleStringAndPostEvent];
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v9 = [NSNumber numberWithBool:v6];
  uint64_t v10 = [NSNumber numberWithInteger:v5];
  id v11 = objc_msgSend(NSNumber, "numberWithInteger:", -[SCROBrailleDisplay lineOffset](self, "lineOffset"));
  [WeakRetained brailleDisplay:self didPanRight:v9 elementToken:v10 appToken:v4 lineOffset:v11];

  uint64_t v12 = self;
  [(SCROBrailleDisplayInput *)v12->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v12->_input setBrailleTranslationTimeout:1.0];
  uint64_t v13 = v12;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v12->_input lastBrailleChordPosted];
  double v16 = Current - v15;
  [(SCROBrailleDisplayInput *)v12->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v12->_input setBrailleCharExponentialMovingAverage:v17 * 0.6 + v16 * 0.4];
  [(SCROBrailleDisplayInput *)v12->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v12->_input setBrailleTranslationTimeout:fmin(v18 * 3.5, 10.0)];
  input = v12->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandMoveLeftForDispatcher:(id)a3
{
  if (![(SCROBrailleLine *)self->_brailleLine moveCursorLeft])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained playBorderHitSoundForBrailleDisplay:self];
  }
  int64_t v5 = self;
  [(SCROBrailleDisplayInput *)v5->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v5->_input setBrailleTranslationTimeout:1.0];
  uint64_t v12 = v5;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v5->_input lastBrailleChordPosted];
  double v8 = Current - v7;
  [(SCROBrailleDisplayInput *)v5->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v5->_input setBrailleCharExponentialMovingAverage:v9 * 0.6 + v8 * 0.4];
  [(SCROBrailleDisplayInput *)v5->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v5->_input setBrailleTranslationTimeout:fmin(v10 * 3.5, 10.0)];
  input = v5->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandMoveRightForDispatcher:(id)a3
{
  if (![(SCROBrailleLine *)self->_brailleLine moveCursorRight])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained playBorderHitSoundForBrailleDisplay:self];
  }
  int64_t v5 = self;
  [(SCROBrailleDisplayInput *)v5->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v5->_input setBrailleTranslationTimeout:1.0];
  uint64_t v12 = v5;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v5->_input lastBrailleChordPosted];
  double v8 = Current - v7;
  [(SCROBrailleDisplayInput *)v5->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v5->_input setBrailleCharExponentialMovingAverage:v9 * 0.6 + v8 * 0.4];
  [(SCROBrailleDisplayInput *)v5->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v5->_input setBrailleTranslationTimeout:fmin(v10 * 3.5, 10.0)];
  input = v5->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandRouterKeyEvent:(id)a3 forDispatcher:(id)a4
{
  v24[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  uint64_t v22 = 0;
  uint64_t v23 = 0;
  id v20 = 0;
  uint64_t v21 = 0;
  int v6 = [v5 getRouterIndex:&v23 token:&v22 location:&v21 appToken:&v20];
  id v7 = v20;
  if (!v6) {
    goto LABEL_5;
  }
  char v19 = 0;
  BOOL v8 = [(SCROBrailleLine *)self->_brailleLine moveCursorToRouterIndex:v23 forwardToScreenReader:&v19 updateRouterLocation:&v21];
  if (v19)
  {
    [v5 setRouterIndex:v23 token:v22 location:v21 appToken:v7];
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v24[0] = v5;
    double v10 = [MEMORY[0x263EFF8C0] arrayWithObjects:v24 count:1];
    [WeakRetained brailleDisplay:self pressedKeys:v10];

LABEL_6:
    goto LABEL_7;
  }
  if (!v8)
  {
LABEL_5:
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained playCommandNotSupportedSoundForBrailleDisplay:self];
    goto LABEL_6;
  }
LABEL_7:
  id v11 = self;
  [(SCROBrailleDisplayInput *)v11->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v11->_input setBrailleTranslationTimeout:1.0];
  uint64_t v12 = v11;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v11->_input lastBrailleChordPosted];
  double v15 = Current - v14;
  [(SCROBrailleDisplayInput *)v11->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v11->_input setBrailleCharExponentialMovingAverage:v16 * 0.6 + v15 * 0.4];
  [(SCROBrailleDisplayInput *)v11->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v11->_input setBrailleTranslationTimeout:fmin(v17 * 3.5, 10.0)];
  input = v11->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandDeleteKeyEvent:(id)a3 forDispatcher:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(SCROBrailleLine *)self->_brailleLine deleteAtCursor])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16[0] = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [WeakRetained brailleDisplay:self pressedKeys:v7];
  }
  BOOL v8 = self;
  [(SCROBrailleDisplayInput *)v8->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleTranslationTimeout:1.0];
  double v9 = v8;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v8->_input lastBrailleChordPosted];
  double v12 = Current - v11;
  [(SCROBrailleDisplayInput *)v8->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleCharExponentialMovingAverage:v13 * 0.6 + v12 * 0.4];
  [(SCROBrailleDisplayInput *)v8->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleTranslationTimeout:fmin(v14 * 3.5, 10.0)];
  input = v8->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandForwardDeleteKeyEvent:(id)a3 forDispatcher:(id)a4
{
  v16[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (![(SCROBrailleLine *)self->_brailleLine forwardDeleteAtCursor])
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v16[0] = v5;
    id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v16 count:1];
    [WeakRetained brailleDisplay:self pressedKeys:v7];
  }
  BOOL v8 = self;
  [(SCROBrailleDisplayInput *)v8->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleTranslationTimeout:1.0];
  double v9 = v8;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v8->_input lastBrailleChordPosted];
  double v12 = Current - v11;
  [(SCROBrailleDisplayInput *)v8->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleCharExponentialMovingAverage:v13 * 0.6 + v12 * 0.4];
  [(SCROBrailleDisplayInput *)v8->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleTranslationTimeout:fmin(v14 * 3.5, 10.0)];
  input = v8->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandEscapeKeyEvent:(id)a3 forDispatcher:(id)a4
{
  v25[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (!SCROCustomBrailleEnabled())
  {
    if (SCROJapaneseBrailleSelected())
    {
      double v11 = [MEMORY[0x263F2BA98] manager];
      if ([v11 isCandidateSelectionActive])
      {

LABEL_10:
        id WeakRetained = [MEMORY[0x263F2BA98] manager];
        [WeakRetained escapeCommand];
        goto LABEL_11;
      }
      double v12 = [MEMORY[0x263F2BA98] manager];
      double v13 = [v12 displayedBraille];
      char v14 = [v13 isStageEmpty];

      if ((v14 & 1) == 0) {
        goto LABEL_10;
      }
    }
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    id v24 = v5;
    double v9 = (void *)MEMORY[0x263EFF8C0];
    double v10 = &v24;
    goto LABEL_9;
  }
  int v6 = [MEMORY[0x263F2BA78] sharedModel];
  char v7 = [v6 handleEscape];

  if ((v7 & 1) == 0)
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    v25[0] = v5;
    double v9 = (void *)MEMORY[0x263EFF8C0];
    double v10 = (id *)v25;
LABEL_9:
    double v15 = [v9 arrayWithObjects:v10 count:1];
    [WeakRetained brailleDisplay:self pressedKeys:v15];

LABEL_11:
  }
  double v16 = self;
  [(SCROBrailleDisplayInput *)v16->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v16->_input setBrailleTranslationTimeout:1.0];
  double v17 = v16;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v16->_input lastBrailleChordPosted];
  double v20 = Current - v19;
  [(SCROBrailleDisplayInput *)v16->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v16->_input setBrailleCharExponentialMovingAverage:v21 * 0.6 + v20 * 0.4];
  [(SCROBrailleDisplayInput *)v16->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v16->_input setBrailleTranslationTimeout:fmin(v22 * 3.5, 10.0)];
  input = v16->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandReturnBrailleEvent:(id)a3 forDispatcher:(id)a4
{
  v23[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  if (SCROCustomBrailleEnabled())
  {
    int v6 = [MEMORY[0x263F2BA78] sharedModel];
    char v7 = [v6 handleReturn];

    if ((v7 & 1) == 0)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      v23[0] = v5;
      double v9 = (void *)MEMORY[0x263EFF8C0];
      double v10 = (id *)v23;
LABEL_8:
      double v13 = [v9 arrayWithObjects:v10 count:1];
      [WeakRetained brailleDisplay:self pressedKeys:v13];
    }
  }
  else if (!SCROJapaneseBrailleSelected() {
         || ([MEMORY[0x263F2BA98] manager],
  }
             double v11 = objc_claimAutoreleasedReturnValue(),
             char v12 = [v11 returnCommand],
             v11,
             (v12 & 1) == 0))
  {
    [(SCROBrailleDisplay *)self _translateBrailleStringAndPostEvent];
    if (v5)
    {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      id v22 = v5;
      double v9 = (void *)MEMORY[0x263EFF8C0];
      double v10 = &v22;
      goto LABEL_8;
    }
  }
  char v14 = self;
  [(SCROBrailleDisplayInput *)v14->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v14->_input setBrailleTranslationTimeout:1.0];
  double v15 = v14;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v14->_input lastBrailleChordPosted];
  double v18 = Current - v17;
  [(SCROBrailleDisplayInput *)v14->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v14->_input setBrailleCharExponentialMovingAverage:v19 * 0.6 + v18 * 0.4];
  [(SCROBrailleDisplayInput *)v14->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v14->_input setBrailleTranslationTimeout:fmin(v20 * 3.5, 10.0)];
  input = v14->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandWordDescriptionEvent:(id)a3 forDispatcher:(id)a4
{
  if (SCROJapaneseBrailleSelected())
  {
    id v5 = [MEMORY[0x263F2BA78] sharedModel];
    [v5 handleWordDescriptionCommand];
  }
  int v6 = self;
  [(SCROBrailleDisplayInput *)v6->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v6->_input setBrailleTranslationTimeout:1.0];
  double v13 = v6;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v6->_input lastBrailleChordPosted];
  double v9 = Current - v8;
  [(SCROBrailleDisplayInput *)v6->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v6->_input setBrailleCharExponentialMovingAverage:v10 * 0.6 + v9 * 0.4];
  [(SCROBrailleDisplayInput *)v6->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v6->_input setBrailleTranslationTimeout:fmin(v11 * 3.5, 10.0)];
  input = v6->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandTranslateForDispatcher:(id)a3
{
  [(SCROBrailleDisplay *)self _translateBrailleStringAndPostEvent];
  id v4 = self;
  [(SCROBrailleDisplayInput *)v4->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v4->_input setBrailleTranslationTimeout:1.0];
  double v11 = v4;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v4->_input lastBrailleChordPosted];
  double v7 = Current - v6;
  [(SCROBrailleDisplayInput *)v4->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v4->_input setBrailleCharExponentialMovingAverage:v8 * 0.6 + v7 * 0.4];
  [(SCROBrailleDisplayInput *)v4->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v4->_input setBrailleTranslationTimeout:fmin(v9 * 3.5, 10.0)];
  input = v4->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandToggleContractedBrailleEvent:(id)a3 forDispatcher:(id)a4
{
  id value = a3;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    double v6 = Mutable;
    CFArrayAppendValue(Mutable, value);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained brailleDisplay:self pressedKeys:v6];

    CFRelease(v6);
  }
  double v8 = self;
  [(SCROBrailleDisplayInput *)v8->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleTranslationTimeout:1.0];
  double v9 = v8;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v8->_input lastBrailleChordPosted];
  double v12 = Current - v11;
  [(SCROBrailleDisplayInput *)v8->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleCharExponentialMovingAverage:v13 * 0.6 + v12 * 0.4];
  [(SCROBrailleDisplayInput *)v8->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleTranslationTimeout:fmin(v14 * 3.5, 10.0)];
  input = v8->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleCommandToggleEightDotBrailleEvent:(id)a3 forDispatcher:(id)a4
{
  id value = a3;
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x263EFFF70]);
  if (Mutable)
  {
    double v6 = Mutable;
    CFArrayAppendValue(Mutable, value);
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [WeakRetained brailleDisplay:self pressedKeys:v6];

    CFRelease(v6);
  }
  double v8 = self;
  [(SCROBrailleDisplayInput *)v8->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleTranslationTimeout:1.0];
  double v9 = v8;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v8->_input lastBrailleChordPosted];
  double v12 = Current - v11;
  [(SCROBrailleDisplayInput *)v8->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleCharExponentialMovingAverage:v13 * 0.6 + v12 * 0.4];
  [(SCROBrailleDisplayInput *)v8->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v8->_input setBrailleTranslationTimeout:fmin(v14 * 3.5, 10.0)];
  input = v8->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (void)handleUnsupportedKeyEvent:(id)a3 forDispatcher:(id)a4
{
  id v4 = self;
  [(SCROBrailleDisplayInput *)v4->_input setBrailleCharExponentialMovingAverage:1.0];
  [(SCROBrailleDisplayInput *)v4->_input setBrailleTranslationTimeout:1.0];
  double v11 = v4;
  double Current = CFAbsoluteTimeGetCurrent();
  [(SCROBrailleDisplayInput *)v4->_input lastBrailleChordPosted];
  double v7 = Current - v6;
  [(SCROBrailleDisplayInput *)v4->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v4->_input setBrailleCharExponentialMovingAverage:v8 * 0.6 + v7 * 0.4];
  [(SCROBrailleDisplayInput *)v4->_input brailleCharExponentialMovingAverage];
  [(SCROBrailleDisplayInput *)v4->_input setBrailleTranslationTimeout:fmin(v9 * 3.5, 10.0)];
  input = v4->_input;

  [(SCROBrailleDisplayInput *)input setLastBrailleChordPosted:Current];
}

- (id)_newBrailleKeyForCurrentBrailleChord
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_alloc_init(SCROBrailleKey);
  [(SCROBrailleKey *)v3 setDisplayToken:[(SCROIOElementProtocol *)self->_ioElement identifier]];
  [(SCROBrailleKey *)v3 setDisplayMode:[(SCROBrailleLine *)self->_brailleLine displayMode]];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = [(SCROBrailleDisplayInput *)self->_input currentBrailleChord];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v11;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        -[SCROBrailleKey addKeyMask:](v3, "addKeyMask:", [*(id *)(*((void *)&v10 + 1) + 8 * v8++) unsignedIntValue]);
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }

  if ([(SCROBrailleDisplayInput *)self->_input currentBrailleChordContainsSpacebar])
  {
    [(SCROBrailleKey *)v3 addSpacebarKeyMask];
  }
  [(SCROBrailleKey *)v3 addModifierMask:[(SCROBrailleDisplayInput *)self->_input currentBrailleModifiers]];
  return v3;
}

- (id)_newBrailleKeyForCurrentKeyChord
{
  uint64_t v19 = *MEMORY[0x263EF8340];
  BOOL v3 = objc_alloc_init(SCROBrailleKey);
  [(SCROBrailleKey *)v3 setDisplayToken:[(SCROIOElementProtocol *)self->_ioElement identifier]];
  [(SCROBrailleKey *)v3 setDisplayMode:[(SCROBrailleLine *)self->_brailleLine displayMode]];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = [(SCROBrailleDisplayInput *)self->_input currentChord];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v14 + 1) + 8 * i) unsignedIntValue];
        if ((v9 & 0xF) != 0 && (v9 & 0xF) != 3) {
          [(SCROBrailleKey *)v3 addKeyMask:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  if ([(SCROBrailleDisplayInput *)self->_input routerEvent])
  {
    unsigned int v11 = [(SCROBrailleDisplayInput *)self->_input routerEvent];
    if ((v11 & 0xF) == 0)
    {
      uint64_t v13 = 0;
      [(NSLock *)self->_contentLock lock];
      if ([(SCROBrailleLine *)self->_brailleLine getStatusRouterIndex:&v13 forRawIndex:BYTE1(v11)])
      {
        unsigned int v11 = v11 & 0xFFFFFFF0 | 3;
      }
      [(NSLock *)self->_contentLock unlock];
    }
    [(SCROBrailleKey *)v3 addKeyMask:v11 & 0xFFFF00FF];
  }
  return v3;
}

- (id)newBrailleKeyboardKeyForText:(id)a3 modifiers:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = objc_alloc_init(SCROBrailleKeyboardKey);
  [(SCROBrailleKey *)v7 setDisplayToken:[(SCROIOElementProtocol *)self->_ioElement identifier]];
  [(SCROBrailleKey *)v7 setDisplayMode:[(SCROBrailleLine *)self->_brailleLine displayMode]];
  [(SCROBrailleKeyboardKey *)v7 setKeyString:v6];
  [(SCROBrailleKeyboardKey *)v7 setModifiers:v4];
  if ([v6 length] == 1 && *MEMORY[0x263F2BAF0] != v4)
  {
    uint64_t v8 = (__CFString *)[v6 mutableCopy];
    CFStringTransform(v8, 0, (CFStringRef)*MEMORY[0x263EFFF58], 0);
    CFStringTransform(v8, 0, (CFStringRef)*MEMORY[0x263EFFF48], 0);
    if ([(__CFString *)v8 length])
    {
      uint64_t v9 = [(__CFString *)v8 lowercaseString];
      int v10 = [v9 characterAtIndex:0];

      __int16 v15 = v10;
      if ((v10 - 97) > 0x19)
      {
        if ((v10 - 49) > 8)
        {
          long long v12 = [NSString stringWithCharacters:&v15 length:1];
          uint64_t v13 = [&unk_26CCF1858 objectForKey:v12];

          if (v13) {
            -[SCROBrailleKeyboardKey setKeyCode:](v7, "setKeyCode:", [v13 unsignedIntegerValue]);
          }

          goto LABEL_12;
        }
        uint64_t v11 = (v10 - 19);
      }
      else
      {
        uint64_t v11 = (v10 - 93);
      }
      [(SCROBrailleKeyboardKey *)v7 setKeyCode:v11];
    }
LABEL_12:
  }
  return v7;
}

- (void)brailleDriverDidReceiveInput
{
  runLoop = self->_runLoop;
  uint64_t v4 = (const void *)*MEMORY[0x263EFFE88];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SCROBrailleDisplay_brailleDriverDidReceiveInput__block_invoke;
  block[3] = &unk_264414590;
  block[4] = self;
  CFRunLoopPerformBlock(runLoop, v4, block);
  CFRunLoopWakeUp(self->_runLoop);
}

uint64_t __50__SCROBrailleDisplay_brailleDriverDidReceiveInput__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _inputEventHandler];
}

- (void)_inputEventHandler
{
  [(NSLock *)self->_contentLock lock];
  id v34 = [(SCROBrailleDriverProtocol *)self->_brailleDriver getInputEvents];
  [(NSLock *)self->_contentLock unlock];
  if ([v34 count]) {
    [(SCROBrailleDisplay *)self _processKeyEvents:v34];
  }
  double Current = CFAbsoluteTimeGetCurrent();
  if (![(SCROBrailleDisplayInput *)self->_input currentChord]
    && ![(SCROBrailleDisplayInput *)self->_input currentBrailleChord]
    && ![(SCROBrailleDisplayInput *)self->_input currentBrailleChordContainsSpacebar])
  {
    unsigned int v4 = [(SCROBrailleDisplayInput *)self->_input currentBrailleModifiers];
    if (v4 == *MEMORY[0x263F2BAF0])
    {
      [(SCROBrailleDisplayInput *)self->_input quietSince];
      if (Current - v5 < 2.0
        || [(SCROBrailleDisplayInput *)self->_input memorizeNextKeyImmediately])
      {
        inputEventTimer = self->_inputEventTimer;
        CFAbsoluteTime v7 = CFAbsoluteTimeGetCurrent();
        CFRunLoopTimerSetNextFireDate(inputEventTimer, v7 + 0.01);
      }
      BOOL v8 = [(SCROBrailleDisplayInput *)self->_input isQuiet];
      input = self->_input;
      if (!v8)
      {
        [(SCROBrailleDisplayInput *)input setQuietSince:Current];
        input = self->_input;
      }
      [(SCROBrailleDisplayInput *)input setIsQuiet:1];
      BOOL v10 = [(SCROBrailleDisplayInput *)self->_input memorizeNextKeyImmediately];
      uint64_t v11 = self->_input;
      if (v10)
      {
        [(SCROBrailleDisplayInput *)v11 memorizeNextKeyImmediatelyTimeout];
        if (Current > v12) {
          [(SCROBrailleDisplayInput *)self->_input setMemorizeNextKeyImmediately:0];
        }
      }
      else if ([(SCROBrailleDisplayInput *)v11 requestPrepareToMemorizeNextKey])
      {
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        [WeakRetained brailleDisplay:self memorizedKey:0];

        [(SCROBrailleDisplayInput *)self->_input setPrepareToMemorizeNextKey:1];
        [(SCROBrailleDisplayInput *)self->_input setRequestPrepareToMemorizeNextKey:0];
      }
      goto LABEL_43;
    }
  }
  uint64_t v13 = self->_inputEventTimer;
  CFAbsoluteTime v14 = CFAbsoluteTimeGetCurrent();
  CFRunLoopTimerSetNextFireDate(v13, v14 + 0.01);
  if ([(SCROBrailleDisplayInput *)self->_input isQuiet]) {
    [(SCROBrailleDisplayInput *)self->_input setBusySince:Current];
  }
  [(SCROBrailleDisplayInput *)self->_input setIsQuiet:0];
  if ([(SCROBrailleDisplayInput *)self->_input prepareToMemorizeNextKey]) {
    double v15 = *(double *)&kSCROBrailleInputMemorizeHoldInterval;
  }
  else {
    double v15 = 60.0;
  }
  [(SCROBrailleDisplayInput *)self->_input busySince];
  double v17 = Current - v16;
  double v18 = self->_input;
  if (Current - v16 > v15)
  {
    CFSetRemoveAllValues([(SCROBrailleDisplayInput *)v18 downKeys]);
    if ([(SCROBrailleDisplayInput *)self->_input prepareToMemorizeNextKey])
    {
      if ([(SCROBrailleDisplay *)self _hasKeyChord])
      {
        if (![(SCROBrailleDisplay *)self _hasPressedBrailleKeys])
        {
          id v19 = [(SCROBrailleDisplay *)self _newBrailleKeyForCurrentKeyChord];
LABEL_33:
          uint64_t v23 = v19;
LABEL_35:
          if ([(SCROBrailleDisplayInput *)self->_input currentChord])
          {
            CFRelease([(SCROBrailleDisplayInput *)self->_input currentChord]);
            [(SCROBrailleDisplayInput *)self->_input setCurrentChord:0];
          }
          [(SCROBrailleDisplayInput *)self->_input setRouterEvent:0];
          [(SCROBrailleDisplayInput *)self->_input setNewDown:0];
          [(SCROBrailleDisplayInput *)self->_input setQuietSince:-3061152000.0];
          [(SCROBrailleDisplayInput *)self->_input setIsQuiet:1];
          [(SCROBrailleDisplay *)self _stopMemorization];
          [(SCROBrailleDisplayInput *)self->_input setSkipBrailleKeyboardKeyTranslation:0];
          if (v23)
          {
            id v24 = objc_loadWeakRetained((id *)&self->_delegate);
            [v24 brailleDisplay:self memorizedKey:v23];
          }
          CFSetRemoveAllValues([(SCROBrailleDisplayInput *)self->_input downBrailleDots]);
          if ([(SCROBrailleDisplayInput *)self->_input currentBrailleChord])
          {
            CFRelease([(SCROBrailleDisplayInput *)self->_input currentBrailleChord]);
            [(SCROBrailleDisplayInput *)self->_input setCurrentBrailleChord:0];
          }
          [(SCROBrailleDisplayInput *)self->_input setSpacebarIsDown:0];
          [(SCROBrailleDisplayInput *)self->_input setCurrentBrailleChordContainsSpacebar:0];
          [(SCROBrailleDisplayInput *)self->_input setCurrentBrailleChordBeganWithSpacebar:0];
          [(SCROBrailleDisplayInput *)self->_input setSkipBrailleKeyboardKeyTranslation:0];
          uint64_t v25 = *MEMORY[0x263F2BAF0];
          [(SCROBrailleDisplayInput *)self->_input setDownBrailleModifiers:v25];
          [(SCROBrailleDisplayInput *)self->_input setCurrentBrailleModifiers:v25];
          goto LABEL_42;
        }
      }
      else if ([(SCROBrailleDisplay *)self _hasBrailleChord])
      {
        id v19 = [(SCROBrailleDisplay *)self _newBrailleKeyForCurrentBrailleChord];
        goto LABEL_33;
      }
    }
    uint64_t v23 = 0;
    goto LABEL_35;
  }
  BOOL v20 = [(SCROBrailleDisplayInput *)v18 prepareToMemorizeNextKey];
  if (v17 > 0.5 && v20)
  {
    [(SCROBrailleDisplayInput *)self->_input nextWillMemorizeNotificationTime];
    if (Current > v21)
    {
      if ([(SCROBrailleDisplay *)self _hasKeyChord])
      {
        if ([(SCROBrailleDisplay *)self _hasPressedBrailleKeys]) {
          goto LABEL_43;
        }
        id v22 = [(SCROBrailleDisplay *)self _newBrailleKeyForCurrentKeyChord];
      }
      else
      {
        if (![(SCROBrailleDisplay *)self _hasBrailleChord]) {
          goto LABEL_43;
        }
        id v22 = [(SCROBrailleDisplay *)self _newBrailleKeyForCurrentBrailleChord];
      }
      uint64_t v23 = v22;
      if (v22)
      {
        [(SCROBrailleDisplayInput *)self->_input setNextWillMemorizeNotificationTime:Current + *(double *)&kSCROBrailleInputMemorizePulseInterval];
        id v32 = objc_loadWeakRetained((id *)&self->_delegate);
        [v32 brailleDisplay:self willMemorizeKey:v23];

        [(SCROBrailleDisplayInput *)self->_input setWillMemorizeNow:1];
LABEL_42:
      }
    }
  }
LABEL_43:
  v26 = +[SCROBrailleTranslationManager sharedManager];
  int v27 = SCROCustomBrailleEnabled();
  BOOL v28 = [(SCROBrailleDisplayInput *)self->_input currentBrailleChord];
  if (v27)
  {
    if (v28
      || [(SCROBrailleDisplayInput *)self->_input spacebarIsDown]
      || ![(SCROBrailleLine *)self->_brailleLine hasEdits])
    {
      goto LABEL_58;
    }
LABEL_55:
    if (!self->_automaticBrailleTranslationEnabled) {
      goto LABEL_58;
    }
    [(SCROBrailleDisplayInput *)self->_input lastBrailleChordPosted];
    double v30 = Current - v29;
    [(SCROBrailleDisplayInput *)self->_input brailleTranslationTimeout];
    if (v30 <= v31) {
      goto LABEL_58;
    }
LABEL_57:
    [(SCROBrailleDisplay *)self _translateBrailleStringAndPostEvent];
    goto LABEL_58;
  }
  if (!v28
    && ![(SCROBrailleDisplayInput *)self->_input spacebarIsDown]
    && [(SCROBrailleLine *)self->_brailleLine hasEdits])
  {
    if ([(SCROBrailleDisplay *)self isInputEightDot]
      && [v26 primaryTableSupportsEightDotBraille]
      && (![(SCROBrailleDisplay *)self isInputContracted]
       || ![v26 primaryTableSupportsContractedBraille]))
    {
      goto LABEL_57;
    }
    goto LABEL_55;
  }
LABEL_58:
}

- (void)_blinkerEventHandler
{
  if (self->_isValid)
  {
    [(NSLock *)self->_contentLock lock];
    if (!self->_shouldBatchUpdates || ![(SCROBrailleLine *)self->_brailleLine needsDisplayFlush]) {
      [(SCROBrailleLine *)self->_brailleLine blinker];
    }
    [(NSLock *)self->_contentLock unlock];
  }
}

- (void)_unloadNotification:(id)a3
{
}

- (void)_delayedUnloadNotification
{
  eventDispatcher = self->_eventDispatcher;
  id v3 = +[SCROBrailleEvent eventWithType:24 data:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v3];
}

- (void)_configurationChangeNotification:(id)a3
{
}

- (void)_delayedConfigurationChangeNotification
{
  eventDispatcher = self->_eventDispatcher;
  id v3 = +[SCROBrailleEvent eventWithType:26 data:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v3];
}

- (void)_sleepNotification:(id)a3
{
  id v5 = [a3 userInfo];
  unsigned int v4 = [v5 objectForKey:@"SCROBrailleDriverProtocolSleepNotificationIsSleepingKey"];
  [(SCROBrailleDisplay *)self performSelector:sel__delayedSleepNotification_ withObject:v4 afterDelay:0.0];
}

- (void)_delayedSleepNotification:(id)a3
{
  eventDispatcher = self->_eventDispatcher;
  id v4 = +[SCROBrailleEvent eventWithType:25 data:a3];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v4];
}

- (void)didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  eventDispatcher = self->_eventDispatcher;
  CFAbsoluteTime v7 = (objc_class *)MEMORY[0x263F2BA88];
  id v8 = a3;
  id v11 = (id)[[v7 alloc] initWithUnicode:v8];

  uint64_t v9 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", location, length);
  BOOL v10 = +[SCROBrailleEvent eventWithType:45 data:v11 data2:v9 data3:0];
  [(SCROBrailleEventDispatcher *)eventDispatcher enqueueEvent:v10];
}

- (void)_brailleDisplayStringDidChangeHandler:(id)a3 brailleSelection:(id)a4
{
  brailleLine = self->_brailleLine;
  id v8 = a3;
  uint64_t v6 = [a4 rangeValue];
  -[SCROBrailleLine brailleDisplayStringDidChange:brailleSelection:modifiers:](brailleLine, "brailleDisplayStringDidChange:brailleSelection:modifiers:", v8, v6, v7, 0);
}

- (void)replaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(unint64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = [a4 string];
  -[SCROBrailleDisplay _replaceRange:withString:cursor:](self, "_replaceRange:withString:cursor:", location, length, v9, a5);
}

- (void)scriptSelectionDidChange:(_NSRange)a3
{
  NSUInteger location = a3.location;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained brailleDisplay:self didMoveSelection:location];
}

- (void)didInsertScriptString:(id)a3
{
  v9[1] = *MEMORY[0x263EF8340];
  input = self->_input;
  id v5 = a3;
  id v6 = [(SCROBrailleDisplay *)self newBrailleKeyboardKeyForText:v5 modifiers:self->_persistentKeyModifiers | [(SCROBrailleDisplayInput *)input currentBrailleModifiers]];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v9[0] = v6;
  id v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v9 count:1];
  [WeakRetained brailleDisplay:self pressedKeys:v8];
}

- (void)brailleDisplayInsertedCharacter:(id)a3 modifiers:(id)a4
{
  unsigned __int8 v10 = 0;
  id v6 = a4;
  uint64_t v7 = [a3 unicode];
  id v8 = +[SCROBrailleTranslationUtility spokenStringForInsertedBrailleString:v7 speakLiterally:&v10 modifiers:v6];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained brailleDisplay:self insertedUntranslatedText:v8 speakLiterally:v10];
}

- (void)brailleDisplayDeletedCharacter:(id)a3
{
  unsigned __int8 v7 = 0;
  id v4 = [a3 unicode];
  id v5 = +[SCROBrailleTranslationUtility spokenStringForDeletedBrailleString:v4 speakLiterally:&v7];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained brailleDisplay:self deletedUntranslatedText:v5 speakLiterally:v7];
}

- (void)handlePlanarPanFailedIsLeft:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained handlePlanarPanFailedIsLeft:v3];
}

- (int)inputContractionMode
{
  return ![(SCROBrailleDisplay *)self isInputContracted];
}

- (void)setInputContractionMode:(int)a3
{
  BOOL v4 = a3 == 0;
  if (a3) {
    id v5 = @"com.apple.scrod.braille.table.duxbury.eng-xueb_g1";
  }
  else {
    id v5 = @"com.apple.scrod.braille.table.duxbury.eng-xueb_g2";
  }
  objc_storeStrong((id *)&self->_inputTableIdentifier, v5);
  self->_isInputContracted = v4;
  self->_isInputEightDot = 0;
  id v7 = +[SCROBrailleTranslationManager inputManager];
  id v6 = [(NSString *)self->_inputTableIdentifier brl_languageAndVariant];
  [v7 setDefaultLanguage:v6];
}

- (int)outputContractionMode
{
  return ![(SCROBrailleDisplay *)self isInputContracted];
}

- (void)setOutputContractionMode:(int)a3
{
  if (a3) {
    BOOL v4 = @"com.apple.scrod.braille.table.duxbury.eng-xueb_g1";
  }
  else {
    BOOL v4 = @"com.apple.scrod.braille.table.duxbury.eng-xueb_g2";
  }
  objc_storeStrong((id *)&self->_outputTableIdentifier, v4);
  id v6 = +[SCROBrailleTranslationManager sharedManager];
  id v5 = [(NSString *)self->_outputTableIdentifier brl_languageAndVariant];
  [v6 setDefaultLanguage:v5];
}

- (void)setInputShowEightDot:(BOOL)a3
{
  if (a3) {
    id v5 = @"com.apple.scrod.braille.table.duxbury.eng-8dot";
  }
  else {
    id v5 = @"com.apple.scrod.braille.table.duxbury.eng-xueb_g2";
  }
  objc_storeStrong((id *)&self->_inputTableIdentifier, v5);
  self->_isInputEightDot = a3;
  self->_isInputContracted = !a3;
  id v7 = +[SCROBrailleTranslationManager inputManager];
  id v6 = [(NSString *)self->_inputTableIdentifier brl_languageAndVariant];
  [v7 setDefaultLanguage:v6];
}

- (void)setOutputShowEightDot:(BOOL)a3
{
  if (a3) {
    BOOL v4 = @"com.apple.scrod.braille.table.duxbury.eng-8dot";
  }
  else {
    BOOL v4 = @"com.apple.scrod.braille.table.duxbury.eng-xueb_g2";
  }
  objc_storeStrong((id *)&self->_outputTableIdentifier, v4);
  id v6 = +[SCROBrailleTranslationManager sharedManager];
  id v5 = [(NSString *)self->_outputTableIdentifier brl_languageAndVariant];
  [v6 setDefaultLanguage:v5];
}

- (BOOL)inputAllowed
{
  return self->_inputAllowed;
}

- (BOOL)automaticBrailleTranslationEnabled
{
  return self->_automaticBrailleTranslationEnabled;
}

- (void)setAutomaticBrailleTranslationEnabled:(BOOL)a3
{
  self->_automaticBrailleTranslationEnabled = a3;
}

- (double)autoAdvanceDuration
{
  return self->_autoAdvanceDuration;
}

- (BOOL)blinkingCursorEnabled
{
  return self->_blinkingCursorEnabled;
}

- (SCRO2DBrailleData)planarData
{
  return self->_planarData;
}

- (NSString)outputTableIdentifier
{
  return self->_outputTableIdentifier;
}

- (NSString)inputTableIdentifier
{
  return self->_inputTableIdentifier;
}

- (unsigned)persistentKeyModifiers
{
  return self->_persistentKeyModifiers;
}

- (void)setPersistentKeyModifiers:(unsigned int)a3
{
  self->_persistentKeyModifiers = a3;
}

- (id)eventHandled
{
  return self->_eventHandled;
}

- (void)setEventHandled:(id)a3
{
}

- (double)brailleKeyDebounceTimeout
{
  return self->_brailleKeyDebounceTimeout;
}

- (NSTimer)autoAdvanceTimer
{
  return self->_autoAdvanceTimer;
}

- (void)setAutoAdvanceTimer:(id)a3
{
}

- (BOOL)isInputEightDot
{
  return self->_isInputEightDot;
}

- (BOOL)isInputContracted
{
  return self->_isInputContracted;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_autoAdvanceTimer, 0);
  objc_storeStrong(&self->_eventHandled, 0);
  objc_storeStrong((id *)&self->_inputTableIdentifier, 0);
  objc_storeStrong((id *)&self->_outputTableIdentifier, 0);
  objc_storeStrong((id *)&self->_planarData, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong((id *)&self->_keyEventsQueue, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_driverModelIdentifier, 0);
  objc_storeStrong((id *)&self->_driverIdentifier, 0);
  objc_storeStrong((id *)&self->_brailleLine, 0);
  objc_storeStrong((id *)&self->_ioElement, 0);
  objc_storeStrong((id *)&self->_brailleDriver, 0);
  objc_storeStrong((id *)&self->_commandDispatcher, 0);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_contentLock, 0);
}

- (void)_blinkingCursorSetting
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"Boolean soft__AXSPrefersNonBlinkingCursorIndicator(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SCROBrailleDisplay.m", 34, @"%s", dlerror());

  __break(1u);
}

@end