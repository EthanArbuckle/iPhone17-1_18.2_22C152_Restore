void sub_21C66FB30(void *a1)
{
  objc_begin_catch(a1);
  JUMPOUT(0x21C66FADCLL);
}

void sub_21C670250(void *a1)
{
}

void sub_21C671F08(_Unwind_Exception *a1)
{
}

void sub_21C671F28(void *a1)
{
}

void _inputEventHandler(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x21D4AD500]();
  [a2 _inputEventHandler];
}

void sub_21C675A34(_Unwind_Exception *exception_object, int a2)
{
  if (a2)
  {
    if (a2 != 2)
    {
      objc_begin_catch(exception_object);
      JUMPOUT(0x21C67596CLL);
    }
    id v2 = objc_begin_catch(exception_object);
    objc_exception_rethrow();
  }
  _Unwind_Resume(exception_object);
}

void sub_21C675AC0(uint64_t a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x21C675A94);
  }
  JUMPOUT(0x21C675AD4);
}

void sub_21C675BA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C675DB8()
{
}

void sub_21C675E14()
{
}

void sub_21C675EAC()
{
}

void sub_21C675F08()
{
}

void sub_21C675F88()
{
}

void sub_21C675FE8()
{
}

void sub_21C676068()
{
}

void sub_21C6760C8()
{
}

void sub_21C676138()
{
}

void sub_21C676198()
{
}

void _blinkerEventHandler(uint64_t a1, void *a2)
{
  v3 = (void *)MEMORY[0x21D4AD500]();
  [a2 _blinkerEventHandler];
}

void sub_21C676868(_Unwind_Exception *a1)
{
  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_21C676D10()
{
}

void sub_21C676D80()
{
}

void sub_21C677038()
{
}

void sub_21C677098()
{
}

void sub_21C677130()
{
}

void sub_21C677190()
{
}

void sub_21C67728C()
{
}

void sub_21C6772EC()
{
}

void sub_21C677B7C()
{
}

void sub_21C677BD8()
{
}

void sub_21C678784(_Unwind_Exception *a1)
{
}

void sub_21C6787A4(void *a1)
{
}

void sub_21C678924()
{
}

void sub_21C678980()
{
}

void sub_21C678BB8()
{
}

void sub_21C678C14()
{
}

void sub_21C678F54()
{
}

void sub_21C678FAC()
{
}

void sub_21C679140()
{
}

void sub_21C6791B0()
{
}

void sub_21C6794C8()
{
}

void sub_21C679568()
{
}

void sub_21C67AA80(_Unwind_Exception *a1)
{
}

void sub_21C67AEF8()
{
}

void sub_21C67AF58()
{
}

void sub_21C67B504()
{
}

void sub_21C67B568()
{
}

void sub_21C67B790()
{
}

void sub_21C67B7F4()
{
}

void sub_21C67D248()
{
}

void sub_21C67D2A4()
{
}

void sub_21C67D310()
{
}

void sub_21C67D368()
{
}

void sub_21C67E05C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libAccessibilityLibraryCore_block_invoke(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libAccessibilityLibraryCore_frameworkLibrary = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{
}

void ___appendBrailleKeysToArray_block_invoke(uint64_t a1)
{
  uint64_t v48 = *MEMORY[0x263EF8340];
  if (([*(id *)(a1 + 32) _isMemorizingKeys] & 1) == 0)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v2 = [*(id *)(*(void *)(a1 + 32) + 184) currentBrailleChord];
    uint64_t v3 = [v2 countByEnumeratingWithState:&v41 objects:v47 count:16];
    if (!v3)
    {
LABEL_36:

      return;
    }
    uint64_t v4 = v3;
    unsigned __int8 v5 = 0;
    uint64_t v6 = *(void *)v42;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v42 != v6) {
          objc_enumerationMutation(v2);
        }
        v5 |= _DotValue[((unsigned __int16)[*(id *)(*((void *)&v41 + 1) + 8 * i) unsignedLongValue] >> 8)];
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v41 objects:v47 count:16];
    }
    while (v4);

    if (v5)
    {
      [*(id *)(*(void *)(a1 + 32) + 184) setLastBrailleChordTypingTime:CFAbsoluteTimeGetCurrent()];
      id v2 = (void *)[objc_alloc(MEMORY[0x263F2BA70]) initWithBits:v5];
      v8 = [v2 unicode];
      if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24))
      {
        v9 = (void *)[objc_alloc(MEMORY[0x263F2BA70]) initWithBits:0];
        v10 = [v9 unicode];
        uint64_t v11 = [v10 stringByAppendingString:v8];

        v8 = (void *)v11;
      }
      v12 = +[SCROBrailleTranslationManager sharedManager];
      v13 = [v12 defaultLanguage];

      v14 = +[SCROBrailleTranslationManager sharedManager];
      v15 = [v14 serviceIdentifier];

      if ((SCROCustomBrailleEnabled() & 1) == 0
        && (SCROJapaneseBrailleSelected() & 1) == 0
        && (([@"⠦" isEqualToString:v8] & 1) != 0
         || [@"⠰" isEqualToString:v8])
        && [v15 isEqualToString:*MEMORY[0x263F2BB10]]
        && [@"jpn" isEqualToString:v13]
        && !*(unsigned char *)(*(void *)(a1 + 32) + 72))
      {
        v38 = _SCROD_LOG();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl(&dword_21C66E000, v38, OS_LOG_TYPE_INFO, "Starting Latin character input in Japanese Braille", v40, 2u);
        }

        *(unsigned char *)(*(void *)(a1 + 32) + 72) = 1;
        v39 = +[SCROBrailleTranslationManager sharedManager];
        [v39 setDefaultLanguage:@"eng-xueb"];

        goto LABEL_35;
      }
      if ((SCROCustomBrailleEnabled() & 1) == 0
        && (SCROJapaneseBrailleSelected() & 1) == 0
        && (([@"⠴" isEqualToString:v8] & 1) != 0
         || [@"⠰" isEqualToString:v8])
        && [v15 isEqualToString:*MEMORY[0x263F2BB10]]
        && [@"eng-xueb" isEqualToString:v13]
        && *(unsigned char *)(*(void *)(a1 + 32) + 72))
      {
        v16 = _SCROD_LOG();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v40 = 0;
          _os_log_impl(&dword_21C66E000, v16, OS_LOG_TYPE_INFO, "Stopping Latin character input in Japanese Braille", v40, 2u);
        }

        v17 = +[SCROBrailleTranslationManager sharedManager];
        [v17 setDefaultLanguage:@"jpn"];

        *(unsigned char *)(*(void *)(a1 + 32) + 72) = 0;
      }
      else
      {
        v18 = *(id **)(a1 + 32);
        if (!*(unsigned char *)(a1 + 56))
        {
          char v19 = [v18[6] isSingleLetterInputOn];
          v18 = *(id **)(a1 + 32);
          if ((v19 & 1) == 0)
          {
            if (([v18[6] wantsEdits] & 1) != 0
              || ![*(id *)(a1 + 32) isInputEightDot])
            {
              int v23 = [*(id *)(*(void *)(a1 + 32) + 48) hasEdits];
              uint64_t v24 = *(void *)(a1 + 32);
              v25 = *(void **)(v24 + 48);
              v26 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(v24 + 184), "currentBrailleModifiers"));
              v46 = v26;
              v27 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v46 count:1];
              LOBYTE(v25) = [v25 insertBrailleStringAtCursor:v8 modifiers:v27];

              if ((v25 & 1) == 0) {
                [*(id *)(a1 + 32) _startEditingText];
              }
              v28 = (id *)*(id *)(a1 + 32);
              double Current = CFAbsoluteTimeGetCurrent();
              if (v23)
              {
                [v28[23] lastBrailleChordPosted];
                double v31 = Current - v30;
                [v28[23] brailleCharExponentialMovingAverage];
                [v28[23] setBrailleCharExponentialMovingAverage:v32 * 0.6 + v31 * 0.4];
                [v28[23] brailleCharExponentialMovingAverage];
                objc_msgSend(v28[23], "setBrailleTranslationTimeout:", fmin(v33 * 3.5, 10.0));
              }
              [v28[23] setLastBrailleChordPosted:Current];

              [*(id *)(a1 + 32) _updateDisplay];
              v40[0] = 0;
              v34 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(*(void *)(a1 + 32) + 184), "currentBrailleModifiers"));
              v45 = v34;
              v35 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v45 count:1];
              v36 = +[SCROBrailleTranslationUtility spokenStringForInsertedBrailleString:v8 speakLiterally:v40 modifiers:v35];

              id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 16));
              [WeakRetained brailleDisplay:*(void *)(a1 + 32) insertedUntranslatedText:v36 speakLiterally:v40[0]];

              goto LABEL_35;
            }
            v18 = *(id **)(a1 + 32);
          }
        }
        uint64_t v20 = [v18 keyArrayForBrailleStringWithCurrentModifiers:v8];
        uint64_t v21 = *(void *)(*(void *)(a1 + 48) + 8);
        v22 = *(void **)(v21 + 40);
        *(void *)(v21 + 40) = v20;
      }
LABEL_35:

      goto LABEL_36;
    }
  }
}

uint64_t ___appendBrailleKeysToArray_block_invoke_891(uint64_t a1)
{
  v18[1] = *MEMORY[0x263EF8340];
  uint64_t result = [*(id *)(*(void *)(a1 + 32) + 184) currentBrailleChordContainsSpacebar];
  if (result)
  {
    if (([*(id *)(a1 + 32) _isMemorizingKeys] & 1) == 0)
    {
      [*(id *)(*(void *)(a1 + 32) + 184) setLastBrailleChordTypingTime:CFAbsoluteTimeGetCurrent()];
      uint64_t v3 = (void *)[objc_alloc(MEMORY[0x263F2BA70]) initWithBits:0];
      uint64_t v4 = [v3 unicode];

      if (*(unsigned char *)(a1 + 48)
        || ([*(id *)(*(void *)(a1 + 32) + 48) isSingleLetterInputOn] & 1) != 0
        || ([*(id *)(*(void *)(a1 + 32) + 48) wantsEdits] & 1) == 0
        && ![*(id *)(a1 + 32) isInputContracted])
      {
        uint64_t v9 = [*(id *)(a1 + 32) keyArrayForBrailleStringWithCurrentModifiers:v4];
        uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
        uint64_t v11 = *(void **)(v10 + 40);
        *(void *)(v10 + 40) = v9;
      }
      else
      {
        uint64_t v5 = *(void *)(a1 + 32);
        uint64_t v6 = *(void **)(v5 + 48);
        v7 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(*(id *)(v5 + 184), "currentBrailleModifiers"));
        v18[0] = v7;
        v8 = [MEMORY[0x263EFF8C0] arrayWithObjects:v18 count:1];
        LOBYTE(v6) = [v6 insertBrailleStringAtCursor:v4 modifiers:v8];

        if ((v6 & 1) == 0) {
          [*(id *)(a1 + 32) _startEditingText];
        }
      }
      v12 = (id *)*(id *)(a1 + 32);
      double Current = CFAbsoluteTimeGetCurrent();
      [v12[23] lastBrailleChordPosted];
      double v15 = Current - v14;
      [v12[23] brailleCharExponentialMovingAverage];
      [v12[23] setBrailleCharExponentialMovingAverage:v16 * 0.6 + v15 * 0.4];
      [v12[23] brailleCharExponentialMovingAverage];
      objc_msgSend(v12[23], "setBrailleTranslationTimeout:", fmin(v17 * 3.5, 10.0));
      [v12[23] setLastBrailleChordPosted:Current];
    }
    [*(id *)(*(void *)(a1 + 32) + 184) setCurrentBrailleChordContainsSpacebar:0];
    return [*(id *)(*(void *)(a1 + 32) + 184) setCurrentBrailleChordBeganWithSpacebar:0];
  }
  return result;
}

uint64_t term()
{
  uint64_t result = _fd;
  if (_fd)
  {
    tcdrain(_fd);
    int v1 = _fd;
    return close(v1);
  }
  return result;
}

void _postBrailleDisplayDetected(void *a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  if (a2)
  {
    uint64_t v3 = (objc_class *)NSDictionary;
    id v4 = a2;
    id v5 = a1;
    uint64_t v6 = objc_msgSend([v3 alloc], "initWithObjectsAndKeys:", v5, @"driverID", v4, @"element", 0);

    v7 = _SCROD_LOG();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      uint64_t v10 = v6;
      _os_log_impl(&dword_21C66E000, v7, OS_LOG_TYPE_DEFAULT, "Detected braille device: %{public}@", buf, 0xCu);
    }

    v8 = [MEMORY[0x263F08A00] defaultCenter];
    [v8 postNotificationName:kSCROBrailleDisplayConnectedNotification object:_SCROBrailleDisplayAutoDetector userInfo:v6];
  }
}

uint64_t _serialPortPublishedCallback(void *a1, const char *a2)
{
  return [a1 serialPortsWerePublished:a2];
}

