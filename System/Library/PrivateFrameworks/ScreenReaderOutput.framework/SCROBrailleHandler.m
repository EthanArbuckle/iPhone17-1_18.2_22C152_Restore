@interface SCROBrailleHandler
- (SCROBrailleHandler)initWithBrailleDisplayManager:(id)a3;
- (int)handleGetValue:(id *)a3 forKey:(int)a4 trusted:(BOOL)a5;
- (int)handleGetValue:(id *)a3 forKey:(int)a4 withObject:(id)a5 trusted:(BOOL)a6;
- (int)handlePerformActionForKey:(int)a3 trusted:(BOOL)a4;
- (int)handleRegisterCallbackForKey:(int)a3 trusted:(BOOL)a4;
- (int)handleSetValue:(id)a3 forKey:(int)a4 trusted:(BOOL)a5;
- (void)configurationDidChange;
- (void)handleBrailleDeletedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4;
- (void)handleBrailleDidDisplay:(id)a3;
- (void)handleBrailleDidPanLeft:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6;
- (void)handleBrailleDidPanRight:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6;
- (void)handleBrailleDidShowNextAnnouncement:(id)a3;
- (void)handleBrailleDidShowPreviousAnnouncement:(id)a3;
- (void)handleBrailleDriverDidLoad;
- (void)handleBrailleDriverDisconnected;
- (void)handleBrailleInsertedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4;
- (void)handleBrailleKeyMemorize:(id)a3;
- (void)handleBrailleKeyWillMemorize:(id)a3;
- (void)handleBrailleKeypress:(id)a3;
- (void)handleBrailleReplaceTextRange:(_NSRange)a3 withString:(id)a4 cursor:(unint64_t)a5;
- (void)handleBrailleSpeechRequest:(id)a3 language:(id)a4;
- (void)handleBrailleTableFailedToLoad:(id)a3;
- (void)handleCopyStringToClipboard:(id)a3;
- (void)handleDisplayModeChanged:(id)a3;
- (void)handleFailedToLoadBluetoothDevice:(id)a3;
- (void)handlePlanarPanFailedIsLeft:(BOOL)a3;
- (void)handlePlayBorderHitSound;
- (void)handlePlayCommandNotSupportedSound;
- (void)handleStartEditing;
- (void)handleTacticalGraphicsCanvasDidChange:(id)a3;
- (void)handleUserEventOccured;
- (void)invalidate;
@end

@implementation SCROBrailleHandler

- (SCROBrailleHandler)initWithBrailleDisplayManager:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SCROBrailleHandler;
  v6 = [(SCROHandler *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_brailleDisplayManager, a3);
    [(SCROBrailleDisplayManager *)v7->_brailleDisplayManager setDelegate:v7];
  }

  return v7;
}

- (void)invalidate
{
  [(SCROBrailleDisplayManager *)self->_brailleDisplayManager setDelegate:0];
  v3.receiver = self;
  v3.super_class = (Class)SCROBrailleHandler;
  [(SCROHandler *)&v3 invalidate];
}

- (int)handleRegisterCallbackForKey:(int)a3 trusted:(BOOL)a4
{
  switch(a3)
  {
    case 'H':
      int result = 0;
      self->_callbacks.configChanged = 1;
      break;
    case 'I':
      int result = 0;
      self->_callbacks.tableLoadFailed = 1;
      break;
    case 'J':
      int result = 0;
      self->_callbacks.keypress = 1;
      break;
    case 'K':
      int result = 0;
      self->_callbacks.userEventOccured = 1;
      break;
    case 'L':
      int result = 0;
      self->_callbacks.replaceTextRange = 1;
      break;
    case 'M':
      int result = 0;
      self->_callbacks.startEditing = 1;
      break;
    case 'N':
      int result = 0;
      self->_callbacks.insertUntranslatedText = 1;
      break;
    case 'O':
      int result = 0;
      self->_callbacks.deleteUntranslatedText = 1;
      break;
    case 'P':
      int result = 0;
      self->_callbacks.speechRequest = 1;
      break;
    case 'Q':
      int result = 0;
      self->_callbacks.keyWillMem = 1;
      break;
    case 'R':
      int result = 0;
      self->_callbacks.keymem = 1;
      break;
    case 'S':
      if (!a4) {
        goto LABEL_30;
      }
      int result = 0;
      self->_callbacks.didDisplay = 1;
      break;
    case 'T':
      int result = 0;
      self->_callbacks.panLeft = 1;
      break;
    case 'U':
      int result = 0;
      self->_callbacks.panRight = 1;
      break;
    case 'V':
      int result = 0;
      self->_callbacks.showPreviousAnnouncement = 1;
      break;
    case 'W':
      int result = 0;
      self->_callbacks.showNextAnnouncement = 1;
      break;
    case 'X':
      int result = 0;
      self->_callbacks.playBorderHitSound = 1;
      break;
    case 'Y':
      int result = 0;
      self->_callbacks.playCommandNotSupportedSound = 1;
      break;
    case 'Z':
      v6 = _SCROD_LOG();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_21C66E000, v6, OS_LOG_TYPE_DEFAULT, "Made connection sound", buf, 2u);
      }

      self->_callbacks.playDisplayConnectionSound = 1;
      int result = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager hasActiveUserDisplays];
      if (result)
      {
        v7 = _SCROD_LOG();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_21C66E000, v7, OS_LOG_TYPE_DEFAULT, "Handle did load", buf, 2u);
        }

        [(SCROBrailleHandler *)self performSelector:sel_handleBrailleDriverDidLoad withObject:0 afterDelay:0.0];
