@interface SAVCSContentShelf
+ (id)contentShelf;
- (NSArray)contentHead;
- (NSArray)fetchMoreResultsCommands;
- (NSString)title;
- (NSURL)url;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)preSelectedItem;
- (void)setContentHead:(id)a3;
- (void)setFetchMoreResultsCommands:(id)a3;
- (void)setPreSelectedItem:(int64_t)a3;
- (void)setTitle:(id)a3;
- (void)setUrl:(id)a3;
@end

@implementation SAVCSContentShelf

- (id)groupIdentifier
{
  return @"com.apple.ace.videocontent";
}

- (id)encodedClassName
{
  return @"ContentShelf";
}

+ (id)contentShelf
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)contentHead
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"contentHead", v3);
}

- (void)setContentHead:(id)a3
{
}

- (NSArray)fetchMoreResultsCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"fetchMoreResultsCommands", &unk_1EFD73568);
}

- (void)setFetchMoreResultsCommands:(id)a3
{
}

- (int64_t)preSelectedItem
{
  return AceObjectIntegerForProperty(self, @"preSelectedItem");
}

- (void)setPreSelectedItem:(int64_t)a3
{
}

- (NSString)title
{
  return (NSString *)[(AceObject *)self propertyForKey:@"title"];
}

- (void)setTitle:(id)a3
{
}

- (NSURL)url
{
  return (NSURL *)AceObjectURLForProperty(self, @"url");
}

- (void)setUrl:(id)a3
{
}

@end