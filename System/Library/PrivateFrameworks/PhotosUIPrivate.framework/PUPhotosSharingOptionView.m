@interface PUPhotosSharingOptionView
- (BOOL)isInteractive;
- (BOOL)isToggled;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PUPhotosSharingOptionView)initWithFrame:(CGRect)a3;
- (void)assetBadgeView:(id)a3 userDidSelectBadges:(unint64_t)a4;
- (void)layoutSubviews;
- (void)setInteractive:(BOOL)a3;
- (void)setTarget:(id)a3 action:(SEL)a4;
- (void)setToggled:(BOOL)a3;
@end

@implementation PUPhotosSharingOptionView

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_toggleGlyphButton, 0);
}

- (BOOL)isToggled
{
  return self->_toggled;
}

- (BOOL)isInteractive
{
  return self->_interactive;
}

- (void)assetBadgeView:(id)a3 userDidSelectBadges:(unint64_t)a4
{
  id v5 = a3;
  p_action = &self->_action;
  if (self->_action)
  {
    id v10 = v5;
    v7 = [MEMORY[0x1E4FB1438] sharedApplication];
    if (*p_action) {
      SEL v8 = *p_action;
    }
    else {
      SEL v8 = 0;
    }
    id WeakRetained = objc_loadWeakRetained(&self->_target);
    [v7 sendAction:v8 to:WeakRetained from:self forEvent:0];

    id v5 = v10;
  }
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)PUPhotosSharingOptionView;
  [(PUPhotosSharingOptionView *)&v7 layoutSubviews];
  if ([(PUPhotosSharingOptionView *)self isInteractive]) {
    [(PUPhotosSharingOptionView *)self isToggled];
  }
  toggleGlyphButton = self->_toggleGlyphButton;
  PXAssetBadgeInfoCreateWithBadges();
  [(PXUIAssetBadgeView *)toggleGlyphButton setBadgeInfo:&v6];
  -[PXUIAssetBadgeView sizeThatFits:](self->_toggleGlyphButton, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  -[PXUIAssetBadgeView setFrame:](self->_toggleGlyphButton, "setFrame:", 0.0, 0.0, v4, v5);
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y = a3.y;
  CGFloat x = a3.x;
  [(PUPhotosSharingOptionView *)self bounds];
  CGRect v11 = CGRectInset(v10, -8.0, -8.0);
  CGFloat v6 = x;
  CGFloat v7 = y;
  return CGRectContainsPoint(v11, *(CGPoint *)&v6);
}

- (void)setTarget:(id)a3 action:(SEL)a4
{
  objc_storeWeak(&self->_target, a3);
  if (a4) {
    CGFloat v6 = a4;
  }
  else {
    CGFloat v6 = 0;
  }
  self->_action = v6;
}

- (void)setToggled:(BOOL)a3
{
  if (self->_toggled != a3)
  {
    self->_toggled = a3;
    [(PUPhotosSharingOptionView *)self setNeedsLayout];
  }
}

- (void)setInteractive:(BOOL)a3
{
  if (self->_interactive != a3)
  {
    self->_interactive = a3;
    [(PUPhotosSharingOptionView *)self setNeedsLayout];
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[PXUIAssetBadgeView sizeThatFits:](self->_toggleGlyphButton, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.height = v4;
  result.width = v3;
  return result;
}

- (PUPhotosSharingOptionView)initWithFrame:(CGRect)a3
{
  v8.receiver = self;
  v8.super_class = (Class)PUPhotosSharingOptionView;
  double v3 = -[PUPhotosSharingOptionView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F90840]);
    uint64_t v5 = objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    toggleGlyphButton = v3->_toggleGlyphButton;
    v3->_toggleGlyphButton = (PXUIAssetBadgeView *)v5;

    [(PXUIAssetBadgeView *)v3->_toggleGlyphButton setDelegate:v3];
    [(PXUIAssetBadgeView *)v3->_toggleGlyphButton setStyle:4];
    [(PXUIAssetBadgeView *)v3->_toggleGlyphButton setOverContent:1];
    [(PUPhotosSharingOptionView *)v3 addSubview:v3->_toggleGlyphButton];
  }
  return v3;
}

@end