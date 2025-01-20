@interface UIToolbarTextButton
- (CGSize)sizeThatFits:(CGSize)a3;
- (UIEdgeInsets)alignmentRectInsets;
- (UIToolbarTextButton)initWithTitle:(id)a3 pressedTitle:(id)a4 withFont:(id)a5 withBarStyle:(int64_t)a6 withStyle:(int64_t)a7 withTitleWidth:(double)a8 possibleTitles:(id)a9 withToolbarTintColor:(id)a10;
- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4;
- (void)_setPressed:(BOOL)a3;
- (void)dealloc;
- (void)layoutSubviews;
@end

@implementation UIToolbarTextButton

- (UIToolbarTextButton)initWithTitle:(id)a3 pressedTitle:(id)a4 withFont:(id)a5 withBarStyle:(int64_t)a6 withStyle:(int64_t)a7 withTitleWidth:(double)a8 possibleTitles:(id)a9 withToolbarTintColor:(id)a10
{
  BOOL v18 = a7 == 2;
  self->super._toolbarTintColor = (UIColor *)a10;
  self->super._barStyle = a6;
  self->super._style = a7;
  v19 = [(UINavigationButton *)[_UIToolbarNavigationButton alloc] initWithTitle:a3 possibleTitles:a9 style:(2 * v18)];
  v20 = v19;
  if (a5) {
    [(UILabel *)[(UIButton *)v19 titleLabel] setFont:a5];
  }
  [(UIView *)self frame];
  double v22 = v21;
  double v24 = v23;
  -[UINavigationButton sizeThatFits:](v20, "sizeThatFits:", v25, v26);
  -[UINavigationButton _setFrame:deferLayout:](v20, "_setFrame:deferLayout:", 1, v22, v24, v27, v28);
  if (a8 == 0.0)
  {
    if (a9)
    {
      uint64_t v29 = [a9 count];
      if (!a4 && !v29) {
        goto LABEL_10;
      }
    }
    else if (!a4)
    {
      goto LABEL_10;
    }
    [(UIToolbarButton *)self _sizeView:v20 toPossibleTitles:a9 pressedTitle:a4];
  }
LABEL_10:
  [(UIView *)v20 frame];
  v33.receiver = self;
  v33.super_class = (Class)UIToolbarTextButton;
  v30 = -[UIControl initWithFrame:](&v33, sel_initWithFrame_);
  v31 = v30;
  if (v30)
  {
    [(UIView *)v30 setOpaque:0];
    v31->super._info = v20;
    v31->_title = (NSString *)[a3 copy];
    v31->_pressedTitle = (NSString *)[a4 copy];
    v31->_possibleTitles = (NSSet *)[a9 copy];
    [(UIView *)v31 addSubview:v31->super._info];
    [(UIToolbarButton *)v31 _adjustPushButtonForMiniBar:0 isChangingBarHeight:0];
    [(UIView *)v31 setNeedsLayout];
  }
  else
  {
  }
  return v31;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v13[1] = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    info = self->super._info;
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v7 = [(UIButton *)info titleLabel];
      v8 = [(UILabel *)v7 text];
      uint64_t v12 = *(void *)off_1E52D2040;
      v13[0] = [(UILabel *)v7 font];
      -[NSString boundingRectWithSize:options:attributes:context:](v8, "boundingRectWithSize:options:attributes:context:", 0, [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:&v12 count:1], 0, width, height);
      double width = v9;
    }
  }
  double v10 = width;
  double v11 = height;
  result.double height = v11;
  result.double width = v10;
  return result;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)UIToolbarTextButton;
  [(UIToolbarButton *)&v3 dealloc];
}

- (void)_setPressed:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(UIToolbarButton *)self _infoIsButton])
  {
    v6.receiver = self;
    v6.super_class = (Class)UIToolbarTextButton;
    [(UIToolbarButton *)&v6 _setPressed:v3];
  }
  else
  {
    pressedTitle = self->_pressedTitle;
    if (pressedTitle)
    {
      if (!v3) {
        pressedTitle = self->_title;
      }
      [(_UIToolbarNavigationButton *)self->super._info setText:pressedTitle];
      [(UIView *)self->super._info sizeToFit];
      [(UIView *)self setNeedsLayout];
    }
  }
}

