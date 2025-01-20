@interface PUImportOneUpCellBadgeView
- (BOOL)inUpdateBlock;
- (BOOL)needsBadgeUpdate;
- (BOOL)selectable;
- (CGSize)intrinsicContentSize;
- (PUImportOneUpCellBadgeView)initWithFrame:(CGRect)a3;
- (UIActivityIndicatorView)spinner;
- (UIView)badgeContainerView;
- (UIView)badgeView;
- (int64_t)badgeType;
- (void)_createSpinnerIfNecessary;
- (void)layoutSubviews;
- (void)performBadgeUpdates:(id)a3;
- (void)prepareForReuse;
- (void)setBadgeContainerView:(id)a3;
- (void)setBadgeType:(int64_t)a3;
- (void)setBadgeView:(id)a3;
- (void)setInUpdateBlock:(BOOL)a3;
- (void)setNeedsBadgeUpdate;
- (void)setNeedsBadgeUpdate:(BOOL)a3;
- (void)setSelectable:(BOOL)a3;
- (void)setSpinner:(id)a3;
- (void)updateBadgeUIIfNeeded;
@end

@implementation PUImportOneUpCellBadgeView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_spinner, 0);
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_badgeContainerView, 0);
}

- (void)setNeedsBadgeUpdate:(BOOL)a3
{
  self->_needsBadgeUpdate = a3;
}

- (BOOL)needsBadgeUpdate
{
  return self->_needsBadgeUpdate;
}

- (void)setInUpdateBlock:(BOOL)a3
{
  self->_inUpdateBlock = a3;
}

- (BOOL)inUpdateBlock
{
  return self->_inUpdateBlock;
}

- (void)setSpinner:(id)a3
{
}

- (UIActivityIndicatorView)spinner
{
  return self->_spinner;
}

- (void)setBadgeView:(id)a3
{
}

- (UIView)badgeView
{
  return self->_badgeView;
}

- (void)setBadgeContainerView:(id)a3
{
}

- (UIView)badgeContainerView
{
  return self->_badgeContainerView;
}

- (BOOL)selectable
{
  return self->_selectable;
}

- (int64_t)badgeType
{
  return self->_badgeType;
}

- (void)_createSpinnerIfNecessary
{
  if (!self->_spinner)
  {
    v3 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x1E4FB1400]) initWithActivityIndicatorStyle:100];
    spinner = self->_spinner;
    self->_spinner = v3;

    v5 = [MEMORY[0x1E4FB1618] whiteColor];
    [(UIActivityIndicatorView *)self->_spinner setColor:v5];

    v6 = self->_spinner;
    badgeContainerView = self->_badgeContainerView;
    [(PUImportOneUpCellBadgeView *)self insertSubview:v6 aboveSubview:badgeContainerView];
  }
}

- (void)performBadgeUpdates:(id)a3
{
  if (a3)
  {
    self->_inUpdateBlock = 1;
    (*((void (**)(id, SEL))a3 + 2))(a3, a2);
    self->_inUpdateBlock = 0;
    [(PUImportOneUpCellBadgeView *)self updateBadgeUIIfNeeded];
  }
}

- (void)updateBadgeUIIfNeeded
{
  if ([(PUImportOneUpCellBadgeView *)self needsBadgeUpdate])
  {
    [(PUImportOneUpCellBadgeView *)self setNeedsBadgeUpdate:0];
    int64_t v3 = [(PUImportOneUpCellBadgeView *)self badgeType];
    v4 = [(PUImportOneUpCellBadgeView *)self badgeView];
    [v4 removeFromSuperview];

    [(PUImportOneUpCellBadgeView *)self setBadgeView:0];
    [(PUImportOneUpCellBadgeView *)self badgeType];
    [(PUImportOneUpCellBadgeView *)self selectable];
    PXImportBadgeViewForTypeAndSelectable();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v5 = [(PUImportOneUpCellBadgeView *)self badgeContainerView];
      [v5 addSubview:v6];

      [(PUImportOneUpCellBadgeView *)self setBadgeView:v6];
    }
    if (v3 == 2)
    {
      [(PUImportOneUpCellBadgeView *)self _createSpinnerIfNecessary];
      [(UIActivityIndicatorView *)self->_spinner startAnimating];
    }
    else
    {
      [(UIActivityIndicatorView *)self->_spinner stopAnimating];
    }
    [(PUImportOneUpCellBadgeView *)self setNeedsLayout];
  }
}