LABEL_30:
        int result = 0;
      }
      break;
    case '[':
      int result = 0;
      self->_callbacks.bluetoothDisplayLoadFailed = 1;
      break;
    case '\\':
      int result = 0;
      self->_callbacks.displayModeChanged = 1;
      break;
    case ']':
      int result = 0;
      self->_callbacks.copyStringToClipboard = 1;
      break;
    case '^':
      int result = 0;
      self->_callbacks.planarCanvasDidChange = 1;
      break;
    case '_':
      int result = 0;
      self->_callbacks.planarPan = 1;
      break;
    default:
      v8.receiver = self;
      v8.super_class = (Class)SCROBrailleHandler;
      int result = -[SCROHandler handleRegisterCallbackForKey:trusted:](&v8, sel_handleRegisterCallbackForKey_trusted_);
      break;
  }
  return result;
}

- (int)handleSetValue:(id)a3 forKey:(int)a4 trusted:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  objc_super v9 = v8;
  switch((int)v6)
  {
    case 18:
      -[SCROBrailleDisplayManager unloadVirtualDisplay:](self->_brailleDisplayManager, "unloadVirtualDisplay:", [v8 unsignedIntegerValue]);
      goto LABEL_48;
    case 21:
      brailleDisplayManager = self->_brailleDisplayManager;
      v11 = [v8 objectForKey:@"displayToken"];
      uint64_t v14 = [v11 unsignedIntegerValue];
      v15 = [v9 objectForKey:@"button"];
      -[SCROBrailleDisplayManager virtualDisplay:pressButton:](brailleDisplayManager, "virtualDisplay:pressButton:", v14, [v15 unsignedIntegerValue]);
      goto LABEL_46;
    case 22:
      v16 = self->_brailleDisplayManager;
      v11 = [v8 objectForKey:@"displayToken"];
      uint64_t v17 = [v11 unsignedIntegerValue];
      v15 = [v9 objectForKey:@"keyChord"];
      -[SCROBrailleDisplayManager virtualDisplay:pressKeyChord:](v16, "virtualDisplay:pressKeyChord:", v17, [v15 unsignedIntegerValue]);
      goto LABEL_46;
    case 23:
      v18 = self->_brailleDisplayManager;
      v11 = [v8 objectForKey:@"displayToken"];
      uint64_t v19 = [v11 unsignedIntegerValue];
      v15 = [v9 objectForKey:@"index"];
      -[SCROBrailleDisplayManager virtualDisplay:pressRouterWithIndex:](v18, "virtualDisplay:pressRouterWithIndex:", v19, [v15 unsignedIntegerValue]);
      goto LABEL_46;
    case 24:
      -[SCROBrailleDisplayManager systemVirtualDisplayPressKeyChord:](self->_brailleDisplayManager, "systemVirtualDisplayPressKeyChord:", [v8 unsignedIntegerValue]);
      goto LABEL_48;
    case 25:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager loadBluetoothDriverWithAddress:v8];
      goto LABEL_48;
    case 26:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager removeBluetoothDriverWithAddress:v8];
      goto LABEL_48;
    case 27:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager loadBLEDriverWithIdentifier:v8];
      goto LABEL_48;
    case 28:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager configureTableWithIdentifier:v8];
      goto LABEL_48;
    case 29:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager configureInputTableWithIdentifier:v8];
      goto LABEL_48;
    case 30:
      -[SCROBrailleDisplayManager setAlwaysUsesNemethCodeForTechnicalText:](self->_brailleDisplayManager, "setAlwaysUsesNemethCodeForTechnicalText:", [v8 BOOLValue]);
      goto LABEL_48;
    case 31:
      v11 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithAttributedString:v8];
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager setMainAttributedString:v11 forceUpdate:0];
      goto LABEL_47;
    case 33:
      -[SCROBrailleDisplayManager setShowDotsSevenAndEight:](self->_brailleDisplayManager, "setShowDotsSevenAndEight:", [v8 BOOLValue]);
      goto LABEL_48;
    case 34:
      -[SCROBrailleDisplayManager setShowEightDotBraille:](self->_brailleDisplayManager, "setShowEightDotBraille:", [v8 BOOLValue]);
      goto LABEL_48;
    case 35:
      -[SCROBrailleDisplayManager setInputEightDotBraille:](self->_brailleDisplayManager, "setInputEightDotBraille:", [v8 BOOLValue]);
      goto LABEL_48;
    case 36:
      -[SCROBrailleDisplayManager setAutomaticBrailleTranslationEnabled:](self->_brailleDisplayManager, "setAutomaticBrailleTranslationEnabled:", [v8 BOOLValue]);
      goto LABEL_48;
    case 37:
      -[SCROBrailleDisplayManager setContractionMode:](self->_brailleDisplayManager, "setContractionMode:", [v8 intValue]);
      goto LABEL_48;
    case 38:
      -[SCROBrailleDisplayManager setInputContractionMode:](self->_brailleDisplayManager, "setInputContractionMode:", [v8 intValue]);
      goto LABEL_48;
    case 39:
      if (v5) {
        -[SCROBrailleDisplayManager setLineDescriptorDisplayCallbackEnabled:](self->_brailleDisplayManager, "setLineDescriptorDisplayCallbackEnabled:", [v8 BOOLValue]);
      }
      goto LABEL_48;
    case 40:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager setAggregatedStatus:v8];
      goto LABEL_48;
    case 41:
      -[SCROBrailleDisplayManager setVirtualStatusAlignment:](self->_brailleDisplayManager, "setVirtualStatusAlignment:", [v8 intValue]);
      goto LABEL_48;
    case 42:
      -[SCROBrailleDisplayManager setMasterStatusCellIndex:](self->_brailleDisplayManager, "setMasterStatusCellIndex:", [v8 integerValue]);
      goto LABEL_48;
    case 43:
      -[SCROBrailleDisplayManager setPersistentKeyModifiers:](self->_brailleDisplayManager, "setPersistentKeyModifiers:", [v8 intValue]);
      goto LABEL_48;
    case 44:
      -[SCROBrailleDisplayManager setWordWrapEnabled:](self->_brailleDisplayManager, "setWordWrapEnabled:", [v8 BOOLValue]);
      goto LABEL_48;
    case 45:
      -[SCROBrailleDisplayManager setAutoAdvanceEnabled:](self->_brailleDisplayManager, "setAutoAdvanceEnabled:", [v8 BOOLValue]);
      goto LABEL_48;
    case 46:
      v12 = self->_brailleDisplayManager;
      [v8 doubleValue];
      -[SCROBrailleDisplayManager setAutoAdvanceDuration:](v12, "setAutoAdvanceDuration:");
      goto LABEL_48;
    case 47:
      -[SCROBrailleDisplayManager setBlinkingCursorEnabled:](self->_brailleDisplayManager, "setBlinkingCursorEnabled:", [v8 BOOLValue]);
      goto LABEL_48;
    case 48:
      v20 = self->_brailleDisplayManager;
      [v8 doubleValue];
      -[SCROBrailleDisplayManager setLastUserInteractionTime:](v20, "setLastUserInteractionTime:");
      goto LABEL_48;
    case 49:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SCROBrailleDisplayManager *)self->_brailleDisplayManager setTactileGraphicsImageData:v9];
      }
      goto LABEL_48;
    case 50:
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        [(SCROBrailleDisplayManager *)self->_brailleDisplayManager setPlanarData:v9];
      }
      goto LABEL_48;
    case 52:
      -[SCROBrailleDisplayManager panDisplayLeft:](self->_brailleDisplayManager, "panDisplayLeft:", [v8 integerValue]);
      goto LABEL_48;
    case 53:
      -[SCROBrailleDisplayManager panDisplayRight:](self->_brailleDisplayManager, "panDisplayRight:", [v8 integerValue]);
      goto LABEL_48;
    case 54:
      -[SCROBrailleDisplayManager panDisplayBeginning:](self->_brailleDisplayManager, "panDisplayBeginning:", [v8 integerValue]);
      goto LABEL_48;
    case 55:
      -[SCROBrailleDisplayManager panDisplayEnd:](self->_brailleDisplayManager, "panDisplayEnd:", [v8 integerValue]);
      goto LABEL_48;
    case 56:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager simulateKeypress:v8];
      goto LABEL_48;
    case 57:
      v21 = self->_brailleDisplayManager;
      v11 = [v8 objectForKey:@"prepare"];
      uint64_t v22 = [v11 BOOLValue];
      v15 = [v9 objectForKey:@"immediate"];
      uint64_t v23 = [v15 BOOLValue];
      v24 = [v9 objectForKey:@"displayToken"];
      -[SCROBrailleDisplayManager setPrepareToMemorizeNextKey:immediate:forDisplayWithToken:](v21, "setPrepareToMemorizeNextKey:immediate:forDisplayWithToken:", v22, v23, [v24 integerValue]);

