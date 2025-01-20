@interface SUCoreEventAugmenter
+ (void)augmentEvent:(id)a3 withDescriptor:(id)a4;
+ (void)augmentEvent:(id)a3 withDescriptor:(id)a4 specifyAlternateUpdate:(BOOL)a5;
+ (void)augmentEvent:(id)a3 withPolicy:(id)a4;
+ (void)augmentEvent:(id)a3 withPolicy:(id)a4 primaryDescriptor:(id)a5 alternateDescriptor:(id)a6;
- (SUCoreDescriptor)alternateDescriptor;
- (SUCoreDescriptor)primaryDescriptor;
- (SUCoreEventAugmenter)init;
- (SUCorePolicy)policy;
- (void)augmentEvent:(id)a3;
- (void)setAlternateDescriptor:(id)a3;
- (void)setPolicy:(id)a3;
- (void)setPrimaryDescriptor:(id)a3;
@end

@implementation SUCoreEventAugmenter

- (SUCoreEventAugmenter)init
{
  v7.receiver = self;
  v7.super_class = (Class)SUCoreEventAugmenter;
  v2 = [(SUCoreEventAugmenter *)&v7 init];
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v4 = dispatch_queue_create("com.apple.su.eventAugmenter", v3);
    stateQueue = v2->_stateQueue;
    v2->_stateQueue = (OS_dispatch_queue *)v4;
  }
  return v2;
}

- (void)setPolicy:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __34__SUCoreEventAugmenter_setPolicy___block_invoke;
  v7[3] = &unk_2640DCE98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __34__SUCoreEventAugmenter_setPolicy___block_invoke(uint64_t a1)
{
}

- (void)setPrimaryDescriptor:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __45__SUCoreEventAugmenter_setPrimaryDescriptor___block_invoke;
  v7[3] = &unk_2640DCE98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __45__SUCoreEventAugmenter_setPrimaryDescriptor___block_invoke(uint64_t a1)
{
}

- (void)setAlternateDescriptor:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __47__SUCoreEventAugmenter_setAlternateDescriptor___block_invoke;
  v7[3] = &unk_2640DCE98;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

void __47__SUCoreEventAugmenter_setAlternateDescriptor___block_invoke(uint64_t a1)
{
}

- (void)augmentEvent:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_stateQueue);
  stateQueue = self->_stateQueue;
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __37__SUCoreEventAugmenter_augmentEvent___block_invoke;
  v7[3] = &unk_2640DCE98;
  id v8 = v4;
  v9 = self;
  id v6 = v4;
  dispatch_sync(stateQueue, v7);
}

uint64_t __37__SUCoreEventAugmenter_augmentEvent___block_invoke(uint64_t a1)
{
  return +[SUCoreEventAugmenter augmentEvent:*(void *)(a1 + 32) withPolicy:*(void *)(*(void *)(a1 + 40) + 8) primaryDescriptor:*(void *)(*(void *)(a1 + 40) + 16) alternateDescriptor:*(void *)(*(void *)(a1 + 40) + 24)];
}

+ (void)augmentEvent:(id)a3 withPolicy:(id)a4
{
  id v12 = a3;
  id v5 = a4;
  if (!v12)
  {
    v10 = [MEMORY[0x263F77DA8] sharedDiag];
    id v8 = v10;
    v11 = @"missing required event param";
LABEL_10:
    [v10 trackAnomaly:@"[EVENT_AUGMENTER]" forReason:v11 withResult:8101 withError:0];
    goto LABEL_11;
  }
  if (!v5)
  {
    v10 = [MEMORY[0x263F77DA8] sharedDiag];
    id v8 = v10;
    v11 = @"missing required policy param";
    goto LABEL_10;
  }
  if ([v5 isSupervisedPolicy]) {
    [v12 setSafeObject:*MEMORY[0x263F78120] forKey:*MEMORY[0x263F78030]];
  }
  uint64_t v6 = [v5 delayPeriodDays];
  if (v6 >= 1)
  {
    objc_super v7 = [NSNumber numberWithInteger:v6];
    [v12 setSafeObject:v7 forKey:*MEMORY[0x263F77F30]];
  }
  id v8 = [v5 requestedProductMarketingVersion];
  [v12 setSafeObject:v8 forKey:*MEMORY[0x263F78008]];
  v9 = [v5 mdmPathName];
  [v12 setSafeObject:v9 forKey:*MEMORY[0x263F77FA0]];

LABEL_11:
}

+ (void)augmentEvent:(id)a3 withDescriptor:(id)a4
{
}

