@interface SXGalleryComponent
+ (id)typeString;
+ (id)valueClassBlockForPropertyWithName:(id)a3;
- (unint64_t)traits;
@end

@implementation SXGalleryComponent

+ (id)typeString
{
  return @"gallery";
}

+ (id)valueClassBlockForPropertyWithName:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"items"])
  {
    v5 = &__block_literal_global_74;
  }
  else
  {
    v7.receiver = a1;
    v7.super_class = (Class)&OBJC_METACLASS___SXGalleryComponent;
    v5 = objc_msgSendSuper2(&v7, sel_valueClassBlockForPropertyWithName_, v4);
  }

  return v5;
}

uint64_t __57__SXGalleryComponent_valueClassBlockForPropertyWithName___block_invoke()
{
  return objc_opt_class();
}

- (unint64_t)traits
{
  return 8;
}

@end