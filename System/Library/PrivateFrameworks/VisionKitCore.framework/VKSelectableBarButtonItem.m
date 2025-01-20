@interface VKSelectableBarButtonItem
+ (id)keyPathsForValuesAffectingAlpha;
- (BOOL)showsMenuAsPrimaryAction;
- (VKSelectableBarButtonContainerView)toggleView;
- (VKSelectableBarButtonItem)init;
- (double)alpha;
- (double)compactPadding;
- (double)padding;
- (double)width;
- (id)image;
- (id)menu;
- (void)setAction:(SEL)a3;
- (void)setAlpha:(double)a3;
- (void)setCompactPadding:(double)a3;
- (void)setCornerRadiusRatio:(double)a3;
- (void)setEnabled:(BOOL)a3;
- (void)setImage:(id)a3;
- (void)setMenu:(id)a3;
- (void)setPadding:(double)a3;
- (void)setSelected:(BOOL)a3;
- (void)setShowsMenuAsPrimaryAction:(BOOL)a3;
- (void)setTarget:(id)a3;
- (void)setToggleView:(id)a3;
- (void)setWidth:(double)a3;
@end

@implementation VKSelectableBarButtonItem

- (VKSelectableBarButtonItem)init
{
  v6.receiver = self;
  v6.super_class = (Class)VKSelectableBarButtonItem;
  v2 = [(UIBarItem *)&v6 init];
  if (v2)
  {
    v3 = objc_alloc_init(VKSelectableBarButtonContainerView);
    toggleView = v2->_toggleView;
    v2->_toggleView = v3;

    [(VKSelectableBarButtonItem *)v2 setCustomView:v2->_toggleView];
  }
  return v2;
}

- (void)setTarget:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VKSelectableBarButtonItem;
  [(VKSelectableBarButtonItem *)&v7 setTarget:a3];
  v4 = [(VKSelectableBarButtonItem *)self toggleView];
  v5 = [v4 button];

  [v5 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
  objc_super v6 = [(VKSelectableBarButtonItem *)self target];
  objc_msgSend(v5, "addTarget:action:forControlEvents:", v6, -[VKSelectableBarButtonItem action](self, "action"), 64);
}

- (id)menu
{
  v2 = [(VKSelectableBarButtonItem *)self toggleView];
  v3 = [v2 button];
  v4 = [v3 menu];

  return v4;
}

- (void)setMenu:(id)a3
{
  id v4 = a3;
  id v6 = [(VKSelectableBarButtonItem *)self toggleView];
  v5 = [v6 button];
  [v5 setMenu:v4];
}

- (BOOL)showsMenuAsPrimaryAction
{
  v2 = [(VKSelectableBarButtonItem *)self toggleView];
  v3 = [v2 button];
  char v4 = [v3 showsMenuAsPrimaryAction];

  return v4;
}

- (void)setShowsMenuAsPrimaryAction:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(VKSelectableBarButtonItem *)self toggleView];
  char v4 = [v5 button];
  [v4 setShowsMenuAsPrimaryAction:v3];
}

- (void)setImage:(id)a3
{
  id v4 = a3;
  id v5 = [(VKSelectableBarButtonItem *)self toggleView];
  [v5 setImage:v4];
}

- (id)image
{
  v2 = [(VKSelectableBarButtonItem *)self toggleView];
  BOOL v3 = [v2 image];

  return v3;
}

- (void)setAction:(SEL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)VKSelectableBarButtonItem;
  [(VKSelectableBarButtonItem *)&v7 setAction:a3];
  id v4 = [(VKSelectableBarButtonItem *)self toggleView];
  id v5 = [v4 button];

  [v5 removeTarget:0 action:0 forControlEvents:0xFFFFFFFFLL];
  id v6 = [(VKSelectableBarButtonItem *)self target];
  objc_msgSend(v5, "addTarget:action:forControlEvents:", v6, -[VKSelectableBarButtonItem action](self, "action"), 64);
}

- (void)setSelected:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)VKSelectableBarButtonItem;
  [(VKSelectableBarButtonItem *)&v5 setSelected:a3];
  id v4 = [(VKSelectableBarButtonItem *)self toggleView];
  objc_msgSend(v4, "setSelected:", -[VKSelectableBarButtonItem isSelected](self, "isSelected"));
}

- (void)setEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)VKSelectableBarButtonItem;
  -[VKSelectableBarButtonItem setEnabled:](&v7, sel_setEnabled_);
  objc_super v5 = [(VKSelectableBarButtonItem *)self toggleView];
  id v6 = [v5 button];
  [v6 setEnabled:v3];
}

- (double)padding
{
  v2 = [(VKSelectableBarButtonItem *)self toggleView];
  [v2 padding];
  double v4 = v3;

  return v4;
}

- (void)setPadding:(double)a3
{
  id v4 = [(VKSelectableBarButtonItem *)self toggleView];
  [v4 setPadding:a3];
}

- (double)compactPadding
{
  v2 = [(VKSelectableBarButtonItem *)self toggleView];
  [v2 compactPadding];
  double v4 = v3;

  return v4;
}

- (void)setCompactPadding:(double)a3
{
  id v4 = [(VKSelectableBarButtonItem *)self toggleView];
  [v4 setCompactPadding:a3];
}

- (void)setCornerRadiusRatio:(double)a3
{
  id v4 = [(VKSelectableBarButtonItem *)self toggleView];
  [v4 setCornerRadiusRatio:a3];
}

- (void)setWidth:(double)a3
{
  id v4 = [(VKSelectableBarButtonItem *)self toggleView];
  [v4 setWidth:a3];
}

- (double)width
{
  v2 = [(VKSelectableBarButtonItem *)self toggleView];
  [v2 width];
  double v4 = v3;

  return v4;
}

+ (id)keyPathsForValuesAffectingAlpha
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:@"toggleView.alpha"];
}

- (void)setAlpha:(double)a3
{
  id v4 = [(VKSelectableBarButtonItem *)self toggleView];
  [v4 setAlpha:a3];
}

- (double)alpha
{
  v2 = [(VKSelectableBarButtonItem *)self toggleView];
  [v2 alpha];
  double v4 = v3;

  return v4;
}

- (VKSelectableBarButtonContainerView)toggleView
{
  return self->_toggleView;
}

- (void)setToggleView:(id)a3
{
}

- (void).cxx_destruct
{
}

@end