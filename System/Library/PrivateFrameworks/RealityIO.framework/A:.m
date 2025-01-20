@interface A:
- (uint64_t)B;
@end

@implementation A:

- (uint64_t)B
{
  return Dictionary<>.vtValue.getter(*v0);
}

@end