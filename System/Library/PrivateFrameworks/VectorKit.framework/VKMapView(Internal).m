@interface VKMapView(Internal)
- (uint64_t)populateDebugNode:()Internal withOptions:;
- (void)populateDebugNode:()Internal withOptions:;
@end

@implementation VKMapView(Internal)

- (void)populateDebugNode:()Internal withOptions:
{
}

- (uint64_t)populateDebugNode:()Internal withOptions:
{
  uint64_t v2 = *(void *)(result + 8);
  *a2 = &unk_1EF56C7E0;
  a2[1] = v2;
  return result;
}

@end