LABEL_46:
LABEL_47:

      goto LABEL_48;
    case 58:
      -[SCROBrailleDisplayManager setPrimaryBrailleDisplay:](self->_brailleDisplayManager, "setPrimaryBrailleDisplay:", [v8 integerValue]);
      goto LABEL_48;
    case 59:
      -[SCROBrailleDisplayManager setSingleLetterInputIsOn:](self->_brailleDisplayManager, "setSingleLetterInputIsOn:", [v8 BOOLValue]);
      goto LABEL_48;
    case 60:
      -[SCROBrailleDisplayManager setTextSearchModeIsOn:](self->_brailleDisplayManager, "setTextSearchModeIsOn:", [v8 BOOLValue]);
      goto LABEL_48;
    case 61:
      [v8 doubleValue];
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager setBrailleKeyDebounceTimeout:"setBrailleKeyDebounceTimeout:"];
      goto LABEL_48;
    case 62:
      -[SCROBrailleDisplayManager planarPanDisplayLeft:](self->_brailleDisplayManager, "planarPanDisplayLeft:", [v8 integerValue]);
      goto LABEL_48;
    case 63:
      -[SCROBrailleDisplayManager planarPanDisplayRight:](self->_brailleDisplayManager, "planarPanDisplayRight:", [v8 integerValue]);
