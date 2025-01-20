@interface BKKeyboardHIDEventProcessor
- (BKKeyboardHIDEventProcessor)initWithContext:(id)a3;
- (BKKeyboardHIDEventProcessor)initWithContext:(id)a3 server:(id)a4;
- (BOOL)_lock_anyKeyboardHasCapsLockActive;
- (BOOL)capsLockKeyHasLanguageSwitchLabel;
- (BOOL)isCapsLockLightOn;
- (BOOL)isCapsLockLightOnForSenderID:(unint64_t)a3;
- (BOOL)keyboardWantsStandardTypeOverrideForSenderID:(unint64_t)a3;
- (NSArray)allUsableDeviceProperties;
- (NSSet)keyCommandsToAuthenticate;
- (NSString)debugDescription;
- (NSString)keyboardLayout;
- (id)addGlobalKeyboardObserver:(id)a3;
- (id)devicePropertiesForSenderID:(unint64_t)a3;
- (id)keyboardLanguageForSenderID:(unint64_t)a3;
- (id)setObservingUsableKeyboardConnections:(id)a3;
- (int)_eventSourceForKeyboardInfo:(id)a3 sender:(id)a4;
- (int)eventSourceForSender:(id)a3;
- (int64_t)_lock_activeModifiers;
- (int64_t)activeModifiers;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (int64_t)processEvent:(__IOHIDEvent *)a3 withContext:(id)a4 buffer:(id)a5 sequence:(id)a6 sender:(id)a7 dispatcher:(id)a8 resolution:(id)a9;
- (void)_commonInitWithContext:(id)a3 server:(id)a4;
- (void)_lock_addModifierKeyDown:(id)a3;
- (void)_lock_applyDeliveryInformation:(id)a3 resolution:(id)a4 toEvent:(__IOHIDEvent *)a5;
- (void)_lock_cancelKeyDownEvents:(id)a3;
- (void)_lock_dispatchKeyEvent:(__IOHIDEvent *)a3 keyCommand:(id)a4 keyboardInfo:(id)a5 eventSource:(int)a6 fromSender:(id)a7 dispatcher:(id)a8;
- (void)_lock_handleKeyEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 dispatcher:(id)a5 bypassCapsLockChecks:(BOOL)a6;
- (void)_lock_handleUnicodeEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 dispatcher:(id)a5;
- (void)_lock_keyboardRemoved:(id)a3;
- (void)_lock_keyboardsDetected:(id)a3;
- (void)_lock_postSyntheticCapsLockPressForKeyboard:(id)a3;
- (void)_lock_publishUsableKeyboards:(id)a3 toServiceConnection:(id)a4;
- (void)_lock_publishUsableKeyboardsToServiceConnections;
- (void)_lock_removeCapsLockEntryIfNeeded:(id)a3;
- (void)_lock_removeModifierKeyDown:(id)a3;
- (void)_lock_removeSenderIDFromTracking:(unint64_t)a3;
- (void)_lock_restoreCapsLockStateToKeyboard:(id)a3;
- (void)_lock_setCapsLockActive:(BOOL)a3 onSenderID:(unint64_t)a4;
- (void)_lock_setCapsLockState:(BOOL)a3 forKeyboard:(id)a4;
- (void)_lock_setKeyboardLightsSuspended:(BOOL)a3;
- (void)_lock_setPrimaryKeyboard:(id)a3;
- (void)_lock_smartKeyboardAttachmentStateDidChange:(id)a3;
- (void)_lock_stopWatchingForGestures:(id)a3;
- (void)_lock_updateGlobalModifierState;
- (void)_lock_usableKeyboardAttached:(id)a3;
- (void)_lock_usableKeyboardDetached:(id)a3;
- (void)_lock_watchForGestures:(id)a3;
- (void)_modifierRemappingsDidChange;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)bufferDidEndDraining:(id)a3;
- (void)bufferingDidAddNewBuffers:(id)a3;
- (void)dealloc;
- (void)display:(id)a3 didBecomeBlank:(BOOL)a4;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)postEvent:(__IOHIDEvent *)a3 withContext:(id)a4 toResolution:(id)a5 fromSequence:(id)a6;
- (void)serviceDidDisappear:(id)a3;
- (void)setCapsLockActive:(BOOL)a3 onSenderID:(unint64_t)a4;
- (void)setCapsLockDelayOverride:(double)a3;
- (void)setCapsLockDelayOverride:(double)a3 forSenderID:(unint64_t)a4;
- (void)setCapsLockLightOn:(BOOL)a3;
- (void)setKeyCommandsToAuthenticate:(id)a3;
- (void)setKeyboardLayout:(id)a3;
- (void)setKeyboardLayout:(id)a3 forSenderID:(unint64_t)a4;
- (void)setRomanCapsLockSwitchModeActive:(BOOL)a3;
- (void)setRomanCapsLockSwitchModeActive:(BOOL)a3 forSenderID:(unint64_t)a4;
- (void)setStandardType:(unsigned int)a3 forSenderID:(unint64_t)a4;
- (void)smartKeyboardAttachmentStateDidChange:(id)a3;
@end

@implementation BKKeyboardHIDEventProcessor

- (void)bufferDidEndDraining:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  keyDownToEventSequence = self->_keyDownToEventSequence;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1000532C4;
  v8[3] = &unk_1000F7028;
  id v9 = v4;
  id v7 = v4;
  [(NSMutableDictionary *)keyDownToEventSequence enumerateKeysAndObjectsUsingBlock:v8];
  os_unfair_lock_unlock(p_lock);
}

- (void)bufferingDidAddNewBuffers:(id)a3
{
  id v4 = a3;
  os_unfair_lock_lock(&self->_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  v5 = self->_downModifierKeys;
  id v6 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v12;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v5);
        }
        v10 = -[NSMutableDictionary objectForKey:](self->_keyDownToEventSequence, "objectForKey:", *(void *)(*((void *)&v11 + 1) + 8 * (void)v9), (void)v11);
        [v10 repostFirstEventToBufferedTargets:v4];

        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v7 = [(NSMutableSet *)v5 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }

  os_unfair_lock_unlock(&self->_lock);
}

- (id)setObservingUsableKeyboardConnections:(id)a3
{
  id v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(BKHIDDomainServiceServer *)self->_server currentConnection];
  id v7 = [(BKHIDDomainServiceServer *)self->_server userInfoForConnection:v6];
  unsigned int v8 = [v4 BOOLValue];
  if (v8 == [v7 BOOLValue]
    || ([(BKHIDDomainServiceServer *)self->_server setUserInfo:v4 forConnection:v6], !v8))
  {
    id v9 = 0;
  }
  else
  {
    id v9 = [(NSMutableArray *)self->_usableKeyboards bs_map:&stru_1000F7068];
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downModifierKeys, 0);
  objc_storeStrong((id *)&self->_primaryKeyboardInfo, 0);
  objc_storeStrong((id *)&self->_displayController, 0);
  objc_storeStrong((id *)&self->_eventProcessorRegistry, 0);
  objc_storeStrong((id *)&self->_eventDispatcher, 0);
  objc_storeStrong((id *)&self->_eventSystemInterface, 0);
  objc_storeStrong((id *)&self->_keyboardServiceMatcher, 0);
  objc_storeStrong((id *)&self->_productIdentifierWithCapsLockActiveToGeneration, 0);
  objc_storeStrong((id *)&self->_senderIDsWithModifiersOnly, 0);
  objc_storeStrong((id *)&self->_senderIDToKeysDown, 0);
  objc_storeStrong((id *)&self->_keyDownToEventSequence, 0);
  objc_storeStrong((id *)&self->_displayBlankingObservationAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardObserverAssertion, 0);
  objc_storeStrong((id *)&self->_keyboardLayout, 0);
  objc_storeStrong((id *)&self->_keyCommandsToAuthenticate, 0);
  objc_storeStrong((id *)&self->_eventRecognizers, 0);
  objc_storeStrong((id *)&self->_usableKeyboards, 0);
  objc_storeStrong((id *)&self->_allKeyboardsBySenderID, 0);

  objc_storeStrong((id *)&self->_server, 0);
}

- (void)appendDescriptionToFormatter:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  id v6 = [v5 appendObject:self->_keyboardLayout withName:@"keyboardLayout"];
  id v7 = [v5 appendObject:self->_primaryKeyboardInfo withName:@"primaryKeyboard"];
  id v8 = [v5 appendObject:self->_usableKeyboards withName:@"usableKeyboards"];
  id v9 = [v5 appendBool:self->_countOfKeyboardsRequiringAllSmartCoverHESDisengagedForOpen > 0 withName:@"StrictWakeHallEffectSensors"];
  id v10 = [v5 appendObject:self->_keyDownToEventSequence withName:@"keyDownToEventSequence"];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100052B90;
  v11[3] = &unk_1000F8BE0;
  v11[4] = self;
  [v5 appendCustomFormatWithName:@"globalActiveModifiers" block:v11];

  os_unfair_lock_unlock(p_lock);
}

