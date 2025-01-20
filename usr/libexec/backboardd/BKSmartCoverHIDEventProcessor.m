@interface BKSmartCoverHIDEventProcessor
+ (BOOL)isSmartCoverSupported;
- (BKIOHIDServiceMatcher)magicKeyboardExtendedMatcher;
- (BKSmartCoverHIDEventProcessor)initWithContext:(id)a3;
- (BKSmartCoverHIDEventProcessor)initWithSupportedHES:(unint64_t)a3 disengagedHES:(unint64_t)a4 attached:(BOOL)a5 unknownState:(BOOL)a6;
- (BOOL)attachedCoverRequiresWorkaroundForOpenState;
- (BOOL)isAttached;
- (BOOL)isSmartCoverClosed;
- (BOOL)isUnknownState;
- (NSMutableSet)magicKeyboardExtendedServices;
- (OS_dispatch_queue)matcherQueue;
- (id)addSmartCoverObserver:(id)a3;
- (int)_smartCoverSensorsDidDisengage:(unint64_t)a3;
- (int)_smartCoverSensorsDidEngage:(unint64_t)a3;
- (int)_wakeAnimationStyle;
- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5;
- (int64_t)state;
- (unint64_t)_currentMaskForUsage:(unsigned int)a3 HIDSystem:(id)a4 mask:(unint64_t *)a5 maskIfEngaged:(unint64_t *)a6;
- (unint64_t)disengagedSensors;
- (unint64_t)sensorsRequiredForAmbiguousState;
- (unint64_t)sensorsRequiredForOpenState;
- (unint64_t)supportedSensors;
- (void)appendDescriptionToFormatter:(id)a3;
- (void)matcher:(id)a3 servicesDidMatch:(id)a4;
- (void)serviceDidDisappear:(id)a3;
- (void)setAttached:(BOOL)a3;
- (void)setAttachedCoverRequiresWorkaroundForOpenState:(BOOL)a3;
- (void)setDisengagedSensors:(unint64_t)a3;
- (void)setMagicKeyboardExtendedMatcher:(id)a3;
- (void)setMagicKeyboardExtendedServices:(id)a3;
- (void)setMatcherQueue:(id)a3;
- (void)setSensorsRequiredForAmbiguousState:(unint64_t)a3;
- (void)setSensorsRequiredForOpenState:(unint64_t)a3;
- (void)setState:(int64_t)a3;
- (void)setSupportedSensors:(unint64_t)a3;
- (void)setUnknownState:(BOOL)a3;
@end

@implementation BKSmartCoverHIDEventProcessor

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_matcherQueue, 0);
  objc_storeStrong((id *)&self->_magicKeyboardExtendedServices, 0);
  objc_storeStrong((id *)&self->_magicKeyboardExtendedMatcher, 0);

  objc_storeStrong((id *)&self->_observerAssertion, 0);
}

