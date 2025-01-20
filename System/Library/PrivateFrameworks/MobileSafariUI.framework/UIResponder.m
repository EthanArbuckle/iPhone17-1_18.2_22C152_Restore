@interface UIResponder
- (uint64_t)safari_becomeFirstResponderIfNeeded;
@end

@implementation UIResponder

- (uint64_t)safari_becomeFirstResponderIfNeeded
{
  if (result)
  {
    v1 = (void *)result;
    result = objc_msgSend((id)result, "sf_inResponderChain");
    if ((result & 1) == 0)
    {
      return [v1 becomeFirstResponder];
    }
  }
  return result;
}

@end