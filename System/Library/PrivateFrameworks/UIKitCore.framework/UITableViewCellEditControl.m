@interface UITableViewCellEditControl
- (BOOL)isRotated;
- (BOOL)isRotating;
- (BOOL)wantsImageShadow;
- (BOOL)wantsMaskingWhileAnimatingDisabled;
- (CGSize)defaultSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIColor)accessoryBackgroundColor;
- (UIColor)accessoryTintColor;
- (UITableViewCellEditControl)initWithTableViewCell:(id)a3 editingStyle:(int64_t)a4;
- (id)_currentImage;
- (id)_deleteImage;
- (id)_imageView;
- (id)_insertImage;
- (id)_multiSelectNotSelectedImage;
- (id)_multiSelectSelectedImage;
- (id)_renderedImage;
- (id)_shadowImage;
- (id)viewForFirstBaselineLayout;
- (id)viewForLastBaselineLayout;
- (unint64_t)_controlEventsForActionTriggered;
- (void)_createImageViewIfNecessary;
- (void)_dynamicUserInterfaceTraitDidChange;
- (void)_toggleRotate;
- (void)_toggleRotateAnimationDidStop;
- (void)_updateImageView;
- (void)adjustLayoutForFocalRect:(CGRect)a3;
- (void)layoutSubviews;
- (void)setAccessoryBackgroundColor:(id)a3;
- (void)setAccessoryTintColor:(id)a3;
- (void)setHighlighted:(BOOL)a3;
- (void)setRotated:(BOOL)a3;
- (void)setRotated:(BOOL)a3 animated:(BOOL)a4;
- (void)setSelected:(BOOL)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation UITableViewCellEditControl

- (void)_toggleRotate
{
  [(UITableViewCellEditControl *)self setRotated:(*((unsigned char *)self + 496) & 4) == 0 animated:1];
}

- (id)_deleteImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  v3 = [WeakRetained _constants];
  v4 = [v3 defaultDeleteImageForCell:WeakRetained];

  return v4;
}

- (id)_insertImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  v3 = [WeakRetained _constants];
  v4 = [v3 defaultInsertImageForCell:WeakRetained];

  return v4;
}

- (id)_multiSelectNotSelectedImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  v3 = [WeakRetained _constants];
  uint64_t v4 = [WeakRetained _cellStyle];
  v5 = [WeakRetained traitCollection];
  v6 = [WeakRetained _tableView];
  v7 = [v6 _accessoryBaseColor];
  v8 = [v3 defaultMultiSelectNotSelectedImageForCellStyle:v4 traitCollection:v5 accessoryBaseColor:v7];

  return v8;
}

- (id)_multiSelectSelectedImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  uint64_t v4 = [WeakRetained _tableView];
  v5 = [v4 _multiselectCheckmarkColor];
  v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [(UITableViewCellEditControl *)self accessoryTintColor];
  }
  v8 = v7;

  v9 = [WeakRetained _constants];
  uint64_t v10 = [WeakRetained _cellStyle];
  v11 = [WeakRetained traitCollection];
  v12 = [(UITableViewCellEditControl *)self accessoryBackgroundColor];
  v13 = [v9 defaultMultiSelectSelectedImageForCellStyle:v10 traitCollection:v11 checkmarkColor:v8 backgroundColor:v12];

  return v13;
}

- (void)_updateImageView
{
  id v3 = [(UITableViewCellEditControl *)self _currentImage];
  [(UIImageView *)self->_imageView setImage:v3];
}

- (id)_currentImage
{
  int v3 = *((unsigned char *)self + 496) & 3;
  switch(v3)
  {
    case 3:
      if ([(UIControl *)self isHighlighted] || [(UIControl *)self isSelected])
      {
        uint64_t v4 = [(UITableViewCellEditControl *)self _multiSelectSelectedImage];
      }
      else
      {
        uint64_t v4 = [(UITableViewCellEditControl *)self _multiSelectNotSelectedImage];
      }
      break;
    case 2:
      uint64_t v4 = [(UITableViewCellEditControl *)self _insertImage];
      break;
    case 1:
      uint64_t v4 = [(UITableViewCellEditControl *)self _deleteImage];
      break;
    default:
      uint64_t v4 = 0;
      break;
  }
  return v4;
}

- (id)_renderedImage
{
  return [(UIImageView *)self->_imageView _currentImage];
}