void _connectHandler(void *a1, io_iterator_t a2)
{
  id v4 = (void *)MEMORY[0x21D4AD500]();
  id v5 = a1;
  uint64_t v6 = IOIteratorNext(a2);
  if (v6)
  {
    uint64_t v7 = v6;
    do
    {
      v8 = [[SCROIOUSBElement alloc] initWithIOObject:v7];
      if (!v8) {
        v8 = [[SCROIOHIDElement alloc] initWithIOObject:v7];
      }
      _postBrailleDisplayDetected(v5, v8);

      IOObjectRelease(v7);
      uint64_t v7 = IOIteratorNext(a2);
    }
    while (v7);
  }
}

uint64_t soft__AXSVoiceOverTouchSetTactileGraphicsDisplay(uint64_t a1)
{
  uint64_t v5 = 0;
  uint64_t v6 = &v5;
  uint64_t v7 = 0x2020000000;
  id v2 = (uint64_t (*)(uint64_t))get_AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc_ptr;
  v8 = get_AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc_ptr;
  if (!get_AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc_ptr)
  {
    uint64_t v3 = (void *)libAccessibilityLibrary();
    v6[3] = (uint64_t)dlsym(v3, "_AXSVoiceOverTouchSetTactileGraphicsDisplay");
    get_AXSVoiceOverTouchSetTactileGraphicsDisplaySymbolLoc_ptr = (_UNKNOWN *)v6[3];
    id v2 = (uint64_t (*)(uint64_t))v6[3];
  }
  _Block_object_dispose(&v5, 8);
  if (!v2) {
    soft__AXSVoiceOverTouchSetTactileGraphicsDisplay_cold_1();
  }
  return v2(a1);
}

void sub_21C680F5C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C681884(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

uint64_t libAccessibilityLibraryCore()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = libAccessibilityLibraryCore_frameworkLibrary_0;
  uint64_t v5 = libAccessibilityLibraryCore_frameworkLibrary_0;
  if (!libAccessibilityLibraryCore_frameworkLibrary_0)
  {
    long long v6 = xmmword_264414770;
    uint64_t v7 = 0;
    v3[3] = _sl_dlopen();
    libAccessibilityLibraryCore_frameworkLibrary_0 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_21C682068(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libAccessibilityLibraryCore_block_invoke_0(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libAccessibilityLibraryCore_frameworkLibrary_0 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t libAccessibilityLibrary()
{
  int v1 = 0;
  uint64_t result = libAccessibilityLibraryCore();
  if (!result) {
    libAccessibilityLibrary_cold_1(&v1);
  }
  return result;
}

BOOL SCROBrailleDisplayHistoryIsStringUnread(void *a1)
{
  int v1 = [a1 attribute:kSCROUnreadAttribute atIndex:0 effectiveRange:0];
  BOOL v2 = v1 != 0;

  return v2;
}

BOOL SCROBrailleDisplayHistoryIsHistoryString(void *a1)
{
  int v1 = [a1 attribute:kSCROHistoryAttribute atIndex:0 effectiveRange:0];
  BOOL v2 = v1 != 0;

  return v2;
}

void sub_21C684564(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 176), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{
}

void sub_21C6848C0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
}

void sub_21C684B48(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t _handleTactileGraphicsSettingsChange(uint64_t a1, void *a2)
{
  return [a2 _updateTactileGraphicsDisplay];
}

void sub_21C684E7C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void _updateNewlyActiveDisplay(void *a1, void *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7)
{
  id v13 = a2;
  id v14 = a1;
  [v14 setDelegateWantsDisplayCallback:a3];
  [v14 setInputAllowed:a4];
  [v14 setStatusAttributesWithMasterCellIndex:a5 virtualAlignment:a6];
  [v14 setPrepareToMemorizeNextKey:0 immediate:0];
  [v14 setBrailleFormatter:v13];

  [v14 setAutomaticBrailleTranslationEnabled:a7];
  [v14 endUpdates];
}

void sub_21C686BFC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, ...)
{
  va_start(va, a15);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v15 - 112), 8);
  _Unwind_Resume(a1);
}

void _addDisplayConfigurationToList(void *a1, void *a2, const __CFDictionary *a3, uint64_t a4)
{
  id key = a1;
  id v7 = a2;
  uint64_t v8 = objc_msgSend((id)CFDictionaryGetValue(a3, key), "mutableCopy");
  if (v8)
  {
    uint64_t v9 = [NSNumber numberWithInt:a4];
    [v8 setObject:v9 forKey:kSCROBrailleDisplayState[0]];
    uint64_t v10 = [key canvasDescriptor];
    if (v10) {
      [v8 setObject:v10 forKey:kSCROBrailleDisplayCanvasDescriptor[0]];
    }
    [v7 addObject:v8];
  }
}

void sub_21C68E234(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_21C68EFA4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t libAccessibilityLibraryCore_0()
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  uint64_t v2 = 0;
  uint64_t v3 = &v2;
  uint64_t v4 = 0x2020000000;
  uint64_t v0 = libAccessibilityLibraryCore_frameworkLibrary_1;
  uint64_t v5 = libAccessibilityLibraryCore_frameworkLibrary_1;
  if (!libAccessibilityLibraryCore_frameworkLibrary_1)
  {
    long long v6 = xmmword_264414BF0;
    uint64_t v7 = 0;
    v3[3] = _sl_dlopen();
    libAccessibilityLibraryCore_frameworkLibrary_1 = v3[3];
    uint64_t v0 = v3[3];
  }
  _Block_object_dispose(&v2, 8);
  return v0;
}

void sub_21C69040C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __libAccessibilityLibraryCore_block_invoke_1(uint64_t a1)
{
  uint64_t result = _sl_dlopen();
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  libAccessibilityLibraryCore_frameworkLibrary_1 = *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  return result;
}

uint64_t libAccessibilityLibrary_0()
{
  uint64_t v1 = 0;
  uint64_t result = libAccessibilityLibraryCore_0();
  if (!result) {
    libAccessibilityLibrary_cold_1_0(&v1);
  }
  return result;
}

void *__getkAXSVoiceOverTouchTactileGraphicsDisplayChangedNotificationSymbolLoc_block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)libAccessibilityLibrary_0();
  uint64_t result = dlsym(v2, "kAXSVoiceOverTouchTactileGraphicsDisplayChangedNotification");
  *(void *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = result;
  getkAXSVoiceOverTouchTactileGraphicsDisplayChangedNotificationSymbolLoc_ptr = *(void *)(*(void *)(*(void *)(a1 + 32) + 8)
                                                                                          + 24);
  return result;
}

void _processQueue(void *a1)
{
  uint64_t v2 = (void *)MEMORY[0x21D4AD500]();
  [a1 _processQueue];
}

void sub_21C690E78(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28)
{
}

void sub_21C69789C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29,uint64_t a30,uint64_t a31,uint64_t a32,char a33)
{
}

void sub_21C698190(_Unwind_Exception *a1)
{
  _Block_object_dispose((const void *)(v1 - 136), 8);
  _Unwind_Resume(a1);
}

id _createAttributedPaddingStringWithLength(unint64_t a1, void *a2)
{
  uint64_t v11 = *MEMORY[0x263EF8340];
  id v3 = a2;
  if (a1 < 0x101)
  {
    v13.location = 0;
    v13.length = a1;
    CFStringRef v5 = CFStringCreateWithSubstring(0, (CFStringRef)_SpaceString, v13);
  }
  else
  {
    uint64_t v4 = 0;
    do
      chars[v4++] = kSCROBrailleUnicodeCharacterBase;
    while (a1 != v4);
    CFStringRef v5 = CFStringCreateWithCharacters(0, chars, a1);
  }
  long long v6 = (__CFString *)v5;
  uint64_t v7 = (void *)[v3 mutableCopy];
  [v7 setObject:@" " forKey:kSCROBrailleOriginalStringAttribute[0]];
  [v7 setObject:MEMORY[0x263EFFA88] forKey:kSCROEditableTextPaddingAttribute[0]];
  uint64_t v8 = (void *)[objc_alloc(MEMORY[0x263F086A0]) initWithString:v6 attributes:v7];

  return v8;
}

__CFString *_applyDots7And8FocusFilterToPrintBraille(void *a1, NSUInteger a2, NSUInteger a3)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  CFStringRef v5 = a1;
  CFStringRef v6 = (const __CFString *)MEMORY[0x270FA5388]();
  uint64_t v8 = (char *)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  CFStringRef v28 = v6;
  NSUInteger v26 = a2;
  NSUInteger v31 = a2;
  int64_t v32 = a3;
  CharactersPtr = CFStringGetCharactersPtr(v6);
  if (CharactersPtr) {
    CStringPtr = 0;
  }
  else {
    CStringPtr = CFStringGetCStringPtr(v5, 0x600u);
  }
  memset(buffer, 0, sizeof(buffer));
  unint64_t v10 = v26 + a3;
  int64_t v33 = 0;
  int64_t v34 = 0;
  double v30 = CStringPtr;
  if (v10 <= [(__CFString *)v5 length])
  {
    uint64_t v25 = (uint64_t)&v25;
    if (a3)
    {
      uint64_t v14 = 0;
      int64_t v15 = 0;
      uint64_t v16 = 64;
      do
      {
        if ((unint64_t)v15 >= 4) {
          uint64_t v17 = 4;
        }
        else {
          uint64_t v17 = v15;
        }
        unint64_t v18 = v26 + v15;
        if (v18 >= [(__CFString *)v5 length]) {
          break;
        }
        uint64_t v19 = v32;
        if (v32 <= v15)
        {
          LOBYTE(v20) = 0;
        }
        else if (CharactersPtr)
        {
          UniChar v20 = CharactersPtr[v15 + v31];
        }
        else if (v30)
        {
          LOBYTE(v20) = v30[v31 + v15];
        }
        else
        {
          if (v34 <= v15 || (int64_t v21 = v33, v33 > v15))
          {
            uint64_t v22 = v15 - v17 + 64;
            if (v22 >= v32) {
              uint64_t v22 = v32;
            }
            int64_t v33 = v15 - v17;
            int64_t v34 = v22;
            if (v32 >= v16 - v17) {
              uint64_t v19 = v16 - v17;
            }
            v42.length = v19 + v17 + v14;
            v42.location = v15 - v17 + v31;
            CFStringGetCharacters(v28, v42, (UniChar *)buffer);
            int64_t v21 = v33;
          }
          UniChar v20 = *((_WORD *)buffer + v15 - v21);
        }
        *(_WORD *)&v8[2 * v15++] = kSCROBrailleUnicodeCharacterBase
                                 + 192
                                 + (((_BYTE)v20 - (_BYTE)kSCROBrailleUnicodeCharacterBase) & 0x3F);
        --v14;
        ++v16;
      }
      while (a3 != v15);
    }
    int v23 = (void *)[[NSString alloc] initWithCharacters:v8 length:a3];
    -[__CFString stringByReplacingCharactersInRange:withString:](v5, "stringByReplacingCharactersInRange:withString:", v26, a3, v23);
    CFRange v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v11 = _SCROD_LOG();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      v41.location = v26;
      v41.length = a3;
      v12 = NSStringFromRange(v41);
      *(_DWORD *)buf = 138412547;
      v36 = v12;
      __int16 v37 = 2117;
      v38 = v5;
      _os_log_impl(&dword_21C66E000, v11, OS_LOG_TYPE_DEFAULT, "Error applying braille filter. Range %@ goes beyond braille string \"%{sensitive}@\"", buf, 0x16u);
    }
    CFRange v13 = v5;
  }

  return v13;
}