LABEL_48:
      int v10 = 0;
      break;
    default:
      v26.receiver = self;
      v26.super_class = (Class)SCROBrailleHandler;
      int v10 = [(SCROHandler *)&v26 handleSetValue:v8 forKey:v6 trusted:v5];
      break;
  }

  return v10;
}

- (int)handleGetValue:(id *)a3 forKey:(int)a4 trusted:(BOOL)a5
{
  return [(SCROBrailleHandler *)self handleGetValue:a3 forKey:*(void *)&a4 withObject:0 trusted:a5];
}

- (int)handleGetValue:(id *)a3 forKey:(int)a4 withObject:(id)a5 trusted:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v7 = *(void *)&a4;
  id v10 = a5;
  v11 = v10;
  switch((int)v7)
  {
    case 19:
      uint64_t v12 = [v10 unsignedIntegerValue];
      v13 = NSNumber;
      unint64_t v14 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager loadVirtualDisplayWithMainSize:v12];
      goto LABEL_16;
    case 20:
      uint64_t v17 = -[SCROBrailleDisplayManager mainCellsForVirtualDisplay:](self->_brailleDisplayManager, "mainCellsForVirtualDisplay:", [v10 unsignedIntegerValue]);
      goto LABEL_34;
    case 30:
      v15 = NSNumber;
      BOOL v16 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager alwaysUsesNemethCodeForTechnicalText];
      goto LABEL_33;
    case 31:
      if (!v6) {
        goto LABEL_21;
      }
      uint64_t v17 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager mainAttributedString];
      goto LABEL_34;
    case 33:
      v15 = NSNumber;
      BOOL v16 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager showDotsSevenAndEight];
      goto LABEL_33;
    case 34:
      v15 = NSNumber;
      BOOL v16 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager showEightDotBraille];
      goto LABEL_33;
    case 35:
      v15 = NSNumber;
      BOOL v16 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager inputEightDotBraille];
      goto LABEL_33;
    case 37:
      v18 = NSNumber;
      uint64_t v19 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager contractionMode];
      goto LABEL_25;
    case 38:
      v18 = NSNumber;
      uint64_t v19 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager inputContractionMode];
      goto LABEL_25;
    case 39:
      v15 = NSNumber;
      BOOL v16 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager lineDescriptorDisplayCallbackEnabled];
      goto LABEL_33;
    case 40:
      uint64_t v17 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager aggregatedStatus];
      goto LABEL_34;
    case 41:
      v18 = NSNumber;
      uint64_t v19 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager virtualStatusAlignment];
      goto LABEL_25;
    case 42:
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithInteger:", -[SCROBrailleDisplayManager masterStatusCellIndex](self->_brailleDisplayManager, "masterStatusCellIndex"));
      goto LABEL_34;
    case 43:
      uint64_t v17 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", -[SCROBrailleDisplayManager persistentKeyModifiers](self->_brailleDisplayManager, "persistentKeyModifiers"));
      goto LABEL_34;
    case 44:
      v15 = NSNumber;
      BOOL v16 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager wordWrapEnabled];
      goto LABEL_33;
    case 45:
      v15 = NSNumber;
      BOOL v16 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager autoAdvanceEnabled];
      goto LABEL_33;
    case 46:
      v32 = NSNumber;
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager autoAdvanceDuration];
      uint64_t v17 = objc_msgSend(v32, "numberWithDouble:");
      goto LABEL_34;
    case 47:
      v15 = NSNumber;
      BOOL v16 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager blinkingCursorEnabled];
      goto LABEL_33;
    case 64:
      v15 = NSNumber;
      BOOL v16 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager isConfigured];
      goto LABEL_33;
    case 65:
      uint64_t v36 = 0;
      v20 = [v10 objectForKey:@"index"];
      v21 = [v11 objectForKey:@"displayToken"];
      brailleDisplayManager = self->_brailleDisplayManager;
      id v35 = 0;
      uint64_t v23 = -[SCROBrailleDisplayManager tokenForRouterIndex:location:appToken:forDisplayWithToken:](brailleDisplayManager, "tokenForRouterIndex:location:appToken:forDisplayWithToken:", [v20 integerValue], &v36, &v35, objc_msgSend(v21, "integerValue"));
      id v24 = v35;
      v25 = [MEMORY[0x263EFF9A0] dictionaryWithCapacity:3];
      objc_super v26 = [NSNumber numberWithInteger:v23];
      [v25 setObject:v26 forKey:kSCROBrailleRouterKeyToken[0]];

      v27 = [NSNumber numberWithInteger:v36];
      [v25 setObject:v27 forKey:kSCROBrailleRouterKeyLocation];

      [v25 setObject:v24 forKey:kSCROBrailleRouterKeyAppToken[0]];
      id v28 = v25;
      *a3 = v28;

