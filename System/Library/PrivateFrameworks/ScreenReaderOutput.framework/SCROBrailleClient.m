@interface SCROBrailleClient
+ (id)statusAttributeDotText;
- (BOOL)alwaysUsesNemethCodeForTechnicalText;
- (BOOL)autoAdvanceEnabled;
- (BOOL)automaticBrailleTranslationEnabled;
- (BOOL)blinkEnabled;
- (BOOL)displayDescriptorCallbackEnabled;
- (BOOL)inputEightDotBraille;
- (BOOL)isCandidateSelectionOn;
- (BOOL)isConfigured;
- (BOOL)isConnected;
- (BOOL)isWordDescriptionOn;
- (BOOL)keepConnectionAlive;
- (BOOL)needsDisplay;
- (BOOL)showDotsSevenAndEight;
- (BOOL)showEightDotBraille;
- (BOOL)wordWrapEnabled;
- (Class)connectionClass;
- (SCROBrailleClient)init;
- (SCROBrailleClient)initWithDelegate:(id)a3;
- (_NSRange)rangeOfCellRepresentingCharacterAtIndex:(int64_t)a3;
- (double)autoAdvanceDuration;
- (id)_getWorkingString;
- (id)_lazyConnection;
- (id)aggregatedStatus;
- (id)delegate;
- (id)driverConfiguration;
- (id)mainAttributedString;
- (id)mainCellsForVirtualDisplay:(unint64_t)a3;
- (id)pendingAggregatedStatus;
- (id)pendingMainAttributedString;
- (id)tokenArray;
- (int)contractionMode;
- (int)displayMode;
- (int)inputContractionMode;
- (int)virtualStatusAlignment;
- (int64_t)masterStatusCellIndex;
- (int64_t)tokenForRouterIndex:(int64_t)a3 location:(int64_t *)a4 appToken:(id *)a5 forDisplayWithToken:(int)a6;
- (unint64_t)loadVirtualDisplayWithMainSize:(int64_t)a3;
- (unint64_t)numberOfTextLinesInPlanarBraille;
- (unsigned)persistentKeyModifiers;
- (void)_deathTimerHandler;
- (void)_deviceConnected:(id)a3;
- (void)_refreshAfterReconnect;
- (void)_registerDelegate;
- (void)_setMutableAttributedAlertString:(id)a3 timeout:(double)a4 priority:(int)a5;
- (void)cancelCandidateSelection;
- (void)clearTimeoutAlert;
- (void)dealloc;
- (void)display;
- (void)displayIfNeeded;
- (void)exitCurrentDisplayMode;
- (void)handleCallback:(id)a3;
- (void)loadDisplayWithBluetoothDeviceAddress:(id)a3;
- (void)loadTactileGraphicsDisplayWithBLEIdentifier:(id)a3;
- (void)panDisplayBeginning:(int)a3;
- (void)panDisplayEnd:(int)a3;
- (void)panDisplayLeft:(int)a3;
- (void)panDisplayRight:(int)a3;
- (void)planarPanDisplayLeft:(int)a3;
- (void)planarPanDisplayRight:(int)a3;
- (void)removeDisplayWithBluetoothDeviceAddress:(id)a3;
- (void)resetEditingManager;
- (void)selectAllForToken:(int64_t)a3;
- (void)setAggregatedStatus:(id)a3;
- (void)setAlertString:(id)a3 timeout:(double)a4 priority:(int)a5;
- (void)setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3;
- (void)setAnnouncementString:(id)a3;
- (void)setAnnouncementsDisplayMode;
- (void)setAttributedAlertString:(id)a3 timeout:(double)a4 priority:(int)a5;
- (void)setAttributedAnnouncementString:(id)a3;
- (void)setAutoAdvanceDuration:(double)a3;
- (void)setAutoAdvanceEnabled:(BOOL)a3;
- (void)setAutomaticBrailleTranslationEnabled:(BOOL)a3;
- (void)setBlinkEnabled:(BOOL)a3;
- (void)setBrailleChordDebounceTimeout:(double)a3;
- (void)setBrailleMap:(id)a3;
- (void)setContractionMode:(int)a3;
- (void)setDelegate:(id)a3;
- (void)setDisplayDescriptorCallbackEnabled:(BOOL)a3;
- (void)setExpandedStatusDisplayModeWithStatus:(id)a3;
- (void)setFocused:(BOOL)a3 forToken:(int64_t)a4;
- (void)setInputContractionMode:(int)a3;
- (void)setInputEightDotBraille:(BOOL)a3;
- (void)setInputTableIdentifier:(id)a3;
- (void)setKeepConnectionAlive:(BOOL)a3;
- (void)setLastUserInteractionTime:(double)a3;
- (void)setMainAttributedString:(id)a3;
- (void)setMasterStatusCellIndex:(int64_t)a3;
- (void)setPersistentKeyModifiers:(unsigned int)a3;
- (void)setPlanarData:(id)a3;
- (void)setPrepareToMemorizeNextKey:(BOOL)a3 immediate:(BOOL)a4 forDisplayWithToken:(int)a5;
- (void)setPrimaryBrailleDisplay:(int)a3;
- (void)setSelection:(_NSRange)a3 forToken:(int64_t)a4;
- (void)setShowDotsSevenAndEight:(BOOL)a3;
- (void)setShowEightDotBraille:(BOOL)a3;
- (void)setSingleLetterInputIsOn:(BOOL)a3;
- (void)setTableIdentifier:(id)a3;
- (void)setTactileGraphicsImageData:(id)a3;
- (void)setTextSearchModeIsOn:(BOOL)a3;
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
- (void)translateBrailleToClipboard;
- (void)unloadVirtualDisplay:(unint64_t)a3;
- (void)unselectAllForToken:(int64_t)a3;
- (void)virtualDisplay:(unint64_t)a3 pressButton:(unint64_t)a4;
- (void)virtualDisplay:(unint64_t)a3 pressKeyChord:(unint64_t)a4;
- (void)virtualDisplay:(unint64_t)a3 pressRouterWithIndex:(unint64_t)a4;
@end

@implementation SCROBrailleClient

- (SCROBrailleClient)init
{
  return [(SCROBrailleClient *)self initWithDelegate:0];
}

