@interface TTRIContentUnavailableButtonProperties
+ (Class)implClass;
- (UIAction)primaryAction;
- (id)asUIKit;
- (void)setPrimaryAction:(id)a3;
@end

@implementation TTRIContentUnavailableButtonProperties

+ (Class)implClass
{
  return (Class)objc_opt_class();
}

- (id)asUIKit
{
  return self->super._impl;
}

- (UIAction)primaryAction
{
  v2 = [(TTRIContentUnavailableButtonProperties *)self asUIKit];
  v3 = [v2 primaryAction];

  return (UIAction *)v3;
}

- (void)setPrimaryAction:(id)a3
{
  id v4 = a3;
  id v5 = [(TTRIContentUnavailableButtonProperties *)self asUIKit];
  [v5 setPrimaryAction:v4];
}

@end