+ (void)augmentEvent:(id)a3 withDescriptor:(id)a4 specifyAlternateUpdate:(BOOL)a5
{
  BOOL v5 = a5;
  id v35 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    BOOL v9 = v5 && [v7 descriptorAudienceType] == 2;
    uint64_t v34 = [v8 productBuildVersion];
    objc_msgSend(v35, "setSafeObject:forKey:");
    v33 = [v8 updateTypeName];
    objc_msgSend(v35, "setSafeObject:forKey:");
    v11 = (void *)*MEMORY[0x263F78120];
    id v12 = (void *)*MEMORY[0x263F78098];
    if ([v8 rampEnabled]) {
      v13 = v11;
    }
    else {
      v13 = v12;
    }
    id v32 = v13;
    objc_msgSend(v35, "setSafeObject:forKey:");
    v31 = +[SUCoreDescriptor nameForDescriptorAudienceType:](SUCoreDescriptor, "nameForDescriptorAudienceType:", [v8 descriptorAudienceType]);
    objc_msgSend(v35, "setSafeObject:forKey:");
    v30 = +[SUCoreDescriptor nameForDescriptorPreferredUpdateType:](SUCoreDescriptor, "nameForDescriptorPreferredUpdateType:", [v8 preferredUpdateType]);
    objc_msgSend(v35, "setSafeObject:forKey:");
    if ([v8 mandatoryUpdateEligible]) {
      v14 = v11;
    }
    else {
      v14 = v12;
    }
    id v15 = v14;
    [v35 setSafeObject:v15 forKey:*MEMORY[0x263F77FA8]];
    if ([v8 mandatoryUpdateOptional]) {
      v16 = v11;
    }
    else {
      v16 = v12;
    }
    id v17 = v16;
    [v35 setSafeObject:v17 forKey:*MEMORY[0x263F77FB0]];
    v18 = [v8 associatedSplatDescriptor];
    if (v18) {
      v19 = v11;
    }
    else {
      v19 = v12;
    }
    uint64_t v20 = *MEMORY[0x263F78000];
    id v21 = v19;
    [v35 setSafeObject:v21 forKey:v20];
    if (v21)
    {
      v22 = [v18 productBuildVersion];
      [v35 setSafeObject:v22 forKey:*MEMORY[0x263F77FF8]];
    }
    v23 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "totalRequiredFreeSpace"));
    v24 = (void *)MEMORY[0x263F77EF8];
    if (!v9) {
      v24 = (void *)MEMORY[0x263F78040];
    }
    [v35 setSafeObject:v23 forKey:*v24];
    v25 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "preSUStagingRequiredSize"));
    v26 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v8, "preSUStagingOptionalSize"));
    if ([v8 enablePreSUStaging]) {
      v27 = v11;
    }
    else {
      v27 = v12;
    }
    uint64_t v28 = *MEMORY[0x263F77FE0];
    id v29 = v27;
    [v35 setSafeObject:v25 forKey:v28];
    [v35 setSafeObject:v26 forKey:*MEMORY[0x263F77FD8]];
    [v35 setSafeObject:v29 forKey:*MEMORY[0x263F77FD0]];

    v10 = (void *)v34;
  }
  else
  {
    v10 = [MEMORY[0x263F77DA8] sharedDiag];
    [v10 trackAnomaly:@"[EVENT_AUGMENTER]" forReason:@"missing required descriptor param" withResult:8101 withError:0];
  }
}

+ (void)augmentEvent:(id)a3 withPolicy:(id)a4 primaryDescriptor:(id)a5 alternateDescriptor:(id)a6
{
  id v15 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (!v15)
  {
    id v12 = [MEMORY[0x263F77DA8] sharedDiag];
    [v12 trackAnomaly:@"[EVENT_AUGMENTER]" forReason:@"missing required event param" withResult:8101 withError:0];

    goto LABEL_11;
  }
  if (!v9)
  {
    v13 = [MEMORY[0x263F77DA8] sharedDiag];
    [v13 trackAnomaly:@"[EVENT_AUGMENTER]" forReason:@"missing required policy param" withResult:8101 withError:0];

    if (v10) {
      goto LABEL_4;
    }
LABEL_15:
    v14 = [MEMORY[0x263F77DA8] sharedDiag];
    [v14 trackAnomaly:@"[EVENT_AUGMENTER]" forReason:@"missing required descriptor param" withResult:8101 withError:0];

    goto LABEL_4;
  }
  if (!v10) {
    goto LABEL_15;
  }
LABEL_4:
  if (v9) {
    +[SUCoreEventAugmenter augmentEvent:v15 withPolicy:v9];
  }
  if (v10) {
    +[SUCoreEventAugmenter augmentEvent:v15 withDescriptor:v10 specifyAlternateUpdate:v11 != 0];
  }
  if (v11) {
    +[SUCoreEventAugmenter augmentEvent:v15 withDescriptor:v11 specifyAlternateUpdate:v10 != 0];
  }
LABEL_11:
}

- (SUCorePolicy)policy
{
  return self->_policy;
}

- (SUCoreDescriptor)primaryDescriptor
{
  return self->_primaryDescriptor;
}

- (SUCoreDescriptor)alternateDescriptor
{
  return self->_alternateDescriptor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateQueue, 0);
  objc_storeStrong((id *)&self->_alternateDescriptor, 0);
  objc_storeStrong((id *)&self->_primaryDescriptor, 0);

  objc_storeStrong((id *)&self->_policy, 0);
}

@end