- (void)serviceDidDisappear:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  [(BKKeyboardHIDEventProcessor *)self _lock_keyboardRemoved:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v5 = a4;
  [v5 bs_compactMap:&stru_1000F7048];
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  id v6 = [(BKHIDSystemInterfacing *)self->_eventSystemInterface senderCache];
  [v6 addSenderInfo:v5];

  [(BKKeyboardHIDEventProcessor *)self _lock_keyboardsDetected:v7];
  os_unfair_lock_unlock(&self->_lock);
}

- (void)display:(id)a3 didBecomeBlank:(BOOL)a4
{
  BOOL v4 = a4;
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(BKKeyboardHIDEventProcessor *)self _lock_setKeyboardLightsSuspended:v4];

  os_unfair_lock_unlock(p_lock);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 withContext:(id)a4 buffer:(id)a5 sequence:(id)a6 sender:(id)a7 dispatcher:(id)a8 resolution:(id)a9
{
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a9;
  v17 = *a3;
  int Type = IOHIDEventGetType();
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (Type == 30)
  {
    uint64_t v19 = 1;
  }
  else if (IOHIDEventGetIntegerValue())
  {
    uint64_t v19 = 1;
  }
  else
  {
    uint64_t v19 = 3;
  }
  [v15 postEvent:v17 position:v19 additionalContext:v13 fromBuffer:v14 toResolution:v16];
  os_unfair_lock_unlock(&self->_lock);

  return 1;
}

- (void)postEvent:(__IOHIDEvent *)a3 withContext:(id)a4 toResolution:(id)a5 fromSequence:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  Copy = (const void *)IOHIDEventCreateCopy();
  id v14 = [v11 display];
  id v15 = [v14 _hardwareIdentifier];
  _BKHIDNoteUserEventOccurredOnDisplay();

  id v16 = v10;
  if (!v16)
  {
    v26 = (objc_class *)objc_opt_class();
    v27 = NSStringFromClass(v26);
    v28 = +[NSString stringWithFormat:@"Value for '%@' was unexpectedly nil. Expected %@.", @"extras", v27];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v29 = NSStringFromSelector(a2);
      v30 = (objc_class *)objc_opt_class();
      v31 = NSStringFromClass(v30);
      *(_DWORD *)buf = 138544642;
      v41 = v29;
      __int16 v42 = 2114;
      v43 = v31;
      __int16 v44 = 2048;
      v45 = self;
      __int16 v46 = 2114;
      CFStringRef v47 = @"BKKeyboardHIDEventProcessor.m";
      __int16 v48 = 1024;
      int v49 = 1382;
      __int16 v50 = 2114;
      v51 = v28;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v28 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100053774);
  }
  v17 = v16;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    v32 = (objc_class *)[v17 classForCoder];
    if (!v32) {
      v32 = (objc_class *)objc_opt_class();
    }
    v33 = NSStringFromClass(v32);
    v34 = (objc_class *)objc_opt_class();
    v35 = NSStringFromClass(v34);
    v36 = +[NSString stringWithFormat:@"Value for '%@' was of unexpected class %@. Expected %@.", @"extras", v33, v35];

    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      v37 = NSStringFromSelector(a2);
      v38 = (objc_class *)objc_opt_class();
      v39 = NSStringFromClass(v38);
      *(_DWORD *)buf = 138544642;
      v41 = v37;
      __int16 v42 = 2114;
      v43 = v39;
      __int16 v44 = 2048;
      v45 = self;
      __int16 v46 = 2114;
      CFStringRef v47 = @"BKKeyboardHIDEventProcessor.m";
      __int16 v48 = 1024;
      int v49 = 1382;
      __int16 v50 = 2114;
      v51 = v36;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v36 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x1000538B0);
  }

  [(BKKeyboardHIDEventProcessor *)self _lock_applyDeliveryInformation:v17 resolution:v11 toEvent:Copy];
  uint64_t IntegerValue = (unsigned __int16)IOHIDEventGetIntegerValue();
  if (+[BKSHIDEventKeyCommand _isModifierKeyWithPage:IntegerValue usage:(unsigned __int16)IOHIDEventGetIntegerValue()])
  {
    uint64_t v19 = BKLogKeyboard();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = BKSHIDEventGetConciseDescription();
      v21 = +[BSDescriptionStream descriptionForRootObject:v11];
      *(_DWORD *)buf = 138543618;
      v41 = v20;
      __int16 v42 = 2114;
      v43 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "%{public}@ -> %{public}@", buf, 0x16u);
    }
  }
  v22 = sub_10005FF04();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    v24 = BKSHIDEventGetConciseDescription();
    v25 = +[BSDescriptionStream descriptionForRootObject:v11];
    *(_DWORD *)buf = 138543618;
    v41 = v24;
    __int16 v42 = 2114;
    v43 = v25;
    _os_log_debug_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "%{public}@ -> %{public}@", buf, 0x16u);
  }
  v23 = [v12 dispatcher];
  [v23 postEvent:Copy toDestination:v11];

  CFRelease(Copy);
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = *a3;
  int Type = IOHIDEventGetType();
  p_lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (Type == 30)
  {
    [(BKKeyboardHIDEventProcessor *)self _lock_handleUnicodeEvent:v10 fromSender:v8 dispatcher:v9];
  }
  else
  {
    uint64_t IntegerValue = (unsigned __int16)IOHIDEventGetIntegerValue();
    uint64_t v14 = (unsigned __int16)IOHIDEventGetIntegerValue();
    if ((IntegerValue != 7 || v14 == 102) && !GSKeyboardIsGlobeKeyUsagePair())
    {
      int64_t v15 = 0;
      goto LABEL_8;
    }
    [(BKKeyboardHIDEventProcessor *)self _lock_handleKeyEvent:v10 fromSender:v8 dispatcher:v9 bypassCapsLockChecks:0];
    [(BKKeyboardHIDEventProcessor *)self _lock_updateGlobalModifierState];
  }
  int64_t v15 = 1;
LABEL_8:
  os_unfair_lock_unlock(p_lock);

  return v15;
}

- (void)_modifierRemappingsDidChange
{
  os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  v3 = BKLogKeyboard();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "_modifierRemappingsDidChange", buf, 2u);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  BOOL v4 = self->_usableKeyboards;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        if (v9 && *(unsigned char *)(v9 + 8) && (sub_100081990(*(void *)(*((void *)&v14 + 1) + 8 * i)) & 1) == 0)
        {
          id v10 = BKLogKeyboard();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            id v11 = *(id *)(v9 + 24);
            id v12 = [v11 senderID];
            *(_DWORD *)buf = 134217984;
            id v19 = v12;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_modifierRemappingsDidChange: [senderID %llX] capslock unmapped", buf, 0xCu);
          }
          [(BKKeyboardHIDEventProcessor *)self _lock_postSyntheticCapsLockPressForKeyboard:v9];
        }
      }
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v14 objects:v20 count:16];
    }
    while (v6);
  }

  os_unfair_lock_unlock(lock);
}

- (void)_lock_setCapsLockActive:(BOOL)a3 onSenderID:(unint64_t)a4
{
  BOOL v5 = a3;
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  id v8 = +[NSNumber numberWithUnsignedLongLong:a4];
  uint64_t v9 = [(NSMutableDictionary *)allKeyboardsBySenderID objectForKey:v8];

  if (v9)
  {
    if (v9[9])
    {
      id v10 = BKLogKeyboard();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v16 = 134217984;
        unint64_t v17 = a4;
        id v11 = "setCapsLockActive: [senderID %llX] the caps lock key is a language switch -- you cannot modify caps lock state";
LABEL_16:
        _os_log_error_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_ERROR, v11, (uint8_t *)&v16, 0xCu);
      }
    }
    else if (sub_100081990((uint64_t)v9))
    {
      id v12 = @"off";
      if (v5) {
        id v12 = @"active";
      }
      id v10 = v12;
      char v13 = (v9[8] != 0) ^ v5;
      long long v14 = BKLogKeyboard();
      BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
      if (v13)
      {
        if (v15)
        {
          int v16 = 134218242;
          unint64_t v17 = a4;
          __int16 v18 = 2114;
          id v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "setCapsLockActive: [senderID %llX] set caps lock to %{public}@", (uint8_t *)&v16, 0x16u);
        }

        [(BKKeyboardHIDEventProcessor *)self _lock_postSyntheticCapsLockPressForKeyboard:v9];
      }
      else
      {
        if (v15)
        {
          int v16 = 134218242;
          unint64_t v17 = a4;
          __int16 v18 = 2114;
          id v19 = v10;
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "setCapsLockActive: [senderID %llX] caps lock is already %{public}@", (uint8_t *)&v16, 0x16u);
        }
      }
    }
    else
    {
      id v10 = BKLogKeyboard();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      {
        int v16 = 134217984;
        unint64_t v17 = a4;
        id v11 = "setCapsLockActive: [senderID %llX] the capslock key on this keyboard has been remapped and there are no ke"
              "ys mapped to capslock";
        goto LABEL_16;
      }
    }
  }
  else
  {
    id v10 = BKLogKeyboard();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      int v16 = 134217984;
      unint64_t v17 = a4;
      id v11 = "setCapsLockActive: [senderID %llX] no such keyboard";
      goto LABEL_16;
    }
  }
}

