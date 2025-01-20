@interface _UIPanelControllerMeshAnimatingTransitionView
- (BOOL)_shouldAnimatePropertyWithKey:(id)a3;
- (_UIPanelControllerMeshAnimatingTransitionView)initWithView:(id)a3;
@end

@implementation _UIPanelControllerMeshAnimatingTransitionView

- (_UIPanelControllerMeshAnimatingTransitionView)initWithView:(id)a3
{
  id v4 = a3;
  [v4 frame];
  v8.receiver = self;
  v8.super_class = (Class)_UIPanelControllerMeshAnimatingTransitionView;
  v5 = -[UIView initWithFrame:](&v8, sel_initWithFrame_);
  v6 = v5;
  if (v5)
  {
    [(UIView *)v5 setAutoresizesSubviews:1];
    [(UIView *)v6 setTranslatesAutoresizingMaskIntoConstraints:0];
    [(UIView *)v6 setClipsToBounds:1];
    [v4 setAutoresizingMask:18];
    [(UIView *)v6 bounds];
    objc_msgSend(v4, "setFrame:");
    [(UIView *)v6 addSubview:v4];
  }

  return v6;
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"meshTransform"])
  {
    BOOL v5 = 1;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)_UIPanelControllerMeshAnimatingTransitionView;
    BOOL v5 = [(UIView *)&v7 _shouldAnimatePropertyWithKey:v4];
  }

  return v5;
}

@end