- (CGSize)defaultSize
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  int v3 = [WeakRetained _constants];
  uint64_t v4 = [WeakRetained _tableView];
  [v3 defaultEditControlSizeForCell:WeakRetained inTableView:v4];
  double v6 = v5;
  double v8 = v7;

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  int v5 = [WeakRetained _usesModernAccessoriesLayout];

  if (v5)
  {
    [(UITableViewCellEditControl *)self _createImageViewIfNecessary];
    double v6 = [(UIImageView *)self->_imageView _currentImage];
    [v6 size];
    double v8 = v7;
    double v10 = v9;

    double v11 = v8;
    double v12 = v10;
  }
  else
  {
    [(UITableViewCellEditControl *)self defaultSize];
  }
  result.height = v12;
  result.width = v11;
  return result;
}

- (UITableViewCellEditControl)initWithTableViewCell:(id)a3 editingStyle:(int64_t)a4
{
  id v6 = a3;
  [(UITableViewCellEditControl *)self defaultSize];
  v13.receiver = self;
  v13.super_class = (Class)UITableViewCellEditControl;
  double v9 = -[UIControl initWithFrame:](&v13, sel_initWithFrame_, 0.0, 0.0, v7, v8);
  double v10 = v9;
  if (v9)
  {
    [(UIView *)v9 setAlpha:1.0];
    [(UIView *)v10 setOpaque:0];
    [(UIControl *)v10 setRequiresDisplayOnTracking:1];
    objc_storeWeak((id *)&v10->_cell, v6);
    *((unsigned char *)v10 + 496) = *((unsigned char *)v10 + 496) & 0xFC | a4 & 3;
    if (v10->_imageView)
    {
      double v11 = [(UITableViewCellEditControl *)v10 _currentImage];
      [(UIImageView *)v10->_imageView setImage:v11];
    }
    if (!a4 || a4 == 3)
    {
      [(UIView *)v10 setUserInteractionEnabled:0];
    }
    else if (a4 == 1)
    {
      [(UIControl *)v10 addTarget:v10 action:sel__toggleRotate forControlEvents:64];
    }
    v10->_focalY = NAN;
    v10->_focalHeight = NAN;
  }

  return v10;
}

- (void)adjustLayoutForFocalRect:(CGRect)a3
{
  double height = a3.size.height;
  double y = a3.origin.y;
  IsEmptdouble y = CGRectIsEmpty(a3);
  double v7 = NAN;
  if (IsEmpty) {
    double v8 = NAN;
  }
  else {
    double v8 = y;
  }
  self->_focalY = v8;
  if (!IsEmpty) {
    double v7 = height;
  }
  self->_focalHeight = v7;
  [(UIView *)self setNeedsLayout];
}

- (unint64_t)_controlEventsForActionTriggered
{
  return 64;
}

- (id)_shadowImage
{
  int v3 = (void *)_shadowImage_shadowImage;
  if (!_shadowImage_shadowImage)
  {
    [(UIView *)self _currentScreenScale];
    _UIGraphicsBeginImageContextWithOptions(0, 0, 23.5, 23.5, v4);
    int v5 = +[UIColor colorWithWhite:0.0 alpha:0.05];
    [v5 set];

    ContextStack = GetContextStack(0);
    if (*(int *)ContextStack < 1) {
      double v7 = 0;
    }
    else {
      double v7 = (CGContext *)ContextStack[3 * (*(_DWORD *)ContextStack - 1) + 1];
    }
    v12.origin.x = 0.0;
    v12.origin.double y = 0.0;
    v12.size.width = 23.5;
    v12.size.double height = 23.5;
    CGContextFillEllipseInRect(v7, v12);
    uint64_t v8 = _UIGraphicsGetImageFromCurrentImageContext(0);
    double v9 = (void *)_shadowImage_shadowImage;
    _shadowImage_shadowImage = v8;

    UIGraphicsEndImageContext();
    int v3 = (void *)_shadowImage_shadowImage;
  }
  return v3;
}