- (void)_lock_setCapsLockState:(BOOL)a3 forKeyboard:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  id v11 = v6;
  if (v6 && *((unsigned char *)v6 + 8) != v4)
  {
    *((unsigned char *)v6 + 8) = v4;
    [*((id *)v6 + 3) setElementValue:v4 forUsagePage:8 usage:2];
    id v6 = v11;
  }
  uint64_t v7 = sub_100081F08(v6);
  if (v7)
  {
    productIdentifierWithCapsLockActiveToGeneration = self->_productIdentifierWithCapsLockActiveToGeneration;
    if (v4)
    {
      if (v11) {
        uint64_t v9 = v11[11];
      }
      else {
        uint64_t v9 = 0;
      }
      id v10 = +[NSNumber numberWithInteger:v9];
      [(NSMutableDictionary *)productIdentifierWithCapsLockActiveToGeneration setObject:v10 forKey:v7];
    }
    else
    {
      [(NSMutableDictionary *)productIdentifierWithCapsLockActiveToGeneration removeObjectForKey:v7];
    }
  }
}

- (void)_lock_postSyntheticCapsLockPressForKeyboard:(id)a3
{
  if (a3) {
    BOOL v4 = (void *)*((void *)a3 + 3);
  }
  else {
    BOOL v4 = 0;
  }
  id v8 = v4;
  [v8 senderID];
  mach_absolute_time();
  KeyboardEvent = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetSenderID();
  mach_absolute_time();
  id v6 = (const void *)IOHIDEventCreateKeyboardEvent();
  IOHIDEventSetSenderID();
  uint64_t v7 = self->_eventDispatcher;
  [(BKKeyboardHIDEventProcessor *)self _lock_handleKeyEvent:KeyboardEvent fromSender:v8 dispatcher:v7 bypassCapsLockChecks:1];
  [(BKKeyboardHIDEventProcessor *)self _lock_handleKeyEvent:v6 fromSender:v8 dispatcher:v7 bypassCapsLockChecks:1];

  CFRelease(KeyboardEvent);
  CFRelease(v6);
}

- (void)_lock_smartKeyboardAttachmentStateDidChange:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  BOOL v5 = BKLogKeyboard();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "smartKeyboardAttachmentStateDidChange:%{public}@", (uint8_t *)&v6, 0xCu);
  }

  if (sub_100081B28((uint64_t)v4))
  {
    [(BKKeyboardHIDEventProcessor *)self _lock_usableKeyboardAttached:v4];
  }
  else
  {
    [(BKKeyboardHIDEventProcessor *)self _lock_cancelKeyDownEvents:v4];
    [(BKKeyboardHIDEventProcessor *)self _lock_usableKeyboardDetached:v4];
  }
}

- (void)smartKeyboardAttachmentStateDidChange:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  [(BKKeyboardHIDEventProcessor *)self _lock_smartKeyboardAttachmentStateDidChange:v5];

  os_unfair_lock_unlock(p_lock);
}

- (void)_lock_stopWatchingForGestures:(id)a3
{
  if (a3)
  {
    id v4 = *((id *)a3 + 12);
    if (v4)
    {
      id v7 = v4;
      [(NSMutableArray *)self->_eventRecognizers removeObject:v4];
      id v5 = +[BKHIDEventProcessorRegistry sharedInstance];
      int v6 = [v5 eventProcessorOfClass:objc_opt_class()];

      [v6 removeRecognizer:v7];
      id v4 = v7;
    }
  }
  else
  {
    id v4 = 0;
  }
}

- (void)_lock_watchForGestures:(id)a3
{
  id v4 = (id *)a3;
  id v5 = v4;
  if (v4 && *((unsigned char *)v4 + 14))
  {
    id v6 = v4[13];
    if (v6)
    {
      id v7 = v6;
LABEL_20:
      v23 = +[BKHIDEventSequenceRecognizer recognizerForEventDescriptor:v7];
      [v23 setShouldConsumeEvents:1];
      objc_storeStrong(v5 + 12, v23);
      [(NSMutableArray *)self->_eventRecognizers addObject:v23];
      v24 = +[BKHIDEventProcessorRegistry sharedInstance];
      v25 = [v24 eventProcessorOfClass:objc_opt_class()];

      objc_initWeak(&location, self);
      objc_initWeak(&from, v5);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_1000545C4;
      v26[3] = &unk_1000F7000;
      objc_copyWeak(&v27, &from);
      objc_copyWeak(&v28, &location);
      [v25 addRecognizer:v23 recognitionBlock:v26];
      objc_destroyWeak(&v28);
      objc_destroyWeak(&v27);
      objc_destroyWeak(&from);
      objc_destroyWeak(&location);

      goto LABEL_21;
    }
    id v8 = [v4[3] propertyForKey:@"KeyboardEnabledEvent"];
    uint64_t v9 = objc_opt_class();
    id v10 = v8;
    if (v9)
    {
      if (objc_opt_isKindOfClass()) {
        id v11 = v10;
      }
      else {
        id v11 = 0;
      }
    }
    else
    {
      id v11 = 0;
    }
    id v12 = v11;

    char v13 = [v12 objectForKeyedSubscript:@"EventType"];
    long long v14 = [v12 objectForKeyedSubscript:@"UsagePage"];
    BOOL v15 = [v12 objectForKeyedSubscript:@"Usage"];

    if (v13 && v14 && v15)
    {
      unsigned __int16 v16 = (unsigned __int16)[v14 unsignedIntegerValue];
      unsigned __int16 v17 = (unsigned __int16)[v15 unsignedIntegerValue];
      id v18 = [v13 unsignedIntegerValue];
      id v19 = +[BKSHIDEventUsagePairDescriptor descriptorForHIDEventType:v18 page:v16 usage:v17];
      if (v19)
      {
        uint64_t v20 = [v19 descriptorByAddingSenderIDToMatchCriteria:[v5[3] senderID]];
        id v21 = v5[13];
        v5[13] = (id)v20;
      }
      else
      {
        v22 = sub_10005FC4C();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
        {
          LODWORD(location) = 67109378;
          HIDWORD(location) = v18;
          __int16 v31 = 2114;
          uint64_t Name = IOHIDEventTypeGetName();
          _os_log_error_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "keyboardActivationChangeEventDescriptor: unsupported KeyboardEnabledEvent:EventType %d (%{public}@)", (uint8_t *)&location, 0x12u);
        }
      }
    }

    id v7 = v5[13];
    if (v7) {
      goto LABEL_20;
    }
  }
LABEL_21:
}

- (void)_lock_handleKeyEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 dispatcher:(id)a5 bypassCapsLockChecks:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  os_unfair_lock_assert_owner(&self->_lock);
  id v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 senderID]);
  char v13 = [(NSMutableDictionary *)self->_allKeyboardsBySenderID objectForKeyedSubscript:v12];
  primaryKeyboardInfo = v13;
  if (!v13) {
    primaryKeyboardInfo = self->_primaryKeyboardInfo;
  }
  BOOL v15 = primaryKeyboardInfo;

  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v17 = IOHIDEventGetIntegerValue();
  uint64_t v18 = [(BKKeyboardHIDEventProcessor *)self _eventSourceForKeyboardInfo:v15 sender:v10];
  if (IntegerValue == 57 && v17)
  {
    if (a6) {
      goto LABEL_6;
    }
    if (v15 && v15->_capsLockRomanSwitchMode)
    {
      v24 = v15;
      goto LABEL_10;
    }
    if (sub_100081990((uint64_t)v15))
    {
LABEL_6:
      if (v15) {
        BOOL v19 = !v15->_capsLockOn;
      }
      else {
        BOOL v19 = 1;
      }
      [(BKKeyboardHIDEventProcessor *)self _lock_setCapsLockState:v19 forKeyboard:v15];
    }
  }
  if (v15)
  {
LABEL_10:
    gsKeyboard = v15->_gsKeyboard;
    goto LABEL_11;
  }
  gsKeyboard = 0;
