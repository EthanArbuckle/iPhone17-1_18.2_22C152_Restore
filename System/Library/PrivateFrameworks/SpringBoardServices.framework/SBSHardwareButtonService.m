@interface SBSHardwareButtonService
+ (SBSHardwareButtonService)sharedInstance;
- (BOOL)getAssociatedHintViewsSupported;
- (BSMutableIntegerMap)buttonConfigurationsPerKind;
- (BSMutableIntegerMap)consumersPerKind;
- (BSMutableIntegerMap)requestHIDAssertionsPerKind;
- (id)_viableConsumerForButtonKind:(int64_t)a3 event:(int64_t)a4 priority:(int64_t)a5;
- (id)acquireCaptureButtonSuppressionAssertionWithOptions:(unint64_t)a3 reason:(id)a4;
- (id)beginConsumingPressesForButtonKind:(int64_t)a3 eventConsumer:(id)a4 priority:(int64_t)a5;
- (id)deferHIDEventsForButtonKind:(int64_t)a3 toToken:(id)a4;
- (id)description;
- (id)registerAssociatedHintViewContextId:(unsigned int)a3 layerRenderId:(unint64_t)a4 layerSize:(CGSize)a5 forButtonKind:(int64_t)a6;
- (int64_t)toggleStateForButtonKind:(int64_t)a3;
- (void)_addEventConsumerInfo:(id)a3;
- (void)_mainQueue_handleButtonPressMessage:(int64_t)a3 forButtonKind:(int64_t)a4 priority:(int64_t)a5;
- (void)_resetEventMaskForButtonKind:(int64_t)a3;
- (void)_setApplicationClientEventMask:(unint64_t)a3 buttonKind:(int64_t)a4 priority:(int64_t)a5;
- (void)acquireHomeHardwareButtonHintSuppressionAssertionForReason:(id)a3 completion:(id)a4;
- (void)consumerInfoWillInvalidate:(id)a3;
- (void)fetchHapticTypeForButtonKind:(int64_t)a3 completion:(id)a4;
- (void)handleButtonPressMessage:(int64_t)a3 forButtonKind:(int64_t)a4 priority:(int64_t)a5;
- (void)requestSystemGlowEffectWithInitialStyle:(int64_t)a3 completion:(id)a4;
- (void)setButtonConfigurationsPerKind:(id)a3;
- (void)setConsumersPerKind:(id)a3;
- (void)setHapticType:(int64_t)a3 forButtonKind:(int64_t)a4;
- (void)setRequestHIDAssertionsPerKind:(id)a3;
- (void)updateHintViewContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5;
- (void)updateSystemGlowStyle:(int64_t)a3;
@end

@implementation SBSHardwareButtonService

+ (SBSHardwareButtonService)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __42__SBSHardwareButtonService_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_1 != -1) {
    dispatch_once(&sharedInstance_onceToken_1, block);
  }
  v2 = (void *)sharedInstance_instance;
  return (SBSHardwareButtonService *)v2;
}

- (id)beginConsumingPressesForButtonKind:(int64_t)a3 eventConsumer:(id)a4 priority:(int64_t)a5
{
  id v9 = a4;
  if ((unint64_t)(a3 - 1) >= 6)
  {
    v12 = [MEMORY[0x1E4F28B00] currentHandler];
    [v12 handleFailureInMethod:a2, self, @"SBSHardwareButtonService.m", 419, @"Invalid parameter not satisfying: %@", @"_SBSHardwareButtonServiceIsSupportedConsumerButtonKind(buttonKind)" object file lineNumber description];
  }
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  v10 = +[_SBSHardwareButtonEventConsumerInfo infoWithConsumer:v9];
  [v10 setButtonKind:a3];
  [v10 setEventPriority:a5];
  [(SBSHardwareButtonService *)self _addEventConsumerInfo:v10];

  return v10;
}

uint64_t __42__SBSHardwareButtonService_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_instance = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x1F41817F8]();
}

