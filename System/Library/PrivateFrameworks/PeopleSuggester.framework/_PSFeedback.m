@interface _PSFeedback
+ (id)feedbackForAction:(id)a3 delay:(double)a4 context:(id)a5 suggestions:(id)a6 numberOfVisibleSuggestions:(float)a7 sessionIdentifier:(id)a8;
+ (id)feedbackForActionWithAirdrop:(id)a3 delay:(double)a4 context:(id)a5 suggestions:(id)a6 numberOfVisibleSuggestions:(float)a7 sessionIdentifier:(id)a8 isAirDropEvent:(BOOL)a9 wasAirDropShown:(BOOL)a10;
- (BOOL)dryRun;
- (BOOL)isAirDropEvent;
- (BOOL)wasAirDropShown;
- (NSArray)suggestions;
- (NSString)sessionIdentifier;
- (_PSFeedback)initWithAction:(id)a3 delay:(double)a4 context:(id)a5 suggestions:(id)a6 numberOfVisibleSuggestions:(float)a7 sessionIdentifier:(id)a8 isAirDropEvent:(BOOL)a9 wasAirDropShown:(BOOL)a10;
- (_PSFeedbackAction)action;
- (_PSPredictionContext)context;
- (double)delay;
- (float)numberOfVisibleSuggestions;
- (id)feedbackPayloadShowFamily:(id)a3;
- (id)getTrialID;
- (unint64_t)indexOfEngagedSuggestion;
- (void)donateToBiome;
- (void)getTrialID;
- (void)setDryRun:(BOOL)a3;
@end

@implementation _PSFeedback

+ (id)feedbackForAction:(id)a3 delay:(double)a4 context:(id)a5 suggestions:(id)a6 numberOfVisibleSuggestions:(float)a7 sessionIdentifier:(id)a8
{
  id v14 = a8;
  id v15 = a6;
  id v16 = a5;
  id v17 = a3;
  id v18 = objc_alloc((Class)a1);
  *(float *)&double v19 = a7;
  v20 = (void *)[v18 initWithAction:v17 delay:v16 context:v15 suggestions:v14 numberOfVisibleSuggestions:0 sessionIdentifier:0 isAirDropEvent:a4 wasAirDropShown:v19];

  return v20;
}

+ (id)feedbackForActionWithAirdrop:(id)a3 delay:(double)a4 context:(id)a5 suggestions:(id)a6 numberOfVisibleSuggestions:(float)a7 sessionIdentifier:(id)a8 isAirDropEvent:(BOOL)a9 wasAirDropShown:(BOOL)a10
{
  BOOL v10 = a10;
  BOOL v11 = a9;
  id v18 = a8;
  id v19 = a6;
  id v20 = a5;
  id v21 = a3;
  id v22 = objc_alloc((Class)a1);
  *(float *)&double v23 = a7;
  v24 = (void *)[v22 initWithAction:v21 delay:v20 context:v19 suggestions:v18 numberOfVisibleSuggestions:v11 sessionIdentifier:v10 isAirDropEvent:a4 wasAirDropShown:v23];

  return v24;
}

- (_PSFeedback)initWithAction:(id)a3 delay:(double)a4 context:(id)a5 suggestions:(id)a6 numberOfVisibleSuggestions:(float)a7 sessionIdentifier:(id)a8 isAirDropEvent:(BOOL)a9 wasAirDropShown:(BOOL)a10
{
  id v18 = a3;
  id v19 = a5;
  id v20 = a6;
  id v21 = a8;
  v28.receiver = self;
  v28.super_class = (Class)_PSFeedback;
  id v22 = [(_PSFeedback *)&v28 init];
  double v23 = v22;
  if (v22)
  {
    objc_storeStrong((id *)&v22->_action, a3);
    v23->_delay = a4;
    objc_storeStrong((id *)&v23->_context, a5);
    objc_storeStrong((id *)&v23->_suggestions, a6);
    v23->_numberOfVisibleSuggestions = a7;
    uint64_t v24 = [v21 copy];
    sessionIdentifier = v23->_sessionIdentifier;
    v23->_sessionIdentifier = (NSString *)v24;

    v23->_isAirDropEvent = a9;
    v23->_wasAirDropShown = a10;
  }

  return v23;
}