LABEL_21:
      int v31 = 0;
      break;
    case 66:
      uint64_t v17 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager driverConfiguration];
      goto LABEL_34;
    case 67:
      v18 = NSNumber;
      uint64_t v19 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager displayMode];
LABEL_25:
      uint64_t v17 = [v18 numberWithInt:v19];
      goto LABEL_34;
    case 68:
      uint64_t v29 = -[SCROBrailleDisplayManager rangeOfBrailleCellRepresentingCharacterAtIndex:](self->_brailleDisplayManager, "rangeOfBrailleCellRepresentingCharacterAtIndex:", [v10 unsignedIntegerValue]);
      uint64_t v17 = objc_msgSend(MEMORY[0x263F08D40], "valueWithRange:", v29, v30);
      goto LABEL_34;
    case 69:
      v15 = NSNumber;
      BOOL v16 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager isCandidateSelectionOn];
      goto LABEL_33;
    case 70:
      v15 = NSNumber;
      BOOL v16 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager isWordDescriptionOn];
LABEL_33:
      uint64_t v17 = [v15 numberWithBool:v16];
      goto LABEL_34;
    case 71:
      v13 = NSNumber;
      unint64_t v14 = [(SCROBrailleDisplayManager *)self->_brailleDisplayManager numberOfTextLinesInPlanarBraille];
LABEL_16:
      uint64_t v17 = [v13 numberWithUnsignedInteger:v14];
LABEL_34:
      int v31 = 0;
      *a3 = v17;
      break;
    default:
      v34.receiver = self;
      v34.super_class = (Class)SCROBrailleHandler;
      int v31 = [(SCROHandler *)&v34 handleGetValue:a3 forKey:v7 withObject:v10 trusted:v6];
      break;
  }

  return v31;
}

