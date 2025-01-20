@interface _PSMessagesZkwFeedback
- (BOOL)dryRun;
- (NSArray)suggestions;
- (NSString)chatGuidEngaged;
- (_PSMessagesZkwFeedback)initWithChatGuidEngagaged:(id)a3 suggestions:(id)a4;
- (id)feedbackPayload;
- (id)getTrialID;
- (id)reasonForSuggestionIndex:(unint64_t)a3;
- (id)reasonTypeForSuggestionIndex:(unint64_t)a3;
- (int64_t)feedbackActionTypeForSuggestionIndex:(unint64_t)a3;
- (unint64_t)indexOfEngagedSuggestionForChatGuidEngaged;
- (void)setDryRun:(BOOL)a3;
@end

@implementation _PSMessagesZkwFeedback

- (_PSMessagesZkwFeedback)initWithChatGuidEngagaged:(id)a3 suggestions:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)_PSMessagesZkwFeedback;
  v8 = [(_PSMessagesZkwFeedback *)&v14 init];
  if (v8)
  {
    uint64_t v9 = [v6 copy];
    chatGuidEngaged = v8->_chatGuidEngaged;
    v8->_chatGuidEngaged = (NSString *)v9;

    uint64_t v11 = [v7 copy];
    suggestions = v8->_suggestions;
    v8->_suggestions = (NSArray *)v11;
  }
  return v8;
}

- (id)getTrialID
{
  v3 = [(_PSMessagesZkwFeedback *)self suggestions];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    v5 = [(_PSMessagesZkwFeedback *)self suggestions];
    id v6 = [v5 objectAtIndex:0];
    id v7 = [v6 trialID];
  }
  else
  {
    id v7 = @"default";
  }

  return v7;
}

- (id)feedbackPayload
{
  unint64_t v3 = [(_PSMessagesZkwFeedback *)self indexOfEngagedSuggestionForChatGuidEngaged];
  uint64_t v4 = [NSNumber numberWithUnsignedInteger:v3];
  v5 = [(_PSMessagesZkwFeedback *)self reasonTypeForSuggestionIndex:v3];
  id v6 = [(_PSMessagesZkwFeedback *)self reasonForSuggestionIndex:v3];
  id v7 = objc_msgSend(NSNumber, "numberWithBool:", -[_PSMessagesZkwFeedback dryRun](self, "dryRun"));
  int64_t v8 = [(_PSMessagesZkwFeedback *)self feedbackActionTypeForSuggestionIndex:v3];
  uint64_t v9 = [(_PSMessagesZkwFeedback *)self getTrialID];
  v10 = +[_PSFeedbackUtils feedbackPayloadWithIndex:v4 reasonType:v5 reason:v6 sourceBundleId:0 transportBundleId:0 numberOfVisibleSuggestions:0 sessionId:0 delay:0 testEvent:v7 iCloudFamilyInvocation:&unk_1EF6754B0 engagementType:v8 trialID:v9];

  return v10;
}

- (unint64_t)indexOfEngagedSuggestionForChatGuidEngaged
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(_PSMessagesZkwFeedback *)self chatGuidEngaged];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v4 = [(_PSMessagesZkwFeedback *)self suggestions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v10 = [v9 conversationIdentifier];
        char v11 = [v10 isEqualToString:v3];

        if (v11)
        {
          v13 = [(_PSMessagesZkwFeedback *)self suggestions];
          unint64_t v12 = [v13 indexOfObject:v9];

          goto LABEL_11;
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  unint64_t v12 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_11:

  return v12;
}

- (int64_t)feedbackActionTypeForSuggestionIndex:(unint64_t)a3
{
  return a3 == 0x7FFFFFFFFFFFFFFFLL;
}

- (id)reasonTypeForSuggestionIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = 0;
  }
  else
  {
    uint64_t v5 = [(_PSMessagesZkwFeedback *)self suggestions];
    uint64_t v6 = [v5 objectAtIndex:a3];
    unint64_t v3 = [v6 reasonType];
  }

  return v3;
}

- (id)reasonForSuggestionIndex:(unint64_t)a3
{
  if (a3 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unint64_t v3 = 0;
  }
  else
  {
    uint64_t v5 = [(_PSMessagesZkwFeedback *)self suggestions];
    uint64_t v6 = [v5 objectAtIndex:a3];
    unint64_t v3 = [v6 reason];
  }

  return v3;
}

- (NSString)chatGuidEngaged
{
  return self->_chatGuidEngaged;
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

  objc_storeStrong((id *)&self->_chatGuidEngaged, 0);
}

@end