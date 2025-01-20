@interface PKODIAssessment
- (BOOL)allowPartialAssessment;
- (BOOL)currentAssessmentDidTimeout;
- (BOOL)isAssessing;
- (ODISession)odiSession;
- (PKODIAssessment)init;
- (id)currentAssessment;
- (void)_callAssessmentComputedBlocksAndDidTimeout:(BOOL)a3;
- (void)computeAssessment;
- (void)getAssessmentWithCompletion:(id)a3;
- (void)provideSessionFeedback:(unint64_t)a3;
- (void)setAllowPartialAssessment:(BOOL)a3;
- (void)setOdiSession:(id)a3;
- (void)startAssessment;
- (void)startAssessmentWithHostBundleIdentifier:(id)a3;
- (void)updateAssessment:(id)a3;
- (void)updateAssessmentWithHostBundleIdentifier:(id)a3;
- (void)updateAssessmentWithModel:(id)a3;
- (void)waitForAssessmentWithContinueBlock:(id)a3;
- (void)waitForAssessmentWithTimeout:(unint64_t)a3 startTimeoutFromAssessmentStart:(BOOL)a4 continueBlock:(id)a5;
@end

@implementation PKODIAssessment

- (PKODIAssessment)init
{
  v11.receiver = self;
  v11.super_class = (Class)PKODIAssessment;
  v2 = [(PKODIAssessment *)&v11 init];
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.passkitcore.PKODIAssessment.work", 0);
    workQueue = v3->_workQueue;
    v3->_workQueue = (OS_dispatch_queue *)v4;

    dispatch_queue_t v6 = dispatch_queue_create("com.apple.passkitcore.PKODIAssessment.reply", 0);
    replyQueue = v3->_replyQueue;
    v3->_replyQueue = (OS_dispatch_queue *)v6;

    v8 = (NSMutableOrderedSet *)objc_alloc_init(MEMORY[0x1E4F1CA70]);
    assessmentComputedBlocks = v3->_assessmentComputedBlocks;
    v3->_assessmentComputedBlocks = v8;
  }
  return v3;
}

- (void)startAssessment
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__PKODIAssessment_startAssessment__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __34__PKODIAssessment_startAssessment__block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 80))
  {
    v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "CoreODI session already in progress, discarding", (uint8_t *)&v6, 2u);
    }

    uint64_t v2 = *(void *)(a1 + 32);
  }
  *(unsigned char *)(v2 + 33) = 1;
  [*(id *)(a1 + 32) createODISession];
  dispatch_queue_t v4 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    v5 = [*(id *)(*(void *)(a1 + 32) + 80) description];
    int v6 = 138412290;
    v7 = v5;
    _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Created ODISession: %@", (uint8_t *)&v6, 0xCu);
  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
}

- (void)startAssessmentWithHostBundleIdentifier:(id)a3
{
  id v4 = a3;
  [(PKODIAssessment *)self startAssessment];
  [(PKODIAssessment *)self updateAssessmentWithHostBundleIdentifier:v4];
}

- (void)updateAssessment:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __36__PKODIAssessment_updateAssessment___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __36__PKODIAssessment_updateAssessment___block_invoke(uint64_t a1)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  char v2 = [*(id *)(a1 + 32) isAssessing];
  v3 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);
  if (v2)
  {
    if (v4)
    {
      v5 = [*(id *)(*(void *)(a1 + 32) + 80) description];
      int v6 = 138412290;
      v7 = v5;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Updating CoreODI assessment on session: %@", (uint8_t *)&v6, 0xCu);
    }
    [*(id *)(*(void *)(a1 + 32) + 80) updateWithAdditionalAttributes:*(void *)(a1 + 40)];
  }
  else
  {
    if (v4)
    {
      LOWORD(v6) = 0;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "Assessment not underway, ignoring update", (uint8_t *)&v6, 2u);
    }
  }
}

- (BOOL)isAssessing
{
  char v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_isAssessing;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)updateAssessmentWithHostBundleIdentifier:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__PKODIAssessment_updateAssessmentWithHostBundleIdentifier___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __60__PKODIAssessment_updateAssessmentWithHostBundleIdentifier___block_invoke(uint64_t a1)
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if ([*(id *)(a1 + 32) isAssessing])
  {
    if (!*(void *)(a1 + 40)) {
      return;
    }
    char v2 = objc_alloc_init(MEMORY[0x1E4F5C978]);
    uint64_t v3 = *(void *)(a1 + 40);
    id v6 = @"callerClientBundle";
    v7[0] = v3;
    id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:&v6 count:1];
    [v2 setAttributes:v4];

    [*(id *)(a1 + 32) updateAssessment:v2];
  }
  else
  {
    char v2 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v5 = 0;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Assessment not underway, ignoring update", v5, 2u);
    }
  }
}