- (SCROBrailleClient)initWithDelegate:(id)a3
{
  id v4 = a3;
  v16.receiver = self;
  v16.super_class = (Class)SCROBrailleClient;
  v5 = [(SCROBrailleClient *)&v16 init];
  if (v5)
  {
    v6 = (NSLock *)objc_alloc_init(MEMORY[0x263F08958]);
    lock = v5->_lock;
    v5->_lock = v6;

    id v8 = objc_alloc(MEMORY[0x263F67028]);
    v9 = (objc_class *)objc_opt_class();
    v10 = NSStringFromClass(v9);
    uint64_t v11 = [v8 initWithDescription:v10];
    threadKey = v5->_threadKey;
    v5->_threadKey = (SCRCThreadKey *)v11;

    uint64_t v13 = [objc_alloc(MEMORY[0x263F67020]) initWithTarget:v5 selector:sel__deathTimerHandler threadKey:v5->_threadKey];
    deathTimer = v5->_deathTimer;
    v5->_deathTimer = (SCRCTargetSelectorTimer *)v13;

    [(SCROBrailleClient *)v5 setDelegate:v4];
  }

  return v5;
}

- (void)dealloc
{
  [(NSLock *)self->_lock lock];
  [(SCROConnection *)self->_connection invalidate];
  [(SCRCTargetSelectorTimer *)self->_deathTimer invalidate];
  [(SCRCTargetSelectorTimer *)self->_deathTimer invalidate];
  [(NSLock *)self->_lock unlock];
  v3.receiver = self;
  v3.super_class = (Class)SCROBrailleClient;
  [(SCROBrailleClient *)&v3 dealloc];
}

- (void)_deviceConnected:(id)a3
{
  id v3 = [(SCROBrailleClient *)self _lazyConnection];
}

- (void)setKeepConnectionAlive:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSLock *)self->_lock lock];
  if (self->_keepConnectionAlive == v3)
  {
    [(NSLock *)self->_lock unlock];
    if (!v3) {
      return;
    }
LABEL_6:
    id v6 = [(SCROBrailleClient *)self _lazyConnection];
    return;
  }
  self->_keepConnectionAlive = v3;
  deathTimer = self->_deathTimer;
  if (v3)
  {
    [(SCRCTargetSelectorTimer *)deathTimer cancel];
    [(NSLock *)self->_lock unlock];
    goto LABEL_6;
  }
  [(SCRCTargetSelectorTimer *)deathTimer dispatchAfterDelay:5.0];
  lock = self->_lock;

  [(NSLock *)lock unlock];
}

- (BOOL)keepConnectionAlive
{
  return self->_keepConnectionAlive;
}

- (void)_deathTimerHandler
{
  if (SCROBrailleClientLogMaskKey) {
    NSLog(&cfstr_AttemptingToCl.isa, a2);
  }
  [(NSLock *)self->_lock lock];
  connection = self->_connection;
  if (connection && !self->_keepConnectionAlive)
  {
    id v4 = [(SCROConnection *)connection handlerValueForKey:64];
    if ((objc_opt_respondsToSelector() & 1) != 0 && ([v4 BOOLValue] & 1) == 0)
    {
      [(SCROConnection *)self->_connection invalidate];
      v5 = self->_connection;
      self->_connection = 0;

      self->_isReady = 0;
      if (SCROBrailleClientLogMaskKey) {
        NSLog(&cfstr_BrailleConnect.isa);
      }
    }
    else
    {
      [(SCRCTargetSelectorTimer *)self->_deathTimer dispatchAfterDelay:5.0];
    }
  }
  [(NSLock *)self->_lock unlock];
}

- (Class)connectionClass
{
  return (Class)objc_opt_class();
}

- (id)_lazyConnection
{
  lock = self->_lock;
  id v4 = [MEMORY[0x263EFF910] now];
  v5 = [v4 dateByAddingTimeInterval:30.0];
  LODWORD(lock) = [(NSLock *)lock lockBeforeDate:v5];

  if (lock)
  {
    connection = self->_connection;
    if (!connection)
    {
      self->_isReady = 0;
      if (SCROBrailleClientLogMaskKey) {
        NSLog(&cfstr_AttemptingToOp.isa);
      }
      v7 = (SCROConnection *)objc_msgSend(objc_alloc(-[SCROBrailleClient connectionClass](self, "connectionClass")), "initWithHandlerType:delegate:", 1, self);
      id v8 = self->_connection;
      self->_connection = v7;

      connection = self->_connection;
    }
    v9 = connection;
    if (!self->_keepConnectionAlive) {
      [(SCRCTargetSelectorTimer *)self->_deathTimer dispatchAfterDelay:5.0];
    }
    [(NSLock *)self->_lock unlock];
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_registerDelegate
{
  p_delegate = &self->_delegate;
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  if (WeakRetained)
  {
    [(NSLock *)self->_lock lock];
    [(SCROConnection *)self->_connection registerHandlerCallbackForKey:74];
    [(SCROConnection *)self->_connection registerHandlerCallbackForKey:76];
    v5 = _SCROD_LOG();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v58 = 0;
      _os_log_impl(&dword_21C66E000, v5, OS_LOG_TYPE_DEFAULT, "-[SCROBrailleClient _registerDelegate] Register callback: 'Display Configuration Changed'", v58, 2u);
    }

    [(SCROConnection *)self->_connection registerHandlerCallbackForKey:72];
    id v6 = objc_loadWeakRetained(p_delegate);
    char v7 = objc_opt_respondsToSelector();

    if (v7) {
      self->_wantsDisconnectMessage = 1;
    }
    id v8 = objc_loadWeakRetained(p_delegate);
    char v9 = objc_opt_respondsToSelector();

    if (v9) {
      self->_wantsReconnectMessage = 1;
    }
    id v10 = objc_loadWeakRetained(p_delegate);
    char v11 = objc_opt_respondsToSelector();

    if (v11) {
      self->_wantsDisplayConfigurationChanged = 1;
    }
    id v12 = objc_loadWeakRetained(p_delegate);
    char v13 = objc_opt_respondsToSelector();

    if (v13) {
      self->_delegateWantsKeypresses = 1;
    }
    id v14 = objc_loadWeakRetained(p_delegate);
    char v15 = objc_opt_respondsToSelector();

    if (v15) {
      self->_delegateWantsReplaceTextRange = 1;
    }
    id v16 = objc_loadWeakRetained(p_delegate);
    char v17 = objc_opt_respondsToSelector();

    if (v17) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:77];
    }
    id v18 = objc_loadWeakRetained(p_delegate);
    char v19 = objc_opt_respondsToSelector();

    if (v19) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:75];
    }
    id v20 = objc_loadWeakRetained(p_delegate);
    char v21 = objc_opt_respondsToSelector();

    if (v21) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:78];
    }
    id v22 = objc_loadWeakRetained(p_delegate);
    char v23 = objc_opt_respondsToSelector();

    if (v23) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:79];
    }
    id v24 = objc_loadWeakRetained(p_delegate);
    char v25 = objc_opt_respondsToSelector();

    if (v25) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:80];
    }
    id v26 = objc_loadWeakRetained(p_delegate);
    char v27 = objc_opt_respondsToSelector();

    if (v27) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:81];
    }
    id v28 = objc_loadWeakRetained(p_delegate);
    char v29 = objc_opt_respondsToSelector();

    if (v29) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:82];
    }
    id v30 = objc_loadWeakRetained(p_delegate);
    char v31 = objc_opt_respondsToSelector();

    if (v31) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:83];
    }
    id v32 = objc_loadWeakRetained(p_delegate);
    char v33 = objc_opt_respondsToSelector();

    if (v33) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:84];
    }
    id v34 = objc_loadWeakRetained(p_delegate);
    char v35 = objc_opt_respondsToSelector();

    if (v35) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:85];
    }
    id v36 = objc_loadWeakRetained(p_delegate);
    char v37 = objc_opt_respondsToSelector();

    if (v37) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:86];
    }
    id v38 = objc_loadWeakRetained(p_delegate);
    char v39 = objc_opt_respondsToSelector();

    if (v39) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:87];
    }
    id v40 = objc_loadWeakRetained(p_delegate);
    char v41 = objc_opt_respondsToSelector();

    if (v41) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:90];
    }
    id v42 = objc_loadWeakRetained(p_delegate);
    char v43 = objc_opt_respondsToSelector();

    if (v43) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:88];
    }
    id v44 = objc_loadWeakRetained(p_delegate);
    char v45 = objc_opt_respondsToSelector();

    if (v45) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:89];
    }
    id v46 = objc_loadWeakRetained(p_delegate);
    char v47 = objc_opt_respondsToSelector();

    if (v47) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:91];
    }
    id v48 = objc_loadWeakRetained(p_delegate);
    char v49 = objc_opt_respondsToSelector();

    if (v49) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:73];
    }
    id v50 = objc_loadWeakRetained(p_delegate);
    char v51 = objc_opt_respondsToSelector();

    if (v51) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:92];
    }
    id v52 = objc_loadWeakRetained(p_delegate);
    char v53 = objc_opt_respondsToSelector();

    if (v53) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:93];
    }
    id v54 = objc_loadWeakRetained(p_delegate);
    char v55 = objc_opt_respondsToSelector();

    if (v55) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:94];
    }
    id v56 = objc_loadWeakRetained(p_delegate);
    char v57 = objc_opt_respondsToSelector();

    if (v57) {
      [(SCROConnection *)self->_connection registerHandlerCallbackForKey:95];
    }
    [(NSLock *)self->_lock unlock];
  }
}