- (void)_resetEventMaskForButtonKind:(int64_t)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  buttonConfigurationsPerKind = self->_buttonConfigurationsPerKind;
  if (!buttonConfigurationsPerKind)
  {
    v6 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    v7 = self->_buttonConfigurationsPerKind;
    self->_buttonConfigurationsPerKind = v6;

    buttonConfigurationsPerKind = self->_buttonConfigurationsPerKind;
  }
  v8 = [(BSMutableIntegerMap *)buttonConfigurationsPerKind objectForKey:a3];
  uint64_t v24 = [v8 eventMask];
  uint64_t v25 = [v8 maximumPriority];
  [(BSMutableIntegerMap *)self->_consumersPerKind objectForKey:a3];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = 0;
    uint64_t v14 = *(void *)v27;
LABEL_5:
    uint64_t v15 = 0;
    while (1)
    {
      if (*(void *)v27 != v14) {
        objc_enumerationMutation(v9);
      }
      v16 = *(void **)(*((void *)&v26 + 1) + 8 * v15);
      if ([v16 buttonKind] == a3)
      {
        v13 |= [v16 eventMask];
        uint64_t v17 = [v16 eventPriority];
        if (v17 > v12) {
          uint64_t v12 = v17;
        }
        if ((v13 & 0x10000) != 0) {
          break;
        }
      }
      if (v11 == ++v15)
      {
        uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v11) {
          goto LABEL_5;
        }
        break;
      }
    }
  }
  else
  {
    uint64_t v12 = 0;
    uint64_t v13 = 0;
  }

  if (v24 == v13)
  {
    int v18 = v25;
    if (v25 == v12) {
      goto LABEL_26;
    }
  }
  else
  {
    v19 = SBLogCommon();
    int v18 = v25;
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      v20 = NSStringFromSBSHardwareButtonKind(a3);
      *(_DWORD *)buf = 134218498;
      *(void *)v31 = v24;
      *(_WORD *)&v31[8] = 2048;
      *(void *)v32 = v13;
      *(_WORD *)&v32[8] = 2114;
      v33 = v20;
      _os_log_impl(&dword_18FBC5000, v19, OS_LOG_TYPE_DEFAULT, "changing event mask from:%lX to:%lX for buttonKind %{public}@", buf, 0x20u);
    }
    if (v25 == v12) {
      goto LABEL_25;
    }
  }
  v21 = SBLogCommon();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    v22 = NSStringFromSBSHardwareButtonKind(a3);
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)v31 = v18;
    *(_WORD *)&v31[4] = 1024;
    *(_DWORD *)&v31[6] = v12;
    *(_WORD *)v32 = 2114;
    *(void *)&v32[2] = v22;
    _os_log_impl(&dword_18FBC5000, v21, OS_LOG_TYPE_DEFAULT, "changing priority from:%d to:%d for buttonKind %{public}@", buf, 0x18u);
  }
LABEL_25:
  v23 = objc_alloc_init(_SBSHardwareButtonEventConfiguration);
  [(_SBSHardwareButtonEventConfiguration *)v23 setEventMask:v13];
  [(_SBSHardwareButtonEventConfiguration *)v23 setMaximumPriority:v12];
  [(BSMutableIntegerMap *)self->_buttonConfigurationsPerKind setObject:v23 forKey:a3];
  [(SBSHardwareButtonService *)self _setApplicationClientEventMask:v13 buttonKind:a3 priority:v12];

LABEL_26:
}

- (void)_setApplicationClientEventMask:(unint64_t)a3 buttonKind:(int64_t)a4 priority:(int64_t)a5
{
  id v8 = [(SBSAbstractSystemService *)self client];
  [v8 setEventMask:a3 forButtonKind:a4 priority:a5];
}

