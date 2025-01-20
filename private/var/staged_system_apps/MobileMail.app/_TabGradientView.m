@interface _TabGradientView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_TabGradientView)initWithFrame:(CGRect)a3;
@end

@implementation _TabGradientView

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (_TabGradientView)initWithFrame:(CGRect)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_TabGradientView;
  v3 = -[_TabGradientView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3) {
    [(_TabGradientView *)v3 setUserInteractionEnabled:0];
  }
  return v4;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if (([v4 isEqualToString:@"startPoint"] & 1) != 0
    || ([v4 isEqualToString:@"endPoint"] & 1) != 0)
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_TabGradientView;
    BOOL v5 = [(_TabGradientView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

@end