void sub_21C69AE98(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t SCROJapaneseBrailleSelected()
{
  uint64_t v0 = +[SCROBrailleTranslationManager sharedManager];
  uint64_t v1 = [v0 serviceIdentifier];
  if ([v1 isEqual:@"com.apple.scrod.braille.table.nbsc"])
  {
    uint64_t v2 = 1;
  }
  else
  {
    id v3 = [v0 serviceIdentifier];
    uint64_t v2 = [v3 isEqual:@"com.apple.scrod.braille.table.apple"];
  }
  return v2;
}

uint64_t SCROJapaneseInputBrailleSelected()
{
  uint64_t v0 = +[SCROBrailleTranslationManager inputManager];
  uint64_t v1 = [v0 serviceIdentifier];
  if ([v1 isEqual:@"com.apple.scrod.braille.table.nbsc"])
  {
    uint64_t v2 = 1;
  }
  else
  {
    id v3 = [v0 serviceIdentifier];
    uint64_t v2 = [v3 isEqual:@"com.apple.scrod.braille.table.apple"];
  }
  return v2;
}

uint64_t SCROCustomBrailleEnabled()
{
  return MEMORY[0x270ED8070]("Accessibility", "CustomBraille");
}

void sub_21C69CFEC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(void *)(result + 40) = *(void *)(a2 + 40);
  *(void *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{
}

void sub_21C69D494(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Block_object_dispose((const void *)(v26 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_21C69DA18(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, ...)
{
  va_start(va, a13);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v13 - 128), 8);
  _Unwind_Resume(a1);
}

void OUTLINED_FUNCTION_1(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_start(va, a4);
  _os_log_debug_impl(a1, log, OS_LOG_TYPE_DEBUG, a4, (uint8_t *)va, 0x16u);
}

uint64_t SCROBrailleCreateTranslatePrintBrailleToBrailleCode(void *a1)
{
  uint64_t v39 = *MEMORY[0x263EF8340];
  uint64_t v1 = a1;
  CFIndex Length = CFStringGetLength(v1);
  uint64_t v3 = MEMORY[0x270FA5388]();
  uint64_t v4 = (char *)&buffer - ((v3 + 15) & 0xFFFFFFFFFFFFFFF0);
  int64_t v32 = v1;
  uint64_t v35 = 0;
  int64_t v36 = v3;
  CharactersPtr = CFStringGetCharactersPtr(v1);
  CStringPtr = 0;
  int64_t v33 = CharactersPtr;
  if (!CharactersPtr) {
    CStringPtr = CFStringGetCStringPtr(v1, 0x600u);
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v25 = 0u;
  long long buffer = 0u;
  int64_t v37 = 0;
  int64_t v38 = 0;
  int64_t v34 = CStringPtr;
  if (Length >= 1)
  {
    uint64_t v7 = 0;
    int64_t v8 = 0;
    int64_t v9 = 0;
    uint64_t v10 = 64;
    do
    {
      if ((unint64_t)v9 >= 4) {
        uint64_t v11 = 4;
      }
      else {
        uint64_t v11 = v9;
      }
      if (v36 <= v9)
      {
        LOBYTE(v12) = 0;
      }
      else if (v33)
      {
        UniChar v12 = v33[v9 + v35];
      }
      else if (v34)
      {
        LOBYTE(v12) = v34[v35 + v9];
      }
      else
      {
        if (v38 <= v9 || v8 > v9)
        {
          uint64_t v14 = -v11;
          uint64_t v15 = v11 + v7;
          uint64_t v16 = v10 - v11;
          int64_t v17 = v9 + v14;
          int64_t v18 = v17 + 64;
          if (v17 + 64 >= v36) {
            int64_t v18 = v36;
          }
          int64_t v37 = v17;
          int64_t v38 = v18;
          v19.location = v17 + v35;
          if (v36 >= v16) {
            uint64_t v20 = v16;
          }
          else {
            uint64_t v20 = v36;
          }
          v19.length = v20 + v15;
          CFStringGetCharacters(v32, v19, (UniChar *)&buffer);
          int64_t v8 = v37;
        }
        UniChar v12 = *((_WORD *)&buffer + v9 - v8);
      }
      v4[v9++] = v12 - kSCROBrailleUnicodeCharacterBase;
      --v7;
      ++v10;
    }
    while (Length != v9);
  }
  id v21 = objc_alloc(MEMORY[0x263EFF8F8]);
  uint64_t v22 = objc_msgSend(v21, "initWithBytes:length:", v4, Length, (void)buffer, *((void *)&buffer + 1), (void)v25, *((void *)&v25 + 1), v26, v27, v28, v29, v30, v31);

  return v22;
}

id _SCROD_LOG()
{
  if (_SCROD_LOG_onceToken != -1) {
    dispatch_once(&_SCROD_LOG_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)_SCROD_LOG_log;

  return v0;
}

id _SCROD_BRAILLE_LOG()
{
  if (_SCROD_BRAILLE_LOG_onceToken != -1) {
    dispatch_once(&_SCROD_BRAILLE_LOG_onceToken, &__block_literal_global_4);
  }
  uint64_t v0 = (void *)_SCROD_BRAILLE_LOG_log;

  return v0;
}

id SCRONSStringForPurportedString(void *a1)
{
  uint64_t v8 = *MEMORY[0x263EF8340];
  id v1 = a1;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v2 = v1;
LABEL_5:
    uint64_t v3 = v2;
    goto LABEL_9;
  }
  if (objc_opt_respondsToSelector())
  {
    id v2 = [v1 description];
    goto LABEL_5;
  }
  uint64_t v4 = _SCROD_LOG();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138412290;
    id v7 = v1;
    _os_log_impl(&dword_21C66E000, v4, OS_LOG_TYPE_DEFAULT, "An object purported to be an NSString was not actually an NSString nor responded to description: %@", (uint8_t *)&v6, 0xCu);
  }

  uint64_t v3 = 0;
LABEL_9:

  return v3;
}

uint64_t _systemBuildVersion()
{
  if (!_systemBuildVersion_buildVersion)
  {
    CFDictionaryRef v0 = (const __CFDictionary *)_CFCopySystemVersionDictionary();
    if (v0)
    {
      CFDictionaryRef v1 = v0;
      Value = CFDictionaryGetValue(v0, (const void *)*MEMORY[0x263EFFAB0]);
      _systemBuildVersion_buildVersion = (uint64_t)Value;
      if (Value) {
        CFRetain(Value);
      }
      CFRelease(v1);
    }
  }
  return _systemBuildVersion_buildVersion;
}

void sub_21C6A16BC()
{
}

void sub_21C6A1714()
{
}

void sub_21C6A1BD8(_Unwind_Exception *a1)
{
  if (v1) {
    objc_end_catch();
  }
  _Unwind_Resume(a1);
}

void sub_21C6A1BF0(uint64_t a1, int a2)
{
  if (a2) {
    objc_terminate();
  }
  JUMPOUT(0x21C6A1BFCLL);
}

void sub_21C6A1CC8(_Unwind_Exception *a1)
{
}

void sub_21C6A1D20(void *a1)
{
}

void sub_21C6A1DF0()
{
}

void sub_21C6A1E48()
{
}

void _addConnections()
{
  [(id)_Lock_0 lock];
  CFSetRef Copy = CFSetCreateCopy(0, (CFSetRef)_PendingConnections);
  CFSetRemoveAllValues((CFMutableSetRef)_PendingConnections);
  uint64_t v1 = [(id)_Lock_0 unlock];
  if (Copy)
  {
    id v2 = (void *)MEMORY[0x21D4AD500](v1);
    CFSetApplyFunction(Copy, (CFSetApplierFunction)_addConnection, 0);
    CFRelease(Copy);
  }
}

void _retryHandler()
{
  CFDictionaryRef v0 = (void *)MEMORY[0x21D4AD500]();
  +[SCROConnection _configServer];
}

void sub_21C6A29A4()
{
}

void sub_21C6A2A08()
{
}

void _scrodDeathCallback()
{
  CFDictionaryRef v0 = (void *)MEMORY[0x21D4AD500]();
  +[SCROConnection _unconfigServerAndRetry:1];
}

void sub_21C6A2A78(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    NSLog(&cfstr_CaughtExceptio_1.isa);

    objc_end_catch();
    JUMPOUT(0x21C6A2A50);
  }
  _Unwind_Resume(exception_object);
}

void sub_21C6A2CB8()
{
}

void sub_21C6A2D14()
{
}

void _invalidateConnection(void *a1)
{
  id v2 = (void *)MEMORY[0x21D4AD500]();
  id v3 = a1;
  [v3 _stopConnection];
  CFSetRemoveValue((CFMutableSetRef)_ActiveConnections, v3);
  if (!CFSetGetCount((CFSetRef)_ActiveConnections)) {
    +[SCROConnection _unconfigServerAndRetry:0];
  }
}

void sub_21C6A3160(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    NSLog(&cfstr_CaughtExceptio_2.isa);

    objc_end_catch();
    JUMPOUT(0x21C6A3138);
  }
  _Unwind_Resume(exception_object);
}

void sub_21C6A3650(_Unwind_Exception *a1)
{
}

void sub_21C6A43A4(_Unwind_Exception *a1)
{
}

uint64_t _SCROXPing(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = (void *)MEMORY[0x21D4AD500]();
  [v2 _ping];

  return 0;
}

void sub_21C6A4504(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9)
{
  if (a2 == 1)
  {
    id v9 = objc_begin_catch(exception_object);
    NSLog(&cfstr_CaughtExceptio_0.isa);

    objc_end_catch();
    JUMPOUT(0x21C6A44DCLL);
  }
  _Unwind_Resume(exception_object);
}

void sub_21C6A45D4(void *a1)
{
}

void _addConnection(void *a1)
{
  uint64_t v1 = (__CFSet *)_ActiveConnections;
  id v2 = a1;
  CFSetSetValue(v1, v2);
  [v2 _startConnection];
}

void sub_21C6A9ED8(_Unwind_Exception *a1)
{
}

void sub_21C6A9EF8(void *a1)
{
}

void sub_21C6A9FF8(_Unwind_Exception *a1)
{
}

void sub_21C6AA018(void *a1)
{
}

BOOL SCROSerializeWrapper(uint64_t a1, uint64_t a2, void *a3, _DWORD *a4, void **a5, _DWORD *a6)
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  size_t v23 = 4096;
  __src = mmap(0, 0x1000uLL, 3, 4098, -1, 0);
  id v21 = 0;
  size_t __n = 0;
  uint64_t v11 = [MEMORY[0x263F08910] archivedDataWithRootObject:a1 requiringSecureCoding:1 error:&v21];
  id v12 = v21;
  if (v11)
  {
    int v13 = AXSerializeCFType();
    if (v13)
    {
      size_t v14 = v23;
      if (v23 != 4096)
      {
        uint64_t v15 = __src;
LABEL_11:
        munmap(v15, v14);
      }
    }
    else
    {
      int v18 = __n;
      CFRange v19 = __src;
      if (__n <= 0x1000)
      {
        memcpy(a3, __src, __n);
        *a4 = v18;
        size_t v14 = v23;
        uint64_t v15 = v19;
        goto LABEL_11;
      }
      *a5 = __src;
      *a6 = v23;
    }
    BOOL v17 = v13 != 0;
    goto LABEL_13;
  }
  uint64_t v16 = _SCROD_LOG();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    id v26 = v12;
    _os_log_impl(&dword_21C66E000, v16, OS_LOG_TYPE_DEFAULT, "Error archiving data: %@", buf, 0xCu);
  }

  BOOL v17 = 1;
LABEL_13:

  return v17;
}

BOOL SCROUnserializeWrapper(uint64_t a1, int a2, uint64_t a3, int a4)
{
  uint64_t v7 = *MEMORY[0x263EF8340];
  CFTypeRef cf = 0;
  if (a2 || a4) {
    int v4 = AXUnserializeCFType();
  }
  else {
    int v4 = -25200;
  }
  return v4 != 0;
}

void __SCROUnserializeWrapper_block_invoke()
{
  v4[12] = *MEMORY[0x263EF8340];
  CFDictionaryRef v0 = (void *)MEMORY[0x263EFFA08];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  v4[2] = objc_opt_class();
  v4[3] = objc_opt_class();
  v4[4] = objc_opt_class();
  v4[5] = objc_opt_class();
  v4[6] = objc_opt_class();
  v4[7] = objc_opt_class();
  v4[8] = objc_opt_class();
  v4[9] = objc_opt_class();
  v4[10] = objc_opt_class();
  v4[11] = objc_opt_class();
  uint64_t v1 = [MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:12];
  uint64_t v2 = [v0 setWithArray:v1];
  id v3 = (void *)SCROUnserializeWrapper_classes;
  SCROUnserializeWrapper_classes = v2;
}

void _deadNameHandler(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x263EF8340];
  if (a1 && *(_DWORD *)(a1 + 20) == 72)
  {
    uint64_t v1 = *(unsigned int *)(a1 + 32);
    uint64_t v2 = +[SCROServer sharedServer];
    objc_msgSend(v2, "_setClientCount:", +[SCROClient removeClientWithPort:](SCROClient, "removeClientWithPort:", v1));
    id v3 = _SCROD_LOG();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(NSNumber, "numberWithLong:", objc_msgSend(v2, "_clientCount"));
      int v4 = (__CFRunLoopTimer *)objc_claimAutoreleasedReturnValue();
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_21C66E000, v3, OS_LOG_TYPE_DEFAULT, "Client count: %@", (uint8_t *)&v8, 0xCu);
    }
    if (![v2 _clientCount])
    {
      CFStringRef v5 = (__CFRunLoopTimer *)[v2 _deathTimer];
      int v6 = _SCROD_LOG();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        int v8 = 138412290;
        id v9 = v5;
        _os_log_impl(&dword_21C66E000, v6, OS_LOG_TYPE_DEFAULT, "Death timer firing: %@", (uint8_t *)&v8, 0xCu);
      }

      if (v5)
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        CFRunLoopTimerSetNextFireDate(v5, Current + 3.0);
      }
    }
  }
}

void sub_21C6AAEBC(_Unwind_Exception *a1, int a2)
{
  if (a2 == 1)
  {
    objc_begin_catch(a1);
    fwrite("Caught Exception handling dead name.\n", 0x25uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    objc_end_catch();
    JUMPOUT(0x21C6AAE8CLL);
  }
  _Unwind_Resume(a1);
}

void _deathTimerHandler()
{
  CFDictionaryRef v0 = (void *)MEMORY[0x21D4AD500]();
  uint64_t v1 = _SCROD_LOG();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v5 = 0;
    _os_log_impl(&dword_21C66E000, v1, OS_LOG_TYPE_DEFAULT, "Posting server timeout", v5, 2u);
  }

  uint64_t v2 = [MEMORY[0x263F08A00] defaultCenter];
  uint64_t v3 = kSCROServerTimeoutNotification;
  int v4 = +[SCROServer sharedServer];
  [v2 postNotificationName:v3 object:v4 userInfo:0];
}