- (void)_addEventConsumerInfo:(id)a3
{
  id v9 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  [v9 setService:self];
  uint64_t v4 = [v9 buttonKind];
  consumersPerKind = self->_consumersPerKind;
  if (!consumersPerKind)
  {
    v6 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    v7 = self->_consumersPerKind;
    self->_consumersPerKind = v6;

    consumersPerKind = self->_consumersPerKind;
  }
  id v8 = [(BSMutableIntegerMap *)consumersPerKind objectForKey:v4];
  if (!v8)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(BSMutableIntegerMap *)self->_consumersPerKind setObject:v8 forKey:v4];
  }
  [v8 insertObject:v9 atIndex:0];
  -[SBSHardwareButtonService _resetEventMaskForButtonKind:](self, "_resetEventMaskForButtonKind:", [v9 buttonKind]);
}

- (void)acquireHomeHardwareButtonHintSuppressionAssertionForReason:(id)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SBSAbstractFacilityService *)self callbackQueue];
  id v9 = [(SBSAbstractSystemService *)self client];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__SBSHardwareButtonService_acquireHomeHardwareButtonHintSuppressionAssertionForReason_completion___block_invoke;
  v12[3] = &unk_1E566BB30;
  id v13 = v8;
  id v14 = v6;
  id v10 = v6;
  id v11 = v8;
  [v9 acquireAssertionOfType:0 forReason:v7 withCompletion:v12];
}

void __98__SBSHardwareButtonService_acquireHomeHardwareButtonHintSuppressionAssertionForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __98__SBSHardwareButtonService_acquireHomeHardwareButtonHintSuppressionAssertionForReason_completion___block_invoke_2;
  v7[3] = &unk_1E566B4B0;
  uint64_t v4 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  id v8 = v3;
  id v9 = v5;
  id v6 = v3;
  dispatch_async(v4, v7);
}

uint64_t __98__SBSHardwareButtonService_acquireHomeHardwareButtonHintSuppressionAssertionForReason_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32));
}

- (id)description
{
  id v3 = [MEMORY[0x1E4F4F718] builderWithObject:self];
  id v4 = (id)[v3 appendObject:self->_buttonConfigurationsPerKind withName:@"buttonConfigurationsPerKind" skipIfNil:0];
  id v5 = (id)[v3 appendObject:self->_consumersPerKind withName:@"consumersPerKind" skipIfNil:0];
  id v6 = [v3 build];

  return v6;
}

- (id)_viableConsumerForButtonKind:(int64_t)a3 event:(int64_t)a4 priority:(int64_t)a5
{
  char v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(BSMutableIntegerMap *)self->_consumersPerKind objectForKey:a3];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v17;
    uint64_t v11 = (1 << v6) | 0x10000;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v7);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 eventPriority:v16] >= a5 && ([v13 eventMask] & v11) != 0)
        {
          id v14 = v13;
          goto LABEL_12;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v16 objects:v20 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  id v14 = 0;
LABEL_12:

  return v14;
}