- (void)setDelegate:(id)a3
{
  uint64_t v9 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = _SCROD_LOG();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v7 = 138412290;
    id v8 = v4;
    _os_log_impl(&dword_21C66E000, v5, OS_LOG_TYPE_DEFAULT, "[SCROBrailleClient setDelegate:%@]", (uint8_t *)&v7, 0xCu);
  }

  id WeakRetained = objc_loadWeakRetained(&self->_delegate);
  if (WeakRetained != v4)
  {
    objc_storeWeak(&self->_delegate, v4);
    [(SCROBrailleClient *)self _registerDelegate];
  }
}

- (id)delegate
{
  id WeakRetained = objc_loadWeakRetained(&self->_delegate);

  return WeakRetained;
}

- (void)loadDisplayWithBluetoothDeviceAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  [v5 setHandlerValue:v4 forKey:25];
}

- (void)loadTactileGraphicsDisplayWithBLEIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  [v5 setHandlerValue:v4 forKey:27];
}

- (void)removeDisplayWithBluetoothDeviceAddress:(id)a3
{
  id v4 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  [v5 setHandlerValue:v4 forKey:26];
}

- (void)setTableIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  [v5 setHandlerValue:v4 forKey:28];
}

- (void)setInputTableIdentifier:(id)a3
{
  id v4 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  [v5 setHandlerValue:v4 forKey:29];
}

- (void)setAlwaysUsesNemethCodeForTechnicalText:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setHandlerValue:v4 forKey:30];
}

- (BOOL)alwaysUsesNemethCodeForTechnicalText
{
  v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:30];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)isConfigured
{
  v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:64];

  if (objc_opt_respondsToSelector()) {
    char v4 = [v3 BOOLValue];
  }
  else {
    char v4 = 0;
  }

  return v4;
}

- (id)driverConfiguration
{
  v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerArrayValueForKey:66];

  return v3;
}

- (void)setMainAttributedString:(id)a3
{
  id v7 = a3;
  if ((unint64_t)[v7 length] > 0x1000)
  {
    uint64_t v4 = objc_msgSend(v7, "attributedSubstringFromRange:", 0, 4096);

    id v7 = (id)v4;
  }
  [(NSLock *)self->_lock lock];
  self->_needsDisplay = [(NSMutableAttributedString *)self->_mainStringPending isEqual:v7] ^ 1;
  id v5 = (NSMutableAttributedString *)[v7 mutableCopy];
  mainStringPending = self->_mainStringPending;
  self->_mainStringPending = v5;

  [(NSLock *)self->_lock unlock];
}

- (id)pendingMainAttributedString
{
  [(NSLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSMutableAttributedString *)self->_mainStringPending copy];
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (id)mainAttributedString
{
  v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:31];

  if (v3) {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v3];
  }
  else {
    uint64_t v4 = 0;
  }

  return v4;
}

- (void)setAnnouncementString:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    uint64_t v4 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v5];
    [(SCROBrailleClient *)self setAttributedAnnouncementString:v4];
  }
}

- (void)setAttributedAnnouncementString:(id)a3
{
  id v4 = a3;
  if ([v4 length]) {
    [(SCROBrailleClient *)self setMainAttributedString:v4];
  }
}

- (void)setAlertString:(id)a3 timeout:(double)a4 priority:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v9 = a3;
  if ([v9 length])
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x263F089B8]) initWithString:v9];
    [(SCROBrailleClient *)self _setMutableAttributedAlertString:v8 timeout:v5 priority:a4];
  }
}

- (void)setAttributedAlertString:(id)a3 timeout:(double)a4 priority:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = (id)[a3 mutableCopy];
  [(SCROBrailleClient *)self _setMutableAttributedAlertString:v8 timeout:v5 priority:a4];
}

