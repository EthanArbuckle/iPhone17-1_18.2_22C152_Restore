@interface SAVCSAddResultsToContentShelf
+ (id)addResultsToContentShelf;
- (BOOL)requiresResponse;
- (NSArray)fetchMoreResultsCommands;
- (NSArray)results;
- (NSString)contentShelfViewId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)pageNumber;
- (void)setContentShelfViewId:(id)a3;
- (void)setFetchMoreResultsCommands:(id)a3;
- (void)setPageNumber:(int64_t)a3;
- (void)setResults:(id)a3;
@end

@implementation SAVCSAddResultsToContentShelf

- (id)groupIdentifier
{
  return @"com.apple.ace.videocontent";
}

- (id)encodedClassName
{
  return @"AddResultsToContentShelf";
}

+ (id)addResultsToContentShelf
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSString)contentShelfViewId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"contentShelfViewId"];
}

- (void)setContentShelfViewId:(id)a3
{
}

- (NSArray)fetchMoreResultsCommands
{
  return (NSArray *)AceObjectProtocolArrayForProperty(self, @"fetchMoreResultsCommands", &unk_1EFD73568);
}

- (void)setFetchMoreResultsCommands:(id)a3
{
}

- (int64_t)pageNumber
{
  return AceObjectIntegerForProperty(self, @"pageNumber");
}

- (void)setPageNumber:(int64_t)a3
{
}

- (NSArray)results
{
  uint64_t v3 = objc_opt_class();
  return (NSArray *)AceObjectClassArrayForProperty(self, @"results", v3);
}

- (void)setResults:(id)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end