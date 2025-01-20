@interface SCROBrailleDisplayManager
+ (id)sharedManager;
+ (void)_setSharedManager:(id)a3;
+ (void)initialize;
- (BOOL)_eventQueue_addDetectedIOElement:(id)a3 withDriverIdentifier:(id)a4;
- (BOOL)_isIOElementHID:(id)a3;
- (BOOL)alwaysUsesNemethCodeForTechnicalText;
- (BOOL)autoAdvanceEnabled;
- (BOOL)automaticBrailleTranslation;
- (BOOL)blinkingCursorEnabled;
- (BOOL)hasActiveUserDisplays;
- (BOOL)inputEightDotBraille;
- (BOOL)isCandidateSelectionOn;
- (BOOL)isConfigured;
- (BOOL)isValid;
- (BOOL)isWordDescriptionOn;
- (BOOL)lineDescriptorDisplayCallbackEnabled;
- (BOOL)showDotsSevenAndEight;
- (BOOL)showEightDotBraille;
- (BOOL)wordWrapEnabled;
- (SCROBrailleDisplayManagedQueue)managedDisplayQueue;
- (SCROBrailleDisplayManager)init;
- (SCROSBrailleDisplayManagerDelegate)delegate;
- (_NSRange)rangeOfBrailleCellRepresentingCharacterAtIndex:(unint64_t)a3;
- (double)autoAdvanceDuration;
- (double)lastUserInteractionTime;
- (id)_displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5;
- (id)_eventQueue_activeDisplayForToken:(int)a3;
- (id)_eventQueue_cachedMainStringForDisplayMode:(int)a3;
- (id)_eventQueue_driverConfiguration;
- (id)_eventQueue_mainAttributedString;
- (id)_eventQueue_mainCellsForVirtualDisplay:(unint64_t)a3;
- (id)aggregatedStatus;
- (id)brailleInputManager;
- (id)driverConfiguration;
- (id)eventHandled;
- (id)mainAttributedString;
- (id)mainCellsForVirtualDisplay:(unint64_t)a3;
- (id)newBrailleDisplayCommandDispatcher;
- (int)contractionMode;
- (int)displayInputAccessMode;
- (int)displayMode;
- (int)inputContractionMode;
- (int)virtualStatusAlignment;
- (int64_t)masterStatusCellIndex;
- (int64_t)tokenForRouterIndex:(int64_t)a3 location:(int64_t *)a4 appToken:(id *)a5 forDisplayWithToken:(int)a6;
- (unint64_t)_eventQueue_loadVirtualDisplay:(id)a3;
- (unint64_t)loadVirtualDisplayWithMainSize:(int64_t)a3;
- (unint64_t)numberOfTextLinesInPlanarBraille;
- (unint64_t)systemVirtualDisplayToken;
- (unsigned)persistentKeyModifiers;
- (void)_addDetectedIOElement:(id)a3 withDriverIdentifier:(id)a4;
- (void)_blankOutDisplaysInQueue:(id)a3;
- (void)_deviceConnectedHandler:(id)a3;
- (void)_disableAutoDetect;
- (void)_enableAutoDetect;
- (void)_enumerateActiveDisplays:(id)a3;
- (void)_eventQueue_alertTimeoutHandler;
- (void)_eventQueue_brailleDisplay:(id)a3 isSleeping:(BOOL)a4;
- (void)_eventQueue_brailleDisplayDriverDidLoad:(id)a3;
- (void)_eventQueue_brailleDisplayDriverFailedToLoad:(id)a3;
- (void)_eventQueue_brailleDriverDisconnected:(id)a3;
- (void)_eventQueue_didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4;
- (void)_eventQueue_doSetDisplayMode:(int)a3;
- (void)_eventQueue_exitCurrentDisplayMode;
- (void)_eventQueue_fireAlertTimeoutHandler;
- (void)_eventQueue_invalidate;
- (void)_eventQueue_loadNextDriverForIOElement:(id)a3;
- (void)_eventQueue_loadStealthDisplay;
- (void)_eventQueue_panDisplay:(int64_t)a3 token:(int)a4;
- (void)_eventQueue_planarPanDisplay:(int64_t)a3 token:(int)a4;
- (void)_eventQueue_popDisplayModeStack;
- (void)_eventQueue_prepareToMemorizeNextKey:(BOOL)a3 immediately:(BOOL)a4 forDisplayWithToken:(int)a5;
- (void)_eventQueue_resetAlertTimer;
- (void)_eventQueue_resetEditingManager;
- (void)_eventQueue_setAggregatedStatus:(id)a3;
- (void)_eventQueue_setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3;
- (void)_eventQueue_setAutoAdvanceDuration:(double)a3;
- (void)_eventQueue_setAutoAdvanceEnabled:(BOOL)a3;
- (void)_eventQueue_setAutomaticBrailleTranslationEnabled:(BOOL)a3;
- (void)_eventQueue_setBatchUpdates:(BOOL)a3;
- (void)_eventQueue_setBrailleKeyDebounceTimeout:(double)a3;
- (void)_eventQueue_setDisplayInputAccessMode:(int)a3;
- (void)_eventQueue_setDisplayMode:(int)a3;
- (void)_eventQueue_setInputTableWithIdentifier:(id)a3;
- (void)_eventQueue_setLineDescriptorCallbackEnabled:(BOOL)a3;
- (void)_eventQueue_setMainAttributedString:(id)a3 shouldDisplay:(BOOL)a4 forceUpdate:(BOOL)a5;
- (void)_eventQueue_setMasterStatusCellIndex:(int64_t)a3;
- (void)_eventQueue_setPersistentKeyModifiers:(unsigned int)a3;
- (void)_eventQueue_setPlanarData:(id)a3;
- (void)_eventQueue_setPrimaryDisplay:(int)a3;
- (void)_eventQueue_setSingleLetterInputIsOn:(BOOL)a3;
- (void)_eventQueue_setTableIdentifier:(id)a3;
- (void)_eventQueue_setTactileGraphicsImageData:(id)a3;
- (void)_eventQueue_setTextSearchModeIsOn:(BOOL)a3;
- (void)_eventQueue_setVirtualStatusAlignment:(int)a3;
- (void)_eventQueue_setWordWrapEnabled:(BOOL)a3;
- (void)_eventQueue_showDotsSevenAndEight:(BOOL)a3;
- (void)_eventQueue_showNextAnnouncement:(BOOL)a3;
- (void)_eventQueue_simulateKeypress:(id)a3;
- (void)_eventQueue_stopAlertTimer;
- (void)_eventQueue_translateBrailleToClipboard;
- (void)_eventQueue_unloadStealthDisplay;
- (void)_eventQueue_unloadVirtualDisplay:(unint64_t)a3;
- (void)_eventQueue_virtualDisplay:(unint64_t)a3 pressButton:(unint64_t)a4;
- (void)_eventQueue_virtualDisplay:(unint64_t)a3 pressKeyChord:(unint64_t)a4;
- (void)_eventQueue_virtualDisplay:(unint64_t)a3 pressRouterWithIndex:(unint64_t)a4;
- (void)_loadNextDriverForIOElement:(id)a3;
- (void)_loadStealthDisplay;
- (void)_mainQueue_invalidate;
- (void)_setBrailleFormatter:(id)a3;
- (void)_startAutodetectingTactileGraphics;
- (void)_unloadStealthDisplay;
- (void)_updateTactileGraphicsDisplay;
- (void)beginUpdates;
- (void)brailleDidStartEditingWithDisplay:(id)a3;
- (void)brailleDisplay:(id)a3 copyStringToClipboard:(id)a4;
- (void)brailleDisplay:(id)a3 deletedUntranslatedText:(id)a4 speakLiterally:(BOOL)a5;
- (void)brailleDisplay:(id)a3 didDisplay:(id)a4;
- (void)brailleDisplay:(id)a3 didPanLeft:(id)a4 elementToken:(id)a5 appToken:(id)a6 lineOffset:(id)a7;
- (void)brailleDisplay:(id)a3 didPanRight:(id)a4 elementToken:(id)a5 appToken:(id)a6 lineOffset:(id)a7;
- (void)brailleDisplay:(id)a3 didReplaceRange:(_NSRange)a4 withString:(id)a5 cursor:(unint64_t)a6;
- (void)brailleDisplay:(id)a3 driverDidLoad:(BOOL)a4;
- (void)brailleDisplay:(id)a3 insertedUntranslatedText:(id)a4 speakLiterally:(BOOL)a5;
- (void)brailleDisplay:(id)a3 isSleeping:(BOOL)a4;
- (void)brailleDisplay:(id)a3 memorizedKey:(id)a4;
- (void)brailleDisplay:(id)a3 pressedKeys:(id)a4;
- (void)brailleDisplay:(id)a3 willMemorizeKey:(id)a4;
- (void)brailleDisplayHadUserInteraction:(id)a3;
- (void)brailleDriverDisconnected:(id)a3;
- (void)cancelCandidateSelection;
- (void)clearTimeoutAlert;
- (void)configurationChangedForBrailleDisplay:(id)a3;
- (void)configureInputTableWithIdentifier:(id)a3;
- (void)configureTableWithIdentifier:(id)a3;
- (void)didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4;
- (void)didDeleteBrailleChar:(id)a3;
- (void)didInsertScriptString:(id)a3;
- (void)didReplaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(int64_t)a5;
- (void)endUpdates;
- (void)exitCurrentDisplayMode;
- (void)handlePlanarPanFailedIsLeft:(BOOL)a3;
- (void)invalidate;
- (void)loadBLEDriverWithIdentifier:(id)a3;
- (void)panDisplayBeginning:(int)a3;
- (void)panDisplayEnd:(int)a3;
- (void)panDisplayLeft:(int)a3;
- (void)panDisplayRight:(int)a3;
- (void)planarPanDisplayLeft:(int)a3;
- (void)planarPanDisplayRight:(int)a3;
- (void)playBorderHitSoundForBrailleDisplay:(id)a3;
- (void)playCommandNotSupportedSoundForBrailleDisplay:(id)a3;
- (void)requestSpeech:(id)a3 language:(id)a4;
- (void)resetEditingManager;
- (void)setAggregatedStatus:(id)a3;
- (void)setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3;
- (void)setAnnouncementsDisplayMode;
- (void)setAutoAdvanceDuration:(double)a3;
- (void)setAutoAdvanceEnabled:(BOOL)a3;
- (void)setAutomaticBrailleTranslationEnabled:(BOOL)a3;
- (void)setBlinkingCursorEnabled:(BOOL)a3;
- (void)setBrailleKeyDebounceTimeout:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayInputAccessMode:(int)a3;
- (void)setEventHandled:(id)a3;
- (void)setLastUserInteractionTime:(double)a3;
- (void)setLineDescriptorDisplayCallbackEnabled:(BOOL)a3;
- (void)setMainAttributedString:(id)a3;
- (void)setMainAttributedString:(id)a3 forceUpdate:(BOOL)a4;
- (void)setMasterStatusCellIndex:(int64_t)a3;
- (void)setPersistentKeyModifiers:(unsigned int)a3;
- (void)setPlanarData:(id)a3;
- (void)setPrepareToMemorizeNextKey:(BOOL)a3 immediate:(BOOL)a4 forDisplayWithToken:(int)a5;
- (void)setPrimaryBrailleDisplay:(int)a3;
- (void)setShowDotsSevenAndEight:(BOOL)a3;
- (void)setSingleLetterInputIsOn:(BOOL)a3;
- (void)setSystemVirtualDisplayToken:(unint64_t)a3;
- (void)setTactileGraphicsImageData:(id)a3;
- (void)setTextSearchModeIsOn:(BOOL)a3;
- (void)setUIDisplayMode;
- (void)setVirtualStatusAlignment:(int)a3;
- (void)setWordWrapEnabled:(BOOL)a3;
- (void)showNextAnnouncement;
- (void)showNextCandidate;
- (void)showNextWordDescription;
- (void)showPreviousAnnouncement;
- (void)showPreviousCandidate;
- (void)showPreviousWordDescription;
- (void)simulateKeypress:(id)a3;
- (void)systemVirtualDisplayPressKeyChord:(unint64_t)a3;
- (void)tokenizeString:(id)a3 intoFormatter:(id)a4 selection:(_NSRange *)a5;
- (void)translateBrailleToClipboard;
- (void)unloadVirtualDisplay:(unint64_t)a3;
- (void)virtualDisplay:(unint64_t)a3 pressButton:(unint64_t)a4;
- (void)virtualDisplay:(unint64_t)a3 pressKeyChord:(unint64_t)a4;
- (void)virtualDisplay:(unint64_t)a3 pressRouterWithIndex:(unint64_t)a4;
@end

@implementation SCROBrailleDisplayManager

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    id v2 = (id)[MEMORY[0x263F086E0] brailleDriverBundles];
  }
}

- (SCROBrailleDisplayManager)init
{
  v28.receiver = self;
  v28.super_class = (Class)SCROBrailleDisplayManager;
  id v2 = [(SCROBrailleDisplayManager *)&v28 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    dispatch_queue_t v4 = dispatch_queue_create("display manager event queue", v3);
    eventQueue = v2->_eventQueue;
    v2->_eventQueue = (OS_dispatch_queue *)v4;

    id v6 = objc_alloc(NSDictionary);
    v7 = objc_msgSend(v6, "initWithObjectsAndKeys:", &unk_26CCF1138, kSCROTokenAttribute[0], 0);
    uint64_t v8 = [objc_alloc(MEMORY[0x263F086A0]) initWithString:@" " attributes:v7];
    blankUIString = v2->_blankUIString;
    v2->_blankUIString = (NSAttributedString *)v8;

    v10 = objc_alloc_init(SCROBrailleDisplayManagedQueue);
    managedDisplayQueue = v2->_managedDisplayQueue;
    v2->_managedDisplayQueue = v10;

    [(SCROBrailleDisplayManagedQueue *)v2->_managedDisplayQueue setActiveQueueMaximumSize:1];
    v2->_displayConfigurationDict = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x263EFFB08], 0, 0, MEMORY[0x263EFFF90]);
    v12 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    detectedIOElementsDict = v2->_detectedIOElementsDict;
    v2->_detectedIOElementsDict = v12;

    v14 = (NSMutableSet *)objc_alloc_init(MEMORY[0x263EFF9C0]);
    loadedIOElements = v2->_loadedIOElements;
    v2->_loadedIOElements = v14;

    inputTableIdentifier = v2->_inputTableIdentifier;
    v2->_inputTableIdentifier = (NSString *)&stru_26CCE0B50;

    outputTableIdentifier = v2->_outputTableIdentifier;
    v2->_outputTableIdentifier = (NSString *)&stru_26CCE0B50;

    v2->_showDotsSevenAndEight = 1;
    v2->_automaticBrailleTranslation = 1;
    v18 = objc_alloc_init(SCROBrailleDisplayManagerStatus);
    status = v2->_status;
    v2->_status = v18;

    [(SCROBrailleDisplayManagerStatus *)v2->_status setVirtualAlignment:0];
    [(SCROBrailleDisplayManagerStatus *)v2->_status setMasterStatusCellIndex:0];
    v2->_inputAccessMode = 0;
    uint64_t v20 = [objc_alloc(MEMORY[0x263EFF980]) initWithCapacity:3];
    displayModeStack = v2->_displayModeStack;
    v2->_displayModeStack = (NSMutableArray *)v20;

    v22 = objc_alloc_init(SCROBrailleDisplayHistory);
    history = v2->_history;
    v2->_history = v22;

    v2->_isValid = 0;
    uint64_t v24 = objc_opt_new();
    virtualDisplays = v2->_virtualDisplays;
    v2->_virtualDisplays = (NSMutableDictionary *)v24;

    v26 = [MEMORY[0x263F2BA78] sharedModel];
    [v26 setDelegate:v2];
  }
  return v2;
}

+ (id)sharedManager
{
  return (id)sharedManager;
}

+ (void)_setSharedManager:(id)a3
{
}

- (void)invalidate
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (self->_isValid)
  {
    self->_isValid = 0;
    eventQueue = self->_eventQueue;
    block[0] = MEMORY[0x263EF8330];
    block[1] = 3221225472;
    block[2] = __39__SCROBrailleDisplayManager_invalidate__block_invoke;
    block[3] = &unk_264414590;
    block[4] = self;
    dispatch_sync(eventQueue, block);
    [(SCROBrailleDisplayManager *)self _mainQueue_invalidate];
  }
}

uint64_t __39__SCROBrailleDisplayManager_invalidate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_invalidate");
}

- (void)_eventQueue_invalidate
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  [(SCROBrailleDisplayManager *)self _eventQueue_stop];
  bluetoothBrailleDisplay = self->_bluetoothBrailleDisplay;
  self->_bluetoothBrailleDisplay = 0;

  stealthBrailleDisplay = self->_stealthBrailleDisplay;
  self->_stealthBrailleDisplay = 0;

  detectedIOElementsDict = self->_detectedIOElementsDict;
  self->_detectedIOElementsDict = 0;

  loadedIOElements = self->_loadedIOElements;
  self->_loadedIOElements = 0;
}

- (void)_mainQueue_invalidate
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  [(SCROBrailleDisplayManager *)self _disableAutoDetect];
  v3 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
  [v3 makeObjectsPerformSelector:sel_invalidate];

  dispatch_queue_t v4 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activePendingDisplays];
  [v4 makeObjectsPerformSelector:sel_invalidate];

  v5 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue sleepingDisplays];
  [v5 makeObjectsPerformSelector:sel_invalidate];

  id v6 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue disconnectedDisplays];
  [v6 makeObjectsPerformSelector:sel_invalidate];

  v7 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue loadingDisplays];
  [v7 makeObjectsPerformSelector:sel_invalidate];

  managedDisplayQueue = self->_managedDisplayQueue;
  self->_managedDisplayQueue = 0;

  displayConfigurationDict = self->_displayConfigurationDict;
  if (displayConfigurationDict)
  {
    CFRelease(displayConfigurationDict);
    self->_displayConfigurationDict = 0;
  }
}

- (BOOL)isValid
{
  id v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __36__SCROBrailleDisplayManager_isValid__block_invoke;
  v5[3] = &unk_264414790;
  v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __36__SCROBrailleDisplayManager_isValid__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 228);
  return result;
}