- (void)setState:(int64_t)a3
{
  self->_state = a3;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setUnknownState:(BOOL)a3
{
  self->_unknownState = a3;
}

- (BOOL)isUnknownState
{
  return self->_unknownState;
}

- (void)setAttached:(BOOL)a3
{
  self->_attached = a3;
}

- (BOOL)isAttached
{
  return self->_attached;
}

- (void)setSensorsRequiredForAmbiguousState:(unint64_t)a3
{
  self->_sensorsRequiredForAmbiguousState = a3;
}

- (unint64_t)sensorsRequiredForAmbiguousState
{
  return self->_sensorsRequiredForAmbiguousState;
}

- (void)setSensorsRequiredForOpenState:(unint64_t)a3
{
  self->_sensorsRequiredForOpenState = a3;
}

- (unint64_t)sensorsRequiredForOpenState
{
  return self->_sensorsRequiredForOpenState;
}

- (void)setDisengagedSensors:(unint64_t)a3
{
  self->_disengagedSensors = a3;
}

- (unint64_t)disengagedSensors
{
  return self->_disengagedSensors;
}

- (void)setSupportedSensors:(unint64_t)a3
{
  self->_supportedSensors = a3;
}

- (unint64_t)supportedSensors
{
  return self->_supportedSensors;
}

- (void)setMatcherQueue:(id)a3
{
}

- (OS_dispatch_queue)matcherQueue
{
  return self->_matcherQueue;
}

- (void)setMagicKeyboardExtendedServices:(id)a3
{
}

- (NSMutableSet)magicKeyboardExtendedServices
{
  return self->_magicKeyboardExtendedServices;
}

- (void)setMagicKeyboardExtendedMatcher:(id)a3
{
}

- (BKIOHIDServiceMatcher)magicKeyboardExtendedMatcher
{
  return self->_magicKeyboardExtendedMatcher;
}

- (BOOL)attachedCoverRequiresWorkaroundForOpenState
{
  return self->_attachedCoverRequiresWorkaroundForOpenState;
}

- (void)appendDescriptionToFormatter:(id)a3
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100084248;
  v12[3] = &unk_1000F8BE0;
  v12[4] = self;
  id v4 = a3;
  [v4 appendCustomFormatWithName:@"disengagedSensors" block:v12];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008425C;
  v11[3] = &unk_1000F8BE0;
  v11[4] = self;
  [v4 appendCustomFormatWithName:@"supportedSensors" block:v11];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100084270;
  v10[3] = &unk_1000F8BE0;
  v10[4] = self;
  [v4 appendCustomFormatWithName:@"sensorsRequiredForOpenState" block:v10];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100084284;
  v9[3] = &unk_1000F8BE0;
  v9[4] = self;
  [v4 appendCustomFormatWithName:@"sensorsRequiredForAmbiguousState" block:v9];
  id v5 = [v4 appendBool:self->_attached withName:@"a"];
  id v6 = [v4 appendBool:self->_unknownState withName:@"u"];
  unint64_t state = self->_state;
  if (state >= 4)
  {
    v8 = +[NSString stringWithFormat:@"<invalid:%d>", self->_state];
  }
  else
  {
    v8 = *(&off_1000F82F8 + state);
  }
  [v4 appendString:v8 withName:@"state"];
}

- (id)addSmartCoverObserver:(id)a3
{
  id v4 = a3;
  observerAssertion = self->_observerAssertion;
  if (!observerAssertion)
  {
    id v6 = +[BSCompoundAssertion assertionWithIdentifier:@"backboardd.smart-cover-observer"];
    v7 = self->_observerAssertion;
    self->_observerAssertion = v6;

    observerAssertion = self->_observerAssertion;
  }
  v8 = [(id)objc_opt_class() description];
  v9 = [(BSCompoundAssertion *)observerAssertion acquireForReason:v8 withContext:v4];

  return v9;
}

