@interface NSString(SCRCMathLatex)
- (id)stringWithMathIndicators;
@end

@implementation NSString(SCRCMathLatex)

- (id)stringWithMathIndicators
{
  v1 = (void *)[a1 copy];
  if ([v1 length])
  {
    uint64_t v2 = [NSString stringWithFormat:@"$%@$", v1];

    v1 = (void *)v2;
  }
  return v1;
}

@end