- (void)tokenizeString:(id)a3 intoFormatter:(id)a4 selection:(_NSRange *)a5
{
  id v7 = a3;
  id v48 = a4;
  v46 = v7;
  uint64_t v8 = [v7 length];
  uint64_t v73 = 0;
  uint64_t v74 = 0;
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = 0;
    v52 = a5;
    do
    {
      uint64_t v51 = v10;
      v54 = objc_msgSend(v46, "attribute:atIndex:longestEffectiveRange:inRange:", kSCROTokenAttribute[0], v10, &v73, v10, v9);
      v11 = objc_msgSend(v46, "attributedSubstringFromRange:", v73, v74);
      v53 = [v11 attribute:kSCROLanguageAttribute[0] atIndex:0 effectiveRange:0];
      if (([v11 getRange:a5 ofAttribute:kSCROSelectionAttribute[0]] & 1) == 0)
      {
        if (![v11 getRange:a5 ofAttribute:kSCROCursorAttribute[0]])
        {
          int v12 = 0;
          goto LABEL_8;
        }
        a5->length = 0;
      }
      int v12 = 1;
LABEL_8:
      v13 = [v11 attribute:kSCROSelectionOnDifferentLineAttribute[0] atIndex:0 effectiveRange:0];
      char v14 = [v13 BOOLValue];

      uint64_t v67 = 0;
      v68 = &v67;
      uint64_t v69 = 0x3032000000;
      v70 = __Block_byref_object_copy__0;
      v71 = __Block_byref_object_dispose__0;
      id v72 = 0;
      if (v12)
      {
        v15 = kSCROBrailleEditingStringAttribute[0];
        uint64_t v16 = [v11 length];
        v66[0] = MEMORY[0x263EF8330];
        v66[1] = 3221225472;
        v66[2] = __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke;
        v66[3] = &unk_2644147B8;
        v66[4] = &v67;
        objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v15, 0, v16, 0, v66);
      }
      v17 = [v11 attribute:kSCROTechnicalContextAttribute[0] atIndex:0 effectiveRange:0];
      char v18 = [v17 BOOLValue];

      v19 = [v11 attribute:kSCROEditableTextAttribute[0] atIndex:0 effectiveRange:0];
      char v20 = [v19 BOOLValue];

      if (v20)
      {
        char v21 = 1;
      }
      else
      {
        v22 = [v11 attribute:kSCROEditableTextPaddingAttribute[0] atIndex:0 effectiveRange:0];
        char v21 = [v22 BOOLValue];
      }
      v65[0] = 0;
      v65[1] = 0;
      int v23 = [v11 getRange:v65 ofAttribute:kSCROPlaceholderTextAttribute[0]];
      v64[0] = 0;
      v64[1] = 0;
      int v24 = [v11 getRange:v64 ofAttribute:kSCROFocusedAttribute[0]];
      long long v63 = xmmword_21C6B9890;
      [v11 getRange:&v63 ofAttribute:kSCROEditableTextPaddingAttribute[0]];
      char v50 = v21;
      uint64_t v49 = v9;
      long long v62 = xmmword_21C6B9890;
      [v11 getRange:&v62 ofAttribute:kSCROSuggestionTextAttribute[0]];
      char v25 = v18;
      char v26 = v14;
      int v27 = v12;
      v61[0] = 0;
      v61[1] = 0;
      if ([v11 getRange:v61 ofAttribute:kSCROTerminalOutputAttribute[0]]) {
        [v48 setDisplayMode:5];
      }
      objc_super v28 = objc_opt_new();
      v29 = kSCROBoldTextAttribute[0];
      uint64_t v30 = [v11 length];
      v59[0] = MEMORY[0x263EF8330];
      v59[1] = 3221225472;
      v59[2] = __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_2;
      v59[3] = &unk_2644147E0;
      id v31 = v28;
      id v60 = v31;
      objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v29, 0, v30, 0, v59);
      v32 = kSCROItalicTextAttribute[0];
      uint64_t v33 = [v11 length];
      v57[0] = MEMORY[0x263EF8330];
      v57[1] = 3221225472;
      v57[2] = __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_3;
      v57[3] = &unk_2644147E0;
      id v34 = v31;
      id v58 = v34;
      objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v32, 0, v33, 0, v57);
      v35 = kSCROUnderlineTextAttribute;
      uint64_t v36 = [v11 length];
      v55[0] = MEMORY[0x263EF8330];
      v55[1] = 3221225472;
      v55[2] = __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_4;
      v55[3] = &unk_2644147E0;
      id v37 = v34;
      id v56 = v37;
      objc_msgSend(v11, "enumerateAttribute:inRange:options:usingBlock:", v35, 0, v36, 0, v55);
      v38 = [v11 string];
      if (v23)
      {
        v47 = [v11 string];
        v39 = v47;
      }
      else
      {
        v39 = 0;
      }
      uint64_t v40 = [v54 integerValue];
      if (v27) {
        v41 = v52;
      }
      else {
        v41 = 0;
      }
      if (v24) {
        v42 = v64;
      }
      else {
        v42 = 0;
      }
      LOBYTE(v45) = v26;
      BYTE1(v44) = v50;
      LOBYTE(v44) = v25;
      objc_msgSend(v48, "addText:overrideText:language:selection:token:focus:technical:isEditableText:paddingRange:suggestionRange:editingString:textFormattingRanges:selectionOnDifferentLine:", v38, v39, v53, v41, v40, v42, v44, v63, v62, v68[5], v37, v45);
      if (v23) {

      }
      uint64_t v43 = v74 + v73;
      uint64_t v9 = v51 + v49 - (v74 + v73);

      _Block_object_dispose(&v67, 8);
      uint64_t v10 = v43;
      a5 = v52;
    }
    while (v9);
  }
}

void __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4, unsigned char *a5)
{
  id v8 = a2;
  if (v8)
  {
    id v9 = v8;
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40), a2);
    id v8 = v9;
    *a5 = 1;
  }
}

uint64_t __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_2(uint64_t result, uint64_t a2)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addBoldRange:");
  }
  return result;
}

uint64_t __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_3(uint64_t result, uint64_t a2)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addItalicRange:");
  }
  return result;
}

uint64_t __68__SCROBrailleDisplayManager_tokenizeString_intoFormatter_selection___block_invoke_4(uint64_t result, uint64_t a2)
{
  if (a2) {
    return objc_msgSend(*(id *)(result + 32), "addUnderlineRange:");
  }
  return result;
}

- (void)_startAutodetectingTactileGraphics
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"CFStringRef soft__AXSVoiceOverTouchCopyTactileGraphicsDisplay(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SCROBrailleDisplayManager.m", 24, @"%s", dlerror());

  __break(1u);
}

- (void)_updateTactileGraphicsDisplay
{
  v3 = _SCROD_LOG();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_queue_t v4 = 0;
    _os_log_impl(&dword_21C66E000, v3, OS_LOG_TYPE_DEFAULT, "Updating tactile graphics from notification", v4, 2u);
  }

  [(SCROBrailleDisplayManager *)self _startAutodetectingTactileGraphics];
}

- (void)_enableAutoDetect
{
  v0 = [MEMORY[0x263F08690] currentHandler];
  v1 = [NSString stringWithUTF8String:"CFStringRef getkAXSVoiceOverTouchTactileGraphicsDisplayChangedNotification(void)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SCROBrailleDisplayManager.m", 25, @"%s", dlerror());

  __break(1u);
}

- (void)_disableAutoDetect
{
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  dispatch_queue_t v4 = kSCROBrailleDisplayConnectedNotification;
  v5 = +[SCROBrailleDisplayAutoDetector sharedDetector];
  [v3 removeObserver:self name:v4 object:v5];

  id v6 = +[SCROBrailleDisplayAutoDetector sharedDetector];
  [v6 stopDetectingDisplays];
}

- (void)_deviceConnectedHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __53__SCROBrailleDisplayManager__deviceConnectedHandler___block_invoke;
  v6[3] = &unk_264414808;
  id v7 = v4;
  id v8 = self;
  id v5 = v4;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

void __53__SCROBrailleDisplayManager__deviceConnectedHandler___block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(a1 + 32) userInfo];
  id v2 = *(void **)(a1 + 40);
  v3 = [v5 objectForKey:@"element"];
  id v4 = [v5 objectForKey:@"driverID"];
  [v2 _addDetectedIOElement:v3 withDriverIdentifier:v4];
}

- (void)_addDetectedIOElement:(id)a3 withDriverIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v6 && v7)
  {
    uint64_t v18 = 0;
    v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 0;
    eventQueue = self->_eventQueue;
    uint64_t v10 = MEMORY[0x263EF8330];
    uint64_t v11 = 3221225472;
    int v12 = __72__SCROBrailleDisplayManager__addDetectedIOElement_withDriverIdentifier___block_invoke;
    v13 = &unk_264414830;
    v17 = &v18;
    char v14 = self;
    id v9 = v6;
    id v15 = v9;
    id v16 = v7;
    dispatch_sync(eventQueue, &v10);
    if (*((unsigned char *)v19 + 24)) {
      -[SCROBrailleDisplayManager _loadNextDriverForIOElement:](self, "_loadNextDriverForIOElement:", v9, v10, v11, v12, v13, v14, v15);
    }

    _Block_object_dispose(&v18, 8);
  }
}

uint64_t __72__SCROBrailleDisplayManager__addDetectedIOElement_withDriverIdentifier___block_invoke(uint64_t a1)
{
  uint64_t result = objc_msgSend(*(id *)(a1 + 32), "_eventQueue_addDetectedIOElement:withDriverIdentifier:", *(void *)(a1 + 40), *(void *)(a1 + 48));
  *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = result;
  return result;
}

- (BOOL)_eventQueue_addDetectedIOElement:(id)a3 withDriverIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if ([(NSMutableSet *)self->_loadedIOElements containsObject:v6])
  {
    BOOL v8 = 0;
  }
  else
  {
    id v9 = [(NSMutableDictionary *)self->_detectedIOElementsDict objectForKey:v6];
    BOOL v8 = v9 == 0;
    if (v9)
    {
      uint64_t v10 = v9;
      if (([v9 containsObject:v6] & 1) == 0) {
        [v10 addObject:v7];
      }
    }
    else
    {
      uint64_t v10 = [MEMORY[0x263EFF980] arrayWithObject:v7];
      [(NSMutableDictionary *)self->_detectedIOElementsDict setObject:v10 forKey:v6];
    }
  }
  return v8;
}

- (id)_displayWithIOElement:(id)a3 driverIdentifier:(id)a4 delegate:(id)a5
{
  return +[SCROBrailleDisplay displayWithIOElement:a3 driverIdentifier:a4 delegate:a5];
}

- (void)_loadNextDriverForIOElement:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x263EF83A0]);
  if (v4)
  {
    eventQueue = self->_eventQueue;
    v6[0] = MEMORY[0x263EF8330];
    v6[1] = 3221225472;
    v6[2] = __57__SCROBrailleDisplayManager__loadNextDriverForIOElement___block_invoke;
    v6[3] = &unk_264414808;
    void v6[4] = self;
    id v7 = v4;
    dispatch_sync(eventQueue, v6);
  }
}

uint64_t __57__SCROBrailleDisplayManager__loadNextDriverForIOElement___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_loadNextDriverForIOElement:", *(void *)(a1 + 40));
}

- (void)_eventQueue_loadNextDriverForIOElement:(id)a3
{
  uint64_t v53 = *MEMORY[0x263EF8340];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v40 = v4;
  v41 = self;
  if ([v4 conformsToProtocol:&unk_26CCFAE88])
  {
    id v5 = [v4 bluetoothAddress];
    id v6 = SCRONSStringForPurportedString(v5);

    id v7 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
    BOOL v8 = (void *)[v7 mutableCopy];

    if (!v8) {
      BOOL v8 = objc_opt_new();
    }
    uint64_t v9 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activePendingDisplays];
    if (v9) {
      [v8 addObjectsFromArray:v9];
    }
    v39 = (void *)v9;
    uint64_t v10 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue loadingDisplays];
    if (v10) {
      [v8 addObjectsFromArray:v10];
    }
    v38 = (void *)v10;
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v43;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v43 != v14) {
            objc_enumerationMutation(v11);
          }
          id v16 = *(void **)(*((void *)&v42 + 1) + 8 * i);
          v17 = objc_msgSend(v16, "ioElement", v38);
          int v18 = [v17 conformsToProtocol:&unk_26CCFAE88];

          if (v18)
          {
            v19 = [v16 ioElement];
            uint64_t v20 = [v19 bluetoothAddress];

            char v21 = SCRONSStringForPurportedString(v20);

            if (v21 && [v6 isEqualToString:v21])
            {
              v22 = v41;
              if ([(SCROBrailleDisplayManager *)v41 _isIOElementHID:v4]
                && ([v16 ioElement],
                    int v23 = objc_claimAutoreleasedReturnValue(),
                    BOOL v24 = [(SCROBrailleDisplayManager *)v41 _isIOElementHID:v23],
                    v23,
                    v22 = v41,
                    !v24))
              {
                char v26 = _SCROD_LOG();
                id v4 = v40;
                if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
                {
                  *(_DWORD *)buf = 138412546;
                  v47 = v16;
                  __int16 v48 = 2112;
                  uint64_t v49 = v40;
                  _os_log_impl(&dword_21C66E000, v26, OS_LOG_TYPE_DEFAULT, "loadNextDriverForIOElement: old display is non-HID and the new one is HID. Invalidating %@ (new ioElement = %@)", buf, 0x16u);
                }

                [v16 invalidate];
              }
              else
              {
                char v25 = _SCROD_LOG();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_21C66E000, v25, OS_LOG_TYPE_DEFAULT, "loadNextDriverForIOElement: second load attempt from the same BT address. Ignoring.", buf, 2u);
                }

                id v4 = v40;
                [(NSMutableDictionary *)v22->_detectedIOElementsDict removeObjectForKey:v40];
              }
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v42 objects:v52 count:16];
      }
      while (v13);
    }

    self = v41;
  }
  if (objc_msgSend(v4, "transport", v38) == 2 || objc_msgSend(v4, "transport") == 8) {
    int v27 = [v4 conformsToProtocol:&unk_26CCFAE88];
  }
  else {
    int v27 = 0;
  }
  objc_super v28 = [(NSMutableDictionary *)self->_detectedIOElementsDict objectForKey:v4];
  uint64_t v29 = [v28 count];
  if (v29)
  {
    uint64_t v30 = v29;
    p_bluetoothBrailleDisplay = &self->_bluetoothBrailleDisplay;
    while (1)
    {
      v32 = [v28 objectAtIndex:0];
      uint64_t v33 = [(SCROBrailleDisplayManager *)self _displayWithIOElement:v40 driverIdentifier:v32 delegate:self];
      id v34 = _SCROD_LOG();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        v47 = v33;
        __int16 v48 = 2114;
        uint64_t v49 = v32;
        __int16 v50 = 2112;
        uint64_t v51 = v40;
        _os_log_impl(&dword_21C66E000, v34, OS_LOG_TYPE_DEFAULT, "Made braille display %@ from identifier %{public}@ %@", buf, 0x20u);
      }

      if (v27) {
        objc_storeStrong((id *)p_bluetoothBrailleDisplay, v33);
      }
      [v28 removeObjectAtIndex:0];
      self = v41;
      if (v33) {
        break;
      }
      --v30;

      if (!v30) {
        goto LABEL_40;
      }
    }
    [(SCROBrailleDisplayManagedQueue *)v41->_managedDisplayQueue addDisplay:v33 withState:4];
    v35 = v40;
    goto LABEL_44;
  }
LABEL_40:
  v35 = v40;
  [(NSMutableDictionary *)self->_detectedIOElementsDict removeObjectForKey:v40];
  if (v27)
  {
    bluetoothBrailleDisplay = self->_bluetoothBrailleDisplay;
    self->_bluetoothBrailleDisplay = 0;

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (WeakRetained)
    {
      uint64_t v33 = WeakRetained;
      v32 = [v40 bluetoothAddress];
      [v33 handleFailedToLoadBluetoothDevice:v32];
LABEL_44:
    }
  }
}

- (BOOL)_isIOElementHID:(id)a3
{
  id v3 = a3;
  if ([v3 conformsToProtocol:&unk_26CCFAF60]) {
    BOOL v4 = [v3 hidDevice] != 0;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (void)setDelegate:(id)a3
{
  id v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __41__SCROBrailleDisplayManager_setDelegate___block_invoke;
  v7[3] = &unk_264414808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(eventQueue, v7);
}

id __41__SCROBrailleDisplayManager_setDelegate___block_invoke(uint64_t a1)
{
  return objc_storeWeak((id *)(*(void *)(a1 + 32) + 72), *(id *)(a1 + 40));
}

- (SCROSBrailleDisplayManagerDelegate)delegate
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  uint64_t v10 = __Block_byref_object_copy__0;
  id v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __37__SCROBrailleDisplayManager_delegate__block_invoke;
  v6[3] = &unk_264414790;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return (SCROSBrailleDisplayManagerDelegate *)v4;
}

uint64_t __37__SCROBrailleDisplayManager_delegate__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = WeakRetained;

  return MEMORY[0x270F9A758](WeakRetained);
}

- (void)brailleDisplay:(id)a3 driverDidLoad:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v6 = a3;
  uint64_t v7 = _SCROD_LOG();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109378;
    BOOL v15 = v4;
    __int16 v16 = 2114;
    id v17 = v6;
    _os_log_impl(&dword_21C66E000, v7, OS_LOG_TYPE_DEFAULT, "Driver did load: %d %{public}@", buf, 0x12u);
  }

  eventQueue = self->_eventQueue;
  if (v4)
  {
    uint64_t v9 = v13;
    v13[0] = MEMORY[0x263EF8330];
    v13[1] = 3221225472;
    uint64_t v10 = __58__SCROBrailleDisplayManager_brailleDisplay_driverDidLoad___block_invoke;
  }
  else
  {
    uint64_t v9 = v12;
    v12[0] = MEMORY[0x263EF8330];
    v12[1] = 3221225472;
    uint64_t v10 = __58__SCROBrailleDisplayManager_brailleDisplay_driverDidLoad___block_invoke_2;
  }
  v9[2] = v10;
  v9[3] = &unk_264414808;
  v9[4] = self;
  v9[5] = v6;
  id v11 = v6;
  dispatch_async(eventQueue, v9);
}

uint64_t __58__SCROBrailleDisplayManager_brailleDisplay_driverDidLoad___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_brailleDisplayDriverDidLoad:", *(void *)(a1 + 40));
}

uint64_t __58__SCROBrailleDisplayManager_brailleDisplay_driverDidLoad___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_brailleDisplayDriverFailedToLoad:", *(void *)(a1 + 40));
}

- (void)_eventQueue_brailleDisplayDriverDidLoad:(id)a3
{
  uint64_t v49 = *MEMORY[0x263EF8340];
  BOOL v4 = (SCROBrailleDisplay *)a3;
  id v5 = _SCROD_LOG();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SCROBrailleDisplay *)v4 driverIdentifier];
    *(_DWORD *)buf = 138412290;
    v46 = v6;
    _os_log_impl(&dword_21C66E000, v5, OS_LOG_TYPE_DEFAULT, "Display loaded: %@", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v7 = [(SCROBrailleDisplay *)v4 ioElement];
  id v8 = [(SCROBrailleDisplay *)v4 configuration];
  if (v7)
  {
    bluetoothBrailleDisplay = self->_bluetoothBrailleDisplay;
    BOOL v41 = bluetoothBrailleDisplay == v4;
    if (!bluetoothBrailleDisplay && [v7 conformsToProtocol:&unk_26CCFAD38])
    {
      uint64_t v10 = _SCROD_LOG();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        v46 = v7;
        _os_log_impl(&dword_21C66E000, v10, OS_LOG_TYPE_DEFAULT, "Marking BTLE device as loading so it can be saved: %@", buf, 0xCu);
      }

      BOOL v41 = 1;
    }
    [(NSMutableSet *)self->_loadedIOElements addObject:v7];
    [(NSMutableDictionary *)self->_detectedIOElementsDict removeObjectForKey:v7];
    objc_opt_class();
    BOOL v11 = 0;
    int v12 = objc_opt_isKindOfClass() ^ 1;
  }
  else
  {
    BOOL v41 = 0;
    BOOL v11 = self->_stealthBrailleDisplay == v4;
    int v12 = 1;
  }
  int v13 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue stateForDisplay:v4];
  uint64_t v14 = _SCROD_LOG();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    LODWORD(v46) = v13;
    _os_log_impl(&dword_21C66E000, v14, OS_LOG_TYPE_DEFAULT, "Current display state: %d", buf, 8u);
  }

  uint64_t v40 = v8;
  if ((v13 & 0xFFFFFFFB) != 0)
  {
    long long v42 = 0;
    uint64_t v15 = 0;
    int v16 = 0;
    id WeakRetained = 0;
    id v18 = 0;
    goto LABEL_15;
  }
  displayConfigurationDict = self->_displayConfigurationDict;
  if (displayConfigurationDict && v8) {
    CFDictionarySetValue(displayConfigurationDict, v4, v8);
  }
  uint64_t v15 = v12 & !v11;
  uint64_t v20 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
  uint64_t v21 = [v20 count];

  if (v21) {
    BOOL v22 = v11;
  }
  else {
    BOOL v22 = 0;
  }
  if (!v22)
  {
    if (v21 == 1)
    {
      int v27 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
      objc_super v28 = [v27 lastObject];
      stealthBrailleDisplay = self->_stealthBrailleDisplay;

      if (v28 == stealthBrailleDisplay) {
        [(SCROBrailleDisplayManager *)self _eventQueue_unloadStealthDisplay];
      }
    }
    [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue setState:1 forDisplay:v4];
    int v30 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue stateForDisplay:v4];
    BOOL v26 = v30 == 1;
    if (v30 == 1)
    {
      unsigned int v39 = [(SCROBrailleDisplayManagerStatus *)self->_status virtualAlignment];
      uint64_t v24 = [(SCROBrailleDisplayManagerStatus *)self->_status masterStatusCellIndex];
      id v31 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue primaryDisplay];
      BOOL v25 = v31 == v4;

      long long v42 = self->_currentBrailleFormatter;
      if (v15) {
        goto LABEL_34;
      }
    }
    else
    {
      BOOL v25 = 0;
      unsigned int v39 = 0;
      uint64_t v24 = 0;
      long long v42 = 0;
      if (v15) {
        goto LABEL_34;
      }
    }
    int v16 = v22;
    id WeakRetained = 0;
    goto LABEL_37;
  }
  int v23 = self->_stealthBrailleDisplay;
  self->_stealthBrailleDisplay = 0;

  [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue removeDisplay:v4];
  if (!v15)
  {
    long long v42 = 0;
    id WeakRetained = 0;
    id v18 = 0;
LABEL_36:
    int v16 = 1;
    goto LABEL_15;
  }
  long long v42 = 0;
  uint64_t v24 = 0;
  unsigned int v39 = 0;
  BOOL v25 = 0;
  BOOL v26 = 0;
LABEL_34:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  int v16 = v22;
  if (v22)
  {
    id v18 = 0;
    if (!v26) {
      goto LABEL_36;
    }
LABEL_38:
    BOOL v32 = v25 && self->_lineDescriptorDisplayCallbackEnabled;
    _updateNewlyActiveDisplay(v4, v42, v32, 1, v24, v39, self->_automaticBrailleTranslation);
    goto LABEL_43;
  }