- (void)layoutSubviews
{
  [(UIView *)self bounds];
  double v5 = v4 + v3 * 0.5;
  imageView = self->_imageView;
  [(UITableViewCellEditControl *)self _createImageViewIfNecessary];
  double v7 = [(UIImageView *)self->_imageView _currentImage];
  [v7 size];
  double v9 = v8;
  double v11 = v10;

  BOOL v12 = [(UIView *)self _shouldReverseLayoutDirection];
  id WeakRetained = objc_loadWeakRetained((id *)&self->_cell);
  int v14 = [WeakRetained _usesModernAccessoriesLayout];

  double v15 = 3.0;
  if (v14) {
    double v15 = 0.0;
  }
  double v16 = -0.0;
  if (!v14) {
    double v16 = -3.0;
  }
  if (v12) {
    double v15 = v16;
  }
  double v17 = floor(v5 - v9 * 0.5);
  double v18 = floor((self->_focalHeight - v11) * 0.5);
  double v19 = self->_focalY + v18;
  double v20 = v19;
  double v21 = v17 + v15;
  if (imageView)
  {
    -[UIImageView setFrame:](self->_imageView, "setFrame:", v17 + v15, self->_focalY + v18, v9, v11);
  }
  else
  {
    v28[0] = MEMORY[0x1E4F143A8];
    v28[1] = 3221225472;
    v28[2] = __44__UITableViewCellEditControl_layoutSubviews__block_invoke;
    v28[3] = &unk_1E52DA520;
    v28[4] = self;
    *(double *)&v28[5] = v17 + v15;
    *(double *)&v28[6] = v19;
    *(double *)&v28[7] = v9;
    *(double *)&v28[8] = v11;
    +[UIView performWithoutAnimation:v28];
  }
  BOOL v22 = [(UITableViewCellEditControl *)self wantsImageShadow];
  shadowView = self->_shadowView;
  if (v22)
  {
    if (!shadowView)
    {
      v24 = [UIImageView alloc];
      v25 = [(UITableViewCellEditControl *)self _shadowImage];
      v26 = [(UIImageView *)v24 initWithImage:v25];
      v27 = self->_shadowView;
      self->_shadowView = v26;

      [(UIView *)self insertSubview:self->_shadowView below:self->_imageView];
      shadowView = self->_shadowView;
    }
    -[UIImageView setFrame:](shadowView, "setFrame:", v21, v20 + 2.0, v9, v11);
  }
  else
  {
    [(UIView *)shadowView removeFromSuperview];
  }
}

uint64_t __44__UITableViewCellEditControl_layoutSubviews__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(void *)(a1 + 32) + 464), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (void)setHighlighted:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellEditControl;
  [(UIControl *)&v4 setHighlighted:a3];
  [(UITableViewCellEditControl *)self _updateImageView];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)UITableViewCellEditControl;
  [(UIControl *)&v4 setSelected:a3];
  [(UITableViewCellEditControl *)self _updateImageView];
}

- (void)setRotated:(BOOL)a3
{
}

- (void)setRotated:(BOOL)a3 animated:(BOOL)a4
{
  if (((((*((unsigned char *)self + 496) & 4) == 0) ^ a3) & 1) == 0)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __50__UITableViewCellEditControl_setRotated_animated___block_invoke_2;
    v6[3] = &unk_1E52DF220;
    v6[4] = self;
    BOOL v7 = a3;
    BOOL v8 = a4;
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __50__UITableViewCellEditControl_setRotated_animated___block_invoke_3;
    v4[3] = &unk_1E52E0478;
    BOOL v5 = a4;
    v4[4] = self;
    +[UIView conditionallyAnimate:a4 withAnimation:&__block_literal_global_521 layout:v6 completion:v4];
  }
}

uint64_t __50__UITableViewCellEditControl_setRotated_animated___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return +[UIView animateWithDuration:4 delay:a2 options:a3 animations:0.2 completion:0.0];
}

unsigned char *__50__UITableViewCellEditControl_setRotated_animated___block_invoke_2(uint64_t a1)
{
  *(unsigned char *)(*(void *)(a1 + 32) + 496) = *(unsigned char *)(*(void *)(a1 + 32) + 496) & 0xFB | (4 * *(unsigned char *)(a1 + 40));
  *(unsigned char *)(*(void *)(a1 + 32) + 496) = *(unsigned char *)(*(void *)(a1 + 32) + 496) & 0xF7 | (8 * *(unsigned char *)(a1 + 41));
  CGSize result = *(unsigned char **)(a1 + 32);
  if ((result[496] & 4) != 0 || (result[496] & 8) != 0) {
    return (unsigned char *)[result _updateImageView];
  }
  return result;
}

