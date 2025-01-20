@interface SACreateVOXListItem
+ (id)createVOXListItem;
- (NSArray)displayHints;
- (NSString)speakableInSequence;
- (NSString)speakableStandalone;
- (id)encodedClassName;
- (id)groupIdentifier;
- (void)setDisplayHints:(id)a3;
- (void)setSpeakableInSequence:(id)a3;
- (void)setSpeakableStandalone:(id)a3;
@end

@implementation SACreateVOXListItem

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"CreateVOXListItem";
}

+ (id)createVOXListItem
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)displayHints
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"displayHints"];
}

- (void)setDisplayHints:(id)a3
{
}

- (NSString)speakableInSequence
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speakableInSequence"];
}

- (void)setSpeakableInSequence:(id)a3
{
}

- (NSString)speakableStandalone
{
  return (NSString *)[(AceObject *)self propertyForKey:@"speakableStandalone"];
}

- (void)setSpeakableStandalone:(id)a3
{
}

@end