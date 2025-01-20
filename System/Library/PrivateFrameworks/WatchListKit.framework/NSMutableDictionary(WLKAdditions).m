@interface NSMutableDictionary(WLKAdditions)
- (void)wlk_setObjectUnlessNil:()WLKAdditions forKey:;
- (void)wlk_setObjectUnlessNilOrEmpty:()WLKAdditions forKey:;
@end

@implementation NSMutableDictionary(WLKAdditions)

- (void)wlk_setObjectUnlessNil:()WLKAdditions forKey:
{
  if (a3) {
    return objc_msgSend(a1, "setObject:forKey:");
  }
  return a1;
}

- (void)wlk_setObjectUnlessNilOrEmpty:()WLKAdditions forKey:
{
  id v7 = a3;
  id v6 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v7 count]) {
    [a1 setObject:v7 forKey:v6];
  }
}

@end