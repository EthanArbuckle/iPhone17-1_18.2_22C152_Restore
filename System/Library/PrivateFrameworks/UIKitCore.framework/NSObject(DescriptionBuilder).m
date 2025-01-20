@interface NSObject(DescriptionBuilder)
- (UIDescriptionBuilder)_ui_descriptionBuilder;
@end

@implementation NSObject(DescriptionBuilder)

- (UIDescriptionBuilder)_ui_descriptionBuilder
{
  return +[UIDescriptionBuilder descriptionBuilderWithObject:a1];
}

@end