uint64_t _SCROXRegisterWithServer(uint64_t a1, int a2, unsigned int *a3, _DWORD *a4, _DWORD *a5, _OWORD *a6)
{
  if (a2 == 15)
  {
    id v9 = (void *)MEMORY[0x21D4AD500]();
    uint64_t v10 = +[SCROServer sharedServer];
    long long v11 = a6[1];
    v17[0] = *a6;
    v17[1] = v11;
    id v12 = +[SCROClient addClientGetIdentifier:a4 token:v17 getPort:a3];
    if (v12)
    {
      if ([v10 _incrementClientCount] == 1)
      {
        int v13 = (__CFRunLoopTimer *)[v10 _deathTimer];
        if (v13)
        {
          CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
          CFRunLoopTimerSetNextFireDate(v13, Current + 630720000.0);
        }
      }
    }
    [v10 _registerForNotificationOnDeathPort:*a3];
  }
  else
  {
    fprintf((FILE *)*MEMORY[0x263EF8348], "ERROR: Version mismatch: client = %d, scrod = %d\n", a2, 15);
    *a4 = 0;
    *a3 = 0;
    *a5 = 3;
  }
  return 0;
}

void sub_21C6AB650(void *a1, int a2)
{
  if (a2 == 2)
  {
    fwrite("Caught Exception creating client\n", 0x21uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
    objc_end_catch();
    JUMPOUT(0x21C6AB5D0);
  }
  JUMPOUT(0x21C6AB5D4);
}

uint64_t _SCROXSendEvent(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, unsigned int a6, unsigned char *a7, _DWORD *a8, void **a9, _DWORD *a10, BOOL *a11, _OWORD *a12)
{
  *a11 = 0;
  *a7 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  if (!(a6 | a4)) {
    return 0;
  }
  context = (void *)MEMORY[0x21D4AD500]();
  long long v31 = (void *)a5;
  CFTypeRef cf = 0;
  BOOL v19 = SCROUnserializeWrapper(a3, a4, a5, a6);
  if (v19)
  {
    NSLog(&cfstr_ErrorWhileDese_1.isa, v19, context);
    id v20 = 0;
  }
  else
  {
    id v20 = [[SCROEvent alloc] initForHandlerType:a2];
    [v20 setMainDictionary:cf];
    long long v21 = a12[1];
    v32[0] = *a12;
    v32[1] = v21;
    BOOL v22 = +[SCROClient isClientTrustedWithPortToken:v32];
    size_t v23 = +[SCROServer sharedServer];
    uint64_t v24 = [v23 delegate];
    uint64_t v25 = [v24 handleEvent:v20 handlerType:a2 trusted:v22];

    if (!v25)
    {
      uint64_t v27 = [v20 claimDictionary];
      if (v27)
      {
        BOOL v28 = SCROSerializeWrapper(v27, 4096, a7, a8, a9, a10);
        BOOL v29 = v28;
        if (v28)
        {
          NSLog(&cfstr_ErrorWhileSeri_1.isa, v28, context);
          *a11 = v29;
        }
      }
      goto LABEL_7;
    }
    NSLog(&cfstr_ErrorWhileHand.isa, v25, context);
  }
  *a11 = 1;
LABEL_7:
  if (cf) {
    CFRelease(cf);
  }
  if (v31 && a6) {
    munmap(v31, a6);
  }

  return 0;
}

uint64_t _SCROXRegisterForCallback(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5, _OWORD *a6)
{
  *a5 = 0;
  long long v11 = (void *)MEMORY[0x21D4AD500]();
  long long v12 = a6[1];
  v17[0] = *a6;
  v17[1] = v12;
  BOOL v13 = +[SCROClient isClientTrustedWithPortToken:v17];
  size_t v14 = +[SCROServer sharedServer];
  uint64_t v15 = [v14 delegate];
  *a5 = [v15 registerCallbackForKey:a4 forClientIdentifier:a2 handlerType:a3 trusted:v13];

  if (*a5) {
    NSLog(&cfstr_ErrorWhileHand.isa, *a5);
  }
  else {
    +[SCROClient registerCallbackWithKey:a4 forClientIdentifier:a2];
  }
  return 0;
}

uint64_t _SCROXGetCallbacks(uint64_t a1, uint64_t a2, unsigned char *a3, _DWORD *a4, void **a5, _DWORD *a6, BOOL *a7)
{
  *a7 = 0;
  *a3 = 0;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  BOOL v13 = (void *)MEMORY[0x21D4AD500]();
  id v14 = +[SCROClient callbacksForClientIdentifier:a2];
  if (v14)
  {
    BOOL v15 = SCROSerializeWrapper((uint64_t)v14, 4096, a3, a4, a5, a6);
    BOOL v16 = v15;
    if (v15)
    {
      NSLog(&cfstr_ErrorWhileSeri_2.isa, v15);
      *a7 = v16;
    }
  }
  return 0;
}

uint64_t _SCROXSetValueForKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, void *a6, unsigned int a7, BOOL *a8, _OWORD *a9)
{
  *a8 = 0;
  CFTypeRef cf = 0;
  BOOL v16 = (void *)MEMORY[0x21D4AD500]();
  BOOL v17 = SCROUnserializeWrapper(a4, a5, (uint64_t)a6, a7);
  BOOL v18 = v17;
  if (v17)
  {
    NSLog(&cfstr_ErrorWhileDese_1.isa, v17);
    *a8 = v18;
  }
  else
  {
    long long v19 = a9[1];
    v25[0] = *a9;
    v25[1] = v19;
    BOOL v20 = +[SCROClient isClientTrustedWithPortToken:v25];
    long long v21 = +[SCROServer sharedServer];
    BOOL v22 = [v21 delegate];
    uint64_t v23 = [v22 setValue:cf forKey:a3 handlerType:a2 trusted:v20];

    if (v23)
    {
      NSLog(&cfstr_ErrorWhileHand_0.isa, v23);
      *a8 = 1;
    }
  }
  if (cf) {
    CFRelease(cf);
  }
  if (a6 && a7) {
    munmap(a6, a7);
  }
  return 0;
}

void sub_21C6ABCE0(_Unwind_Exception *a1)
{
}

uint64_t _SCROXGetValueForKey(uint64_t a1, uint64_t a2, uint64_t a3, unsigned char *a4, _DWORD *a5, void **a6, _DWORD *a7, BOOL *a8, _OWORD *a9)
{
  *a8 = 0;
  *a4 = 0;
  *a5 = 0;
  *a6 = 0;
  *a7 = 0;
  context = (void *)MEMORY[0x21D4AD500]();
  long long v15 = a9[1];
  v27[0] = *a9;
  v27[1] = v15;
  BOOL v16 = +[SCROClient isClientTrustedWithPortToken:v27];
  BOOL v17 = +[SCROServer sharedServer];
  BOOL v18 = [v17 delegate];
  id v26 = 0;
  uint64_t v19 = [v18 getValue:&v26 forKey:a3 handlerType:a2 trusted:v16];
  id v20 = v26;

  if (v19)
  {
    NSLog(&cfstr_ErrorWhileGett_2.isa, v19);
    *a8 = 1;
  }
  else if (v20)
  {
    BOOL v22 = SCROSerializeWrapper((uint64_t)v20, 4096, a4, a5, a6, a7);
    BOOL v23 = v22;
    if (v22)
    {
      NSLog(&cfstr_ErrorWhileSeri_3.isa, v22);
      *a8 = v23;
    }
  }

  return 0;
}

uint64_t _SCROXGetValueForKeyWithObject(uint64_t a1, unsigned int a2, uint64_t a3, uint64_t a4, int a5, uint64_t a6, int a7, unsigned char *a8, _DWORD *a9, void **a10, _DWORD *a11, BOOL *a12, _OWORD *a13)
{
  *a12 = 0;
  *a8 = 0;
  *a9 = 0;
  *a10 = 0;
  *a11 = 0;
  CFTypeRef cf = 0;
  context = (void *)MEMORY[0x21D4AD500]();
  int64_t v32 = (void *)a6;
  unsigned int v31 = a7;
  BOOL v19 = SCROUnserializeWrapper(a4, a5, a6, a7);
  BOOL v20 = v19;
  if (v19)
  {
    NSLog(&cfstr_ErrorWhileDese_2.isa, v19);
    id v21 = 0;
LABEL_3:
    *a12 = v20;
    goto LABEL_9;
  }
  long long v22 = a13[1];
  v34[0] = *a13;
  v34[1] = v22;
  BOOL v23 = +[SCROClient isClientTrustedWithPortToken:v34];
  uint64_t v24 = +[SCROServer sharedServer];
  uint64_t v25 = [v24 delegate];
  id v33 = 0;
  uint64_t v26 = [v25 getValue:&v33 forKey:a3 withObject:cf handlerType:a2 trusted:v23];
  id v21 = v33;

  if (v26)
  {
    NSLog(&cfstr_ErrorWhileGett_2.isa, v26);
    *a12 = 1;
  }
  else if (v21)
  {
    BOOL v27 = SCROSerializeWrapper((uint64_t)v21, 4096, a8, a9, a10, a11);
    BOOL v20 = v27;
    if (v27)
    {
      NSLog(&cfstr_ErrorWhileSeri_3.isa, v27);
      goto LABEL_3;
    }
  }
LABEL_9:
  if (cf) {
    CFRelease(cf);
  }
  if (v32 && v31) {
    munmap(v32, v31);
  }

  return 0;
}

void sub_21C6AC0E0(_Unwind_Exception *a1)
{
}

uint64_t _SCROXPerformAction(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, unsigned int *a5, _OWORD *a6)
{
  *a5 = 0;
  uint64_t v10 = (void *)MEMORY[0x21D4AD500]();
  long long v11 = a6[1];
  v16[0] = *a6;
  v16[1] = v11;
  BOOL v12 = +[SCROClient isClientTrustedWithPortToken:v16];
  BOOL v13 = +[SCROServer sharedServer];
  id v14 = [v13 delegate];
  *a5 = [v14 performActionForKey:a4 handlerType:a3 trusted:v12];

  if (*a5) {
    NSLog(&cfstr_ErrorWhilePerf.isa, *a5);
  }
  return 0;
}

uint64_t _SCRORegisterWithServer(int a1, int a2, _DWORD *a3, _DWORD *a4, _DWORD *a5)
{
  *(_OWORD *)&rcv_name[16] = 0u;
  memset(v16, 0, sizeof(v16));
  *(_OWORD *)rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&rcv_name[28] = a2;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v14 = 5395;
  *(void *)&rcv_name[12] = 0xA604000000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 3, 0x24u, 0x40u, reply_port, 0, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 680100)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v11 = 4294966996;
            if (*(_DWORD *)&rcv_name[28])
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v11 = 4294966996;
              }
              else {
                uint64_t v11 = *(unsigned int *)&rcv_name[28];
              }
            }
          }
          else
          {
            uint64_t v11 = 4294966996;
          }
          goto LABEL_27;
        }
        uint64_t v11 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1
          && *(_DWORD *)rcv_name == 56
          && !*(_DWORD *)&rcv_name[4]
          && HIWORD(v16[0]) << 16 == 0x100000)
        {
          uint64_t v11 = 0;
          int v12 = v16[3];
          *a3 = *(_DWORD *)&rcv_name[24];
          *a4 = v12;
          *a5 = v16[4];
          return v11;
        }
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_27:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((v14 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x263EF8960], *(mach_port_name_t *)&rcv_name[8]);
    }
    goto LABEL_27;
  }
  return v11;
}

