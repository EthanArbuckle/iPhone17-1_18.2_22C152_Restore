@interface PKFieldDetector
- (PKFieldDetector)init;
- (PKFieldDetector)initWithDelegate:(id)a3;
- (PKFieldDetectorDelegate)delegate;
- (PKFieldProperties)fieldProperties;
- (void)_endLookup;
- (void)_evaulatePersistentFieldDetectionEnablementReasons;
- (void)_invalidateFieldDetectSession;
- (void)_notify;
- (void)_restartFieldDetectSession;
- (void)_setPersistentFieldDetectionEnabled:(BOOL)a3;
- (void)_startFieldDetectSession;
- (void)dealloc;
- (void)fieldDetectSession:(id)a3 didEnterFieldWithNotification:(id)a4;
- (void)fieldDetectSessionDidEndUnexpectedly:(id)a3;
- (void)fieldDetectSessionDidExitField:(id)a3;
- (void)registerObserver:(id)a3;
- (void)requestPersistentFieldDetectionEnabled:(BOOL)a3 withReason:(unint64_t)a4;
- (void)setDelegate:(id)a3;
- (void)setPersistentFieldDetectionEnabled:(BOOL)a3;
- (void)unregisterObserver:(id)a3;
- (void)updateRadioState;
@end

@implementation PKFieldDetector

- (PKFieldDetector)init
{
  return [(PKFieldDetector *)self initWithDelegate:0];
}

- (PKFieldDetector)initWithDelegate:(id)a3
{
  id v4 = a3;
  if (PKNearFieldRadioIsAvailable()
    && !+[PKSecureElement isInFailForward])
  {
    v21.receiver = self;
    v21.super_class = (Class)PKFieldDetector;
    v6 = [(PKFieldDetector *)&v21 init];
    v7 = v6;
    if (v6)
    {
      v6->_lock._os_unfair_lock_opaque = 0;
      v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, -1);
      v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);

      dispatch_queue_t v10 = dispatch_queue_create("com.apple.passkit.fielddetector", v9);
      fieldDetectorSerialQueue = v7->_fieldDetectorSerialQueue;
      v7->_fieldDetectorSerialQueue = (OS_dispatch_queue *)v10;

      dispatch_queue_t v12 = dispatch_queue_create("com.apple.passkit.fielddetector.reply", v9);
      replyQueue = v7->_replyQueue;
      v7->_replyQueue = (OS_dispatch_queue *)v12;

      uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28D30], "pk_weakObjectsHashTableUsingPointerPersonality");
      observers = v7->_observers;
      v7->_observers = (NSHashTable *)v14;

      v7->_nfcRadioEnabled = PKNearFieldRadioIsEnabled();
      v16 = v7->_fieldDetectorSerialQueue;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __36__PKFieldDetector_initWithDelegate___block_invoke;
      block[3] = &unk_1E56D8AE0;
      v17 = v7;
      v20 = v17;
      dispatch_async(v16, block);
      objc_storeWeak(v17 + 10, v4);
    }
    self = v7;
    v5 = self;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

uint64_t __36__PKFieldDetector_initWithDelegate___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startFieldDetectSession];
}

- (void)dealloc
{
  [(PKFieldPropertiesProbe *)self->_fieldPropertiesProbe invalidate];
  [(NFFieldDetectSession *)self->_fieldDetectSession setDelegate:0];
  [(NFFieldDetectSession *)self->_fieldDetectSession endSession];
  v3.receiver = self;
  v3.super_class = (Class)PKFieldDetector;
  [(PKFieldDetector *)&v3 dealloc];
}

- (void)fieldDetectSession:(id)a3 didEnterFieldWithNotification:(id)a4
{
  id v5 = a4;
  kdebug_trace();
  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __68__PKFieldDetector_fieldDetectSession_didEnterFieldWithNotification___block_invoke;
  v8[3] = &unk_1E56D8A90;
  v8[4] = self;
  id v9 = v5;
  id v7 = v5;
  dispatch_async(fieldDetectorSerialQueue, v8);
}

