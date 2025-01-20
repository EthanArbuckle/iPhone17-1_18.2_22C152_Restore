@interface SXDataTableRowStyle
+ (id)valueClassBlockForPropertyWithName:(id)a3;
@end

@implementation SXDataTableRowStyle

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"conditional"])
  {
    v5 = &__block_literal_global_12;
  }
  else if ([v4 isEqualToString:@"selectors"])
  {
    v5 = &__block_literal_global_6;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXDataTableRowStyle;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __58__SXDataTableRowStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

uint64_t __58__SXDataTableRowStyle_valueClassBlockForPropertyWithName___block_invoke_2()
{
  return objc_opt_class();
}

@end