uint64_t _SCROSendEvent(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9, void *a10, _DWORD *a11, _DWORD *a12)
{
  mach_port_t v12 = MEMORY[0x270FA5388](a1, a2, a3);
  uint64_t v66 = *MEMORY[0x263EF8340];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  *(_OWORD *)&v37[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v34 = 1;
  uint64_t v35 = v17;
  int v36 = 16777472;
  *(void *)int64_t v37 = v15;
  *(void *)&v37[4] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&v37[12] = v18;
  if (v14 <= 0x1000)
  {
    BOOL v20 = v16;
    unsigned int v21 = v15;
    unsigned int v22 = v14;
    mach_msg_timeout_t v23 = v13;
    mach_port_t v24 = v12;
    __memcpy_chk();
    *(_DWORD *)&v37[16] = v22;
    uint64_t v25 = (v22 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v26 = v25 + 64;
    *(_DWORD *)((char *)&rcv_name + v25 + 60) = v21;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = v24;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(void *)&rcv_name.msgh_voucher_port = 0xA604100000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v28 = mach_msg(&rcv_name, 275, v26, 0x1048u, reply_port, v23, 0);
    uint64_t v19 = v28;
    if ((v28 - 268435458) <= 0xE && ((1 << (v28 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!v28)
      {
        if (rcv_name.msgh_id == 71)
        {
          uint64_t v19 = 4294966988;
        }
        else if (rcv_name.msgh_id == 680101)
        {
          if ((rcv_name.msgh_bits & 0x80000000) != 0)
          {
            uint64_t v19 = 4294966996;
            if (v34 == 1
              && rcv_name.msgh_size >= 0x40
              && rcv_name.msgh_size <= 0x1040
              && !rcv_name.msgh_remote_port
              && HIBYTE(v36) == 1)
            {
              int v29 = *(_DWORD *)&v37[12];
              if (*(_DWORD *)&v37[12] <= 0x1000u && rcv_name.msgh_size - 64 >= *(_DWORD *)&v37[12])
              {
                unsigned int v30 = (*(_DWORD *)&v37[12] + 3) & 0xFFFFFFFC;
                if (rcv_name.msgh_size == v30 + 64)
                {
                  unsigned int v31 = (char *)&rcv_name + v30 - 4096;
                  if (*(_DWORD *)v37 == *((_DWORD *)v31 + 1038))
                  {
                    memcpy(v20, &v37[16], *(unsigned int *)&v37[12]);
                    uint64_t v19 = 0;
                    *a9 = v29;
                    *a10 = v35;
                    *a11 = *((_DWORD *)v31 + 1038);
                    *a12 = *((_DWORD *)v31 + 1039);
                    return v19;
                  }
                }
              }
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            uint64_t v19 = 4294966996;
            if (HIDWORD(v35))
            {
              if (rcv_name.msgh_remote_port) {
                uint64_t v19 = 4294966996;
              }
              else {
                uint64_t v19 = HIDWORD(v35);
              }
            }
          }
          else
          {
            uint64_t v19 = 4294966996;
          }
        }
        else
        {
          uint64_t v19 = 4294966995;
        }
        goto LABEL_34;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v19 - 268435459) > 1) {
      return v19;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x263EF8960], rcv_name.msgh_local_port);
    }
LABEL_34:
    mach_msg_destroy(&rcv_name);
    return v19;
  }
  return 4294966989;
}

uint64_t _SCRORegisterForCallback(int a1, mach_msg_timeout_t a2, int a3, int a4, int a5, _DWORD *a6)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&rcv_name[28] = a3;
  *(_DWORD *)&unsigned char rcv_name[32] = a4;
  *(_DWORD *)&rcv_name[36] = a5;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v14 = 5395;
  *(void *)&rcv_name[12] = 0xA604200000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 275, 0x2Cu, 0x30u, reply_port, a2, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 680102)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v11 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a6 = *(_DWORD *)&rcv_name[32];
                return v11;
              }
              goto LABEL_26;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_26;
          }
        }
        uint64_t v11 = 4294966996;
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((v14 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x263EF8960], *(mach_port_name_t *)&rcv_name[8]);
    }
    goto LABEL_26;
  }
  return v11;
}

uint64_t _SCROGetCallbacks(uint64_t a1, uint64_t a2, uint64_t a3)
{
  int v3 = MEMORY[0x270FA5388](a1, a2, a3);
  CFStringRef v5 = v4;
  uint64_t v7 = v6;
  id v9 = v8;
  uint64_t v11 = v10;
  mach_msg_timeout_t v13 = v12;
  mach_msg_timeout_t v15 = v14;
  int v16 = v3;
  uint64_t v57 = *MEMORY[0x263EF8340];
  long long v55 = 0u;
  memset(v56, 0, sizeof(v56));
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  long long v34 = 0u;
  long long v33 = 0u;
  long long v32 = 0u;
  long long v31 = 0u;
  long long v30 = 0u;
  *(_OWORD *)size_t __n = 0u;
  long long v28 = 0u;
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&rcv_name[28] = v17;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = v16;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v26 = 5395;
  *(void *)&rcv_name[12] = 0xA604300000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v26);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v19 = mach_msg((mach_msg_header_t *)&v26, 275, 0x24u, 0x1048u, reply_port, v15, 0);
  uint64_t v20 = v19;
  if ((v19 - 268435458) <= 0xE && ((1 << (v19 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!v19)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v20 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 680103)
      {
        if ((v26 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v20 = 4294966996;
            if (*(_DWORD *)&rcv_name[28])
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v20 = 4294966996;
              }
              else {
                uint64_t v20 = *(unsigned int *)&rcv_name[28];
              }
            }
          }
          else
          {
            uint64_t v20 = 4294966996;
          }
          goto LABEL_32;
        }
        uint64_t v20 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1
          && *(_DWORD *)rcv_name >= 0x40u
          && *(_DWORD *)rcv_name <= 0x1040u
          && !*(_DWORD *)&rcv_name[4]
          && BYTE3(v28) == 1)
        {
          int v21 = __n[0];
          if (LODWORD(__n[0]) <= 0x1000 && (*(_DWORD *)rcv_name - 64) >= LODWORD(__n[0]))
          {
            unsigned int v22 = (LODWORD(__n[0]) + 3) & 0xFFFFFFFC;
            if (*(_DWORD *)rcv_name == v22 + 64)
            {
              mach_msg_timeout_t v23 = &rcv_name[v22 - 4];
              if (DWORD1(v28) == *((_DWORD *)v23 + 14))
              {
                mach_port_t v24 = v23 - 4096;
                memcpy(v13, (char *)__n + 4, LODWORD(__n[0]));
                uint64_t v20 = 0;
                *uint64_t v11 = v21;
                void *v9 = *(void *)&rcv_name[24];
                _DWORD *v7 = *((_DWORD *)v24 + 1038);
                *CFStringRef v5 = *((_DWORD *)v24 + 1039);
                return v20;
              }
            }
          }
        }
      }
      else
      {
        uint64_t v20 = 4294966995;
      }
LABEL_32:
      mach_msg_destroy((mach_msg_header_t *)&v26);
      return v20;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v20 - 268435459) <= 1)
  {
    if ((v26 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x263EF8960], *(mach_port_name_t *)&rcv_name[8]);
    }
    goto LABEL_32;
  }
  return v20;
}

uint64_t _SCROSetValueForKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, int *a9)
{
  mach_port_t v9 = MEMORY[0x270FA5388](a1, a2, a3);
  uint64_t v60 = *MEMORY[0x263EF8340];
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  *(_OWORD *)&v31[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v28 = 1;
  uint64_t v29 = v13;
  int v30 = 16777472;
  *(void *)long long v31 = v12;
  *(void *)&v31[4] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&v31[12] = v14;
  *(_DWORD *)&v31[16] = v15;
  if (v11 <= 0x1000)
  {
    unsigned int v17 = v12;
    unsigned int v18 = v11;
    mach_msg_timeout_t v19 = v10;
    mach_port_t v20 = v9;
    __memcpy_chk();
    *(_DWORD *)&v31[20] = v18;
    uint64_t v21 = (v18 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v22 = v21 + 68;
    *(_DWORD *)((char *)&rcv_name + v21 + 64) = v17;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = v20;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(void *)&rcv_name.msgh_voucher_port = 0xA604400000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v24 = mach_msg(&rcv_name, 275, v22, 0x30u, reply_port, v19, 0);
    uint64_t v16 = v24;
    if ((v24 - 268435458) <= 0xE && ((1 << (v24 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!v24)
      {
        if (rcv_name.msgh_id == 71)
        {
          uint64_t v16 = 4294966988;
        }
        else if (rcv_name.msgh_id == 680104)
        {
          if ((rcv_name.msgh_bits & 0x80000000) == 0)
          {
            if (rcv_name.msgh_size == 40)
            {
              if (!rcv_name.msgh_remote_port)
              {
                uint64_t v16 = HIDWORD(v29);
                if (!HIDWORD(v29))
                {
                  *a9 = v30;
                  return v16;
                }
                goto LABEL_28;
              }
            }
            else if (rcv_name.msgh_size == 36)
            {
              if (rcv_name.msgh_remote_port) {
                BOOL v25 = 1;
              }
              else {
                BOOL v25 = HIDWORD(v29) == 0;
              }
              if (v25) {
                uint64_t v16 = 4294966996;
              }
              else {
                uint64_t v16 = HIDWORD(v29);
              }
              goto LABEL_28;
            }
          }
          uint64_t v16 = 4294966996;
        }
        else
        {
          uint64_t v16 = 4294966995;
        }
LABEL_28:
        mach_msg_destroy(&rcv_name);
        return v16;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v16 - 268435459) > 1) {
      return v16;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x263EF8960], rcv_name.msgh_local_port);
    }
    goto LABEL_28;
  }
  return 4294966989;
}

uint64_t _SCROGetValueForKey(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _DWORD *a9)
{
  int v9 = MEMORY[0x270FA5388](a1, a2, a3);
  unsigned int v11 = v10;
  uint64_t v13 = v12;
  int v15 = v14;
  unsigned int v17 = v16;
  mach_msg_timeout_t v19 = v18;
  int v20 = v9;
  uint64_t v62 = *MEMORY[0x263EF8340];
  long long v60 = 0u;
  memset(v61, 0, sizeof(v61));
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v47 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  long long v44 = 0u;
  long long v43 = 0u;
  long long v42 = 0u;
  long long v41 = 0u;
  long long v40 = 0u;
  long long v39 = 0u;
  long long v38 = 0u;
  long long v37 = 0u;
  long long v36 = 0u;
  long long v35 = 0u;
  *(_OWORD *)size_t __n = 0u;
  long long v33 = 0u;
  *(_OWORD *)&rcv_name[16] = 0u;
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&rcv_name[28] = v21;
  LODWORD(v33) = v22;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = v20;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v31 = 5395;
  *(void *)&rcv_name[12] = 0xA604500000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v31);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v24 = mach_msg((mach_msg_header_t *)&v31, 275, 0x28u, 0x1048u, reply_port, v19, 0);
  uint64_t v25 = v24;
  if ((v24 - 268435458) <= 0xE && ((1 << (v24 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!v24)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v25 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 680105)
      {
        if ((v31 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 36)
          {
            uint64_t v25 = 4294966996;
            if (*(_DWORD *)&rcv_name[28])
            {
              if (*(_DWORD *)&rcv_name[4]) {
                uint64_t v25 = 4294966996;
              }
              else {
                uint64_t v25 = *(unsigned int *)&rcv_name[28];
              }
            }
          }
          else
          {
            uint64_t v25 = 4294966996;
          }
          goto LABEL_32;
        }
        uint64_t v25 = 4294966996;
        if (*(_DWORD *)&rcv_name[20] == 1
          && *(_DWORD *)rcv_name >= 0x40u
          && *(_DWORD *)rcv_name <= 0x1040u
          && !*(_DWORD *)&rcv_name[4]
          && BYTE3(v33) == 1)
        {
          int v26 = __n[0];
          if (LODWORD(__n[0]) <= 0x1000 && (*(_DWORD *)rcv_name - 64) >= LODWORD(__n[0]))
          {
            unsigned int v27 = (LODWORD(__n[0]) + 3) & 0xFFFFFFFC;
            if (*(_DWORD *)rcv_name == v27 + 64)
            {
              int v28 = &rcv_name[v27 - 4];
              if (DWORD1(v33) == *((_DWORD *)v28 + 14))
              {
                uint64_t v29 = v28 - 4096;
                memcpy(v17, (char *)__n + 4, LODWORD(__n[0]));
                uint64_t v25 = 0;
                _DWORD *v15 = v26;
                void *v13 = *(void *)&rcv_name[24];
                *unsigned int v11 = *((_DWORD *)v29 + 1038);
                *a9 = *((_DWORD *)v29 + 1039);
                return v25;
              }
            }
          }
        }
      }
      else
      {
        uint64_t v25 = 4294966995;
      }
LABEL_32:
      mach_msg_destroy((mach_msg_header_t *)&v31);
      return v25;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v25 - 268435459) <= 1)
  {
    if ((v31 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x263EF8960], *(mach_port_name_t *)&rcv_name[8]);
    }
    goto LABEL_32;
  }
  return v25;
}

