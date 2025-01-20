@interface PKPassViewUserActivityManager
+ (id)sharedInstance;
- (BOOL)_shouldDonateActivity:(id)a3;
- (PKPassViewUserActivityManager)init;
- (id)_currentUserActivityPassUniqueID;
- (id)_displayNameForPass:(id)a3;
- (id)_init;
- (id)_passViewTemplateNameForPass:(id)a3;
- (void)_endedViewingPass;
- (void)dealloc;
- (void)endedViewingPass;
- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4;
- (void)startedViewingPass:(id)a3;
@end

@implementation PKPassViewUserActivityManager

+ (id)sharedInstance
{
  if (_MergedGlobals_680 != -1) {
    dispatch_once(&_MergedGlobals_680, &__block_literal_global_105);
  }
  v2 = (void *)qword_1EB545C38;

  return v2;
}

void __47__PKPassViewUserActivityManager_sharedInstance__block_invoke()
{
  id v0 = [[PKPassViewUserActivityManager alloc] _init];
  v1 = (void *)qword_1EB545C38;
  qword_1EB545C38 = (uint64_t)v0;
}

- (PKPassViewUserActivityManager)init
{
  return 0;
}

- (id)_init
{
  v8.receiver = self;
  v8.super_class = (Class)PKPassViewUserActivityManager;
  v2 = [(PKPassViewUserActivityManager *)&v8 init];
  if (v2)
  {
    dispatch_queue_t v3 = dispatch_queue_create("com.apple.passkit.passviewuseractivitymanager", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    v5 = +[PKUIForegroundActiveArbiter sharedInstance];
    int v6 = [v5 registerObserver:v2];

    v2->_isForegroundActive = BYTE1(v6) & 1;
  }
  return v2;
}

- (void)dealloc
{
  dispatch_queue_t v3 = +[PKUIForegroundActiveArbiter sharedInstance];
  [v3 unregisterObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)PKPassViewUserActivityManager;
  [(PKPassViewUserActivityManager *)&v4 dealloc];
}

- (void)startedViewingPass:(id)a3
{
  id v4 = a3;
  v5 = [v4 uniqueID];
  if (v5 && (PKRunningInRemoteContext() & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke;
    block[3] = &unk_1E59CA8E8;
    block[4] = self;
    id v8 = v5;
    id v9 = v4;
    dispatch_async(queue, block);
  }
}

void __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke(uint64_t a1)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (*(unsigned char *)(*(void *)(a1 + 32) + 24))
  {
    v2 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v3 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138412290;
      uint64_t v21 = v3;
      _os_log_impl(&dword_19F450000, v2, OS_LOG_TYPE_DEFAULT, "PKPassViewUserActivityManager: startedViewingPass - %@", buf, 0xCu);
    }

    id v4 = [*(id *)(a1 + 32) _currentUserActivityPassUniqueID];
    if (v4 && ([*(id *)(a1 + 40) isEqualToString:v4] & 1) == 0) {
      [*(id *)(a1 + 32) _endedViewingPass];
    }
    v5 = *(void **)(a1 + 32);
    if (!v5[1])
    {
      if ([v5 _shouldDonateActivity:*(void *)(a1 + 48)])
      {
        id v6 = objc_alloc(MEMORY[0x1E4F22488]);
        v7 = (void *)[v6 initWithActivityType:*MEMORY[0x1E4F88070]];
        id v8 = [*(id *)(a1 + 32) _displayNameForPass:*(void *)(a1 + 48)];
        id v9 = [*(id *)(a1 + 32) _passViewTemplateNameForPass:*(void *)(a1 + 48)];
        v10 = PKCoreLocalizedString(&cfstr_PassViewUserAc.isa, &stru_1EF1B5770.isa, v8, v9);
        [v7 setTitle:v10];

        [v7 setEligibleForSearch:1];
        [v7 setEligibleForHandoff:0];
        uint64_t v11 = *(void *)(a1 + 40);
        uint64_t v18 = *MEMORY[0x1E4F88068];
        uint64_t v19 = v11;
        v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
        [v7 setUserInfo:v12];

        [v7 setEligibleForPrediction:1];
        v13 = (void *)MEMORY[0x1E4F84608];
        uint64_t v14 = *(void *)(a1 + 48);
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke_24;
        v16[3] = &unk_1E59D5250;
        v16[4] = *(void *)(a1 + 32);
        id v17 = v7;
        id v15 = v7;
        [v13 searchableItemForPass:v14 completion:v16];
      }
    }
  }
}

void __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke_24(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(NSObject **)(*(void *)(a1 + 32) + 16);
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke_2;
  block[3] = &unk_1E59CA8E8;
  id v9 = v3;
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  id v7 = v3;
  dispatch_async(v4, block);
}