- (void)updateAssessmentWithModel:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  void v7[2] = __45__PKODIAssessment_updateAssessmentWithModel___block_invoke;
  v7[3] = &unk_1E56D8A90;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(workQueue, v7);
}

void __45__PKODIAssessment_updateAssessmentWithModel___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isAssessing])
  {
    id v50 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    char v2 = [*(id *)(a1 + 40) currencyCode];
    [v50 safelySetObject:v2 forKey:*MEMORY[0x1E4F5C9E0]];

    uint64_t v3 = [*(id *)(a1 + 40) transactionAmount];
    [v50 safelySetObject:v3 forKey:*MEMORY[0x1E4F5CA70]];

    id v4 = [*(id *)(a1 + 40) merchantName];
    [v50 safelySetObject:v4 forKey:*MEMORY[0x1E4F5C9F0]];

    v5 = [*(id *)(a1 + 40) pass];
    id v6 = [v5 primaryAccountIdentifier];
    [v50 safelySetObject:v6 forKey:*MEMORY[0x1E4F5C9E8]];

    v7 = [*(id *)(a1 + 40) shippingEmail];
    id v8 = [v7 emailAddresses];
    v9 = [v8 firstObject];
    v10 = [v9 value];

    objc_super v11 = [*(id *)(a1 + 40) shippingPhone];
    v12 = [v11 phoneNumbers];
    v13 = [v12 firstObject];
    v14 = [v13 value];
    v15 = [v14 stringValue];

    v16 = [*(id *)(a1 + 40) shippingAddress];
    v17 = [v16 postalAddresses];
    v18 = [v17 firstObject];
    v19 = [v18 value];

    v20 = [*(id *)(a1 + 40) billingAddress];
    v21 = [v20 postalAddresses];
    v22 = [v21 firstObject];
    v23 = [v22 value];

    [v50 safelySetObject:v10 forKey:*MEMORY[0x1E4F5CA50]];
    [v50 safelySetObject:v15 forKey:*MEMORY[0x1E4F5CA68]];
    v24 = [*(id *)(a1 + 40) billingAddress];
    v25 = [v24 givenName];
    [v50 safelySetObject:v25 forKey:*MEMORY[0x1E4F5C9C8]];

    v26 = [*(id *)(a1 + 40) billingAddress];
    v27 = [v26 familyName];
    [v50 safelySetObject:v27 forKey:*MEMORY[0x1E4F5C9D0]];

    v28 = [*(id *)(a1 + 40) shippingAddress];
    v29 = [v28 givenName];
    [v50 safelySetObject:v29 forKey:*MEMORY[0x1E4F5CA58]];

    v30 = [*(id *)(a1 + 40) shippingAddress];
    v31 = [v30 familyName];
    [v50 safelySetObject:v31 forKey:*MEMORY[0x1E4F5CA60]];

    if (v19)
    {
      v32 = [v19 street];
      [v50 safelySetObject:v32 forKey:*MEMORY[0x1E4F5CA40]];

      v33 = [v19 subLocality];
      [v50 safelySetObject:v33 forKey:*MEMORY[0x1E4F5CA48]];

      v34 = [v19 state];
      [v50 safelySetObject:v34 forKey:*MEMORY[0x1E4F5CA38]];

      v35 = [v19 city];
      [v50 safelySetObject:v35 forKey:*MEMORY[0x1E4F5CA18]];

      v36 = [v19 country];
      [v50 safelySetObject:v36 forKey:*MEMORY[0x1E4F5CA20]];

      v37 = [v19 ISOCountryCode];
      [v50 safelySetObject:v37 forKey:*MEMORY[0x1E4F5CA28]];

      v38 = [v19 postalCode];
      [v50 safelySetObject:v38 forKey:*MEMORY[0x1E4F5CA30]];
    }
    if (v23)
    {
      v39 = [v23 street];
      [v50 safelySetObject:v39 forKey:*MEMORY[0x1E4F5C9B8]];

      v40 = [v23 subLocality];
      [v50 safelySetObject:v40 forKey:*MEMORY[0x1E4F5C9C0]];

      v41 = [v23 state];
      [v50 safelySetObject:v41 forKey:*MEMORY[0x1E4F5C9B0]];

      v42 = [v23 city];
      [v50 safelySetObject:v42 forKey:*MEMORY[0x1E4F5C990]];

      v43 = [v23 country];
      [v50 safelySetObject:v43 forKey:*MEMORY[0x1E4F5C998]];

      v44 = [v23 ISOCountryCode];
      [v50 safelySetObject:v44 forKey:*MEMORY[0x1E4F5C9A0]];

      v45 = [v23 postalCode];
      [v50 safelySetObject:v45 forKey:*MEMORY[0x1E4F5C9A8]];
    }
    v46 = [*(id *)(a1 + 40) pass];
    v47 = [v46 issuerCountryCode];
    [v50 safelySetObject:v47 forKey:@"issuerCountryCode"];

    id v48 = objc_alloc_init(MEMORY[0x1E4F5C978]);
    [v48 setAttributes:v50];
    [*(id *)(a1 + 32) updateAssessment:v48];
  }
  else
  {
    v49 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_190E10000, v49, OS_LOG_TYPE_DEFAULT, "Assessment not underway, ignoring update", buf, 2u);
    }
  }
}