uint64_t _SCROGetValueForKeyWithObject(uint64_t a1, uint64_t a2, uint64_t a3, int a4, int a5, int a6, int a7, int a8, void *__dst, _DWORD *a10, void *a11, _DWORD *a12, _DWORD *a13)
{
  mach_port_t v13 = MEMORY[0x270FA5388](a1, a2, a3);
  uint64_t v66 = *MEMORY[0x263EF8340];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  *(_OWORD *)&v37[8] = 0u;
  memset(&rcv_name, 0, sizeof(rcv_name));
  int v34 = 1;
  uint64_t v35 = v17;
  int v36 = 16777472;
  *(void *)long long v37 = v16;
  *(void *)&v37[4] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&v37[12] = v18;
  *(_DWORD *)&v37[16] = v19;
  if (v15 <= 0x1000)
  {
    unsigned int v21 = v16;
    unsigned int v22 = v15;
    mach_msg_timeout_t v23 = v14;
    mach_port_t v24 = v13;
    __memcpy_chk();
    *(_DWORD *)&v37[20] = v22;
    uint64_t v25 = (v22 + 3) & 0xFFFFFFFC;
    mach_msg_size_t v26 = v25 + 68;
    *(_DWORD *)((char *)&rcv_name + v25 + 64) = v21;
    mach_port_t reply_port = mig_get_reply_port();
    rcv_name.msgh_remote_port = v24;
    rcv_name.msgh_local_port = reply_port;
    rcv_name.msgh_bits = -2147478253;
    *(void *)&rcv_name.msgh_voucher_port = 0xA604600000000;
    if (MEMORY[0x263EF8B00])
    {
      voucher_mach_msg_set(&rcv_name);
      mach_port_t reply_port = rcv_name.msgh_local_port;
    }
    uint64_t v28 = mach_msg(&rcv_name, 275, v26, 0x1048u, reply_port, v23, 0);
    uint64_t v20 = v28;
    if ((v28 - 268435458) <= 0xE && ((1 << (v28 - 2)) & 0x4003) != 0)
    {
      mig_put_reply_port(rcv_name.msgh_local_port);
    }
    else
    {
      if (!v28)
      {
        if (rcv_name.msgh_id == 71)
        {
          uint64_t v20 = 4294966988;
        }
        else if (rcv_name.msgh_id == 680106)
        {
          if ((rcv_name.msgh_bits & 0x80000000) != 0)
          {
            uint64_t v20 = 4294966996;
            if (v34 == 1
              && rcv_name.msgh_size >= 0x40
              && rcv_name.msgh_size <= 0x1040
              && !rcv_name.msgh_remote_port
              && HIBYTE(v36) == 1)
            {
              int v29 = *(_DWORD *)&v37[12];
              if (*(_DWORD *)&v37[12] <= 0x1000u && rcv_name.msgh_size - 64 >= *(_DWORD *)&v37[12])
              {
                unsigned int v30 = (*(_DWORD *)&v37[12] + 3) & 0xFFFFFFFC;
                if (rcv_name.msgh_size == v30 + 64)
                {
                  int v31 = (char *)&rcv_name + v30 - 4096;
                  if (*(_DWORD *)v37 == *((_DWORD *)v31 + 1038))
                  {
                    memcpy(__dst, &v37[16], *(unsigned int *)&v37[12]);
                    uint64_t v20 = 0;
                    *a10 = v29;
                    *a11 = v35;
                    *a12 = *((_DWORD *)v31 + 1038);
                    *a13 = *((_DWORD *)v31 + 1039);
                    return v20;
                  }
                }
              }
            }
          }
          else if (rcv_name.msgh_size == 36)
          {
            uint64_t v20 = 4294966996;
            if (HIDWORD(v35))
            {
              if (rcv_name.msgh_remote_port) {
                uint64_t v20 = 4294966996;
              }
              else {
                uint64_t v20 = HIDWORD(v35);
              }
            }
          }
          else
          {
            uint64_t v20 = 4294966996;
          }
        }
        else
        {
          uint64_t v20 = 4294966995;
        }
        goto LABEL_34;
      }
      mig_dealloc_reply_port(rcv_name.msgh_local_port);
    }
    if ((v20 - 268435459) > 1) {
      return v20;
    }
    if ((rcv_name.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x263EF8960], rcv_name.msgh_local_port);
    }
LABEL_34:
    mach_msg_destroy(&rcv_name);
    return v20;
  }
  return 4294966989;
}

uint64_t _SCROPerformAction(int a1, mach_msg_timeout_t a2, int a3, int a4, int a5, _DWORD *a6)
{
  memset(&rcv_name[16], 0, 28);
  *(_OWORD *)mach_msg_header_t rcv_name = 0u;
  *(void *)&rcv_name[20] = *MEMORY[0x263EF80C8];
  *(_DWORD *)&rcv_name[28] = a3;
  *(_DWORD *)&unsigned char rcv_name[32] = a4;
  *(_DWORD *)&rcv_name[36] = a5;
  mach_port_name_t reply_port = mig_get_reply_port();
  *(_DWORD *)&rcv_name[4] = a1;
  *(_DWORD *)&rcv_name[8] = reply_port;
  int v14 = 5395;
  *(void *)&rcv_name[12] = 0xA604700000000;
  if (MEMORY[0x263EF8B00])
  {
    voucher_mach_msg_set((mach_msg_header_t *)&v14);
    mach_port_name_t reply_port = *(_DWORD *)&rcv_name[8];
  }
  uint64_t v10 = mach_msg((mach_msg_header_t *)&v14, 275, 0x2Cu, 0x30u, reply_port, a2, 0);
  uint64_t v11 = v10;
  if ((v10 - 268435458) <= 0xE && ((1 << (v10 - 2)) & 0x4003) != 0)
  {
    mig_put_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  else
  {
    if (!v10)
    {
      if (*(_DWORD *)&rcv_name[16] == 71)
      {
        uint64_t v11 = 4294966988;
      }
      else if (*(_DWORD *)&rcv_name[16] == 680107)
      {
        if ((v14 & 0x80000000) == 0)
        {
          if (*(_DWORD *)rcv_name == 40)
          {
            if (!*(_DWORD *)&rcv_name[4])
            {
              uint64_t v11 = *(unsigned int *)&rcv_name[28];
              if (!*(_DWORD *)&rcv_name[28])
              {
                *a6 = *(_DWORD *)&rcv_name[32];
                return v11;
              }
              goto LABEL_26;
            }
          }
          else if (*(_DWORD *)rcv_name == 36)
          {
            if (*(_DWORD *)&rcv_name[4]) {
              BOOL v12 = 1;
            }
            else {
              BOOL v12 = *(_DWORD *)&rcv_name[28] == 0;
            }
            if (v12) {
              uint64_t v11 = 4294966996;
            }
            else {
              uint64_t v11 = *(unsigned int *)&rcv_name[28];
            }
            goto LABEL_26;
          }
        }
        uint64_t v11 = 4294966996;
      }
      else
      {
        uint64_t v11 = 4294966995;
      }
LABEL_26:
      mach_msg_destroy((mach_msg_header_t *)&v14);
      return v11;
    }
    mig_dealloc_reply_port(*(mach_port_t *)&rcv_name[8]);
  }
  if ((v11 - 268435459) <= 1)
  {
    if ((v14 & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x263EF8960], *(mach_port_name_t *)&rcv_name[8]);
    }
    goto LABEL_26;
  }
  return v11;
}

uint64_t (*SCROClientFunctions_server_routine(uint64_t a1))()
{
  int v1 = *(_DWORD *)(a1 + 20);
  if ((v1 - 680008) >= 0xFFFFFFF8) {
    return _SCROXSCROClientFunctions_subsystem[5 * (v1 - 680000) + 5];
  }
  else {
    return 0;
  }
}

uint64_t _XRegisterWithServer(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 36) || *(_DWORD *)(result + 40) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  int v4 = (unsigned int *)(a2 + 28);
  *(void *)(a2 + 32) = 0x10000000000000;
  uint64_t v5 = *(unsigned int *)(result + 12);
  int v6 = *(_DWORD *)(result + 32);
  long long v7 = *(_OWORD *)(result + 72);
  v8[0] = *(_OWORD *)(result + 56);
  v8[1] = v7;
  uint64_t result = _SCROXRegisterWithServer(v5, v6, v4, (_DWORD *)(a2 + 48), (_DWORD *)(a2 + 52), v8);
  if (!result)
  {
    *(void *)(a2 + 40) = *MEMORY[0x263EF80C8];
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 4) = 56;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

uint64_t _XSendEvent(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x40 || v4 > 0x1040) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_19;
  }
  unsigned int v6 = *(_DWORD *)(result + 56);
  if (v6 > 0x1000)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_4;
  }
  int v3 = -304;
  if ((int)v4 - 64 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v4 != v7 + 64) {
    goto LABEL_3;
  }
  if (*(_DWORD *)(result + 40) != *(_DWORD *)(result + v7 + 60))
  {
LABEL_19:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v21 = 0;
  uint64_t v8 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v8 || *(_DWORD *)(v8 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  int v9 = (_DWORD *)(a2 + 52);
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v10 = *(unsigned int *)(result + 12);
  uint64_t v11 = *(unsigned int *)(result + 52);
  int v12 = *(_DWORD *)(result + 56);
  uint64_t v13 = *(void *)(result + 28);
  unsigned int v14 = *(_DWORD *)(result + 40);
  long long v15 = *(_OWORD *)(v8 + 36);
  v20[0] = *(_OWORD *)(v8 + 20);
  v20[1] = v15;
  uint64_t result = _SCROXSendEvent(v10, v11, result + 60, v12, v13, v14, (unsigned char *)(a2 + 56), v9, (void **)(a2 + 28), (_DWORD *)&v21 + 1, (BOOL *)&v21, v20);
  if (!result)
  {
    int v16 = HIDWORD(v21);
    *(_DWORD *)(a2 + 40) = HIDWORD(v21);
    *(void *)(a2 + 44) = *MEMORY[0x263EF80C8];
    uint64_t v17 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v17 + 64;
    uint64_t v18 = a2 + v17;
    int v19 = v21;
    *(_DWORD *)(v18 + 56) = v16;
    *(_DWORD *)(v18 + 60) = v19;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

uint64_t _XRegisterForCallback(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 44) || *(_DWORD *)(result + 48) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x263EF80C8];
    goto LABEL_8;
  }
  uint64_t v5 = *(unsigned int *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 32);
  uint64_t v7 = *(unsigned int *)(result + 36);
  uint64_t v8 = *(unsigned int *)(result + 40);
  long long v9 = *(_OWORD *)(result + 80);
  v10[0] = *(_OWORD *)(result + 64);
  v10[1] = v9;
  uint64_t result = _SCROXRegisterForCallback(v5, v6, v7, v8, (unsigned int *)(a2 + 36), v10);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v4;
  return result;
}