LABEL_11:
  if (+[BKSHIDEventKeyCommand _shouldMatchKeyCommandsForEvent:a3 gsKeyboard:gsKeyboard])
  {
    int64_t v25 = 0;
    id v21 = +[BKSHIDEventKeyCommand keyCommandForEvent:a3 gsKeyboard:gsKeyboard activeModifiers:&v25];
    if (v15) {
      v15->_activeModifiers = v25;
    }
  }
  else
  {
    id v21 = 0;
  }

  [(BKKeyboardHIDEventProcessor *)self _lock_dispatchKeyEvent:a3 keyCommand:v21 keyboardInfo:v15 eventSource:v18 fromSender:v10 dispatcher:v11];
  v22 = [(NSMutableDictionary *)self->_senderIDToKeysDown objectForKey:v12];
  id v23 = [v22 count];

  if (!v23) {
    [(NSMutableSet *)self->_senderIDsWithModifiersOnly removeObject:v12];
  }
}

- (void)_lock_dispatchKeyEvent:(__IOHIDEvent *)a3 keyCommand:(id)a4 keyboardInfo:(id)a5 eventSource:(int)a6 fromSender:(id)a7 dispatcher:(id)a8
{
  id v50 = a4;
  v53 = a5;
  id v13 = a7;
  id v52 = a8;
  uint64_t v54 = [(BKHIDSystemInterfacing *)self->_eventSystemInterface deliveryManager];
  uint64_t IntegerValue = IOHIDEventGetIntegerValue();
  uint64_t v15 = IOHIDEventGetIntegerValue();
  v57 = a3;
  uint64_t v16 = IOHIDEventGetIntegerValue();
  v58 = v13;
  id v17 = [v13 senderID];
  uint64_t v18 = +[NSNumber numberWithUnsignedLongLong:v17];
  self;
  BOOL v19 = objc_alloc_init(_BKKeyDownKey);
  v19->_senderID = (unint64_t)v17;
  v19->_page = IntegerValue;
  v19->_usage = v15;
  uint64_t v20 = v19;
  uint64_t v55 = -[NSMutableDictionary objectForKey:](self->_keyDownToEventSequence, "objectForKey:");
  id v21 = [(NSMutableDictionary *)self->_senderIDToKeysDown objectForKey:v18];
  uint64_t v59 = v16;
  if (!+[BKSHIDEventKeyCommand _isModifierKeyWithPage:IntegerValue usage:v15])
  {
    v22 = self;
    id v23 = (void *)v18;
    [(NSMutableSet *)self->_senderIDsWithModifiersOnly removeObject:v18];
    int64_t v25 = v50;
    v24 = v52;
    id v27 = v53;
    v26 = (void *)v54;
    if (v16) {
      goto LABEL_7;
    }
LABEL_11:
    v51 = v21;
    [v21 removeObject:v20];
    id v28 = v57;
    goto LABEL_12;
  }
  v22 = self;
  id v23 = (void *)v18;
  if (![v21 count]) {
    [(NSMutableSet *)self->_senderIDsWithModifiersOnly addObject:v18];
  }
  int64_t v25 = v50;
  v24 = v52;
  v26 = (void *)v54;
  if (!v16)
  {
    [(BKKeyboardHIDEventProcessor *)self _lock_removeModifierKeyDown:v20];
    id v27 = v53;
    goto LABEL_11;
  }
  [(BKKeyboardHIDEventProcessor *)self _lock_addModifierKeyDown:v20];
  id v27 = v53;
LABEL_7:
  id v28 = v57;
  if (!v21)
  {
    id v21 = objc_alloc_init((Class)NSMutableSet);
    [(NSMutableDictionary *)v22->_senderIDToKeysDown setObject:v21 forKey:v23];
  }
  v51 = v21;
  [v21 addObject:v20];
LABEL_12:
  v29 = (void *)v55;
  v30 = objc_alloc_init(_BKKeyboardEventExtras);
  __int16 v31 = v30;
  if (v30)
  {
    v30->_eventSource = a6;
    v30->_modifiersOnly = [(NSMutableSet *)v22->_senderIDsWithModifiersOnly containsObject:v23];
    if (!v27) {
      goto LABEL_17;
    }
  }
  else
  {
    [(NSMutableSet *)v22->_senderIDsWithModifiersOnly containsObject:v23];
    if (!v27) {
      goto LABEL_17;
    }
  }
  if (v27[10])
  {
    unsigned int ModifierState = GSKeyboardGetModifierState();
    if (v31) {
      v31->_GSunsigned int ModifierState = ModifierState;
    }
  }
LABEL_17:
  if (v55)
  {
    if (v59) {
      uint64_t v33 = 2;
    }
    else {
      uint64_t v33 = 3;
    }
    goto LABEL_47;
  }
  if (v59)
  {
    if (!v25) {
      goto LABEL_37;
    }
  }
  else
  {
    v34 = BKLogKeyboard();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138543362;
      v66 = v20;
      _os_log_error_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "missing a sequence for %{public}@", buf, 0xCu);
    }

    id v28 = v57;
    if (!v25) {
      goto LABEL_37;
    }
  }
  uint64_t v35 = [v26 sequenceForKeyCommand:v25 sender:v58 processor:v22 dispatcher:v24 additionalContext:v31];
  if (v35)
  {
    v29 = (void *)v35;
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    v36 = v22->_keyCommandsToAuthenticate;
    id v37 = [(NSMutableSet *)v36 countByEnumeratingWithState:&v60 objects:v64 count:16];
    if (v37)
    {
      id v38 = v37;
      CFStringRef v47 = v20;
      int v49 = v23;
      v56 = v29;
      v39 = v25;
      uint64_t v40 = *(void *)v61;
      while (2)
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v61 != v40) {
            objc_enumerationMutation(v36);
          }
          __int16 v42 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          v43 = [v42 keyCommand:v47];
          if ([v43 describes:v39] == (id)3)
          {
            if (v31) {
              objc_storeStrong((id *)&v31->_authenticationSpecification, v42);
            }

            goto LABEL_41;
          }
        }
        id v38 = [(NSMutableSet *)v36 countByEnumeratingWithState:&v60 objects:v64 count:16];
        if (v38) {
          continue;
        }
        break;
      }
LABEL_41:

      int64_t v25 = v39;
      v24 = v52;
      id v27 = v53;
      v26 = (void *)v54;
      v29 = v56;
      uint64_t v20 = v47;
      id v23 = v49;
    }
    else
    {

      v26 = (void *)v54;
    }
    id v28 = v57;
    goto LABEL_44;
  }
LABEL_37:
  v29 = [v26 sequenceForFirstEvent:v28 sender:v58 processor:v22 dispatcher:v24 additionalContext:v31];
LABEL_44:
  [(NSMutableDictionary *)v22->_keyDownToEventSequence setObject:v29 forKey:v20];
  if (v59) {
    uint64_t v33 = 1;
  }
  else {
    uint64_t v33 = 3;
  }
LABEL_47:
  [v29 postEvent:v28 position:v33 additionalContext:v31];
  if (v29 && !v59) {
    [(NSMutableDictionary *)v22->_keyDownToEventSequence removeObjectForKey:v20];
  }
  __int16 v44 = sub_10005FF04();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
  {
    +[BSDescriptionStream descriptionForRootObject:v22->_keyDownToEventSequence];
    v45 = v23;
    __int16 v46 = (_BKKeyDownKey *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543362;
    v66 = v46;
    _os_log_debug_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEBUG, "keys down: %{public}@", buf, 0xCu);

    id v23 = v45;
  }
}

- (void)_lock_applyDeliveryInformation:(id)a3 resolution:(id)a4 toEvent:(__IOHIDEvent *)a5
{
  id v7 = (unsigned int *)a3;
  id v8 = a4;
  uint64_t v9 = +[BKSHIDEventKeyboardAttributes baseAttributesFromProvider:v8];
  id v10 = [(BKHIDSystemInterfacing *)self->_eventSystemInterface deliveryManager];
  id v11 = [v10 authenticationOriginator];
  if (v7)
  {
    if (*((unsigned char *)v7 + 8)) {
      [v9 setOptions:128];
    }
    [v9 setSource:v7[3]];
    [v9 setGSModifierState:v7[4]];
    id v12 = *((id *)v7 + 3);
    if (v12 && IOHIDEventGetIntegerValue())
    {
      id v13 = [v12 context];
      long long v14 = [(BKHIDSystemInterfacing *)self->_eventSystemInterface clientConnectionManager];
      id v15 = [v14 versionedPIDForPID:[v8 pid]];

      if (v15 == (id)-1)
      {
        uint64_t v16 = BKLogKeyboard();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 138543362;
          BOOL v19 = v7;
          _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "invalid audit token for destination:%{public}@", buf, 0xCu);
        }
      }
      else
      {
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_100054FFC;
        v17[3] = &unk_1000F6FD8;
        v17[4] = v13;
        v17[5] = v15;
        uint64_t v16 = [v11 buildMessage:v17];
        [v9 setAuthenticationMessage:v16];
      }
    }
  }
  else
  {
    [v9 setSource:0];
    [v9 setGSModifierState:0];
    id v12 = 0;
  }
  BKSHIDEventSetAttributes();
}

