@interface SXConditionalTextStyle
+ (id)valueClassBlockForPropertyWithName:(id)a3;
@end

@implementation SXConditionalTextStyle

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"conditions"])
  {
    v5 = &__block_literal_global_82;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXConditionalTextStyle;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __61__SXConditionalTextStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

@end