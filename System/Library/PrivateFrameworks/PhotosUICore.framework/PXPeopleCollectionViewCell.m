@interface PXPeopleCollectionViewCell
- (BOOL)isFavorite;
- (BOOL)ppt_fullImageLoaded;
- (CGPoint)_computeCircumferenceMultipliersForAngle:(double)a3;
- (NSString)name;
- (NSUUID)uuid;
- (PXPeopleBadgeView)badgeView;
- (PXPeopleCollectionViewCell)initWithFrame:(CGRect)a3;
- (PXPeopleCollectionViewCellDelegate)peopleCellDelegate;
- (UIImage)image;
- (UIImageView)avatarView;
- (UILabel)nameLabel;
- (UIView)highlightOverlayView;
- (double)textAlpha;
- (id)focusEffect;
- (unint64_t)selectionStyle;
- (void)_updateBadgeViewState;
- (void)_updateFocusRingForced:(BOOL)a3;
- (void)_updateSelection;
- (void)_updateTitleAndFavoriteBadgeForLayoutChange;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)setFavorite:(BOOL)a3;
- (void)setHighlightOverlayView:(id)a3;
- (void)setImage:(id)a3;
- (void)setImage:(id)a3 normalizedFaceRect:(CGRect)a4;
- (void)setName:(id)a3;
- (void)setNameLabel:(id)a3;
- (void)setPeopleCellDelegate:(id)a3;
- (void)setPpt_fullImageLoaded:(BOOL)a3;
- (void)setSelected:(BOOL)a3;
- (void)setSelectionStyle:(unint64_t)a3;
- (void)setTextAlpha:(double)a3;
- (void)toggleFavorite:(id)a3;
@end

@implementation PXPeopleCollectionViewCell

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_badgeView, 0);
  objc_storeStrong((id *)&self->_highlightOverlayView, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);
  objc_destroyWeak((id *)&self->_peopleCellDelegate);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_avatarView, 0);
  objc_storeStrong((id *)&self->_uuid, 0);
}

- (PXPeopleBadgeView)badgeView
{
  return self->_badgeView;
}

- (void)setHighlightOverlayView:(id)a3
{
}

- (UIView)highlightOverlayView
{
  return self->_highlightOverlayView;
}

- (void)setNameLabel:(id)a3
{
}

- (UILabel)nameLabel
{
  return self->_nameLabel;
}

- (void)setPpt_fullImageLoaded:(BOOL)a3
{
  self->_ppt_fullImageLoaded = a3;
}

- (BOOL)ppt_fullImageLoaded
{
  return self->_ppt_fullImageLoaded;
}

- (void)setPeopleCellDelegate:(id)a3
{
}

- (PXPeopleCollectionViewCellDelegate)peopleCellDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_peopleCellDelegate);
  return (PXPeopleCollectionViewCellDelegate *)WeakRetained;
}

- (unint64_t)selectionStyle
{
  return self->_selectionStyle;
}

- (BOOL)isFavorite
{
  return self->_favorite;
}

- (double)textAlpha
{
  return self->_textAlpha;
}

- (NSString)name
{
  return self->_name;
}

- (UIImageView)avatarView
{
  return self->_avatarView;
}

- (void)_updateFocusRingForced:(BOOL)a3
{
  if (a3 || [(PXPeopleCollectionViewCell *)self isFocused])
  {
    v4[0] = MEMORY[0x1E4F143A8];
    v4[1] = 3221225472;
    v4[2] = __53__PXPeopleCollectionViewCell__updateFocusRingForced___block_invoke;
    v4[3] = &unk_1E5DC02D0;
    v4[4] = self;
    +[PXFocusRing updateView:self infoProviderBlock:v4];
  }
}

id __53__PXPeopleCollectionViewCell__updateFocusRingForced___block_invoke(uint64_t a1)
{
  v1 = [*(id *)(a1 + 32) avatarView];
  v2 = [v1 layer];
  [v2 cornerRadius];
  double v4 = v3;
  v5 = [v1 layer];
  v6 = [v5 cornerCurve];
  v7 = +[PXFocusInfo focusInfoWithView:v1 cornerRadius:v6 cornerCurve:v4];

  return v7;
}

