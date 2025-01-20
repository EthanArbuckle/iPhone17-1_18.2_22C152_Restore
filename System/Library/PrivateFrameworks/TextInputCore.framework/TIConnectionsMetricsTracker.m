@interface TIConnectionsMetricsTracker
+ (id)sharedInstance;
- (BOOL)inputContextDidChange;
- (BOOL)isIgnoredTrigger:(id)a3;
- (PETGoalConversionEventTracker)predictionEngagementTracker;
- (PETScalarEventTracker)textFieldEntryTracker;
- (TIConnectionsMetricsTracker)init;
- (void)setInputContextDidChange:(BOOL)a3;
- (void)setPredictionEngagementTracker:(id)a3;
- (void)setTextFieldEntryTracker:(id)a3;
- (void)trackPredictionEngagmentWithConversion:(BOOL)a3 age:(unint64_t)a4 fieldType:(id)a5 resultType:(id)a6 fromBundleId:(id)a7 targetApp:(id)a8 linguistic:(BOOL)a9 semantic:(BOOL)a10;
- (void)trackTextFieldEntryWithEmpty:(BOOL)a3 fieldType:(id)a4 linguistic:(BOOL)a5 semantic:(BOOL)a6 requestType:(id)a7;
- (void)trackTextFieldEntryWithEmpty:(BOOL)a3 fieldType:(id)a4 trigger:(id)a5;
@end

@implementation TIConnectionsMetricsTracker

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_predictionEngagementTracker, 0);

  objc_storeStrong((id *)&self->_textFieldEntryTracker, 0);
}

- (void)setPredictionEngagementTracker:(id)a3
{
}

- (PETGoalConversionEventTracker)predictionEngagementTracker
{
  return self->_predictionEngagementTracker;
}

- (void)setTextFieldEntryTracker:(id)a3
{
}

- (PETScalarEventTracker)textFieldEntryTracker
{
  return self->_textFieldEntryTracker;
}

- (void)setInputContextDidChange:(BOOL)a3
{
  self->_inputContextDidChange = a3;
}

- (BOOL)inputContextDidChange
{
  return self->_inputContextDidChange;
}

- (void)trackPredictionEngagmentWithConversion:(BOOL)a3 age:(unint64_t)a4 fieldType:(id)a5 resultType:(id)a6 fromBundleId:(id)a7 targetApp:(id)a8 linguistic:(BOOL)a9 semantic:(BOOL)a10
{
  BOOL v14 = a3;
  v30[6] = *MEMORY[0x1E4F143B8];
  v16 = NSNumber;
  v17 = (__CFString *)a8;
  v18 = (__CFString *)a7;
  v19 = (__CFString *)a6;
  v20 = (__CFString *)a5;
  uint64_t v21 = [v16 numberWithUnsignedInteger:a4];
  v22 = (void *)v21;
  v23 = @"null";
  if (v20) {
    v24 = v20;
  }
  else {
    v24 = @"null";
  }
  v30[0] = v21;
  v30[1] = v24;
  if (v19) {
    v25 = v19;
  }
  else {
    v25 = @"null";
  }
  if (v18) {
    v26 = v18;
  }
  else {
    v26 = @"null";
  }
  v30[2] = v25;
  v30[3] = v26;
  if (v17) {
    v27 = v17;
  }
  else {
    v27 = @"null";
  }
  if (a10) {
    v23 = @"semantic";
  }
  if (a9) {
    v23 = @"linguistic";
  }
  v30[4] = v27;
  v30[5] = v23;
  v28 = [MEMORY[0x1E4F1C978] arrayWithObjects:v30 count:6];

  predictionEngagementTracker = self->_predictionEngagementTracker;
  if (v14) {
    [(PETGoalConversionEventTracker *)predictionEngagementTracker trackGoalConversionEventWithPropertyValues:v28];
  }
  else {
    [(PETGoalConversionEventTracker *)predictionEngagementTracker trackGoalOpportunityEventWithPropertyValues:v28];
  }
}

- (void)trackTextFieldEntryWithEmpty:(BOOL)a3 fieldType:(id)a4 trigger:(id)a5
{
  BOOL v6 = a3;
  v17 = (__CFString *)a4;
  id v8 = a5;
  if ([(TIConnectionsMetricsTracker *)self isIgnoredTrigger:v8])
  {

    id v8 = 0;
  }
  if ([(TIConnectionsMetricsTracker *)self inputContextDidChange])
  {
    [(TIConnectionsMetricsTracker *)self setInputContextDidChange:0];
    if (v8)
    {
      if (![v8 triggerSourceType]
        || [v8 triggerSourceType] == 1)
      {
        v9 = [v8 attributes];
        uint64_t v10 = [v9 objectForKeyedSubscript:@"field"];
        v11 = (void *)v10;
        if (v10) {
          v12 = (__CFString *)v10;
        }
        else {
          v12 = @"null";
        }
        [(TIConnectionsMetricsTracker *)self trackTextFieldEntryWithEmpty:v6 fieldType:v17 linguistic:1 semantic:0 requestType:v12];

        goto LABEL_14;
      }
      v15 = @"null";
      v13 = self;
      BOOL v14 = v6;
      uint64_t v16 = 1;
    }
    else
    {
      v13 = self;
      BOOL v14 = v6;
      v15 = v17;
      uint64_t v16 = 0;
    }
    [(TIConnectionsMetricsTracker *)v13 trackTextFieldEntryWithEmpty:v14 fieldType:v15 linguistic:0 semantic:v16 requestType:@"null"];
  }
LABEL_14:
}