- (void)_setMutableAttributedAlertString:(id)a3 timeout:(double)a4 priority:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v12 = a3;
  if ([v12 length])
  {
    objc_msgSend(v12, "addAttribute:value:range:", kSCROAlertAttribute[0], MEMORY[0x263EFFA88], 0, 1);
    id v8 = kSCROAlertTimeoutAttribute[0];
    id v9 = [NSNumber numberWithDouble:a4];
    objc_msgSend(v12, "addAttribute:value:range:", v8, v9, 0, 1);

    id v10 = kSCROAlertPriorityAttribute[0];
    char v11 = [NSNumber numberWithInt:v5];
    objc_msgSend(v12, "addAttribute:value:range:", v10, v11, 0, 1);

    [(SCROBrailleClient *)self setMainAttributedString:v12];
  }
}

- (void)clearTimeoutAlert
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:12];
}

- (void)setAggregatedStatus:(id)a3
{
  id v4 = (NSData *)a3;
  [(NSLock *)self->_lock lock];
  self->_needsDisplay = [(NSData *)self->_aggregatedStatusPending isEqual:v4] ^ 1;
  aggregatedStatusPending = self->_aggregatedStatusPending;
  self->_aggregatedStatusPending = v4;
  id v6 = v4;

  [(NSLock *)self->_lock unlock];
}

- (id)pendingAggregatedStatus
{
  [(NSLock *)self->_lock lock];
  BOOL v3 = (void *)[(NSData *)self->_aggregatedStatusPending copy];
  [(NSLock *)self->_lock unlock];

  return v3;
}

- (id)aggregatedStatus
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:40];

  return v3;
}

- (void)setVirtualStatusAlignment:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  id v4 = [NSNumber numberWithInt:v3];
  [v5 setHandlerValue:v4 forKey:41];
}

- (int)virtualStatusAlignment
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  uint64_t v3 = [v2 handlerValueForKey:41];
  int v4 = [v3 intValue];

  return v4;
}

- (void)setMasterStatusCellIndex:(int64_t)a3
{
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  int v4 = [NSNumber numberWithInteger:a3];
  [v5 setHandlerValue:v4 forKey:42];
}

- (int64_t)masterStatusCellIndex
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  uint64_t v3 = [v2 handlerValueForKey:42];
  int64_t v4 = [v3 integerValue];

  return v4;
}

- (void)setShowDotsSevenAndEight:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  int64_t v4 = [NSNumber numberWithBool:v3];
  [v5 setHandlerValue:v4 forKey:33];
}

- (BOOL)showDotsSevenAndEight
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:33];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setContractionMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  char v4 = [NSNumber numberWithInt:v3];
  [v5 setHandlerValue:v4 forKey:37];
}

- (int)contractionMode
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  uint64_t v3 = [v2 handlerValueForKey:37];
  int v4 = [v3 intValue];

  return v4;
}

- (void)setInputEightDotBraille:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  int v4 = [NSNumber numberWithBool:v3];
  [v5 setHandlerValue:v4 forKey:35];
}

- (BOOL)inputEightDotBraille
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:35];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setShowEightDotBraille:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  char v4 = [NSNumber numberWithBool:v3];
  [v5 setHandlerValue:v4 forKey:34];
}

- (BOOL)showEightDotBraille
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:34];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setInputContractionMode:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  char v4 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setHandlerValue:v4 forKey:38];
}

- (int)inputContractionMode
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  uint64_t v3 = [v2 handlerValueForKey:38];
  int v4 = [v3 intValue];

  return v4;
}

- (void)setAutomaticBrailleTranslationEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  int v4 = [NSNumber numberWithBool:v3];
  [v5 setHandlerValue:v4 forKey:36];
}

- (BOOL)automaticBrailleTranslationEnabled
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:36];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setWordWrapEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  char v4 = [NSNumber numberWithBool:v3];
  [v5 setHandlerValue:v4 forKey:44];
}

- (BOOL)wordWrapEnabled
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:44];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setAutoAdvanceEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  char v4 = [NSNumber numberWithBool:v3];
  [v5 setHandlerValue:v4 forKey:45];
}

- (BOOL)autoAdvanceEnabled
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:45];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setAutoAdvanceDuration:(double)a3
{
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  char v4 = [NSNumber numberWithDouble:a3];
  [v5 setHandlerValue:v4 forKey:46];
}

- (double)autoAdvanceDuration
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:46];
  [v3 doubleValue];
  double v5 = v4;

  return v5;
}

- (void)setBlinkEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  double v4 = [NSNumber numberWithBool:v3];
  [v5 setHandlerValue:v4 forKey:47];
}

- (BOOL)blinkEnabled
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:47];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setTactileGraphicsImageData:(id)a3
{
  id v5 = a3;
  p_brailleMapCache = &self->_brailleMapCache;
  if (([v5 isEqualToData:self->_brailleMapCache] & 1) == 0)
  {
    id v7 = [(SCROBrailleClient *)self _lazyConnection];
    [v7 setHandlerValue:v5 forKey:49];

    objc_storeStrong((id *)p_brailleMapCache, a3);
    id v8 = _SCROD_LOG();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_21C66E000, v8, OS_LOG_TYPE_INFO, "Sending image braille data", v9, 2u);
    }
  }
}

- (void)setBrailleMap:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF990] data];
  [v4 dimensions];
  if (v6 > 0.0)
  {
    unint64_t v7 = 0;
    double v8 = 0.0;
    do
    {
      [v4 dimensions];
      if (v9 > 0.0)
      {
        double v10 = 0.0;
        unint64_t v11 = 1;
        do
        {
          char v15 = 0;
          objc_msgSend(v4, "heightAtPoint:", v10, v8);
          char v15 = (int)v12;
          [v5 appendBytes:&v15 length:1];
          double v10 = (double)v11;
          [v4 dimensions];
          ++v11;
        }
        while (v13 > v10);
      }
      double v8 = (double)++v7;
      [v4 dimensions];
    }
    while (v14 > (double)v7);
  }
  [(SCROBrailleClient *)self setTactileGraphicsImageData:v5];
}

- (void)setPlanarData:(id)a3
{
  id v4 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  [v5 setHandlerValue:v4 forKey:50];

  double v6 = _SCROD_LOG();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)unint64_t v7 = 0;
    _os_log_impl(&dword_21C66E000, v6, OS_LOG_TYPE_INFO, "Sending 2D Braille data", v7, 2u);
  }
}

- (unint64_t)numberOfTextLinesInPlanarBraille
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:71];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (int)displayMode
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:67];
  int v4 = [v3 intValue];

  return v4;
}

- (unsigned)persistentKeyModifiers
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:43];
  unsigned int v4 = [v3 intValue];

  return v4;
}