uint64_t __50__UITableViewCellEditControl_setRotated_animated___block_invoke_3(uint64_t result)
{
  if (*(unsigned char *)(result + 40)) {
    return [*(id *)(result + 32) _toggleRotateAnimationDidStop];
  }
  return result;
}

- (BOOL)isRotated
{
  return (*((unsigned __int8 *)self + 496) >> 2) & 1;
}

- (BOOL)isRotating
{
  return (*((unsigned __int8 *)self + 496) >> 3) & 1;
}

- (void)_toggleRotateAnimationDidStop
{
  *((unsigned char *)self + 496) &= ~8u;
  if ((*((unsigned char *)self + 496) & 4) == 0) {
    [(UITableViewCellEditControl *)self _updateImageView];
  }
}

- (BOOL)wantsMaskingWhileAnimatingDisabled
{
  return 0;
}

- (BOOL)wantsImageShadow
{
  return 0;
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)UITableViewCellEditControl;
  [(UIView *)&v3 _dynamicUserInterfaceTraitDidChange];
  [(UITableViewCellEditControl *)self _updateImageView];
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)UITableViewCellEditControl;
  [(UIView *)&v10 traitCollectionDidChange:a3];
  objc_super v4 = [(UIView *)self traitCollection];
  BOOL v5 = _UITableConstantsForTraitCollection(v4);
  id v6 = [(UIView *)self traitCollection];
  unsigned int v7 = (*((unsigned char *)self + 496) & 3) - 1;
  if (v7 >= 3) {
    uint64_t v8 = 4;
  }
  else {
    uint64_t v8 = v7;
  }
  double v9 = [v5 defaultListCellAccessoryImageSymbolConfigurationForTraitCollection:v6 accessoryType:v8];
  [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v9];

  [(UIView *)self setNeedsLayout];
}

- (id)viewForFirstBaselineLayout
{
  [(UITableViewCellEditControl *)self _createImageViewIfNecessary];
  imageView = self->_imageView;
  return imageView;
}

- (id)viewForLastBaselineLayout
{
  [(UITableViewCellEditControl *)self _createImageViewIfNecessary];
  imageView = self->_imageView;
  return imageView;
}

- (void)_createImageViewIfNecessary
{
  if (self->_imageView) {
    return;
  }
  objc_super v3 = [UIImageView alloc];
  objc_super v4 = [(UITableViewCellEditControl *)self _currentImage];
  BOOL v5 = [(UIImageView *)v3 initWithImage:v4];
  imageView = self->_imageView;
  self->_imageView = v5;

  unsigned int v7 = [(UIView *)self traitCollection];
  uint64_t v8 = _UITableConstantsForTraitCollection(v7);
  double v9 = [(UIView *)self traitCollection];
  unsigned int v10 = (*((unsigned char *)self + 496) & 3) - 1;
  if (v10 >= 3) {
    uint64_t v11 = 4;
  }
  else {
    uint64_t v11 = v10;
  }
  BOOL v12 = [v8 defaultListCellAccessoryImageSymbolConfigurationForTraitCollection:v9 accessoryType:v11];
  [(UIImageView *)self->_imageView setPreferredSymbolConfiguration:v12];

  int v13 = *((unsigned char *)self + 496) & 3;
  if (v13 == 1)
  {
    double v14 = 0.823529412;
    double v15 = 0.0;
    double v16 = 0.0;
    goto LABEL_9;
  }
  if (v13 == 2)
  {
    double v14 = 0.00392156863;
    double v15 = 0.678431373;
    double v16 = 0.196078431;
LABEL_9:
    double v17 = +[UIColor colorWithRed:v14 green:v15 blue:v16 alpha:1.0];
    [(UIView *)self _setInteractionTintColor:v17];
  }
  double v18 = self->_imageView;
  [(UIView *)self addSubview:v18];
}

- (UIColor)accessoryTintColor
{
  return self->_accessoryTintColor;
}

- (void)setAccessoryTintColor:(id)a3
{
}

- (UIColor)accessoryBackgroundColor
{
  return self->_accessoryBackgroundColor;
}

- (void)setAccessoryBackgroundColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_accessoryBackgroundColor, 0);
  objc_storeStrong((id *)&self->_accessoryTintColor, 0);
  objc_storeStrong((id *)&self->_shadowView, 0);
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_destroyWeak((id *)&self->_cell);
}

- (id)_imageView
{
  return self->_imageView;
}

@end