- (void)computeAssessment
{
  workQueue = self->_workQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PKODIAssessment_computeAssessment__block_invoke;
  block[3] = &unk_1E56D8AE0;
  block[4] = self;
  dispatch_async(workQueue, block);
}

void __36__PKODIAssessment_computeAssessment__block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void *)(a1 + 32);
  int v3 = *(unsigned __int8 *)(v2 + 32);
  id v4 = PKLogFacilityTypeGetObject(6uLL);
  BOOL v5 = os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT);
  if (v3)
  {
    if (v5)
    {
      id v6 = [*(id *)(v2 + 80) description];
      *(_DWORD *)buf = 138412290;
      objc_super v11 = v6;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Already computing CoreODI assessment on session: %@", buf, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      v7 = [*(id *)(v2 + 80) description];
      *(_DWORD *)buf = 138412290;
      objc_super v11 = v7;
      _os_log_impl(&dword_190E10000, v4, OS_LOG_TYPE_DEFAULT, "Computing CoreODI assessment on session: %@", buf, 0xCu);
    }
    *(unsigned char *)(*(void *)(a1 + 32) + 32) = 1;
    *(CFAbsoluteTime *)(*(void *)(a1 + 32) + 40) = CFAbsoluteTimeGetCurrent();
    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
    *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
    PKTimeProfileBegin(0, @"get_odi_assessment");
    id v8 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __36__PKODIAssessment_computeAssessment__block_invoke_25;
    v9[3] = &unk_1E56E3740;
    v9[4] = v8;
    [v8 getAssessmentWithCompletion:v9];
  }
}

void __36__PKODIAssessment_computeAssessment__block_invoke_25(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(NSObject **)(v7 + 56);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__PKODIAssessment_computeAssessment__block_invoke_2;
  block[3] = &unk_1E56D8AB8;
  id v12 = v6;
  id v13 = v5;
  uint64_t v14 = v7;
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __36__PKODIAssessment_computeAssessment__block_invoke_2(uint64_t a1)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = PKLogFacilityTypeGetObject(6uLL);
  id v3 = PKTimeProfileEnd(v2, @"get_odi_assessment", @"PKODIAssessment: ODISession: getAssessment");

  uint64_t v4 = *(void *)(a1 + 32);
  BOOL v5 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v5)
    {
      int v8 = 138412290;
      uint64_t v9 = v4;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Error computing CoreODI assessment: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  else
  {
    if (v5)
    {
      uint64_t v6 = *(void *)(a1 + 40);
      int v8 = 138412290;
      uint64_t v9 = v6;
      _os_log_impl(&dword_190E10000, v2, OS_LOG_TYPE_DEFAULT, "Received CoreODI assessment: %@", (uint8_t *)&v8, 0xCu);
    }

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 48) + 20));
    objc_storeStrong((id *)(*(void *)(a1 + 48) + 8), *(id *)(a1 + 40));
    *(unsigned char *)(*(void *)(a1 + 48) + 33) = 0;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 48) + 20));
  }
  *(unsigned char *)(*(void *)(a1 + 48) + 32) = 0;
  uint64_t v7 = *(NSObject **)(*(void *)(a1 + 48) + 48);
  if (v7) {
    dispatch_source_cancel(v7);
  }
}

