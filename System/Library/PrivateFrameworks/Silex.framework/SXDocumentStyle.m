@interface SXDocumentStyle
+ (id)valueClassBlockForPropertyWithName:(id)a3;
@end

@implementation SXDocumentStyle

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"conditional"])
  {
    v5 = &__block_literal_global_11;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXDocumentStyle;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __54__SXDocumentStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

@end