LABEL_37:
  id v18 = objc_loadWeakRetained((id *)&self->_delegate);
  if (v26) {
    goto LABEL_38;
  }
  int v16 = 0;
LABEL_15:
  if ([(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue stateForDisplay:v4] != 1)
  {
    [(SCROBrailleDisplay *)v4 setDelegateWantsDisplayCallback:0];
    [(SCROBrailleDisplay *)v4 setInputAllowed:0];
  }
LABEL_43:
  uint64_t v33 = _SCROD_LOG();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    id v34 = [NSNumber numberWithBool:v15];
    v35 = [NSNumber numberWithBool:v41];
    *(_DWORD *)buf = 138412546;
    v46 = v34;
    __int16 v47 = 2112;
    __int16 v48 = v35;
    _os_log_impl(&dword_21C66E000, v33, OS_LOG_TYPE_DEFAULT, "Braille display loaded: will notify: %@, will save: %@", buf, 0x16u);
  }
  if (v15)
  {
    if (v41) {
      [(SCROBrailleDisplayManager *)self _saveBluetoothDisplayConfiguration:v40];
    }
    [WeakRetained handleBrailleDriverDidLoad];
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __69__SCROBrailleDisplayManager__eventQueue_brailleDisplayDriverDidLoad___block_invoke;
  block[3] = &unk_264414590;
  id v44 = v18;
  id v36 = v18;
  dispatch_async(MEMORY[0x263EF83A0], block);
  id v37 = [(SCROBrailleDisplayManager *)self brailleInputManager];
  v38 = [(SCROBrailleDisplayManager *)self _eventQueue_driverConfiguration];
  [v37 configureWithDriverConfiguration:v38];

  if (v16) {
    [(SCROBrailleDisplay *)v4 invalidate];
  }
}

uint64_t __69__SCROBrailleDisplayManager__eventQueue_brailleDisplayDriverDidLoad___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) configurationDidChange];
}

- (void)_eventQueue_brailleDisplayDriverFailedToLoad:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  BOOL v4 = (SCROBrailleDisplay *)a3;
  id v5 = _SCROD_LOG();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [(SCROBrailleDisplay *)v4 driverIdentifier];
    *(_DWORD *)buf = 138543362;
    uint64_t v15 = v6;
    _os_log_impl(&dword_21C66E000, v5, OS_LOG_TYPE_DEFAULT, "Display failed load: %{public}@", buf, 0xCu);
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v7 = [(SCROBrailleDisplay *)v4 ioElement];
  stealthBrailleDisplay = self->_stealthBrailleDisplay;
  if (stealthBrailleDisplay == v4)
  {
    self->_stealthBrailleDisplay = 0;
  }
  [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue removeDisplay:v4];
  uint64_t v9 = [(NSMutableDictionary *)self->_detectedIOElementsDict objectForKey:v7];
  if (v9)
  {
    if (stealthBrailleDisplay == v4)
    {
      id WeakRetained = 0;
      goto LABEL_15;
    }
  }
  else
  {
    if (self->_bluetoothBrailleDisplay == v4)
    {
      self->_bluetoothBrailleDisplay = 0;
    }
    if (stealthBrailleDisplay == v4)
    {
      [(SCROBrailleDisplayManager *)self _loadStealthDisplay];
      id WeakRetained = 0;
      goto LABEL_16;
    }
  }
  if ([v9 count])
  {
    id WeakRetained = 0;
    if (!v9) {
      goto LABEL_16;
    }
    goto LABEL_15;
  }
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (v9) {
LABEL_15:
  }
    [(SCROBrailleDisplayManager *)self performSelectorOnMainThread:sel__loadNextDriverForIOElement_ withObject:v7 waitUntilDone:0];
LABEL_16:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __74__SCROBrailleDisplayManager__eventQueue_brailleDisplayDriverFailedToLoad___block_invoke;
  block[3] = &unk_264414590;
  id v13 = WeakRetained;
  id v11 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __74__SCROBrailleDisplayManager__eventQueue_brailleDisplayDriverFailedToLoad___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) configurationDidChange];
}

- (void)brailleDriverDisconnected:(id)a3
{
  id v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SCROBrailleDisplayManager_brailleDriverDisconnected___block_invoke;
  v7[3] = &unk_264414808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(eventQueue, v7);
}

uint64_t __55__SCROBrailleDisplayManager_brailleDriverDisconnected___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_brailleDriverDisconnected:", *(void *)(a1 + 40));
}

- (void)_eventQueue_brailleDriverDisconnected:(id)a3
{
  uint64_t v45 = *MEMORY[0x263EF8340];
  id v4 = (SCROBrailleDisplay *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  id v5 = [(SCROBrailleDisplay *)v4 ioElement];
  id v6 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
  uint64_t v7 = [v6 lastObject];

  int v8 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue stateForDisplay:v4];
  int v9 = v8;
  stealthBrailleDisplay = self->_stealthBrailleDisplay;
  BOOL v11 = self->_bluetoothBrailleDisplay != v4 || v8 == 4;
  int v12 = v11;
  int v38 = v12;
  if (v11)
  {
    [(NSMutableSet *)self->_loadedIOElements removeObject:v5];
    [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue removeDisplay:v4];
  }
  else
  {
    if ([v5 transport] == 8
      && [(NSMutableSet *)self->_loadedIOElements containsObject:v5])
    {
      [(NSMutableSet *)self->_loadedIOElements removeObject:v5];
    }
    [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue setState:0 forDisplay:v4];
  }
  id v13 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
  uint64_t v14 = [v13 count];
  unsigned int v39 = (void *)v7;
  id v37 = v13;
  if (v14)
  {
    v35 = v5;
    uint64_t v15 = stealthBrailleDisplay;
    uint64_t v16 = [v13 lastObject];
    id v17 = v16;
    if ((void *)v7 == v16)
    {
      uint64_t v20 = 0;
      BOOL v21 = 0;
      uint64_t v22 = 0;
      uint64_t v36 = 0;
      uint64_t v40 = 0;
      int inputAccessMode = 2;
    }
    else
    {
      id v18 = v16;
      id v19 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue primaryDisplay];
      uint64_t v20 = v18;
      BOOL v21 = v18 == v19;

      uint64_t v22 = [(SCROBrailleDisplayManagerStatus *)self->_status virtualAlignment];
      uint64_t v36 = [(SCROBrailleDisplayManagerStatus *)self->_status masterStatusCellIndex];
      int inputAccessMode = self->_inputAccessMode;
      uint64_t v40 = self->_currentBrailleFormatter;
    }

    stealthBrailleDisplay = v15;
    id v5 = v35;
  }
  else
  {
    uint64_t v20 = 0;
    BOOL v21 = 0;
    uint64_t v22 = 0;
    uint64_t v36 = 0;
    uint64_t v40 = 0;
    int inputAccessMode = 2;
  }
  if (v9 != [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue stateForDisplay:v4])
  {
    if (stealthBrailleDisplay == v4) {
      id WeakRetained = 0;
    }
    else {
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }
    id v24 = objc_loadWeakRetained((id *)&self->_delegate);
    if (v14) {
      goto LABEL_22;
    }
LABEL_36:
    [(SCROBrailleDisplayManager *)self setUIDisplayMode];
    [(SCROBrailleDisplayManager *)self _loadStealthDisplay];
    uint64_t v29 = v39;
    int v30 = v20;
    goto LABEL_37;
  }
  id v24 = 0;
  id WeakRetained = 0;
  if (!v14) {
    goto LABEL_36;
  }
LABEL_22:
  if (inputAccessMode) {
    BOOL v26 = 0;
  }
  else {
    BOOL v26 = v21;
  }
  uint64_t v27 = inputAccessMode == 1 || v26;
  BOOL v28 = v21 && self->_lineDescriptorDisplayCallbackEnabled;
  uint64_t v29 = v39;
  int v30 = v20;
  _updateNewlyActiveDisplay(v20, v40, v28, v27, v36, v22, self->_automaticBrailleTranslation);
LABEL_37:
  [WeakRetained handleBrailleDriverDisconnected];
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SCROBrailleDisplayManager__eventQueue_brailleDriverDisconnected___block_invoke;
  block[3] = &unk_264414590;
  id v31 = v24;
  id v42 = v31;
  dispatch_async(MEMORY[0x263EF83A0], block);
  BOOL v32 = [(SCROBrailleDisplayManager *)self brailleInputManager];
  uint64_t v33 = [(SCROBrailleDisplayManager *)self _eventQueue_driverConfiguration];
  [v32 configureWithDriverConfiguration:v33];

  if (v38) {
    [(SCROBrailleDisplay *)v4 invalidate];
  }
  if ([v5 conformsToProtocol:&unk_26CCFAD38])
  {
    id v34 = _SCROD_LOG();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v44 = v5;
      _os_log_impl(&dword_21C66E000, v34, OS_LOG_TYPE_DEFAULT, "element was BTLE, restarting auto detect: %@", buf, 0xCu);
    }

    [(SCROBrailleDisplayManager *)self _startAutodetectingTactileGraphics];
  }
}

uint64_t __67__SCROBrailleDisplayManager__eventQueue_brailleDriverDisconnected___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) configurationDidChange];
}

- (void)brailleDisplay:(id)a3 isSleeping:(BOOL)a4
{
  id v6 = a3;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __55__SCROBrailleDisplayManager_brailleDisplay_isSleeping___block_invoke;
  block[3] = &unk_264414858;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(eventQueue, block);
}

uint64_t __55__SCROBrailleDisplayManager_brailleDisplay_isSleeping___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_brailleDisplay:isSleeping:", *(void *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (void)_eventQueue_brailleDisplay:(id)a3 isSleeping:(BOOL)a4
{
  id v6 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v7 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
  id v8 = [v7 lastObject];
  if (a4)
  {
    uint64_t v9 = 3;
  }
  else
  {
    if ([v7 count] == 1 && v8 == self->_stealthBrailleDisplay) {
      [(SCROBrailleDisplayManager *)self _unloadStealthDisplay];
    }
    uint64_t v9 = 1;
  }
  [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue setState:v9 forDisplay:v6];
  id v10 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];

  if ([v10 count])
  {
    BOOL v11 = [v10 lastObject];
    int v12 = v11;
    BOOL v13 = v8 == v11;
    uint64_t v29 = v8;
    id v14 = v6;
    if (v13)
    {
      BOOL v17 = 0;
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      BOOL v21 = 0;
      uint64_t v15 = 0;
      int inputAccessMode = 2;
    }
    else
    {
      uint64_t v15 = v11;
      uint64_t v16 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue primaryDisplay];
      BOOL v17 = v15 == v16;

      uint64_t v18 = [(SCROBrailleDisplayManagerStatus *)self->_status virtualAlignment];
      uint64_t v19 = [(SCROBrailleDisplayManagerStatus *)self->_status masterStatusCellIndex];
      int inputAccessMode = self->_inputAccessMode;
      BOOL v21 = self->_currentBrailleFormatter;
    }

    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    if (inputAccessMode) {
      BOOL v23 = 0;
    }
    else {
      BOOL v23 = v17;
    }
    uint64_t v24 = inputAccessMode == 1 || v23;
    BOOL v25 = v17 && self->_lineDescriptorDisplayCallbackEnabled;
    id v6 = v14;
    id v8 = v29;
    _updateNewlyActiveDisplay(v15, v21, v25, v24, v19, v18, self->_automaticBrailleTranslation);
  }
  else
  {
    id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    [(SCROBrailleDisplayManager *)self setUIDisplayMode];
    [(SCROBrailleDisplayManager *)self _loadStealthDisplay];
    uint64_t v15 = 0;
    BOOL v21 = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __67__SCROBrailleDisplayManager__eventQueue_brailleDisplay_isSleeping___block_invoke;
  block[3] = &unk_264414590;
  id v31 = WeakRetained;
  id v26 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v27 = [(SCROBrailleDisplayManager *)self brailleInputManager];
  BOOL v28 = [(SCROBrailleDisplayManager *)self _eventQueue_driverConfiguration];
  [v27 configureWithDriverConfiguration:v28];
}

uint64_t __67__SCROBrailleDisplayManager__eventQueue_brailleDisplay_isSleeping___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) configurationDidChange];
}

- (void)configurationChangedForBrailleDisplay:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    id v5 = [v4 configuration];
    if (v5)
    {
      uint64_t v18 = 0;
      uint64_t v19 = &v18;
      uint64_t v20 = 0x2020000000;
      char v21 = 0;
      v16[0] = 0;
      v16[1] = v16;
      v16[2] = 0x3032000000;
      v16[3] = __Block_byref_object_copy__0;
      v16[4] = __Block_byref_object_dispose__0;
      id v17 = 0;
      eventQueue = self->_eventQueue;
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __67__SCROBrailleDisplayManager_configurationChangedForBrailleDisplay___block_invoke;
      block[3] = &unk_264414880;
      void block[4] = self;
      id v12 = v4;
      id v7 = v5;
      id v13 = v7;
      id v14 = &v18;
      uint64_t v15 = v16;
      dispatch_sync(eventQueue, block);
      if (*((unsigned char *)v19 + 24)) {
        [(SCROBrailleDisplayManager *)self _saveBluetoothDisplayConfiguration:v7];
      }
      v10[0] = MEMORY[0x263EF8330];
      v10[1] = 3221225472;
      v10[2] = __67__SCROBrailleDisplayManager_configurationChangedForBrailleDisplay___block_invoke_2;
      v10[3] = &unk_264414650;
      v10[4] = v16;
      dispatch_async(MEMORY[0x263EF83A0], v10);
      id v8 = [(SCROBrailleDisplayManager *)self brailleInputManager];
      uint64_t v9 = [(SCROBrailleDisplayManager *)self driverConfiguration];
      [v8 configureWithDriverConfiguration:v9];

      _Block_object_dispose(v16, 8);
      _Block_object_dispose(&v18, 8);
    }
  }
}

void __67__SCROBrailleDisplayManager_configurationChangedForBrailleDisplay___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 16), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));

  if (v2)
  {
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(__CFDictionary **)(v3 + 64);
    if (v4)
    {
      CFDictionarySetValue(v4, *(const void **)(a1 + 40), *(const void **)(a1 + 48));
      uint64_t v3 = *(void *)(a1 + 32);
    }
    *(unsigned char *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) = *(void *)(a1 + 40) == *(void *)(v3 + 24);
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
    *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) = WeakRetained;
    MEMORY[0x270F9A758](WeakRetained);
  }
}

uint64_t __67__SCROBrailleDisplayManager_configurationChangedForBrailleDisplay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) configurationDidChange];
}

- (void)brailleDisplay:(id)a3 pressedKeys:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __56__SCROBrailleDisplayManager_brailleDisplay_pressedKeys___block_invoke;
  v13[3] = &unk_2644148A8;
  id v14 = v8;
  id v15 = v6;
  uint64_t v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(eventQueue, v13);
}

void __56__SCROBrailleDisplayManager_brailleDisplay_pressedKeys___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  if (v2 == *(void **)(a1 + 40) && [*(id *)(a1 + 32) stateForDisplay:v2] == 1) {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
  }
  else {
    id WeakRetained = 0;
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__SCROBrailleDisplayManager_brailleDisplay_pressedKeys___block_invoke_2;
  v5[3] = &unk_264414808;
  id v6 = WeakRetained;
  id v7 = *(id *)(a1 + 56);
  id v4 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __56__SCROBrailleDisplayManager_brailleDisplay_pressedKeys___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBrailleKeypress:*(void *)(a1 + 40)];
}

- (void)brailleDisplayHadUserInteraction:(id)a3
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SCROBrailleDisplayManager_brailleDisplayHadUserInteraction___block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

void __62__SCROBrailleDisplayManager_brailleDisplayHadUserInteraction___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  [WeakRetained handleUserEventOccured];
}

- (void)brailleDidStartEditingWithDisplay:(id)a3
{
  id v4 = a3;
  id v5 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SCROBrailleDisplayManager_brailleDidStartEditingWithDisplay___block_invoke;
  block[3] = &unk_264414750;
  id v10 = v5;
  id v11 = v4;
  id v12 = self;
  id v7 = v4;
  id v8 = v5;
  dispatch_async(eventQueue, block);
}

void __63__SCROBrailleDisplayManager_brailleDidStartEditingWithDisplay___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  if (v2 == *(void **)(a1 + 40) && [*(id *)(a1 + 32) stateForDisplay:v2] == 1) {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
  }
  else {
    id WeakRetained = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __63__SCROBrailleDisplayManager_brailleDidStartEditingWithDisplay___block_invoke_2;
  block[3] = &unk_264414590;
  id v6 = WeakRetained;
  id v4 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __63__SCROBrailleDisplayManager_brailleDidStartEditingWithDisplay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleStartEditing];
}

- (void)brailleDisplay:(id)a3 didReplaceRange:(_NSRange)a4 withString:(id)a5 cursor:(unint64_t)a6
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v11 = a3;
  id v12 = a5;
  id v13 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__SCROBrailleDisplayManager_brailleDisplay_didReplaceRange_withString_cursor___block_invoke;
  block[3] = &unk_2644148F8;
  uint64_t v19 = v13;
  id v20 = v11;
  NSUInteger v23 = location;
  NSUInteger v24 = length;
  char v21 = self;
  id v22 = v12;
  unint64_t v25 = a6;
  id v15 = v12;
  id v16 = v11;
  id v17 = v13;
  dispatch_async(eventQueue, block);
}

void __78__SCROBrailleDisplayManager_brailleDisplay_didReplaceRange_withString_cursor___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  if (v2 == *(void **)(a1 + 40) && [*(id *)(a1 + 32) stateForDisplay:v2] == 1) {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
  }
  else {
    id WeakRetained = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __78__SCROBrailleDisplayManager_brailleDisplay_didReplaceRange_withString_cursor___block_invoke_2;
  block[3] = &unk_2644148D0;
  id v8 = WeakRetained;
  long long v10 = *(_OWORD *)(a1 + 64);
  id v4 = *(id *)(a1 + 56);
  uint64_t v5 = *(void *)(a1 + 80);
  id v9 = v4;
  uint64_t v11 = v5;
  id v6 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __78__SCROBrailleDisplayManager_brailleDisplay_didReplaceRange_withString_cursor___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleBrailleReplaceTextRange:withString:cursor:", *(void *)(a1 + 48), *(void *)(a1 + 56), *(void *)(a1 + 40), *(void *)(a1 + 64));
}

- (void)brailleDisplay:(id)a3 insertedUntranslatedText:(id)a4 speakLiterally:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  long long v10 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__SCROBrailleDisplayManager_brailleDisplay_insertedUntranslatedText_speakLiterally___block_invoke;
  block[3] = &unk_264414920;
  id v16 = v10;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v9;
  BOOL v20 = a5;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(eventQueue, block);
}

void __84__SCROBrailleDisplayManager_brailleDisplay_insertedUntranslatedText_speakLiterally___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  if (v2 == *(void **)(a1 + 40) && [*(id *)(a1 + 32) stateForDisplay:v2] == 1) {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
  }
  else {
    id WeakRetained = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__SCROBrailleDisplayManager_brailleDisplay_insertedUntranslatedText_speakLiterally___block_invoke_2;
  block[3] = &unk_264414858;
  id v6 = WeakRetained;
  id v7 = *(id *)(a1 + 56);
  char v8 = *(unsigned char *)(a1 + 64);
  id v4 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __84__SCROBrailleDisplayManager_brailleDisplay_insertedUntranslatedText_speakLiterally___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBrailleInsertedUntranslatedText:*(void *)(a1 + 40) speakLiterally:*(unsigned __int8 *)(a1 + 48)];
}

- (void)brailleDisplay:(id)a3 copyStringToClipboard:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __66__SCROBrailleDisplayManager_brailleDisplay_copyStringToClipboard___block_invoke;
  v13[3] = &unk_2644148A8;
  id v14 = v8;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(eventQueue, v13);
}

void __66__SCROBrailleDisplayManager_brailleDisplay_copyStringToClipboard___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  if (v2 == *(void **)(a1 + 40) && [*(id *)(a1 + 32) stateForDisplay:v2] == 1) {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
  }
  else {
    id WeakRetained = 0;
  }
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__SCROBrailleDisplayManager_brailleDisplay_copyStringToClipboard___block_invoke_2;
  v5[3] = &unk_264414808;
  id v6 = WeakRetained;
  id v7 = *(id *)(a1 + 56);
  id v4 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], v5);
}

uint64_t __66__SCROBrailleDisplayManager_brailleDisplay_copyStringToClipboard___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleCopyStringToClipboard:*(void *)(a1 + 40)];
}

- (void)brailleDisplay:(id)a3 deletedUntranslatedText:(id)a4 speakLiterally:(BOOL)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__SCROBrailleDisplayManager_brailleDisplay_deletedUntranslatedText_speakLiterally___block_invoke;
  block[3] = &unk_264414920;
  id v16 = v10;
  id v17 = v8;
  uint64_t v18 = self;
  id v19 = v9;
  BOOL v20 = a5;
  id v12 = v9;
  id v13 = v8;
  id v14 = v10;
  dispatch_async(eventQueue, block);
}