- (void)trackTextFieldEntryWithEmpty:(BOOL)a3 fieldType:(id)a4 linguistic:(BOOL)a5 semantic:(BOOL)a6 requestType:(id)a7
{
  v17[4] = *MEMORY[0x1E4F143B8];
  textFieldEntryTracker = self->_textFieldEntryTracker;
  v9 = @"0";
  if (a3) {
    v9 = @"1";
  }
  uint64_t v10 = @"null";
  if (a4) {
    v11 = (__CFString *)a4;
  }
  else {
    v11 = @"null";
  }
  v17[0] = v9;
  v17[1] = v11;
  v12 = @"semantic";
  if (!a6) {
    v12 = @"null";
  }
  if (a5) {
    v12 = @"linguistic";
  }
  if (a7) {
    uint64_t v10 = (__CFString *)a7;
  }
  v17[2] = v12;
  v17[3] = v10;
  v13 = (void *)MEMORY[0x1E4F1C978];
  id v14 = a7;
  id v15 = a4;
  uint64_t v16 = [v13 arrayWithObjects:v17 count:4];
  [(PETScalarEventTracker *)textFieldEntryTracker trackEventWithPropertyValues:v16];
}

- (BOOL)isIgnoredTrigger:(id)a3
{
  if (!a3) {
    return 0;
  }
  v3 = [a3 attributes];
  v4 = [v3 objectForKey:*MEMORY[0x1E4F721D0]];
  v5 = [MEMORY[0x1E4F1CA98] null];
  char v6 = [v4 isEqual:v5];

  return v6;
}

- (TIConnectionsMetricsTracker)init
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v20.receiver = self;
  v20.super_class = (Class)TIConnectionsMetricsTracker;
  v2 = [(TIConnectionsMetricsTracker *)&v20 init];
  if (v2)
  {
    v19 = [MEMORY[0x1E4F93720] propertyWithName:@"empty" possibleValues:&unk_1F3FA77D8];
    v3 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"field"];
    v4 = [MEMORY[0x1E4F93720] propertyWithName:@"trigger" possibleValues:&unk_1F3FA77F0];
    v18 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"request"];
    v17 = objc_msgSend(MEMORY[0x1E4F93720], "propertyWithName:range:clampValues:", @"age", 0, 31536000, 1);
    uint64_t v16 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"response"];
    v5 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"fromBundleId"];
    char v6 = [MEMORY[0x1E4F93720] freeValuedPropertyWithName:@"targetApp"];
    id v7 = objc_alloc(MEMORY[0x1E4F93738]);
    v22[0] = v19;
    v22[1] = v3;
    v22[2] = v4;
    v22[3] = v18;
    id v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];
    uint64_t v9 = [v7 initWithFeatureId:@"kbd_textcontainer" event:@"reentry" registerProperties:v8];
    textFieldEntryTracker = v2->_textFieldEntryTracker;
    v2->_textFieldEntryTracker = (PETScalarEventTracker *)v9;

    id v11 = objc_alloc(MEMORY[0x1E4F93730]);
    v21[0] = v17;
    v21[1] = v3;
    v21[2] = v16;
    v21[3] = v5;
    v21[4] = v6;
    v21[5] = v4;
    v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v21 count:6];
    uint64_t v13 = [v11 initWithFeatureId:@"kbd_proactive" opportunityEvent:@"shown" conversionEvent:@"engaged" registerProperties:v12];
    predictionEngagementTracker = v2->_predictionEngagementTracker;
    v2->_predictionEngagementTracker = (PETGoalConversionEventTracker *)v13;

    v2->_inputContextDidChange = 0;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_12188 != -1) {
    dispatch_once(&sharedInstance_onceToken_12188, &__block_literal_global_12189);
  }
  v2 = (void *)sharedInstance_sharedInstance;

  return v2;
}

uint64_t __45__TIConnectionsMetricsTracker_sharedInstance__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  uint64_t v1 = sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = v0;

  return MEMORY[0x1F41817F8](v0, v1);
}

@end