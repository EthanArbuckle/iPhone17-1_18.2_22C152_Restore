@interface PXViewLayoutAttributesDescription
@end

@implementation PXViewLayoutAttributesDescription

__CFString *__PXViewLayoutAttributesDescription_block_invoke(double a1)
{
  if (a1 == INFINITY)
  {
    v2 = @"fit";
  }
  else if (a1 == -INFINITY)
  {
    v2 = @"anchored";
  }
  else
  {
    v2 = (__CFString *)objc_msgSend([NSString alloc], "initWithFormat:", @"%0.1f", *(void *)&a1);
  }
  return v2;
}

@end