- (int)handlePerformActionForKey:(int)a3 trusted:(BOOL)a4
{
  switch(a3)
  {
    case 1:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager beginUpdates];
      goto LABEL_17;
    case 2:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager endUpdates];
      goto LABEL_17;
    case 6:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager setAnnouncementsDisplayMode];
      goto LABEL_17;
    case 7:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager showNextAnnouncement];
      goto LABEL_17;
    case 8:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager showPreviousAnnouncement];
      goto LABEL_17;
    case 9:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager exitCurrentDisplayMode];
      goto LABEL_17;
    case 10:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager translateBrailleToClipboard];
      goto LABEL_17;
    case 11:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager resetEditingManager];
      goto LABEL_17;
    case 12:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager clearTimeoutAlert];
      goto LABEL_17;
    case 13:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager cancelCandidateSelection];
      goto LABEL_17;
    case 14:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager showPreviousCandidate];
      goto LABEL_17;
    case 15:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager showNextCandidate];
      goto LABEL_17;
    case 16:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager showPreviousWordDescription];
      goto LABEL_17;
    case 17:
      [(SCROBrailleDisplayManager *)self->_brailleDisplayManager showNextWordDescription];
LABEL_17:
      int result = 0;
      break;
    default:
      v5.receiver = self;
      v5.super_class = (Class)SCROBrailleHandler;
      int result = -[SCROHandler handlePerformActionForKey:trusted:](&v5, sel_handlePerformActionForKey_trusted_);
      break;
  }
  return result;
}

- (void)handleBrailleKeypress:(id)a3
{
  if (self->_callbacks.keypress)
  {
    id v4 = a3;
    BOOL v6 = [[SCROCallback alloc] initWithKey:74 object:v4];

    objc_super v5 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v5];
  }
}

- (void)handleBrailleReplaceTextRange:(_NSRange)a3 withString:(id)a4 cursor:(unint64_t)a5
{
  v18[3] = *MEMORY[0x263EF8340];
  if (self->_callbacks.replaceTextRange)
  {
    NSUInteger length = a3.length;
    NSUInteger location = a3.location;
    v17[0] = kSCROBrailleCallbackReplaceTextRange_RangeKey;
    objc_super v9 = (void *)MEMORY[0x263F08D40];
    id v10 = a4;
    v11 = objc_msgSend(v9, "valueWithRange:", location, length);
    v18[0] = v11;
    v18[1] = v10;
    v17[1] = kSCROBrailleCallbackReplaceTextRange_StringKey;
    v17[2] = kSCROBrailleCallbackReplaceTextRange_CursorKey;
    uint64_t v12 = [NSNumber numberWithUnsignedInteger:a5];
    v18[2] = v12;
    v13 = [NSDictionary dictionaryWithObjects:v18 forKeys:v17 count:3];

    unint64_t v14 = [SCROCallback alloc];
    v15 = [(SCROCallback *)v14 initWithKey:76 object:v13];
    BOOL v16 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v15 postToHandler:v16];
  }
}

- (void)handleUserEventOccured
{
  if (self->_callbacks.userEventOccured)
  {
    id v4 = [[SCROCallback alloc] initWithKey:75 object:0];
    objc_super v3 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v4 postToHandler:v3];
  }
}

- (void)handleStartEditing
{
  if (self->_callbacks.startEditing)
  {
    id v4 = [[SCROCallback alloc] initWithKey:77 object:0];
    objc_super v3 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v4 postToHandler:v3];
  }
}

- (void)handleBrailleInsertedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (self->_callbacks.insertUntranslatedText)
    {
      BOOL v5 = a4;
      v13[0] = kSCROBrailleCallbackSpeechFeedback_SpeakLiterallyKey;
      BOOL v6 = NSNumber;
      id v7 = a3;
      id v8 = [v6 numberWithBool:v5];
      v13[1] = kSCROBrailleCallbackSpeechFeedback_SpokenTextKey;
      v14[0] = v8;
      v14[1] = v7;
      objc_super v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

      id v10 = [SCROCallback alloc];
      v11 = [(SCROCallback *)v10 initWithKey:78 object:v9];
      uint64_t v12 = [(SCROHandler *)self callbackDelegate];
      [(SCROCallback *)v11 postToHandler:v12];
    }
  }
}

- (void)handleBrailleDeletedUntranslatedText:(id)a3 speakLiterally:(BOOL)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (self->_callbacks.deleteUntranslatedText)
    {
      BOOL v5 = a4;
      v13[0] = kSCROBrailleCallbackSpeechFeedback_SpeakLiterallyKey;
      BOOL v6 = NSNumber;
      id v7 = a3;
      id v8 = [v6 numberWithBool:v5];
      v13[1] = kSCROBrailleCallbackSpeechFeedback_SpokenTextKey;
      v14[0] = v8;
      v14[1] = v7;
      objc_super v9 = [NSDictionary dictionaryWithObjects:v14 forKeys:v13 count:2];

      id v10 = [SCROCallback alloc];
      v11 = [(SCROCallback *)v10 initWithKey:79 object:v9];
      uint64_t v12 = [(SCROHandler *)self callbackDelegate];
      [(SCROCallback *)v11 postToHandler:v12];
    }
  }
}

