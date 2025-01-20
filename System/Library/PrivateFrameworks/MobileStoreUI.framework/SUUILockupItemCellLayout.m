@interface SUUILockupItemCellLayout
+ (CGSize)videoThumbnailSizeForVideo:(id)a3 clientContext:(id)a4;
+ (double)heightForLockupComponent:(id)a3 clientContext:(id)a4;
+ (double)heightForLockupStyle:(SUUILockupStyle *)a3 item:(id)a4 editorial:(id)a5 clientContext:(id)a6;
- (BOOL)_isItemOfferHidden;
- (BOOL)playsInlineVideo;
- (CGRect)_layoutIconImageView;
- (CGSize)imageBoundingSize;
- (CGSize)videoThumbnailSize;
- (NSString)artistName;
- (NSString)categoryString;
- (NSString)editorialBadgeString;
- (NSString)itemCountString;
- (NSString)releaseDateString;
- (NSString)title;
- (SUUILockupItemCellLayout)initWithCollectionViewCell:(id)a3;
- (SUUILockupItemCellLayout)initWithParentView:(id)a3;
- (SUUILockupItemCellLayout)initWithTableViewCell:(id)a3;
- (UIEdgeInsets)contentInsets;
- (UIImage)videoThumbnailImage;
- (float)userRating;
- (id)_itemOfferTextLabel;
- (int64_t)itemOfferStyle;
- (int64_t)layoutStyle;
- (int64_t)lockupSize;
- (int64_t)numberOfUserRatings;
- (int64_t)verticalAlignment;
- (unint64_t)visibleFields;
- (void)_beginVideoPlaybackAction:(id)a3;
- (void)_initSUUILockupItemCellLayout;
- (void)_layoutHorizontal;
- (void)_layoutVertical;
- (void)dealloc;
- (void)endVideoPlaybackAnimated:(BOOL)a3;
- (void)layoutForItemOfferChange;
- (void)layoutSubviews;
- (void)playInlineVideoWithURL:(id)a3;
- (void)prepareForReuse;
- (void)setArtistName:(id)a3;
- (void)setBackgroundColor:(id)a3;
- (void)setCategoryString:(id)a3;
- (void)setClientContext:(id)a3;
- (void)setColoringWithColorScheme:(id)a3;
- (void)setContentInsets:(UIEdgeInsets)a3;
- (void)setEditorialBadgeString:(id)a3;
- (void)setIconImage:(id)a3;
- (void)setImageBoundingSize:(CGSize)a3;
- (void)setItemCountString:(id)a3;
- (void)setItemOfferStyle:(int64_t)a3;
- (void)setLayoutStyle:(int64_t)a3;
- (void)setLockupSize:(int64_t)a3;
- (void)setNumberOfUserRatings:(int64_t)a3;
- (void)setPlaysInlineVideo:(BOOL)a3;
- (void)setReleaseDateString:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserRating:(float)a3;
- (void)setVerticalAlignment:(int64_t)a3;
- (void)setVideoThumbnailImage:(id)a3;
- (void)setVideoThumbnailSize:(CGSize)a3;
- (void)setVisibleFields:(unint64_t)a3;
@end

@implementation SUUILockupItemCellLayout

- (void)_initSUUILockupItemCellLayout
{
  v3 = objc_alloc_init(SUUILockupMetadataView);
  metadataView = self->_metadataView;
  self->_metadataView = v3;

  v5 = self->_metadataView;
  double v6 = SUUILockupStyleDefault((uint64_t)v8);
  -[SUUILockupMetadataView setVisibleFields:](v5, "setVisibleFields:", v9, v6);
  v7 = [(SUUICellLayout *)self contentView];
  [v7 addSubview:self->_metadataView];
}

- (SUUILockupItemCellLayout)initWithCollectionViewCell:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUILockupItemCellLayout;
  v3 = [(SUUICellLayout *)&v6 initWithCollectionViewCell:a3];
  v4 = v3;
  if (v3) {
    [(SUUILockupItemCellLayout *)v3 _initSUUILockupItemCellLayout];
  }
  return v4;
}

- (SUUILockupItemCellLayout)initWithParentView:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUILockupItemCellLayout;
  v3 = [(SUUICellLayout *)&v6 initWithParentView:a3];
  v4 = v3;
  if (v3) {
    [(SUUILockupItemCellLayout *)v3 _initSUUILockupItemCellLayout];
  }
  return v4;
}

- (SUUILockupItemCellLayout)initWithTableViewCell:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)SUUILockupItemCellLayout;
  v3 = [(SUUICellLayout *)&v6 initWithTableViewCell:a3];
  v4 = v3;
  if (v3) {
    [(SUUILockupItemCellLayout *)v3 _initSUUILockupItemCellLayout];
  }
  return v4;
}