- (id)currentAssessment
{
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  uint64_t v4 = (void *)[(NSString *)self->_assessment copy];
  os_unfair_lock_unlock(p_lock);
  return v4;
}

- (BOOL)currentAssessmentDidTimeout
{
  uint64_t v2 = self;
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  LOBYTE(v2) = v2->_currentAssessmentDidTimeout;
  os_unfair_lock_unlock(p_lock);
  return (char)v2;
}

- (void)waitForAssessmentWithContinueBlock:(id)a3
{
}

- (void)waitForAssessmentWithTimeout:(unint64_t)a3 startTimeoutFromAssessmentStart:(BOOL)a4 continueBlock:(id)a5
{
  id v8 = a5;
  uint64_t v9 = v8;
  if (v8)
  {
    workQueue = self->_workQueue;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke;
    v11[3] = &unk_1E56E3768;
    v11[4] = self;
    id v12 = v8;
    unint64_t v13 = a3;
    BOOL v14 = a4;
    dispatch_async(workQueue, v11);
  }
}

void __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke(uint64_t a1)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 24);
  id v3 = _Block_copy(*(const void **)(a1 + 40));
  [v2 addObject:v3];

  uint64_t v4 = [*(id *)(a1 + 32) currentAssessment];
  if (v4 && (int v5 = *(unsigned __int8 *)(*(void *)(a1 + 32) + 32), v4, !v5))
  {
    v16 = *(void **)(a1 + 32);
    [v16 _callAssessmentComputedBlocksAndDidTimeout:0];
  }
  else
  {
    uint64_t v6 = *(void *)(a1 + 32);
    if (!*(unsigned char *)(v6 + 32))
    {
      uint64_t v7 = PKLogFacilityTypeGetObject(6uLL);
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [*(id *)(v6 + 80) description];
        *(_DWORD *)buf = 138412290;
        v29 = v8;
        _os_log_impl(&dword_190E10000, v7, OS_LOG_TYPE_DEFAULT, "CoreODI assessment requested, but computation not started %@", buf, 0xCu);
      }
    }
    unint64_t v9 = *(void *)(a1 + 48);
    if (v9)
    {
      double v10 = (double)v9;
      if (*(unsigned char *)(a1 + 56))
      {
        CFAbsoluteTime Current = CFAbsoluteTimeGetCurrent();
        uint64_t v12 = *(void *)(a1 + 32);
        double v13 = Current - *(double *)(v12 + 40);
        double v14 = (double)*(unint64_t *)(a1 + 48) + -0.25;
        if (v13 < v14)
        {
          CFAbsoluteTime v15 = CFAbsoluteTimeGetCurrent();
          uint64_t v12 = *(void *)(a1 + 32);
          double v14 = v15 - *(double *)(v12 + 40);
        }
        double v10 = v10 - v14;
      }
      else
      {
        uint64_t v12 = *(void *)(a1 + 32);
      }
      dispatch_source_t v17 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(v12 + 56));
      uint64_t v18 = *(void *)(a1 + 32);
      v19 = *(void **)(v18 + 48);
      *(void *)(v18 + 48) = v17;

      v20 = *(NSObject **)(*(void *)(a1 + 32) + 48);
      dispatch_time_t v21 = dispatch_time(0, (uint64_t)(v10 * 1000000000.0));
      dispatch_source_set_timer(v20, v21, 0xFFFFFFFFFFFFFFFFLL, 0x5F5E100uLL);
      uint64_t v22 = *(void *)(a1 + 32);
      v23 = *(NSObject **)(v22 + 48);
      handler[0] = MEMORY[0x1E4F143A8];
      handler[1] = 3221225472;
      handler[2] = __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke_30;
      handler[3] = &unk_1E56D8AE0;
      handler[4] = v22;
      dispatch_source_set_event_handler(v23, handler);
      uint64_t v24 = *(void *)(a1 + 32);
      v25 = *(NSObject **)(v24 + 48);
      v26[0] = MEMORY[0x1E4F143A8];
      v26[1] = 3221225472;
      v26[2] = __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke_31;
      v26[3] = &unk_1E56D8AE0;
      v26[4] = v24;
      dispatch_source_set_cancel_handler(v25, v26);
      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 48));
    }
  }
}

