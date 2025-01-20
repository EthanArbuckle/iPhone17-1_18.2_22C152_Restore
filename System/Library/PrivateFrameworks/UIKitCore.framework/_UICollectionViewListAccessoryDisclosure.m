@interface _UICollectionViewListAccessoryDisclosure
- (BOOL)rotated;
- (CGSize)_minimumSizeForHitTesting;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)accessoryTintColor;
- (UIImage)image;
- (UIMenu)menu;
- (UITableConstants)constants;
- (_UICollectionViewListAccessoryDisclosure)initWithConstants:(id)a3 handlesOwnAction:(BOOL)a4;
- (double)_enforcedWidthForWidth:(double)a3;
- (double)rotationAngle;
- (id)actionHandler;
- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4;
- (id)selectedElementDidChangeHandler;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_executeActionHandler;
- (void)_updateRotation;
- (void)forcedSelectionOfMenu:(id)a3 willChangeTo:(id)a4;
- (void)layoutSubviews;
- (void)setAccessoryTintColor:(id)a3;
- (void)setActionHandler:(id)a3;
- (void)setBounds:(CGRect)a3;
- (void)setConstants:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setImage:(id)a3;
- (void)setMenu:(id)a3;
- (void)setRotated:(BOOL)a3;
- (void)setRotationAngle:(double)a3;
- (void)setSelectedElementDidChangeHandler:(id)a3;
@end

@implementation _UICollectionViewListAccessoryDisclosure

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  if (a3.size.width > 0.0)
  {
    [(_UICollectionViewListAccessoryDisclosure *)self _enforcedWidthForWidth:a3.size.width];
    double v9 = v8;
    double v10 = x + (width - v8) * 0.5;
    [(UIView *)self _currentScreenScale];
    double x = UIRectIntegralWithScale(v10, y + (height - height) * 0.5, v9, height, v11);
    double y = v12;
    double width = v13;
    double height = v14;
  }
  v15.receiver = self;
  v15.super_class = (Class)_UICollectionViewListAccessoryDisclosure;
  -[UIView setFrame:](&v15, sel_setFrame_, x, y, width, height);
}

- (double)_enforcedWidthForWidth:(double)a3
{
  [(_UICollectionViewListAccessoryDisclosure *)self _minimumSizeForHitTesting];
  if (result <= a3) {
    return a3;
  }
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  -[UITableConstants defaultDisclosureLayoutWidthForView:](self->_constants, "defaultDisclosureLayoutWidthForView:", self, a3.width);
  double v6 = v5;
  [(_UICollectionViewListAccessoryDisclosure *)self _minimumSizeForHitTesting];
  if (height >= v7) {
    double v8 = v7;
  }
  else {
    double v8 = height;
  }
  if (v6 >= v8) {
    double v9 = v6;
  }
  else {
    double v9 = v8;
  }
  double v10 = v6;
  result.double height = v9;
  result.double width = v10;
  return result;
}

- (CGSize)_minimumSizeForHitTesting
{
  BOOL v2 = [(UIView *)self isUserInteractionEnabled];
  double v3 = 44.0;
  double v4 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  if (v2) {
    double v4 = 44.0;
  }
  else {
    double v3 = *MEMORY[0x1E4F1DB30];
  }
  result.double height = v4;
  result.double width = v3;
  return result;
}

- (void)layoutSubviews
{
  v21.receiver = self;
  v21.super_class = (Class)_UICollectionViewListAccessoryDisclosure;
  [(UIView *)&v21 layoutSubviews];
  double v3 = [(UIImageView *)self->_imageView _currentImage];
  [v3 size];
  double v5 = v4;
  double v7 = v6;

  -[UIImageView setBounds:](self->_imageView, "setBounds:", 0.0, 0.0, v5, v7);
  [(UIView *)self bounds];
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(UIView *)self _currentScreenScale];
  double v17 = UIRectCenteredIntegralRectScale(0.0, 0.0, v5, v7, v9, v11, v13, v15, v16);
  -[UIImageView setCenter:](self->_imageView, "setCenter:", v17 + v18 * 0.5, v20 + v19 * 0.5);
}

- (void)setImage:(id)a3
{
}

- (void)setConstants:(id)a3
{
}

