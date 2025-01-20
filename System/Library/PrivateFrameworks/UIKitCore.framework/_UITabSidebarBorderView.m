@interface _UITabSidebarBorderView
- (_UITabSidebarBorderView)initWithFrame:(CGRect)a3;
- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5;
- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4;
@end

@implementation _UITabSidebarBorderView

- (_UITabSidebarBorderView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)_UITabSidebarBorderView;
  v3 = -[UIView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[UIView _setTouchInsets:](v3, "_setTouchInsets:", 0.0, -2.0, 0.0, -2.0);
    v5 = +[UIColor separatorColor];
    [(UIView *)v4 setBackgroundColor:v5];

    v6 = [[UIPointerInteraction alloc] initWithDelegate:v4];
    [(UIView *)v4 addInteraction:v6];
  }
  return v4;
}

- (id)pointerInteraction:(id)a3 regionForRequest:(id)a4 defaultRegion:(id)a5
{
  id v5 = a3;
  v6 = [v5 view];
  [v6 bounds];
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  double v14 = v13;
  v15 = [v5 view];

  [v15 _touchInsets];
  double v17 = v8 + v16;
  double v19 = v10 + v18;
  double v21 = v12 - (v16 + v20);
  double v23 = v14 - (v18 + v22);

  v24 = +[UIPointerRegion regionWithRect:@"SidebarResizeRegion", v17, v19, v21, v23 identifier];
  [v24 setLatchingAxes:1];
  return v24;
}

- (id)pointerInteraction:(id)a3 styleForRegion:(id)a4
{
  v9[2] = *MEMORY[0x1E4F143B8];
  v4 = +[UIPointerAccessory arrowAccessoryWithPosition:](UIPointerAccessory, "arrowAccessoryWithPosition:", a3, a4, 14.0, 4.71238898);
  v9[0] = v4;
  id v5 = +[UIPointerAccessory arrowAccessoryWithPosition:](UIPointerAccessory, "arrowAccessoryWithPosition:", 14.0, 1.57079633);
  v9[1] = v5;
  v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];

  double v7 = +[UIPointerStyle systemPointerStyle];
  [v7 setAccessories:v6];

  return v7;
}

@end