- (void)_updateBadgeViewState
{
  BOOL v3 = [(PXPeopleCollectionViewCell *)self isFavorite];
  unint64_t v4 = [(PXPeopleCollectionViewCell *)self selectionStyle];
  if (v4 == 1)
  {
    if (v3) {
      uint64_t v7 = 1;
    }
    else {
      uint64_t v7 = 3;
    }
  }
  else if (v4)
  {
    uint64_t v7 = 0;
  }
  else
  {
    int v5 = [(PXPeopleCollectionViewCell *)self isSelected];
    uint64_t v6 = 4;
    if (v3) {
      uint64_t v6 = 2;
    }
    if (v5) {
      uint64_t v7 = 5;
    }
    else {
      uint64_t v7 = v6;
    }
  }
  v8 = [PXPeopleBadgeViewConfiguration alloc];
  id v11 = [(PXPeopleCollectionViewCell *)self traitCollection];
  [v11 displayScale];
  v9 = -[PXPeopleBadgeViewConfiguration initWithState:displayScale:badgeViewDelegate:](v8, "initWithState:displayScale:badgeViewDelegate:", v7, self);
  v10 = [(PXPeopleCollectionViewCell *)self badgeView];
  [v10 setUserData:v9];
}

- (void)_updateTitleAndFavoriteBadgeForLayoutChange
{
  [(PXPeopleCollectionViewCell *)self bounds];
  CGFloat v4 = v3;
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  id v24 = [(PXPeopleCollectionViewCell *)self badgeView];
  id v11 = [(PXPeopleCollectionViewCell *)self traitCollection];
  [v11 displayScale];
  BOOL v12 = [(PXPeopleCollectionViewCell *)self isFavorite];
  [(PXPeopleCollectionViewCell *)self _updateBadgeViewState];
  if (v12) {
    double v13 = 29.0;
  }
  else {
    double v13 = 24.0;
  }
  v25.origin.x = v4;
  v25.origin.y = v6;
  v25.size.width = v8;
  v25.size.height = v10;
  CGRectGetMaxY(v25);
  v14 = [(PXPeopleCollectionViewCell *)self avatarView];
  [v14 frame];

  -[PXPeopleCollectionViewCell _computeCircumferenceMultipliersForAngle:](self, "_computeCircumferenceMultipliersForAngle:", dbl_1AB359BF0[[v11 layoutDirection] == 1]);
  double v16 = v15;
  double v18 = v17;
  objc_msgSend(v24, "setFrame:", 0.0, 0.0, v13, v13);
  v19 = [(PXPeopleCollectionViewCell *)self avatarView];
  [v19 frame];
  double v21 = v16 * v20;
  v22 = [(PXPeopleCollectionViewCell *)self avatarView];
  [v22 frame];
  objc_msgSend(v24, "setCenter:", v21, v18 * v23);

  [(PXPeopleCollectionViewCell *)self nameLabel];
  [(id)objc_claimAutoreleasedReturnValue() font];
  [(id)objc_claimAutoreleasedReturnValue() lineHeight];
  PXFloatCeilingToPixel();
}

- (CGPoint)_computeCircumferenceMultipliersForAngle:(double)a3
{
  __double2 v3 = __sincos_stret(a3 * 0.0174532925);
  double v4 = (1.0 - v3.__sinval) * 0.5;
  double v5 = (v3.__cosval + 1.0) * 0.5;
  result.y = v4;
  result.x = v5;
  return result;
}

- (void)_updateSelection
{
  int v3 = [(PXPeopleCollectionViewCell *)self isSelected];
  unint64_t v4 = [(PXPeopleCollectionViewCell *)self selectionStyle];
  if (v4 == 1)
  {
    double v9 = [(PXPeopleCollectionViewCell *)self highlightOverlayView];
    [v9 setHidden:v3 ^ 1u];

    CGFloat v6 = [(PXPeopleCollectionViewCell *)self avatarView];
    double v7 = v6;
    double v8 = 1.0;
  }
  else
  {
    if (v4) {
      goto LABEL_9;
    }
    if (v3) {
      double v5 = 0.75;
    }
    else {
      double v5 = 1.0;
    }
    CGFloat v6 = [(PXPeopleCollectionViewCell *)self avatarView];
    double v7 = v6;
    double v8 = v5;
  }
  [v6 setAlpha:v8];

LABEL_9:
  [(PXPeopleCollectionViewCell *)self _updateBadgeViewState];
}

- (NSUUID)uuid
{
  uuid = self->_uuid;
  if (!uuid)
  {
    unint64_t v4 = [MEMORY[0x1E4F29128] UUID];
    double v5 = self->_uuid;
    self->_uuid = v4;

    uuid = self->_uuid;
  }
  return uuid;
}