- (void)setPersistentKeyModifiers:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  unsigned int v4 = [NSNumber numberWithUnsignedInt:v3];
  [v5 setHandlerValue:v4 forKey:43];
}

- (void)setLastUserInteractionTime:(double)a3
{
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  unsigned int v4 = [NSNumber numberWithDouble:a3];
  [v5 setHandlerValue:v4 forKey:48];
}

- (void)setExpandedStatusDisplayModeWithStatus:(id)a3
{
  if (a3)
  {
    unsigned int v4 = (objc_class *)MEMORY[0x263F089B8];
    id v5 = a3;
    id v6 = (id)[[v4 alloc] initWithString:@" "];
    objc_msgSend(v6, "addAttribute:value:range:", kSCROStatusAttribute[0], v5, 0, 1);

    [(SCROBrailleClient *)self setMainAttributedString:v6];
  }
}

- (void)setAnnouncementsDisplayMode
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:6];
}

- (void)exitCurrentDisplayMode
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:9];
}

- (void)setDisplayDescriptorCallbackEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  [(NSLock *)self->_lock lock];
  self->_displayDescriptorCallbackEnabled = v3;
  connection = self->_connection;
  lock = self->_lock;
  if (connection) {
    BOOL v7 = 1;
  }
  else {
    BOOL v7 = !v3;
  }
  if (!v7)
  {
    [(NSLock *)self->_lock unlock];
    id v11 = [(SCROBrailleClient *)self _lazyConnection];
    double v9 = [NSNumber numberWithBool:1];
    [v11 setHandlerValue:v9 forKey:39];

LABEL_8:

    return;
  }
  if (connection)
  {
    double v8 = connection;
    [(NSLock *)lock unlock];
    id v11 = [NSNumber numberWithBool:v3];
    [(SCROConnection *)v8 setHandlerValue:v11 forKey:39];

    goto LABEL_8;
  }
  double v10 = self->_lock;

  [(NSLock *)v10 unlock];
}

- (BOOL)displayDescriptorCallbackEnabled
{
  [(NSLock *)self->_lock lock];
  connection = self->_connection;
  lock = self->_lock;
  id v5 = connection;
  [(NSLock *)lock unlock];
  id v6 = [(SCROConnection *)v5 handlerValueForKey:39];

  LOBYTE(v5) = [v6 BOOLValue];
  return (char)v5;
}

- (int64_t)tokenForRouterIndex:(int64_t)a3 location:(int64_t *)a4 appToken:(id *)a5 forDisplayWithToken:(int)a6
{
  id v11 = objc_alloc(NSDictionary);
  float v12 = [NSNumber numberWithInteger:a3];
  double v13 = [NSNumber numberWithInteger:a6];
  double v14 = objc_msgSend(v11, "initWithObjectsAndKeys:", v12, @"index", v13, @"displayToken", 0);

  char v15 = [(SCROBrailleClient *)self _lazyConnection];
  id v16 = [v15 handlerValueForKey:65 withObject:v14];

  char v17 = [v16 objectForKey:kSCROBrailleRouterKeyLocation];
  *a4 = [v17 integerValue];

  *a5 = [v16 objectForKey:kSCROBrailleRouterKeyAppToken[0]];
  id v18 = [v16 objectForKey:kSCROBrailleRouterKeyToken[0]];
  int64_t v19 = [v18 integerValue];

  return v19;
}

- (id)_getWorkingString
{
  [(NSLock *)self->_lock lock];
  mainStringPending = self->_mainStringPending;
  if (mainStringPending || (mainStringPending = self->_mainStringCache) != 0) {
    unsigned int v4 = (void *)[(NSMutableAttributedString *)mainStringPending copy];
  }
  else {
    unsigned int v4 = 0;
  }
  [(NSLock *)self->_lock unlock];
  if (!v4)
  {
    unsigned int v4 = [(SCROBrailleClient *)self mainAttributedString];
  }

  return v4;
}

- (id)tokenArray
{
  id v2 = [(SCROBrailleClient *)self _getWorkingString];
  BOOL v3 = [MEMORY[0x263EFF980] array];
  uint64_t v4 = [v2 length];
  uint64_t v10 = 0;
  uint64_t v11 = 0;
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = 0;
    do
    {
      BOOL v7 = objc_msgSend(v2, "attribute:atIndex:longestEffectiveRange:inRange:", kSCROTokenAttribute[0], v6, &v10, v6, v5);
      if (v7) {
        [v3 addObject:v7];
      }
      uint64_t v8 = v11 + v10;
      uint64_t v5 = v6 + v5 - (v11 + v10);

      uint64_t v6 = v8;
    }
    while (v5);
  }

  return v3;
}

- (_NSRange)rangeOfCellRepresentingCharacterAtIndex:(int64_t)a3
{
  uint64_t v4 = [(SCROBrailleClient *)self _lazyConnection];
  uint64_t v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 handlerValueForKey:68 withObject:v5];

  uint64_t v7 = [v6 rangeValue];
  NSUInteger v9 = v8;

  NSUInteger v10 = v7;
  NSUInteger v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (void)setSelection:(_NSRange)a3 forToken:(int64_t)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  v17.NSUInteger location = 0;
  v17.NSUInteger length = 0;
  NSUInteger v8 = [(SCROBrailleClient *)self _getWorkingString];
  NSUInteger v9 = (void *)[v8 mutableCopy];

  NSUInteger v10 = kSCROTokenAttribute[0];
  NSUInteger v11 = [NSNumber numberWithInteger:a4];
  LODWORD(v10) = [v9 getRange:&v17 ofAttribute:v10 withValue:v11];

  if (v10)
  {
    objc_msgSend(v9, "removeAttribute:range:", kSCROSelectionAttribute[0], v17.location, v17.length);
    objc_msgSend(v9, "removeAttribute:range:", kSCROCursorAttribute[0], v17.location, v17.length);
    NSRange v12 = v17;
    if (length <= 1) {
      v13.NSUInteger length = 1;
    }
    else {
      v13.NSUInteger length = length;
    }
    v13.NSUInteger location = v17.location + location;
    NSRange v14 = NSIntersectionRange(v13, v12);
    if (length) {
      char v15 = kSCROSelectionAttribute;
    }
    else {
      char v15 = kSCROCursorAttribute;
    }
    id v16 = *v15;
    if (v14.length) {
      objc_msgSend(v9, "addAttribute:value:range:", v16, MEMORY[0x263EFFA88], v14.location, v14.length);
    }
    [(SCROBrailleClient *)self setMainAttributedString:v9];
  }
}