- (_UICollectionViewListAccessoryDisclosure)initWithConstants:(id)a3 handlesOwnAction:(BOOL)a4
{
  id v6 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UICollectionViewListAccessoryDisclosure;
  double v7 = -[UIControl initWithFrame:](&v12, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  double v8 = v7;
  if (v7)
  {
    [(UIView *)v7 setOpaque:0];
    objc_storeStrong((id *)&v8->_constants, a3);
    double v9 = objc_alloc_init(UIImageView);
    imageView = v8->_imageView;
    v8->_imageView = v9;

    [(UIView *)v8 addSubview:v8->_imageView];
  }

  return v8;
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (void)setActionHandler:(id)a3
{
  id actionHandler = self->_actionHandler;
  id v6 = (void *)[a3 copy];
  id v7 = self->_actionHandler;
  self->_id actionHandler = v6;

  if (!a3 || actionHandler)
  {
    if (!a3 && actionHandler)
    {
      [(UIControl *)self removeTarget:self action:sel__executeActionHandler forControlEvents:0x2000];
    }
  }
  else
  {
    [(UIControl *)self addTarget:self action:sel__executeActionHandler forControlEvents:0x2000];
  }
}

- (void)_executeActionHandler
{
  id actionHandler = (void (**)(void))self->_actionHandler;
  if (actionHandler) {
    actionHandler[2]();
  }
}

- (UIImage)image
{
  return [(UIImageView *)self->_imageView image];
}

- (void)setAccessoryTintColor:(id)a3
{
  objc_storeStrong((id *)&self->_accessoryTintColor, a3);
  id v5 = a3;
  [(UIView *)self->_imageView setTintColor:v5];
}

- (void)setRotated:(BOOL)a3
{
  self->_rotated = a3;
  [(_UICollectionViewListAccessoryDisclosure *)self _updateRotation];
}

- (void)setRotationAngle:(double)a3
{
  self->_rotationAngle = a3;
  [(_UICollectionViewListAccessoryDisclosure *)self _updateRotation];
}

- (void)_updateRotation
{
  BOOL v3 = [(UIView *)self _shouldReverseLayoutDirection];
  double rotationAngle = self->_rotationAngle;
  if (v3) {
    double rotationAngle = -rotationAngle;
  }
  if (!self->_rotated) {
    double rotationAngle = 0.0;
  }
  CGAffineTransformMakeRotation(&v7, rotationAngle);
  imageView = self->_imageView;
  CGAffineTransform v6 = v7;
  [(UIView *)imageView setTransform:&v6];
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(_UICollectionViewListAccessoryDisclosure *)self _enforcedWidthForWidth:a3.size.width];
  v8.receiver = self;
  v8.super_class = (Class)_UICollectionViewListAccessoryDisclosure;
  -[UIView setBounds:](&v8, sel_setBounds_, x, y, v7, height);
}

- (void)setMenu:(id)a3
{
  double v4 = (UIMenu *)a3;
  menu = self->_menu;
  if (menu != v4)
  {
    double v10 = v4;
    CGAffineTransform v6 = v4;
    double v7 = self->_menu;
    self->_menu = v6;
    objc_super v8 = menu;

    double v9 = [(UIControl *)self contextMenuInteraction];
    _UIControlMenuUpdateVisibleMenu(v9, v8, v6);

    [(UIMenu *)v6 setForcedAutomaticSelectionDelegate:self];
    [(UIMenu *)v6 setForceAutomaticSelection:1];

    [(UIControl *)self setContextMenuInteractionEnabled:v6 != 0];
    double v4 = v10;
  }
}

- (id)contextMenuInteraction:(id)a3 configurationForMenuAtLocation:(CGPoint)a4
{
  double v4 = self->_menu;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __98___UICollectionViewListAccessoryDisclosure_contextMenuInteraction_configurationForMenuAtLocation___block_invoke;
  v8[3] = &unk_1E52DD380;
  double v9 = v4;
  id v5 = v4;
  CGAffineTransform v6 = +[UIContextMenuConfiguration configurationWithIdentifier:0 previewProvider:0 actionProvider:v8];

  return v6;
}

- (void)forcedSelectionOfMenu:(id)a3 willChangeTo:(id)a4
{
  selectedElementDidChangeHandler = (void (**)(id, id))self->_selectedElementDidChangeHandler;
  if (selectedElementDidChangeHandler)
  {
    id v5 = (id)[a3 copy];
    selectedElementDidChangeHandler[2](selectedElementDidChangeHandler, v5);
  }
}

- (id)viewForFirstBaselineLayout
{
  return self->_imageView;
}

- (id)viewForLastBaselineLayout
{
  return self->_imageView;
}

- (UITableConstants)constants
{
  return self->_constants;
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (id)actionHandler
{
  return self->_actionHandler;
}

- (BOOL)rotated
{
  return self->_rotated;
}

- (double)rotationAngle
{
  return self->_rotationAngle;
}

- (UIMenu)menu
{
  return self->_menu;
}

- (id)selectedElementDidChangeHandler
{
  return self->_selectedElementDidChangeHandler;
}

- (void)setSelectedElementDidChangeHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_selectedElementDidChangeHandler, 0);
  objc_storeStrong((id *)&self->_menu, 0);
  objc_storeStrong(&self->_actionHandler, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong((id *)&self->_constants, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
}

@end