- (void)handleBrailleSpeechRequest:(id)a3 language:(id)a4
{
  v14[2] = *MEMORY[0x263EF8340];
  if (a3)
  {
    if (self->_callbacks.speechRequest)
    {
      v13[0] = kSCROBrailleCallbackSpeechFeedback_SpokenTextKey;
      v13[1] = kSCROBrailleCallbackSpeechFeedback_LanguageKey;
      v14[0] = a3;
      v14[1] = a4;
      BOOL v6 = NSDictionary;
      id v7 = a4;
      id v8 = a3;
      objc_super v9 = [v6 dictionaryWithObjects:v14 forKeys:v13 count:2];
      id v10 = [SCROCallback alloc];

      v11 = [(SCROCallback *)v10 initWithKey:80 object:v9];
      uint64_t v12 = [(SCROHandler *)self callbackDelegate];
      [(SCROCallback *)v11 postToHandler:v12];
    }
  }
}

- (void)handleBrailleKeyWillMemorize:(id)a3
{
  if (self->_callbacks.keyWillMem)
  {
    id v4 = a3;
    BOOL v6 = [[SCROCallback alloc] initWithKey:81 object:v4];

    BOOL v5 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v5];
  }
}

- (void)handleBrailleKeyMemorize:(id)a3
{
  if (self->_callbacks.keymem)
  {
    id v4 = a3;
    BOOL v6 = [[SCROCallback alloc] initWithKey:82 object:v4];

    BOOL v5 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v5];
  }
}

- (void)handleBrailleDidDisplay:(id)a3
{
  id v4 = a3;
  if (self->_callbacks.didDisplay)
  {
    id v8 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v5 = [v8 copy];

      id v8 = (id)v5;
    }
    BOOL v6 = [[SCROCallback alloc] initWithKey:83 object:v8];
    id v7 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v7];

    id v4 = v8;
  }
}

- (void)handleBrailleDidPanLeft:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6
{
  if (self->_callbacks.panLeft)
  {
    id v10 = (objc_class *)NSDictionary;
    id v11 = a6;
    id v12 = a5;
    id v13 = a4;
    id v14 = a3;
    uint64_t v17 = objc_msgSend([v10 alloc], "initWithObjectsAndKeys:", v14, @"success", v13, @"token", v11, @"lineOffset", v12, @"appToken", 0);

    v15 = [[SCROCallback alloc] initWithKey:84 object:v17];
    BOOL v16 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v15 postToHandler:v16];
  }
}

- (void)handleBrailleDidPanRight:(id)a3 elementToken:(id)a4 appToken:(id)a5 lineOffset:(id)a6
{
  if (self->_callbacks.panRight)
  {
    id v10 = (objc_class *)NSDictionary;
    id v11 = a6;
    id v12 = a5;
    id v13 = a4;
    id v14 = a3;
    uint64_t v17 = objc_msgSend([v10 alloc], "initWithObjectsAndKeys:", v14, @"success", v13, @"token", v11, @"lineOffset", v12, @"appToken", 0);

    v15 = [[SCROCallback alloc] initWithKey:85 object:v17];
    BOOL v16 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v15 postToHandler:v16];
  }
}

- (void)handleBrailleDidShowPreviousAnnouncement:(id)a3
{
  if (self->_callbacks.showPreviousAnnouncement)
  {
    id v4 = a3;
    BOOL v6 = [[SCROCallback alloc] initWithKey:86 object:v4];

    uint64_t v5 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v5];
  }
}

- (void)handleBrailleDidShowNextAnnouncement:(id)a3
{
  if (self->_callbacks.showNextAnnouncement)
  {
    id v4 = a3;
    BOOL v6 = [[SCROCallback alloc] initWithKey:87 object:v4];

    uint64_t v5 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v5];
  }
}

- (void)handleBrailleDriverDisconnected
{
  if (self->_callbacks.playDisplayConnectionSound)
  {
    objc_super v3 = [SCROCallback alloc];
    uint64_t v5 = [(SCROCallback *)v3 initWithKey:90 object:MEMORY[0x263EFFA80]];
    [(SCROCallback *)v5 setIsAtomic:1];
    id v4 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v5 postToHandler:v4];
  }
}