- (void)dealloc
{
  [(SUUIEmbeddedMediaView *)self->_videoThumbnailView removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
  v3.receiver = self;
  v3.super_class = (Class)SUUILockupItemCellLayout;
  [(SUUIItemCellLayout *)&v3 dealloc];
}

+ (double)heightForLockupComponent:(id)a3 clientContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6) {
    [v6 lockupStyle];
  }
  else {
    memset(v13, 0, sizeof(v13));
  }
  v8 = [v6 item];
  uint64_t v9 = [v6 editorial];
  [a1 heightForLockupStyle:v13 item:v8 editorial:v9 clientContext:v7];
  double v11 = v10;

  return v11;
}

+ (double)heightForLockupStyle:(SUUILockupStyle *)a3 item:(id)a4 editorial:(id)a5 clientContext:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  +[SUUILockupMetadataView maximumHeightWithVisibleFields:a3->visibleFields];
  double v13 = v12;
  SUUILockupImageSizeForLockupSize(a3->artworkSize, [v10 itemKind]);
  unint64_t visibleFields = a3->visibleFields;
  if ((visibleFields & 2) != 0) {
    double v16 = v14;
  }
  else {
    double v16 = *(double *)(MEMORY[0x263F001B0] + 8);
  }
  double v17 = 0.0;
  if ((visibleFields & 2) != 0) {
    double v18 = 11.0;
  }
  else {
    double v18 = 0.0;
  }
  double v19 = 58.0;
  if ((visibleFields & 4) == 0) {
    double v19 = 0.0;
  }
  if ((visibleFields & 0x400) != 0)
  {
    v21 = objc_msgSend(v10, "videos", v19, v18);
    v22 = [v21 firstObject];
    [a1 videoThumbnailSizeForVideo:v22 clientContext:v11];
    double v24 = v23;

    if (v13 >= v16) {
      double v25 = v13;
    }
    else {
      double v25 = v16;
    }
    double v17 = v25 + v24 + 10.0;
  }
  else
  {
    switch(a3->layoutStyle)
    {
      case 0:
        double v20 = v13 + v19;
        if (v20 >= v16) {
          double v17 = v20;
        }
        else {
          double v17 = v16;
        }
        break;
      case 1:
        if (v13 >= v16) {
          double v17 = v13;
        }
        else {
          double v17 = v16;
        }
        break;
      case 2:
        double v26 = v13 + v16 + v18;
        goto LABEL_24;
      case 3:
        double v26 = v13 + v16 + v18;
        if (a5) {
          double v19 = -0.0;
        }
LABEL_24:
        double v17 = v19 + v26;
        break;
      default:
        break;
    }
  }

  return v17;
}

+ (CGSize)videoThumbnailSizeForVideo:(id)a3 clientContext:(id)a4
{
  id v5 = a3;
  if (SUUIUserInterfaceIdiom(a4) == 1)
  {
    uint64_t v6 = 0x406BA00000000000;
    uint64_t v7 = 0x4064C00000000000;
  }
  else
  {
    v8 = [v5 artworks];
    uint64_t v9 = [v8 largestArtwork];

    uint64_t v7 = 0x4066800000000000;
    if (v9 && ([v9 size], v10 < v11))
    {
      uint64_t v6 = 0x4066800000000000;
      uint64_t v7 = 0x4074000000000000;
    }
    else
    {
      uint64_t v6 = 0x4074000000000000;
    }
  }
  double v12 = *(double *)&v6;
  double v13 = *(double *)&v7;
  result.height = v13;
  result.width = v12;
  return result;
}

- (NSString)artistName
{
  return [(SUUILockupMetadataView *)self->_metadataView artistName];
}

- (NSString)categoryString
{
  return [(SUUILockupMetadataView *)self->_metadataView categoryString];
}

- (NSString)editorialBadgeString
{
  return [(SUUILockupMetadataView *)self->_metadataView editorialBadgeString];
}

- (void)endVideoPlaybackAnimated:(BOOL)a3
{
}

- (NSString)itemCountString
{
  return [(SUUILockupMetadataView *)self->_metadataView itemCountString];
}

- (int64_t)numberOfUserRatings
{
  return [(SUUILockupMetadataView *)self->_metadataView numberOfUserRatings];
}

- (void)playInlineVideoWithURL:(id)a3
{
}

- (NSString)releaseDateString
{
  return [(SUUILockupMetadataView *)self->_metadataView releaseDateString];
}

- (void)setArtistName:(id)a3
{
}

- (void)setCategoryString:(id)a3
{
}

- (void)setEditorialBadgeString:(id)a3
{
}

- (void)setColoringWithColorScheme:(id)a3
{
  id v4 = a3;
  [(SUUILockupMetadataView *)self->_metadataView setColoringWithColorScheme:v4];
  id v5 = [v4 primaryTextColor];
  uint64_t v6 = [(SUUIItemCellLayout *)self itemOfferNoticeLabel];
  uint64_t v7 = v6;
  if (v5)
  {
    [v6 setTextColor:v5];
  }
  else
  {
    v8 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
    [v7 setTextColor:v8];
  }
  v9.receiver = self;
  v9.super_class = (Class)SUUILockupItemCellLayout;
  [(SUUICellLayout *)&v9 setColoringWithColorScheme:v4];
}