void __83__SCROBrailleDisplayManager_brailleDisplay_deletedUntranslatedText_speakLiterally___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  if (v2 == *(void **)(a1 + 40) && [*(id *)(a1 + 32) stateForDisplay:v2] == 1) {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
  }
  else {
    id WeakRetained = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __83__SCROBrailleDisplayManager_brailleDisplay_deletedUntranslatedText_speakLiterally___block_invoke_2;
  block[3] = &unk_264414858;
  id v6 = WeakRetained;
  id v7 = *(id *)(a1 + 56);
  char v8 = *(unsigned char *)(a1 + 64);
  id v4 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __83__SCROBrailleDisplayManager_brailleDisplay_deletedUntranslatedText_speakLiterally___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBrailleDeletedUntranslatedText:*(void *)(a1 + 40) speakLiterally:*(unsigned __int8 *)(a1 + 48)];
}

- (void)brailleDisplay:(id)a3 willMemorizeKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  char v8 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __60__SCROBrailleDisplayManager_brailleDisplay_willMemorizeKey___block_invoke;
  v13[3] = &unk_2644148A8;
  id v14 = v8;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(eventQueue, v13);
}

void __60__SCROBrailleDisplayManager_brailleDisplay_willMemorizeKey___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  if (v2 != *(void **)(a1 + 40) || [*(id *)(a1 + 32) stateForDisplay:v2] != 1) {
    goto LABEL_6;
  }
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = *(_DWORD *)(v3 + 232);
  if (v4 == 1)
  {
LABEL_9:
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 72));
    goto LABEL_7;
  }
  if (!v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) primaryDisplay];

    if (v5 == v6)
    {
      uint64_t v3 = *(void *)(a1 + 48);
      goto LABEL_9;
    }
  }
LABEL_6:
  id WeakRetained = 0;
LABEL_7:
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __60__SCROBrailleDisplayManager_brailleDisplay_willMemorizeKey___block_invoke_2;
  v9[3] = &unk_264414808;
  id v10 = WeakRetained;
  id v11 = *(id *)(a1 + 56);
  id v8 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __60__SCROBrailleDisplayManager_brailleDisplay_willMemorizeKey___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBrailleKeyWillMemorize:*(void *)(a1 + 40)];
}

- (void)brailleDisplay:(id)a3 memorizedKey:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __57__SCROBrailleDisplayManager_brailleDisplay_memorizedKey___block_invoke;
  v13[3] = &unk_2644148A8;
  id v14 = v8;
  id v15 = v6;
  id v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v6;
  id v12 = v8;
  dispatch_async(eventQueue, v13);
}

void __57__SCROBrailleDisplayManager_brailleDisplay_memorizedKey___block_invoke(uint64_t a1)
{
  id v2 = objc_msgSend(*(id *)(a1 + 32), "displayForToken:", objc_msgSend(*(id *)(a1 + 40), "token"));
  if (v2 != *(void **)(a1 + 40) || [*(id *)(a1 + 32) stateForDisplay:v2] != 1) {
    goto LABEL_6;
  }
  uint64_t v3 = *(void *)(a1 + 48);
  int v4 = *(_DWORD *)(v3 + 232);
  if (v4 == 1)
  {
LABEL_9:
    id WeakRetained = objc_loadWeakRetained((id *)(v3 + 72));
    goto LABEL_7;
  }
  if (!v4)
  {
    uint64_t v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) primaryDisplay];

    if (v5 == v6)
    {
      uint64_t v3 = *(void *)(a1 + 48);
      goto LABEL_9;
    }
  }
LABEL_6:
  id WeakRetained = 0;
LABEL_7:
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __57__SCROBrailleDisplayManager_brailleDisplay_memorizedKey___block_invoke_2;
  v9[3] = &unk_264414808;
  id v10 = WeakRetained;
  id v11 = *(id *)(a1 + 56);
  id v8 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], v9);
}

uint64_t __57__SCROBrailleDisplayManager_brailleDisplay_memorizedKey___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBrailleKeyMemorize:*(void *)(a1 + 40)];
}

- (void)brailleDisplay:(id)a3 didDisplay:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  v13[0] = MEMORY[0x263EF8330];
  v13[1] = 3221225472;
  v13[2] = __55__SCROBrailleDisplayManager_brailleDisplay_didDisplay___block_invoke;
  v13[3] = &unk_2644148A8;
  id v14 = v6;
  id v15 = v8;
  id v16 = self;
  id v17 = v7;
  id v10 = v7;
  id v11 = v8;
  id v12 = v6;
  dispatch_async(eventQueue, v13);
}

void __55__SCROBrailleDisplayManager_brailleDisplay_didDisplay___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  uint64_t v3 = [*(id *)(a1 + 40) primaryDisplay];

  if (v2 == v3) {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
  }
  else {
    id WeakRetained = 0;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __55__SCROBrailleDisplayManager_brailleDisplay_didDisplay___block_invoke_2;
  v6[3] = &unk_264414808;
  id v7 = WeakRetained;
  id v8 = *(id *)(a1 + 56);
  id v5 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], v6);
}

uint64_t __55__SCROBrailleDisplayManager_brailleDisplay_didDisplay___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBrailleDidDisplay:*(void *)(a1 + 40)];
}

- (void)brailleDisplay:(id)a3 didPanLeft:(id)a4 elementToken:(id)a5 appToken:(id)a6 lineOffset:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__SCROBrailleDisplayManager_brailleDisplay_didPanLeft_elementToken_appToken_lineOffset___block_invoke;
  block[3] = &unk_264414970;
  id v26 = v17;
  id v27 = v12;
  BOOL v28 = self;
  id v29 = v13;
  id v30 = v14;
  id v31 = v15;
  id v32 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  NSUInteger v24 = v17;
  dispatch_async(eventQueue, block);
}

void __88__SCROBrailleDisplayManager_brailleDisplay_didPanLeft_elementToken_appToken_lineOffset___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) stateForDisplay:*(void *)(a1 + 40)] == 1) {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
  }
  else {
    id WeakRetained = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __88__SCROBrailleDisplayManager_brailleDisplay_didPanLeft_elementToken_appToken_lineOffset___block_invoke_2;
  block[3] = &unk_264414948;
  id v5 = WeakRetained;
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  id v3 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __88__SCROBrailleDisplayManager_brailleDisplay_didPanLeft_elementToken_appToken_lineOffset___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBrailleDidPanLeft:*(void *)(a1 + 40) elementToken:*(void *)(a1 + 48) appToken:*(void *)(a1 + 56) lineOffset:*(void *)(a1 + 64)];
}

- (void)brailleDisplay:(id)a3 didPanRight:(id)a4 elementToken:(id)a5 appToken:(id)a6 lineOffset:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = self->_managedDisplayQueue;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__SCROBrailleDisplayManager_brailleDisplay_didPanRight_elementToken_appToken_lineOffset___block_invoke;
  block[3] = &unk_264414970;
  id v26 = v17;
  id v27 = v12;
  BOOL v28 = self;
  id v29 = v13;
  id v30 = v14;
  id v31 = v15;
  id v32 = v16;
  id v19 = v16;
  id v20 = v15;
  id v21 = v14;
  id v22 = v13;
  id v23 = v12;
  NSUInteger v24 = v17;
  dispatch_async(eventQueue, block);
}

void __89__SCROBrailleDisplayManager_brailleDisplay_didPanRight_elementToken_appToken_lineOffset___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) stateForDisplay:*(void *)(a1 + 40)] == 1) {
    id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 48) + 72));
  }
  else {
    id WeakRetained = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__SCROBrailleDisplayManager_brailleDisplay_didPanRight_elementToken_appToken_lineOffset___block_invoke_2;
  block[3] = &unk_264414948;
  id v5 = WeakRetained;
  id v6 = *(id *)(a1 + 56);
  id v7 = *(id *)(a1 + 64);
  id v8 = *(id *)(a1 + 72);
  id v9 = *(id *)(a1 + 80);
  id v3 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

uint64_t __89__SCROBrailleDisplayManager_brailleDisplay_didPanRight_elementToken_appToken_lineOffset___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) handleBrailleDidPanRight:*(void *)(a1 + 40) elementToken:*(void *)(a1 + 48) appToken:*(void *)(a1 + 56) lineOffset:*(void *)(a1 + 64)];
}

- (id)brailleInputManager
{
  return 0;
}

- (id)newBrailleDisplayCommandDispatcher
{
  return 0;
}

- (void)playBorderHitSoundForBrailleDisplay:(id)a3
{
  id v3 = [(SCROBrailleDisplayManager *)self delegate];
  [v3 handlePlayBorderHitSound];
}

- (void)playCommandNotSupportedSoundForBrailleDisplay:(id)a3
{
  id v3 = [(SCROBrailleDisplayManager *)self delegate];
  [v3 handlePlayCommandNotSupportedSound];
}

- (void)handlePlanarPanFailedIsLeft:(BOOL)a3
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __57__SCROBrailleDisplayManager_handlePlanarPanFailedIsLeft___block_invoke;
  v3[3] = &unk_2644145D8;
  v3[4] = self;
  BOOL v4 = a3;
  dispatch_async(MEMORY[0x263EF83A0], v3);
}

void __57__SCROBrailleDisplayManager_handlePlanarPanFailedIsLeft___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  [WeakRetained handlePlanarPanFailedIsLeft:*(unsigned __int8 *)(a1 + 40)];
}

- (void)loadBLEDriverWithIdentifier:(id)a3
{
  id v3 = a3;
  id v4 = +[SCROBrailleDisplayAutoDetector sharedDetector];
  [v4 addAutodetectBLEIdentifier:v3];
}

- (void)_loadStealthDisplay
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SCROBrailleDisplayManager__loadStealthDisplay__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

void __48__SCROBrailleDisplayManager__loadStealthDisplay__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_eventQueue_loadStealthDisplay");
  id v2 = *(void **)(a1 + 32);
  id v3 = +[SCROVirtualBrailleDisplay systemDisplay];
  objc_msgSend(*(id *)(a1 + 32), "setSystemVirtualDisplayToken:", objc_msgSend(v2, "_eventQueue_loadVirtualDisplay:", v3));
}

- (void)_unloadStealthDisplay
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SCROBrailleDisplayManager__unloadStealthDisplay__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __50__SCROBrailleDisplayManager__unloadStealthDisplay__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_unloadStealthDisplay");
}

- (void)_eventQueue_loadStealthDisplay
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (!self->_stealthBrailleDisplay && self->_isValid)
  {
    uint64_t v3 = +[SCROStealthBrailleDisplay displayWithDelegate:self];
    if (v3)
    {
      id obj = (id)v3;
      [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue addDisplay:v3 withState:4];
      objc_storeStrong((id *)&self->_stealthBrailleDisplay, obj);
    }
    MEMORY[0x270F9A790]();
  }
}

- (void)_eventQueue_unloadStealthDisplay
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue removeDisplay:self->_stealthBrailleDisplay];
  stealthBrailleDisplay = self->_stealthBrailleDisplay;
  self->_stealthBrailleDisplay = 0;
}

- (unint64_t)loadVirtualDisplayWithMainSize:(int64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __60__SCROBrailleDisplayManager_loadVirtualDisplayWithMainSize___block_invoke;
  block[3] = &unk_264414998;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(eventQueue, block);
  unint64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

void __60__SCROBrailleDisplayManager_loadVirtualDisplayWithMainSize___block_invoke(void *a1)
{
  id v2 = (void *)a1[4];
  uint64_t v3 = [[SCROVirtualBrailleDisplay alloc] initWithMainSize:a1[6]];
  *(void *)(*(void *)(a1[5] + 8) + 24) = objc_msgSend(v2, "_eventQueue_loadVirtualDisplay:", v3);
}

- (unint64_t)_eventQueue_loadVirtualDisplay:(id)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 _delayedDisplayLoad];
  [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue addDisplay:v4 withState:4];
  virtualDisplays = self->_virtualDisplays;
  id v6 = [NSNumber numberWithUnsignedInteger:_eventQueue_loadVirtualDisplay__token];
  [(NSMutableDictionary *)virtualDisplays setObject:v4 forKey:v6];

  uint64_t v7 = _SCROD_LOG();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    id v8 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v4, "mainSize"));
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:_eventQueue_loadVirtualDisplay__token];
    int v12 = 138412546;
    id v13 = v8;
    __int16 v14 = 2112;
    id v15 = v9;
    _os_log_impl(&dword_21C66E000, v7, OS_LOG_TYPE_DEFAULT, "Virtual display with %@ main cells loaded. Token: %@", (uint8_t *)&v12, 0x16u);
  }
  unint64_t v10 = _eventQueue_loadVirtualDisplay__token++;

  return v10;
}

- (void)unloadVirtualDisplay:(unint64_t)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SCROBrailleDisplayManager_unloadVirtualDisplay___block_invoke;
  v4[3] = &unk_2644149C0;
  v4[4] = self;
  v4[5] = a3;
  dispatch_sync(eventQueue, v4);
}

uint64_t __50__SCROBrailleDisplayManager_unloadVirtualDisplay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_unloadVirtualDisplay:", *(void *)(a1 + 40));
}

- (void)_eventQueue_unloadVirtualDisplay:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x263EF8340];
  virtualDisplays = self->_virtualDisplays;
  id v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  uint64_t v7 = [(NSMutableDictionary *)virtualDisplays objectForKey:v6];

  if (v7)
  {
    [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue removeDisplay:v7];
    id v8 = self->_virtualDisplays;
    uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
    [(NSMutableDictionary *)v8 removeObjectForKey:v9];

    unint64_t v10 = _SCROD_LOG();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [NSNumber numberWithUnsignedInteger:a3];
      int v13 = 138412290;
      __int16 v14 = v11;
      int v12 = "Virtual display with token %@ unloaded.";
LABEL_6:
      _os_log_impl(&dword_21C66E000, v10, OS_LOG_TYPE_DEFAULT, v12, (uint8_t *)&v13, 0xCu);
    }
  }
  else
  {
    unint64_t v10 = _SCROD_LOG();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = [NSNumber numberWithUnsignedInteger:a3];
      int v13 = 138412290;
      __int16 v14 = v11;
      int v12 = "Virtual display with token %@ not found.";
      goto LABEL_6;
    }
  }
}

- (id)mainCellsForVirtualDisplay:(unint64_t)a3
{
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  unint64_t v10 = __Block_byref_object_copy__0;
  id v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SCROBrailleDisplayManager_mainCellsForVirtualDisplay___block_invoke;
  block[3] = &unk_264414998;
  void block[4] = self;
  void block[5] = &v7;
  block[6] = a3;
  dispatch_sync(eventQueue, block);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __56__SCROBrailleDisplayManager_mainCellsForVirtualDisplay___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_eventQueue_mainCellsForVirtualDisplay:", *(void *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;

  return MEMORY[0x270F9A758](v2);
}

- (id)_eventQueue_mainCellsForVirtualDisplay:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x263EF8340];
  virtualDisplays = self->_virtualDisplays;
  id v5 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v6 = [(NSMutableDictionary *)virtualDisplays objectForKey:v5];

  if (v6)
  {
    uint64_t v7 = [v6 mainCells];
    id v8 = _SCROD_LOG();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = [NSNumber numberWithUnsignedInteger:a3];
      int v12 = 138412546;
      int v13 = v9;
      __int16 v14 = 2112;
      uint64_t v15 = v7;
      _os_log_impl(&dword_21C66E000, v8, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@ is displaying \"%@\"", (uint8_t *)&v12, 0x16u);
    }
  }
  else
  {
    id v8 = _SCROD_LOG();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
      int v12 = 138412290;
      int v13 = v10;
      _os_log_impl(&dword_21C66E000, v8, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@ not found.", (uint8_t *)&v12, 0xCu);
    }
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)virtualDisplay:(unint64_t)a3 pressButton:(unint64_t)a4
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SCROBrailleDisplayManager_virtualDisplay_pressButton___block_invoke;
  block[3] = &unk_2644149E8;
  void block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(eventQueue, block);
}

uint64_t __56__SCROBrailleDisplayManager_virtualDisplay_pressButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_virtualDisplay:pressButton:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_eventQueue_virtualDisplay:(unint64_t)a3 pressButton:(unint64_t)a4
{
  uint64_t v14 = *MEMORY[0x263EF8340];
  virtualDisplays = self->_virtualDisplays;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v8 = [(NSMutableDictionary *)virtualDisplays objectForKey:v7];

  if (v8)
  {
    switch(a4)
    {
      case 0uLL:
        [v8 pressPanLeft];
        uint64_t v9 = _SCROD_LOG();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
          int v12 = 138412290;
          int v13 = v10;
          id v11 = "Virtual display with token %@: pan left pressed.";
          goto LABEL_15;
        }
        break;
      case 1uLL:
        [v8 pressPanRight];
        uint64_t v9 = _SCROD_LOG();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
          int v12 = 138412290;
          int v13 = v10;
          id v11 = "Virtual display with token %@: pan right pressed.";
          goto LABEL_15;
        }
        break;
      case 2uLL:
        [v8 pressPrevious];
        uint64_t v9 = _SCROD_LOG();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
          int v12 = 138412290;
          int v13 = v10;
          id v11 = "Virtual display with token %@: previous pressed.";
          goto LABEL_15;
        }
        break;
      case 3uLL:
        [v8 pressNext];
        uint64_t v9 = _SCROD_LOG();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
          int v12 = 138412290;
          int v13 = v10;
          id v11 = "Virtual display with token %@: next pressed.";
          goto LABEL_15;
        }
        break;
      default:
        uint64_t v9 = _SCROD_LOG();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v10 = [NSNumber numberWithUnsignedInteger:a4];
          int v12 = 138412290;
          int v13 = v10;
          id v11 = "Undefined button number: %@";
          goto LABEL_15;
        }
        break;
    }
  }
  else
  {
    uint64_t v9 = _SCROD_LOG();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t v10 = [NSNumber numberWithUnsignedInteger:a3];
      int v12 = 138412290;
      int v13 = v10;
      id v11 = "Virtual display with token %@ not found.";
LABEL_15:
      _os_log_impl(&dword_21C66E000, v9, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)virtualDisplay:(unint64_t)a3 pressKeyChord:(unint64_t)a4
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __58__SCROBrailleDisplayManager_virtualDisplay_pressKeyChord___block_invoke;
  block[3] = &unk_2644149E8;
  void block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(eventQueue, block);
}

uint64_t __58__SCROBrailleDisplayManager_virtualDisplay_pressKeyChord___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_virtualDisplay:pressKeyChord:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)systemVirtualDisplayPressKeyChord:(unint64_t)a3
{
  unint64_t v5 = [(SCROBrailleDisplayManager *)self systemVirtualDisplayToken];

  [(SCROBrailleDisplayManager *)self virtualDisplay:v5 pressKeyChord:a3];
}

