@interface NSInvocation(WebMainThreadInvoker)
- (char)_webkit_invokeAndHandleException:()WebMainThreadInvoker;
@end

@implementation NSInvocation(WebMainThreadInvoker)

- (char)_webkit_invokeAndHandleException:()WebMainThreadInvoker
{
  [a1 invoke];
  result = strchr((char *)objc_msgSend((id)objc_msgSend(a1, "methodSignature"), "methodReturnType"), 64);
  if (result)
  {
    id v3 = 0;
    [a1 getReturnValue:&v3];
    return (char *)v3;
  }
  return result;
}

@end