- (void)_mainQueue_handleButtonPressMessage:(int64_t)a3 forButtonKind:(int64_t)a4 priority:(int64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v10 = [(SBSHardwareButtonService *)self _viableConsumerForButtonKind:a4 event:a3 priority:a5];
  uint64_t v11 = SBLogCommon();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)uint64_t v21 = a3;
    *(_WORD *)&v21[4] = 2114;
    *(void *)&v21[6] = v10;
    __int16 v22 = 1024;
    LODWORD(v23) = a5;
    _os_log_impl(&dword_18FBC5000, v11, OS_LOG_TYPE_INFO, "dispatch eventType:%d to consumer:%{public}@ at priority:%d", buf, 0x18u);
  }

  if (v10)
  {
    unint64_t v12 = [v10 eventMask];
    id v13 = [v10 consumer];
    if (((v12 >> a3) & 1) == 0)
    {
      if ((v12 & 0x10000) != 0)
      {
LABEL_8:
        [v13 consumeAnyPressEventForButtonKind:a4];
        goto LABEL_23;
      }
      id v14 = [MEMORY[0x1E4F28B00] currentHandler];
      [v14 handleFailureInMethod:a2, self, @"SBSHardwareButtonService.m", 372, @"Invalid parameter not satisfying: %@", @"NO" object file lineNumber description];
    }
    switch(a3)
    {
      case 0:
        goto LABEL_8;
      case 1:
        [v13 consumeSinglePressUpForButtonKind:a4];
        break;
      case 2:
        [v13 consumeDoublePressDownForButtonKind:a4];
        break;
      case 3:
        [v13 consumeDoublePressUpForButtonKind:a4];
        break;
      case 4:
        [v13 consumeTriplePressUpForButtonKind:a4];
        break;
      case 5:
        [v13 consumeLongPressForButtonKind:a4];
        break;
      case 6:
        [v13 consumeSinglePressDownForButtonKind:a4];
        break;
      case 7:
        long long v17 = v13;
        uint64_t v18 = 1;
        goto LABEL_19;
      case 8:
        long long v17 = v13;
        uint64_t v18 = 0;
LABEL_19:
        [v17 consumeStateChange:v18 forButtonKind:a4];
        break;
      default:
        long long v19 = SBLogCommon();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
          -[SBSHardwareButtonService _mainQueue_handleButtonPressMessage:forButtonKind:priority:](a3, v19);
        }

        break;
    }
  }
  else
  {
    id v13 = SBLogCommon();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      uint64_t v15 = NSStringFromSBSHardwareButtonKind(a4);
      long long v16 = [(BSMutableIntegerMap *)self->_consumersPerKind objectForKey:a4];
      *(_DWORD *)buf = 138543874;
      *(void *)uint64_t v21 = v15;
      *(_WORD *)&v21[8] = 1024;
      *(_DWORD *)&v21[10] = a3;
      __int16 v22 = 2114;
      v23 = v16;
      _os_log_error_impl(&dword_18FBC5000, v13, OS_LOG_TYPE_ERROR, "no viable consumer for button:%{public}@ eventType:%d -- consumers:%{public}@", buf, 0x1Cu);
    }
  }
LABEL_23:
}

- (int64_t)toggleStateForButtonKind:(int64_t)a3
{
  if (a3 != 6) {
    return -1;
  }
  id v3 = [(SBSAbstractSystemService *)self client];
  int64_t v4 = [v3 toggleStateForButtonKind:6];

  return v4;
}

- (id)deferHIDEventsForButtonKind:(int64_t)a3 toToken:(id)a4
{
  id v7 = a4;
  if (!v7)
  {
    uint64_t v21 = [MEMORY[0x1E4F28B00] currentHandler];
    [v21 handleFailureInMethod:a2, self, @"SBSHardwareButtonService.m", 441, @"Invalid parameter not satisfying: %@", @"token != nil" object file lineNumber description];
  }
  if (a3 != 7)
  {
    __int16 v22 = [MEMORY[0x1E4F28B00] currentHandler];
    [v22 handleFailureInMethod:a2, self, @"SBSHardwareButtonService.m", 442, @"Invalid parameter not satisfying: %@", @"_SBSHardwareButtonServiceIsSupportedDeferringButtonKind(kind)" object file lineNumber description];
  }
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  requestHIDAssertionsPerKind = self->_requestHIDAssertionsPerKind;
  if (!requestHIDAssertionsPerKind)
  {
    uint64_t v9 = (BSMutableIntegerMap *)objc_alloc_init(MEMORY[0x1E4F4F788]);
    uint64_t v10 = self->_requestHIDAssertionsPerKind;
    self->_requestHIDAssertionsPerKind = v9;

    requestHIDAssertionsPerKind = self->_requestHIDAssertionsPerKind;
  }
  id v11 = [(BSMutableIntegerMap *)requestHIDAssertionsPerKind objectForKey:a3];
  if (!v11)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    [(BSMutableIntegerMap *)self->_requestHIDAssertionsPerKind setObject:v11 forKey:a3];
  }
  id v12 = objc_alloc(MEMORY[0x1E4F4F838]);
  id v13 = NSString;
  id v14 = NSStringFromSBSHardwareButtonKind(a3);
  uint64_t v15 = [v13 stringWithFormat:@"I wanna %@", v14];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __64__SBSHardwareButtonService_deferHIDEventsForButtonKind_toToken___block_invoke;
  v23[3] = &unk_1E566BB58;
  id v16 = v11;
  id v24 = v16;
  uint64_t v25 = self;
  id v17 = v7;
  id v26 = v17;
  int64_t v27 = a3;
  uint64_t v18 = (void *)[v12 initWithIdentifier:@"HID event request" forReason:v15 invalidationBlock:v23];

  [v16 addObject:v18];
  if ([v16 count] == 1)
  {
    long long v19 = [(SBSAbstractSystemService *)self client];
    [v19 setRequestsHIDEvents:1 token:v17 forButtonKind:a3];
  }
  return v18;
}

