@interface SXConditionalDocumentStyle
+ (id)valueClassBlockForPropertyWithName:(id)a3;
@end

@implementation SXConditionalDocumentStyle

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"conditions"])
  {
    v5 = &__block_literal_global_63;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXConditionalDocumentStyle;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __65__SXConditionalDocumentStyle_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

@end