- (void)setNeedsBadgeUpdate
{
}

- (void)setSelectable:(BOOL)a3
{
  if (!self->_inUpdateBlock) {
    _PFAssertContinueHandler();
  }
  self->_selectable = a3;
  [(PUImportOneUpCellBadgeView *)self setNeedsBadgeUpdate];
}

- (void)setBadgeType:(int64_t)a3
{
  if (!self->_inUpdateBlock) {
    _PFAssertContinueHandler();
  }
  self->_badgeType = a3;
  [(PUImportOneUpCellBadgeView *)self setNeedsBadgeUpdate];
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PUImportOneUpCellBadgeView;
  [(PUImportOneUpCellBadgeView *)&v4 prepareForReuse];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __45__PUImportOneUpCellBadgeView_prepareForReuse__block_invoke;
  v3[3] = &unk_1E5F2ED10;
  v3[4] = self;
  [(PUImportOneUpCellBadgeView *)self performBadgeUpdates:v3];
}

uint64_t __45__PUImportOneUpCellBadgeView_prepareForReuse__block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) setBadgeType:0];
  v2 = *(void **)(a1 + 32);
  return [v2 setSelectable:1];
}

- (void)layoutSubviews
{
  v23.receiver = self;
  v23.super_class = (Class)PUImportOneUpCellBadgeView;
  [(PUImportOneUpCellBadgeView *)&v23 layoutSubviews];
  [(UIActivityIndicatorView *)self->_spinner sizeToFit];
  [(PUImportOneUpCellBadgeView *)self bounds];
  CGFloat x = v24.origin.x;
  CGFloat y = v24.origin.y;
  CGFloat width = v24.size.width;
  CGFloat height = v24.size.height;
  double MidX = CGRectGetMidX(v24);
  v25.origin.CGFloat x = x;
  v25.origin.CGFloat y = y;
  v25.size.CGFloat width = width;
  v25.size.CGFloat height = height;
  double MidY = CGRectGetMidY(v25);
  v9 = [(PUImportOneUpCellBadgeView *)self badgeView];

  if (v9)
  {
    v10 = [(PUImportOneUpCellBadgeView *)self badgeContainerView];
    [v10 bounds];
    double v12 = v11;
    double v14 = v13;

    v15 = [(PUImportOneUpCellBadgeView *)self badgeView];
    [v15 bounds];
    double v17 = v16;
    double v19 = v18;

    v20 = [(PUImportOneUpCellBadgeView *)self badgeContainerView];
    objc_msgSend(v20, "setFrame:", v12, v14, v17, v19);
  }
  v21 = [(PUImportOneUpCellBadgeView *)self badgeContainerView];
  objc_msgSend(v21, "setCenter:", MidX, MidY);

  v22 = [(PUImportOneUpCellBadgeView *)self spinner];
  objc_msgSend(v22, "setCenter:", MidX, MidY);
}

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)&PUImportOneUpCellBadgeSize_0;
  double v3 = *(double *)&PUImportOneUpCellBadgeSize_1;
  result.CGFloat height = v3;
  result.CGFloat width = v2;
  return result;
}

- (PUImportOneUpCellBadgeView)initWithFrame:(CGRect)a3
{
  v7.receiver = self;
  v7.super_class = (Class)PUImportOneUpCellBadgeView;
  double v3 = -[PUImportOneUpCellBadgeView initWithFrame:](&v7, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    if (initWithFrame__onceToken_32775 != -1) {
      dispatch_once(&initWithFrame__onceToken_32775, &__block_literal_global_32776);
    }
    objc_super v4 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    badgeContainerView = v3->_badgeContainerView;
    v3->_badgeContainerView = v4;

    [(PUImportOneUpCellBadgeView *)v3 addSubview:v3->_badgeContainerView];
  }
  return v3;
}

void __44__PUImportOneUpCellBadgeView_initWithFrame___block_invoke()
{
  PXImportBadgeViewForTypeAndSelectable();
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 frame];
  PUImportOneUpCellBadgeSize_0 = v0;
  PUImportOneUpCellBadgeSize_1 = v1;
}

@end