- (void)_lock_handleUnicodeEvent:(__IOHIDEvent *)a3 fromSender:(id)a4 dispatcher:(id)a5
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v9 = a5;
  id v10 = a4;
  os_unfair_lock_assert_owner(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  id v12 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v10 senderID]);
  id v17 = [(NSMutableDictionary *)allKeyboardsBySenderID objectForKeyedSubscript:v12];

  id v13 = [(BKHIDSystemInterfacing *)self->_eventSystemInterface deliveryManager];
  long long v14 = objc_alloc_init(_BKKeyboardEventExtras);
  unsigned int v15 = [(BKKeyboardHIDEventProcessor *)self _eventSourceForKeyboardInfo:v17 sender:v10];
  if (v14) {
    v14->_eventSource = v15;
  }
  uint64_t v16 = [v13 sequenceForFirstEvent:a3 sender:v10 processor:self dispatcher:v9 additionalContext:v14];

  [v16 postEvent:a3 position:1 additionalContext:v14];
}

- (int)_eventSourceForKeyboardInfo:(id)a3 sender:(id)a4
{
  if (a3)
  {
    if ([a4 isAuthenticated]) {
      return 3;
    }
    else {
      return 1;
    }
  }
  else
  {
    return [a4 eventSource];
  }
}

- (void)_lock_cancelKeyDownEvents:(id)a3
{
  uint64_t v4 = a3;
  uint64_t v5 = mach_absolute_time();
  if (v4) {
    id v6 = (void *)v4[3];
  }
  else {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = [v7 senderID];
  keyDownToEventSequence = self->_keyDownToEventSequence;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_1000552C0;
  v10[3] = &unk_1000F6FB8;
  v10[4] = v8;
  v10[5] = v5;
  [(NSMutableDictionary *)keyDownToEventSequence enumerateKeysAndObjectsUsingBlock:v10];
  [(BKKeyboardHIDEventProcessor *)self _lock_removeSenderIDFromTracking:v8];
}

- (void)_lock_usableKeyboardDetached:(id)a3
{
  uint64_t v4 = (id *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  [(BKKeyboardHIDEventProcessor *)self _lock_removeCapsLockEntryIfNeeded:v4];
  if ([(NSMutableArray *)self->_usableKeyboards containsObject:v4])
  {
    uint64_t v5 = BKLogKeyboard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v9 = 138543362;
      id v10 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Usable keyboard detached: %{public}@", (uint8_t *)&v9, 0xCu);
    }

    [(NSMutableArray *)self->_usableKeyboards removeObject:v4];
    if (v4) {
      id v6 = v4[3];
    }
    else {
      id v6 = 0;
    }
    id v7 = v6;
    -[BKKeyboardHIDEventProcessor _lock_removeSenderIDFromTracking:](self, "_lock_removeSenderIDFromTracking:", [v7 senderID]);

    if ([(BKKeyboardInfo *)self->_primaryKeyboardInfo isEqual:v4])
    {
      [(BKKeyboardHIDEventProcessor *)self _lock_setPrimaryKeyboard:0];
      if ([(NSMutableArray *)self->_usableKeyboards count])
      {
        id v8 = [(NSMutableArray *)self->_usableKeyboards firstObject];
        [(BKKeyboardHIDEventProcessor *)self _lock_setPrimaryKeyboard:v8];
      }
    }
    [(BKKeyboardHIDEventProcessor *)self _lock_publishUsableKeyboardsToServiceConnections];
    if (v4 && *((unsigned char *)v4 + 14))
    {
      [v4[3] setElementValue:0 forUsagePage:8 usage:2];
      BKLogEvent();
    }
  }
}

- (void)_lock_removeCapsLockEntryIfNeeded:(id)a3
{
  uint64_t v4 = sub_100081F08(a3);
  if (v4)
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_productIdentifierWithCapsLockActiveToGeneration objectForKeyedSubscript:v4];
    id v6 = [v5 integerValue];

    if (v6)
    {
      dispatch_time_t v7 = dispatch_time(0, 30000000000);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100055628;
      block[3] = &unk_1000F7868;
      block[4] = self;
      id v9 = v4;
      id v10 = v6;
      dispatch_after(v7, (dispatch_queue_t)&_dispatch_main_q, block);
    }
  }
}

- (void)_lock_removeSenderIDFromTracking:(unint64_t)a3
{
  uint64_t v5 = [(NSMutableDictionary *)self->_keyDownToEventSequence allKeys];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      id v9 = 0;
      do
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v26 + 1) + 8 * (void)v9);
        if (v10) {
          uint64_t v11 = *(void *)(v10 + 8);
        }
        else {
          uint64_t v11 = 0;
        }
        if (v11 == a3) {
          -[NSMutableDictionary removeObjectForKey:](self->_keyDownToEventSequence, "removeObjectForKey:");
        }
        id v9 = (char *)v9 + 1;
      }
      while (v7 != v9);
      id v12 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
      id v7 = v12;
    }
    while (v12);
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v13 = [(NSMutableSet *)self->_downModifierKeys copy];
  id v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v14)
  {
    id v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      id v17 = 0;
      do
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * (void)v17);
        if (v18) {
          uint64_t v19 = *(void *)(v18 + 8);
        }
        else {
          uint64_t v19 = 0;
        }
        if (v19 == a3) {
          -[BKKeyboardHIDEventProcessor _lock_removeModifierKeyDown:](self, "_lock_removeModifierKeyDown:");
        }
        id v17 = (char *)v17 + 1;
      }
      while (v15 != v17);
      id v20 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
      id v15 = v20;
    }
    while (v20);
  }

  id v21 = +[NSNumber numberWithUnsignedLongLong:a3];
  [(NSMutableSet *)self->_senderIDsWithModifiersOnly removeObject:v21];
  [(NSMutableDictionary *)self->_senderIDToKeysDown removeObjectForKey:v21];
}

- (void)_lock_removeModifierKeyDown:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10005FF04();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "modifier key up: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(NSMutableSet *)self->_downModifierKeys removeObject:v4];
}

- (void)_lock_addModifierKeyDown:(id)a3
{
  id v4 = a3;
  uint64_t v5 = sub_10005FF04();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    int v6 = 138543362;
    id v7 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "modifier key down: %{public}@", (uint8_t *)&v6, 0xCu);
  }

  [(NSMutableSet *)self->_downModifierKeys addObject:v4];
}

- (void)_lock_usableKeyboardAttached:(id)a3
{
  id v4 = a3;
  if (([(NSMutableArray *)self->_usableKeyboards containsObject:v4] & 1) == 0)
  {
    uint64_t v5 = BKLogKeyboard();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138543362;
      uint64_t v11 = v4;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Usable keyboard attached: %{public}@", (uint8_t *)&v10, 0xCu);
    }

    int64_t keyboardGeneration = self->_keyboardGeneration;
    if (keyboardGeneration >= 0) {
      int64_t v7 = keyboardGeneration + 1;
    }
    else {
      int64_t v7 = 1;
    }
    self->_int64_t keyboardGeneration = v7;
    if (v4) {
      v4[11] = v7;
    }
    [(NSMutableArray *)self->_usableKeyboards addObject:v4];
    if (!self->_primaryKeyboardInfo) {
      [(BKKeyboardHIDEventProcessor *)self _lock_setPrimaryKeyboard:v4];
    }
    if (self->_keyboardLayout)
    {
      uint64_t v8 = v4 ? (void *)v4[6] : 0;
      id v9 = v8;

      if (!v9) {
        sub_100081BE0((uint64_t)v4, self->_keyboardLayout);
      }
    }
    [(BKKeyboardHIDEventProcessor *)self _lock_restoreCapsLockStateToKeyboard:v4];
    [(BKKeyboardHIDEventProcessor *)self _lock_publishUsableKeyboardsToServiceConnections];
    if (v4 && *((unsigned char *)v4 + 14)) {
      BKLogEvent();
    }
  }
}

- (void)_lock_publishUsableKeyboardsToServiceConnections
{
  ++self->_lock_keyboardPublicationSeed;
  v3 = [(NSMutableArray *)self->_usableKeyboards bs_map:&stru_1000F6F70];
  server = self->_server;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100055C44;
  v6[3] = &unk_1000F6F98;
  v6[4] = self;
  id v7 = v3;
  id v5 = v3;
  [(BKHIDDomainServiceServer *)server enumerateUserInfoWithBlock:v6];
}

