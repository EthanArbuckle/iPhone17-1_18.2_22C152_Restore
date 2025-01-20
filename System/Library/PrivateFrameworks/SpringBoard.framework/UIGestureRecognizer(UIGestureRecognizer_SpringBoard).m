@interface UIGestureRecognizer(UIGestureRecognizer_SpringBoard)
- (__CFString)sb_stringForState;
- (id)sb_briefDescription;
@end

@implementation UIGestureRecognizer(UIGestureRecognizer_SpringBoard)

- (id)sb_briefDescription
{
  v2 = [a1 name];
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = NSStringFromClass(v4);
  v6 = (void *)v5;
  if (v2)
  {
    v7 = [a1 name];
    v8 = [v3 stringWithFormat:@"<%@: %p>; name: %@", v6, a1, v7];
  }
  else
  {
    v8 = [v3 stringWithFormat:@"<%@: %p>", v5, a1];
  }

  return v8;
}

- (__CFString)sb_stringForState
{
  unint64_t v2 = [a1 state];
  if (v2 >= 6)
  {
    objc_msgSend(NSString, "stringWithFormat:", @"unknown: %lu", objc_msgSend(a1, "state"));
    v3 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = off_1E6B0B010[v2];
  }
  return v3;
}

@end