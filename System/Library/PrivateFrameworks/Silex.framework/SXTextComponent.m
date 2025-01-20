@interface SXTextComponent
+ (id)typeString;
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (unint64_t)traits;
@end

@implementation SXTextComponent

+ (id)typeString
{
  return @"text";
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"inlineTextStyles"])
  {
    v5 = &__block_literal_global_43;
  }
  else if ([v4 isEqualToString:@"conditional"])
  {
    v5 = &__block_literal_global_9_0;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXTextComponent;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __54__SXTextComponent_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

uint64_t __54__SXTextComponent_valueClassBlockForPropertyWithName___block_invoke_2()
{
  return objc_opt_class();
}

- (unint64_t)traits
{
  return 1;
}

@end