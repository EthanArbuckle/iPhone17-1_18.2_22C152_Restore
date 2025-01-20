@interface _PSMapsFeedback
- (BOOL)dryRun;
- (NSArray)suggestions;
- (_PSMapsFeedback)initWithFeedbackAction:(id)a3 predictionContext:(id)a4 suggestions:(id)a5;
- (_PSMapsFeedbackAction)action;
- (_PSMapsPredictionContext)context;
- (id)feedbackPayload;
- (id)getTrialID;
- (unint64_t)indexOfEngagedSuggestion;
- (void)donateToBiome;
- (void)setDryRun:(BOOL)a3;
@end

@implementation _PSMapsFeedback

- (_PSMapsFeedback)initWithFeedbackAction:(id)a3 predictionContext:(id)a4 suggestions:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_PSMapsFeedback;
  v12 = [(_PSMapsFeedback *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_action, a3);
    objc_storeStrong((id *)&v13->_context, a4);
    objc_storeStrong((id *)&v13->_suggestions, a5);
  }

  return v13;
}

- (unint64_t)indexOfEngagedSuggestion
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v3 = [(_PSMapsFeedback *)self action];
  v4 = [v3 handle];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v5 = [(_PSMapsFeedback *)self suggestions];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    v18 = self;
    uint64_t v8 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        id v11 = [v10 recipients];
        v12 = [v11 firstObject];
        v13 = [v12 handle];
        char v14 = [v13 isEqualToString:v4];

        if (v14)
        {
          v16 = [(_PSMapsFeedback *)v18 suggestions];
          unint64_t v15 = [v16 indexOfObject:v10];

          goto LABEL_11;
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
  unint64_t v15 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v15;
}

- (id)getTrialID
{
  v3 = [(_PSMapsFeedback *)self suggestions];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(_PSMapsFeedback *)self suggestions];
    uint64_t v6 = [v5 objectAtIndex:0];
    uint64_t v7 = [v6 trialID];
  }
  else
  {
    uint64_t v7 = @"default";
  }

  return v7;
}

- (id)feedbackPayload
{
  v3 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[_PSMapsFeedback indexOfEngagedSuggestion](self, "indexOfEngagedSuggestion"));
  v17 = [(_PSMapsFeedback *)self action];
  v16 = [v17 suggestion];
  char v14 = [v16 reasonType];
  unint64_t v15 = [(_PSMapsFeedback *)self action];
  uint64_t v4 = [v15 suggestion];
  v5 = [v4 reason];
  uint64_t v6 = [(_PSMapsFeedback *)self context];
  uint64_t v7 = [v6 bundleID];
  uint64_t v8 = objc_msgSend(NSNumber, "numberWithBool:", -[_PSMapsFeedback dryRun](self, "dryRun"));
  id v9 = [(_PSMapsFeedback *)self action];
  uint64_t v10 = [v9 type];
  id v11 = [(_PSMapsFeedback *)self getTrialID];
  v12 = +[_PSFeedbackUtils feedbackPayloadWithIndex:v3 reasonType:v14 reason:v5 sourceBundleId:v7 transportBundleId:0 numberOfVisibleSuggestions:0 sessionId:0 delay:0 testEvent:v8 iCloudFamilyInvocation:&unk_1EF675498 engagementType:v10 trialID:v11];

  return v12;
}

- (void)donateToBiome
{
  v3 = [(_PSMapsFeedback *)self action];
  uint64_t v4 = [v3 suggestion];

  if (v4)
  {
    v5 = [v4 recipients];
    uint64_t v6 = [v5 firstObject];
    uint64_t v7 = [v6 contact];
    v26 = [v7 identifier];

    uint64_t v8 = [v4 recipients];
    id v9 = [v8 firstObject];
    uint64_t v10 = [v9 handle];
  }
  else
  {
    id v11 = [(_PSMapsFeedback *)self action];
    v26 = [v11 contactId];

    uint64_t v8 = [(_PSMapsFeedback *)self action];
    uint64_t v10 = [v8 handle];
  }

  uint64_t v28 = 0;
  v29 = &v28;
  uint64_t v30 = 0x2050000000;
  v12 = (void *)getBMMapsShareETAFeedbackClass_softClass;
  uint64_t v31 = getBMMapsShareETAFeedbackClass_softClass;
  if (!getBMMapsShareETAFeedbackClass_softClass)
  {
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __getBMMapsShareETAFeedbackClass_block_invoke;
    v27[3] = &unk_1E5ADE858;
    v27[4] = &v28;
    __getBMMapsShareETAFeedbackClass_block_invoke((uint64_t)v27);
    v12 = (void *)v29[3];
  }
  v13 = v12;
  _Block_object_dispose(&v28, 8);
  id v14 = [v13 alloc];
  unint64_t v15 = [(_PSMapsFeedback *)self context];
  v16 = [v15 bundleID];
  v17 = [(_PSMapsFeedback *)self context];
  v18 = [v17 navigationStartLocationId];
  long long v19 = [(_PSMapsFeedback *)self context];
  long long v20 = [v19 navigationEndLocationId];
  long long v21 = (void *)[v14 initWithIdentifier:@"MapsShareETAFeedback" bundleId:v16 handle:v10 startLocationId:v18 endLocationId:v20 contactId:v26 groupId:0];

  long long v22 = BiomeLibrary();
  v23 = [v22 MapsShare];
  uint64_t v24 = [v23 ETAFeedback];

  v25 = [v24 source];
  [v25 sendEvent:v21];
}

- (_PSMapsFeedbackAction)action
{
  return self->_action;
}

- (_PSMapsPredictionContext)context
{
  return self->_context;
}

- (NSArray)suggestions
{
  return self->_suggestions;
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
  objc_storeStrong((id *)&self->_suggestions, 0);
  objc_storeStrong((id *)&self->_context, 0);

  objc_storeStrong((id *)&self->_action, 0);
}

@end