- (void)selectAllForToken:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v5 = [(SCROBrailleClient *)self _getWorkingString];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = kSCROTokenAttribute[0];
  NSUInteger v8 = [NSNumber numberWithInteger:a3];
  LODWORD(v7) = [v6 getRange:&v9 ofAttribute:v7 withValue:v8];

  if (v7)
  {
    objc_msgSend(v6, "addAttribute:value:range:", kSCROSelectionAttribute[0], MEMORY[0x263EFFA88], v9, v10);
    [(SCROBrailleClient *)self setMainAttributedString:v6];
  }
}

- (void)unselectAllForToken:(int64_t)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = 0;
  uint64_t v5 = [(SCROBrailleClient *)self _getWorkingString];
  uint64_t v6 = (void *)[v5 mutableCopy];

  uint64_t v7 = kSCROTokenAttribute[0];
  NSUInteger v8 = [NSNumber numberWithInt:a3];
  LODWORD(v7) = [v6 getRange:&v9 ofAttribute:v7 withValue:v8];

  if (v7)
  {
    objc_msgSend(v6, "removeAttribute:range:", kSCROCursorAttribute[0], v9, v10);
    objc_msgSend(v6, "removeAttribute:range:", kSCROSelectionAttribute[0], v9, v10);
    [(SCROBrailleClient *)self setMainAttributedString:v6];
  }
}

- (void)setFocused:(BOOL)a3 forToken:(int64_t)a4
{
  BOOL v5 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  uint64_t v7 = [(SCROBrailleClient *)self _getWorkingString];
  NSUInteger v8 = (void *)[v7 mutableCopy];

  uint64_t v9 = kSCROTokenAttribute[0];
  uint64_t v10 = [NSNumber numberWithInteger:a4];
  LODWORD(v9) = [v8 getRange:&v11 ofAttribute:v9 withValue:v10];

  if (v9)
  {
    if (v5) {
      objc_msgSend(v8, "addAttribute:value:range:", kSCROFocusedAttribute[0], MEMORY[0x263EFFA88], v11, v12);
    }
    else {
      objc_msgSend(v8, "removeAttribute:range:", kSCROFocusedAttribute[0], v11, v12);
    }
    [(SCROBrailleClient *)self setMainAttributedString:v8];
  }
}

- (BOOL)needsDisplay
{
  return self->_needsDisplay;
}

- (void)displayIfNeeded
{
  if ([(SCROBrailleClient *)self needsDisplay])
  {
    [(SCROBrailleClient *)self display];
  }
}

- (void)display
{
  id v8 = [[SCROEvent alloc] initForHandlerType:1];
  [(NSLock *)self->_lock lock];
  mainStringPending = self->_mainStringPending;
  if (mainStringPending)
  {
    [v8 requestSetValue:self->_mainStringPending forKey:31];
    objc_storeStrong((id *)&self->_mainStringCache, self->_mainStringPending);
    uint64_t v4 = self->_mainStringPending;
    self->_mainStringPending = 0;
  }
  aggregatedStatusPending = self->_aggregatedStatusPending;
  if (aggregatedStatusPending)
  {
    [v8 requestSetValue:aggregatedStatusPending forKey:40];
    objc_storeStrong((id *)&self->_aggregatedStatusCache, self->_aggregatedStatusPending);
    uint64_t v6 = self->_aggregatedStatusPending;
    self->_aggregatedStatusPending = 0;

    [(NSLock *)self->_lock unlock];
  }
  else
  {
    [(NSLock *)self->_lock unlock];
    if (!mainStringPending) {
      goto LABEL_7;
    }
  }
  uint64_t v7 = [(SCROBrailleClient *)self _lazyConnection];
  [v7 sendEvent:v8];

LABEL_7:
}

- (void)simulateKeypress:(id)a3
{
  id v4 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  [v5 setHandlerValue:v4 forKey:56];
}

- (void)panDisplayLeft:(int)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  id v4 = [(SCROBrailleClient *)self _lazyConnection];
  [v4 setHandlerValue:v5 forKey:52];
}

- (void)panDisplayRight:(int)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  id v4 = [(SCROBrailleClient *)self _lazyConnection];
  [v4 setHandlerValue:v5 forKey:53];
}

- (void)panDisplayBeginning:(int)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  id v4 = [(SCROBrailleClient *)self _lazyConnection];
  [v4 setHandlerValue:v5 forKey:54];
}

- (void)panDisplayEnd:(int)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  id v4 = [(SCROBrailleClient *)self _lazyConnection];
  [v4 setHandlerValue:v5 forKey:55];
}

- (void)planarPanDisplayLeft:(int)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  id v4 = [(SCROBrailleClient *)self _lazyConnection];
  [v4 setHandlerValue:v5 forKey:62];
}

- (void)planarPanDisplayRight:(int)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  id v4 = [(SCROBrailleClient *)self _lazyConnection];
  [v4 setHandlerValue:v5 forKey:63];
}

- (void)showPreviousAnnouncement
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:8];
}

- (void)showNextAnnouncement
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:7];
}

- (BOOL)isCandidateSelectionOn
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:69];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)cancelCandidateSelection
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:13];
}

- (void)showPreviousCandidate
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:14];
}

- (void)showNextCandidate
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:15];
}

- (BOOL)isWordDescriptionOn
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  BOOL v3 = [v2 handlerValueForKey:70];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)showPreviousWordDescription
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:16];
}

- (void)showNextWordDescription
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:17];
}

- (unint64_t)loadVirtualDisplayWithMainSize:(int64_t)a3
{
  char v4 = [(SCROBrailleClient *)self _lazyConnection];
  id v5 = [NSNumber numberWithInteger:a3];
  uint64_t v6 = [v4 handlerValueForKey:19 withObject:v5];
  unint64_t v7 = [v6 unsignedIntegerValue];

  return v7;
}

- (void)unloadVirtualDisplay:(unint64_t)a3
{
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  char v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setHandlerValue:v4 forKey:18];
}

- (id)mainCellsForVirtualDisplay:(unint64_t)a3
{
  char v4 = [(SCROBrailleClient *)self _lazyConnection];
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v6 = [v4 handlerValueForKey:20 withObject:v5];
  unint64_t v7 = [v6 stringValue];

  return v7;
}

- (void)virtualDisplay:(unint64_t)a3 pressButton:(unint64_t)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"displayToken";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  v10[1] = @"button";
  v11[0] = v6;
  unint64_t v7 = [NSNumber numberWithUnsignedInteger:a4];
  v11[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  uint64_t v9 = [(SCROBrailleClient *)self _lazyConnection];
  [v9 setHandlerValue:v8 forKey:21];
}