- (void)setSelectionStyle:(unint64_t)a3
{
  self->_selectionStyle = a3;
  id v7 = [(PXPeopleCollectionViewCell *)self highlightOverlayView];
  [v7 setHidden:1];
  if (a3 == 1 && !v7)
  {
    id v5 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    [(UIImageView *)self->_avatarView frame];
    id v7 = (id)objc_msgSend(v5, "initWithFrame:");
    [v7 setUserInteractionEnabled:0];
    CGFloat v6 = [MEMORY[0x1E4FB1618] labelColor];
    [v7 setBackgroundColor:v6];

    [v7 setAlpha:0.5];
    [v7 setHidden:1];
    [(PXPeopleCollectionViewCell *)self addSubview:v7];
    [(PXPeopleCollectionViewCell *)self setHighlightOverlayView:v7];
    [(PXPeopleCollectionViewCell *)self bringSubviewToFront:v7];
  }
  [(PXPeopleCollectionViewCell *)self _updateSelection];
}

- (void)setSelected:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)PXPeopleCollectionViewCell;
  [(PXPeopleCollectionViewCell *)&v4 setSelected:a3];
  [(PXPeopleCollectionViewCell *)self _updateSelection];
}

- (void)setTextAlpha:(double)a3
{
  self->_textAlpha = a3;
  id v4 = [(PXPeopleCollectionViewCell *)self nameLabel];
  [v4 setAlpha:self->_textAlpha];
}

- (UIImage)image
{
  v2 = [(PXPeopleCollectionViewCell *)self avatarView];
  int v3 = [v2 image];

  return (UIImage *)v3;
}

