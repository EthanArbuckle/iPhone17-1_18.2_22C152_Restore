@interface SAUIPaginateListResponse
- (BOOL)requiresResponse;
- (id)encodedClassName;
- (id)groupIdentifier;
- (int64_t)firstItemIndex;
- (int64_t)focusedItemIndex;
- (void)setFirstItemIndex:(int64_t)a3;
- (void)setFocusedItemIndex:(int64_t)a3;
@end

@implementation SAUIPaginateListResponse

- (id)groupIdentifier
{
  return @"com.apple.ace.assistant";
}

- (id)encodedClassName
{
  return @"PaginateListResponse";
}

- (int64_t)firstItemIndex
{
  return AceObjectIntegerForProperty(self, @"firstItemIndex");
}

- (void)setFirstItemIndex:(int64_t)a3
{
}

- (int64_t)focusedItemIndex
{
  return AceObjectIntegerForProperty(self, @"focusedItemIndex");
}

- (void)setFocusedItemIndex:(int64_t)a3
{
}

- (BOOL)requiresResponse
{
  return 0;
}

@end