- (void)virtualDisplay:(unint64_t)a3 pressKeyChord:(unint64_t)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"displayToken";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  v10[1] = @"keyChord";
  v11[0] = v6;
  unint64_t v7 = [NSNumber numberWithUnsignedInteger:a4];
  v11[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  uint64_t v9 = [(SCROBrailleClient *)self _lazyConnection];
  [v9 setHandlerValue:v8 forKey:22];
}

- (void)systemVirtualDisplayPressKeyChord:(unint64_t)a3
{
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  char v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setHandlerValue:v4 forKey:24];
}

- (void)virtualDisplay:(unint64_t)a3 pressRouterWithIndex:(unint64_t)a4
{
  v11[2] = *MEMORY[0x263EF8340];
  v10[0] = @"displayToken";
  uint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  v10[1] = @"index";
  v11[0] = v6;
  unint64_t v7 = [NSNumber numberWithUnsignedInteger:a4];
  v11[1] = v7;
  id v8 = [NSDictionary dictionaryWithObjects:v11 forKeys:v10 count:2];

  uint64_t v9 = [(SCROBrailleClient *)self _lazyConnection];
  [v9 setHandlerValue:v8 forKey:23];
}

- (void)setPrepareToMemorizeNextKey:(BOOL)a3 immediate:(BOOL)a4 forDisplayWithToken:(int)a5
{
  BOOL v6 = a4;
  BOOL v7 = a3;
  id v9 = objc_alloc(NSDictionary);
  uint64_t v10 = [NSNumber numberWithBool:v7];
  uint64_t v11 = [NSNumber numberWithBool:v6];
  uint64_t v12 = [NSNumber numberWithInteger:a5];
  id v14 = (id)objc_msgSend(v9, "initWithObjectsAndKeys:", v10, @"prepare", v11, @"immediate", v12, @"displayToken", 0);

  NSRange v13 = [(SCROBrailleClient *)self _lazyConnection];
  [v13 setHandlerValue:v14 forKey:57];
}

- (void)setPrimaryBrailleDisplay:(int)a3
{
  id v5 = [NSNumber numberWithInteger:a3];
  char v4 = [(SCROBrailleClient *)self _lazyConnection];
  [v4 setHandlerValue:v5 forKey:58];
}

- (void)resetEditingManager
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:11];
}

- (void)handleCallback:(id)a3
{
  uint64_t v37 = *MEMORY[0x263EF8340];
  id v4 = a3;
  int v5 = [v4 key];
  switch(v5)
  {
    case 'H':
      [(NSLock *)self->_lock lock];
      if (!self->_keepConnectionAlive) {
        [(SCRCTargetSelectorTimer *)self->_deathTimer dispatchAfterDelay:5.0];
      }
      [(NSLock *)self->_lock unlock];
      BOOL v6 = _SCROD_LOG();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        BOOL wantsDisplayConfigurationChanged = self->_wantsDisplayConfigurationChanged;
        id v8 = [v4 object];
        v34[0] = 67109378;
        v34[1] = wantsDisplayConfigurationChanged;
        __int16 v35 = 2112;
        id v36 = v8;
        _os_log_impl(&dword_21C66E000, v6, OS_LOG_TYPE_DEFAULT, "-[SCROBrailleClient handleCallback:] Call delegate's config change handler; Delegate wants == %d, isConfigured == %@",
          (uint8_t *)v34,
          0x12u);
      }
      if (self->_wantsDisplayConfigurationChanged)
      {
        id WeakRetained = objc_loadWeakRetained(&self->_delegate);
        uint64_t v10 = [v4 object];
        [WeakRetained handleBrailleConfigurationChanged:v10];
        goto LABEL_40;
      }
      goto LABEL_45;
    case 'I':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleBrailleTableFailedToLoad:v10];
      goto LABEL_40;
    case 'J':
      if (!self->_delegateWantsKeypresses) {
        goto LABEL_45;
      }
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleBrailleKeypress:v10];
      goto LABEL_40;
    case 'K':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      [WeakRetained handleUserEventOccured];
      goto LABEL_41;
    case 'L':
      if (!self->_delegateWantsReplaceTextRange) {
        goto LABEL_45;
      }
      uint64_t v11 = [v4 object];
      uint64_t v12 = [v11 objectForKeyedSubscript:kSCROBrailleCallbackReplaceTextRange_RangeKey];
      uint64_t v13 = [v12 rangeValue];
      uint64_t v15 = v14;

      id v16 = [v11 objectForKeyedSubscript:kSCROBrailleCallbackReplaceTextRange_StringKey];
      NSRange v17 = [v11 objectForKeyedSubscript:kSCROBrailleCallbackReplaceTextRange_CursorKey];
      uint64_t v18 = [v17 unsignedIntegerValue];

      id v19 = objc_loadWeakRetained(&self->_delegate);
      objc_msgSend(v19, "handleBrailleReplaceTextRange:withString:cursor:", v13, v15, v16, v18);
      goto LABEL_22;
    case 'M':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      [WeakRetained handleBrailleStartEditing];
      goto LABEL_41;
    case 'N':
      uint64_t v11 = [v4 object];
      id v16 = [v11 objectForKeyedSubscript:kSCROBrailleCallbackSpeechFeedback_SpokenTextKey];
      id v20 = [v11 objectForKeyedSubscript:kSCROBrailleCallbackSpeechFeedback_SpeakLiterallyKey];
      uint64_t v21 = [v20 BOOLValue];

      id v19 = objc_loadWeakRetained(&self->_delegate);
      [v19 handleBrailleInsertedUntranslatedText:v16 speakLiterally:v21];
      goto LABEL_22;
    case 'O':
      uint64_t v11 = [v4 object];
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_44;
      }
      id v16 = [v11 objectForKeyedSubscript:kSCROBrailleCallbackSpeechFeedback_SpokenTextKey];
      id v22 = [v11 objectForKeyedSubscript:kSCROBrailleCallbackSpeechFeedback_SpeakLiterallyKey];
      uint64_t v23 = [v22 BOOLValue];

      id v19 = objc_loadWeakRetained(&self->_delegate);
      [v19 handleBrailleDeletedUntranslatedText:v16 speakLiterally:v23];
LABEL_22:

