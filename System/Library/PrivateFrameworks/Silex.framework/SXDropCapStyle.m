@interface SXDropCapStyle
+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4;
@end

@implementation SXDropCapStyle

+ (Class)classForProtocolProperty:(id)a3 withValue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:@"fontAttributes"])
  {
    uint64_t v8 = objc_opt_class();
  }
  else
  {
    v11.receiver = a1;
    v11.super_class = (Class)&OBJC_METACLASS___SXDropCapStyle;
    uint64_t v8 = objc_msgSendSuper2(&v11, sel_classForProtocolProperty_withValue_, v6, v7);
  }
  v9 = (void *)v8;

  return (Class)v9;
}

@end