@interface SACFAbstractClientCommandCompleted
+ (id)abstractClientCommandCompleted;
- (BOOL)requiresResponse;
- (NSArray)outputLogs;
- (NSString)results;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)status;
- (void)setOutputLogs:(id)a3;
- (void)setResults:(id)a3;
- (void)setStatus:(int64_t)a3;
@end

@implementation SACFAbstractClientCommandCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.clientflow";
}

- (id)encodedClassName
{
  return @"AbstractClientCommandCompleted";
}

+ (id)abstractClientCommandCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)outputLogs
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"outputLogs"];
}

- (void)setOutputLogs:(id)a3
{
}

- (NSString)results
{
  return (NSString *)[(AceObject *)self propertyForKey:@"results"];
}

- (void)setResults:(id)a3
{
}

- (int64_t)status
{
  return AceObjectIntegerForProperty(self, @"status");
}

- (void)setStatus:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end