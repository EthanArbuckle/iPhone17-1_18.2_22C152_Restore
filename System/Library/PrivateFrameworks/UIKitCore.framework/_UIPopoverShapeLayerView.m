@interface _UIPopoverShapeLayerView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation _UIPopoverShapeLayerView

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([@"path" isEqualToString:v4])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIPopoverShapeLayerView;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

@end