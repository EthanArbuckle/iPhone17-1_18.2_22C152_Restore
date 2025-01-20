@interface PKPayLaterIconCell
- (BOOL)appearInactive;
- (BOOL)hasCircleBorder;
- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (double)minimumHeight;
- (void)_applyInactiveAppearance;
- (void)_setupImageView;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setAppearInactive:(BOOL)a3;
- (void)setHasCircleBorder:(BOOL)a3;
- (void)setIcon:(id)a3 animated:(BOOL)a4;
- (void)setIconDate:(id)a3 animated:(BOOL)a4;
- (void)setMinimumHeight:(double)a3;
- (void)setView:(id)a3;
@end

@implementation PKPayLaterIconCell

- (void)setIcon:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  v7 = (UIImage *)a3;
  p_icon = &self->_icon;
  if (self->_icon == v7) {
    goto LABEL_17;
  }
  objc_storeStrong((id *)&self->_icon, a3);
  if (!*p_icon)
  {
    v16 = [(UIView *)self->_imageView superview];

    if (v16)
    {
      [(UIView *)self->_imageView removeFromSuperview];
      imageView = self->_imageView;
      self->_imageView = 0;

      [(PKPayLaterIconCell *)self setNeedsLayout];
    }
    goto LABEL_15;
  }
  if (self->_imageView)
  {
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    v10 = self->_imageView;
    if (isKindOfClass)
    {
      v11 = v10;
      v12 = v11;
      if (v4)
      {
        v13 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_icon];
        v14 = self->_imageView;
        self->_imageView = v13;

        [(PKPayLaterIconCell *)self _setupImageView];
        [(UIView *)self->_imageView setAlpha:0.0];
        v15 = (void *)MEMORY[0x1E4FB1EB0];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __39__PKPayLaterIconCell_setIcon_animated___block_invoke;
        v28[3] = &unk_1E59CA870;
        v28[4] = self;
        v29 = v12;
        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = __39__PKPayLaterIconCell_setIcon_animated___block_invoke_2;
        v26[3] = &unk_1E59CB6D8;
        v27 = v29;
        objc_msgSend(v15, "pkui_animateUsingOptions:animations:completion:", 4, v28, v26);
      }
      else
      {
        v20 = [(UIView *)v11 image];
        [(UIView *)v12 setImage:*p_icon];
        v21 = [(UIView *)v12 image];

        if (v21 == v20)
        {
          [(UIView *)self->_imageView removeFromSuperview];
          v22 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_icon];
          v23 = self->_imageView;
          self->_imageView = v22;

          [(PKPayLaterIconCell *)self _setupImageView];
        }
      }
      goto LABEL_15;
    }
  }
  else
  {
    v10 = 0;
  }
  [(UIView *)v10 removeFromSuperview];
  v18 = (UIView *)[objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:*p_icon];
  v19 = self->_imageView;
  self->_imageView = v18;

  [(PKPayLaterIconCell *)self _setupImageView];
LABEL_15:
  v24 = [(UIView *)self->_imageView superview];

  if (!v24)
  {
    v25 = [(PKPayLaterIconCell *)self contentView];
    [v25 addSubview:self->_imageView];

    [(PKPayLaterIconCell *)self setNeedsLayout];
  }
LABEL_17:
}

uint64_t __39__PKPayLaterIconCell_setIcon_animated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 744) setAlpha:1.0];
  v2 = *(void **)(a1 + 40);

  return [v2 setAlpha:0.0];
}

uint64_t __39__PKPayLaterIconCell_setIcon_animated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) removeFromSuperview];
}

- (void)setIconDate:(id)a3 animated:(BOOL)a4
{
  imageView = self->_imageView;
  id v6 = a3;
  [(UIView *)imageView removeFromSuperview];
  v7 = [[PKCalendarIconView alloc] initWithDate:v6 isDisabled:0];

  v8 = self->_imageView;
  self->_imageView = &v7->super;

  [(PKPayLaterIconCell *)self _setupImageView];
  v9 = [(PKPayLaterIconCell *)self contentView];
  [v9 addSubview:self->_imageView];

  [(PKPayLaterIconCell *)self setNeedsLayout];
}

- (void)setView:(id)a3
{
  v5 = (UIView *)a3;
  p_view = &self->_view;
  view = self->_view;
  if (view != v5)
  {
    v11 = v5;
    v8 = view;
    v9 = v8;
    if (v8) {
      [(UIView *)v8 removeFromSuperview];
    }
    objc_storeStrong((id *)&self->_view, a3);
    if (*p_view)
    {
      v10 = [(PKPayLaterIconCell *)self contentView];
      [v10 addSubview:*p_view];
    }
    [(PKPayLaterIconCell *)self _applyInactiveAppearance];
    [(PKPayLaterIconCell *)self setNeedsLayout];

    v5 = v11;
  }
}

- (void)setHasCircleBorder:(BOOL)a3
{
  if (self->_hasCircleBorder != a3)
  {
    self->_hasCircleBorder = a3;
    [(PKPayLaterIconCell *)self setNeedsLayout];
  }
}

- (void)setAppearInactive:(BOOL)a3
{
  if (self->_appearInactive != a3)
  {
    self->_appearInactive = a3;
    [(PKPayLaterIconCell *)self _applyInactiveAppearance];
  }
}