- (int64_t)processEvent:(__IOHIDEvent *)a3 sender:(id)a4 dispatcher:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = *a3;
  if (IOHIDEventGetIntegerValue() == 65289)
  {
    if ([(BKSmartCoverHIDEventProcessor *)self sensorsRequiredForOpenState])
    {
      int IntegerValue = IOHIDEventGetIntegerValue();
      uint64_t v12 = IOHIDEventGetIntegerValue();
      unsigned int v13 = IntegerValue | 0xFF090000;
      if ((IntegerValue | 0xFF090000) + 16187391 < 4)
      {
        switch(IntegerValue)
        {
          case 1:
            uint64_t v14 = 1;
            break;
          case 2:
            uint64_t v14 = 4;
            break;
          case 3:
            uint64_t v14 = 8;
            break;
          case 4:
            uint64_t v14 = 16;
            break;
          default:
            if (IntegerValue == 32) {
              uint64_t v14 = 32;
            }
            else {
              uint64_t v14 = 0;
            }
            break;
        }
        if (([(BKSmartCoverHIDEventProcessor *)self supportedSensors] & v14) != 0)
        {
          if (v12) {
            uint64_t v23 = [(BKSmartCoverHIDEventProcessor *)self _smartCoverSensorsDidEngage:v14];
          }
          else {
            uint64_t v23 = [(BKSmartCoverHIDEventProcessor *)self _smartCoverSensorsDidDisengage:v14];
          }
          uint64_t v22 = v23;
          if (v23)
          {
            [(BKSmartCoverHIDEventProcessor *)self _wakeAnimationStyle];
            BKSHIDEventSetSmartCoverInfo();
            char v24 = 0;
            goto LABEL_37;
          }
        }
        else
        {
          uint64_t v22 = 0;
        }
        char v24 = 1;
LABEL_37:
        v25 = sub_10005FA78();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
        {
          BOOL v34 = v12 != 0;
          v35 = sub_100084B00(self->_disengagedSensors);
          v37 = sub_100084B00(self->_supportedSensors);
          v36 = sub_100084B00(self->_sensorsRequiredForOpenState);
          sub_100084B00(self->_sensorsRequiredForAmbiguousState);
          id v26 = (id)objc_claimAutoreleasedReturnValue();
          if (v24)
          {
            v27 = @"<none>";
          }
          else
          {
            NSStringFromBKSHIDEventSmartCoverState();
            v27 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          *(_DWORD *)buf = 67110658;
          BOOL v44 = IntegerValue;
          __int16 v45 = 1024;
          BOOL v46 = v34;
          __int16 v47 = 2114;
          v48 = v35;
          __int16 v49 = 2114;
          v50 = v37;
          __int16 v51 = 2114;
          v52 = v36;
          __int16 v53 = 2114;
          id v54 = v26;
          __int16 v55 = 2114;
          v56 = v27;
          _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "SmartCover event usage:%X engage:%{BOOL}u -> disengaged:%{public}@ all:%{public}@ trig:%{public}@ maybe:%{public}@ -> change:%{public}@", buf, 0x40u);
          if ((v24 & 1) == 0) {
        }
          }
        if (!v10) {
          goto LABEL_46;
        }
        goto LABEL_45;
      }
      if (v13 != -16187376)
      {
        if (v13 != -16187360)
        {
          v16 = sub_10005FA78();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = 67109376;
            BOOL v44 = IntegerValue;
            __int16 v45 = 1024;
            BOOL v46 = v12 != 0;
            _os_log_error_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "SmertCover unknown usage: %X down:%{BOOL}u", buf, 0xEu);
          }
          goto LABEL_54;
        }
        v20 = sub_10005FA78();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109120;
          BOOL v44 = v12 != 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "SmartCover StateUnknown:%{BOOL}u", buf, 8u);
        }

        if (v12)
        {
          self->_unint64_t state = 3;
          [(BKSmartCoverHIDEventProcessor *)self _wakeAnimationStyle];
          BKSHIDEventSetSmartCoverInfo();
          v21 = sub_10005FA78();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Sending BKSHIDEventSmartCoverAmbiguousOpen", buf, 2u);
          }

          uint64_t v22 = 2;
          if (!v10) {
            goto LABEL_46;
          }
        }
        else
        {
          if (self->_state == 3 && (self->_sensorsRequiredForOpenState & self->_disengagedSensors) == 0)
          {
            v33 = sub_10005FA78();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Recovering from unknown smart cover state; Sending BKSHIDEventSmartCoverClosed",
                buf,
                2u);
            }

            [(BKSmartCoverHIDEventProcessor *)self _smartCoverSensorsDidEngage:self->_sensorsRequiredForOpenState];
            [(BKSmartCoverHIDEventProcessor *)self _wakeAnimationStyle];
            BKSHIDEventSetSmartCoverInfo();
          }
          uint64_t v22 = 0;
          if (!v10) {
            goto LABEL_46;
          }
        }
LABEL_45:
        IOHIDEventGetTimeStamp();
        IOHIDEventGetIntegerValue();
        IOHIDEventGetIntegerValue();
        IOHIDEventGetIntegerValue();
LABEL_46:
        kdebug_trace();
        [v9 postEvent:v10 fromSender:v8];
        if (!v22)
        {
LABEL_55:
          int64_t v15 = 1;
          goto LABEL_56;
        }
        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        v16 = [(BSCompoundAssertion *)self->_observerAssertion context];
        id v28 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
        if (v28)
        {
          id v29 = v28;
          uint64_t v30 = *(void *)v39;
          do
          {
            for (i = 0; i != v29; i = (char *)i + 1)
            {
              if (*(void *)v39 != v30) {
                objc_enumerationMutation(v16);
              }
              [*(id *)(*((void *)&v38 + 1) + 8 * i) smartCoverStateDidChange:v22];
            }
            id v29 = [v16 countByEnumeratingWithState:&v38 objects:v42 count:16];
          }
          while (v29);
        }
LABEL_54:

        goto LABEL_55;
      }
      v16 = sub_10005FA78();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_DWORD *)buf = 67109120;
      BOOL v44 = v12 != 0;
      v17 = "SmartCover attach:%{BOOL}u";
      v18 = v16;
      uint32_t v19 = 8;
    }
    else
    {
      v16 = sub_10005FA78();
      if (!os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_54;
      }
      *(_WORD *)buf = 0;
      v17 = "dropping smart cover event because we don't have any HES sensors";
      v18 = v16;
      uint32_t v19 = 2;
    }
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, v17, buf, v19);
    goto LABEL_54;
  }
  int64_t v15 = 0;
