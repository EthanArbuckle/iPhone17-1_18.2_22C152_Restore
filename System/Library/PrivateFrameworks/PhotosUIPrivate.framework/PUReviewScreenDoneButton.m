@interface PUReviewScreenDoneButton
+ (id)doneButton;
- (BOOL)_needsUpdate;
- (CGSize)intrinsicContentSize;
- (UIEdgeInsets)tappableEdgeInsets;
- (unint64_t)preferredStyle;
- (void)_updateIfNeeded;
- (void)layoutSubviews;
- (void)setPreferredStyle:(unint64_t)a3;
- (void)setTappableEdgeInsets:(UIEdgeInsets)a3;
- (void)set_needsUpdate:(BOOL)a3;
@end

@implementation PUReviewScreenDoneButton

+ (id)doneButton
{
  v5.receiver = a1;
  v5.super_class = (Class)&OBJC_METACLASS___PUReviewScreenDoneButton;
  v2 = objc_msgSendSuper2(&v5, sel_buttonWithType_, 1);
  v3 = [MEMORY[0x1E4FB1618] systemYellowColor];
  [v2 setTintColor:v3];

  objc_msgSend(v2, "set_needsUpdate:", 1);
  return v2;
}

- (void)set_needsUpdate:(BOOL)a3
{
  self->__needsUpdate = a3;
}

- (BOOL)_needsUpdate
{
  return self->__needsUpdate;
}

- (UIEdgeInsets)tappableEdgeInsets
{
  double top = self->_tappableEdgeInsets.top;
  double left = self->_tappableEdgeInsets.left;
  double bottom = self->_tappableEdgeInsets.bottom;
  double right = self->_tappableEdgeInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (unint64_t)preferredStyle
{
  return self->_preferredStyle;
}

- (void)_updateIfNeeded
{
  if (![(PUReviewScreenDoneButton *)self _needsUpdate]) {
    return;
  }
  unint64_t v3 = [(PUReviewScreenDoneButton *)self preferredStyle];
  if (v3)
  {
    if (v3 != 1)
    {
      objc_super v5 = &stru_1F06BE7B8;
      goto LABEL_9;
    }
    v4 = @"PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_DONE_OR_ICON";
  }
  else
  {
    v4 = @"PUPHOTOBROWSER_BUTTON_ASSET_EXPLORER_REVIEW_SCREEN_DONE_OR_ICON_iPad";
  }
  PULocalizedString(v4);
  objc_super v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_9:
  v11 = v5;
  if ([(__CFString *)v5 length])
  {
    v6 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:17.0];
    v7 = [(PUReviewScreenDoneButton *)self titleLabel];
    [v7 setFont:v6];

    [(PUReviewScreenDoneButton *)self setImage:0 forState:0];
    v8 = self;
    v9 = v11;
  }
  else
  {
    v10 = objc_msgSend(MEMORY[0x1E4FB1818], "pu_PhotosUIImageNamed:", @"PUReviewScreenDoneButton");
    [(PUReviewScreenDoneButton *)self setImage:v10 forState:0];

    v9 = &stru_1F06BE7B8;
    v8 = self;
  }
  [(PUReviewScreenDoneButton *)v8 setTitle:v9 forState:0];
  [(PUReviewScreenDoneButton *)self set_needsUpdate:0];
}

- (void)setPreferredStyle:(unint64_t)a3
{
  if (self->_preferredStyle != a3)
  {
    self->_preferredStyle = a3;
    [(PUReviewScreenDoneButton *)self set_needsUpdate:1];
  }
}

- (void)setTappableEdgeInsets:(UIEdgeInsets)a3
{
  if (a3.left != self->_tappableEdgeInsets.left
    || a3.top != self->_tappableEdgeInsets.top
    || a3.right != self->_tappableEdgeInsets.right
    || a3.bottom != self->_tappableEdgeInsets.bottom)
  {
    self->_tappableEdgeInsets = a3;
    -[PUReviewScreenDoneButton setContentEdgeInsets:](self, "setContentEdgeInsets:");
    [(PUReviewScreenDoneButton *)self setNeedsLayout];
  }
}

- (CGSize)intrinsicContentSize
{
  [(PUReviewScreenDoneButton *)self _updateIfNeeded];
  v5.receiver = self;
  v5.super_class = (Class)PUReviewScreenDoneButton;
  [(PUReviewScreenDoneButton *)&v5 intrinsicContentSize];
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  [(PUReviewScreenDoneButton *)self _updateIfNeeded];
  v3.receiver = self;
  v3.super_class = (Class)PUReviewScreenDoneButton;
  [(PUReviewScreenDoneButton *)&v3 layoutSubviews];
}

@end