void __68__PKFieldDetector_fieldDetectSession_didEnterFieldWithNotification___block_invoke(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 28));
  id WeakRetained = objc_loadWeakRetained((id *)(*(void *)(a1 + 32) + 80));
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 28));
  if (WeakRetained
    && ([WeakRetained fieldDetectorShouldProcessFieldEvents:*(void *)(a1 + 32)] & 1) == 0)
  {
    id v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Field Detector Ignoring Field Entrance", buf, 2u);
    }
  }
  else
  {
    [*(id *)(a1 + 32) _endLookup];
    objc_super v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v4;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Field Detector Did Enter Field: %@.", buf, 0xCu);
    }

    id v5 = +[PKFieldProperties fieldPropertiesForFieldNotification:*(void *)(a1 + 40)];
    if ([v5 terminalType] == 5)
    {
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Field Detector Ignoring Connection Handover Entrance", buf, 2u);
      }
    }
    else
    {
      +[PKAnalyticsReporter beginSubjectReporting:@"fieldDetect"];
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v6 setObject:@"fieldEntered" forKeyedSubscript:@"eventType"];
      objc_super v3 = v6;
      id v7 = v5;
      unint64_t v8 = [v7 terminalType];
      if (v8 <= 5)
      {
        if (((1 << v8) & 0x2D) == 0)
        {
          if (v8 != 1) {
            [v3 setObject:@"identity" forKeyedSubscript:@"readerType"];
          }
          [v3 setObject:@"payment" forKeyedSubscript:@"readerType"];
        }
        [v3 setObject:@"other" forKeyedSubscript:@"readerType"];
      }

      +[PKAnalyticsReporter subject:@"fieldDetect" sendEvent:v3];
      if (PKFieldPropertiesCanLookupSecondaryProperties(v7))
      {
        [v7 setSecondaryPropertiesRequired:1];
        id v9 = +[PKFieldPropertiesProbe createProbeForProperties:v7 queue:*(void *)(*(void *)(a1 + 32) + 64)];
        uint64_t v10 = *(void *)(a1 + 32);
        v11 = *(void **)(v10 + 56);
        *(void *)(v10 + 56) = v9;

        uint64_t v12 = *(void *)(a1 + 32);
        v13 = *(void **)(v12 + 56);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __68__PKFieldDetector_fieldDetectSession_didEnterFieldWithNotification___block_invoke_32;
        v14[3] = &unk_1E56F0AE8;
        v14[4] = v12;
        [v13 beginWithCompletion:v14];
      }
      else
      {
        objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), v5);
        [*(id *)(a1 + 32) _notify];
      }
    }
  }
}

void __68__PKFieldDetector_fieldDetectSession_didEnterFieldWithNotification___block_invoke_32(uint64_t a1, void *a2, void *a3)
{
  id v8 = a2;
  id v5 = a3;
  if (*(id *)(*(void *)(a1 + 32) + 56) == v8)
  {
    [v8 invalidate];
    uint64_t v6 = *(void *)(a1 + 32);
    id v7 = *(void **)(v6 + 56);
    *(void *)(v6 + 56) = 0;

    objc_storeStrong((id *)(*(void *)(a1 + 32) + 48), a3);
    [*(id *)(a1 + 32) _notify];
  }
}

- (void)fieldDetectSessionDidExitField:(id)a3
{
  kdebug_trace();
  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __50__PKFieldDetector_fieldDetectSessionDidExitField___block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(fieldDetectorSerialQueue, block);
}

void __50__PKFieldDetector_fieldDetectSessionDidExitField___block_invoke(uint64_t a1)
{
  v14[1] = *MEMORY[0x1E4F143B8];
  v13 = @"eventType";
  v14[0] = @"fieldExited";
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v14 forKeys:&v13 count:1];
  +[PKAnalyticsReporter subject:@"fieldDetect" sendEvent:v2];

  +[PKAnalyticsReporter endSubjectReporting:@"fieldDetect"];
  objc_super v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Field Detector Did Exit Field", buf, 2u);
  }

  [*(id *)(a1 + 32) _endLookup];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 28));
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 48);
  if (v5)
  {
    *(void *)(v4 + 48) = 0;

    id v6 = [*(id *)(*(void *)(a1 + 32) + 32) allObjects];
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 28));
    if (v6)
    {
      id v7 = *(NSObject **)(*(void *)(a1 + 32) + 72);
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __50__PKFieldDetector_fieldDetectSessionDidExitField___block_invoke_35;
      v9[3] = &unk_1E56D8A90;
      id v6 = v6;
      uint64_t v8 = *(void *)(a1 + 32);
      id v10 = v6;
      uint64_t v11 = v8;
      dispatch_async(v7, v9);
    }
  }
  else
  {
    os_unfair_lock_unlock((os_unfair_lock_t)(v4 + 28));
    id v6 = 0;
  }
}