LABEL_56:

  return v15;
}

- (BOOL)isSmartCoverClosed
{
  return self->_supportedSensors && self->_state == 2;
}

- (int)_smartCoverSensorsDidDisengage:(unint64_t)a3
{
  int64_t state = self->_state;
  unint64_t disengagedSensors = self->_disengagedSensors;
  unint64_t sensorsRequiredForOpenState = self->_sensorsRequiredForOpenState;
  unint64_t v6 = disengagedSensors | a3;
  self->_unint64_t disengagedSensors = disengagedSensors | a3;
  if ((sensorsRequiredForOpenState & ~(disengagedSensors | a3)) != 0)
  {
    unint64_t sensorsRequiredForAmbiguousState = self->_sensorsRequiredForAmbiguousState;
    if (v6 != disengagedSensors
      && sensorsRequiredForAmbiguousState != 0
      && (sensorsRequiredForAmbiguousState & v6) == sensorsRequiredForAmbiguousState)
    {
      int v10 = 2;
      int64_t v9 = 3;
LABEL_20:
      self->_int64_t state = v9;
      return v10;
    }
  }
  else
  {
    BOOL v8 = v6 == disengagedSensors || state != 2;
    int64_t v9 = 1;
    int v10 = 1;
    if (state == 3 || !v8) {
      goto LABEL_20;
    }
  }
  return 0;
}

- (int)_smartCoverSensorsDidEngage:(unint64_t)a3
{
  unint64_t supportedSensors = self->_supportedSensors;
  unint64_t disengagedSensors = self->_disengagedSensors;
  unint64_t v5 = disengagedSensors & ~a3;
  self->_unint64_t disengagedSensors = v5;
  if ((supportedSensors & v5) != 0) {
    return 0;
  }
  if (v5 == disengagedSensors && self->_state != 3) {
    return 0;
  }
  self->_int64_t state = 2;
  return 3;
}

- (void)setAttachedCoverRequiresWorkaroundForOpenState:(BOOL)a3
{
  if (self->_attachedCoverRequiresWorkaroundForOpenState != a3)
  {
    self->_attachedCoverRequiresWorkaroundForOpenState = a3;
    if (LODWORD(self->_supportedSensors))
    {
      unint64_t v4 = 4;
      if (a3) {
        unint64_t v5 = 1;
      }
      else {
        unint64_t v5 = 4;
      }
      if (!a3) {
        unint64_t v4 = 1;
      }
      self->_unint64_t sensorsRequiredForOpenState = v5;
      self->_unint64_t sensorsRequiredForAmbiguousState = v4;
      unint64_t v6 = sub_10005FA78();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t sensorsRequiredForOpenState = self->_sensorsRequiredForOpenState;
        v8[0] = 67109120;
        v8[1] = sensorsRequiredForOpenState;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "HES required for open state is now:%x", (uint8_t *)v8, 8u);
      }
    }
  }
}

- (int)_wakeAnimationStyle
{
  magicKeyboardExtendedServices = self->_magicKeyboardExtendedServices;
  if (magicKeyboardExtendedServices) {
    LODWORD(magicKeyboardExtendedServices) = [(NSMutableSet *)magicKeyboardExtendedServices count] != 0;
  }
  return (int)magicKeyboardExtendedServices;
}

- (void)serviceDidDisappear:(id)a3
{
  magicKeyboardExtendedServices = self->_magicKeyboardExtendedServices;
  if (magicKeyboardExtendedServices) {
    [(NSMutableSet *)magicKeyboardExtendedServices removeObject:a3];
  }
}