- (void)setImage:(id)a3 normalizedFaceRect:(CGRect)a4
{
  double height = a4.size.height;
  double width = a4.size.width;
  double y = a4.origin.y;
  double x = a4.origin.x;
  id v13 = a3;
  double v9 = [(PXPeopleCollectionViewCell *)self avatarView];
  id v10 = [v9 image];
  if (v10 != v13)
  {
    v15.origin.double x = x;
    v15.origin.double y = y;
    v15.size.double width = width;
    v15.size.double height = height;
    if (CGRectEqualToRect(self->_unitRect, v15)) {
      uint64_t v11 = 2;
    }
    else {
      uint64_t v11 = 1;
    }
    [v9 setImage:v13];
    [v9 setContentMode:v11];
    BOOL v12 = [v9 layer];
    objc_msgSend(v12, "setContentsRect:", x, y, width, height);

    [(PXPeopleCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)setImage:(id)a3
{
}

- (void)setName:(id)a3
{
  id v5 = (NSString *)a3;
  id v10 = v5;
  if (self->_name != v5 || (BOOL v6 = [(NSString *)v5 isEqualToString:v5], v7 = v10, !v6))
  {
    objc_storeStrong((id *)&self->_name, a3);
    double v8 = [(PXPeopleCollectionViewCell *)self nameLabel];
    uint64_t v9 = [(NSString *)v10 length];
    if (v9) {
      [v8 setText:v10];
    }
    [v8 setHidden:v9 == 0];
    [(PXPeopleCollectionViewCell *)self setNeedsLayout];

    id v7 = v10;
  }
}

- (id)focusEffect
{
  return 0;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleCollectionViewCell;
  [(PXPeopleCollectionViewCell *)&v10 didUpdateFocusInContext:v6 withAnimationCoordinator:a4];
  id v7 = [v6 nextFocusedItem];
  if (v7 == self)
  {

LABEL_5:
    [(PXPeopleCollectionViewCell *)self _updateFocusRingForced:1];
    goto LABEL_6;
  }
  double v8 = v7;
  uint64_t v9 = [v6 previouslyFocusedItem];

  if (v9 == self) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)prepareForReuse
{
  v4.receiver = self;
  v4.super_class = (Class)PXPeopleCollectionViewCell;
  [(PXPeopleCollectionViewCell *)&v4 prepareForReuse];
  [(UIImageView *)self->_avatarView setImage:0];
  name = self->_name;
  self->_name = (NSString *)&stru_1F00B0030;

  [(UILabel *)self->_nameLabel setText:&stru_1F00B0030];
  [(UILabel *)self->_nameLabel setHidden:1];
  [(PXPeopleCollectionViewCell *)self setHidden:0];
}

- (void)layoutSubviews
{
  v10.receiver = self;
  v10.super_class = (Class)PXPeopleCollectionViewCell;
  [(PXPeopleCollectionViewCell *)&v10 layoutSubviews];
  int v3 = [(PXPeopleCollectionViewCell *)self contentView];
  [v3 frame];
  double v5 = v4;

  id v6 = [(PXPeopleCollectionViewCell *)self avatarView];
  objc_msgSend(v6, "setFrame:", 0.0, 0.0, v5, v5);
  id v7 = [v6 layer];
  [v7 setCornerRadius:v5 * 0.5];

  double v8 = [(PXPeopleCollectionViewCell *)self highlightOverlayView];
  objc_msgSend(v8, "setFrame:", 0.0, 0.0, v5, v5);
  uint64_t v9 = [v8 layer];
  [v9 setCornerRadius:v5 * 0.5];

  [(PXPeopleCollectionViewCell *)self _updateTitleAndFavoriteBadgeForLayoutChange];
  [(PXPeopleCollectionViewCell *)self _updateFocusRingForced:0];
}

- (void)setFavorite:(BOOL)a3
{
  if (self->_favorite != a3)
  {
    self->_favorite = a3;
    [(PXPeopleCollectionViewCell *)self setNeedsLayout];
  }
}

- (void)toggleFavorite:(id)a3
{
  id v4 = [(PXPeopleCollectionViewCell *)self peopleCellDelegate];
  [v4 toggleFavoriteForCell:self];
}

- (PXPeopleCollectionViewCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  v31.receiver = self;
  v31.super_class = (Class)PXPeopleCollectionViewCell;
  double v5 = -[PXPeopleCollectionViewCell initWithFrame:](&v31, sel_initWithFrame_, a3.origin.x, a3.origin.y);
  if (v5)
  {
    if (initWithFrame__onceToken != -1) {
      dispatch_once(&initWithFrame__onceToken, &__block_literal_global_32318);
    }
    v5->_unitRect.origin.double x = 0.0;
    v5->_unitRect.origin.double y = 0.0;
    __asm { FMOV            V0.2D, #1.0 }
    v5->_unitRect.size = _Q0;
    uint64_t v11 = [(PXPeopleCollectionViewCell *)v5 contentView];
    BOOL v12 = (UIImageView *)objc_alloc_init(MEMORY[0x1E4FB1838]);
    avatarView = v5->_avatarView;
    v5->_avatarView = v12;

    [(UIImageView *)v5->_avatarView setContentMode:2];
    v14 = v5->_avatarView;
    CGRect v15 = [MEMORY[0x1E4FB1618] quaternarySystemFillColor];
    [(UIImageView *)v14 setBackgroundColor:v15];

    [(UIImageView *)v5->_avatarView setClipsToBounds:1];
    double v16 = [(UIImageView *)v5->_avatarView layer];
    double v17 = v16;
    if (height >= width) {
      double v18 = width;
    }
    else {
      double v18 = height;
    }
    [v16 setCornerRadius:v18 * 0.5];

    [v11 addSubview:v5->_avatarView];
    v19 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    [(UILabel *)v19 setTextAlignment:1];
    [(UILabel *)v19 setHidden:1];
    [(UILabel *)v19 setText:&stru_1F00B0030];
    [(UILabel *)v19 setFont:initWithFrame__font];
    [v11 addSubview:v19];
    nameLabel = v5->_nameLabel;
    v5->_nameLabel = v19;
    double v21 = v19;

    v22 = [(UILabel *)v5->_nameLabel layer];
    [v22 setShouldRasterize:1];

    double v23 = [(PXPeopleCollectionViewCell *)v5 traitCollection];
    [v23 displayScale];
    double v25 = v24;

    v26 = [(UILabel *)v5->_nameLabel layer];
    [v26 setRasterizationScale:v25];

    name = v5->_name;
    v5->_name = (NSString *)&stru_1F00B0030;

    [(PXPeopleCollectionViewCell *)v5 setSelectionStyle:1];
    v28 = objc_alloc_init(PXPeopleBadgeView);
    badgeView = v5->_badgeView;
    v5->_badgeView = v28;

    [(PXPeopleBadgeView *)v5->_badgeView setBadgeViewDelegate:v5];
    [(PXPeopleCollectionViewCell *)v5 addSubview:v5->_badgeView];
  }
  return v5;
}

void __44__PXPeopleCollectionViewCell_initWithFrame___block_invoke()
{
  v0 = (void *)MEMORY[0x1E4FB08E0];
  [MEMORY[0x1E4FB08E0] systemFontSize];
  uint64_t v1 = objc_msgSend(v0, "systemFontOfSize:");
  v2 = (void *)initWithFrame__font;
  initWithFrame__font = v1;
}

@end