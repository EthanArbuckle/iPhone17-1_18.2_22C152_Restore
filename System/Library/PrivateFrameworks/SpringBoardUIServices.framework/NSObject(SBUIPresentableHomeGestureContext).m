@interface NSObject(SBUIPresentableHomeGestureContext)
- (id)presentableHomeGestureContext;
@end

@implementation NSObject(SBUIPresentableHomeGestureContext)

- (id)presentableHomeGestureContext
{
  if (objc_opt_respondsToSelector())
  {
    v2 = [a1 presentableContext];
    if (objc_opt_respondsToSelector()) {
      id v3 = v2;
    }
    else {
      id v3 = 0;
    }
  }
  else
  {
    id v3 = 0;
  }
  return v3;
}

@end