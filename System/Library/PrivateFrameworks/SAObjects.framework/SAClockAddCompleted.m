@interface SAClockAddCompleted
+ (id)addCompleted;
- (BOOL)alreadyExists;
- (BOOL)requiresResponse;
- (NSURL)worldClockId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setAlreadyExists:(BOOL)a3;
- (void)setWorldClockId:(id)a3;
@end

@implementation SAClockAddCompleted

- (id)groupIdentifier
{
  return @"com.apple.ace.clock";
}

- (id)encodedClassName
{
  return @"AddCompleted";
}

+ (id)addCompleted
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)alreadyExists
{
  return AceObjectBoolForProperty(self, @"alreadyExists");
}

- (void)setAlreadyExists:(BOOL)a3
{
}

- (NSURL)worldClockId
{
  return (NSURL *)AceObjectURLForProperty(self, @"worldClockId");
}

- (void)setWorldClockId:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end