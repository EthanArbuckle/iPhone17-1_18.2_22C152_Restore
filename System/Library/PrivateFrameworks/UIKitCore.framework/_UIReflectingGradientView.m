@interface _UIReflectingGradientView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation _UIReflectingGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)_UIReflectingGradientView;
  if ([(UIView *)&v7 _shouldAnimatePropertyWithKey:v4]
    || ([v4 isEqualToString:@"startPoint"] & 1) != 0)
  {
    char v5 = 1;
  }
  else
  {
    char v5 = [v4 isEqualToString:@"colors"];
  }

  return v5;
}

@end