- (void)handleBrailleDriverDidLoad
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  objc_super v3 = _SCROD_LOG();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    id v4 = [NSNumber numberWithBool:self->_callbacks.playDisplayConnectionSound];
    int v8 = 138412290;
    objc_super v9 = v4;
    _os_log_impl(&dword_21C66E000, v3, OS_LOG_TYPE_DEFAULT, "Brailler driver did load %@", (uint8_t *)&v8, 0xCu);
  }
  if (self->_callbacks.playDisplayConnectionSound)
  {
    uint64_t v5 = [SCROCallback alloc];
    BOOL v6 = [(SCROCallback *)v5 initWithKey:90 object:MEMORY[0x263EFFA88]];
    [(SCROCallback *)v6 setIsAtomic:1];
    id v7 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v7];
  }
}

- (void)configurationDidChange
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  objc_super v3 = _SCROD_LOG();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    BOOL configChanged = self->_callbacks.configChanged;
    v10[0] = 67109120;
    v10[1] = configChanged;
    _os_log_impl(&dword_21C66E000, v3, OS_LOG_TYPE_DEFAULT, "-[SCROBrailleHandler configurationDidChange]: _callbacks.configChanged == %d", (uint8_t *)v10, 8u);
  }

  if (self->_callbacks.configChanged)
  {
    uint64_t v5 = objc_msgSend(NSNumber, "numberWithBool:", -[SCROBrailleDisplayManager isConfigured](self->_brailleDisplayManager, "isConfigured"));
    BOOL v6 = [[SCROCallback alloc] initWithKey:72 object:v5];
    id v7 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v7];

    int v8 = _SCROD_LOG();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v10[0]) = 0;
      _os_log_impl(&dword_21C66E000, v8, OS_LOG_TYPE_DEFAULT, "Posting SCRODisplayConfigurationChangedNotification", (uint8_t *)v10, 2u);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, (CFNotificationName)kSCRODisplayConfigurationChangedNotification, 0, 0, 1u);
  }
}

- (void)handleFailedToLoadBluetoothDevice:(id)a3
{
  if (self->_callbacks.bluetoothDisplayLoadFailed)
  {
    id v4 = a3;
    BOOL v6 = [[SCROCallback alloc] initWithKey:91 object:v4];

    uint64_t v5 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v5];
  }
}

- (void)handleBrailleTableFailedToLoad:(id)a3
{
  if (self->_callbacks.tableLoadFailed)
  {
    id v4 = a3;
    BOOL v6 = [[SCROCallback alloc] initWithKey:73 object:v4];

    uint64_t v5 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v5];
  }
}

- (void)handleDisplayModeChanged:(id)a3
{
  if (self->_callbacks.displayModeChanged)
  {
    id v4 = a3;
    BOOL v6 = [[SCROCallback alloc] initWithKey:92 object:v4];

    uint64_t v5 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v5];
  }
}

- (void)handleCopyStringToClipboard:(id)a3
{
  if (self->_callbacks.copyStringToClipboard)
  {
    id v4 = a3;
    BOOL v6 = [[SCROCallback alloc] initWithKey:93 object:v4];

    uint64_t v5 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v5];
  }
}

- (void)handleTacticalGraphicsCanvasDidChange:(id)a3
{
  if (self->_callbacks.planarCanvasDidChange)
  {
    id v4 = a3;
    BOOL v6 = [[SCROCallback alloc] initWithKey:94 object:v4];

    uint64_t v5 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v6 postToHandler:v5];
  }
}

- (void)handlePlanarPanFailedIsLeft:(BOOL)a3
{
  if (self->_callbacks.planarPan)
  {
    BOOL v3 = a3;
    uint64_t v5 = [SCROCallback alloc];
    BOOL v6 = [NSNumber numberWithBool:v3];
    int v8 = [(SCROCallback *)v5 initWithKey:95 object:v6];

    id v7 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v8 postToHandler:v7];
  }
}

- (void)handlePlayBorderHitSound
{
  if (self->_callbacks.playBorderHitSound)
  {
    id v4 = [[SCROCallback alloc] initWithKey:88 object:0];
    BOOL v3 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v4 postToHandler:v3];
  }
}

- (void)handlePlayCommandNotSupportedSound
{
  if (self->_callbacks.playCommandNotSupportedSound)
  {
    id v4 = [[SCROCallback alloc] initWithKey:89 object:0];
    BOOL v3 = [(SCROHandler *)self callbackDelegate];
    [(SCROCallback *)v4 postToHandler:v3];
  }
}

- (void).cxx_destruct
{
}

@end