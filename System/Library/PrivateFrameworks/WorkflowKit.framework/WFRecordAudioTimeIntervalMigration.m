@interface WFRecordAudioTimeIntervalMigration
+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4;
- (void)migrateWorkflow;
@end

@implementation WFRecordAudioTimeIntervalMigration

+ (BOOL)workflowNeedsMigration:(id)a3 fromClientVersion:(id)a4
{
  id v5 = a3;
  if (WFCompareBundleVersions(a4, @"1113.1")) {
    char HasActionsWithIdentifier = WFWorkflowHasActionsWithIdentifier(@"is.workflow.actions.recordaudio", v5);
  }
  else {
    char HasActionsWithIdentifier = 0;
  }

  return HasActionsWithIdentifier;
}

- (void)migrateWorkflow
{
  [(WFWorkflowMigration *)self enumerateActionsWithIdentifier:@"is.workflow.actions.recordaudio" usingBlock:&__block_literal_global_34393];
  [(WFWorkflowMigration *)self finish];
}

void __53__WFRecordAudioTimeIntervalMigration_migrateWorkflow__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v23[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  v4 = [v3 objectForKeyedSubscript:@"WFRecordingTimeInterval"];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v5 = [WFQuantityParameterState alloc];
    v6 = [[WFNumberStringSubstitutableState alloc] initWithValue:&stru_1F229A4D8];
    uint64_t v7 = [(WFQuantityParameterState *)v5 initWithMagnitudeState:v6 unitString:@"sec"];
LABEL_5:
    id v10 = (id)v7;

    id v11 = [v10 serializedRepresentation];
    [v3 setObject:v11 forKeyedSubscript:@"WFRecordingTimeInterval"];
    goto LABEL_6;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [v4 doubleValue];
    double v9 = v8;
    v23[0] = @"sec";
    v23[1] = @"min";
    v23[2] = @"hr";
    v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
    uint64_t v7 = +[WFDurationQuantityFieldParameter stateForDuration:v6 possibleUnits:v9];
    goto LABEL_5;
  }
  id v12 = v4;
  if (v12)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v13 = v12;
    }
    else {
      v13 = 0;
    }
  }
  else
  {
    v13 = 0;
  }
  id v10 = v13;

  v14 = [v10 objectForKeyedSubscript:@"WFSerializationType"];
  if (v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v15 = v14;
    }
    else {
      v15 = 0;
    }
  }
  else
  {
    v15 = 0;
  }
  id v11 = v15;

  if (([v11 isEqualToString:@"WFQuantityFieldValue"] & 1) == 0
    && [v11 isEqualToString:@"WFTextTokenAttachment"])
  {
    v16 = [v10 objectForKeyedSubscript:@"Value"];
    if (v16)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        v17 = v16;
      }
      else {
        v17 = 0;
      }
    }
    else
    {
      v17 = 0;
    }
    id v18 = v17;

    v19 = objc_opt_new();
    [v19 setValue:v18 forKey:@"Magnitude"];

    [v19 setValue:@"sec" forKey:@"Unit"];
    v21[0] = @"WFSerializationType";
    v21[1] = @"Value";
    v22[0] = @"WFQuantityFieldValue";
    v22[1] = v19;
    v20 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    [v3 setObject:v20 forKeyedSubscript:@"WFRecordingTimeInterval"];
  }
LABEL_6:
}

@end