void __52__PKPassViewUserActivityManager_startedViewingPass___block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) attributeSet];
  v2 = [*(id *)(a1 + 32) uniqueIdentifier];
  [v3 setRelatedUniqueIdentifier:v2];

  [*(id *)(a1 + 40) setContentAttributeSet:v3];
  [*(id *)(a1 + 40) becomeCurrent];
  objc_storeStrong((id *)(*(void *)(a1 + 48) + 8), *(id *)(a1 + 40));
}

- (void)endedViewingPass
{
  if ((PKRunningInRemoteContext() & 1) == 0)
  {
    queue = self->_queue;
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__PKPassViewUserActivityManager_endedViewingPass__block_invoke;
    block[3] = &unk_1E59CA7D0;
    void block[4] = self;
    dispatch_async(queue, block);
  }
}

uint64_t __49__PKPassViewUserActivityManager_endedViewingPass__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _endedViewingPass];
}

- (void)foregroundActiveArbiter:(id)a3 didUpdateForegroundActiveState:(id)a4
{
  queue = self->_queue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __88__PKPassViewUserActivityManager_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke;
  v5[3] = &unk_1E59CD7D8;
  v5[4] = self;
  $96EE1C12479E9B303E9C2794B92A11A2 v6 = a4;
  dispatch_async(queue, v5);
}

uint64_t __88__PKPassViewUserActivityManager_foregroundActiveArbiter_didUpdateForegroundActiveState___block_invoke(uint64_t result)
{
  *(unsigned char *)(*(void *)(result + 32) + 24) = *(unsigned char *)(result + 41);
  if (!*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _endedViewingPass];
  }
  return result;
}

- (void)_endedViewingPass
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (self->_currentUserActivity)
  {
    id v3 = PKLogFacilityTypeGetObject();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      id v4 = [(PKPassViewUserActivityManager *)self _currentUserActivityPassUniqueID];
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_19F450000, v3, OS_LOG_TYPE_DEFAULT, "PKPassViewUserActivityManager: endedViewingPass - %@", (uint8_t *)&v6, 0xCu);
    }
    [(NSUserActivity *)self->_currentUserActivity resignCurrent];
    currentUserActivity = self->_currentUserActivity;
    self->_currentUserActivity = 0;
  }
}

- (id)_currentUserActivityPassUniqueID
{
  currentUserActivity = self->_currentUserActivity;
  if (currentUserActivity)
  {
    id v3 = [(NSUserActivity *)currentUserActivity userInfo];
    id v4 = [v3 objectForKey:*MEMORY[0x1E4F88068]];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (BOOL)_shouldDonateActivity:(id)a3
{
  id v4 = a3;
  id v5 = [(PKPassViewUserActivityManager *)self _displayNameForPass:v4];

  if (v5)
  {
    unint64_t v6 = [v4 style];
    if (v6 <= 7) {
      LODWORD(v5) = (0xE2u >> v6) & 1;
    }
    else {
      LOBYTE(v5) = 0;
    }
  }

  return (char)v5;
}

- (id)_displayNameForPass:(id)a3
{
  id v3 = [a3 notificationCenterTitle];
  id v4 = [MEMORY[0x1E4F28B88] whitespaceAndNewlineCharacterSet];
  id v5 = [v3 stringByTrimmingCharactersInSet:v4];

  if (!v5 || ![v5 length])
  {

    id v5 = 0;
  }

  return v5;
}

- (id)_passViewTemplateNameForPass:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    uint64_t v5 = [v3 style] - 2;
    unint64_t v6 = @"PASS_VIEW_USER_ACTIVITY_TEMPLATE_NAME_NON_PAYMENT_BOARDING_PASS";
    switch(v5)
    {
      case 0:
      case 7:
        unint64_t v6 = @"PASS_VIEW_USER_ACTIVITY_TEMPLATE_NAME_NON_PAYMENT_TICKET";
        goto LABEL_10;
      case 2:
        goto LABEL_10;
      case 4:
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 && ([v4 isAppleCardPass])
        {
          id v7 = &stru_1EF1B5B50;
        }
        else
        {
          unint64_t v6 = @"PASS_VIEW_USER_ACTIVITY_TEMPLATE_NAME_PAYMENT_PASS";
LABEL_10:
          PKCoreLocalizedString(&v6->isa);
          id v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
        }
        break;
      default:
        unint64_t v6 = @"PASS_VIEW_USER_ACTIVITY_TEMPLATE_NAME_NON_PAYMENT_PASS";
        goto LABEL_10;
    }
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);

  objc_storeStrong((id *)&self->_currentUserActivity, 0);
}

@end