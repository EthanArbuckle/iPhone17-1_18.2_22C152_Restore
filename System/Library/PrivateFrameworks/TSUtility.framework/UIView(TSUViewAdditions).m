@interface UIView(TSUViewAdditions)
- (uint64_t)addBorderWithColor:()TSUViewAdditions;
@end

@implementation UIView(TSUViewAdditions)

- (uint64_t)addBorderWithColor:()TSUViewAdditions
{
  objc_msgSend((id)objc_msgSend(a1, "layer"), "setBorderWidth:", 1.0);
  uint64_t v5 = [a3 CGColor];
  v6 = (void *)[a1 layer];
  return [v6 setBorderColor:v5];
}

@end