uint64_t __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke_30(uint64_t result)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v1 = *(void *)(result + 32);
  if (*(void *)(v1 + 48))
  {
    uint64_t v2 = result;
    id v3 = PKLogFacilityTypeGetObject(6uLL);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v4 = [*(id *)(v1 + 80) description];
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_190E10000, v3, OS_LOG_TYPE_DEFAULT, "CoreODI assessment timed out %@", (uint8_t *)&v7, 0xCu);
    }
    uint64_t v5 = *(void *)(v2 + 32);
    uint64_t v6 = *(void **)(v5 + 48);
    *(void *)(v5 + 48) = 0;

    os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(v2 + 32) + 20));
    *(unsigned char *)(*(void *)(v2 + 32) + 16) = 1;
    os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(v2 + 32) + 20));
    return [*(id *)(v2 + 32) _callAssessmentComputedBlocksAndDidTimeout:1];
  }
  return result;
}

uint64_t __94__PKODIAssessment_waitForAssessmentWithTimeout_startTimeoutFromAssessmentStart_continueBlock___block_invoke_31(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  id v3 = *(void **)(v2 + 48);
  *(void *)(v2 + 48) = 0;

  os_unfair_lock_lock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  *(unsigned char *)(*(void *)(a1 + 32) + 16) = 0;
  os_unfair_lock_unlock((os_unfair_lock_t)(*(void *)(a1 + 32) + 20));
  uint64_t v4 = *(void **)(a1 + 32);
  return [v4 _callAssessmentComputedBlocksAndDidTimeout:0];
}

- (void)provideSessionFeedback:(unint64_t)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = PKLogFacilityTypeGetObject(6uLL);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = [(PKODIAssessment *)self odiSession];
    int v8 = 134218242;
    unint64_t v9 = a3;
    __int16 v10 = 2112;
    objc_super v11 = v6;
    _os_log_impl(&dword_190E10000, v5, OS_LOG_TYPE_DEFAULT, "Providing ODISession feedback %ld on session %@", (uint8_t *)&v8, 0x16u);
  }
  int v7 = [(PKODIAssessment *)self odiSession];
  [v7 provideFeedbackOnPayloadOutcome:a3];
}

- (void)getAssessmentWithCompletion:(id)a3
{
  if (a3) {
    (*((void (**)(id, void, void))a3 + 2))(a3, 0, 0);
  }
}

- (void)_callAssessmentComputedBlocksAndDidTimeout:(BOOL)a3
{
  workQueue = self->_workQueue;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __62__PKODIAssessment__callAssessmentComputedBlocksAndDidTimeout___block_invoke;
  v4[3] = &unk_1E56D8B80;
  v4[4] = self;
  BOOL v5 = a3;
  dispatch_async(workQueue, v4);
}

void __62__PKODIAssessment__callAssessmentComputedBlocksAndDidTimeout___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)[*(id *)(*(void *)(a1 + 32) + 24) copy];
  [*(id *)(*(void *)(a1 + 32) + 24) removeAllObjects];
  id v3 = [*(id *)(a1 + 32) currentAssessment];
  if (!v3)
  {
    uint64_t v4 = *(void *)(a1 + 32);
    if (*(unsigned char *)(v4 + 72))
    {
      id v3 = [*(id *)(v4 + 80) availablePartialAssessment];
    }
    else
    {
      id v3 = 0;
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v17 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v16 + 1) + 8 * i);
        objc_super v11 = *(NSObject **)(*(void *)(a1 + 32) + 64);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __62__PKODIAssessment__callAssessmentComputedBlocksAndDidTimeout___block_invoke_2;
        block[3] = &unk_1E56D8478;
        uint64_t v14 = v10;
        id v13 = v3;
        char v15 = *(unsigned char *)(a1 + 40);
        dispatch_async(v11, block);
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v7);
  }
}

uint64_t __62__PKODIAssessment__callAssessmentComputedBlocksAndDidTimeout___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void, void))(*(void *)(a1 + 40) + 16))(*(void *)(a1 + 40), *(void *)(a1 + 32), *(unsigned __int8 *)(a1 + 48));
}

- (BOOL)allowPartialAssessment
{
  return self->_allowPartialAssessment;
}

- (void)setAllowPartialAssessment:(BOOL)a3
{
  self->_allowPartialAssessment = a3;
}

- (ODISession)odiSession
{
  return self->_odiSession;
}

- (void)setOdiSession:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_odiSession, 0);
  objc_storeStrong((id *)&self->_replyQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_assessmentComputedBlocks, 0);
  objc_storeStrong((id *)&self->_assessment, 0);
}

@end