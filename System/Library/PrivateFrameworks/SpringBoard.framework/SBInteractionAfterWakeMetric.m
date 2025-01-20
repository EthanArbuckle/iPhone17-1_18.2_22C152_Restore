@interface SBInteractionAfterWakeMetric
- (BOOL)_determineIfShouldReport;
- (SBInteractionAfterWakeMetric)init;
- (void)_trackSessionWithDuration:(double)a3;
- (void)_trackUnlockConversion:(BOOL)a3;
- (void)_trackUnlockOpportunity;
@end

@implementation SBInteractionAfterWakeMetric

uint64_t __36__SBInteractionAfterWakeMetric_init__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (a2 == 37
    && ([v5 eventPayload],
        v7 = objc_claimAutoreleasedReturnValue(),
        [v7 objectForKeyedSubscript:*MEMORY[0x1E4FA7728]],
        v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v9 = [v8 unsignedIntegerValue],
        v8,
        v7,
        v9 == 26))
  {
    [WeakRetained _trackUnlockOpportunity];
    v10 = [v5 eventPayload];
    [v10 timestamp];
    *((void *)WeakRetained + 5) = v11;

    *((void *)WeakRetained + 6) = 0;
    *((unsigned char *)WeakRetained + 58) = 0;
    *((_WORD *)WeakRetained + 28) = 0;
    uint64_t v12 = 1;
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (BOOL)_determineIfShouldReport
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (!os_variant_has_internal_content()) {
    return 1;
  }
  id v2 = objc_alloc_init(MEMORY[0x1E4F179C8]);
  v3 = [v2 accountTypeWithAccountTypeIdentifier:*MEMORY[0x1E4F177E8]];
  [v2 accountsWithAccountType:v3];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v4 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    v17 = v3;
    id v18 = v2;
    uint64_t v20 = *(void *)v26;
    uint64_t v6 = *MEMORY[0x1E4F178E0];
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(obj);
        }
        v8 = objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * i), "objectForKeyedSubscript:", v6, v17, v18);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v9 = [v8 allKeys];
        }
        else
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v9 = v8;
          }
          else
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v9 = [v8 componentsSeparatedByString:@","];
            }
            else
            {
              id v9 = 0;
            }
          }
        }
        long long v23 = 0u;
        long long v24 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        id v10 = v9;
        id v11 = (id)[v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v22;
          while (2)
          {
            for (j = 0; j != v11; j = (char *)j + 1)
            {
              if (*(void *)v22 != v12) {
                objc_enumerationMutation(v10);
              }
              v14 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
              if ([v14 hasSuffix:@"apple.com"])
              {
                id v11 = v14;
                goto LABEL_24;
              }
            }
            id v11 = (id)[v10 countByEnumeratingWithState:&v21 objects:v29 count:16];
            if (v11) {
              continue;
            }
            break;
          }
        }
LABEL_24:

        if (v11)
        {

          BOOL v15 = 1;
          goto LABEL_30;
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v25 objects:v30 count:16];
      if (v5) {
        continue;
      }
      break;
    }
    BOOL v15 = 0;