- (void)_eventQueue_virtualDisplay:(unint64_t)a3 pressKeyChord:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  virtualDisplays = self->_virtualDisplays;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v8 = [(NSMutableDictionary *)virtualDisplays objectForKey:v7];

  uint64_t v9 = _SCROD_LOG();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      id v11 = [NSNumber numberWithUnsignedInteger:a3];
      int v12 = [NSNumber numberWithUnsignedInteger:a4];
      int v14 = 138412546;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_21C66E000, v9, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@: keychord %@ pressed.", (uint8_t *)&v14, 0x16u);
    }
    [v8 pressKeyChord:a4];
  }
  else
  {
    if (v10)
    {
      int v13 = [NSNumber numberWithUnsignedInteger:a3];
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_impl(&dword_21C66E000, v9, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@ not found.", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)virtualDisplay:(unint64_t)a3 pressRouterWithIndex:(unint64_t)a4
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SCROBrailleDisplayManager_virtualDisplay_pressRouterWithIndex___block_invoke;
  block[3] = &unk_2644149E8;
  void block[4] = self;
  void block[5] = a3;
  block[6] = a4;
  dispatch_sync(eventQueue, block);
}

uint64_t __65__SCROBrailleDisplayManager_virtualDisplay_pressRouterWithIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_virtualDisplay:pressRouterWithIndex:", *(void *)(a1 + 40), *(void *)(a1 + 48));
}

- (void)_eventQueue_virtualDisplay:(unint64_t)a3 pressRouterWithIndex:(unint64_t)a4
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  virtualDisplays = self->_virtualDisplays;
  uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:");
  id v8 = [(NSMutableDictionary *)virtualDisplays objectForKey:v7];

  uint64_t v9 = _SCROD_LOG();
  BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v10)
    {
      id v11 = [NSNumber numberWithUnsignedInteger:a3];
      int v12 = [NSNumber numberWithUnsignedInteger:a4];
      int v14 = 138412546;
      uint64_t v15 = v11;
      __int16 v16 = 2112;
      id v17 = v12;
      _os_log_impl(&dword_21C66E000, v9, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@: router with index %@ pressed.", (uint8_t *)&v14, 0x16u);
    }
    [v8 pressRouterWithIndex:a4];
  }
  else
  {
    if (v10)
    {
      int v13 = [NSNumber numberWithUnsignedInteger:a3];
      int v14 = 138412290;
      uint64_t v15 = v13;
      _os_log_impl(&dword_21C66E000, v9, OS_LOG_TYPE_DEFAULT, "Virtual display with token %@ not found.", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (id)driverConfiguration
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  BOOL v10 = __Block_byref_object_copy__0;
  id v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SCROBrailleDisplayManager_driverConfiguration__block_invoke;
  v6[3] = &unk_264414790;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __48__SCROBrailleDisplayManager_driverConfiguration__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_eventQueue_driverConfiguration");
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (id)_eventQueue_driverConfiguration
{
  uint64_t v64 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  displayConfigurationDict = self->_displayConfigurationDict;
  if (displayConfigurationDict)
  {
    CFDictionaryRef Copy = CFDictionaryCreateCopy((CFAllocatorRef)*MEMORY[0x263EFFB08], displayConfigurationDict);
    if (Copy)
    {
      id v5 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
      id v6 = (void *)[v5 mutableCopy];

      uint64_t v7 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activePendingDisplays];
      id v8 = (void *)[v7 copy];

      uint64_t v9 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue sleepingDisplays];
      BOOL v10 = (void *)[v9 copy];

      id v11 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue disconnectedDisplays];
      id v12 = (void *)[v11 copy];

      int v13 = self->_stealthBrailleDisplay;
      char v14 = 0;
      goto LABEL_6;
    }
  }
  else
  {
    CFDictionaryRef Copy = 0;
  }
  int v13 = 0;
  id v12 = 0;
  BOOL v10 = 0;
  id v8 = 0;
  id v6 = 0;
  char v14 = 1;
LABEL_6:
  uint64_t v15 = _SCROD_LOG();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543618;
    v61 = v6;
    __int16 v62 = 2114;
    long long v63 = v8;
    _os_log_impl(&dword_21C66E000, v15, OS_LOG_TYPE_DEFAULT, "active: %{public}@ pending %{public}@", buf, 0x16u);
  }

  if (v14)
  {
    __int16 v16 = 0;
  }
  else
  {
    unsigned int v39 = v10;
    __int16 v16 = [MEMORY[0x263EFF980] arrayWithCapacity:CFDictionaryGetCount(Copy)];
    [v6 removeObject:v13];
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v17 = v6;
    uint64_t v18 = [v17 countByEnumeratingWithState:&v52 objects:v59 count:16];
    if (v18)
    {
      uint64_t v19 = v18;
      uint64_t v20 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v19; ++i)
        {
          if (*(void *)v53 != v20) {
            objc_enumerationMutation(v17);
          }
          _addDisplayConfigurationToList(*(void **)(*((void *)&v52 + 1) + 8 * i), v16, Copy, 1);
        }
        uint64_t v19 = [v17 countByEnumeratingWithState:&v52 objects:v59 count:16];
      }
      while (v19);
    }

    if ([v16 count])
    {
      id v22 = [v16 objectAtIndex:0];
      [v22 setObject:MEMORY[0x263EFFA88] forKey:kSCROBrailleDisplayIsPrimary[0]];
    }
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    id v23 = v8;
    uint64_t v24 = [v23 countByEnumeratingWithState:&v48 objects:v58 count:16];
    if (v24)
    {
      uint64_t v25 = v24;
      uint64_t v26 = *(void *)v49;
      do
      {
        for (uint64_t j = 0; j != v25; ++j)
        {
          if (*(void *)v49 != v26) {
            objc_enumerationMutation(v23);
          }
          _addDisplayConfigurationToList(*(void **)(*((void *)&v48 + 1) + 8 * j), v16, Copy, 2);
        }
        uint64_t v25 = [v23 countByEnumeratingWithState:&v48 objects:v58 count:16];
      }
      while (v25);
    }

    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v28 = v39;
    uint64_t v29 = [v28 countByEnumeratingWithState:&v44 objects:v57 count:16];
    if (v29)
    {
      uint64_t v30 = v29;
      uint64_t v31 = *(void *)v45;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v45 != v31) {
            objc_enumerationMutation(v28);
          }
          _addDisplayConfigurationToList(*(void **)(*((void *)&v44 + 1) + 8 * k), v16, Copy, 3);
        }
        uint64_t v30 = [v28 countByEnumeratingWithState:&v44 objects:v57 count:16];
      }
      while (v30);
    }

    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v33 = v12;
    uint64_t v34 = [v33 countByEnumeratingWithState:&v40 objects:v56 count:16];
    if (v34)
    {
      uint64_t v35 = v34;
      uint64_t v36 = *(void *)v41;
      do
      {
        for (uint64_t m = 0; m != v35; ++m)
        {
          if (*(void *)v41 != v36) {
            objc_enumerationMutation(v33);
          }
          _addDisplayConfigurationToList(*(void **)(*((void *)&v40 + 1) + 8 * m), v16, Copy, 0);
        }
        uint64_t v35 = [v33 countByEnumeratingWithState:&v40 objects:v56 count:16];
      }
      while (v35);
    }

    CFRelease(Copy);
    BOOL v10 = v39;
  }

  return v16;
}

- (void)_blankOutDisplaysInQueue:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [[SCROBrailleFormatter alloc] initWithOutputTableIdentifier:self->_outputTableIdentifier inputTableIdentifier:self->_inputTableIdentifier showDotsSevenAndEight:1];
  id v6 = objc_alloc_init(MEMORY[0x263EFF8F8]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v7 = v4;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        objc_msgSend(v12, "setBrailleFormatter:", v5, (void)v13);
        [v12 setAggregatedStatus:v6];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v9);
  }
}

- (BOOL)isConfigured
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  uint64_t v11 = 0;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SCROBrailleDisplayManager_isConfigured__block_invoke;
  block[3] = &unk_264414A10;
  void block[4] = self;
  void block[5] = &v8;
  block[6] = &v12;
  dispatch_sync(eventQueue, block);
  uint64_t v4 = v9[3];
  if (*((unsigned char *)v13 + 24)) {
    v9[3] = --v4;
  }
  BOOL v5 = v4 > 0;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __41__SCROBrailleDisplayManager_isConfigured__block_invoke(void *a1)
{
  uint64_t result = [*(id *)(a1[4] + 16) displayCountIncludingDisconnectedDisplays:0];
  *(void *)(*(void *)(a1[5] + 8) + 24) = result;
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = *(void *)(a1[4] + 32) != 0;
  return result;
}

- (BOOL)hasActiveUserDisplays
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v12 = 0;
  long long v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SCROBrailleDisplayManager_hasActiveUserDisplays__block_invoke;
  block[3] = &unk_264414A10;
  void block[4] = self;
  void block[5] = &v12;
  block[6] = &v8;
  dispatch_sync(eventQueue, block);
  unint64_t v4 = v13[3];
  if (*((unsigned char *)v9 + 24)) {
    v13[3] = --v4;
  }
  BOOL v5 = v4 > 1;
  _Block_object_dispose(&v8, 8);
  _Block_object_dispose(&v12, 8);
  return v5;
}

uint64_t __50__SCROBrailleDisplayManager_hasActiveUserDisplays__block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 16) activeDisplays];
  *(void *)(*(void *)(a1[5] + 8) + 24) = [v2 count];

  uint64_t result = [*(id *)(a1[4] + 16) stateForDisplay:*(void *)(a1[4] + 32)];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = result == 1;
  return result;
}

- (void)setPrimaryBrailleDisplay:(int)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SCROBrailleDisplayManager_setPrimaryBrailleDisplay___block_invoke;
  v4[3] = &unk_264414A38;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __54__SCROBrailleDisplayManager_setPrimaryBrailleDisplay___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setPrimaryDisplay:", *(unsigned int *)(a1 + 40));
}

- (void)_eventQueue_setPrimaryDisplay:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  int v5 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue displayForToken:v3];
  if (v5)
  {
    id v6 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue primaryDisplay];
    if (v5 != v6
      && ([(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue setPrimaryDisplay:v5],
          [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue primaryDisplay],
          id v7 = objc_claimAutoreleasedReturnValue(),
          v7,
          v5 == v7))
    {
      [v6 setDelegateWantsDisplayCallback:0];
      [v6 setInputAllowed:self->_inputAccessMode == 1];
      [v5 setDelegateWantsDisplayCallback:self->_lineDescriptorDisplayCallbackEnabled];
      [v5 setInputAllowed:1];
      id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    }
    else
    {
      id WeakRetained = 0;
    }
  }
  else
  {
    id WeakRetained = 0;
  }
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __59__SCROBrailleDisplayManager__eventQueue_setPrimaryDisplay___block_invoke;
  block[3] = &unk_264414590;
  id v13 = WeakRetained;
  id v9 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
  uint64_t v10 = [(SCROBrailleDisplayManager *)self brailleInputManager];
  char v11 = [(SCROBrailleDisplayManager *)self _eventQueue_driverConfiguration];
  [v10 configureWithDriverConfiguration:v11];
}

uint64_t __59__SCROBrailleDisplayManager__eventQueue_setPrimaryDisplay___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) configurationDidChange];
}

- (void)setDisplayInputAccessMode:(int)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SCROBrailleDisplayManager_setDisplayInputAccessMode___block_invoke;
  v4[3] = &unk_264414A38;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __55__SCROBrailleDisplayManager_setDisplayInputAccessMode___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setDisplayInputAccessMode:", *(unsigned int *)(a1 + 40));
}

- (int)displayInputAccessMode
{
  uint64_t v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SCROBrailleDisplayManager_displayInputAccessMode__block_invoke;
  v5[3] = &unk_264414790;
  void v5[4] = v2;
  v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __51__SCROBrailleDisplayManager_displayInputAccessMode__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 232);
  return result;
}

- (void)_eventQueue_setDisplayInputAccessMode:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  self->_int inputAccessMode = a3;
  int v5 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
  id v11 = (id)[v5 copy];

  uint64_t v6 = [v11 count];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [v11 objectAtIndex:0];
    [v8 setInputAllowed:a3 < 2];

    if (v7 != 1)
    {
      for (uint64_t i = 1; i != v7; ++i)
      {
        uint64_t v10 = [v11 objectAtIndex:i];
        [v10 setInputAllowed:a3 == 1];
      }
    }
  }
}

- (void)setMainAttributedString:(id)a3
{
}

- (void)setMainAttributedString:(id)a3 forceUpdate:(BOOL)a4
{
  id v6 = a3;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SCROBrailleDisplayManager_setMainAttributedString_forceUpdate___block_invoke;
  block[3] = &unk_264414858;
  void block[4] = self;
  id v10 = v6;
  BOOL v11 = a4;
  id v8 = v6;
  dispatch_async(eventQueue, block);
}

void __65__SCROBrailleDisplayManager_setMainAttributedString_forceUpdate___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setMainAttributedString:shouldDisplay:forceUpdate:", *(void *)(a1 + 40), 1, *(unsigned __int8 *)(a1 + 48));
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SCROBrailleDisplayManager_setMainAttributedString_forceUpdate___block_invoke_2;
  block[3] = &unk_264414858;
  uint64_t v2 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v4 = v2;
  char v5 = *(unsigned char *)(a1 + 48);
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __65__SCROBrailleDisplayManager_setMainAttributedString_forceUpdate___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) eventHandled];

  if (v2)
  {
    id v6 = [*(id *)(a1 + 32) eventHandled];
    uint64_t v3 = *(void *)(a1 + 40);
    id v4 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
    char v5 = +[SCROBrailleEvent eventWithType:0 data:v3 data2:v4 data3:0];
    v6[2](v6, v5);
  }
}

- (id)mainAttributedString
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  BOOL v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __49__SCROBrailleDisplayManager_mainAttributedString__block_invoke;
  v6[3] = &unk_264414790;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __49__SCROBrailleDisplayManager_mainAttributedString__block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_eventQueue_mainAttributedString");
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;

  return MEMORY[0x270F9A758](v2);
}

- (id)_eventQueue_mainAttributedString
{
  uint64_t v2 = (void *)[(NSAttributedString *)self->_mainString copy];

  return v2;
}

- (void)_eventQueue_setMainAttributedString:(id)a3 shouldDisplay:(BOOL)a4 forceUpdate:(BOOL)a5
{
  BOOL v5 = a4;
  uint64_t v6 = (uint64_t)a3;
  uint64_t v56 = *MEMORY[0x263EF8340];
  id v8 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if ([v8 length])
  {
    uint64_t v9 = [[SCROBrailleFormatter alloc] initWithOutputTableIdentifier:self->_outputTableIdentifier inputTableIdentifier:self->_inputTableIdentifier showDotsSevenAndEight:self->_showDotsSevenAndEight];
    id v10 = [v8 attribute:kSCROLineFocusAttribute[0] atIndex:0 effectiveRange:0];
    id v11 = v10;
    if (v10) {
      uint64_t v12 = [v10 unsignedIntegerValue];
    }
    else {
      uint64_t v12 = 0;
    }
    [(SCROBrailleFormatter *)v9 setLineFocus:v12];
    v53[0] = 0;
    v53[1] = 0;
    id v13 = [(NSMutableArray *)self->_displayModeStack lastObject];
    uint64_t v14 = v13;
    if (v13) {
      int v15 = [v13 intValue];
    }
    else {
      int v15 = 0;
    }

    int v16 = [v8 getRange:v53 ofAttribute:kSCROTokenAttribute[0]];
    v52[0] = 0;
    v52[1] = 0;
    [v8 getRange:v52 ofAttribute:kSCROTerminalOutputAttribute[0]];
    if (v16)
    {
      id v17 = [MEMORY[0x263F2BA98] manager];
      BOOL v48 = v5;
      if ([v17 isShowingAlert])
      {

        goto LABEL_15;
      }
      uint64_t v19 = [MEMORY[0x263F2BA98] manager];
      char v20 = [v19 isCandidateSelectionActive];

      if ((v20 & 1) == 0)
      {
LABEL_15:
        if (!v15
          || v15 == 5
          || v15 == 1 && [(NSMutableArray *)self->_displayModeStack count] == 1 && self->_alertPriority > 5u)
        {
          objc_storeStrong((id *)&self->_mainString, (id)v6);
          [(SCROBrailleDisplayManager *)self _eventQueue_stopAlertTimer];
          objc_storeStrong((id *)&self->_lineString, self->_mainString);
          if (v15)
          {
            [(SCROBrailleDisplayManager *)self _eventQueue_doSetDisplayMode:0];
            id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
          }
          else
          {
            id WeakRetained = 0;
          }
          uint64_t v6 = 0;
LABEL_41:
          id v37 = [v8 attribute:kSCROBrailleOffsetAttribute[0] atIndex:0 effectiveRange:0];
          uint64_t v38 = [v37 integerValue];

          [(SCROBrailleFormatter *)v9 setLineOffset:v38];
          unsigned int v39 = _SCROD_LOG();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            int v55 = v38;
            _os_log_impl(&dword_21C66E000, v39, OS_LOG_TYPE_INFO, "Setting line offset: %d", buf, 8u);
          }

          [(SCROBrailleFormatter *)v9 setCurrentUnread:0];
          [(SCROBrailleFormatter *)v9 setAnyUnread:[(SCROBrailleDisplayHistory *)self->_history hasUnread]];
          [(SCROBrailleFormatter *)v9 setDisplayMode:v6];
          long long v40 = [v8 attribute:kSCROAppTokenAttribute[0] atIndex:0 effectiveRange:0];
          [(SCROBrailleFormatter *)v9 setAppToken:v40];
          [(SCROBrailleDisplayManager *)self tokenizeString:v8 intoFormatter:v9 selection:v53];

          if (v16)
          {
            if (!v48) {
              goto LABEL_56;
            }
LABEL_55:
            [(SCROBrailleDisplayManager *)self _setBrailleFormatter:v9];
            long long v44 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
            long long v45 = (void *)[v44 copy];

            [v45 makeObjectsPerformSelector:sel_setBrailleFormatter_ withObject:v9];
            goto LABEL_56;
          }
          [(SCROBrailleDisplayManager *)self _eventQueue_resetAlertTimer];
          if (v48) {
            goto LABEL_55;
          }
LABEL_56:
          if (WeakRetained)
          {
            block[0] = MEMORY[0x263EF8330];
            block[1] = 3221225472;
            block[2] = __91__SCROBrailleDisplayManager__eventQueue_setMainAttributedString_shouldDisplay_forceUpdate___block_invoke;
            block[3] = &unk_264414A38;
            id v50 = WeakRetained;
            int v51 = v6;
            id v11 = WeakRetained;
            dispatch_async(MEMORY[0x263EF83A0], block);

            goto LABEL_58;
          }
LABEL_59:

          goto LABEL_60;
        }
        objc_storeStrong((id *)&self->_lineString, (id)v6);
      }
LABEL_27:
      uint64_t v26 = 0;
LABEL_28:

      uint64_t v9 = v26;
LABEL_58:

      goto LABEL_59;
    }
    if ([v8 getRange:v53 ofAttribute:kSCROAlertAttribute[0]])
    {
      objc_storeStrong((id *)&self->_mainString, (id)v6);
      if (v15 == 1)
      {
        id WeakRetained = 0;
      }
      else
      {
        [(SCROBrailleDisplayManager *)self _eventQueue_doSetDisplayMode:1];
        id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      }
      [(SCROBrailleDisplayHistory *)self->_history addString:v8];
      id v27 = [v8 attribute:kSCROAlertTimeoutAttribute[0] atIndex:0 effectiveRange:0];
      [v27 doubleValue];
      double v29 = v28;

      double v30 = 0.0;
      if (v29 >= 0.0) {
        double v30 = v29;
      }
      self->_alertTimeout = fmin(v30, 60.0);
      uint64_t v31 = [v8 attribute:kSCROAlertPriorityAttribute[0] atIndex:0 effectiveRange:0];
      id v32 = v31;
      BOOL v48 = v5;
      if (v31) {
        int v33 = [v31 intValue];
      }
      else {
        int v33 = 5;
      }
      self->_alertPriority = v33;

      uint64_t v6 = 1;
      goto LABEL_41;
    }
    if (SCROBrailleDisplayHistoryIsHistoryString(v8))
    {
      if (v15 != 2) {
        goto LABEL_27;
      }
      [(SCROBrailleDisplayManagerStatus *)self->_status setCurrentAnnouncementUnread:SCROBrailleDisplayHistoryIsStringUnread(v8)];
      [(SCROBrailleDisplayManagerStatus *)self->_status setAnyUnreadAnnouncements:[(SCROBrailleDisplayHistory *)self->_history hasUnread]];
      objc_storeStrong((id *)&self->_mainString, (id)v6);
      [(SCROBrailleFormatter *)v9 setCurrentUnread:[(SCROBrailleDisplayManagerStatus *)self->_status currentAnnouncementUnread]];
      BOOL v21 = [(SCROBrailleDisplayManagerStatus *)self->_status anyUnreadAnnouncements];
      id v22 = v9;
    }
    else
    {
      uint64_t v34 = [v8 attribute:kSCROStatusAttribute[0] atIndex:0 effectiveRange:0];

      if (v34)
      {
        BOOL v35 = [(SCROBrailleFormatter *)self->_currentBrailleFormatter currentUnread];
        BOOL v36 = [(SCROBrailleFormatter *)self->_currentBrailleFormatter anyUnread];
        if (v15 == 3)
        {
          id WeakRetained = 0;
        }
        else
        {
          [(SCROBrailleDisplayManager *)self _eventQueue_doSetDisplayMode:3];
          id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
        }
        objc_storeStrong((id *)&self->_mainString, (id)v6);
        objc_storeStrong((id *)&self->_statusString, self->_mainString);
        [(SCROBrailleFormatter *)v9 setCurrentUnread:v35];
        [(SCROBrailleFormatter *)v9 setAnyUnread:v36];
        LODWORD(v6) = 3;
        [(SCROBrailleFormatter *)v9 setDisplayMode:3];
        [(SCROBrailleFormatter *)v9 setStatusText:self->_mainString];

        if (v5) {
          goto LABEL_55;
        }
        goto LABEL_56;
      }
      uint64_t v41 = [(SCROBrailleDisplayHistory *)self->_history isOnMostRecent];
      [(SCROBrailleDisplayHistory *)self->_history addString:v8];
      if ((v41 & 1) == 0 && v15 == 2)
      {
        BOOL v42 = [(SCROBrailleFormatter *)self->_currentBrailleFormatter currentUnread];
        [(SCROBrailleFormatter *)v9 setAnyUnread:1];
        [(SCROBrailleFormatter *)v9 setCurrentUnread:v42];
        LODWORD(v6) = 2;
        [(SCROBrailleFormatter *)v9 setDisplayMode:2];
        uint64_t v25 = [(SCROBrailleDisplayHistory *)self->_history currentString];
        long long v43 = [v25 string];
        [(SCROBrailleFormatter *)v9 addText:v43 selection:0 token:0 focus:0 isEditableText:0];

        goto LABEL_51;
      }
      if (v15 != 2)
      {
        [(SCROBrailleFormatter *)self->_currentBrailleFormatter setAnyUnread:1];
        uint64_t v26 = self->_currentBrailleFormatter;
        goto LABEL_28;
      }
      [(SCROBrailleDisplayHistory *)self->_history moveToMostRecent];
      long long v46 = [(SCROBrailleDisplayHistory *)self->_history currentString];
      mainString = self->_mainString;
      self->_mainString = v46;

      [(SCROBrailleFormatter *)v9 setCurrentUnread:1];
      id v22 = v9;
      BOOL v21 = 1;
    }
    [(SCROBrailleFormatter *)v22 setAnyUnread:v21];
    LODWORD(v6) = 2;
    [(SCROBrailleFormatter *)v9 setDisplayMode:2];
    id v23 = [(NSAttributedString *)self->_mainString attribute:kSCROTechnicalContextAttribute[0] atIndex:0 effectiveRange:0];
    uint64_t v24 = [v23 BOOLValue];

    uint64_t v25 = [(NSAttributedString *)self->_mainString string];
    [(SCROBrailleFormatter *)v9 addText:v25 selection:0 token:0 focus:0 technical:v24 isEditableText:0];
LABEL_51:

    if (!v5) {
      goto LABEL_59;
    }
    id WeakRetained = 0;
    goto LABEL_55;
  }