- (void)matcher:(id)a3 servicesDidMatch:(id)a4
{
  id v20 = a3;
  id v6 = a4;
  if (!self->_magicKeyboardExtendedServices)
  {
    v7 = (NSMutableSet *)objc_opt_new();
    magicKeyboardExtendedServices = self->_magicKeyboardExtendedServices;
    self->_magicKeyboardExtendedServices = v7;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v9 = v6;
  id v10 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v10)
  {
    id v11 = v10;
    uint64_t v12 = *(void *)v22;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v9);
        }
        uint64_t v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        int64_t v15 = [v14 propertyForKey:@"MKWakeAnimation"];
        uint64_t v16 = objc_opt_class();
        id v17 = v15;
        if (v16)
        {
          if (objc_opt_isKindOfClass()) {
            v18 = v17;
          }
          else {
            v18 = 0;
          }
        }
        else
        {
          v18 = 0;
        }
        id v19 = v18;

        if (v19
          && [v19 isEqualToString:@"extended"]
          && ([(NSMutableSet *)self->_magicKeyboardExtendedServices containsObject:v14] & 1) == 0)
        {
          [v14 addDisappearanceObserver:self queue:self->_matcherQueue];
          [(NSMutableSet *)self->_magicKeyboardExtendedServices addObject:v14];
        }
      }
      id v11 = [v9 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v11);
  }
}