_DWORD *_XGetCallbacks(_DWORD *result, uint64_t a2)
{
  if ((*result & 0x80000000) != 0 || result[1] != 36)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  uint64_t v8 = 0;
  if (result[9] || result[10] <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t result = (_DWORD *)_SCROXGetCallbacks(result[3], result[8], (unsigned char *)(a2 + 56), (_DWORD *)(a2 + 52), (void **)(a2 + 28), (_DWORD *)&v8 + 1, (BOOL *)&v8);
  if (!result)
  {
    int v4 = HIDWORD(v8);
    *(_DWORD *)(a2 + 40) = HIDWORD(v8);
    *(void *)(a2 + 44) = *MEMORY[0x263EF80C8];
    uint64_t v5 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v5 + 64;
    uint64_t v6 = a2 + v5;
    int v7 = v8;
    *(_DWORD *)(v6 + 56) = v4;
    *(_DWORD *)(v6 + 60) = v7;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

uint64_t _XSetValueForKey(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v5 = *(unsigned int *)(result + 4);
  if (v5 < 0x44 || v5 > 0x1044) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_19;
  }
  unsigned int v7 = *(_DWORD *)(result + 60);
  if (v7 > 0x1000)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x263EF80C8];
    goto LABEL_4;
  }
  int v3 = -304;
  if ((int)v5 - 68 < v7) {
    goto LABEL_3;
  }
  unsigned int v8 = (v7 + 3) & 0xFFFFFFFC;
  if (v5 != v8 + 68) {
    goto LABEL_3;
  }
  unsigned int v9 = *(_DWORD *)(result + 40);
  if (v9 != *(_DWORD *)(result + v8 + 64))
  {
LABEL_19:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v10 = ((v5 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v10 || *(_DWORD *)(v10 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  uint64_t v11 = *(unsigned int *)(result + 12);
  uint64_t v12 = *(unsigned int *)(result + 52);
  uint64_t v13 = *(unsigned int *)(result + 56);
  unsigned int v14 = *(void **)(result + 28);
  long long v15 = *(_OWORD *)(v10 + 36);
  v16[0] = *(_OWORD *)(v10 + 20);
  v16[1] = v15;
  uint64_t result = _SCROXSetValueForKey(v11, v12, v13, result + 64, v7, v14, v9, (BOOL *)(a2 + 36), v16);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_4:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t _XGetValueForKey(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 40)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  uint64_t v15 = 0;
  if (*(_DWORD *)(result + 40) || *(_DWORD *)(result + 44) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_8;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  uint64_t v4 = (_DWORD *)(a2 + 52);
  uint64_t v5 = (void **)(a2 + 28);
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v6 = *(unsigned int *)(result + 12);
  uint64_t v7 = *(unsigned int *)(result + 32);
  uint64_t v8 = *(unsigned int *)(result + 36);
  long long v9 = *(_OWORD *)(result + 76);
  v14[0] = *(_OWORD *)(result + 60);
  v14[1] = v9;
  uint64_t result = _SCROXGetValueForKey(v6, v7, v8, (unsigned char *)(a2 + 56), v4, v5, (_DWORD *)&v15 + 1, (BOOL *)&v15, v14);
  if (!result)
  {
    int v10 = HIDWORD(v15);
    *(_DWORD *)(a2 + 40) = HIDWORD(v15);
    *(void *)(a2 + 44) = *MEMORY[0x263EF80C8];
    uint64_t v11 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v11 + 64;
    uint64_t v12 = a2 + v11;
    int v13 = v15;
    *(_DWORD *)(v12 + 56) = v10;
    *(_DWORD *)(v12 + 60) = v13;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_8:
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

uint64_t _XGetValueForKeyWithObject(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) == 0) {
    goto LABEL_2;
  }
  int v3 = -304;
  if (*(_DWORD *)(result + 24) != 1) {
    goto LABEL_3;
  }
  uint64_t v4 = *(unsigned int *)(result + 4);
  if (v4 < 0x44 || v4 > 0x1044) {
    goto LABEL_3;
  }
  if (*(unsigned char *)(result + 39) != 1) {
    goto LABEL_19;
  }
  unsigned int v6 = *(_DWORD *)(result + 60);
  if (v6 > 0x1000)
  {
LABEL_2:
    int v3 = -304;
LABEL_3:
    *(_DWORD *)(a2 + 32) = v3;
    goto LABEL_4;
  }
  int v3 = -304;
  if ((int)v4 - 68 < v6) {
    goto LABEL_3;
  }
  unsigned int v7 = (v6 + 3) & 0xFFFFFFFC;
  if (v4 != v7 + 68) {
    goto LABEL_3;
  }
  if (*(_DWORD *)(result + 40) != *(_DWORD *)(result + v7 + 64))
  {
LABEL_19:
    int v3 = -300;
    goto LABEL_3;
  }
  uint64_t v21 = 0;
  uint64_t v8 = ((v4 + 3) & 0x1FFFFFFFCLL) + result;
  if (*(_DWORD *)v8 || *(_DWORD *)(v8 + 4) <= 0x1Fu)
  {
    int v3 = -309;
    goto LABEL_3;
  }
  *(_DWORD *)(a2 + 52) = 4096;
  *(_DWORD *)(a2 + 36) = 16777473;
  uint64_t v9 = *(unsigned int *)(result + 12);
  unsigned int v10 = *(_DWORD *)(result + 52);
  uint64_t v11 = *(unsigned int *)(result + 56);
  int v12 = *(_DWORD *)(result + 60);
  uint64_t v13 = *(void *)(result + 28);
  int v14 = *(_DWORD *)(result + 40);
  long long v15 = *(_OWORD *)(v8 + 36);
  v20[0] = *(_OWORD *)(v8 + 20);
  v20[1] = v15;
  uint64_t result = _SCROXGetValueForKeyWithObject(v9, v10, v11, result + 64, v12, v13, v14, (unsigned char *)(a2 + 56), (_DWORD *)(a2 + 52), (void **)(a2 + 28), (_DWORD *)&v21 + 1, (BOOL *)&v21, v20);
  if (!result)
  {
    int v16 = HIDWORD(v21);
    *(_DWORD *)(a2 + 40) = HIDWORD(v21);
    *(void *)(a2 + 44) = *MEMORY[0x263EF80C8];
    uint64_t v17 = (*(_DWORD *)(a2 + 52) + 3) & 0xFFFFFFFC;
    *(_DWORD *)(a2 + 4) = v17 + 64;
    uint64_t v18 = a2 + v17;
    int v19 = v21;
    *(_DWORD *)(v18 + 56) = v16;
    *(_DWORD *)(v18 + 60) = v19;
    *(_DWORD *)a2 |= 0x80000000;
    *(_DWORD *)(a2 + 24) = 1;
    return result;
  }
  *(_DWORD *)(a2 + 32) = result;
LABEL_4:
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return result;
}

uint64_t _XPerformAction(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 44)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 44) || *(_DWORD *)(result + 48) <= 0x1Fu)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    uint64_t v4 = *MEMORY[0x263EF80C8];
    goto LABEL_8;
  }
  uint64_t v5 = *(unsigned int *)(result + 12);
  uint64_t v6 = *(unsigned int *)(result + 32);
  uint64_t v7 = *(unsigned int *)(result + 36);
  uint64_t v8 = *(unsigned int *)(result + 40);
  long long v9 = *(_OWORD *)(result + 80);
  v10[0] = *(_OWORD *)(result + 64);
  v10[1] = v9;
  uint64_t result = _SCROXPerformAction(v5, v6, v7, v8, (unsigned int *)(a2 + 36), v10);
  *(_DWORD *)(a2 + 32) = result;
  uint64_t v4 = *MEMORY[0x263EF80C8];
  if (!result)
  {
    *(void *)(a2 + 24) = v4;
    *(_DWORD *)(a2 + 4) = 40;
    return result;
  }
LABEL_8:
  *(void *)(a2 + 24) = v4;
  return result;
}

uint64_t SCROClientFunctions_server(_DWORD *a1, uint64_t a2)
{
  int v2 = a1[2];
  *(_DWORD *)a2 = *a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = a1[5] + 100;
  *(_DWORD *)(a2 + _Block_object_dispose(&a9, 8) = v2;
  *(_DWORD *)(a2 + 12) = 0;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  int v4 = a1[5];
  if ((v4 - 680008) >= 0xFFFFFFF8
    && (uint64_t v5 = (void (*)(void))_SCROXSCROClientFunctions_subsystem[5 * (v4 - 680000) + 5]) != 0)
  {
    v5();
    return 1;
  }
  else
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    *(_DWORD *)(a2 + 32) = -303;
  }
  return result;
}

uint64_t _SCROPing(mach_port_t a1, mach_msg_timeout_t timeout)
{
  msg.msgh_size = 0;
  msg.msgh_bits = 19;
  msg.msgh_remote_port = a1;
  msg.msgh_local_port = 0;
  *(void *)&msg.msgh_voucher_port = 0xA875000000000;
  if (MEMORY[0x263EF8B00]) {
    voucher_mach_msg_set(&msg);
  }
  uint64_t v3 = mach_msg(&msg, 17, 0x18u, 0, 0, timeout, 0);
  if ((v3 - 268435459) <= 1)
  {
    if ((msg.msgh_bits & 0x1F00) == 0x1100) {
      mach_port_deallocate(*MEMORY[0x263EF8960], msg.msgh_local_port);
    }
    mach_msg_destroy(&msg);
  }
  return v3;
}

uint64_t (*SCROHandlerFunctions_server_routine(uint64_t a1))(uint64_t result, uint64_t a2)
{
  if (*(_DWORD *)(a1 + 20) == 690000) {
    return _XPing;
  }
  else {
    return 0;
  }
}

uint64_t _XPing(uint64_t result, uint64_t a2)
{
  if ((*(_DWORD *)result & 0x80000000) != 0 || *(_DWORD *)(result + 4) != 24)
  {
    int v3 = -304;
    goto LABEL_7;
  }
  if (*(_DWORD *)(result + 24) || *(_DWORD *)(result + 28) <= 7u)
  {
    int v3 = -309;
LABEL_7:
    *(_DWORD *)(a2 + 32) = v3;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    return result;
  }
  uint64_t result = _SCROXPing(*(unsigned int *)(result + 12), *(void **)(result + 76));
  *(_DWORD *)(a2 + 32) = result;
  return result;
}

uint64_t SCROHandlerFunctions_server(uint64_t a1, uint64_t a2)
{
  unsigned int v2 = *(_DWORD *)(a1 + 8);
  *(_DWORD *)a2 = *(_DWORD *)a1 & 0x1F;
  *(_DWORD *)(a2 + 4) = 36;
  int v3 = *(_DWORD *)(a1 + 20) + 100;
  *(void *)(a2 + _Block_object_dispose(&a9, 8) = v2;
  *(_DWORD *)(a2 + 16) = 0;
  *(_DWORD *)(a2 + 20) = v3;
  if (*(_DWORD *)(a1 + 20) != 690000)
  {
    uint64_t result = 0;
    *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
    *(_DWORD *)(a2 + 32) = -303;
    return result;
  }
  if ((*(_DWORD *)a1 & 0x80000000) != 0 || *(_DWORD *)(a1 + 4) != 24)
  {
    int v4 = -304;
  }
  else
  {
    if (!*(_DWORD *)(a1 + 24) && *(_DWORD *)(a1 + 28) > 7u)
    {
      *(_DWORD *)(a2 + 32) = _SCROXPing(*(unsigned int *)(a1 + 12), *(void **)(a1 + 76));
      return 1;
    }
    int v4 = -309;
  }
  *(_DWORD *)(a2 + 32) = v4;
  *(void *)(a2 + 24) = *MEMORY[0x263EF80C8];
  return 1;
}

void soft__AXSVoiceOverTouchSetTactileGraphicsDisplay_cold_1()
{
  CFDictionaryRef v0 = [MEMORY[0x263F08690] currentHandler];
  int v1 = [NSString stringWithUTF8String:"void soft__AXSVoiceOverTouchSetTactileGraphicsDisplay(CFStringRef)"];
  objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v1, @"SCROBrailleDisplayAutoDetector.m", 46, @"%s", dlerror());

  __break(1u);
}

void libAccessibilityLibrary_cold_1(void *a1)
{
  unsigned int v2 = [MEMORY[0x263F08690] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *libAccessibilityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SCROBrailleDisplayAutoDetector.m", 45, @"%s", *a1);

  __break(1u);
}

void libAccessibilityLibrary_cold_1_0(void *a1)
{
  unsigned int v2 = [MEMORY[0x263F08690] currentHandler];
  int v3 = [NSString stringWithUTF8String:"void *libAccessibilityLibrary(void)"];
  objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, @"SCROBrailleDisplayManager.m", 23, @"%s", *a1);

  __break(1u);
}

void _SCROXRegisterForCallback_cold_1(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 1;
  objc_end_catch();
}

void _SCROXGetCallbacks_cold_1(void *a1, uint64_t a2, _DWORD *a3)
{
  objc_begin_catch(a1);
  fwrite("Caught Exception while processing callback fetch\n", 0x31uLL, 1uLL, (FILE *)*MEMORY[0x263EF8348]);
  *a3 = 1;

  objc_end_catch();
}

void _SCROXGetValueForKey_cold_1(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 1;
  objc_end_catch();
}

void _SCROXPerformAction_cold_1(void *a1, uint64_t a2, _DWORD *a3)
{
  *a3 = 1;
  objc_end_catch();
}

uint64_t AXSerializeCFType()
{
  return MEMORY[0x270F09868]();
}

uint64_t AXUnserializeCFType()
{
  return MEMORY[0x270F098D8]();
}

uint64_t BRLTModeForFlags()
{
  return MEMORY[0x270F12810]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  MEMORY[0x270EE4278]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x270EE4300](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x270EE4320](theArray);
}

CFIndex CFArrayGetFirstIndexOfValue(CFArrayRef theArray, CFRange range, const void *value)
{
  return MEMORY[0x270EE4338](theArray, range.location, range.length, value);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x270EE4360](theArray, idx);
}

void CFArrayRemoveAllValues(CFMutableArrayRef theArray)
{
}

void CFArrayRemoveValueAtIndex(CFMutableArrayRef theArray, CFIndex idx)
{
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x270EE4440](arg);
}

uint64_t CFBundleCopyLocalizedStringForLocalization()
{
  return MEMORY[0x270EE4580]();
}

uint64_t CFBundleCopyLocalizedStringTableForLocalization()
{
  return MEMORY[0x270EE4588]();
}

CFBundleRef CFBundleCreate(CFAllocatorRef allocator, CFURLRef bundleURL)
{
  return (CFBundleRef)MEMORY[0x270EE45B8](allocator, bundleURL);
}

CFDictionaryRef CFDictionaryCreateCopy(CFAllocatorRef allocator, CFDictionaryRef theDict)
{
  return (CFDictionaryRef)MEMORY[0x270EE4910](allocator, theDict);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EE4920](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFIndex CFDictionaryGetCount(CFDictionaryRef theDict)
{
  return MEMORY[0x270EE4930](theDict);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x270EE4958](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x270EE4B88]();
}

void CFNotificationCenterPostNotification(CFNotificationCenterRef center, CFNotificationName name, const void *object, CFDictionaryRef userInfo, Boolean deliverImmediately)
{
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x270EE4CA0](key, applicationID);
}

Boolean CFPreferencesGetAppBooleanValue(CFStringRef key, CFStringRef applicationID, Boolean *keyExistsAndHasValidFormat)
{
  return MEMORY[0x270EE4CD0](key, applicationID, keyExistsAndHasValidFormat);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
}

void CFRelease(CFTypeRef cf)
{
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x270EE4E10](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
}

void CFRunLoopAddTimer(CFRunLoopRef rl, CFRunLoopTimerRef timer, CFRunLoopMode mode)
{
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x270EE4E58]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
}

void CFRunLoopRun(void)
{
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EE4EE0](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
}

void CFRunLoopStop(CFRunLoopRef rl)
{
}

CFRunLoopTimerRef CFRunLoopTimerCreate(CFAllocatorRef allocator, CFAbsoluteTime fireDate, CFTimeInterval interval, CFOptionFlags flags, CFIndex order, CFRunLoopTimerCallBack callout, CFRunLoopTimerContext *context)
{
  return (CFRunLoopTimerRef)MEMORY[0x270EE4F00](allocator, flags, order, callout, context, fireDate, interval);
}

void CFRunLoopTimerInvalidate(CFRunLoopTimerRef timer)
{
}

void CFRunLoopTimerSetNextFireDate(CFRunLoopTimerRef timer, CFAbsoluteTime fireDate)
{
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
}

void CFSetApplyFunction(CFSetRef theSet, CFSetApplierFunction applier, void *context)
{
}

Boolean CFSetContainsValue(CFSetRef theSet, const void *value)
{
  return MEMORY[0x270EE4F48](theSet, value);
}

CFSetRef CFSetCreateCopy(CFAllocatorRef allocator, CFSetRef theSet)
{
  return (CFSetRef)MEMORY[0x270EE4F58](allocator, theSet);
}

CFMutableSetRef CFSetCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFSetCallBacks *callBacks)
{
  return (CFMutableSetRef)MEMORY[0x270EE4F60](allocator, capacity, callBacks);
}