- (void)_lock_publishUsableKeyboards:(id)a3 toServiceConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([(BKHIDDomainServiceServer *)self->_server responsePendingForConnection:v7] & 1) == 0)
  {
    uint64_t v8 = [(BKHIDDomainServiceServer *)self->_server didRespondBlockForConnection:v7];
    lock_keyboardPublicationSeed = (void *)self->_lock_keyboardPublicationSeed;
    objc_initWeak(&location, self);
    int v10 = [v7 remoteTarget];
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_100055E0C;
    v12[3] = &unk_1000F6F50;
    objc_copyWeak(v15, &location);
    id v11 = v8;
    id v14 = v11;
    v15[1] = lock_keyboardPublicationSeed;
    id v13 = v7;
    [v10 setConnectedKeyboards:v6 withReply:v12];

    objc_destroyWeak(v15);
    objc_destroyWeak(&location);
  }
}

- (void)_lock_restoreCapsLockStateToKeyboard:(id)a3
{
  id v4 = (id *)a3;
  if (v4)
  {
    id v13 = v4;
    int v5 = sub_100081990((uint64_t)v4);
    id v6 = v13;
    if (v5)
    {
      if (!*((unsigned char *)v13 + 9))
      {
        unsigned __int8 v7 = [v13[3] isVirtualService];
        id v6 = v13;
        if ((v7 & 1) == 0)
        {
          uint64_t v8 = sub_100081F08(v13);
          if (v8)
          {
            id v9 = [(NSMutableDictionary *)self->_productIdentifierWithCapsLockActiveToGeneration objectForKey:v8];

            if (v9)
            {
              id v10 = v13[3];
              -[BKKeyboardHIDEventProcessor _lock_setCapsLockActive:onSenderID:](self, "_lock_setCapsLockActive:onSenderID:", 1, [v10 senderID]);

              productIdentifierWithCapsLockActiveToGeneration = self->_productIdentifierWithCapsLockActiveToGeneration;
              id v12 = +[NSNumber numberWithInteger:v13[11]];
              [(NSMutableDictionary *)productIdentifierWithCapsLockActiveToGeneration setObject:v12 forKey:v8];

LABEL_10:
              id v4 = v13;
              goto LABEL_11;
            }
          }

          id v6 = v13;
        }
      }
    }
    [v6[3] setElementValue:0 forUsagePage:8 usage:2];
    goto LABEL_10;
  }
LABEL_11:
}

- (void)_lock_setPrimaryKeyboard:(id)a3
{
  int v5 = (BKKeyboardInfo *)a3;
  os_unfair_lock_assert_owner(&self->_lock);
  id v6 = self->_primaryKeyboardInfo;
  if (v6 != v5)
  {
    objc_storeStrong((id *)&self->_primaryKeyboardInfo, a3);
    if (v5)
    {
      sub_100081BE0((uint64_t)v5, self->_keyboardLayout);
      keyboardint Type = v5->_keyboardType;
      uint64_t v8 = +[NSNumber numberWithUnsignedChar:v5->_countryCode];
      GSKeyboardSetHardwareKeyboardAttached();
      id v9 = BKLogKeyboard();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        unsigned int v10 = [v8 unsignedIntValue];
        keyboardLayout = self->_keyboardLayout;
        gsKeyboard = v5->_gsKeyboard;
        v13[0] = 67109890;
        v13[1] = v10;
        __int16 v14 = 1024;
        unsigned int v15 = keyboardType;
        __int16 v16 = 2114;
        id v17 = keyboardLayout;
        __int16 v18 = 2048;
        uint64_t v19 = gsKeyboard;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Hardware keyboard attached (countryCode:%d type:%d layout:%{public}@) GS:%p", (uint8_t *)v13, 0x22u);
      }
    }
    else if (v6)
    {
      GSKeyboardSetHardwareKeyboardAttached();
    }
  }
}

- (void)_lock_keyboardRemoved:(id)a3
{
  id v4 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  int v5 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v4 senderID]);
  id v6 = [(NSMutableDictionary *)self->_allKeyboardsBySenderID objectForKeyedSubscript:v5];
  unsigned __int8 v7 = BKLogKeyboard();
  BOOL v8 = os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT);
  if (v6)
  {
    if (v8)
    {
      int v15 = 138543362;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Keyboard detached: %{public}@", (uint8_t *)&v15, 0xCu);
    }

    id v9 = [v4 propertyForKey:@"VendorID"];
    int v10 = [v9 unsignedIntValue];
    id v11 = [v4 propertyForKey:@"ProductID"];
    int v12 = sub_1000563FC(v10, (int)[v11 unsignedIntValue]);

    if (v12)
    {
      int64_t v13 = self->_countOfKeyboardsRequiringAllSmartCoverHESDisengagedForOpen - 1;
      self->_countOfKeyboardsRequiringAllSmartCoverHESDisengagedForOpen = v13;
      if (!v13)
      {
        __int16 v14 = [(BKHIDEventProcessorRegistering *)self->_eventProcessorRegistry eventProcessorOfClass:objc_opt_class()];
        [v14 setAttachedCoverRequiresWorkaroundForOpenState:0];
      }
    }
    [(BKKeyboardHIDEventProcessor *)self _lock_stopWatchingForGestures:v6];
    [(BKKeyboardHIDEventProcessor *)self _lock_usableKeyboardDetached:v6];
    [(NSMutableDictionary *)self->_allKeyboardsBySenderID removeObjectForKey:v5];
  }
  else
  {
    if (v8)
    {
      int v15 = 138543362;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Keyboard not found for IOHIDService: %{public}@", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)_lock_keyboardsDetected:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_owner(p_lock);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_1000568A4;
  v6[3] = &unk_1000F6F08;
  v6[4] = self;
  [v5 enumerateObjectsUsingBlock:v6];
}

- (void)_lock_setKeyboardLightsSuspended:(BOOL)a3
{
  BOOL v3 = a3;
  os_unfair_lock_assert_owner(&self->_lock);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v5 = self->_usableKeyboards;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    BOOL v9 = !v3;
    do
    {
      int v10 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v12 + 1) + 8 * (void)v10);
        if (v11 && *(unsigned char *)(v11 + 8)) {
          [*(id *)(v11 + 24) setElementValue:v9 forUsagePage:8 usage:2];
        }
        int v10 = (char *)v10 + 1;
      }
      while (v7 != v10);
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (BOOL)_lock_anyKeyboardHasCapsLockActive
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  v2 = self->_usableKeyboards;
  id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v9;
    while (2)
    {
      for (i = 0; i != v3; i = (char *)i + 1)
      {
        if (*(void *)v9 != v4) {
          objc_enumerationMutation(v2);
        }
        uint64_t v6 = *(void *)(*((void *)&v8 + 1) + 8 * i);
        if (v6 && *(unsigned char *)(v6 + 8))
        {
          LOBYTE(v3) = 1;
          goto LABEL_12;
        }
      }
      id v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_12:

  return (char)v3;
}

- (int64_t)_lock_activeModifiers
{
  v2 = [(NSMutableArray *)self->_usableKeyboards bs_reduce:&off_100103520 block:&stru_1000F6EE0];
  id v3 = [v2 integerValue];

  return (int64_t)v3;
}

- (void)_lock_updateGlobalModifierState
{
  int64_t globalActiveModifiers = self->_globalActiveModifiers;
  int64_t v4 = [(BKKeyboardHIDEventProcessor *)self _lock_activeModifiers];
  if (globalActiveModifiers != v4)
  {
    int64_t v5 = v4;
    self->_int64_t globalActiveModifiers = v4;
    long long v12 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v6 = [(BSCompoundAssertion *)self->_keyboardObserverAssertion context];
    id v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      id v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        long long v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          long long v11 = *(void **)(*((void *)&v12 + 1) + 8 * (void)v10);
          if (objc_opt_respondsToSelector()) {
            [v11 globalKeyboardModifiersDidChange:v5];
          }
          long long v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        id v8 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }
  }
}

- (NSSet)keyCommandsToAuthenticate
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = [(NSMutableSet *)self->_keyCommandsToAuthenticate copy];
  os_unfair_lock_unlock(p_lock);

  return (NSSet *)v4;
}

- (BOOL)capsLockKeyHasLanguageSwitchLabel
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  primaryKeyboardInfo = self->_primaryKeyboardInfo;
  if (primaryKeyboardInfo) {
    BOOL capsLockKeyHasLanguageSwitchLabel = primaryKeyboardInfo->_capsLockKeyHasLanguageSwitchLabel;
  }
  else {
    BOOL capsLockKeyHasLanguageSwitchLabel = 0;
  }
  os_unfair_lock_unlock(p_lock);
  return capsLockKeyHasLanguageSwitchLabel;
}