LABEL_30:
    v3 = v17;
    id v2 = v18;
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)_trackUnlockOpportunity
{
  if (self->_shouldReport) {
    [(PETGoalConversionEventTracker *)self->_unlockTracker trackGoalOpportunityEventWithPropertyValues:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_trackUnlockConversion:(BOOL)a3
{
  if (self->_shouldReport) {
    [(PETGoalConversionEventTracker *)self->_unlockTracker trackGoalOpportunityEventWithConversion:a3 propertyValues:MEMORY[0x1E4F1CBF0]];
  }
}

- (void)_trackSessionWithDuration:(double)a3
{
  v20[11] = *MEMORY[0x1E4F143B8];
  if (self->_shouldReport)
  {
    sessionTimeTracker = self->_sessionTimeTracker;
    unint64_t v4 = *(void *)&self->_sessionInteractions.usedQuickActionButton;
    BOOL unlockDismissed = self->_sessionInteractions.unlockDismissed;
    unint64_t v6 = *(unsigned __int16 *)&self->_sessionInteractions.activatedControlCenter;
    id v18 = [NSNumber numberWithBool:v4 & 1];
    v20[0] = v18;
    v17 = [NSNumber numberWithBool:(v4 >> 8) & 1];
    v20[1] = v17;
    v7 = [NSNumber numberWithBool:(v4 >> 16) & 1];
    v20[2] = v7;
    v8 = [NSNumber numberWithBool:(v4 >> 24) & 1];
    v20[3] = v8;
    id v9 = [NSNumber numberWithBool:HIDWORD(v4) & 1];
    v20[4] = v9;
    id v10 = [NSNumber numberWithBool:(v4 >> 40) & 1];
    v20[5] = v10;
    id v11 = [NSNumber numberWithBool:HIWORD(v4) & 1];
    v20[6] = v11;
    uint64_t v12 = [NSNumber numberWithBool:HIBYTE(v4) & 1];
    v20[7] = v12;
    v13 = [NSNumber numberWithBool:v6 & 1];
    v20[8] = v13;
    v14 = [NSNumber numberWithBool:(v6 >> 8) & 1];
    v20[9] = v14;
    BOOL v15 = [NSNumber numberWithBool:unlockDismissed];
    v20[10] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:11];

    [(PETDistributionEventTracker *)sessionTimeTracker trackEventWithPropertyValues:v16 value:a3];
  }
}

- (SBInteractionAfterWakeMetric)init
{
  v30.receiver = self;
  v30.super_class = (Class)SBInteractionAfterWakeMetric;
  id v2 = [(SBAnalyticsStateMachineEventHandler *)&v30 init];
  v3 = v2;
  if (v2)
  {
    v2->_shouldReport = [(SBInteractionAfterWakeMetric *)v2 _determineIfShouldReport];
    id v4 = objc_alloc(MEMORY[0x1E4F93730]);
    uint64_t v5 = [v4 initWithFeatureId:@"SpringBoard" opportunityEvent:@"PresentLockScreen" conversionEvent:@"DismissedLockScreen" registerProperties:MEMORY[0x1E4F1CBF0] propertySubsets:&unk_1F3348990];
    unlockTracker = v3->_unlockTracker;
    v3->_unlockTracker = (PETGoalConversionEventTracker *)v5;

    id v7 = objc_alloc(MEMORY[0x1E4F93718]);
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = PETEventPropertyForBoolValues(@"QuickAction");
    [v8 addObject:v9];

    id v10 = PETEventPropertyForBoolValues(@"ScrolledNotifListIn");
    [v8 addObject:v10];

    id v11 = PETEventPropertyForBoolValues(@"LongLook");
    [v8 addObject:v11];

    uint64_t v12 = PETEventPropertyForBoolValues(@"InteractedNotif");
    [v8 addObject:v12];

    v13 = PETEventPropertyForBoolValues(@"ClearedNotif");
    [v8 addObject:v13];

    v14 = PETEventPropertyForBoolValues(@"CameraActivated");
    [v8 addObject:v14];

    BOOL v15 = PETEventPropertyForBoolValues(@"CameraPrewarmFalsePositive");
    [v8 addObject:v15];

    v16 = PETEventPropertyForBoolValues(@"CameraSwipeFailed");
    [v8 addObject:v16];

    v17 = PETEventPropertyForBoolValues(@"ControlCenter");
    [v8 addObject:v17];

    id v18 = PETEventPropertyForBoolValues(@"Spotlight");
    [v8 addObject:v18];

    v19 = PETEventPropertyForBoolValues(@"UnlockDismissed");
    [v8 addObject:v19];

    uint64_t v20 = [v7 initWithFeatureId:@"SpringBoard" event:@"LockScreenSession" registerProperties:v8 propertySubsets:&unk_1F33489A8];
    sessionTimeTracker = v3->_sessionTimeTracker;
    v3->_sessionTimeTracker = (PETDistributionEventTracker *)v20;

    objc_initWeak(&location, v3);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __36__SBInteractionAfterWakeMetric_init__block_invoke;
    v27[3] = &unk_1E6B0D8D0;
    objc_copyWeak(&v28, &location);
    long long v22 = +[SBAnalyticsStateMachineEdge edgeFromState:0 transition:v27];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __36__SBInteractionAfterWakeMetric_init__block_invoke_2;
    v25[3] = &unk_1E6B0D8D0;
    objc_copyWeak(&v26, &location);
    long long v23 = +[SBAnalyticsStateMachineEdge edgeFromState:1 transition:v25];
    [(SBAnalyticsStateMachineEventHandler *)v3 addEdge:v22];
    [(SBAnalyticsStateMachineEventHandler *)v3 addEdge:v23];

    objc_destroyWeak(&v26);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }
  return v3;
}

uint64_t __36__SBInteractionAfterWakeMetric_init__block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  uint64_t v8 = 1;
  switch(a2)
  {
    case '%':
      id v9 = [v5 eventPayload];
      id v10 = [v9 objectForKeyedSubscript:*MEMORY[0x1E4FA7728]];
      uint64_t v11 = [v10 unsignedIntegerValue];

      if (v11 == 25)
      {
        [v7 _trackUnlockConversion:0];
      }
      else
      {
        if (v11 != 12) {
          goto LABEL_26;
        }
        [v7 _trackUnlockConversion:1];
        v7[58] = 1;
      }
      long long v22 = [v5 eventPayload];
      [v22 timestamp];
      double v24 = v23;

      [v7 _trackSessionWithDuration:v24 - *((double *)v7 + 5)];
      uint64_t v8 = 0;
      break;
    case '&':
      uint64_t v8 = 1;
      WeakRetained[51] = 1;
      break;
    case '\'':
      uint64_t v8 = 1;
      WeakRetained[49] = 1;
      break;
    case '(':
      uint64_t v8 = 1;
      WeakRetained[52] = 1;
      break;
    case ')':
      uint64_t v8 = 1;
      WeakRetained[50] = 1;
      break;
    case '*':
      uint64_t v8 = 1;
      WeakRetained[48] = 1;
      break;
    case '+':
      break;
    case ',':
      uint64_t v8 = 1;
      WeakRetained[53] = 1;
      break;
    case '-':
      uint64_t v8 = 1;
      WeakRetained[54] = 1;
      break;
    case '.':
      uint64_t v8 = 1;
      WeakRetained[55] = 1;
      break;
    case '/':
      uint64_t v8 = 1;
      WeakRetained[56] = 1;
      break;
    default:
      if (a2 == 3)
      {
        uint64_t v12 = [v5 eventPayload];
        v13 = [v12 objectForKeyedSubscript:*MEMORY[0x1E4FA7488]];

        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        id v14 = v13;
        uint64_t v15 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v15)
        {
          uint64_t v16 = v15;
          uint64_t v17 = *(void *)v27;
          uint64_t v18 = *MEMORY[0x1E4FA7470];
          uint64_t v19 = *MEMORY[0x1E4FA6F78];
          while (2)
          {
            for (uint64_t i = 0; i != v16; ++i)
            {
              if (*(void *)v27 != v17) {
                objc_enumerationMutation(v14);
              }
              long long v21 = objc_msgSend(*(id *)(*((void *)&v26 + 1) + 8 * i), "objectForKeyedSubscript:", v18, (void)v26);
              if ([v21 isEqualToString:v19])
              {
                v7[57] = 1;

                goto LABEL_25;
              }
            }
            uint64_t v16 = [v14 countByEnumeratingWithState:&v26 objects:v30 count:16];
            if (v16) {
              continue;
            }
            break;
          }
        }
LABEL_25:

LABEL_26:
        uint64_t v8 = 1;
      }
      break;
  }

  return v8;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionTimeTracker, 0);
  objc_storeStrong((id *)&self->_unlockTracker, 0);
}

@end