@interface SBWidgetIconResizeBackdropView
+ (Class)layerClass;
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
@end

@implementation SBWidgetIconResizeBackdropView

+ (Class)layerClass
{
  return (Class)self;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"filters.gaussianBlur.inputRadius"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBWidgetIconResizeBackdropView;
    BOOL v5 = [(SBWidgetIconResizeBackdropView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

@end