void __64__SBSHardwareButtonService_deferHIDEventsForButtonKind_toToken___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) removeObject:a2];
  if (![*(id *)(a1 + 32) count])
  {
    id v3 = [*(id *)(a1 + 40) client];
    [v3 setRequestsHIDEvents:0 token:*(void *)(a1 + 48) forButtonKind:*(void *)(a1 + 56)];
  }
}

- (void)setHapticType:(int64_t)a3 forButtonKind:(int64_t)a4
{
  id v6 = [(SBSAbstractSystemService *)self client];
  [v6 setHapticType:a3 forButtonKind:a4];
}

- (void)fetchHapticTypeForButtonKind:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  if (v6)
  {
    id v7 = [(SBSAbstractFacilityService *)self callbackQueue];
    uint64_t v8 = [(SBSAbstractSystemService *)self client];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __68__SBSHardwareButtonService_fetchHapticTypeForButtonKind_completion___block_invoke;
    v10[3] = &unk_1E566BBA8;
    id v11 = v7;
    id v12 = v6;
    id v9 = v7;
    [v8 fetchHapticTypeForButtonKind:a3 completion:v10];
  }
}

void __68__SBSHardwareButtonService_fetchHapticTypeForButtonKind_completion___block_invoke(uint64_t a1, uint64_t a2)
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __68__SBSHardwareButtonService_fetchHapticTypeForButtonKind_completion___block_invoke_2;
  v4[3] = &unk_1E566BB80;
  id v3 = *(NSObject **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = a2;
  dispatch_async(v3, v4);
}

uint64_t __68__SBSHardwareButtonService_fetchHapticTypeForButtonKind_completion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(a1 + 40));
}

- (BOOL)getAssociatedHintViewsSupported
{
  v2 = [(SBSAbstractSystemService *)self client];
  char v3 = [v2 getAssociatedHintViewsSupported];

  return v3;
}

- (id)registerAssociatedHintViewContextId:(unsigned int)a3 layerRenderId:(unint64_t)a4 layerSize:(CGSize)a5 forButtonKind:(int64_t)a6
{
  double height = a5.height;
  double width = a5.width;
  uint64_t v10 = *(void *)&a3;
  if ((unint64_t)a6 > 0xA || ((1 << a6) & 0x51C) == 0)
  {
    id v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2, self, @"SBSHardwareButtonService.m", 490, @"Invalid parameter not satisfying: %@", @"_SBSHardwareButtonServiceIsSupportedHintViewButtonKind(buttonKind)" object file lineNumber description];
  }
  id v13 = [(SBSAbstractSystemService *)self client];
  id v14 = [v13 registerAssociatedHintViewContextId:v10 layerRenderId:a4 layerSize:a6 forButtonKind:width height:height];

  return v14;
}

- (void)updateHintViewContentVisibility:(int64_t)a3 forButton:(int64_t)a4 animationSettings:(id)a5
{
  id v8 = a5;
  id v9 = [(SBSAbstractSystemService *)self client];
  [v9 updateHintViewContentVisibility:a3 forButton:a4 animationSettings:v8];
}