void __50__PKFieldDetector_fieldDetectSessionDidExitField___block_invoke_35(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        id v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "fieldDetectorDidExitField:", *(void *)(a1 + 40), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)fieldDetectSessionDidEndUnexpectedly:(id)a3
{
  uint64_t v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Field Detection Session Ended Unexpectedly", buf, 2u);
  }

  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __56__PKFieldDetector_fieldDetectSessionDidEndUnexpectedly___block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(fieldDetectorSerialQueue, block);
}

uint64_t __56__PKFieldDetector_fieldDetectSessionDidEndUnexpectedly___block_invoke(uint64_t a1)
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"eventType";
  v5[0] = @"fieldDetectSessionEndedUnexpectedly";
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  +[PKAnalyticsReporter subject:@"fieldDetect" sendEvent:v2];

  +[PKAnalyticsReporter endSubjectReporting:@"fieldDetect"];
  [*(id *)(a1 + 32) _invalidateFieldDetectSession];
  return [*(id *)(a1 + 32) _restartFieldDetectSession];
}

- (void)updateRadioState
{
  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __35__PKFieldDetector_updateRadioState__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_async(fieldDetectorSerialQueue, block);
}

uint64_t __35__PKFieldDetector_updateRadioState__block_invoke(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 25) = PKNearFieldRadioIsEnabled();
  uint64_t result = *(void *)(a1 + 32);
  if (*(unsigned char *)(result + 25))
  {
    if (*(unsigned char *)(result + 24) && !*(void *)(result + 8))
    {
      return [(id)result _startFieldDetectSession];
    }
  }
  else
  {
    return [(id)result _invalidateFieldDetectSession];
  }
  return result;
}

- (void)requestPersistentFieldDetectionEnabled:(BOOL)a3 withReason:(unint64_t)a4
{
  if (a4)
  {
    fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __69__PKFieldDetector_requestPersistentFieldDetectionEnabled_withReason___block_invoke;
    block[3] = &unk_1E56F0B10;
    BOOL v7 = a3;
    void block[4] = self;
    void block[5] = a4;
    dispatch_async(fieldDetectorSerialQueue, block);
  }
  else
  {
    uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Field Detector: Missing reason when enabling field detect", buf, 2u);
    }
  }
}

void __69__PKFieldDetector_requestPersistentFieldDetectionEnabled_withReason___block_invoke(uint64_t a1)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v2 = PKFieldDetectorPersistentFieldDetectionReasonToString(*(void *)(a1 + 40));
  uint64_t v3 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v4 = "enable";
    if (!*(unsigned char *)(a1 + 48)) {
      uint64_t v4 = "disable";
    }
    int v11 = 136446466;
    uint64_t v12 = v4;
    __int16 v13 = 2112;
    uint64_t v14 = v2;
    _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Field Detector: Requesting to %{public}s field detect for reason: %@", (uint8_t *)&v11, 0x16u);
  }

  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(void *)(v5 + 40);
  uint64_t v8 = v7 & ~v6;
  uint64_t v9 = v6 | v7;
  if (!*(unsigned char *)(a1 + 48)) {
    uint64_t v9 = v8;
  }
  *(void *)(v5 + 40) = v9;
  long long v10 = *(void **)(a1 + 32);
  if (v7 != v10[5]) {
    [v10 _evaulatePersistentFieldDetectionEnablementReasons];
  }
}

- (void)setPersistentFieldDetectionEnabled:(BOOL)a3
{
  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __54__PKFieldDetector_setPersistentFieldDetectionEnabled___block_invoke;
  v4[3] = &unk_1E56D8B80;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(fieldDetectorSerialQueue, v4);
}

uint64_t __54__PKFieldDetector_setPersistentFieldDetectionEnabled___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _setPersistentFieldDetectionEnabled:*(unsigned __int8 *)(a1 + 40)];
}

- (void)registerObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    BOOL v5 = self->_fieldProperties;
    if ([(NSHashTable *)self->_observers containsObject:v4])
    {
      os_unfair_lock_unlock(&self->_lock);
    }
    else
    {
      [(NSHashTable *)self->_observers addObject:v4];
      os_unfair_lock_unlock(&self->_lock);
      if (v5 && (objc_opt_respondsToSelector() & 1) != 0)
      {
        replyQueue = self->_replyQueue;
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __36__PKFieldDetector_registerObserver___block_invoke;
        block[3] = &unk_1E56D8AB8;
        id v8 = v4;
        uint64_t v9 = self;
        long long v10 = v5;
        dispatch_async(replyQueue, block);
      }
    }
  }
}