- (BKSmartCoverHIDEventProcessor)initWithContext:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 systemInterface];
  if (+[BKSmartCoverHIDEventProcessor isSmartCoverSupported])
  {
    uint64_t v17 = 0;
    uint64_t v18 = 0;
    [(BKSmartCoverHIDEventProcessor *)self _currentMaskForUsage:1 HIDSystem:v5 mask:&v18 maskIfEngaged:&v17];
    [(BKSmartCoverHIDEventProcessor *)self _currentMaskForUsage:2 HIDSystem:v5 mask:&v18 maskIfEngaged:&v17];
    [(BKSmartCoverHIDEventProcessor *)self _currentMaskForUsage:3 HIDSystem:v5 mask:&v18 maskIfEngaged:&v17];
    [(BKSmartCoverHIDEventProcessor *)self _currentMaskForUsage:4 HIDSystem:v5 mask:&v18 maskIfEngaged:&v17];
    uint64_t v16 = 0;
    [(BKSmartCoverHIDEventProcessor *)self _currentMaskForUsage:16 HIDSystem:v5 mask:0 maskIfEngaged:&v16];
    BOOL v6 = v16 != 0;
    uint64_t v15 = 0;
    [(BKSmartCoverHIDEventProcessor *)self _currentMaskForUsage:32 HIDSystem:v5 mask:0 maskIfEngaged:&v15];
    BOOL v7 = v15 != 0;
    BOOL v8 = (OS_dispatch_queue *)dispatch_queue_create("BKHIDEventSmartCoverMatcherQueue", 0);
    matcherQueue = self->_matcherQueue;
    self->_matcherQueue = v8;

    id v10 = [v4 serviceMatcherDataProvider];
    id v11 = (BKIOHIDServiceMatcher *)[objc_alloc((Class)BKIOHIDServiceMatcher) initWithUsagePage:65280 usage:11 builtIn:0 dataProvider:v10];
    magicKeyboardExtendedMatcher = self->_magicKeyboardExtendedMatcher;
    self->_magicKeyboardExtendedMatcher = v11;

    [(BKIOHIDServiceMatcher *)self->_magicKeyboardExtendedMatcher startObserving:self queue:self->_matcherQueue];
    self = [(BKSmartCoverHIDEventProcessor *)self initWithSupportedHES:v18 disengagedHES:v18 & ~v17 attached:v6 unknownState:v7];

    unsigned int v13 = self;
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (unint64_t)_currentMaskForUsage:(unsigned int)a3 HIDSystem:(id)a4 mask:(unint64_t *)a5 maskIfEngaged:(unint64_t *)a6
{
  id v9 = a4;
  uint64_t KeyboardEvent = IOHIDEventCreateKeyboardEvent();
  if (KeyboardEvent)
  {
    id v11 = (const void *)KeyboardEvent;
    id v12 = [v9 systemEventOfType:3 matchingEvent:KeyboardEvent options:0];
    if (!v12)
    {
      unint64_t v14 = 0;
LABEL_23:
      CFRelease(v11);
      goto LABEL_24;
    }
    unsigned int v13 = v12;
    switch(a3)
    {
      case 1u:
        unint64_t v14 = 1;
        if (a5) {
          goto LABEL_18;
        }
        goto LABEL_19;
      case 2u:
        unint64_t v14 = 4;
        if (a5) {
          goto LABEL_18;
        }
        goto LABEL_19;
      case 3u:
        unint64_t v14 = 8;
        if (a5) {
          goto LABEL_18;
        }
        goto LABEL_19;
      case 4u:
        unint64_t v14 = 16;
        if (a5) {
          goto LABEL_18;
        }
        goto LABEL_19;
      default:
        if (a3 == 32)
        {
          unint64_t v14 = 32;
          if (!a5)
          {
LABEL_19:
            if (a6 && IOHIDEventGetIntegerValue()) {
              *a6 |= v14;
            }
            CFRelease(v13);
            goto LABEL_23;
          }
        }
        else
        {
          unint64_t v14 = 0;
          if (!a5) {
            goto LABEL_19;
          }
        }
LABEL_18:
        *a5 |= v14;
        goto LABEL_19;
    }
  }
  unint64_t v14 = 0;
LABEL_24:

  return v14;
}

- (BKSmartCoverHIDEventProcessor)initWithSupportedHES:(unint64_t)a3 disengagedHES:(unint64_t)a4 attached:(BOOL)a5 unknownState:(BOOL)a6
{
  v29.receiver = self;
  v29.super_class = (Class)BKSmartCoverHIDEventProcessor;
  id v10 = [(BKSmartCoverHIDEventProcessor *)&v29 init];
  id v11 = v10;
  if (v10)
  {
    v10->_unint64_t supportedSensors = a3;
    v10->_unint64_t disengagedSensors = a4;
    v10->_attached = a5;
    uint8x8_t v12 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v12.i16[0] = vaddlv_u8(v12);
    if (v12.i32[0] == 1)
    {
      long long v13 = a3;
    }
    else
    {
      if (!a3)
      {
        if (a6)
        {
          uint64_t v24 = 3;
LABEL_21:
          v10->_int64_t state = v24;
          goto LABEL_22;
        }
LABEL_20:
        uint64_t v24 = 1;
        goto LABEL_21;
      }
      long long v13 = xmmword_1000BF660;
    }
    *(_OWORD *)&v10->_unint64_t sensorsRequiredForOpenState = v13;
    if (a6)
    {
      v10->_int64_t state = 3;
      if (!a3)
      {
LABEL_22:
        uint64_t v15 = sub_10005FA78();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          LOWORD(buf) = 0;
          _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "No SmartCover sensors detected", (uint8_t *)&buf, 2u);
        }
LABEL_24:

        goto LABEL_25;
      }
LABEL_13:
      uint64_t v15 = sub_10005FA78();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        unint64_t supportedSensors = v11->_supportedSensors;
        uint64_t v17 = sub_100084B00(supportedSensors);
        uint64_t v18 = sub_100084B00(v11->_disengagedSensors);
        uint64_t v19 = sub_100084B00(v11->_sensorsRequiredForOpenState);
        id v20 = (void *)v19;
        LODWORD(buf) = 67110146;
        uint8x8_t v21 = (uint8x8_t)vcnt_s8((int8x8_t)supportedSensors);
        v21.i16[0] = vaddlv_u8(v21);
        int64_t state = v11->_state;
        HIDWORD(buf) = v21.i32[0];
        __int16 v31 = 2114;
        v32 = v17;
        if (state == 2) {
          CFStringRef v23 = @"closed";
        }
        else {
          CFStringRef v23 = @"open";
        }
        __int16 v33 = 2114;
        BOOL v34 = v18;
        __int16 v35 = 2114;
        uint64_t v36 = v19;
        __int16 v37 = 2114;
        CFStringRef v38 = v23;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "SmartCover sensor count:%d available:%{public}@ disengaged:%{public}@ trigger:%{public}@; effective state:%{public}@",
          (uint8_t *)&buf,
          0x30u);
      }
      goto LABEL_24;
    }
    if (a3)
    {
      uint64_t v14 = 1;
      if ((a4 & a3) == 0) {
        uint64_t v14 = 2;
      }
      v10->_int64_t state = v14;
      goto LABEL_13;
    }
    goto LABEL_20;
  }
LABEL_25:
  objc_initWeak(&buf, v11);
  id v25 = &_dispatch_main_q;
  objc_copyWeak(&v28, &buf);
  id v26 = (id)BSLogAddStateCaptureBlockWithTitle();

  objc_destroyWeak(&v28);
  objc_destroyWeak(&buf);
  return v11;
}

+ (BOOL)isSmartCoverSupported
{
  if (qword_100123100 != -1) {
    dispatch_once(&qword_100123100, &stru_1000F82B0);
  }
  return byte_1001230F8;
}

@end