- (void)prepareForReuse
{
  v6.receiver = self;
  v6.super_class = (Class)PKPayLaterIconCell;
  [(PKDashboardCollectionViewCell *)&v6 prepareForReuse];
  [(UIView *)self->_view removeFromSuperview];
  view = self->_view;
  self->_view = 0;

  [(UIView *)self->_imageView removeFromSuperview];
  imageView = self->_imageView;
  self->_imageView = 0;

  icon = self->_icon;
  self->_icon = 0;

  self->_appearInactive = 0;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)PKPayLaterIconCell;
  [(PKDashboardCollectionViewCell *)&v4 layoutSubviews];
  v3 = [(PKPayLaterIconCell *)self contentView];
  [v3 bounds];
  -[PKPayLaterIconCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 0);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[PKPayLaterIconCell _layoutWithBounds:isTemplateLayout:](self, "_layoutWithBounds:isTemplateLayout:", 1, *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), a3.width, a3.height);
  double v6 = v5;
  [(PKPayLaterIconCell *)self minimumHeight];
  double v8 = fmax(v6, v7);
  double v9 = width;
  result.height = v8;
  result.CGFloat width = v9;
  return result;
}

- (CGSize)_layoutWithBounds:(CGRect)a3 isTemplateLayout:(BOOL)a4
{
  double width = a3.size.width;
  double v7 = a3.origin.x + 13.0;
  double v8 = a3.origin.y + 8.0;
  double v9 = a3.size.height + -16.0;
  memset(&slice, 0, sizeof(slice));
  if ([(PKPayLaterIconCell *)self _shouldReverseLayoutDirection]) {
    CGRectEdge v10 = CGRectMaxXEdge;
  }
  else {
    CGRectEdge v10 = CGRectMinXEdge;
  }
  remainder.origin.CGFloat x = v7;
  remainder.origin.y = v8;
  remainder.size.double width = width + -27.0;
  remainder.size.CGFloat height = v9;
  double v11 = PKPayLaterUICellIconSize();
  double v13 = v12;
  v39.origin.CGFloat x = v7;
  v39.origin.y = v8;
  v39.size.double width = width + -27.0;
  v39.size.CGFloat height = v9;
  CGRectDivide(v39, &slice, &remainder, v11, v10);
  PKContentAlignmentMake();
  PKSizeAlignedInRect();
  double v15 = v14;
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  CGRectDivide(remainder, &slice, &remainder, 12.0, v10);
  double v22 = v11 * 0.5;
  if (!self->_hasCircleBorder) {
    double v22 = 8.0;
  }
  [(UIView *)self->_imageView _setContinuousCornerRadius:v22];
  -[UIView sizeThatFits:](self->_view, "sizeThatFits:", remainder.size.width, 3.40282347e38);
  CGFloat v24 = v23;
  CGSize v25 = *(CGSize *)(MEMORY[0x1E4F1DB28] + 16);
  v35.origin = (CGPoint)*MEMORY[0x1E4F1DB28];
  v35.size = v25;
  CGFloat x = remainder.origin.x;
  v25.double width = remainder.origin.y;
  CGFloat v27 = remainder.size.width;
  CGFloat height = remainder.size.height;
  CGRectDivide(*(CGRect *)((char *)&v25 - 8), &v35, &slice, v24, CGRectMinYEdge);
  PKSizeAlignedInRect();
  v35.origin.CGFloat x = v29;
  v35.origin.y = v30;
  v35.size.double width = v31;
  v35.size.CGFloat height = v32;
  if (!a4)
  {
    -[UIView setFrame:](self->_view, "setFrame:", *(_OWORD *)&v35.origin, *(_OWORD *)&v35.size);
    -[UIView setFrame:](self->_imageView, "setFrame:", v15, v17, v19, v21);
  }
  double v33 = fmax(v24, v13) + 16.0;
  double v34 = width;
  result.CGFloat height = v33;
  result.double width = v34;
  return result;
}

- (void)_setupImageView
{
  [(UIView *)self->_imageView setContentMode:1];
  [(UIView *)self->_imageView setClipsToBounds:1];
  v3 = [(UIView *)self->_imageView layer];
  id v4 = [MEMORY[0x1E4FB1618] separatorColor];
  objc_msgSend(v3, "setBorderColor:", objc_msgSend(v4, "CGColor"));

  double v5 = [(UIView *)self->_imageView layer];
  [v5 setBorderWidth:PKUIPixelLength()];

  [(PKPayLaterIconCell *)self _applyInactiveAppearance];
}

- (void)_applyInactiveAppearance
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __46__PKPayLaterIconCell__applyInactiveAppearance__block_invoke;
  aBlock[3] = &unk_1E59CC1D0;
  aBlock[4] = self;
  v3 = (void (**)(void *, UIView *))_Block_copy(aBlock);
  v3[2](v3, self->_view);
  v3[2](v3, self->_imageView);
}

void __46__PKPayLaterIconCell__applyInactiveAppearance__block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  v3 = [v5 layer];
  [v3 setAllowsGroupOpacity:*(unsigned __int8 *)(*(void *)(a1 + 32) + 753)];

  double v4 = 0.5;
  if (!*(unsigned char *)(*(void *)(a1 + 32) + 753)) {
    double v4 = 1.0;
  }
  [v5 setAlpha:v4];
}

- (double)minimumHeight
{
  return self->_minimumHeight;
}

- (void)setMinimumHeight:(double)a3
{
  self->_minimumHeight = a3;
}

- (BOOL)hasCircleBorder
{
  return self->_hasCircleBorder;
}

- (BOOL)appearInactive
{
  return self->_appearInactive;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_icon, 0);

  objc_storeStrong((id *)&self->_view, 0);
}

@end