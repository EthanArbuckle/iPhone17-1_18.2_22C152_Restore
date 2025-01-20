@interface PLAirplayService
+ (id)defaults;
+ (id)entryAggregateDefinitions;
+ (void)load;
- (BOOL)airplayMirroringOn;
- (NSArray)screenLayoutEntries;
- (NSSet)excludedAccountingEvents;
- (NSString)entryKeyPLScreenStateAgentScreenState;
- (PLAirplayService)init;
- (PLEntryNotificationOperatorComposition)audioAppCallback;
- (PLEntryNotificationOperatorComposition)screenstateCallback;
- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5;
- (void)handleAudioAppCallback:(id)a3;
- (void)handleScreenStateCallback:(id)a3;
- (void)initOperatorDependancies;
- (void)setAirplayMirroringOn:(BOOL)a3;
- (void)setAudioAppCallback:(id)a3;
- (void)setExcludedAccountingEvents:(id)a3;
- (void)setScreenLayoutEntries:(id)a3;
- (void)setScreenstateCallback:(id)a3;
@end

@implementation PLAirplayService

uint64_t __44__PLAirplayService_initOperatorDependancies__block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleScreenStateCallback:a2];
}

- (void)handleScreenStateCallback:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKey:@"group"];
  v5 = [(PLAirplayService *)self entryKeyPLScreenStateAgentScreenState];
  v6 = [v4 objectForKeyedSubscript:v5];

  [(PLAirplayService *)self setScreenLayoutEntries:v6];
  if (-[PLAirplayService airplayMirroringOn](self, "airplayMirroringOn") && v6 && [v6 count])
  {
    v7 = [v6 objectAtIndexedSubscript:0];
    if (v7)
    {
      v8 = [MEMORY[0x1E4F1CA48] array];
      v9 = [(PLAirplayService *)self screenLayoutEntries];
      uint64_t v10 = [v9 count];

      if (v10)
      {
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        v11 = [(PLAirplayService *)self screenLayoutEntries];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v22;
          do
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v22 != v14) {
                objc_enumerationMutation(v11);
              }
              v16 = *(void **)(*((void *)&v21 + 1) + 8 * i);
              v17 = [v16 objectForKeyedSubscript:@"bundleID"];

              if (v17)
              {
                v18 = [v16 objectForKeyedSubscript:@"bundleID"];
                [v8 addObject:v18];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
          }
          while (v13);
        }

        v19 = [MEMORY[0x1E4F92900] sharedInstance];
        v20 = [v7 entryDate];
        [v19 createQualificationEventForwardWithQualificationID:3 withChildNodeNames:v8 withStartDate:v20];
      }
    }
  }
}

- (void)setScreenLayoutEntries:(id)a3
{
}

- (NSString)entryKeyPLScreenStateAgentScreenState
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (BOOL)airplayMirroringOn
{
  return self->_airplayMirroringOn;
}

uint64_t __56__PLAirplayService_buildCallBack_withGroup_withHandler___block_invoke(uint64_t result, uint64_t a2)
{
  if (a2) {
    return (*(uint64_t (**)(void))(*(void *)(result + 32) + 16))();
  }
  return result;
}

+ (id)defaults
{
  return (id)MEMORY[0x1E4F1CC08];
}

+ (void)load
{
  v2.receiver = a1;
  v2.super_class = (Class)&OBJC_METACLASS___PLAirplayService;
  objc_msgSendSuper2(&v2, sel_load);
}

+ (id)entryAggregateDefinitions
{
  return (id)MEMORY[0x1E4F1CC08];
}

- (PLAirplayService)init
{
  if (([MEMORY[0x1E4F92A38] isHomePod] & 1) != 0
    || ([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PLAirplayService;
    self = [(PLOperator *)&v5 init];
    v3 = self;
  }

  return v3;
}

- (void)initOperatorDependancies
{
  if (([MEMORY[0x1E4F92A88] isPowerlogHelperd] & 1) == 0)
  {
    screenLayoutEntries = self->_screenLayoutEntries;
    self->_screenLayoutEntries = 0;

    self->_airplayMirroringOn = 0;
    v4 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D30] andName:@"ScreenState"];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __44__PLAirplayService_initOperatorDependancies__block_invoke;
    v12[3] = &unk_1E692A808;
    v12[4] = self;
    objc_super v5 = [(PLAirplayService *)self buildCallBack:v4 withGroup:1 withHandler:v12];
    [(PLAirplayService *)self setScreenstateCallback:v5];

    entryKeyPLScreenStateAgentScreenState = self->_entryKeyPLScreenStateAgentScreenState;
    self->_entryKeyPLScreenStateAgentScreenState = v4;
    v7 = v4;

    v8 = +[PLOperator entryKeyForType:*MEMORY[0x1E4F92D48] andName:@"AudioApp"];

    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __44__PLAirplayService_initOperatorDependancies__block_invoke_2;
    v11[3] = &unk_1E692A808;
    v11[4] = self;
    v9 = [(PLAirplayService *)self buildCallBack:v8 withGroup:0 withHandler:v11];
    [(PLAirplayService *)self setAudioAppCallback:v9];

    uint64_t v10 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F625B0]];
    [(PLAirplayService *)self setExcludedAccountingEvents:v10];
  }
}

uint64_t __44__PLAirplayService_initOperatorDependancies__block_invoke_2(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) handleAudioAppCallback:a2];
}

