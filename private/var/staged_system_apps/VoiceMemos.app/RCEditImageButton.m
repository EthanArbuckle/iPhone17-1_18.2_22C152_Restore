@interface RCEditImageButton
+ (id)_customButtonConfigurationUpdateHandler;
+ (id)buttonWithType:(int64_t)a3;
@end

@implementation RCEditImageButton

+ (id)buttonWithType:(int64_t)a3
{
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___RCEditImageButton;
  v4 = [super buttonWithType:a3];
  v5 = [a1 _customButtonConfigurationUpdateHandler];
  [v4 setConfigurationUpdateHandler:v5];

  [v4 setShowsLargeContentViewer:1];

  return v4;
}

+ (id)_customButtonConfigurationUpdateHandler
{
  return &stru_1002224C0;
}

@end