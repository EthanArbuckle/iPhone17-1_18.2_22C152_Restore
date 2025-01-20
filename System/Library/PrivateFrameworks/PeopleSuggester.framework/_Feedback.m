@interface _Feedback
- (BOOL)isFallbackFetch;
- (NSString)conversationId;
- (int64_t)feedbackActionType;
- (void)setConversationId:(id)a3;
- (void)setFeedbackActionType:(int64_t)a3;
- (void)setIsFallbackFetch:(BOOL)a3;
@end

@implementation _Feedback

- (NSString)conversationId
{
  return self->_conversationId;
}

- (void)setConversationId:(id)a3
{
}

- (int64_t)feedbackActionType
{
  return self->_feedbackActionType;
}

- (void)setFeedbackActionType:(int64_t)a3
{
  self->_feedbackActionType = a3;
}

- (BOOL)isFallbackFetch
{
  return self->_isFallbackFetch;
}

- (void)setIsFallbackFetch:(BOOL)a3
{
  self->_isFallbackFetch = a3;
}

- (void).cxx_destruct
{
}

@end