@interface SARDMUXExecuteNLOnServer
- (BOOL)markedForHandOff;
- (BOOL)muxStateRollback;
- (BOOL)requiresResponse;
- (NSString)selectedUserId;
- (NSString)selectedUserIdentityClassification;
- (SAConfidenceScores)voiceIDConfidenceScores;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMarkedForHandOff:(BOOL)a3;
- (void)setMuxStateRollback:(BOOL)a3;
- (void)setSelectedUserId:(id)a3;
- (void)setSelectedUserIdentityClassification:(id)a3;
- (void)setVoiceIDConfidenceScores:(id)a3;
@end

@implementation SARDMUXExecuteNLOnServer

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"MUXExecuteNLOnServer";
}

- (BOOL)markedForHandOff
{
  return AceObjectBoolForProperty(self, @"markedForHandOff");
}

- (void)setMarkedForHandOff:(BOOL)a3
{
}

- (BOOL)muxStateRollback
{
  return AceObjectBoolForProperty(self, @"muxStateRollback");
}

- (void)setMuxStateRollback:(BOOL)a3
{
}

- (NSString)selectedUserId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selectedUserId"];
}

- (void)setSelectedUserId:(id)a3
{
}

- (NSString)selectedUserIdentityClassification
{
  return (NSString *)[(AceObject *)self propertyForKey:@"selectedUserIdentityClassification"];
}

- (void)setSelectedUserIdentityClassification:(id)a3
{
}

- (SAConfidenceScores)voiceIDConfidenceScores
{
  return (SAConfidenceScores *)AceObjectAceObjectForProperty(self, @"voiceIDConfidenceScores");
}

- (void)setVoiceIDConfidenceScores:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end