- (void)requestSystemGlowEffectWithInitialStyle:(int64_t)a3 completion:(id)a4
{
  id v6 = a4;
  id v7 = [(SBSAbstractSystemService *)self client];
  [v7 requestSystemGlowEffectWithInitialStyle:a3 completion:v6];
}

- (void)updateSystemGlowStyle:(int64_t)a3
{
  id v4 = [(SBSAbstractSystemService *)self client];
  [v4 updateSystemGlowStyle:a3];
}

- (id)acquireCaptureButtonSuppressionAssertionWithOptions:(unint64_t)a3 reason:(id)a4
{
  id v6 = a4;
  captureButtonRestrictionService = self->_captureButtonRestrictionService;
  if (!captureButtonRestrictionService)
  {
    id v8 = objc_alloc_init(SBSCaptureButtonRestrictionService);
    id v9 = self->_captureButtonRestrictionService;
    self->_captureButtonRestrictionService = v8;

    captureButtonRestrictionService = self->_captureButtonRestrictionService;
  }
  uint64_t v10 = [(SBSCaptureButtonRestrictionService *)captureButtonRestrictionService acquireCaptureButtonSuppressionAssertionWithOptions:a3 reason:v6];

  return v10;
}

- (void)handleButtonPressMessage:(int64_t)a3 forButtonKind:(int64_t)a4 priority:(int64_t)a5
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __76__SBSHardwareButtonService_handleButtonPressMessage_forButtonKind_priority___block_invoke;
  v5[3] = &unk_1E566BBD0;
  v5[4] = self;
  v5[5] = a3;
  v5[6] = a4;
  v5[7] = a5;
  dispatch_async(MEMORY[0x1E4F14428], v5);
}

uint64_t __76__SBSHardwareButtonService_handleButtonPressMessage_forButtonKind_priority___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _mainQueue_handleButtonPressMessage:*(void *)(a1 + 40) forButtonKind:*(void *)(a1 + 48) priority:*(void *)(a1 + 56)];
}

- (void)consumerInfoWillInvalidate:(id)a3
{
  id v6 = a3;
  dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
  uint64_t v4 = [v6 buttonKind];
  id v5 = [(BSMutableIntegerMap *)self->_consumersPerKind objectForKey:v4];
  [v5 removeObject:v6];
  if (![v5 count]) {
    [(BSMutableIntegerMap *)self->_consumersPerKind removeObjectForKey:v4];
  }
  -[SBSHardwareButtonService _resetEventMaskForButtonKind:](self, "_resetEventMaskForButtonKind:", [v6 buttonKind]);
}

- (BSMutableIntegerMap)consumersPerKind
{
  return self->_consumersPerKind;
}

- (void)setConsumersPerKind:(id)a3
{
}

- (BSMutableIntegerMap)buttonConfigurationsPerKind
{
  return self->_buttonConfigurationsPerKind;
}

- (void)setButtonConfigurationsPerKind:(id)a3
{
}

- (BSMutableIntegerMap)requestHIDAssertionsPerKind
{
  return self->_requestHIDAssertionsPerKind;
}

- (void)setRequestHIDAssertionsPerKind:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestHIDAssertionsPerKind, 0);
  objc_storeStrong((id *)&self->_buttonConfigurationsPerKind, 0);
  objc_storeStrong((id *)&self->_consumersPerKind, 0);
  objc_storeStrong((id *)&self->_captureButtonRestrictionService, 0);
}

- (void)_mainQueue_handleButtonPressMessage:(int)a1 forButtonKind:(NSObject *)a2 priority:.cold.1(int a1, NSObject *a2)
{
  uint64_t v3 = *MEMORY[0x1E4F143B8];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_error_impl(&dword_18FBC5000, a2, OS_LOG_TYPE_ERROR, "unsupported event type:%d", (uint8_t *)v2, 8u);
}

@end