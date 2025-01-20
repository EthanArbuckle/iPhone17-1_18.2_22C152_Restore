@interface SAMPSetQueueQueueOrder
+ (id)setQueueQueueOrder;
- (BOOL)descending;
- (NSString)mediaItemProperty;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDescending:(BOOL)a3;
- (void)setMediaItemProperty:(id)a3;
@end

@implementation SAMPSetQueueQueueOrder

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"SetQueueQueueOrder";
}

+ (id)setQueueQueueOrder
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (BOOL)descending
{
  return AceObjectBoolForProperty(self, @"descending");
}

- (void)setDescending:(BOOL)a3
{
}

- (NSString)mediaItemProperty
{
  return (NSString *)[(AceObject *)self propertyForKey:@"mediaItemProperty"];
}

- (void)setMediaItemProperty:(id)a3
{
}

@end