- (BOOL)isCapsLockLightOn
{
  v2 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  LOBYTE(v2) = [(BKKeyboardHIDEventProcessor *)v2 _lock_anyKeyboardHasCapsLockActive];
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)setStandardType:(unsigned int)a3 forSenderID:(unint64_t)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  uint64_t v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v17 = [(NSMutableDictionary *)allKeyboardsBySenderID objectForKey:v9];

  if (v17 && *((_DWORD *)v17 + 4) != a3)
  {
    *((_DWORD *)v17 + 4) = a3;
    id v10 = v17[3];
    long long v11 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v17 + 4)];
    [v10 setProperty:v11 forKey:@"StandardType"];

    long long v12 = +[BKSDefaults localDefaults];
    uint64_t v13 = sub_100081600((uint64_t)v17);
    long long v14 = (void *)v13;
    if (v13)
    {
      uint64_t v18 = v13;
      long long v15 = +[NSNumber numberWithUnsignedInt:*((unsigned int *)v17 + 4)];
      uint64_t v19 = v15;
      id v16 = +[NSDictionary dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      [v12 setKeyboardTypeRemap:v16];
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setCapsLockDelayOverride:(double)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_usableKeyboards;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        sub_100081DDC(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10), a3);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (void)setRomanCapsLockSwitchModeActive:(BOOL)a3
{
  BOOL v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = self->_usableKeyboards;
  id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v12;
    do
    {
      id v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v6);
        }
        sub_100081D08(*(void *)(*((void *)&v11 + 1) + 8 * (void)v10), v3);
        id v10 = (char *)v10 + 1;
      }
      while (v8 != v10);
      id v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  os_unfair_lock_unlock(p_lock);
}

- (NSArray)allUsableDeviceProperties
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = [(NSMutableArray *)self->_usableKeyboards bs_map:&stru_1000F6EA0];
  os_unfair_lock_unlock(p_lock);

  return (NSArray *)v4;
}

- (id)devicePropertiesForSenderID:(unint64_t)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (!a3) {
    goto LABEL_3;
  }
  uint64_t v6 = +[BKHIDAccessibilitySender accessibilityHIDServices];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  _DWORD v13[2] = sub_10005759C;
  v13[3] = &unk_1000F6E60;
  v13[4] = a3;
  unsigned int v7 = [v6 bs_containsObjectPassingTest:v13];

  if (!v7)
  {
    allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
    long long v11 = +[NSNumber numberWithUnsignedLongLong:a3];
    id v8 = [(NSMutableDictionary *)allKeyboardsBySenderID objectForKey:v11];

    if (v8) {
      goto LABEL_4;
    }
  }
  else
  {
LABEL_3:
    id v8 = self->_primaryKeyboardInfo;
    if (v8)
    {
LABEL_4:
      uint64_t v9 = sub_100081F38(v8);
      goto LABEL_7;
    }
  }
  uint64_t v9 = 0;
LABEL_7:
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (BOOL)keyboardWantsStandardTypeOverrideForSenderID:(unint64_t)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (a3)
  {
    allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
    unsigned int v7 = +[NSNumber numberWithUnsignedLongLong:a3];
    id v8 = [(NSMutableDictionary *)allKeyboardsBySenderID objectForKey:v7];

    if (v8) {
      LOBYTE(v9) = v8[13] != 0;
    }
    else {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v8 = [(NSMutableDictionary *)self->_allKeyboardsBySenderID allValues];
    id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v15 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v14 + 1) + 8 * i);
          if (v12 && *(unsigned char *)(v12 + 13))
          {
            LOBYTE(v9) = 1;
            goto LABEL_15;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
  }
LABEL_15:

  os_unfair_lock_unlock(p_lock);
  return (char)v9;
}

- (BOOL)isCapsLockLightOnForSenderID:(unint64_t)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  unsigned int v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v8 = [(NSMutableDictionary *)allKeyboardsBySenderID objectForKey:v7];

  if (v8) {
    BOOL v9 = v8[8] != 0;
  }
  else {
    BOOL v9 = 0;
  }
  os_unfair_lock_unlock(p_lock);

  return v9;
}

- (void)setCapsLockActive:(BOOL)a3 onSenderID:(unint64_t)a4
{
  BOOL v5 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  [(BKKeyboardHIDEventProcessor *)self _lock_setCapsLockActive:v5 onSenderID:a4];

  os_unfair_lock_unlock(p_lock);
}

- (void)setCapsLockDelayOverride:(double)a3 forSenderID:(unint64_t)a4
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  BOOL v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [(NSMutableDictionary *)allKeyboardsBySenderID objectForKey:v9];

  sub_100081DDC((uint64_t)v10, a3);
  os_unfair_lock_unlock(p_lock);
}

- (void)setRomanCapsLockSwitchModeActive:(BOOL)a3 forSenderID:(unint64_t)a4
{
  BOOL v5 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  BOOL v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [(NSMutableDictionary *)allKeyboardsBySenderID objectForKey:v9];

  if (v10)
  {
    if (v5) {
      [(BKKeyboardHIDEventProcessor *)self _lock_setCapsLockState:0 forKeyboard:v10];
    }
    sub_100081D08((uint64_t)v10, v5);
  }
  os_unfair_lock_unlock(p_lock);
}

- (void)setKeyboardLayout:(id)a3 forSenderID:(unint64_t)a4
{
  id v15 = a3;
  if (!v15)
  {
    long long v11 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"keyboardLayout != ((void *)0)"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      uint64_t v12 = NSStringFromSelector(a2);
      long long v13 = (objc_class *)objc_opt_class();
      long long v14 = NSStringFromClass(v13);
      *(_DWORD *)buf = 138544642;
      long long v17 = v12;
      __int16 v18 = 2114;
      uint64_t v19 = v14;
      __int16 v20 = 2048;
      id v21 = self;
      __int16 v22 = 2114;
      CFStringRef v23 = @"BKKeyboardHIDEventProcessor.m";
      __int16 v24 = 1024;
      int v25 = 457;
      __int16 v26 = 2114;
      long long v27 = v11;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v11 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100057BA0);
  }
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  BOOL v9 = +[NSNumber numberWithUnsignedLongLong:a4];
  id v10 = [(NSMutableDictionary *)allKeyboardsBySenderID objectForKey:v9];

  sub_100081BE0((uint64_t)v10, v15);
  os_unfair_lock_unlock(p_lock);
}

- (id)keyboardLanguageForSenderID:(unint64_t)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  unsigned int v7 = +[NSNumber numberWithUnsignedLongLong:a3];
  id v8 = [(NSMutableDictionary *)allKeyboardsBySenderID objectForKey:v7];

  if (v8) {
    BOOL v9 = (void *)v8[7];
  }
  else {
    BOOL v9 = 0;
  }
  id v10 = v9;
  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (void)setKeyCommandsToAuthenticate:(id)a3
{
  uint64_t v6 = (NSMutableSet *)a3;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  if (self->_keyCommandsToAuthenticate != v6)
  {
    id v4 = (NSMutableSet *)[(NSMutableSet *)v6 copy];
    keyCommandsToAuthenticate = self->_keyCommandsToAuthenticate;
    self->_keyCommandsToAuthenticate = v4;
  }
  os_unfair_lock_unlock(&self->_lock);
}

- (id)addGlobalKeyboardObserver:(id)a3
{
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  keyboardObserverAssertion = self->_keyboardObserverAssertion;
  if (!keyboardObserverAssertion)
  {
    unsigned int v7 = +[BSCompoundAssertion assertionWithIdentifier:@"backboardd.keyboards.global-observers"];
    id v8 = self->_keyboardObserverAssertion;
    self->_keyboardObserverAssertion = v7;

    keyboardObserverAssertion = self->_keyboardObserverAssertion;
  }
  BOOL v9 = [(id)objc_opt_class() description];
  id v10 = [(BSCompoundAssertion *)keyboardObserverAssertion acquireForReason:v9 withContext:v5];

  os_unfair_lock_unlock(p_lock);

  return v10;
}

- (int64_t)activeModifiers
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  int64_t v4 = [(BKKeyboardHIDEventProcessor *)self _lock_activeModifiers];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (void)setKeyboardLayout:(id)a3
{
  id v5 = a3;
  if (!v5)
  {
    long long v14 = +[NSString stringWithFormat:@"Invalid condition not satisfying: %@", @"keyboardLayout != ((void *)0)"];
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      id v15 = NSStringFromSelector(a2);
      long long v16 = (objc_class *)objc_opt_class();
      long long v17 = NSStringFromClass(v16);
      *(_DWORD *)buf = 138544642;
      __int16 v24 = v15;
      __int16 v25 = 2114;
      __int16 v26 = v17;
      __int16 v27 = 2048;
      long long v28 = self;
      __int16 v29 = 2114;
      CFStringRef v30 = @"BKKeyboardHIDEventProcessor.m";
      __int16 v31 = 1024;
      int v32 = 391;
      __int16 v33 = 2114;
      v34 = v14;
      _os_log_error_impl((void *)&_mh_execute_header, (os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR, "failure in %{public}@ of <%{public}@:%p> (%{public}@:%i) : %{public}@", buf, 0x3Au);
    }
    [v14 UTF8String];
    _bs_set_crash_log_message();
    __break(0);
    JUMPOUT(0x100058028);
  }
  uint64_t v6 = v5;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(&self->_lock);
  unsigned int v7 = (NSString *)[v6 copy];
  keyboardLayout = self->_keyboardLayout;
  self->_keyboardLayout = v7;

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  BOOL v9 = [(NSMutableDictionary *)self->_allKeyboardsBySenderID allValues];
  id v10 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v19;
    do
    {
      long long v13 = 0;
      do
      {
        if (*(void *)v19 != v12) {
          objc_enumerationMutation(v9);
        }
        sub_100081BE0(*(void *)(*((void *)&v18 + 1) + 8 * (void)v13), v6);
        long long v13 = (char *)v13 + 1;
      }
      while (v11 != v13);
      id v11 = [v9 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v11);
  }

  [(BKKeyboardHIDEventProcessor *)self _lock_publishUsableKeyboardsToServiceConnections];
  os_unfair_lock_unlock(&self->_lock);
}

