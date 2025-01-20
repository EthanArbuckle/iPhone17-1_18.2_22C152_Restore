@interface SAUpdateReadingState
+ (id)updateReadingState;
- (BOOL)requiresResponse;
- (NSArray)items;
- (NSString)readingStateId;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)updatedGroupIndex;
- (int64_t)updatedItemIndex;
- (void)setItems:(id)a3;
- (void)setReadingStateId:(id)a3;
- (void)setUpdatedGroupIndex:(int64_t)a3;
- (void)setUpdatedItemIndex:(int64_t)a3;
@end

@implementation SAUpdateReadingState

- (id)groupIdentifier
{
  return @"com.apple.ace.system";
}

- (id)encodedClassName
{
  return @"UpdateReadingState";
}

+ (id)updateReadingState
{
  id v2 = objc_alloc_init((Class)a1);
  return v2;
}

- (NSArray)items
{
  return (NSArray *)[(AceObject *)self propertyForKey:@"items"];
}

- (void)setItems:(id)a3
{
}

- (NSString)readingStateId
{
  return (NSString *)[(AceObject *)self propertyForKey:@"readingStateId"];
}

- (void)setReadingStateId:(id)a3
{
}

- (int64_t)updatedGroupIndex
{
  return AceObjectIntegerForProperty(self, @"updatedGroupIndex");
}

- (void)setUpdatedGroupIndex:(int64_t)a3
{
}

- (int64_t)updatedItemIndex
{
  return AceObjectIntegerForProperty(self, @"updatedItemIndex");
}

- (void)setUpdatedItemIndex:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end