- (void)layoutSubviews
{
  v28.receiver = self;
  v28.super_class = (Class)UIToolbarTextButton;
  [(UIToolbarButton *)&v28 layoutSubviews];
  if (![(UIToolbarButton *)self _isBorderedOtherThanAccessibility])
  {
    if ([(UIView *)self superview])
    {
      [(UIView *)self superview];
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        BOOL v3 = [(UIView *)self superview];
        if (v3)
        {
          v4 = v3;
          if (([(UIView *)v3 centerTextButtons] & 1) == 0)
          {
            info = self->super._info;
            [(UIButton *)info setNeedsLayout];
            [(UIView *)info layoutIfNeeded];
            id v6 = [(UIButton *)info _titleView];
            if (v6)
            {
              v7 = v6;
              [v6 _baselineOffsetFromBottom];
              double v9 = v8;
              [v7 frame];
              -[UIView convertRect:toView:](info, "convertRect:toView:", v4);
              CGFloat v11 = v10;
              CGFloat v13 = v12;
              CGFloat v15 = v14;
              CGFloat v17 = v16;
              [(UIView *)v4 bounds];
              double MaxY = CGRectGetMaxY(v29);
              v30.origin.x = v11;
              v30.origin.y = v13;
              v30.size.double width = v15;
              v30.size.double height = v17;
              double v19 = MaxY - (CGRectGetMaxY(v30) - v9);
              if ([(UIView *)v4 isMinibar]) {
                double v20 = 11.0;
              }
              else {
                double v20 = 16.0;
              }
              if (v20 != v19)
              {
                [(UIView *)info frame];
                double v22 = v21;
                double v24 = v23;
                double v26 = v25;
                UIRoundToViewScale(self);
                -[UIButton setFrame:](info, "setFrame:", v22, v27, v24, v26);
              }
            }
          }
        }
      }
    }
  }
}

- (UIEdgeInsets)alignmentRectInsets
{
  [(UIButton *)self->super._info alignmentRectInsets];
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)_UIAppearance_setTitleTextAttributes:(id)a3 forState:(unint64_t)a4
{
  id appearanceStorage = self->super._appearanceStorage;
  if (a3)
  {
    if (!appearanceStorage) {
      self->super._id appearanceStorage = objc_alloc_init(_UIBarButtonItemAppearanceStorage);
    }
  }
  else if (!appearanceStorage)
  {
    return;
  }
  uint64_t v8 = objc_msgSend(a3, "_ui_attributesForDictionaryContainingUIStringDrawingKeys");
  uint64_t v9 = [self->super._appearanceStorage textAttributesForState:a4];
  if (v8 | v9)
  {
    double v10 = (void *)v9;
    if (([(id)v8 isEqualToDictionary:v9] & 1) == 0)
    {
      [self->super._appearanceStorage setTextAttributes:v8 forState:a4];
      [(UIToolbarButton *)self _adjustToolbarButtonInfo];
      uint64_t v11 = *(void *)off_1E52D2040;
      uint64_t v12 = [(id)v8 objectForKey:*(void *)off_1E52D2040];
      uint64_t v13 = [v10 objectForKey:v11];
      if (v12 | v13)
      {
        if (([(id)v12 isEqual:v13] & 1) == 0)
        {
          [(UIView *)self->super._info sizeToFit];
          if (*(_OWORD *)&self->_pressedTitle != 0) {
            -[UIToolbarButton _sizeView:toPossibleTitles:pressedTitle:](self, "_sizeView:toPossibleTitles:pressedTitle:", self->super._info);
          }
          [(UIView *)self->super._info frame];
          double v15 = v14;
          double v17 = v16;
          double v19 = v18;
          double v21 = v20;
          BOOL v22 = [(UIToolbarButton *)self _isBordered];
          double v23 = v19 + 20.0;
          if (v22)
          {
            double v24 = 30.0;
          }
          else
          {
            double v23 = v19;
            double v24 = v21;
          }
          double maximumWidth = self->super._maximumWidth;
          double v26 = fmax(self->super._minimumWidth, v23);
          double v27 = fmin(maximumWidth, v26);
          if (maximumWidth <= 0.0) {
            double v28 = v26;
          }
          else {
            double v28 = v27;
          }
          -[UIButton setFrame:](self->super._info, "setFrame:", v15, v17, v28, v24);
          CGRect v29 = [(UIView *)self superview];
          [(UIView *)v29 setNeedsLayout];
        }
      }
    }
  }
}

@end