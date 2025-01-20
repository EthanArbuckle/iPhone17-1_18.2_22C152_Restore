@interface StateDescription
@end

@implementation StateDescription

void ___StateDescription_block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v4 = a3;
  if ([v5 length]) {
    [v5 appendString:@"|"];
  }
  [v5 appendString:v4];
}

@end