- (NSString)keyboardLayout
{
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  id v4 = [(NSString *)self->_keyboardLayout copy];
  os_unfair_lock_unlock(p_lock);

  return (NSString *)v4;
}

- (void)setCapsLockLightOn:(BOOL)a3
{
  BOOL v3 = a3;
  p_os_unfair_lock_t lock = &self->_lock;
  os_unfair_lock_assert_not_owner(&self->_lock);
  os_unfair_lock_lock(p_lock);
  if (self->_primaryKeyboardInfo)
  {
    -[BKKeyboardHIDEventProcessor _lock_setCapsLockState:forKeyboard:](self, "_lock_setCapsLockState:forKeyboard:", v3);
  }
  else
  {
    uint64_t v6 = BKLogKeyboard();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)unsigned int v7 = 0;
      _os_log_error_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "can't set caps lock state; no keyboards attached",
        v7,
        2u);
    }
  }
  os_unfair_lock_unlock(p_lock);
}

- (int)eventSourceForSender:(id)a3
{
  BOOL v3 = self;
  p_os_unfair_lock_t lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_assert_not_owner(p_lock);
  os_unfair_lock_lock(p_lock);
  allKeyboardsBySenderID = v3->_allKeyboardsBySenderID;
  unsigned int v7 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", [v5 senderID]);
  id v8 = [(NSMutableDictionary *)allKeyboardsBySenderID objectForKeyedSubscript:v7];
  LODWORD(v3) = [(BKKeyboardHIDEventProcessor *)v3 _eventSourceForKeyboardInfo:v8 sender:v5];

  os_unfair_lock_unlock(p_lock);
  return (int)v3;
}

- (NSString)debugDescription
{
  v2 = +[BSDescriptionStream descriptionForRootObject:self];
  BOOL v3 = [v2 description];

  return (NSString *)v3;
}

- (void)dealloc
{
  BOOL v3 = +[BKHIDEventProcessorRegistry sharedInstance];
  id v4 = [v3 eventProcessorOfClass:objc_opt_class()];

  eventRecognizers = self->_eventRecognizers;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100058340;
  v8[3] = &unk_1000F6E40;
  id v9 = v4;
  id v6 = v4;
  [(NSMutableArray *)eventRecognizers enumerateObjectsUsingBlock:v8];
  [(BKIOHIDServiceMatcher *)self->_keyboardServiceMatcher invalidate];

  v7.receiver = self;
  v7.super_class = (Class)BKKeyboardHIDEventProcessor;
  [(BKKeyboardHIDEventProcessor *)&v7 dealloc];
}

- (void)_commonInitWithContext:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  self->_lock._os_unfair_lock_opaque = 0;
  id v8 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  productIdentifierWithCapsLockActiveToGeneration = self->_productIdentifierWithCapsLockActiveToGeneration;
  self->_productIdentifierWithCapsLockActiveToGeneration = v8;

  id v10 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  allKeyboardsBySenderID = self->_allKeyboardsBySenderID;
  self->_allKeyboardsBySenderID = v10;

  uint64_t v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  usableKeyboards = self->_usableKeyboards;
  self->_usableKeyboards = v12;

  long long v14 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  eventRecognizers = self->_eventRecognizers;
  self->_eventRecognizers = v14;

  long long v16 = [v6 eventDispatcher];
  eventDispatcher = self->_eventDispatcher;
  self->_eventDispatcher = v16;

  long long v18 = [v6 systemInterface];
  eventSystemInterface = self->_eventSystemInterface;
  self->_eventSystemInterface = v18;

  long long v20 = [v6 eventProcessorRegistry];
  eventProcessorRegistry = self->_eventProcessorRegistry;
  self->_eventProcessorRegistry = v20;

  __int16 v22 = +[BKDisplayController sharedInstance];
  displayController = self->_displayController;
  self->_displayController = v22;

  __int16 v24 = [(BKDisplayController *)self->_displayController addDisplayBlankingObserver:self];
  displayBlankingObservationAssertion = self->_displayBlankingObservationAssertion;
  self->_displayBlankingObservationAssertion = v24;

  keyboardLayout = self->_keyboardLayout;
  self->_keyboardLayout = (NSString *)@"US";

  id v27 = &_dispatch_main_q;
  v52[0] = @"DeviceUsagePage";
  v52[1] = @"DeviceUsage";
  *(void *)&long long buf = &off_100103538;
  *((void *)&buf + 1) = &off_100103550;
  long long v28 = +[NSDictionary dictionaryWithObjects:&buf forKeys:v52 count:2];
  id v29 = objc_alloc((Class)BKIOHIDServiceMatcher);
  CFStringRef v30 = [v6 serviceMatcherDataProvider];
  __int16 v31 = (BKIOHIDServiceMatcher *)[v29 initWithMatchingDictionary:v28 dataProvider:v30];
  keyboardServiceMatcher = self->_keyboardServiceMatcher;
  self->_keyboardServiceMatcher = v31;

  [(BKIOHIDServiceMatcher *)self->_keyboardServiceMatcher startObserving:self queue:&_dispatch_main_q];
  __int16 v33 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  keyDownToEventSequence = self->_keyDownToEventSequence;
  self->_keyDownToEventSequence = v33;

  uint64_t v35 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  senderIDToKeysDown = self->_senderIDToKeysDown;
  self->_senderIDToKeysDown = v35;

  id v37 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  senderIDsWithModifiersOnly = self->_senderIDsWithModifiersOnly;
  self->_senderIDsWithModifiersOnly = v37;

  v39 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
  downModifierKeys = self->_downModifierKeys;
  self->_downModifierKeys = v39;

  v41 = +[BKSDefaults externalDefaults];
  __int16 v42 = [v41 keyboardDefaults];

  [v42 migrateIfNeeded];
  v43 = BKLogKeyboard();
  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v42;
    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "external defaults: %@", (uint8_t *)&buf, 0xCu);
  }

  __int16 v44 = +[NSString stringWithUTF8String:"modifierKeyRemapping"];
  v49[0] = _NSConcreteStackBlock;
  v49[1] = 3221225472;
  v49[2] = sub_1000587B4;
  v49[3] = &unk_1000F8E50;
  id v45 = v42;
  id v50 = v45;
  v51 = self;
  id v46 = [v45 observeDefault:v44 onQueue:&_dispatch_main_q withBlock:v49];

  objc_storeStrong((id *)&self->_server, a4);
  [(BKHIDDomainServiceServer *)self->_server activate];
  objc_initWeak((id *)&buf, self);
  objc_copyWeak(&v48, (id *)&buf);
  id v47 = (id)BSLogAddStateCaptureBlockWithTitle();
  objc_destroyWeak(&v48);
  objc_destroyWeak((id *)&buf);
}

- (BKKeyboardHIDEventProcessor)initWithContext:(id)a3 server:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)BKKeyboardHIDEventProcessor;
  id v8 = [(BKKeyboardHIDEventProcessor *)&v11 init];
  id v9 = v8;
  if (v8) {
    [(BKKeyboardHIDEventProcessor *)v8 _commonInitWithContext:v6 server:v7];
  }

  return v9;
}

- (BKKeyboardHIDEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)BKKeyboardHIDEventProcessor;
  id v5 = [(BKKeyboardHIDEventProcessor *)&v11 init];
  if (v5)
  {
    id v6 = objc_alloc((Class)BKHIDDomainServiceServer);
    uint64_t v7 = BKSKeyboardBSServiceName;
    id v8 = BKLogKeyboard();
    id v9 = [v6 initWithDelegate:v5 serverTarget:v5 serverProtocol:&OBJC_PROTOCOL___BKSKeyboardServiceClientToServerIPC clientProtocol:&OBJC_PROTOCOL___BKSKeyboardServiceServerToClientIPC serviceName:v7 queue:0 log:v8 entitlement:0];

    [(BKKeyboardHIDEventProcessor *)v5 _commonInitWithContext:v4 server:v9];
  }

  return v5;
}

@end