- (id)getTrialID
{
  v3 = [(_PSFeedback *)self suggestions];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(_PSFeedback *)self suggestions];
    v6 = [v5 objectAtIndex:0];
    v7 = [v6 trialID];
  }
  else
  {
    v8 = +[_PSLogging feedbackChannel];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      -[_PSFeedback getTrialID](v8);
    }

    v7 = @"default";
  }

  return v7;
}

- (unint64_t)indexOfEngagedSuggestion
{
  v3 = [(_PSFeedback *)self action];
  uint64_t v4 = [v3 suggestion];

  if (v4)
  {
    v5 = [(_PSFeedback *)self suggestions];
    unint64_t v6 = [v5 indexOfObject:v4];
  }
  else
  {
    unint64_t v6 = 0x7FFFFFFFFFFFFFFFLL;
  }

  return v6;
}

- (id)feedbackPayloadShowFamily:(id)a3
{
  id v35 = a3;
  uint64_t v4 = [(_PSFeedback *)self context];
  int v5 = [v4 timedOut];
  unint64_t v6 = @"Model";
  if (v5) {
    unint64_t v6 = @"Cached Suggestions";
  }
  v7 = v6;

  v8 = [(_PSFeedback *)self action];
  uint64_t v9 = [v8 suggestion];
  if (!v9) {
    goto LABEL_6;
  }
  BOOL v10 = (void *)v9;
  BOOL v11 = [(_PSFeedback *)self action];
  v12 = [v11 suggestion];
  v13 = [v12 reasonType];
  int v14 = [v13 containsString:@"Heuristics"];

  if (v14)
  {
    v8 = [(_PSFeedback *)self action];
    id v15 = [v8 suggestion];
    uint64_t v16 = [v15 reason];

    v7 = (__CFString *)v16;
LABEL_6:
    v37 = v7;

    goto LABEL_8;
  }
  v37 = v7;
LABEL_8:
  v36 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_PSFeedback indexOfEngagedSuggestion](self, "indexOfEngagedSuggestion"));
  v34 = [(_PSFeedback *)self context];
  v30 = [v34 reasonType];
  v33 = [(_PSFeedback *)self context];
  v29 = [v33 bundleID];
  v32 = [(_PSFeedback *)self action];
  objc_super v28 = [v32 transportBundleID];
  id v17 = NSNumber;
  v31 = [(_PSFeedback *)self suggestions];
  v26 = objc_msgSend(v17, "numberWithUnsignedInteger:", objc_msgSend(v31, "count"));
  id v18 = [(_PSFeedback *)self sessionIdentifier];
  id v19 = NSNumber;
  [(_PSFeedback *)self delay];
  id v20 = objc_msgSend(v19, "numberWithDouble:");
  id v21 = objc_msgSend(NSNumber, "numberWithBool:", -[_PSFeedback dryRun](self, "dryRun"));
  id v22 = [(_PSFeedback *)self action];
  uint64_t v23 = [v22 type];
  uint64_t v24 = [(_PSFeedback *)self getTrialID];
  id v27 = +[_PSFeedbackUtils feedbackPayloadWithIndex:v36 reasonType:v30 reason:v37 sourceBundleId:v29 transportBundleId:v28 numberOfVisibleSuggestions:v26 sessionId:v18 delay:v20 testEvent:v21 iCloudFamilyInvocation:v35 engagementType:v23 trialID:v24];

  return v27;
}

- (void)donateToBiome
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1A314B000, a2, OS_LOG_TYPE_ERROR, "Error serializing share sheet attachments: %@", (uint8_t *)&v2, 0xCu);
}

- (_PSFeedbackAction)action
{
  return self->_action;
}

- (double)delay
{
  return self->_delay;
}

- (_PSPredictionContext)context
{
  return self->_context;
}

- (NSArray)suggestions
{
  return self->_suggestions;
}

- (float)numberOfVisibleSuggestions
{
  return self->_numberOfVisibleSuggestions;
}

- (NSString)sessionIdentifier
{
  return self->_sessionIdentifier;
}

- (BOOL)isAirDropEvent
{
  return self->_isAirDropEvent;
}

- (BOOL)wasAirDropShown
{
  return self->_wasAirDropShown;
}

- (BOOL)dryRun
{
  return self->_dryRun;
}

- (void)setDryRun:(BOOL)a3
{
  self->_dryRun = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sessionIdentifier, 0);
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

- (void)getTrialID
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A314B000, log, OS_LOG_TYPE_ERROR, "We are not making any suggestions, so we can not find valid trial id, use default instead", v1, 2u);
}

@end