uint64_t __36__PKFieldDetector_registerObserver___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) fieldDetectorDidEnterField:*(void *)(a1 + 40) withProperties:*(void *)(a1 + 48)];
}

- (void)unregisterObserver:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    os_unfair_lock_lock(&self->_lock);
    [(NSHashTable *)self->_observers removeObject:v4];
    os_unfair_lock_unlock(&self->_lock);
  }
}

- (PKFieldProperties)fieldProperties
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id v4 = self->_fieldProperties;
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (PKFieldDetectorDelegate)delegate
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  os_unfair_lock_unlock(p_lock);
  return (PKFieldDetectorDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
  p_lock = &self->_lock;
  id v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_storeWeak((id *)&self->_delegate, v5);

  os_unfair_lock_unlock(p_lock);
}

- (void)_evaulatePersistentFieldDetectionEnablementReasons
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t enablePersistentFieldDetectionReasons = self->_enablePersistentFieldDetectionReasons;
  id v4 = PKFieldDetectorPersistentFieldDetectionReasonToString(enablePersistentFieldDetectionReasons);
  id v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = "disable";
    if (enablePersistentFieldDetectionReasons) {
      uint64_t v6 = "enable";
    }
    int v7 = 136446466;
    id v8 = v6;
    __int16 v9 = 2112;
    long long v10 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Field Detector: Requesting to %{public}s field detect with reasons: %@", (uint8_t *)&v7, 0x16u);
  }

  [(PKFieldDetector *)self _setPersistentFieldDetectionEnabled:enablePersistentFieldDetectionReasons != 0];
}

- (void)_setPersistentFieldDetectionEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (!PKNearFieldRadioIsAvailable()) {
    return;
  }
  id v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = @"Disabling";
    if (v3) {
      uint64_t v6 = @"Enabling";
    }
    int v14 = 138543362;
    uint64_t v15 = v6;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Field Detector: %{public}@ field detection...", (uint8_t *)&v14, 0xCu);
  }

  int v7 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
  int v8 = [v7 setFieldDetectEnabled:v3];
  BOOL v9 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v8)
  {
    if (v9)
    {
      long long v10 = @"Disabled";
      if (v3) {
        long long v10 = @"Enabled";
      }
      int v14 = 138543362;
      uint64_t v15 = v10;
      uint64_t v11 = "Field Detector: %{public}@ field detection.";
      uint64_t v12 = v5;
      uint32_t v13 = 12;
      goto LABEL_13;
    }
  }
  else if (v9)
  {
    LOWORD(v14) = 0;
    uint64_t v11 = "Field Detector: failed to mutate field detection state.";
    uint64_t v12 = v5;
    uint32_t v13 = 2;
LABEL_13:
    _os_log_impl(&dword_190E10000, v12, OS_LOG_TYPE_DEFAULT, v11, (uint8_t *)&v14, v13);
  }

  if (v3 && !self->_fieldDetectSessionRequested) {
    [(PKFieldDetector *)self _startFieldDetectSession];
  }
}

- (void)_invalidateFieldDetectSession
{
  [(NFFieldDetectSession *)self->_fieldDetectSession setDelegate:0];
  [(NFFieldDetectSession *)self->_fieldDetectSession endSession];
  fieldDetectSession = self->_fieldDetectSession;
  self->_fieldDetectSession = 0;

  os_unfair_lock_lock(&self->_lock);
  fieldProperties = self->_fieldProperties;
  self->_fieldProperties = 0;

  os_unfair_lock_unlock(&self->_lock);
  [(PKFieldDetector *)self _endLookup];
}

- (void)_restartFieldDetectSession
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = self->_fieldDetectSessionRetryCount + 1;
  self->_fieldDetectSessionRetryCount = v3;
  double v4 = 0.0;
  if (v3 >= 4) {
    double v4 = fmin((exp2((double)v3) + -1.0) * 0.5, 600.0);
  }
  id v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v10 = v4;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Attempting to Restart Field Detection Session After Delay (%.2f seconds)...", buf, 0xCu);
  }

  dispatch_time_t v6 = dispatch_time(0, (uint64_t)(v4 * 1000000000.0));
  fieldDetectorSerialQueue = self->_fieldDetectorSerialQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__PKFieldDetector__restartFieldDetectSession__block_invoke;
  block[3] = &unk_1E56D8AE0;
  void block[4] = self;
  dispatch_after(v6, fieldDetectorSerialQueue, block);
}

