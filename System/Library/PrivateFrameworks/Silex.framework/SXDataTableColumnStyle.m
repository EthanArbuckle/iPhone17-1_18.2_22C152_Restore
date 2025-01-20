@interface SXDataTableColumnStyle
+ (id)valueClassBlockForPropertyWithName:(id)a3;
@end

@implementation SXDataTableColumnStyle

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"conditional"])
  {
    v5 = &__block_literal_global_60;
  }
  else if ([v4 isEqualToString:@"selectors"])
  {
    v5 = &__block_literal_global_6_1;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXDataTableColumnStyle;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __61__SXDataTableColumnStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

uint64_t __61__SXDataTableColumnStyle_valueClassBlockForPropertyWithName___block_invoke_2()
{
  return objc_opt_class();
}

@end