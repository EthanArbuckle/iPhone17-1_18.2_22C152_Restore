@interface SAMPSetQueueQueueFilter
+ (id)setQueueQueueFilter;
- (NSString)mediaItemProperty;
- (NSString)operation;
- (NSString)value;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setMediaItemProperty:(id)a3;
- (void)setOperation:(id)a3;
- (void)setValue:(id)a3;
@end

@implementation SAMPSetQueueQueueFilter

- (id)groupIdentifier
{
  return @"com.apple.ace.media";
}

- (id)encodedClassName
{
  return @"SetQueueQueueFilter";
}

+ (id)setQueueQueueFilter
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)mediaItemProperty
{
  return (NSString *)[(AceObject *)self propertyForKey:@"mediaItemProperty"];
}

- (void)setMediaItemProperty:(id)a3
{
}

- (NSString)operation
{
  return (NSString *)[(AceObject *)self propertyForKey:@"operation"];
}

- (void)setOperation:(id)a3
{
}

- (NSString)value
{
  return (NSString *)[(AceObject *)self propertyForKey:@"value"];
}

- (void)setValue:(id)a3
{
}

@end