LABEL_60:
}

void __91__SCROBrailleDisplayManager__eventQueue_setMainAttributedString_shouldDisplay_forceUpdate___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  id v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [v1 handleDisplayModeChanged:v2];
}

- (void)_setBrailleFormatter:(id)a3
{
  id v13 = a3;
  objc_storeStrong((id *)&self->_currentBrailleFormatter, a3);
  BOOL v5 = [MEMORY[0x263F2BA78] sharedModel];
  objc_msgSend(v5, "setTechnicalMode:", objc_msgSend(v13, "needsTechnicalMode"));

  LODWORD(self) = [v13 displayMode];
  int v6 = [v13 displayMode];
  if (self == 2 || (v7 = v6, int v8 = [v13 displayMode], v7 == 1))
  {
    uint64_t v9 = [MEMORY[0x263F2BA78] sharedModel];
    id v10 = [v13 editString];
    [v9 setAlert:v10];
  }
  else
  {
    int v11 = v8;
    uint64_t v12 = [MEMORY[0x263F2BA78] sharedModel];
    objc_msgSend(v12, "setEditable:", objc_msgSend(v13, "isEditableText"));

    uint64_t v9 = [MEMORY[0x263F2BA78] sharedModel];
    id v10 = [v13 editString];
    if (v11 == 5) {
      [v9 setTerminalOutput:v10];
    }
    else {
      [v9 setScript:v10];
    }
  }
}

- (void)setAggregatedStatus:(id)a3
{
  id v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __49__SCROBrailleDisplayManager_setAggregatedStatus___block_invoke;
  v7[3] = &unk_264414808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(eventQueue, v7);
}

uint64_t __49__SCROBrailleDisplayManager_setAggregatedStatus___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setAggregatedStatus:", *(void *)(a1 + 40));
}

- (id)aggregatedStatus
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__0;
  int v11 = __Block_byref_object_dispose__0;
  id v12 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __45__SCROBrailleDisplayManager_aggregatedStatus__block_invoke;
  v6[3] = &unk_264414790;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  id v4 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  return v4;
}

void __45__SCROBrailleDisplayManager_aggregatedStatus__block_invoke(uint64_t a1)
{
  id v5 = [*(id *)(*(void *)(a1 + 32) + 200) aggregatedData];
  uint64_t v2 = [v5 copy];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (void)_eventQueue_setAggregatedStatus:(id)a3
{
  eventQueue = self->_eventQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(eventQueue);
  [(SCROBrailleDisplayManagerStatus *)self->_status setAggregatedData:v5];
  id v6 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
  id v7 = (id)[v6 copy];

  [v7 makeObjectsPerformSelector:sel_setAggregatedStatus_ withObject:v5];
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SCROBrailleDisplayManager_setMasterStatusCellIndex___block_invoke;
  v4[3] = &unk_2644149C0;
  v4[4] = self;
  void v4[5] = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __54__SCROBrailleDisplayManager_setMasterStatusCellIndex___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setMasterStatusCellIndex:", *(void *)(a1 + 40));
}

- (int64_t)masterStatusCellIndex
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __50__SCROBrailleDisplayManager_masterStatusCellIndex__block_invoke;
  v6[3] = &unk_264414790;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  int64_t v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __50__SCROBrailleDisplayManager_masterStatusCellIndex__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 200) masterStatusCellIndex];
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_eventQueue_setMasterStatusCellIndex:(int64_t)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  [(SCROBrailleDisplayManagerStatus *)self->_status setMasterStatusCellIndex:a3];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__SCROBrailleDisplayManager__eventQueue_setMasterStatusCellIndex___block_invoke;
  v5[3] = &__block_descriptor_40_e28_v16__0__SCROBrailleDisplay_8l;
  void v5[4] = a3;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v5];
}

uint64_t __66__SCROBrailleDisplayManager__eventQueue_setMasterStatusCellIndex___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setMasterStatusCellIndex:*(void *)(a1 + 32)];
}

- (void)setVirtualStatusAlignment:(int)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SCROBrailleDisplayManager_setVirtualStatusAlignment___block_invoke;
  v4[3] = &unk_264414A38;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __55__SCROBrailleDisplayManager_setVirtualStatusAlignment___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setVirtualStatusAlignment:", *(unsigned int *)(a1 + 40));
}

- (int)virtualStatusAlignment
{
  uint64_t v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SCROBrailleDisplayManager_virtualStatusAlignment__block_invoke;
  v5[3] = &unk_264414790;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

uint64_t __51__SCROBrailleDisplayManager_virtualStatusAlignment__block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 200) virtualAlignment];
  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_eventQueue_setVirtualStatusAlignment:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  [(SCROBrailleDisplayManagerStatus *)self->_status setVirtualAlignment:v3];
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__SCROBrailleDisplayManager__eventQueue_setVirtualStatusAlignment___block_invoke;
  v5[3] = &__block_descriptor_36_e28_v16__0__SCROBrailleDisplay_8l;
  int v6 = v3;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v5];
}

uint64_t __67__SCROBrailleDisplayManager__eventQueue_setVirtualStatusAlignment___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setVirtualStatusAlignment:*(unsigned int *)(a1 + 32)];
}

- (void)panDisplayLeft:(int)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __44__SCROBrailleDisplayManager_panDisplayLeft___block_invoke;
  v4[3] = &unk_264414A38;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __44__SCROBrailleDisplayManager_panDisplayLeft___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_panDisplay:token:", 1, *(unsigned int *)(a1 + 40));
}

- (void)panDisplayRight:(int)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __45__SCROBrailleDisplayManager_panDisplayRight___block_invoke;
  v4[3] = &unk_264414A38;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __45__SCROBrailleDisplayManager_panDisplayRight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_panDisplay:token:", 2, *(unsigned int *)(a1 + 40));
}

- (void)panDisplayBeginning:(int)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __49__SCROBrailleDisplayManager_panDisplayBeginning___block_invoke;
  v4[3] = &unk_264414A38;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __49__SCROBrailleDisplayManager_panDisplayBeginning___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_panDisplay:token:", 3, *(unsigned int *)(a1 + 40));
}

- (void)panDisplayEnd:(int)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __43__SCROBrailleDisplayManager_panDisplayEnd___block_invoke;
  v4[3] = &unk_264414A38;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __43__SCROBrailleDisplayManager_panDisplayEnd___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_panDisplay:token:", 4, *(unsigned int *)(a1 + 40));
}

- (void)_eventQueue_panDisplay:(int64_t)a3 token:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  id v11 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue displayForToken:v4];
  if (-[SCROBrailleDisplayManagedQueue stateForDisplay:](self->_managedDisplayQueue, "stateForDisplay:") != 1)
  {

    id v11 = 0;
  }
  uint64_t v7 = [(NSMutableArray *)self->_displayModeStack lastObject];
  if (v7)
  {
    uint64_t v8 = v7;
    int v9 = [v7 intValue];

    if (v9 == 1) {
      [(SCROBrailleDisplayManager *)self _eventQueue_resetAlertTimer];
    }
  }
  uint64_t v10 = v11;
  switch(a3)
  {
    case 1:
      [v11 panLeft];
      goto LABEL_11;
    case 2:
      [v11 panRight];
      goto LABEL_11;
    case 3:
      [v11 panBeginning];
      goto LABEL_11;
    case 4:
      [v11 panEnd];
LABEL_11:
      uint64_t v10 = v11;
      break;
    default:
      break;
  }
}

- (void)planarPanDisplayLeft:(int)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __50__SCROBrailleDisplayManager_planarPanDisplayLeft___block_invoke;
  v4[3] = &unk_264414A38;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __50__SCROBrailleDisplayManager_planarPanDisplayLeft___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_planarPanDisplay:token:", 1, *(unsigned int *)(a1 + 40));
}

- (void)planarPanDisplayRight:(int)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SCROBrailleDisplayManager_planarPanDisplayRight___block_invoke;
  v4[3] = &unk_264414A38;
  v4[4] = self;
  int v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __51__SCROBrailleDisplayManager_planarPanDisplayRight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_planarPanDisplay:token:", 2, *(unsigned int *)(a1 + 40));
}

- (void)_eventQueue_planarPanDisplay:(int64_t)a3 token:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  id v8 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue displayForToken:v4];
  if (-[SCROBrailleDisplayManagedQueue stateForDisplay:](self->_managedDisplayQueue, "stateForDisplay:") == 1)
  {
    uint64_t v7 = v8;
  }
  else
  {

    uint64_t v7 = 0;
  }
  if (a3 == 2)
  {
    id v9 = v7;
    [v7 planarPanRight];
  }
  else
  {
    if (a3 != 1) {
      goto LABEL_9;
    }
    id v9 = v7;
    [v7 planarPanLeft];
  }
  uint64_t v7 = v9;
LABEL_9:
}

- (void)setUIDisplayMode
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __45__SCROBrailleDisplayManager_setUIDisplayMode__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __45__SCROBrailleDisplayManager_setUIDisplayMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setDisplayMode:", 0);
}

- (void)setAnnouncementsDisplayMode
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SCROBrailleDisplayManager_setAnnouncementsDisplayMode__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __56__SCROBrailleDisplayManager_setAnnouncementsDisplayMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setDisplayMode:", 2);
}

- (void)exitCurrentDisplayMode
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __51__SCROBrailleDisplayManager_exitCurrentDisplayMode__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __51__SCROBrailleDisplayManager_exitCurrentDisplayMode__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_exitCurrentDisplayMode");
}

- (int)displayMode
{
  uint64_t v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __40__SCROBrailleDisplayManager_displayMode__block_invoke;
  v5[3] = &unk_264414790;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return (int)v2;
}

void __40__SCROBrailleDisplayManager_displayMode__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 160) lastObject];
  uint64_t v3 = v2;
  if (v2) {
    int v4 = [v2 intValue];
  }
  else {
    int v4 = 0;
  }

  *(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v4;
}

- (void)_eventQueue_setDisplayMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  int v5 = [(NSMutableArray *)self->_displayModeStack lastObject];
  uint64_t v6 = v5;
  if (v5) {
    int v7 = [v5 intValue];
  }
  else {
    int v7 = 0;
  }

  if (v7 != v3)
  {
    [(SCROBrailleDisplayManager *)self _eventQueue_doSetDisplayMode:v3];
    uint64_t v8 = [(SCROBrailleDisplayManager *)self _eventQueue_cachedMainStringForDisplayMode:v3];
    [(SCROBrailleDisplayManager *)self setMainAttributedString:v8 forceUpdate:1];
    v9[0] = MEMORY[0x263EF8330];
    v9[1] = 3221225472;
    v9[2] = __56__SCROBrailleDisplayManager__eventQueue_setDisplayMode___block_invoke;
    v9[3] = &unk_264414A38;
    void v9[4] = self;
    int v10 = v3;
    dispatch_async(MEMORY[0x263EF83A0], v9);
  }
}

void __56__SCROBrailleDisplayManager__eventQueue_setDisplayMode___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  uint64_t v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [WeakRetained handleDisplayModeChanged:v2];
}

- (void)_eventQueue_doSetDisplayMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  int v5 = [NSNumber numberWithInt:v3];
  if (v3 && ![(NSMutableArray *)self->_displayModeStack containsObject:v5])
  {
    int v10 = [(NSMutableArray *)self->_displayModeStack lastObject];
    id v11 = v10;
    if (v10) {
      int v12 = [v10 intValue];
    }
    else {
      int v12 = 0;
    }

    if (v3 == 3)
    {
      if (v12)
      {
        if (v12 == 1) {
          [(SCROBrailleDisplayManager *)self _eventQueue_popDisplayModeStack];
        }
        goto LABEL_31;
      }
    }
    else if (v3 == 2)
    {
      if (v12)
      {
        while (1)
        {
          [(SCROBrailleDisplayManager *)self _eventQueue_popDisplayModeStack];
          id v13 = [(NSMutableArray *)self->_displayModeStack lastObject];
          uint64_t v14 = v13;
          if (!v13) {
            break;
          }
          int v15 = [v13 intValue];

          if (!v15) {
            goto LABEL_23;
          }
        }
      }
LABEL_23:
      [(SCROBrailleDisplayHistory *)self->_history moveToMostRecent];
      [(SCROBrailleDisplayHistory *)self->_history snapshotUnread];
    }
    else if (v12)
    {
LABEL_31:
      [(NSMutableArray *)self->_displayModeStack addObject:v5];
      goto LABEL_32;
    }
    unint64_t v16 = [(SCROBrailleFormatter *)self->_currentBrailleFormatter generationID];
    id v17 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue primaryDisplay];
    uint64_t v18 = [v17 brailleLineGenerationID];
    if (v18 != v16)
    {
      uint64_t v19 = v18;
      char v20 = _SCROD_LOG();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v27 = 134218240;
        *(void *)double v28 = v16;
        *(_WORD *)&v28[8] = 2048;
        *(void *)&v28[10] = v19;
        _os_log_impl(&dword_21C66E000, v20, OS_LOG_TYPE_INFO, "Braille moving too fast, generation mismatch, wait to sync up %lld %lld", (uint8_t *)&v27, 0x16u);
      }

      usleep(0x7A120u);
    }
    self->_int64_t uiStringCachedLineOffset = [v17 lineOffset];
    BOOL v21 = [v17 editingString];
    id v22 = (NSAttributedString *)[v21 copy];
    uiEditingCachedString = self->_uiEditingCachedString;
    self->_uiEditingCachedString = v22;

    uint64_t v24 = _SCROD_LOG();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int64_t uiStringCachedLineOffset = self->_uiStringCachedLineOffset;
      uint64_t v26 = self->_uiEditingCachedString;
      int v27 = 67109378;
      *(_DWORD *)double v28 = uiStringCachedLineOffset;
      *(_WORD *)&v28[4] = 2112;
      *(void *)&v28[6] = v26;
      _os_log_impl(&dword_21C66E000, v24, OS_LOG_TYPE_INFO, "Caching line offset as we go into another mode: offset: %d, editing: %@", (uint8_t *)&v27, 0x12u);
    }

    goto LABEL_31;
  }
  uint64_t v6 = [(NSMutableArray *)self->_displayModeStack count];
  if (v6)
  {
    uint64_t v7 = v6;
    do
    {
      uint64_t v8 = [(NSMutableArray *)self->_displayModeStack lastObject];
      char v9 = [v5 isEqualToNumber:v8];

      if (v9) {
        break;
      }
      [(SCROBrailleDisplayManager *)self _eventQueue_popDisplayModeStack];
      --v7;
    }
    while (v7);
  }
LABEL_32:
}

- (void)_eventQueue_exitCurrentDisplayMode
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if ([(NSMutableArray *)self->_displayModeStack count])
  {
    [(SCROBrailleDisplayManager *)self _eventQueue_popDisplayModeStack];
    uint64_t v3 = [(NSMutableArray *)self->_displayModeStack lastObject];
    int v4 = v3;
    if (v3) {
      uint64_t v5 = [v3 intValue];
    }
    else {
      uint64_t v5 = 0;
    }

    uint64_t v6 = [(SCROBrailleDisplayManager *)self _eventQueue_cachedMainStringForDisplayMode:v5];
    uint64_t v7 = (void *)[v6 mutableCopy];

    if (!v5)
    {
      uint64_t v8 = _SCROD_LOG();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int64_t uiStringCachedLineOffset = self->_uiStringCachedLineOffset;
        *(_DWORD *)buf = 67109120;
        *(_DWORD *)&uint8_t buf[4] = uiStringCachedLineOffset;
        _os_log_impl(&dword_21C66E000, v8, OS_LOG_TYPE_INFO, "Consuming stored lineOffset: %d", buf, 8u);
      }

      int v10 = kSCROBrailleOffsetAttribute[0];
      id v11 = [NSNumber numberWithInteger:self->_uiStringCachedLineOffset];
      objc_msgSend(v7, "addAttribute:value:range:", v10, v11, 0, objc_msgSend(v7, "length"));

      if (self->_uiEditingCachedString)
      {
        *(_OWORD *)buf = xmmword_21C6B9890;
        [v7 getRange:buf ofAttribute:kSCROCursorAttribute[0]];
        if (*(void *)buf != 0x7FFFFFFFFFFFFFFFLL) {
          objc_msgSend(v7, "addAttribute:value:range:", kSCROBrailleEditingStringAttribute[0], self->_uiEditingCachedString, *(void *)buf, *(void *)&buf[8]);
        }
        uiEditingCachedString = self->_uiEditingCachedString;
        self->_uiEditingCachedString = 0;
      }
      self->_int64_t uiStringCachedLineOffset = 0;
    }
    uint64_t v13 = [v7 length];
    objc_msgSend(v7, "removeAttribute:range:", kSCROLineFocusAttribute[0], 0, v13);
    objc_msgSend(v7, "addAttribute:value:range:", kSCROLineFocusAttribute[0], &unk_26CCF1150, 0, v13);
    [(SCROBrailleDisplayManager *)self setMainAttributedString:v7 forceUpdate:1];
    v14[0] = MEMORY[0x263EF8330];
    v14[1] = 3221225472;
    v14[2] = __63__SCROBrailleDisplayManager__eventQueue_exitCurrentDisplayMode__block_invoke;
    v14[3] = &unk_264414A38;
    v14[4] = self;
    int v15 = v5;
    dispatch_async(MEMORY[0x263EF83A0], v14);
  }
}

void __63__SCROBrailleDisplayManager__eventQueue_exitCurrentDisplayMode__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  uint64_t v2 = [NSNumber numberWithInt:*(unsigned int *)(a1 + 40)];
  [WeakRetained handleDisplayModeChanged:v2];
}

- (void)_eventQueue_alertTimeoutHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  [(SCROBrailleDisplayManager *)self _eventQueue_exitCurrentDisplayMode];
  alertTimer = self->_alertTimer;
  self->_alertTimer = 0;
}

- (void)_eventQueue_resetAlertTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  double alertTimeout = self->_alertTimeout;
  alertTimer = self->_alertTimer;
  if (alertTimer
    && (dispatch_source_testcancel((dispatch_source_t)self->_alertTimer) && alertTimeout > 0.0
     || (dispatch_source_cancel(alertTimer),
         uint64_t v5 = self->_alertTimer,
         self->_alertTimer = 0,
         v5,
         self->_alertTimer)))
  {
    dispatch_time_t v6 = dispatch_walltime(0, (uint64_t)(self->_alertTimeout * 1000000000.0));
    uint64_t v7 = self->_alertTimer;
    uint64_t v8 = (unint64_t)(self->_alertTimeout * 0.1);
    dispatch_source_set_timer(v7, v6, 0xFFFFFFFFFFFFFFFFLL, v8);
  }
  else if (alertTimeout > 0.0)
  {
    char v9 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x263EF8400], 0, 0, (dispatch_queue_t)self->_eventQueue);
    int v10 = self->_alertTimer;
    self->_alertTimer = v9;

    if (self->_alertTimer)
    {
      dispatch_time_t v11 = dispatch_walltime(0, (uint64_t)(self->_alertTimeout * 1000000000.0));
      dispatch_source_set_timer((dispatch_source_t)self->_alertTimer, v11, 0xFFFFFFFFFFFFFFFFLL, (unint64_t)(self->_alertTimeout * 0.1));
      int v12 = self->_alertTimer;
      handler[0] = MEMORY[0x263EF8330];
      handler[1] = 3221225472;
      handler[2] = __56__SCROBrailleDisplayManager__eventQueue_resetAlertTimer__block_invoke;
      handler[3] = &unk_264414590;
      handler[4] = self;
      dispatch_source_set_event_handler(v12, handler);
      dispatch_resume((dispatch_object_t)self->_alertTimer);
    }
  }
}

