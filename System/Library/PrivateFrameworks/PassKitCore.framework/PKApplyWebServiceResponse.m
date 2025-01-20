@interface PKApplyWebServiceResponse
+ (BOOL)supportsSecureCoding;
- (NSString)conversationIdentifier;
- (void)setConversationIdentifier:(id)a3;
@end

@implementation PKApplyWebServiceResponse

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NSString)conversationIdentifier
{
  return self->_conversationIdentifier;
}

- (void)setConversationIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
}

@end