- (void)setContentInsets:(UIEdgeInsets)a3
{
  if (self->_contentInsets.left != a3.left
    || self->_contentInsets.top != a3.top
    || self->_contentInsets.right != a3.right
    || self->_contentInsets.bottom != a3.bottom)
  {
    self->_contentInsets = a3;
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setImageBoundingSize:(CGSize)a3
{
  if (self->_imageBoundingSize.width != a3.width || self->_imageBoundingSize.height != a3.height)
  {
    self->_imageBoundingSize = a3;
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setItemCountString:(id)a3
{
}

- (void)setItemOfferStyle:(int64_t)a3
{
  if (self->_itemOfferStyle != a3)
  {
    self->_itemOfferStyle = a3;
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setPlaysInlineVideo:(BOOL)a3
{
  self->_playsInlineVideo = a3;
  -[SUUIEmbeddedMediaView setEnabled:](self->_videoThumbnailView, "setEnabled:");
}

- (void)setNumberOfUserRatings:(int64_t)a3
{
}

- (void)setReleaseDateString:(id)a3
{
}

- (void)setTitle:(id)a3
{
  [(SUUILockupMetadataView *)self->_metadataView setTitle:a3];
  [(SUUICellLayout *)self setNeedsLayout];
}

- (void)setUserRating:(float)a3
{
}

- (void)setVerticalAlignment:(int64_t)a3
{
  if (self->_verticalAlignment != a3)
  {
    self->_verticalAlignment = a3;
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setVideoThumbnailImage:(id)a3
{
  id v14 = a3;
  id v4 = [(SUUILockupItemCellLayout *)self videoThumbnailImage];

  if (v4 != v14)
  {
    videoThumbnailView = self->_videoThumbnailView;
    if (v14)
    {
      if (!videoThumbnailView)
      {
        uint64_t v7 = objc_alloc_init(SUUIEmbeddedMediaView);
        v8 = self->_videoThumbnailView;
        self->_videoThumbnailView = v7;

        [(SUUIEmbeddedMediaView *)self->_videoThumbnailView addTarget:self action:sel__beginVideoPlaybackAction_ forControlEvents:64];
        objc_super v9 = self->_videoThumbnailView;
        double v10 = [(SUUICellLayout *)self parentCellView];
        double v11 = [v10 backgroundColor];
        [(SUUIEmbeddedMediaView *)v9 setBackgroundColor:v11];

        [(SUUIEmbeddedMediaView *)self->_videoThumbnailView setEnabled:self->_playsInlineVideo];
        [(SUUIEmbeddedMediaView *)self->_videoThumbnailView setMediaType:2];
        [(SUUIEmbeddedMediaView *)self->_videoThumbnailView setShowsThumbnailReflection:0];
        [(SUUIEmbeddedMediaView *)self->_videoThumbnailView setThumbnailContentMode:6];
        double v12 = [(SUUICellLayout *)self contentView];
        [v12 addSubview:self->_videoThumbnailView];

        videoThumbnailView = self->_videoThumbnailView;
      }
      -[SUUIEmbeddedMediaView setThumbnailImage:](videoThumbnailView, "setThumbnailImage:");
    }
    else
    {
      [(SUUIEmbeddedMediaView *)videoThumbnailView removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];
      [(SUUIEmbeddedMediaView *)self->_videoThumbnailView removeFromSuperview];
      double v13 = self->_videoThumbnailView;
      self->_videoThumbnailView = 0;
    }
    uint64_t v5 = [(SUUICellLayout *)self setNeedsLayout];
  }
  MEMORY[0x270F9A790](v5);
}

- (void)setVideoThumbnailSize:(CGSize)a3
{
  if (self->_videoThumbnailSize.width != a3.width || self->_videoThumbnailSize.height != a3.height)
  {
    self->_videoThumbnailSize = a3;
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (void)setVisibleFields:(unint64_t)a3
{
  if ([(SUUILockupMetadataView *)self->_metadataView visibleFields] != a3)
  {
    [(SUUILockupMetadataView *)self->_metadataView setVisibleFields:a3];
    [(SUUIItemCellLayout *)self setDisplaysItemOfferButton:([(SUUILockupItemCellLayout *)self visibleFields] & 0x104) != 0];
    [(SUUICellLayout *)self setNeedsLayout];
  }
}

- (NSString)title
{
  return [(SUUILockupMetadataView *)self->_metadataView title];
}

- (float)userRating
{
  [(SUUILockupMetadataView *)self->_metadataView userRating];
  return result;
}

- (UIImage)videoThumbnailImage
{
  return [(SUUIEmbeddedMediaView *)self->_videoThumbnailView thumbnailImage];
}

- (unint64_t)visibleFields
{
  return [(SUUILockupMetadataView *)self->_metadataView visibleFields];
}

- (void)layoutForItemOfferChange
{
  objc_super v3 = [(SUUICellLayout *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v7 = v6;

  id v33 = [(SUUIItemCellLayout *)self itemOfferButton];
  [v33 frame];
  double v9 = v8;
  double v11 = v10;
  objc_msgSend(v33, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
  double v13 = v12;
  double v15 = v14;
  double v16 = [(SUUIItemCellLayout *)self itemOfferNoticeLabel];
  double v32 = v7;
  if ([v16 isHidden])
  {
    double v17 = *(double *)(MEMORY[0x263F001A8] + 16);
    double v18 = *(double *)(MEMORY[0x263F001A8] + 24);

    double v16 = 0;
    double v19 = v15;
  }
  else
  {
    [v16 frame];
    objc_msgSend(v16, "sizeThatFits:", v13 + 10.0, 1.79769313e308);
    double v17 = v20;
    double v18 = v21;
    double v19 = v15 + v21 + 3.0;
  }
  if (self->_layoutStyle == 1)
  {
    double v9 = v5 - self->_contentInsets.right - v13;
    if (self->_verticalAlignment == 1)
    {
      float v22 = (v32 - v19) * 0.5;
      double v11 = floorf(v22);
    }
    else
    {
      double v23 = [(SUUIItemCellLayout *)self iconImageView];
      [v23 frame];
      double v25 = v24;

      [(SUUILockupMetadataView *)self->_metadataView frame];
      if (v25 >= v26) {
        double v27 = v25;
      }
      else {
        double v27 = v26;
      }
      float v28 = (v27 - v19) * 0.5;
      double v11 = self->_contentInsets.top + floorf(v28);
    }
  }
  float v29 = (v13 - v17) * 0.5;
  double v30 = v9 + floorf(v29);
  v35.origin.x = v9;
  v35.origin.y = v11;
  v35.size.width = v13;
  v35.size.height = v15;
  CGFloat v31 = CGRectGetMaxY(v35) + 3.0;
  objc_msgSend(v33, "setFrame:", v9, v11, v13, v15);
  objc_msgSend(v16, "setFrame:", v30, v31, v17, v18);
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SUUILockupItemCellLayout;
  [(SUUICellLayout *)&v4 layoutSubviews];
  unint64_t layoutStyle = self->_layoutStyle;
  if (layoutStyle - 2 < 2)
  {
    [(SUUILockupItemCellLayout *)self _layoutVertical];
  }
  else if (layoutStyle <= 1)
  {
    [(SUUILockupItemCellLayout *)self _layoutHorizontal];
  }
}

- (void)prepareForReuse
{
  [(SUUIEmbeddedMediaView *)self->_videoThumbnailView endPlaybackAnimated:0];
  v3.receiver = self;
  v3.super_class = (Class)SUUILockupItemCellLayout;
  [(SUUIItemCellLayout *)&v3 prepareForReuse];
}

- (void)setBackgroundColor:(id)a3
{
  itemOfferTextLabel = self->_itemOfferTextLabel;
  id v5 = a3;
  [(UILabel *)itemOfferTextLabel setBackgroundColor:v5];
  [(SUUILockupMetadataView *)self->_metadataView setBackgroundColor:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUILockupItemCellLayout;
  [(SUUIItemCellLayout *)&v6 setBackgroundColor:v5];
}

- (void)setClientContext:(id)a3
{
  metadataView = self->_metadataView;
  id v5 = a3;
  [(SUUILockupMetadataView *)metadataView setClientContext:v5];
  v6.receiver = self;
  v6.super_class = (Class)SUUILockupItemCellLayout;
  [(SUUICellLayout *)&v6 setClientContext:v5];
}

- (void)setIconImage:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)SUUILockupItemCellLayout;
  [(SUUIItemCellLayout *)&v5 setIconImage:a3];
  objc_super v4 = [(SUUIItemCellLayout *)self iconImageView];
  [v4 setContentMode:11];
}

- (void)_beginVideoPlaybackAction:(id)a3
{
  id v5 = [(SUUICellLayout *)self parentCellView];
  objc_super v3 = SUUICollectionViewForView(v5);
  objc_super v4 = [v3 delegate];
  if (objc_opt_respondsToSelector()) {
    [v4 itemCollectionView:v3 didTapVideoForCollectionViewCell:v5];
  }
}

- (BOOL)_isItemOfferHidden
{
  if (![(SUUIItemCellLayout *)self displaysItemOfferButton]
    || ([(SUUILockupItemCellLayout *)self visibleFields] & 0x104) == 0)
  {
    return 1;
  }
  objc_super v3 = [(SUUIItemCellLayout *)self itemOffer];
  if (v3) {
    BOOL v4 = [(SUUIItemCellLayout *)self isRestricted];
  }
  else {
    BOOL v4 = 1;
  }

  return v4;
}

- (id)_itemOfferTextLabel
{
  itemOfferTextLabel = self->_itemOfferTextLabel;
  if (!itemOfferTextLabel)
  {
    BOOL v4 = (UILabel *)objc_alloc_init(MEMORY[0x263F828E0]);
    id v5 = self->_itemOfferTextLabel;
    self->_itemOfferTextLabel = v4;

    objc_super v6 = self->_itemOfferTextLabel;
    double v7 = [(SUUICellLayout *)self parentCellView];
    double v8 = [v7 backgroundColor];
    [(UILabel *)v6 setBackgroundColor:v8];

    double v9 = self->_itemOfferTextLabel;
    double v10 = [MEMORY[0x263F81708] systemFontOfSize:12.0];
    [(UILabel *)v9 setFont:v10];

    double v11 = self->_itemOfferTextLabel;
    double v12 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.5];
    [(UILabel *)v11 setTextColor:v12];

    double v13 = [(SUUICellLayout *)self contentView];
    [v13 addSubview:self->_itemOfferTextLabel];

    itemOfferTextLabel = self->_itemOfferTextLabel;
  }
  return itemOfferTextLabel;
}

- (void)_layoutHorizontal
{
  objc_super v3 = [(SUUICellLayout *)self contentView];
  [v3 bounds];
  CGFloat v5 = v4;
  CGFloat v7 = v6;
  double v9 = v8;
  double v100 = v10;

  p_contentInsets = &self->_contentInsets;
  double left = self->_contentInsets.left;
  [(SUUILockupItemCellLayout *)self _layoutIconImageView];
  double v112 = v13;
  double v17 = v15;
  double rect = v16;
  if (v15 > 0.00000011920929) {
    double left = CGRectGetMaxX(*(CGRect *)&v13) + 13.0;
  }
  BOOL v18 = [(SUUILockupItemCellLayout *)self _isItemOfferHidden];
  double v19 = [(SUUIItemCellLayout *)self itemOfferButton];
  uint64_t v20 = MEMORY[0x263F001A8];
  double v21 = *MEMORY[0x263F001A8];
  double v23 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v22 = *(double *)(MEMORY[0x263F001A8] + 24);
  v114 = v19;
  double v99 = v22;
  CGFloat rect2 = v9;
  if (v18 || self->_itemOfferStyle)
  {
    [v19 setHidden:1];

    double v24 = self->_itemOfferTextLabel;
    if (v18)
    {
      v115 = 0;
      double v98 = 0.0;
      double v105 = v21;
      double v109 = v22;
      double v110 = v23;
      goto LABEL_15;
    }
    double v25 = 0;
    double v26 = 0.0;
    double v105 = v21;
    double v109 = v22;
    double v110 = v23;
  }
  else
  {
    if (v19)
    {
      [v19 frame];
      double v109 = v28;
      double v110 = v27;
      double v105 = left;
      double v26 = v28;
    }
    else
    {
      double v26 = 0.0;
      double v109 = *(double *)(MEMORY[0x263F001A8] + 24);
      double v110 = *(double *)(MEMORY[0x263F001A8] + 16);
      double v105 = *MEMORY[0x263F001A8];
    }
    double v24 = self->_itemOfferTextLabel;
    double v25 = v114;
  }
  v115 = v25;
  if (self->_itemOfferStyle == 2)
  {
    float v29 = [(SUUILockupItemCellLayout *)self _itemOfferTextLabel];

    [v29 setHidden:0];
    double v30 = [(SUUIItemCellLayout *)self itemOffer];
    CGFloat v31 = [v30 buttonText];
    [v29 setText:v31];

    [v29 frame];
    objc_msgSend(v29, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    double v106 = v32;
    double v104 = left;
    double v102 = v33;
    double v98 = v33;
    goto LABEL_16;
  }
  double v98 = v26;
LABEL_15:
  [(UILabel *)v24 setHidden:1];

  float v29 = 0;
  double v102 = v22;
  double v106 = v23;
  double v104 = v21;
LABEL_16:
  double v34 = *(double *)(v20 + 8);
  CGRect v35 = [(SUUIItemCellLayout *)self itemOfferNoticeLabel];
  if ([v35 isHidden])
  {

    CGRect v35 = 0;
  }
  else if (v35)
  {
    [v35 frame];
    double v21 = v38;
    double v34 = v39;
    double v40 = v110;
    if (v115 || (double v40 = v106, v29))
    {
      objc_msgSend(v35, "sizeThatFits:", v40 + 10.0, 1.79769313e308);
      double v23 = v42;
    }
    else
    {
      double v23 = v36;
      double v41 = v37;
    }
    double v99 = v41;
    double v98 = v98 + v41 + 3.0;
  }
  v117.origin.x = v5;
  v117.origin.y = v7;
  v117.size.double width = rect2;
  v117.size.height = v100;
  double v43 = CGRectGetMaxX(v117) - self->_contentInsets.right;
  *(CGFloat *)&long long v44 = p_contentInsets->top;
  long long v96 = v44;
  int64_t verticalAlignment = self->_verticalAlignment;
  if (([(SUUILockupItemCellLayout *)self visibleFields] & 0x400) != 0)
  {
    videoThumbnailView = self->_videoThumbnailView;
    double v47 = v112;
    if (videoThumbnailView)
    {
      double width = self->_videoThumbnailSize.width;
      double v50 = self->_contentInsets.left;
      float v51 = (v43 - v50 - width) * 0.5;
      -[SUUIEmbeddedMediaView setFrame:](videoThumbnailView, "setFrame:", v50 + floorf(v51), *(double *)&v96, width, self->_videoThumbnailSize.height);
    }
    int64_t verticalAlignment = 0;
    *(double *)&long long v46 = p_contentInsets->top + self->_videoThumbnailSize.height + 10.0;
    long long v96 = v46;
  }
  else
  {
    double v47 = v112;
  }
  if (self->_layoutStyle != 1)
  {
LABEL_31:
    if (v18) {
      goto LABEL_35;
    }
    goto LABEL_32;
  }
  if (v115)
  {
    double v105 = v43 - v110;
    objc_msgSend(v115, "layoutSizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    double v43 = v43 - v52 + -10.0;
    goto LABEL_31;
  }
  double v104 = v43 - v106;
  double v43 = v43 - v106 + -10.0;
  if (v18) {
    goto LABEL_35;
  }
LABEL_32:
  if (self->_itemOfferStyle == 1)
  {
    metadataView = self->_metadataView;
    v54 = [(SUUIItemCellLayout *)self itemOffer];
    v55 = [v54 buttonText];
    [(SUUILockupMetadataView *)metadataView setItemOfferString:v55];

    goto LABEL_36;
  }
LABEL_35:
  -[SUUILockupMetadataView setItemOfferString:](self->_metadataView, "setItemOfferString:", 0, v96);
LABEL_36:
  [(SUUILockupMetadataView *)self->_metadataView frame];
  -[SUUILockupMetadataView sizeThatFits:](self->_metadataView, "sizeThatFits:", v43 - left, 1.79769313e308);
  double v58 = v57;
  v59.f64[0] = v56;
  double v103 = v23;
  double rect2a = v56;
  if (self->_layoutStyle == 1)
  {
    if (verticalAlignment == 1)
    {
      v59.f64[1] = rect;
      float v60 = (v100 - v98) * 0.5;
      double v61 = floorf(v60);
      double v62 = ceilf(v60);
      __asm { FMOV            V1.2D, #0.5 }
      float64x2_t v68 = vcvtq_f64_f32(vrndm_f32(vcvt_f32_f64(vmulq_f64(vsubq_f64((float64x2_t)vdupq_lane_s64(*(uint64_t *)&v100, 0), v59), _Q1))));
    }
    else
    {
      if (rect >= v56) {
        *(double *)&uint64_t v73 = rect;
      }
      else {
        *(double *)&uint64_t v73 = v56;
      }
      float v74 = (*(double *)&v73 - v98) * 0.5;
      double v61 = *(double *)&v97 + floorf(v74);
      double v62 = *(double *)&v97 + ceilf(v74);
      v59.f64[1] = rect;
      __asm { FMOV            V1.2D, #0.5 }
      float64x2_t v68 = vaddq_f64((float64x2_t)vdupq_lane_s64(v97, 0), vcvtq_f64_f32(vrndm_f32(vcvt_f32_f64(vmulq_f64(vsubq_f64((float64x2_t)vdupq_lane_s64(v73, 0), v59), _Q1)))));
    }
    float64x2_t v113 = v68;
    if (!v35) {
      goto LABEL_68;
    }
    goto LABEL_54;
  }
  double v69 = v109 + 3.0;
  if (!v115) {
    double v69 = -0.0;
  }
  v70.f64[0] = v69 + v56;
  if (verticalAlignment == 1)
  {
    v70.f64[1] = rect;
    __asm { FMOV            V1.2D, #0.5 }
    float64x2_t v72 = vcvtq_f64_f32(vrndm_f32(vcvt_f32_f64(vmulq_f64(vsubq_f64((float64x2_t)vdupq_lane_s64(*(uint64_t *)&v100, 0), v70), _Q1))));
  }
  else
  {
    if (rect >= v70.f64[0]) {
      *(double *)&uint64_t v76 = rect;
    }
    else {
      uint64_t v76 = *(uint64_t *)&v70.f64[0];
    }
    v70.f64[1] = rect;
    float64x2_t v77 = vsubq_f64((float64x2_t)vdupq_lane_s64(v76, 0), v70);
    __asm { FMOV            V1.2D, #0.5 }
    float64x2_t v79 = vcvtq_f64_f32(vrndm_f32(vcvt_f32_f64(vmulq_f64(v77, _Q1))));
    float64x2_t v80 = vld1q_dup_f64(&p_contentInsets->top);
    float64x2_t v72 = vaddq_f64(v80, v79);
  }
  double v81 = left;
  float64x2_t v113 = v72;
  double v82 = v58;
  float64_t v83 = v59.f64[0];
  double v61 = CGRectGetMaxY(*(CGRect *)((char *)&v72 - 8)) + 3.0;
  v118.origin.x = left;
  v118.origin.y = v113.f64[0];
  v118.size.double width = v58;
  v118.size.height = rect2a;
  double v62 = CGRectGetMaxY(v118) + 3.0;
  if (v35)
  {
LABEL_54:
    double v101 = v58;
    double v84 = v17;
    if (v115) {
      double v85 = v105;
    }
    else {
      double v85 = v104;
    }
    if (v115) {
      double v86 = v61;
    }
    else {
      double v86 = v62;
    }
    double v87 = v106;
    if (v115) {
      double v87 = v110;
    }
    double v88 = v102;
    if (v115) {
      double v88 = v109;
    }
    float v89 = (v87 - v103) * 0.5;
    double v90 = floorf(v89);
    double v91 = v85;
    double MaxY = CGRectGetMaxY(*(CGRect *)(&v86 - 1));
    v93 = [(SUUILockupMetadataView *)self->_metadataView primaryTextColor];
    if (v93)
    {
      [v35 setTextColor:v93];
    }
    else
    {
      v94 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
      [v35 setTextColor:v94];
    }
    double v21 = v85 + v90;
    double v34 = MaxY + 3.0;

    double v17 = v84;
    double v58 = v101;
  }
LABEL_68:
  v95 = [(SUUIItemCellLayout *)self iconImageView];
  objc_msgSend(v95, "setFrame:", v47, v113.f64[1], v17, rect);

  objc_msgSend(v115, "setFrame:", v105, v61, v110, v109);
  objc_msgSend(v35, "setFrame:", v21, v34, v103, v99);
  objc_msgSend(v29, "setFrame:", v104, v62, v106, v102);
  [(SUUILockupMetadataView *)self->_metadataView frame];
  v120.origin.x = left;
  v120.origin.y = v113.f64[0];
  v120.size.double width = v58;
  v120.size.height = rect2a;
  if (!CGRectEqualToRect(v119, v120))
  {
    -[SUUILockupMetadataView setFrame:](self->_metadataView, "setFrame:", left, v113.f64[0], v58, rect2a);
    [(SUUILockupMetadataView *)self->_metadataView setNeedsDisplay];
  }
}

- (CGRect)_layoutIconImageView
{
  objc_super v3 = [(SUUIItemCellLayout *)self iconImageView];
  [v3 frame];
  if (([(SUUILockupItemCellLayout *)self visibleFields] & 2) != 0)
  {
    double top = self->_contentInsets.top;
    double left = self->_contentInsets.left;
    double width = self->_imageBoundingSize.width;
    double height = self->_imageBoundingSize.height;
    objc_msgSend(v3, "setFrame:", left, top, width, height);
    objc_msgSend(v3, "setHidden:", -[SUUIItemCellLayout isIconImageHidden](self, "isIconImageHidden"));
  }
  else
  {
    [v3 setHidden:1];
    double left = *MEMORY[0x263F001A8];
    double top = *(double *)(MEMORY[0x263F001A8] + 8);
    double width = *(double *)(MEMORY[0x263F001A8] + 16);
    double height = *(double *)(MEMORY[0x263F001A8] + 24);
  }

  double v8 = left;
  double v9 = top;
  double v10 = width;
  double v11 = height;
  result.size.double height = v11;
  result.size.double width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)_layoutVertical
{
  objc_super v3 = [(SUUICellLayout *)self contentView];
  [v3 bounds];
  double v5 = v4;
  double v55 = v6;

  [(SUUILockupItemCellLayout *)self _layoutIconImageView];
  double v61 = v8;
  double rect = v9;
  double v65 = v7;
  double v66 = v10;
  if (v7 <= 0.00000011920929) {
    double v11 = v7;
  }
  else {
    double v11 = v7 + 11.0;
  }
  if (v7 <= 0.00000011920929) {
    double v12 = 0.0;
  }
  else {
    double v12 = 11.0;
  }
  [(SUUILockupMetadataView *)self->_metadataView frame];
  double left = self->_contentInsets.left;
  -[SUUILockupMetadataView sizeThatFits:](self->_metadataView, "sizeThatFits:", v5 - self->_contentInsets.right - left, 1.79769313e308);
  CGFloat v15 = v14;
  double v67 = v16;
  double v17 = v11 + v16;
  id v69 = [(SUUIItemCellLayout *)self itemOfferButton];
  BOOL v18 = [(SUUILockupItemCellLayout *)self _isItemOfferHidden];
  CGFloat v19 = *MEMORY[0x263F001A8];
  double v20 = *(double *)(MEMORY[0x263F001A8] + 16);
  double v21 = *(double *)(MEMORY[0x263F001A8] + 24);
  double v57 = v20;
  if (v18 || self->_itemOfferStyle)
  {
    [v69 setHidden:1];

    double v22 = self->_itemOfferTextLabel;
    if (v18)
    {
      double v23 = v15;
      id v69 = 0;
      double v58 = v19;
      double v59 = v21;
      double v64 = v20;
      double v24 = v20;
      double v25 = v12;
      goto LABEL_16;
    }
    id v69 = 0;
    double v58 = v19;
    double v59 = v21;
    double v64 = v20;
  }
  else
  {
    [v69 setHidden:0];
    [v69 frame];
    double v64 = v26;
    double v58 = self->_contentInsets.left;
    double v59 = v27;
    double v17 = v17 + v27 + 3.0;
    double v22 = self->_itemOfferTextLabel;
  }
  double v25 = v12;
  if (self->_itemOfferStyle == 2)
  {
    double v28 = [(SUUILockupItemCellLayout *)self _itemOfferTextLabel];

    [v28 setHidden:0];
    float v29 = [(SUUIItemCellLayout *)self itemOffer];
    double v30 = [v29 buttonText];
    [v28 setText:v30];

    [v28 frame];
    CGFloat v19 = self->_contentInsets.left;
    objc_msgSend(v28, "sizeThatFits:", *(double *)(MEMORY[0x263F00190] + 16), *(double *)(MEMORY[0x263F00190] + 24));
    double v63 = v31;
    double v60 = v32;
    double v17 = v17 + v32 + 3.0;
    goto LABEL_17;
  }
  double v23 = v15;
  double v24 = v57;
LABEL_16:
  [(UILabel *)v22 setHidden:1];

  double v28 = 0;
  double v63 = v24;
  double v60 = v21;
  CGFloat v15 = v23;
LABEL_17:
  double v33 = [(SUUIItemCellLayout *)self itemOfferNoticeLabel];
  if ([v33 isHidden])
  {

    double v33 = 0;
    goto LABEL_25;
  }
  if (v33)
  {
    [v33 frame];
    if (v69)
    {
      double v36 = 10.0;
      double v37 = v64;
LABEL_24:
      objc_msgSend(v33, "sizeThatFits:", v37 + v36, 1.79769313e308);
      double v57 = v38;
      double v21 = v39;
      goto LABEL_25;
    }
    double v57 = v34;
    if (v28)
    {
      double v36 = 10.0;
      double v37 = v63;
      goto LABEL_24;
    }
    double v21 = v35;
  }
LABEL_25:
  CGFloat v40 = v61;
  double v62 = v19;
  if (self->_verticalAlignment == 1)
  {
    float v41 = (v55 - v17) * 0.5;
    double rect = floorf(v41);
  }
  double v42 = v40;
  v71.origin.x = v40;
  v71.origin.y = rect;
  v71.size.double height = v65;
  v71.size.double width = v66;
  double v43 = v25 + CGRectGetMaxY(v71);
  v72.origin.x = left;
  v72.origin.y = v43;
  v72.size.double width = v15;
  v72.size.double height = v67;
  double v44 = CGRectGetMaxY(v72) + 3.0;
  double v56 = left;
  v73.origin.x = left;
  v73.origin.y = v43;
  v73.size.double width = v15;
  v73.size.double height = v67;
  double v45 = CGRectGetMaxY(v73) + 3.0;
  if (v33)
  {
    double v46 = v58;
    if (v69)
    {
      double v47 = v44;
    }
    else
    {
      double v46 = v62;
      double v47 = v45;
    }
    double v48 = v64;
    if (!v69) {
      double v48 = v63;
    }
    double v49 = v59;
    if (!v69) {
      double v49 = v60;
    }
    float v50 = (v48 - v57) * 0.5;
    objc_msgSend(v33, "setFrame:", v46 + floorf(v50), CGRectGetMaxY(*(CGRect *)&v46) + 3.0, v57, v21);
    float v51 = [(SUUILockupMetadataView *)self->_metadataView primaryTextColor];
    if (v51)
    {
      [v33 setTextColor:v51];
    }
    else
    {
      double v52 = [MEMORY[0x263F825C8] colorWithWhite:0.0 alpha:0.6];
      [v33 setTextColor:v52];
    }
  }
  v53 = [(SUUIItemCellLayout *)self iconImageView];
  objc_msgSend(v53, "setFrame:", v42, rect, v66, v65);

  objc_msgSend(v69, "setFrame:", v58, v44, v64, v59);
  objc_msgSend(v28, "setFrame:", v62, v45, v63, v60);
  [(SUUILockupMetadataView *)self->_metadataView frame];
  v75.origin.x = v56;
  v75.origin.y = v43;
  v75.size.double width = v54;
  v75.size.double height = v67;
  if (!CGRectEqualToRect(v74, v75))
  {
    -[SUUILockupMetadataView setFrame:](self->_metadataView, "setFrame:", v56, v43, v54, v67);
    [(SUUILockupMetadataView *)self->_metadataView setNeedsDisplay];
  }
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (CGSize)imageBoundingSize
{
  double width = self->_imageBoundingSize.width;
  double height = self->_imageBoundingSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (int64_t)itemOfferStyle
{
  return self->_itemOfferStyle;
}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (int64_t)lockupSize
{
  return self->_lockupSize;
}

- (void)setLockupSize:(int64_t)a3
{
  self->_lockupSize = a3;
}

- (BOOL)playsInlineVideo
{
  return self->_playsInlineVideo;
}

- (int64_t)verticalAlignment
{
  return self->_verticalAlignment;
}

- (CGSize)videoThumbnailSize
{
  double width = self->_videoThumbnailSize.width;
  double height = self->_videoThumbnailSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_videoThumbnailView, 0);
  objc_storeStrong((id *)&self->_metadataView, 0);
  objc_storeStrong((id *)&self->_itemOfferTextLabel, 0);
}

@end