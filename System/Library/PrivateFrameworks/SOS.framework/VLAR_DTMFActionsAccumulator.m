@interface VLAR_DTMFActionsAccumulator
- (VLAR_DTMFActionsAccumulator)init;
- (id)analyticsDataDict;
- (void)noteDTMFAction:(unint64_t)a3;
@end

@implementation VLAR_DTMFActionsAccumulator

- (VLAR_DTMFActionsAccumulator)init
{
  v6.receiver = self;
  v6.super_class = (Class)VLAR_DTMFActionsAccumulator;
  v2 = [(VLAR_DTMFActionsAccumulator *)&v6 init];
  if (v2)
  {
    v3 = [[SOSAnalyticsEventAccumulator alloc] initWithName:@"DTMFAction"];
    actionsAccumulator = v2->_actionsAccumulator;
    v2->_actionsAccumulator = v3;
  }
  return v2;
}

- (void)noteDTMFAction:(unint64_t)a3
{
  actionsAccumulator = self->_actionsAccumulator;
  if ((uint64_t)a3 <= 299)
  {
    switch(a3)
    {
      case 0uLL:
        v4 = @"None";
        goto LABEL_6;
      case 0x64uLL:
        v4 = @"StopWithConfirmation";
        goto LABEL_6;
      case 0xC8uLL:
        v4 = @"Repeat";
        goto LABEL_6;
    }
LABEL_17:
    v4 = @"Unknown";
    goto LABEL_6;
  }
  if ((uint64_t)a3 > 4999)
  {
    if (a3 == 5000)
    {
      v4 = @"Resume";
      goto LABEL_6;
    }
    if (a3 == 10000)
    {
      v4 = @"Ignored";
      goto LABEL_6;
    }
    goto LABEL_17;
  }
  if (a3 == 300)
  {
    v4 = @"StopSilent";
    goto LABEL_6;
  }
  if (a3 != 400) {
    goto LABEL_17;
  }
  v4 = @"Reminder";
LABEL_6:
  [(SOSAnalyticsEventAccumulator *)actionsAccumulator noteEvent:v4];
}

- (id)analyticsDataDict
{
  v13[3] = *MEMORY[0x1E4F143B8];
  v12[0] = @"AllEventsKey";
  v12[1] = @"KnownEventsKey";
  v13[0] = @"nDTMFActions_Total";
  v13[1] = @"nDTMFActions_Known";
  v12[2] = @"UnknownEventsKey";
  v13[2] = @"nDTMFActions_Unknown";
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:3];
  v4 = [(SOSAnalyticsEventAccumulator *)self->_actionsAccumulator analyticsDataDictForAccumulatedKeys:&unk_1F0C4AD20 outputKeyPrefix:@"nDTMFAction_" summaryKeysDict:v3];
  v5 = (void *)[v4 mutableCopy];
  objc_super v6 = [v4 objectForKeyedSubscript:@"nDTMFActions_Known"];
  uint64_t v7 = [v6 integerValue];
  v8 = [v4 objectForKeyedSubscript:@"nDTMFAction_Ignored"];
  uint64_t v9 = v7 - [v8 integerValue];

  v10 = [NSNumber numberWithInteger:v9];
  [v5 setObject:v10 forKeyedSubscript:@"nDTMFActions_Acted"];

  return v5;
}

- (void).cxx_destruct
{
}

@end