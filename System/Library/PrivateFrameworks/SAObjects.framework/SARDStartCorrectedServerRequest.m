@interface SARDStartCorrectedServerRequest
- (BOOL)requiresResponse;
- (NSString)interactionIdToBeCorrected;
- (NSString)utteranceToBeCorrected;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setInteractionIdToBeCorrected:(id)a3;
- (void)setUtteranceToBeCorrected:(id)a3;
@end

@implementation SARDStartCorrectedServerRequest

- (id)groupIdentifier
{
  return @"com.apple.ace.requestdispatch";
}

- (id)encodedClassName
{
  return @"StartCorrectedServerRequest";
}

- (NSString)interactionIdToBeCorrected
{
  return (NSString *)[(AceObject *)self propertyForKey:@"interactionIdToBeCorrected"];
}

- (void)setInteractionIdToBeCorrected:(id)a3
{
}

- (NSString)utteranceToBeCorrected
{
  return (NSString *)[(AceObject *)self propertyForKey:@"utteranceToBeCorrected"];
}

- (void)setUtteranceToBeCorrected:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end