uint64_t __56__SCROBrailleDisplayManager__eventQueue_resetAlertTimer__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_alertTimeoutHandler");
}

- (void)_eventQueue_stopAlertTimer
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  alertTimer = self->_alertTimer;
  if (alertTimer)
  {
    dispatch_source_cancel(alertTimer);
    int v4 = self->_alertTimer;
    self->_alertTimer = 0;
  }
}

- (void)_eventQueue_fireAlertTimeoutHandler
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (self->_alertTimer)
  {
    [(SCROBrailleDisplayManager *)self _eventQueue_stopAlertTimer];
    [(SCROBrailleDisplayManager *)self _eventQueue_alertTimeoutHandler];
  }
}

- (void)_eventQueue_popDisplayModeStack
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if ([(NSMutableArray *)self->_displayModeStack count])
  {
    uint64_t v3 = [(NSMutableArray *)self->_displayModeStack lastObject];
    if (v3)
    {
      int v4 = v3;
      int v5 = [v3 intValue];

      switch(v5)
      {
        case 3:
          statusString = self->_statusString;
          self->_statusString = 0;

          break;
        case 2:
          [(SCROBrailleDisplayHistory *)self->_history markSnapshotAsRead];
          break;
        case 1:
          [(SCROBrailleDisplayManager *)self _eventQueue_stopAlertTimer];
          break;
      }
    }
    displayModeStacuint64_t k = self->_displayModeStack;
    [(NSMutableArray *)displayModeStack removeLastObject];
  }
}

- (id)_eventQueue_cachedMainStringForDisplayMode:(int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  switch(a3)
  {
    case 0:
      lineString = self->_lineString;
      if (lineString) {
        goto LABEL_4;
      }
      goto LABEL_3;
    case 1:
      goto LABEL_3;
    case 2:
      dispatch_time_t v6 = [(SCROBrailleDisplayHistory *)self->_history currentString];
      break;
    case 3:
      lineString = self->_statusString;
      if (!lineString) {
LABEL_3:
      }
        lineString = self->_blankUIString;
LABEL_4:
      dispatch_time_t v6 = lineString;
      break;
    default:
      dispatch_time_t v6 = 0;
      break;
  }

  return v6;
}

- (void)configureTableWithIdentifier:(id)a3
{
  id v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __58__SCROBrailleDisplayManager_configureTableWithIdentifier___block_invoke;
  v7[3] = &unk_264414808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(eventQueue, v7);
}

uint64_t __58__SCROBrailleDisplayManager_configureTableWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setTableIdentifier:", *(void *)(a1 + 40));
}

- (void)_eventQueue_setTableIdentifier:(id)a3
{
  id obj = (__CFString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  id v4 = +[SCROBrailleTranslationManager sharedManager];
  if ([(__CFString *)obj isEqual:@"com.apple.scrod.braille.table.duxbury.jpn"])
  {

    int v5 = @"com.apple.scrod.braille.table.apple.ja";
  }
  else
  {
    int v5 = obj;
  }
  obja = v5;
  id v6 = [(__CFString *)v5 brl_serviceIdentifier];
  [v4 loadTranslatorWithServiceIdentifier:v6 input:0];

  uint64_t v7 = [(__CFString *)obja brl_tableIdentifier];
  [v4 setDefaultLanguage:v7];

  outputTableIdentifier = self->_outputTableIdentifier;
  p_outputTableIdentifier = &self->_outputTableIdentifier;
  if (![(NSString *)outputTableIdentifier isEqualToString:obja])
  {
    objc_storeStrong((id *)p_outputTableIdentifier, obja);
    int v10 = [MEMORY[0x263F2BA78] sharedModel];
    dispatch_time_t v11 = +[SCROBrailleTranslationManager sharedManager];
    [v10 setOutputTableIdentifier:obja manager:v11];
  }
}

- (void)configureInputTableWithIdentifier:(id)a3
{
  id v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __63__SCROBrailleDisplayManager_configureInputTableWithIdentifier___block_invoke;
  v7[3] = &unk_264414808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(eventQueue, v7);
}

uint64_t __63__SCROBrailleDisplayManager_configureInputTableWithIdentifier___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setInputTableWithIdentifier:", *(void *)(a1 + 40));
}

- (void)_eventQueue_setInputTableWithIdentifier:(id)a3
{
  id obj = (__CFString *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  id v4 = +[SCROBrailleTranslationManager inputManager];
  if ([(__CFString *)obj isEqual:@"com.apple.scrod.braille.table.duxbury.jpn"])
  {

    int v5 = @"com.apple.scrod.braille.table.apple.ja";
  }
  else
  {
    int v5 = obj;
  }
  obja = v5;
  id v6 = [(__CFString *)v5 brl_serviceIdentifier];
  [v4 loadTranslatorWithServiceIdentifier:v6 input:1];

  uint64_t v7 = [(__CFString *)obja brl_tableIdentifier];
  [v4 setDefaultLanguage:v7];

  inputTableIdentifier = self->_inputTableIdentifier;
  p_inputTableIdentifier = &self->_inputTableIdentifier;
  if (![(NSString *)inputTableIdentifier isEqualToString:obja])
  {
    objc_storeStrong((id *)p_inputTableIdentifier, obja);
    int v10 = [MEMORY[0x263F2BA78] sharedModel];
    dispatch_time_t v11 = +[SCROBrailleTranslationManager inputManager];
    [v10 setInputTableIdentifier:obja manager:v11];
  }
}

- (void)setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__SCROBrailleDisplayManager_setAlwaysUsesNemethCodeForTechnicalText___block_invoke;
  v4[3] = &unk_2644145D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __69__SCROBrailleDisplayManager_setAlwaysUsesNemethCodeForTechnicalText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setAlwaysUsesNemethCodeForTechnicalText:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)alwaysUsesNemethCodeForTechnicalText
{
  uint64_t v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  eventQueue = v2->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __65__SCROBrailleDisplayManager_alwaysUsesNemethCodeForTechnicalText__block_invoke;
  block[3] = &unk_264414650;
  void block[4] = &v6;
  dispatch_sync(eventQueue, block);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

void __65__SCROBrailleDisplayManager_alwaysUsesNemethCodeForTechnicalText__block_invoke(uint64_t a1)
{
  id v2 = +[SCROBrailleTranslationManager sharedManager];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = [v2 alwaysUsesNemethCodeForTechnicalText];
}

- (void)_eventQueue_setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  id v4 = +[SCROBrailleTranslationManager sharedManager];
  [v4 setAlwaysUsesNemethCodeForTechnicalText:v3];
}

- (int)contractionMode
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F2BAA8]) initWithIdentifier:self->_outputTableIdentifier];
  int v3 = [v2 supportsTranslationModeContracted] ^ 1;

  return v3;
}

- (BOOL)showEightDotBraille
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F2BAA8]) initWithIdentifier:self->_outputTableIdentifier];
  char v3 = [v2 supportsTranslationMode8Dot];

  return v3;
}

- (BOOL)inputEightDotBraille
{
  id v2 = (void *)[objc_alloc(MEMORY[0x263F2BAA8]) initWithIdentifier:self->_inputTableIdentifier];
  char v3 = [v2 supportsTranslationMode8Dot];

  return v3;
}

- (void)setAutomaticBrailleTranslationEnabled:(BOOL)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __67__SCROBrailleDisplayManager_setAutomaticBrailleTranslationEnabled___block_invoke;
  v4[3] = &unk_2644145D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __67__SCROBrailleDisplayManager_setAutomaticBrailleTranslationEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setAutomaticBrailleTranslationEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)automaticBrailleTranslation
{
  id v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __56__SCROBrailleDisplayManager_automaticBrailleTranslation__block_invoke;
  v5[3] = &unk_264414790;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __56__SCROBrailleDisplayManager_automaticBrailleTranslation__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 105);
  return result;
}

- (void)_eventQueue_setAutomaticBrailleTranslationEnabled:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  self->_automaticBrailleTranslation = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __79__SCROBrailleDisplayManager__eventQueue_setAutomaticBrailleTranslationEnabled___block_invoke;
  v5[3] = &unk_264414AA0;
  void v5[4] = self;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v5];
}

uint64_t __79__SCROBrailleDisplayManager__eventQueue_setAutomaticBrailleTranslationEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAutomaticBrailleTranslationEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 105)];
}

- (void)setWordWrapEnabled:(BOOL)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __48__SCROBrailleDisplayManager_setWordWrapEnabled___block_invoke;
  v4[3] = &unk_2644145D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __48__SCROBrailleDisplayManager_setWordWrapEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setWordWrapEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)wordWrapEnabled
{
  id v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__SCROBrailleDisplayManager_wordWrapEnabled__block_invoke;
  v5[3] = &unk_264414790;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __44__SCROBrailleDisplayManager_wordWrapEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 106);
  return result;
}

- (void)_eventQueue_setWordWrapEnabled:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  self->_wordWrapEnabled = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __60__SCROBrailleDisplayManager__eventQueue_setWordWrapEnabled___block_invoke;
  v5[3] = &unk_264414AA0;
  void v5[4] = self;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v5];
}

uint64_t __60__SCROBrailleDisplayManager__eventQueue_setWordWrapEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setWordWrapEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 106)];
}

- (void)setAutoAdvanceEnabled:(BOOL)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SCROBrailleDisplayManager_setAutoAdvanceEnabled___block_invoke;
  v4[3] = &unk_2644145D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __51__SCROBrailleDisplayManager_setAutoAdvanceEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setAutoAdvanceEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)autoAdvanceEnabled
{
  id v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __47__SCROBrailleDisplayManager_autoAdvanceEnabled__block_invoke;
  v5[3] = &unk_264414790;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __47__SCROBrailleDisplayManager_autoAdvanceEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 107);
  return result;
}

- (void)_eventQueue_setAutoAdvanceEnabled:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  self->_autoAdvanceEnabled = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__SCROBrailleDisplayManager__eventQueue_setAutoAdvanceEnabled___block_invoke;
  v5[3] = &unk_264414AA0;
  void v5[4] = self;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v5];
}

uint64_t __63__SCROBrailleDisplayManager__eventQueue_setAutoAdvanceEnabled___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAutoAdvanceEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 107)];
}

- (void)setAutoAdvanceDuration:(double)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __52__SCROBrailleDisplayManager_setAutoAdvanceDuration___block_invoke;
  v4[3] = &unk_2644149C0;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __52__SCROBrailleDisplayManager_setAutoAdvanceDuration___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setAutoAdvanceDuration:", *(double *)(a1 + 40));
}

- (double)autoAdvanceDuration
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v7 = 0;
  uint64_t v8 = (double *)&v7;
  uint64_t v9 = 0x2020000000;
  uint64_t v10 = 0;
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SCROBrailleDisplayManager_autoAdvanceDuration__block_invoke;
  v6[3] = &unk_264414790;
  void v6[4] = self;
  void v6[5] = &v7;
  dispatch_sync(eventQueue, v6);
  double v4 = v8[3];
  _Block_object_dispose(&v7, 8);
  return v4;
}

double __48__SCROBrailleDisplayManager_autoAdvanceDuration__block_invoke(uint64_t a1)
{
  double result = *(double *)(*(void *)(a1 + 32) + 112);
  *(double *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = result;
  return result;
}

- (void)_eventQueue_setAutoAdvanceDuration:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  self->_autoAdvanceDuration = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __64__SCROBrailleDisplayManager__eventQueue_setAutoAdvanceDuration___block_invoke;
  v5[3] = &unk_264414AA0;
  void v5[4] = self;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v5];
}

uint64_t __64__SCROBrailleDisplayManager__eventQueue_setAutoAdvanceDuration___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setAutoAdvanceDuration:*(double *)(*(void *)(a1 + 32) + 112)];
}

- (void)setBlinkingCursorEnabled:(BOOL)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SCROBrailleDisplayManager_setBlinkingCursorEnabled___block_invoke;
  v4[3] = &unk_2644145D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __54__SCROBrailleDisplayManager_setBlinkingCursorEnabled___block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 120) = *(unsigned char *)(a1 + 40);
  v1 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __54__SCROBrailleDisplayManager_setBlinkingCursorEnabled___block_invoke_2;
  v3[3] = &unk_264414AA0;
  v3[4] = v1;
  return [v1 _enumerateActiveDisplays:v3];
}

uint64_t __54__SCROBrailleDisplayManager_setBlinkingCursorEnabled___block_invoke_2(uint64_t a1, void *a2)
{
  return [a2 setBlinkingCursorEnabled:*(unsigned __int8 *)(*(void *)(a1 + 32) + 120)];
}

- (BOOL)blinkingCursorEnabled
{
  id v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__SCROBrailleDisplayManager_blinkingCursorEnabled__block_invoke;
  v5[3] = &unk_264414790;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__SCROBrailleDisplayManager_blinkingCursorEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 120);
  return result;
}

- (void)setTactileGraphicsImageData:(id)a3
{
  id v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __57__SCROBrailleDisplayManager_setTactileGraphicsImageData___block_invoke;
  v7[3] = &unk_264414808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(eventQueue, v7);
}

uint64_t __57__SCROBrailleDisplayManager_setTactileGraphicsImageData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setTactileGraphicsImageData:", *(void *)(a1 + 40));
}

- (void)_eventQueue_setTactileGraphicsImageData:(id)a3
{
  id v4 = (NSData *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  imageData = self->_imageData;
  self->_imageData = v4;
  id v6 = v4;

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __69__SCROBrailleDisplayManager__eventQueue_setTactileGraphicsImageData___block_invoke;
  v7[3] = &unk_264414AA0;
  v7[4] = self;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v7];
}

uint64_t __69__SCROBrailleDisplayManager__eventQueue_setTactileGraphicsImageData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setImageData:*(void *)(*(void *)(a1 + 32) + 144)];
}

- (void)setPlanarData:(id)a3
{
  id v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __43__SCROBrailleDisplayManager_setPlanarData___block_invoke;
  v7[3] = &unk_264414808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(eventQueue, v7);
}

uint64_t __43__SCROBrailleDisplayManager_setPlanarData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setPlanarData:", *(void *)(a1 + 40));
}

- (void)_eventQueue_setPlanarData:(id)a3
{
  id v4 = (SCRO2DBrailleData *)a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  planarData = self->_planarData;
  self->_planarData = v4;
  id v6 = v4;

  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __55__SCROBrailleDisplayManager__eventQueue_setPlanarData___block_invoke;
  v7[3] = &unk_264414AA0;
  v7[4] = self;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v7];
}

uint64_t __55__SCROBrailleDisplayManager__eventQueue_setPlanarData___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPlanarData:*(void *)(*(void *)(a1 + 32) + 152)];
}

- (unint64_t)numberOfTextLinesInPlanarBraille
{
  uint64_t v5 = 0;
  id v6 = &v5;
  uint64_t v7 = 0x2020000000;
  uint64_t v8 = 0;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __61__SCROBrailleDisplayManager_numberOfTextLinesInPlanarBraille__block_invoke;
  v4[3] = &unk_264414AC8;
  v4[4] = &v5;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v4];
  unint64_t v2 = v6[3];
  _Block_object_dispose(&v5, 8);
  return v2;
}

unint64_t __61__SCROBrailleDisplayManager_numberOfTextLinesInPlanarBraille__block_invoke(uint64_t a1, void *a2)
{
  unint64_t v3 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  unint64_t result = [a2 numberOfTextLinesInPlanarBraille];
  if (v3 <= result) {
    unint64_t v5 = result;
  }
  else {
    unint64_t v5 = v3;
  }
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = v5;
  return result;
}

- (int)inputContractionMode
{
  unint64_t v2 = (void *)[objc_alloc(MEMORY[0x263F2BAA8]) initWithIdentifier:self->_inputTableIdentifier];
  int v3 = [v2 supportsTranslationModeContracted] ^ 1;

  return v3;
}

- (void)setLastUserInteractionTime:(double)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __56__SCROBrailleDisplayManager_setLastUserInteractionTime___block_invoke;
  v4[3] = &unk_2644149C0;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(eventQueue, v4);
}

double __56__SCROBrailleDisplayManager_setLastUserInteractionTime___block_invoke(uint64_t a1)
{
  double result = *(double *)(a1 + 40);
  *(double *)(*(void *)(a1 + 32) + 264) = result;
  return result;
}

- (void)setPersistentKeyModifiers:(unsigned int)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __55__SCROBrailleDisplayManager_setPersistentKeyModifiers___block_invoke;
  v4[3] = &unk_264414A38;
  v4[4] = self;
  unsigned int v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __55__SCROBrailleDisplayManager_setPersistentKeyModifiers___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setPersistentKeyModifiers:", *(unsigned int *)(a1 + 40));
}

- (unsigned)persistentKeyModifiers
{
  unint64_t v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __51__SCROBrailleDisplayManager_persistentKeyModifiers__block_invoke;
  v5[3] = &unk_264414790;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LODWORD(v2) = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __51__SCROBrailleDisplayManager_persistentKeyModifiers__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(_DWORD *)(*(void *)(result + 32) + 124);
  return result;
}

- (void)_eventQueue_setPersistentKeyModifiers:(unsigned int)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  self->_persistentKeyModifiers = a3;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __67__SCROBrailleDisplayManager__eventQueue_setPersistentKeyModifiers___block_invoke;
  v5[3] = &unk_264414AA0;
  void v5[4] = self;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v5];
}

uint64_t __67__SCROBrailleDisplayManager__eventQueue_setPersistentKeyModifiers___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setPersistentKeyModifiers:*(unsigned int *)(*(void *)(a1 + 32) + 124)];
}

- (void)setShowDotsSevenAndEight:(BOOL)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SCROBrailleDisplayManager_setShowDotsSevenAndEight___block_invoke;
  v4[3] = &unk_2644145D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __54__SCROBrailleDisplayManager_setShowDotsSevenAndEight___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_showDotsSevenAndEight:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)showDotsSevenAndEight
{
  unint64_t v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __50__SCROBrailleDisplayManager_showDotsSevenAndEight__block_invoke;
  v5[3] = &unk_264414790;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __50__SCROBrailleDisplayManager_showDotsSevenAndEight__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 80);
  return result;
}

- (void)_eventQueue_showDotsSevenAndEight:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (self->_showDotsSevenAndEight != v3)
  {
    self->_showDotsSevenAndEight = v3;
    mainString = self->_mainString;
    if (mainString)
    {
      uint64_t v6 = mainString;
    }
    else
    {
      uint64_t v6 = self->_blankUIString;
      if (!v6) {
        return;
      }
    }
    uint64_t v7 = v6;
    [(SCROBrailleDisplayManager *)self setMainAttributedString:v6 forceUpdate:1];
  }
}

- (BOOL)isCandidateSelectionOn
{
  if (SCROCustomBrailleEnabled()) {
    [MEMORY[0x263F2BA78] sharedModel];
  }
  else {
  unint64_t v2 = [MEMORY[0x263F2BA98] manager];
  }
  char v3 = [v2 isCandidateSelectionActive];

  return v3;
}

- (void)cancelCandidateSelection
{
  if (SCROCustomBrailleEnabled()
    && [(SCROBrailleDisplayManager *)self isCandidateSelectionOn])
  {
    id v3 = [MEMORY[0x263F2BA78] sharedModel];
    [v3 handleEscape];
  }
  else
  {
    id v3 = [MEMORY[0x263F2BA98] manager];
    [v3 escapeCommand];
  }
}

- (void)showPreviousCandidate
{
  if (SCROCustomBrailleEnabled()
    && [(SCROBrailleDisplayManager *)self isCandidateSelectionOn])
  {
    id v3 = [MEMORY[0x263F2BA78] sharedModel];
  }
  else
  {
    id v3 = [MEMORY[0x263F2BA98] manager];
  }
  id v4 = v3;
  [v3 showPreviousCandidate];
}

- (void)showNextCandidate
{
  if (SCROCustomBrailleEnabled()
    && [(SCROBrailleDisplayManager *)self isCandidateSelectionOn])
  {
    id v3 = [MEMORY[0x263F2BA78] sharedModel];
  }
  else
  {
    id v3 = [MEMORY[0x263F2BA98] manager];
  }
  id v4 = v3;
  [v3 showNextCandidate];
}

- (BOOL)isWordDescriptionOn
{
  unint64_t v2 = [MEMORY[0x263F2BA78] sharedModel];
  char v3 = [v2 isWordDescriptionActive];

  return v3;
}

- (void)showPreviousWordDescription
{
  id v2 = [MEMORY[0x263F2BA78] sharedModel];
  [v2 showPreviousWordDescription];
}