uint64_t __45__PKFieldDetector__restartFieldDetectSession__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _startFieldDetectSession];
}

- (void)_startFieldDetectSession
{
  if (!self->_fieldDetectSessionRequested) {
    self->_fieldDetectSessionRequested = 1;
  }
  if (self->_nfcRadioEnabled)
  {
    unint64_t v3 = [PKGetClassNFHardwareManager() sharedHardwareManagerWithNoUI];
    double v4 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Starting Field Detection Session...", buf, 2u);
    }

    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __43__PKFieldDetector__startFieldDetectSession__block_invoke;
    v6[3] = &unk_1E56F0B38;
    v6[4] = self;
    id v5 = (id)[v3 startFieldDetectSession:v6];
  }
  else
  {
    unint64_t v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Cannot start field detect session because the NFC radio is disabled", buf, 2u);
    }
  }
}

void __43__PKFieldDetector__startFieldDetectSession__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  int v8 = *(NSObject **)(v7 + 64);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __43__PKFieldDetector__startFieldDetectSession__block_invoke_2;
  block[3] = &unk_1E56D8AB8;
  id v12 = v5;
  id v13 = v6;
  uint64_t v14 = v7;
  id v9 = v6;
  id v10 = v5;
  dispatch_async(v8, block);
}

void __43__PKFieldDetector__startFieldDetectSession__block_invoke_2(id *a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (!a1[4] || a1[5])
  {
    id v2 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      id v3 = a1[5];
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error Starting Field Detection Session: %@", (uint8_t *)&v10, 0xCu);
    }

    double v4 = [a1[5] domain];
    id v5 = [NSString stringWithUTF8String:"nfcd"];
    if ([v4 isEqualToString:v5])
    {
      uint64_t v6 = [a1[5] code];

      if (v6 == 14) {
        return;
      }
    }
    else
    {
    }
    [a1[6] _restartFieldDetectSession];
    return;
  }
  uint64_t v7 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v10) = 0;
    _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "Field Detection Session Started", (uint8_t *)&v10, 2u);
  }

  id v8 = a1[6];
  id v9 = (void *)*((void *)v8 + 1);
  if (v9)
  {
    [v9 setDelegate:0];
    [*((id *)a1[6] + 1) endSession];
    id v8 = a1[6];
  }
  objc_storeStrong((id *)v8 + 1, a1[4]);
  [a1[4] setDelegate:a1[6]];
  *((void *)a1[6] + 2) = 0;
}

- (void)_notify
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  double v4 = self->_fieldProperties;
  id v5 = [(NSHashTable *)self->_observers allObjects];
  os_unfair_lock_unlock(p_lock);
  uint64_t v6 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v4;
    _os_log_impl(&dword_190E10000, v6, OS_LOG_TYPE_DEFAULT, "Field Detector Did Enter Field With Properties: %@", buf, 0xCu);
  }

  replyQueue = self->_replyQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __26__PKFieldDetector__notify__block_invoke;
  block[3] = &unk_1E56D8AB8;
  id v11 = v5;
  uint64_t v12 = self;
  id v13 = v4;
  id v8 = v4;
  id v9 = v5;
  dispatch_async(replyQueue, block);
}

void __26__PKFieldDetector__notify__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v9;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = *(void **)(*((void *)&v8 + 1) + 8 * v6);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v7, "fieldDetectorDidEnterField:withProperties:", *(void *)(a1 + 40), *(void *)(a1 + 48), (void)v8);
        }
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v4);
  }
}

- (void)_endLookup
{
  [(PKFieldPropertiesProbe *)self->_fieldPropertiesProbe invalidate];
  fieldPropertiesProbe = self->_fieldPropertiesProbe;
  self->_fieldPropertiesProbe = 0;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_fieldDetectorSerialQueue, 0);
  objc_storeStrong((id *)&self->_fieldPropertiesProbe, 0);
  objc_storeStrong((id *)&self->_fieldProperties, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_fieldDetectSession, 0);
}

@end