CFIndex CFSetGetCount(CFSetRef theSet)
{
  return MEMORY[0x270EE4F70](theSet);
}

void CFSetRemoveAllValues(CFMutableSetRef theSet)
{
}

void CFSetRemoveValue(CFMutableSetRef theSet, const void *value)
{
}

void CFSetSetValue(CFMutableSetRef theSet, const void *value)
{
}

CFStringRef CFStringCreateWithCharacters(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars)
{
  return (CFStringRef)MEMORY[0x270EE50F8](alloc, chars, numChars);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x270EE5128](alloc, str, range.location, range.length);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x270EE5180](theString, *(void *)&encoding);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x270EE51A0](theString);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x270EE51D8](theString);
}

Boolean CFStringTransform(CFMutableStringRef string, CFRange *range, CFStringRef transform, Boolean reverse)
{
  return MEMORY[0x270EE52B8](string, range, transform, reverse);
}

IOHIDDeviceRef IOHIDDeviceCreate(CFAllocatorRef allocator, io_service_t service)
{
  return (IOHIDDeviceRef)MEMORY[0x270EF4070](allocator, *(void *)&service);
}

CFTypeRef IOHIDDeviceGetProperty(IOHIDDeviceRef device, CFStringRef key)
{
  return (CFTypeRef)MEMORY[0x270EF4078](device, key);
}

io_object_t IOIteratorNext(io_iterator_t iterator)
{
  return MEMORY[0x270EF4790](*(void *)&iterator);
}

kern_return_t IOMainPort(mach_port_t bootstrapPort, mach_port_t *mainPort)
{
  return MEMORY[0x270EF47A8](*(void *)&bootstrapPort, mainPort);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x270EF47B8](*(void *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x270EF47D0](notify);
}

BOOLean_t IOObjectConformsTo(io_object_t object, const io_name_t className)
{
  return MEMORY[0x270EF47E0](*(void *)&object, className);
}

BOOLean_t IOObjectIsEqualTo(io_object_t object, io_object_t anObject)
{
  return MEMORY[0x270EF4818](*(void *)&object, *(void *)&anObject);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x270EF4820](*(void *)&object);
}

kern_return_t IOObjectRetain(io_object_t object)
{
  return MEMORY[0x270EF4828](*(void *)&object);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x270EF49D8](*(void *)&entry, key, allocator, *(void *)&options);
}

kern_return_t IOServiceAddMatchingNotification(IONotificationPortRef notifyPort, const io_name_t notificationType, CFDictionaryRef matching, IOServiceMatchingCallback callback, void *refCon, io_iterator_t *notification)
{
  return MEMORY[0x270EF4A88](notifyPort, notificationType, matching, callback, refCon, notification);
}

kern_return_t IOServiceGetMatchingServices(mach_port_t mainPort, CFDictionaryRef matching, io_iterator_t *existing)
{
  return MEMORY[0x270EF4AB8](*(void *)&mainPort, matching, existing);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x270EF4AD0](name);
}

uint64_t MSHCreateMIGServerSource()
{
  return MEMORY[0x270F09908]();
}

uint64_t MSHCreateMachServerSource()
{
  return MEMORY[0x270F09910]();
}

uint64_t MSHGetMachPortFromSource()
{
  return MEMORY[0x270F09918]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x270EF2A50](aClassName);
}

NSString *NSHomeDirectory(void)
{
  return (NSString *)MEMORY[0x270EF2AD0]();
}

NSRange NSIntersectionRange(NSRange range1, NSRange range2)
{
  NSUInteger v2 = MEMORY[0x270EF2AF8](range1.location, range1.length, range2.location, range2.length);
  result.length = v3;
  result.location = v2;
  return result;
}

void NSLog(NSString *format, ...)
{
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x270EF2C08](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x270EF2C28](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x270EF2C38](aSelector);
}

uint64_t SCRCFormattedString()
{
  return MEMORY[0x270F5CC88]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x270EE55F0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
}

int *__error(void)
{
  return (int *)MEMORY[0x270ED7DC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x270ED7E38]();
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x270F76310]();
}

uint64_t archive_error_string()
{
  return MEMORY[0x270F97E58]();
}

uint64_t archive_read_data_block()
{
  return MEMORY[0x270F97E88]();
}

uint64_t archive_read_new()
{
  return MEMORY[0x270F97EF0]();
}

uint64_t archive_read_next_header()
{
  return MEMORY[0x270F97EF8]();
}

uint64_t archive_read_open_filename()
{
  return MEMORY[0x270F97F20]();
}

uint64_t archive_read_support_format_zip()
{
  return MEMORY[0x270F97F78]();
}

void audit_token_to_au32(audit_token_t *atoken, uid_t *auidp, uid_t *euidp, gid_t *egidp, uid_t *ruidp, gid_t *rgidp, pid_t *pidp, au_asid_t *asidp, au_tid_t *tidp)
{
}

kern_return_t bootstrap_check_in(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8768](*(void *)&bp, service_name, sp);
}

kern_return_t bootstrap_look_up(mach_port_t bp, const name_t service_name, mach_port_t *sp)
{
  return MEMORY[0x270ED8770](*(void *)&bp, service_name, sp);
}

void bzero(void *a1, size_t a2)
{
}

speed_t cfgetispeed(const termios *a1)
{
  return MEMORY[0x270ED8E80](a1);
}

speed_t cfgetospeed(const termios *a1)
{
  return MEMORY[0x270ED8E88](a1);
}

void cfmakeraw(termios *a1)
{
}

int cfsetspeed(termios *a1, speed_t a2)
{
  return MEMORY[0x270ED8EA8](a1, a2);
}

int close(int a1)
{
  return MEMORY[0x270ED8F18](*(void *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
}

void dispatch_assert_queue_not_V2(dispatch_queue_t queue)
{
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x270ED9340]();
}

void dispatch_group_enter(dispatch_group_t group)
{
}

void dispatch_group_leave(dispatch_group_t group)
{
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x270ED9378](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x270ED9458](attr, *(void *)&qos_class, *(void *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x270ED9460](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
}

void dispatch_source_cancel(dispatch_source_t source)
{
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x270ED9510](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_handle(dispatch_source_t source)
{
  return MEMORY[0x270ED9528](source);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
}

intptr_t dispatch_source_testcancel(dispatch_source_t source)
{
  return MEMORY[0x270ED9580](source);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x270ED95A8](when, delta);
}

dispatch_time_t dispatch_walltime(const timespec *when, int64_t delta)
{
  return MEMORY[0x270ED95B8](when, delta);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x270ED9620]();
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x270ED9648](__handle, __symbol);
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x270ED98D0](*(void *)&a1, *(void *)&a2);
}

int fprintf(FILE *a1, const char *a2, ...)
{
  return MEMORY[0x270ED9A08](a1, a2);
}

void free(void *a1)
{
}

size_t fwrite(const void *__ptr, size_t __size, size_t __nitems, FILE *__stream)
{
  return MEMORY[0x270ED9B88](__ptr, __size, __nitems, __stream);
}

int ioctl(int a1, unint64_t a2, ...)
{
  return MEMORY[0x270ED9ED8](*(void *)&a1, a2);
}

mach_msg_return_t mach_msg(mach_msg_header_t *msg, mach_msg_option_t option, mach_msg_size_t send_size, mach_msg_size_t rcv_size, mach_port_name_t rcv_name, mach_msg_timeout_t timeout, mach_port_name_t notify)
{
  return MEMORY[0x270EDA190](msg, *(void *)&option, *(void *)&send_size, *(void *)&rcv_size, *(void *)&rcv_name, *(void *)&timeout, *(void *)&notify);
}

void mach_msg_destroy(mach_msg_header_t *a1)
{
}

kern_return_t mach_port_allocate(ipc_space_t task, mach_port_right_t right, mach_port_name_t *name)
{
  return MEMORY[0x270EDA1B0](*(void *)&task, *(void *)&right, name);
}

kern_return_t mach_port_deallocate(ipc_space_t task, mach_port_name_t name)
{
  return MEMORY[0x270EDA1C8](*(void *)&task, *(void *)&name);
}

kern_return_t mach_port_insert_right(ipc_space_t task, mach_port_name_t name, mach_port_t poly, mach_msg_type_name_t polyPoly)
{
  return MEMORY[0x270EDA200](*(void *)&task, *(void *)&name, *(void *)&poly, *(void *)&polyPoly);
}

kern_return_t mach_port_mod_refs(ipc_space_t task, mach_port_name_t name, mach_port_right_t right, mach_port_delta_t delta)
{
  return MEMORY[0x270EDA210](*(void *)&task, *(void *)&name, *(void *)&right, *(void *)&delta);
}

kern_return_t mach_port_request_notification(ipc_space_t task, mach_port_name_t name, mach_msg_id_t msgid, mach_port_mscount_t sync, mach_port_t notify, mach_msg_type_name_t notifyPoly, mach_port_t *previous)
{
  return MEMORY[0x270EDA220](*(void *)&task, *(void *)&name, *(void *)&msgid, *(void *)&sync, *(void *)&notify, *(void *)&notifyPoly, previous);
}

kern_return_t mach_port_set_attributes(ipc_space_t task, mach_port_name_t name, mach_port_flavor_t flavor, mach_port_info_t port_info, mach_msg_type_number_t port_infoCnt)
{
  return MEMORY[0x270EDA228](*(void *)&task, *(void *)&name, *(void *)&flavor, port_info, *(void *)&port_infoCnt);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA390](size, type_id);
}

void *__cdecl malloc_type_realloc(void *ptr, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x270EDA3A0](ptr, size, type_id);
}

int memcmp(const void *__s1, const void *__s2, size_t __n)
{
  return MEMORY[0x270EDA468](__s1, __s2, __n);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x270EDA470](__dst, __src, __n);
}

void mig_dealloc_reply_port(mach_port_t reply_port)
{
}

mach_port_t mig_get_reply_port(void)
{
  return MEMORY[0x270EDA4E8]();
}

void mig_put_reply_port(mach_port_t reply_port)
{
}

void *__cdecl mmap(void *a1, size_t a2, int a3, int a4, int a5, off_t a6)
{
  return (void *)MEMORY[0x270EDA598](a1, a2, *(void *)&a3, *(void *)&a4, *(void *)&a5, a6);
}

int munmap(void *a1, size_t a2)
{
  return MEMORY[0x270EDA5F8](a1, a2);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x270F9A528](a1);
}

id objc_allocWithZone(Class a1)
{
  return (id)MEMORY[0x270F9A538](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x270F9A540]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x270F9A568](a1);
}

{
  MEMORY[0x270F9A570](context);
}

{
  return (void *)MEMORY[0x270F9A588]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A590](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x270F9A598](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x270F9A5A8]();
}

void objc_copyWeak(id *to, id *from)
{
}

void objc_destroyWeak(id *location)
{
}

void objc_end_catch(void)
{
}

void objc_enumerationMutation(id obj)
{
}

void objc_exception_rethrow(void)
{
}

void objc_exception_throw(id exception)
{
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x270F9A678](self, _cmd, offset, atomic);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x270F9A688](location, val);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x270F9A6B0](location);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x270F9A6E8](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x270F9A6F8]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x270F9A700]();
}

uint64_t objc_opt_new()
{
  return MEMORY[0x270F9A710]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x270F9A728]();
}

uint64_t self
{
  return MEMORY[0x270F9A730]();
}

void objc_release(id a1)
{
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x270F9A870](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x270F9A880](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A888](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9A890](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x270F9A898](a1);
}

void objc_setProperty_atomic(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
}

void objc_storeStrong(id *location, id obj)
{
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x270F9A9F8](location, obj);
}

void objc_terminate(void)
{
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x270F9AA38](a1);
}

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x270EDA828](a1, *(void *)&a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x270EDA9A0](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x270EDA9D0](oslog, type);
}

uint64_t os_transaction_create()
{
  return MEMORY[0x270EDAA90]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
}

int proc_pidpath(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x270EDAD88](*(void *)&pid, buffer, *(void *)&buffersize);
}

ssize_t read(int a1, void *a2, size_t a3)
{
  return MEMORY[0x270EDB120](*(void *)&a1, a2, a3);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x270EDB5D8](*(void *)&__errnum);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x270EDB6D8](__str, __endptr, *(void *)&__base);
}

kern_return_t task_get_special_port(task_inspect_t task, int which_port, mach_port_t *special_port)
{
  return MEMORY[0x270EDB850](*(void *)&task, *(void *)&which_port, special_port);
}

int tcdrain(int a1)
{
  return MEMORY[0x270EDB8B8](*(void *)&a1);
}

int tcgetattr(int a1, termios *a2)
{
  return MEMORY[0x270EDB8C8](*(void *)&a1, a2);
}

int tcsetattr(int a1, int a2, const termios *a3)
{
  return MEMORY[0x270EDB8D0](*(void *)&a1, *(void *)&a2, a3);
}

int usleep(useconds_t a1)
{
  return MEMORY[0x270EDB9E8](*(void *)&a1);
}

BOOLean_t voucher_mach_msg_set(mach_msg_header_t *msg)
{
  return MEMORY[0x270EDBAF0](msg);
}