- (void)showNextWordDescription
{
  id v2 = [MEMORY[0x263F2BA78] sharedModel];
  [v2 showNextWordDescription];
}

- (void)showPreviousAnnouncement
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __53__SCROBrailleDisplayManager_showPreviousAnnouncement__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __53__SCROBrailleDisplayManager_showPreviousAnnouncement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_showNextAnnouncement:", 0);
}

- (void)showNextAnnouncement
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __49__SCROBrailleDisplayManager_showNextAnnouncement__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __49__SCROBrailleDisplayManager_showNextAnnouncement__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_showNextAnnouncement:", 1);
}

- (void)_eventQueue_showNextAnnouncement:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  BOOL v5 = [(NSMutableArray *)self->_displayModeStack lastObject];
  uint64_t v6 = v5;
  if (!v5)
  {
    uint64_t v10 = 0;
    id WeakRetained = 0;
    char v9 = 0;
    goto LABEL_15;
  }
  int v7 = [v5 intValue];

  if (v7 != 2)
  {
    uint64_t v10 = 0;
    id WeakRetained = 0;
    char v9 = 0;
    uint64_t v6 = 0;
    goto LABEL_15;
  }
  history = self->_history;
  if (v3)
  {
    if (![(SCROBrailleDisplayHistory *)history moveToNext])
    {
      uint64_t v6 = 0;
      char v9 = 0;
LABEL_10:
      int v12 = &selRef_handleBrailleDidShowNextAnnouncement_;
      goto LABEL_13;
    }
  }
  else if (![(SCROBrailleDisplayHistory *)history moveToPrevious])
  {
    uint64_t v6 = 0;
    char v9 = 0;
    goto LABEL_12;
  }
  uint64_t v6 = [(SCROBrailleDisplayHistory *)self->_history currentString];
  char v9 = 1;
  if (v3) {
    goto LABEL_10;
  }
LABEL_12:
  int v12 = &selRef_handleBrailleDidShowPreviousAnnouncement_;
LABEL_13:
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  uint64_t v10 = *v12;
  if (v6) {
    [(SCROBrailleDisplayManager *)self setMainAttributedString:v6 forceUpdate:1];
  }
LABEL_15:
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __62__SCROBrailleDisplayManager__eventQueue_showNextAnnouncement___block_invoke;
  block[3] = &unk_264414AF0;
  id v15 = WeakRetained;
  unint64_t v16 = v10;
  char v17 = v9;
  id v13 = WeakRetained;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __62__SCROBrailleDisplayManager__eventQueue_showNextAnnouncement___block_invoke(uint64_t a1)
{
  v1 = *(void **)(a1 + 32);
  uint64_t v2 = *(void *)(a1 + 40);
  id v3 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 48)];
  [v1 performSelector:v2 withObject:v3];
}

- (void)setLineDescriptorDisplayCallbackEnabled:(BOOL)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __69__SCROBrailleDisplayManager_setLineDescriptorDisplayCallbackEnabled___block_invoke;
  v4[3] = &unk_2644145D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __69__SCROBrailleDisplayManager_setLineDescriptorDisplayCallbackEnabled___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setLineDescriptorCallbackEnabled:", *(unsigned __int8 *)(a1 + 40));
}

- (BOOL)lineDescriptorDisplayCallbackEnabled
{
  uint64_t v2 = self;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v6 = 0;
  int v7 = &v6;
  uint64_t v8 = 0x2020000000;
  char v9 = 0;
  eventQueue = v2->_eventQueue;
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __65__SCROBrailleDisplayManager_lineDescriptorDisplayCallbackEnabled__block_invoke;
  v5[3] = &unk_264414790;
  void v5[4] = v2;
  void v5[5] = &v6;
  dispatch_sync(eventQueue, v5);
  LOBYTE(v2) = *((unsigned char *)v7 + 24);
  _Block_object_dispose(&v6, 8);
  return (char)v2;
}

uint64_t __65__SCROBrailleDisplayManager_lineDescriptorDisplayCallbackEnabled__block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(*(void *)(result + 40) + 8) + 24) = *(unsigned char *)(*(void *)(result + 32) + 81);
  return result;
}

- (void)_eventQueue_setLineDescriptorCallbackEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  self->_lineDescriptorDisplayCallbackEnabled = v3;
  id v5 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue primaryDisplay];
  [v5 setDelegateWantsDisplayCallback:v3];
}

- (int64_t)tokenForRouterIndex:(int64_t)a3 location:(int64_t *)a4 appToken:(id *)a5 forDisplayWithToken:(int)a6
{
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_eventQueue);
  uint64_t v16 = 0;
  char v17 = &v16;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = __Block_byref_object_copy__0;
  char v20 = __Block_byref_object_dispose__0;
  id v21 = 0;
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __87__SCROBrailleDisplayManager_tokenForRouterIndex_location_appToken_forDisplayWithToken___block_invoke;
  block[3] = &unk_264414B18;
  void block[4] = self;
  void block[5] = &v16;
  int v15 = a6;
  dispatch_sync(eventQueue, block);
  int64_t v12 = [(id)v17[5] tokenForRouterIndex:a3 location:a4 appToken:a5];
  _Block_object_dispose(&v16, 8);

  return v12;
}

uint64_t __87__SCROBrailleDisplayManager_tokenForRouterIndex_location_appToken_forDisplayWithToken___block_invoke(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "_eventQueue_activeDisplayForToken:", *(unsigned int *)(a1 + 48));
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) = v2;

  return MEMORY[0x270F9A758](v2);
}

- (_NSRange)rangeOfBrailleCellRepresentingCharacterAtIndex:(unint64_t)a3
{
  NSUInteger v3 = [(SCROBrailleFormatter *)self->_currentBrailleFormatter rangeOfBrailleCellRepresentingCharacterAtIndex:a3];
  result.NSUInteger length = v4;
  result.NSUInteger location = v3;
  return result;
}

- (void)clearTimeoutAlert
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __46__SCROBrailleDisplayManager_clearTimeoutAlert__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __46__SCROBrailleDisplayManager_clearTimeoutAlert__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_fireAlertTimeoutHandler");
}

- (void)simulateKeypress:(id)a3
{
  id v4 = a3;
  eventQueue = self->_eventQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __46__SCROBrailleDisplayManager_simulateKeypress___block_invoke;
  v7[3] = &unk_264414808;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(eventQueue, v7);
}

uint64_t __46__SCROBrailleDisplayManager_simulateKeypress___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_simulateKeypress:", *(void *)(a1 + 40));
}

- (void)_eventQueue_simulateKeypress:(id)a3
{
  eventQueue = self->_eventQueue;
  id v5 = a3;
  dispatch_assert_queue_V2(eventQueue);
  -[SCROBrailleDisplayManager _eventQueue_activeDisplayForToken:](self, "_eventQueue_activeDisplayForToken:", [v5 displayToken]);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  [v6 simulateKeypress:v5];
}

- (void)setPrepareToMemorizeNextKey:(BOOL)a3 immediate:(BOOL)a4 forDisplayWithToken:(int)a5
{
  eventQueue = self->_eventQueue;
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __87__SCROBrailleDisplayManager_setPrepareToMemorizeNextKey_immediate_forDisplayWithToken___block_invoke;
  v6[3] = &unk_264414B40;
  void v6[4] = self;
  BOOL v8 = a3;
  BOOL v9 = a4;
  int v7 = a5;
  dispatch_async(eventQueue, v6);
}

uint64_t __87__SCROBrailleDisplayManager_setPrepareToMemorizeNextKey_immediate_forDisplayWithToken___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_prepareToMemorizeNextKey:immediately:forDisplayWithToken:", *(unsigned __int8 *)(a1 + 44), *(unsigned __int8 *)(a1 + 45), *(unsigned int *)(a1 + 40));
}

- (void)_eventQueue_prepareToMemorizeNextKey:(BOOL)a3 immediately:(BOOL)a4 forDisplayWithToken:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  BOOL v6 = a4;
  BOOL v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  int inputAccessMode = self->_inputAccessMode;
  if (!v7 || inputAccessMode)
  {
    if (inputAccessMode == 1)
    {
      id v14 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue displayForToken:v5];
      BOOL v13 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue stateForDisplay:v14] == 1;
      int64_t v12 = v14;
      if (v13) {
        goto LABEL_9;
      }
    }
  }
  else
  {
    uint64_t v10 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
    uint64_t v11 = [v10 count];

    if (v11)
    {
      int64_t v12 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue primaryDisplay];
      goto LABEL_9;
    }
  }
  int64_t v12 = 0;
LABEL_9:
  id v15 = v12;
  [v12 setPrepareToMemorizeNextKey:v7 immediate:v6];
}

- (void)beginUpdates
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __41__SCROBrailleDisplayManager_beginUpdates__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __41__SCROBrailleDisplayManager_beginUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setBatchUpdates:", 1);
}

- (void)endUpdates
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __39__SCROBrailleDisplayManager_endUpdates__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __39__SCROBrailleDisplayManager_endUpdates__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setBatchUpdates:", 0);
}

- (void)_eventQueue_setBatchUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  if (self->_shouldBatchUpdates != v3)
  {
    self->_shouldBatchUpdates = v3;
    uint64_t v5 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
    id v7 = (id)[v5 copy];

    BOOL v6 = &selRef_beginUpdates;
    if (!v3) {
      BOOL v6 = &selRef_endUpdates;
    }
    [v7 makeObjectsPerformSelector:*v6];
  }
}

- (void)setSingleLetterInputIsOn:(BOOL)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __54__SCROBrailleDisplayManager_setSingleLetterInputIsOn___block_invoke;
  v4[3] = &unk_2644145D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __54__SCROBrailleDisplayManager_setSingleLetterInputIsOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setSingleLetterInputIsOn:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_eventQueue_setSingleLetterInputIsOn:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __66__SCROBrailleDisplayManager__eventQueue_setSingleLetterInputIsOn___block_invoke;
  v5[3] = &__block_descriptor_33_e28_v16__0__SCROBrailleDisplay_8l;
  BOOL v6 = a3;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v5];
}

uint64_t __66__SCROBrailleDisplayManager__eventQueue_setSingleLetterInputIsOn___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setSingleLetterInputIsOn:*(unsigned __int8 *)(a1 + 32)];
}

- (void)setTextSearchModeIsOn:(BOOL)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __51__SCROBrailleDisplayManager_setTextSearchModeIsOn___block_invoke;
  v4[3] = &unk_2644145D8;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __51__SCROBrailleDisplayManager_setTextSearchModeIsOn___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setTextSearchModeIsOn:", *(unsigned __int8 *)(a1 + 40));
}

- (void)_eventQueue_setTextSearchModeIsOn:(BOOL)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __63__SCROBrailleDisplayManager__eventQueue_setTextSearchModeIsOn___block_invoke;
  v5[3] = &__block_descriptor_33_e28_v16__0__SCROBrailleDisplay_8l;
  BOOL v6 = a3;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v5];
}

uint64_t __63__SCROBrailleDisplayManager__eventQueue_setTextSearchModeIsOn___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setTextSearchModeOn:*(unsigned __int8 *)(a1 + 32)];
}

- (void)translateBrailleToClipboard
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __56__SCROBrailleDisplayManager_translateBrailleToClipboard__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __56__SCROBrailleDisplayManager_translateBrailleToClipboard__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_translateBrailleToClipboard");
}

- (void)_eventQueue_translateBrailleToClipboard
{
}

uint64_t __68__SCROBrailleDisplayManager__eventQueue_translateBrailleToClipboard__block_invoke(uint64_t a1, void *a2)
{
  return [a2 translateBrailleToClipboard];
}

- (void)setBrailleKeyDebounceTimeout:(double)a3
{
  eventQueue = self->_eventQueue;
  v4[0] = MEMORY[0x263EF8330];
  v4[1] = 3221225472;
  v4[2] = __58__SCROBrailleDisplayManager_setBrailleKeyDebounceTimeout___block_invoke;
  v4[3] = &unk_2644149C0;
  v4[4] = self;
  *(double *)&void v4[5] = a3;
  dispatch_async(eventQueue, v4);
}

uint64_t __58__SCROBrailleDisplayManager_setBrailleKeyDebounceTimeout___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_setBrailleKeyDebounceTimeout:", *(double *)(a1 + 40));
}

- (void)_eventQueue_setBrailleKeyDebounceTimeout:(double)a3
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __70__SCROBrailleDisplayManager__eventQueue_setBrailleKeyDebounceTimeout___block_invoke;
  v5[3] = &__block_descriptor_40_e28_v16__0__SCROBrailleDisplay_8l;
  *(double *)&void v5[4] = a3;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v5];
}

uint64_t __70__SCROBrailleDisplayManager__eventQueue_setBrailleKeyDebounceTimeout___block_invoke(uint64_t a1, void *a2)
{
  return [a2 setBrailleKeyDebounceTimeout:*(double *)(a1 + 32)];
}

- (void)didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  eventQueue = self->_eventQueue;
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __69__SCROBrailleDisplayManager_didChangeBrailleString_brailleSelection___block_invoke;
  v10[3] = &unk_264414BA8;
  v10[4] = self;
  id v11 = v7;
  NSUInteger v12 = location;
  NSUInteger v13 = length;
  id v9 = v7;
  dispatch_async(eventQueue, v10);
}

uint64_t __69__SCROBrailleDisplayManager_didChangeBrailleString_brailleSelection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_didChangeBrailleString:brailleSelection:", *(void *)(a1 + 40), *(void *)(a1 + 48), *(void *)(a1 + 56));
}

- (void)_eventQueue_didChangeBrailleString:(id)a3 brailleSelection:(_NSRange)a4
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  id v7 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  v9[0] = MEMORY[0x263EF8330];
  v9[1] = 3221225472;
  v9[2] = __81__SCROBrailleDisplayManager__eventQueue_didChangeBrailleString_brailleSelection___block_invoke;
  v9[3] = &unk_264414BD0;
  id v10 = v7;
  NSUInteger v11 = location;
  NSUInteger v12 = length;
  id v8 = v7;
  [(SCROBrailleDisplayManager *)self _enumerateActiveDisplays:v9];
}

uint64_t __81__SCROBrailleDisplayManager__eventQueue_didChangeBrailleString_brailleSelection___block_invoke(void *a1, void *a2)
{
  return objc_msgSend(a2, "didChangeBrailleString:brailleSelection:", a1[4], a1[5], a1[6]);
}

- (void)didReplaceScriptStringRange:(_NSRange)a3 withScriptString:(id)a4 cursorLocation:(int64_t)a5
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  id v9 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __89__SCROBrailleDisplayManager_didReplaceScriptStringRange_withScriptString_cursorLocation___block_invoke;
  block[3] = &unk_2644148D0;
  NSUInteger v13 = location;
  NSUInteger v14 = length;
  void block[4] = self;
  id v12 = v9;
  int64_t v15 = a5;
  id v10 = v9;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __89__SCROBrailleDisplayManager_didReplaceScriptStringRange_withScriptString_cursorLocation___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 72));
  objc_msgSend(WeakRetained, "handleBrailleReplaceTextRange:withString:cursor:", a1[6], a1[7], a1[5], a1[8]);
}

- (void)didInsertScriptString:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue primaryDisplay];
  BOOL v6 = (SCROBrailleKeyboardKey *)[v5 newBrailleKeyboardKeyForText:v4 modifiers:*MEMORY[0x263F2BAF0]];

  if (!v6)
  {
    BOOL v6 = objc_alloc_init(SCROBrailleKeyboardKey);
    [(SCROBrailleKeyboardKey *)v6 setKeyString:v4];
  }
  v8[0] = MEMORY[0x263EF8330];
  v8[1] = 3221225472;
  v8[2] = __51__SCROBrailleDisplayManager_didInsertScriptString___block_invoke;
  v8[3] = &unk_264414808;
  v8[4] = self;
  id v9 = v6;
  id v7 = v6;
  dispatch_async(MEMORY[0x263EF83A0], v8);
}

void __51__SCROBrailleDisplayManager_didInsertScriptString___block_invoke(uint64_t a1)
{
  v4[1] = *MEMORY[0x263EF8340];
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  v4[0] = *(void *)(a1 + 40);
  BOOL v3 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:1];
  [WeakRetained handleBrailleKeypress:v3];
}

- (void)didDeleteBrailleChar:(id)a3
{
  char v10 = 0;
  id v4 = [a3 unicode];
  BOOL v5 = +[SCROBrailleTranslationUtility spokenStringForDeletedBrailleString:v4 speakLiterally:&v10];

  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __50__SCROBrailleDisplayManager_didDeleteBrailleChar___block_invoke;
  block[3] = &unk_264414858;
  void block[4] = self;
  id v8 = v5;
  char v9 = v10;
  id v6 = v5;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __50__SCROBrailleDisplayManager_didDeleteBrailleChar___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 72));
  [WeakRetained handleBrailleDeletedUntranslatedText:*(void *)(a1 + 40) speakLiterally:*(unsigned __int8 *)(a1 + 48)];
}

- (void)requestSpeech:(id)a3 language:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __52__SCROBrailleDisplayManager_requestSpeech_language___block_invoke;
  block[3] = &unk_264414750;
  void block[4] = self;
  id v11 = v6;
  id v12 = v7;
  id v8 = v7;
  id v9 = v6;
  dispatch_async(MEMORY[0x263EF83A0], block);
}

void __52__SCROBrailleDisplayManager_requestSpeech_language___block_invoke(void *a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1[4] + 72));
  [WeakRetained handleBrailleSpeechRequest:a1[5] language:a1[6]];
}

- (void)_enumerateActiveDisplays:(id)a3
{
  uint64_t v17 = *MEMORY[0x263EF8340];
  id v4 = (void (**)(id, void))a3;
  if (v4)
  {
    BOOL v5 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue activeDisplays];
    id v6 = (void *)[v5 copy];

    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v7 = v6;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v13;
      do
      {
        uint64_t v11 = 0;
        do
        {
          if (*(void *)v13 != v10) {
            objc_enumerationMutation(v7);
          }
          v4[2](v4, *(void *)(*((void *)&v12 + 1) + 8 * v11++));
        }
        while (v9 != v11);
        uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v9);
    }
  }
}

- (id)_eventQueue_activeDisplayForToken:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);
  BOOL v5 = [(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue displayForToken:v3];
  if ([(SCROBrailleDisplayManagedQueue *)self->_managedDisplayQueue stateForDisplay:v5] != 1)
  {

    BOOL v5 = 0;
  }

  return v5;
}

- (void)resetEditingManager
{
  eventQueue = self->_eventQueue;
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __48__SCROBrailleDisplayManager_resetEditingManager__block_invoke;
  block[3] = &unk_264414590;
  void block[4] = self;
  dispatch_async(eventQueue, block);
}

uint64_t __48__SCROBrailleDisplayManager_resetEditingManager__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_eventQueue_resetEditingManager");
}

- (void)_eventQueue_resetEditingManager
{
  dispatch_assert_queue_V2((dispatch_queue_t)self->_eventQueue);

  +[SCROBrailleFormatter resetEditingManager];
}

- (double)lastUserInteractionTime
{
  return self->_lastUserInteractionTime;
}

- (SCROBrailleDisplayManagedQueue)managedDisplayQueue
{
  return self->_managedDisplayQueue;
}

- (id)eventHandled
{
  return self->_eventHandled;
}

- (void)setEventHandled:(id)a3
{
}

- (unint64_t)systemVirtualDisplayToken
{
  return self->_systemVirtualDisplayToken;
}

- (void)setSystemVirtualDisplayToken:(unint64_t)a3
{
  self->_systemVirtualDisplayToken = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_eventHandled, 0);
  objc_storeStrong((id *)&self->_tactileGraphicsDisplayIdentifier, 0);
  objc_storeStrong((id *)&self->_virtualDisplays, 0);
  objc_storeStrong((id *)&self->_blankUIString, 0);
  objc_storeStrong((id *)&self->_alertTimer, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_statusString, 0);
  objc_storeStrong((id *)&self->_lineString, 0);
  objc_storeStrong((id *)&self->_mainString, 0);
  objc_storeStrong((id *)&self->_history, 0);
  objc_storeStrong((id *)&self->_displayModeStack, 0);
  objc_storeStrong((id *)&self->_planarData, 0);
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_uiEditingCachedString, 0);
  objc_storeStrong((id *)&self->_inputTableIdentifier, 0);
  objc_storeStrong((id *)&self->_outputTableIdentifier, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_loadedIOElements, 0);
  objc_storeStrong((id *)&self->_currentBrailleFormatter, 0);
  objc_storeStrong((id *)&self->_detectedIOElementsDict, 0);
  objc_storeStrong((id *)&self->_stealthBrailleDisplay, 0);
  objc_storeStrong((id *)&self->_bluetoothBrailleDisplay, 0);
  objc_storeStrong((id *)&self->_managedDisplayQueue, 0);

  objc_storeStrong((id *)&self->_eventQueue, 0);
}

@end