- (id)buildCallBack:(id)a3 withGroup:(BOOL)a4 withHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    id v10 = [NSString stringWithFormat:@"GroupID_%@", v8];
  }
  else
  {
    id v10 = v8;
  }
  v11 = v10;
  id v12 = objc_alloc(MEMORY[0x1E4F929E8]);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __56__PLAirplayService_buildCallBack_withGroup_withHandler___block_invoke;
  v16[3] = &unk_1E692A858;
  id v17 = v9;
  id v13 = v9;
  uint64_t v14 = (void *)[v12 initWithOperator:self forEntryKey:v11 withBlock:v16];

  return v14;
}

- (void)handleAudioAppCallback:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  v4 = [a3 objectForKey:@"entry"];
  objc_super v5 = [v4 objectForKeyedSubscript:@"MirroringState"];

  if (v5)
  {
    BOOL v6 = [v4 objectForKeyedSubscript:@"MirroringState"];
    int v7 = [v6 BOOLValue];

    if (v7)
    {
      uint64_t v8 = [(PLAirplayService *)self screenLayoutEntries];
      if (v8)
      {
        id v9 = (void *)v8;
        id v10 = [(PLAirplayService *)self screenLayoutEntries];
        uint64_t v11 = [v10 count];

        if (v11)
        {
          id v12 = [(PLAirplayService *)self screenLayoutEntries];
          id v13 = [v12 objectAtIndexedSubscript:0];

          if (v13)
          {
            uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
            v15 = [(PLAirplayService *)self screenLayoutEntries];
            uint64_t v16 = [v15 count];

            if (v16)
            {
              v39 = v13;
              long long v42 = 0u;
              long long v43 = 0u;
              long long v40 = 0u;
              long long v41 = 0u;
              id v17 = [(PLAirplayService *)self screenLayoutEntries];
              uint64_t v18 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
              if (v18)
              {
                uint64_t v19 = v18;
                uint64_t v20 = *(void *)v41;
                do
                {
                  for (uint64_t i = 0; i != v19; ++i)
                  {
                    if (*(void *)v41 != v20) {
                      objc_enumerationMutation(v17);
                    }
                    long long v22 = *(void **)(*((void *)&v40 + 1) + 8 * i);
                    long long v23 = [v22 objectForKeyedSubscript:@"bundleID"];

                    if (v23)
                    {
                      long long v24 = [v22 objectForKeyedSubscript:@"bundleID"];
                      [v14 addObject:v24];
                    }
                  }
                  uint64_t v19 = [v17 countByEnumeratingWithState:&v40 objects:v44 count:16];
                }
                while (v19);
              }

              v25 = [MEMORY[0x1E4F92900] sharedInstance];
              id v13 = v39;
              uint64_t v26 = [v39 entryDate];
              [v25 createQualificationEventForwardWithQualificationID:3 withChildNodeNames:v14 withStartDate:v26];
            }
          }
        }
      }
      v27 = [MEMORY[0x1E4F92900] sharedInstance];
      v28 = [v4 entryDate];
      [v27 createDistributionEventForwardWithDistributionID:3 withChildNodeNameToWeight:&unk_1F29EAD50 withStartDate:v28];

      v29 = [MEMORY[0x1E4F92900] sharedInstance];
      v30 = [v4 entryDate];
      [v29 createDistributionEventForwardWithDistributionID:36 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v30];

      v31 = self;
      uint64_t v32 = 1;
    }
    else
    {
      v33 = [MEMORY[0x1E4F92900] sharedInstance];
      v34 = [v4 entryDate];
      [v33 createDistributionEventForwardWithDistributionID:3 withChildNodeNameToWeight:&unk_1F29EAD78 withStartDate:v34];

      v35 = [MEMORY[0x1E4F92900] sharedInstance];
      v36 = [v4 entryDate];
      [v35 createDistributionEventForwardWithDistributionID:36 withChildNodeNameToWeight:MEMORY[0x1E4F1CC08] withStartDate:v36];

      v37 = [MEMORY[0x1E4F92900] sharedInstance];
      v38 = [v4 entryDate];
      [v37 createQualificationEventForwardWithQualificationID:3 withChildNodeNames:MEMORY[0x1E4F1CBF0] withStartDate:v38];

      v31 = self;
      uint64_t v32 = 0;
    }
    [(PLAirplayService *)v31 setAirplayMirroringOn:v32];
  }
}

- (PLEntryNotificationOperatorComposition)screenstateCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 56, 1);
}

- (void)setScreenstateCallback:(id)a3
{
}

- (PLEntryNotificationOperatorComposition)audioAppCallback
{
  return (PLEntryNotificationOperatorComposition *)objc_getProperty(self, a2, 64, 1);
}

- (void)setAudioAppCallback:(id)a3
{
}

- (NSArray)screenLayoutEntries
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setAirplayMirroringOn:(BOOL)a3
{
  self->_airplayMirroringOn = a3;
}

- (NSSet)excludedAccountingEvents
{
  return (NSSet *)objc_getProperty(self, a2, 88, 1);
}

- (void)setExcludedAccountingEvents:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_excludedAccountingEvents, 0);
  objc_storeStrong((id *)&self->_entryKeyPLScreenStateAgentScreenState, 0);
  objc_storeStrong((id *)&self->_screenLayoutEntries, 0);
  objc_storeStrong((id *)&self->_audioAppCallback, 0);
  objc_storeStrong((id *)&self->_screenstateCallback, 0);
}

@end