LABEL_24:
      goto LABEL_44;
    case 'P':
      uint64_t v11 = [v4 object];
      id v16 = [v11 objectForKeyedSubscript:kSCROBrailleCallbackSpeechFeedback_SpokenTextKey];
      id v24 = [v11 objectForKeyedSubscript:kSCROBrailleCallbackSpeechFeedback_LanguageKey];
      id v25 = objc_loadWeakRetained(&self->_delegate);
      [v25 handleBrailleSpeechRequest:v16 language:v24];

      goto LABEL_24;
    case 'Q':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleBrailleKeyWillMemorize:v10];
      goto LABEL_40;
    case 'R':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleBrailleKeyMemorize:v10];
      goto LABEL_40;
    case 'S':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleBrailleDidDisplay:v10];
      goto LABEL_40;
    case 'T':
      uint64_t v11 = [v4 object];
      id v26 = objc_loadWeakRetained(&self->_delegate);
      char v27 = [v11 objectForKey:@"success"];
      id v28 = [v11 objectForKey:@"token"];
      char v29 = [v11 objectForKey:@"appToken"];
      id v30 = [v11 objectForKeyedSubscript:@"lineOffset"];
      [v26 handleBrailleDidPanLeft:v27 elementToken:v28 appToken:v29 lineOffset:v30];
      goto LABEL_30;
    case 'U':
      uint64_t v11 = [v4 object];
      id v26 = objc_loadWeakRetained(&self->_delegate);
      char v27 = [v11 objectForKey:@"success"];
      id v28 = [v11 objectForKey:@"token"];
      char v29 = [v11 objectForKey:@"appToken"];
      id v30 = [v11 objectForKeyedSubscript:@"lineOffset"];
      [v26 handleBrailleDidPanRight:v27 elementToken:v28 appToken:v29 lineOffset:v30];
LABEL_30:

      goto LABEL_43;
    case 'V':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleBrailleDidShowPreviousAnnouncement:v10];
      goto LABEL_40;
    case 'W':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleBrailleDidShowNextAnnouncement:v10];
      goto LABEL_40;
    case 'X':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      [WeakRetained handleBraillePlayBorderHitSound];
      goto LABEL_41;
    case 'Y':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      [WeakRetained handleBraillePlayCommandNotSupportedSound];
      goto LABEL_41;
    case 'Z':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleBraillePlayDisplayConnectionSound:v10];
      goto LABEL_40;
    case '[':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleFailedToLoadBluetoothDevice:v10];
      goto LABEL_40;
    case '\\':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleDisplayModeChanged:v10];
      goto LABEL_40;
    case ']':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleBrailleDisplayCopyStringToClipboard:v10];
      goto LABEL_40;
    case '^':
      id WeakRetained = objc_loadWeakRetained(&self->_delegate);
      uint64_t v10 = [v4 object];
      [WeakRetained handleTactileGraphicsCanvasDidChange:v10];
LABEL_40:

LABEL_41:
      goto LABEL_45;
    case '_':
      uint64_t v11 = [v4 object];
      id v26 = objc_loadWeakRetained(&self->_delegate);
      char v27 = [v4 object];
      objc_msgSend(v26, "handlePlanarPanFailedIsLeft:", objc_msgSend(v27, "BOOLValue"));
LABEL_43:

      goto LABEL_44;
    default:
      if (v5 == 3)
      {
        char v31 = _SCROD_LOG();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(v34[0]) = 0;
          _os_log_impl(&dword_21C66E000, v31, OS_LOG_TYPE_DEFAULT, "[SCROBrailleClient handleCallback:] for key CallbackConnect", (uint8_t *)v34, 2u);
        }

        [(NSLock *)self->_lock lock];
        id v32 = [v4 object];
        connection = self->_connection;

        [(NSLock *)self->_lock unlock];
        if (v32 == connection)
        {
          self->_isReady = 1;
          [(SCROBrailleClient *)self _registerDelegate];
          [(SCROBrailleClient *)self _refreshAfterReconnect];
          if (self->_wantsReconnectMessage)
          {
            uint64_t v11 = objc_loadWeakRetained(&self->_delegate);
            [v11 handleBrailleDidReconnect:self];
            goto LABEL_44;
          }
        }
      }
      else if (v5 == 4)
      {
        self->_isReady = 0;
        if (self->_wantsDisconnectMessage)
        {
          uint64_t v11 = objc_loadWeakRetained(&self->_delegate);
          [v11 handleBrailleDidDisconnect:self];
LABEL_44:
        }
      }
LABEL_45:

      return;
  }
}

- (void)_refreshAfterReconnect
{
  [(NSLock *)self->_lock lock];
  if (!self->_mainStringPending) {
    objc_storeStrong((id *)&self->_mainStringPending, self->_mainStringCache);
  }
  if (!self->_aggregatedStatusPending) {
    objc_storeStrong((id *)&self->_aggregatedStatusPending, self->_aggregatedStatusCache);
  }
  BOOL displayDescriptorCallbackEnabled = self->_displayDescriptorCallbackEnabled;
  [(NSLock *)self->_lock unlock];
  [(SCROBrailleClient *)self display];
  if (displayDescriptorCallbackEnabled)
  {
    [(SCROBrailleClient *)self setDisplayDescriptorCallbackEnabled:1];
  }
}

- (BOOL)isConnected
{
  return self->_isReady;
}

- (void)setSingleLetterInputIsOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setHandlerValue:v4 forKey:59];
}

- (void)setTextSearchModeIsOn:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  id v4 = [NSNumber numberWithBool:v3];
  [v5 setHandlerValue:v4 forKey:60];
}

- (void)setBrailleChordDebounceTimeout:(double)a3
{
  id v5 = [(SCROBrailleClient *)self _lazyConnection];
  id v4 = [NSNumber numberWithDouble:a3];
  [v5 setHandlerValue:v4 forKey:61];
}

+ (id)statusAttributeDotText
{
  id v2 = [MEMORY[0x263EFF980] arrayWithCapacity:8];
  for (uint64_t i = 0; i != 8; ++i)
    [v2 addObject:kSCROStatusAttributeDotText[i]];

  return v2;
}

- (void)translateBrailleToClipboard
{
  id v2 = [(SCROBrailleClient *)self _lazyConnection];
  [v2 performHandlerActionForKey:10];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_brailleMapCache, 0);
  objc_storeStrong((id *)&self->_deathTimer, 0);
  objc_storeStrong((id *)&self->_threadKey, 0);
  objc_storeStrong((id *)&self->_aggregatedStatusCache, 0);
  objc_storeStrong((id *)&self->_aggregatedStatusPending, 0);
  objc_storeStrong((id *)&self->_mainStringCache, 0);
  objc_storeStrong((id *)&self->_mainStringPending, 0);
  objc_destroyWeak(&self->_delegate);
  objc_storeStrong((id *)&self->_lock, 0);

  objc_storeStrong((id *)&self->_connection, 0);
}

@end