@interface SAUserTokenStatus
- (NSNumber)errorCode;
- (NSNumber)lastUpdateAttemptTime;
- (NSNumber)shouldExcludeFromBackgroundRefresh;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setErrorCode:(id)a3;
- (void)setLastUpdateAttemptTime:(id)a3;
- (void)setShouldExcludeFromBackgroundRefresh:(id)a3;
@end

@implementation SAUserTokenStatus

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"UserTokenStatus";
}

- (NSNumber)errorCode
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"errorCode"];
}

- (void)setErrorCode:(id)a3
{
}

- (NSNumber)lastUpdateAttemptTime
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"lastUpdateAttemptTime"];
}

- (void)setLastUpdateAttemptTime:(id)a3
{
}

- (NSNumber)shouldExcludeFromBackgroundRefresh
{
  return (NSNumber *)[(AceObject *)self propertyForKey:@"shouldExcludeFromBackgroundRefresh"];
}

- (void)setShouldExcludeFromBackgroundRefresh:(id)a3
{
}

@end