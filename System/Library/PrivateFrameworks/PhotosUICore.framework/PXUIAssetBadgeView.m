@interface PXUIAssetBadgeView
+ (CGSize)sizeForBadgeInfo:(PXAssetBadgeInfo *)a3 contentWidth:(double)a4;
+ (double)preferredHeightForStyle:(int64_t)a3;
+ (id)badgeSizeCacheKeyValueFromBadgeInfo:(PXAssetBadgeInfo *)a3 contentWidth:(double)a4;
+ (id)measuringLabel;
+ (void)preloadResourcesForStyle:(int64_t)a3;
- (BOOL)_needsUpdate;
- (BOOL)_wantsBottomLabel;
- (BOOL)isOverContent;
- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4;
- (CGSize)bottomElementsPadding;
- (CGSize)intrinsicContentSize;
- (CGSize)sizeThatFits:(CGSize)a3;
- (PXAssetBadgeInfo)badgeInfo;
- (PXUIAssetBadgeView)initWithFrame:(CGRect)a3;
- (PXUIAssetBadgeViewDelegate)delegate;
- (double)contentWidth;
- (id)_updateTopGroup:(id)a3 withBadgeInfo:(PXAssetBadgeInfo *)a4;
- (int64_t)style;
- (void)_handleButton:(id)a3;
- (void)_invalidate;
- (void)_invalidateBackground;
- (void)_invalidateBottomLabel;
- (void)_invalidateBottomLeadingImage;
- (void)_invalidateBottomSpatialBadgeImage;
- (void)_invalidateBottomTrailingImage;
- (void)_invalidateContentSize;
- (void)_invalidateTopLeftElements;
- (void)_invalidateTopRightElements;
- (void)_layoutBottomCornersImages;
- (void)_layoutBottomLabel;
- (void)_layoutTopGroup:(id)a3;
- (void)_removeViewsFromGroup:(id)a3;
- (void)_setBackgroundImage:(id)a3;
- (void)_setNeedsUpdate;
- (void)_updateBackgroundIfNeeded;
- (void)_updateBottomLabelIfNeeded;
- (void)_updateBottomLeadingImageIfNeeded;
- (void)_updateBottomSpatialBadgeImageIfNeeded;
- (void)_updateBottomTrailingImageIfNeeded;
- (void)_updateContentSizeIfNeeded;
- (void)_updateIfNeeded;
- (void)_updateTopLeftElementsIfNeeded;
- (void)_updateTopRightElementsIfNeeded;
- (void)layoutSubviews;
- (void)performChanges:(id)a3 animated:(BOOL)a4;
- (void)prepareForReuse;
- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3;
- (void)setBottomElementsPadding:(CGSize)a3;
- (void)setContentWidth:(double)a3;
- (void)setDelegate:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setOverContent:(BOOL)a3;
- (void)setStyle:(int64_t)a3;
@end

@implementation PXUIAssetBadgeView

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_bottomLabel, 0);
  objc_storeStrong((id *)&self->_bottomTrailingImageView, 0);
  objc_storeStrong((id *)&self->_bottomSpatialBadgeImageView, 0);
  objc_storeStrong((id *)&self->_bottomLeadingImageView, 0);
  objc_storeStrong((id *)&self->_topRightGroup, 0);
  objc_storeStrong((id *)&self->_topLeftSecondaryGroup, 0);
  objc_storeStrong((id *)&self->_topLeftPrimaryGroup, 0);
}

- (void)setBottomElementsPadding:(CGSize)a3
{
  self->_bottomElementsPadding = a3;
}

- (CGSize)bottomElementsPadding
{
  double width = self->_bottomElementsPadding.width;
  double height = self->_bottomElementsPadding.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)contentWidth
{
  return self->_contentWidth;
}

- (BOOL)isOverContent
{
  return self->_overContent;
}

- (int64_t)style
{
  return self->_style;
}

- (PXAssetBadgeInfo)badgeInfo
{
  long long v3 = *(_OWORD *)&self[17].count;
  *(_OWORD *)&retstr->badges = *(_OWORD *)&self[17].badges;
  *(_OWORD *)&retstr->count = v3;
  return self;
}

- (PXUIAssetBadgeViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PXUIAssetBadgeViewDelegate *)WeakRetained;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y = a3.y;
  double x = a3.x;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  v20.receiver = self;
  v20.super_class = (Class)PXUIAssetBadgeView;
  if (-[PXUIAssetBadgeView pointInside:withEvent:](&v20, sel_pointInside_withEvent_, v7, x, y))
  {
    BOOL v8 = 1;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v9 = [(PXUIAssetBadgeView *)self subviews];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          -[PXUIAssetBadgeView convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
          if (objc_msgSend(v14, "pointInside:withEvent:", v7))
          {
            BOOL v8 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    BOOL v8 = 0;
LABEL_13:
  }
  return v8;
}

- (void)_updateContentSizeIfNeeded
{
  if (self->_needsUpdateFlags.contentSize)
  {
    self->_needsUpdateFlags.contentSize = 0;
    CGFloat v3 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    topLeftPrimaryGroup = self->_topLeftPrimaryGroup;
    if (topLeftPrimaryGroup)
    {
      [(_PXUIAssetBadgeTopGroup *)topLeftPrimaryGroup badgeInfo];
      PXAssetBadgeInfoIsNull();
    }
    topLeftSecondaryGroup = self->_topLeftSecondaryGroup;
    if (topLeftSecondaryGroup)
    {
      [(_PXUIAssetBadgeTopGroup *)topLeftSecondaryGroup badgeInfo];
      PXAssetBadgeInfoIsNull();
    }
    topRightGroup = self->_topRightGroup;
    if (topRightGroup)
    {
      [(_PXUIAssetBadgeTopGroup *)topRightGroup badgeInfo];
      PXAssetBadgeInfoIsNull();
    }
    self->_contentSize.double width = *(CGFloat *)(MEMORY[0x1E4F1DB28] + 16);
    self->_contentSize.double height = v3;
  }
}

- (void)_invalidateContentSize
{
  self->_needsUpdateFlags.contentSize = 1;
  [(PXUIAssetBadgeView *)self _setNeedsUpdate];
}

- (void)_updateBackgroundIfNeeded
{
  if (self->_needsUpdateFlags.background)
  {
    self->_needsUpdateFlags.background = 0;
    [(PXUIAssetBadgeView *)self badgeInfo];
    int64_t v3 = [(PXUIAssetBadgeView *)self style];
    if (v3 == 7 || v3 == 1)
    {
      v4 = +[PXAssetVariationsSettings sharedInstance];
      [v4 showLoopBadges];
    }
    [(PXUIAssetBadgeView *)self _setBackgroundImage:0];
  }
}

- (void)_invalidateBackground
{
  self->_needsUpdateFlags.background = 1;
  [(PXUIAssetBadgeView *)self _setNeedsUpdate];
}

- (void)_updateBottomLabelIfNeeded
{
  if (self->_needsUpdateFlags.bottomLabel)
  {
    self->_needsUpdateFlags.bottomLabel = 0;
    if ([(PXUIAssetBadgeView *)self _wantsBottomLabel])
    {
      if (!self->_bottomLabel)
      {
        int64_t v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
        bottomLabel = self->_bottomLabel;
        self->_bottomLabel = v3;

        v5 = self->_bottomLabel;
        v6 = [MEMORY[0x1E4FB1618] clearColor];
        [(UILabel *)v5 setBackgroundColor:v6];

        id v7 = self->_bottomLabel;
        BOOL v8 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:12.0];
        [(UILabel *)v7 setFont:v8];

        v9 = self->_bottomLabel;
        uint64_t v10 = [MEMORY[0x1E4FB1618] whiteColor];
        [(UILabel *)v9 setTextColor:v10];

        [(UILabel *)self->_bottomLabel setTextAlignment:4];
        [(PXUIAssetBadgeView *)self addSubview:self->_bottomLabel];
      }
      [(PXUIAssetBadgeView *)self badgeInfo];
      PXLocalizedVideoDuration();
    }
    [(UILabel *)self->_bottomLabel setHidden:[(PXUIAssetBadgeView *)self _wantsBottomLabel] ^ 1];
  }
}

- (void)_invalidateBottomLabel
{
  self->_needsUpdateFlags.bottomLabel = 1;
  [(PXUIAssetBadgeView *)self _setNeedsUpdate];
}

- (void)_updateBottomTrailingImageIfNeeded
{
  if (self->_needsUpdateFlags.bottomTrailingImage)
  {
    self->_needsUpdateFlags.bottomTrailingImage = 0;
    if ([(PXUIAssetBadgeView *)self _wantsBottomLabel]) {
      goto LABEL_11;
    }
    int64_t v3 = [(PXUIAssetBadgeView *)self style];
    if (v3 != 7 && v3 != 1) {
      goto LABEL_11;
    }
    [(PXUIAssetBadgeView *)self badgeInfo];
    if ((v10 & 0x180) != 0)
    {
      v4 = +[PXAssetVariationsSettings sharedInstance];
      int v5 = [v4 showLoopBadges];

      if (v5)
      {
        uint64_t v6 = +[PXBadgeHelper loopingBadgeImage];
        goto LABEL_17;
      }
    }
    if ((v10 & 2) != 0)
    {
      uint64_t v6 = +[PXBadgeHelper panoramaBadgeImage];
    }
    else if ((v10 & 0x20) != 0)
    {
      uint64_t v6 = +[PXBadgeHelper cloudBadgeImage];
    }
    else
    {
      if ((v10 & 0x80000000) == 0)
      {
LABEL_11:
        id v7 = 0;
LABEL_12:
        [(_PXUIAssetBadgeImageView *)self->_bottomTrailingImageView setImage:v7];

        return;
      }
      uint64_t v6 = +[PXBadgeHelper contentSyndicationBadgeImage];
    }
LABEL_17:
    id v7 = (void *)v6;
    if (v6)
    {
      if (!self->_bottomTrailingImageView)
      {
        BOOL v8 = objc_alloc_init(_PXUIAssetBadgeImageView);
        bottomTrailingImageView = self->_bottomTrailingImageView;
        self->_bottomTrailingImageView = v8;

        [(PXUIAssetBadgeView *)self addSubview:self->_bottomTrailingImageView];
      }
    }
    goto LABEL_12;
  }
}

- (void)_invalidateBottomTrailingImage
{
  self->_needsUpdateFlags.bottomTrailingImage = 1;
  [(PXUIAssetBadgeView *)self _setNeedsUpdate];
}

- (void)_updateBottomSpatialBadgeImageIfNeeded
{
  if (self->_needsUpdateFlags.bottomSpatialBadgeImage)
  {
    self->_needsUpdateFlags.bottomSpatialBadgeImage = 0;
    [(PXUIAssetBadgeView *)self badgeInfo];
    if ((v6 & 2) != 0 && [(PXUIAssetBadgeView *)self style] == 1)
    {
      int64_t v3 = +[PXBadgeHelper(iOS) spatialBadgeImage];
      if (v3)
      {
        if (!self->_bottomSpatialBadgeImageView)
        {
          v4 = objc_alloc_init(_PXUIAssetBadgeImageView);
          bottomSpatialBadgeImageView = self->_bottomSpatialBadgeImageView;
          self->_bottomSpatialBadgeImageView = v4;

          [(PXUIAssetBadgeView *)self addSubview:self->_bottomSpatialBadgeImageView];
        }
      }
    }
    else
    {
      int64_t v3 = 0;
    }
    [(_PXUIAssetBadgeImageView *)self->_bottomSpatialBadgeImageView setImage:v3];
    [(_PXUIAssetBadgeImageView *)self->_bottomSpatialBadgeImageView sizeToFit];
  }
}

- (void)_updateBottomLeadingImageIfNeeded
{
  if (self->_needsUpdateFlags.bottomLeadingImage)
  {
    self->_needsUpdateFlags.bottomLeadingImage = 0;
    [(PXUIAssetBadgeView *)self badgeInfo];
    if (v8)
    {
      int64_t v3 = [(PXUIAssetBadgeView *)self style];
      if (v3 == 2)
      {
        uint64_t v4 = +[PXBadgeHelper favoritesCollectionBadgeImage];
LABEL_10:
        int v5 = (void *)v4;
        if (v4)
        {
          if (!self->_bottomLeadingImageView)
          {
            char v6 = objc_alloc_init(_PXUIAssetBadgeImageView);
            bottomLeadingImageView = self->_bottomLeadingImageView;
            self->_bottomLeadingImageView = v6;

            [(PXUIAssetBadgeView *)self addSubview:self->_bottomLeadingImageView];
          }
        }
        goto LABEL_7;
      }
      if (v3 == 1)
      {
        uint64_t v4 = +[PXBadgeHelper favoriteBadgeImage];
        goto LABEL_10;
      }
    }
    int v5 = 0;
LABEL_7:
    [(_PXUIAssetBadgeImageView *)self->_bottomLeadingImageView setImage:v5];
  }
}

- (void)_invalidateBottomSpatialBadgeImage
{
  self->_needsUpdateFlags.bottomSpatialBadgeImage = 1;
  [(PXUIAssetBadgeView *)self _setNeedsUpdate];
}

- (void)_invalidateBottomLeadingImage
{
  self->_needsUpdateFlags.bottomLeadingImage = 1;
  [(PXUIAssetBadgeView *)self _setNeedsUpdate];
}

- (id)_updateTopGroup:(id)a3 withBadgeInfo:(PXAssetBadgeInfo *)a4
{
  a3;
  int64_t v6 = [(PXUIAssetBadgeView *)self style];
  BOOL v7 = [(PXUIAssetBadgeView *)self isOverContent];
  if ((unint64_t)(v6 - 3) <= 3)
  {
    long long v8 = *(_OWORD *)&a4->count;
    long long v12 = *(_OWORD *)&a4->badges;
    long long v13 = v8;
    +[PXBadgeHelper imageForBadgeInfo:&v12 style:v6 isOverContent:v7];
    objc_claimAutoreleasedReturnValue();
    long long v9 = *(_OWORD *)&a4->count;
    long long v12 = *(_OWORD *)&a4->badges;
    long long v13 = v9;
    +[PXBadgeHelper textForBadgeInfo:&v12 style:v6];
    objc_claimAutoreleasedReturnValue();
  }
  long long v10 = *(_OWORD *)&a4->count;
  long long v12 = *(_OWORD *)&a4->badges;
  long long v13 = v10;
  PXAssetBadgeInfoIsToggleable();
}

- (void)_updateTopRightElementsIfNeeded
{
  if (self->_needsUpdateFlags.topRightElements)
  {
    self->_needsUpdateFlags.topRightElements = 0;
    long long v13 = 0u;
    long long v14 = 0u;
    [(PXUIAssetBadgeView *)self badgeInfo];
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = v13;
    long long v10 = v14;
    +[PXBadgeHelper topRightBadgeInfoForBadgeInfo:&v9];
    topRightGroup = self->_topRightGroup;
    long long v9 = v11;
    long long v10 = v12;
    uint64_t v4 = [(PXUIAssetBadgeView *)self _updateTopGroup:topRightGroup withBadgeInfo:&v9];
    double contentWidth = self->_contentWidth;
    [(_PXUIAssetBadgeTopGroup *)v4 frame];
    CGFloat v7 = contentWidth - v6;
    [(_PXUIAssetBadgeTopGroup *)v4 frame];
    CGRect v16 = CGRectOffset(v15, v7, 0.0);
    -[_PXUIAssetBadgeTopGroup setFrame:](v4, "setFrame:", v16.origin.x, v16.origin.y, v16.size.width, v16.size.height);
    [(_PXUIAssetBadgeTopGroup *)v4 imageFrame];
    CGRect v18 = CGRectOffset(v17, v7, 0.0);
    -[_PXUIAssetBadgeTopGroup setImageFrame:](v4, "setImageFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
    [(_PXUIAssetBadgeTopGroup *)v4 labelFrame];
    CGRect v20 = CGRectOffset(v19, v7, 0.0);
    -[_PXUIAssetBadgeTopGroup setLabelFrame:](v4, "setLabelFrame:", v20.origin.x, v20.origin.y, v20.size.width, v20.size.height);
    [(_PXUIAssetBadgeTopGroup *)v4 chevronImageFrame];
    CGRect v22 = CGRectOffset(v21, v7, 0.0);
    -[_PXUIAssetBadgeTopGroup setChevronImageFrame:](v4, "setChevronImageFrame:", v22.origin.x, v22.origin.y, v22.size.width, v22.size.height);
    long long v8 = self->_topRightGroup;
    self->_topRightGroup = v4;
  }
}

- (void)_updateTopLeftElementsIfNeeded
{
  if (self->_needsUpdateFlags.topLeftElements)
  {
    self->_needsUpdateFlags.topLeftElements = 0;
    long long v16 = 0u;
    long long v17 = 0u;
    [(PXUIAssetBadgeView *)self badgeInfo];
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = v16;
    long long v13 = v17;
    +[PXBadgeHelper topLeftPrimaryBadgeInfoForBadgeInfo:&v12];
    long long v12 = 0u;
    long long v13 = 0u;
    long long v10 = v16;
    long long v11 = v17;
    +[PXBadgeHelper topLeftSecondaryBadgeInfoForBadgeInfo:&v10];
    topLeftPrimaryGroup = self->_topLeftPrimaryGroup;
    long long v10 = v14;
    long long v11 = v15;
    uint64_t v4 = [(PXUIAssetBadgeView *)self _updateTopGroup:topLeftPrimaryGroup withBadgeInfo:&v10];
    topLeftSecondaryGroup = self->_topLeftSecondaryGroup;
    long long v10 = v12;
    long long v11 = v13;
    double v6 = [(PXUIAssetBadgeView *)self _updateTopGroup:topLeftSecondaryGroup withBadgeInfo:&v10];
    if (v4)
    {
      long long v10 = v14;
      long long v11 = v15;
      PXAssetBadgeInfoIsNull();
    }
    CGFloat v7 = self->_topLeftPrimaryGroup;
    self->_topLeftPrimaryGroup = 0;
    id v8 = 0;

    long long v9 = self->_topLeftSecondaryGroup;
    self->_topLeftSecondaryGroup = v6;
  }
}

- (void)_invalidateTopRightElements
{
  self->_needsUpdateFlags.topRightElements = 1;
  [(PXUIAssetBadgeView *)self _setNeedsUpdate];
}

- (void)_invalidateTopLeftElements
{
  self->_needsUpdateFlags.topLeftElements = 1;
  [(PXUIAssetBadgeView *)self _setNeedsUpdate];
}

- (void)_invalidate
{
  [(PXUIAssetBadgeView *)self _invalidateTopLeftElements];
  [(PXUIAssetBadgeView *)self _invalidateTopRightElements];
  [(PXUIAssetBadgeView *)self _invalidateBottomLeadingImage];
  [(PXUIAssetBadgeView *)self _invalidateBottomSpatialBadgeImage];
  [(PXUIAssetBadgeView *)self _invalidateBottomTrailingImage];
  [(PXUIAssetBadgeView *)self _invalidateBottomLabel];
  [(PXUIAssetBadgeView *)self _invalidateBackground];
  [(PXUIAssetBadgeView *)self _invalidateContentSize];
}

- (void)_updateIfNeeded
{
  if ([(PXUIAssetBadgeView *)self _needsUpdate])
  {
    BOOL isPerformingUpdate = self->_isPerformingUpdate;
    self->_BOOL isPerformingUpdate = 1;
    [(PXUIAssetBadgeView *)self _updateTopLeftElementsIfNeeded];
    [(PXUIAssetBadgeView *)self _updateTopRightElementsIfNeeded];
    [(PXUIAssetBadgeView *)self _updateBottomLeadingImageIfNeeded];
    [(PXUIAssetBadgeView *)self _updateBottomSpatialBadgeImageIfNeeded];
    [(PXUIAssetBadgeView *)self _updateBottomTrailingImageIfNeeded];
    [(PXUIAssetBadgeView *)self _updateBottomLabelIfNeeded];
    [(PXUIAssetBadgeView *)self _updateBackgroundIfNeeded];
    [(PXUIAssetBadgeView *)self _updateContentSizeIfNeeded];
    self->_BOOL isPerformingUpdate = isPerformingUpdate;
  }
}

- (void)_setNeedsUpdate
{
  if (!self->_isPerformingUpdate) {
    [(PXUIAssetBadgeView *)self setNeedsLayout];
  }
}

- (BOOL)_needsUpdate
{
  return self->_needsUpdateFlags.topLeftElements
      || self->_needsUpdateFlags.topRightElements
      || self->_needsUpdateFlags.bottomLeadingImage
      || self->_needsUpdateFlags.bottomSpatialBadgeImage
      || self->_needsUpdateFlags.bottomTrailingImage
      || self->_needsUpdateFlags.bottomLabel
      || self->_needsUpdateFlags.background
      || self->_needsUpdateFlags.contentSize;
}

- (void)_setBackgroundImage:(id)a3
{
  id v4 = a3;
  int v5 = [(PXUIAssetBadgeView *)self layer];
  double v6 = v5;
  if (v4) {
    [v5 setContentsGravity:@"resize"];
  }
  id v7 = v4;
  objc_msgSend(v6, "setContents:", objc_msgSend(v7, "CGImage"));
}

- (void)_handleButton:(id)a3
{
  id v4 = a3;
  id v5 = [(_PXUIAssetBadgeTopGroup *)self->_topLeftPrimaryGroup button];

  if (v5 == v4)
  {
    topLeftPrimaryGroup = self->_topLeftPrimaryGroup;
    if (topLeftPrimaryGroup)
    {
      [(_PXUIAssetBadgeTopGroup *)topLeftPrimaryGroup badgeInfo];
      uint64_t v8 = v20;
    }
    else
    {
      uint64_t v8 = 0;
      long long v20 = 0u;
      long long v21 = 0u;
    }
  }
  else
  {
    id v6 = [(_PXUIAssetBadgeTopGroup *)self->_topLeftSecondaryGroup button];

    if (v6 == v4)
    {
      topLeftSecondaryGroup = self->_topLeftSecondaryGroup;
      if (topLeftSecondaryGroup)
      {
        [(_PXUIAssetBadgeTopGroup *)topLeftSecondaryGroup badgeInfo];
        uint64_t v8 = v18;
      }
      else
      {
        uint64_t v8 = 0;
        long long v18 = 0u;
        long long v19 = 0u;
      }
    }
    else
    {
      id v7 = [(_PXUIAssetBadgeTopGroup *)self->_topRightGroup button];

      if (v7 == v4)
      {
        topRightGroup = self->_topRightGroup;
        if (topRightGroup)
        {
          [(_PXUIAssetBadgeTopGroup *)topRightGroup badgeInfo];
          uint64_t v8 = v16;
        }
        else
        {
          uint64_t v8 = 0;
          long long v16 = 0u;
          long long v17 = 0u;
        }
      }
      else
      {
        uint64_t v8 = 0;
      }
    }
  }
  if (self->_delegateRespondsTo.userDidSelectBadges)
  {
    long long v12 = [(PXUIAssetBadgeView *)self delegate];
    [v12 assetBadgeView:self userDidSelectBadges:v8];
  }
  if (self->_delegateRespondsTo.dismissPresentedViewController)
  {
    long long v13 = [(PXUIAssetBadgeView *)self delegate];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__PXUIAssetBadgeView__handleButton___block_invoke;
    v14[3] = &unk_1E5DD36F8;
    id v15 = v4;
    [v13 assetBadgeView:self dismissAnyPresentedViewControllerWithCompletion:v14];
  }
}

void __36__PXUIAssetBadgeView__handleButton___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) contextMenuInteraction];
  objc_msgSend(v1, "_presentMenuAtLocation:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
}

- (CGSize)intrinsicContentSize
{
  -[PXUIAssetBadgeView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E4F1DB30], *(double *)(MEMORY[0x1E4F1DB30] + 8));
  result.double height = v3;
  result.double width = v2;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  [(PXUIAssetBadgeView *)self _updateIfNeeded];
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)_layoutBottomLabel
{
  bottomLabel = self->_bottomLabel;
  if (bottomLabel && ([(UILabel *)bottomLabel isHidden] & 1) == 0)
  {
    double width = self->_bottomElementsPadding.width;
    double rect_8 = self->_bottomElementsPadding.height + -2.0;
    [(PXUIAssetBadgeView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    [(UILabel *)self->_bottomLabel frame];
    CGFloat rect = v13;
    CGFloat v15 = v14;
    double v17 = v16;
    double v19 = v18;
    if ([(PXUIAssetBadgeView *)self style] == 7
      || ([(PXUIAssetBadgeView *)self _shouldReverseLayoutDirection] & 1) != 0)
    {
      v28.origin.double x = v6;
      v28.origin.double y = v8;
      v28.size.double width = v10;
      v28.size.double height = v12;
      double v20 = width + CGRectGetMinX(v28);
    }
    else
    {
      v29.origin.double x = v6;
      v29.origin.double y = v8;
      v29.size.double width = v10;
      v29.size.double height = v12;
      CGFloat v21 = CGRectGetMaxX(v29) - width;
      v30.origin.double x = rect;
      v30.origin.double y = v15;
      v30.size.double width = v17;
      v30.size.double height = v19;
      double v20 = v21 - CGRectGetWidth(v30);
    }
    v31.origin.double x = v6;
    v31.origin.double y = v8;
    v31.size.double width = v10;
    v31.size.double height = v12;
    double v22 = CGRectGetMaxY(v31) - rect_8;
    v32.origin.double x = v20;
    v32.origin.double y = v15;
    v32.size.double width = v17;
    v32.size.double height = v19;
    double Height = CGRectGetHeight(v32);
    v24 = self->_bottomLabel;
    -[UILabel setFrame:](v24, "setFrame:", v20, v22 - Height, v17, v19);
  }
}

- (void)_layoutBottomCornersImages
{
  id v54 = [(_PXUIAssetBadgeImageView *)self->_bottomLeadingImageView image];
  double v3 = [(_PXUIAssetBadgeImageView *)self->_bottomSpatialBadgeImageView image];
  id v4 = [(_PXUIAssetBadgeImageView *)self->_bottomTrailingImageView image];
  if (v54) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v4 == 0;
  }
  if (!v5 || v3 != 0)
  {
    double width = self->_bottomElementsPadding.width;
    double height = self->_bottomElementsPadding.height;
    [(PXUIAssetBadgeView *)self bounds];
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    char v15 = [(PXUIAssetBadgeView *)self _shouldReverseLayoutDirection];
    double v16 = (CGFloat *)MEMORY[0x1E4F1DB28];
    double v53 = v8;
    if (v54)
    {
      CGFloat v17 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
      [v54 size];
      double v19 = v18;
      double v21 = v20;
      if (v15)
      {
        CGFloat v22 = *v16;
        v56.origin.double x = v8;
        v56.origin.double y = v10;
        v56.size.double width = v12;
        v56.size.double height = v14;
        CGFloat v23 = CGRectGetMaxX(v56) - width;
        v57.origin.double x = v22;
        v57.origin.double y = v17;
        v57.size.double width = v19;
        v57.size.double height = v21;
        double v24 = v23 - CGRectGetWidth(v57);
        CGFloat v8 = v53;
      }
      else
      {
        v58.origin.double x = v8;
        v58.origin.double y = v10;
        v58.size.double width = v12;
        v58.size.double height = v14;
        double v24 = width + CGRectGetMinX(v58);
      }
      v59.origin.double x = v8;
      v59.origin.double y = v10;
      v59.size.double width = v12;
      v59.size.double height = v14;
      CGFloat v25 = CGRectGetMaxY(v59) - height;
      v60.origin.double x = v24;
      v60.origin.double y = v17;
      v60.size.double width = v19;
      v60.size.double height = v21;
      CGFloat v26 = v25 - CGRectGetHeight(v60);
      CGFloat v8 = v53;
      -[_PXUIAssetBadgeImageView setFrame:](self->_bottomLeadingImageView, "setFrame:", v24, v26, v19, v21);
    }
    if (v3)
    {
      CGFloat v27 = v16[1];
      [v3 size];
      double v29 = v28;
      double v31 = v30;
      if (v15)
      {
        CGFloat v32 = *v16;
        v61.origin.double x = v8;
        v61.origin.double y = v10;
        v61.size.double width = v12;
        v61.size.double height = v14;
        CGFloat v33 = CGRectGetMaxX(v61) - width;
        [(_PXUIAssetBadgeImageView *)self->_bottomLeadingImageView frame];
        CGFloat v35 = v33 - v34;
        v62.origin.double x = v32;
        v62.origin.double y = v27;
        v62.size.double width = v29;
        v62.size.double height = v31;
        double v36 = v35 - CGRectGetWidth(v62);
        CGFloat v8 = v53;
      }
      else
      {
        v63.origin.double x = v8;
        v63.origin.double y = v10;
        v63.size.double width = v12;
        v63.size.double height = v14;
        double MinX = CGRectGetMinX(v63);
        [(_PXUIAssetBadgeImageView *)self->_bottomLeadingImageView frame];
        double v36 = width + MinX + v38;
      }
      v64.origin.double x = v8;
      v64.origin.double y = v10;
      v64.size.double width = v12;
      v64.size.double height = v14;
      CGFloat v39 = CGRectGetMaxY(v64) - height;
      v65.origin.double x = v36;
      v65.origin.double y = v27;
      v65.size.double width = v29;
      v65.size.double height = v31;
      CGFloat v40 = v39 - CGRectGetHeight(v65);
      CGFloat v8 = v53;
      -[_PXUIAssetBadgeImageView setFrame:](self->_bottomSpatialBadgeImageView, "setFrame:", v36, v40, v29, v31);
    }
    if (v4)
    {
      CGFloat v41 = v16[1];
      [v4 size];
      double v43 = v42;
      double v45 = v44;
      if ([(PXUIAssetBadgeView *)self style] == 7
        || ([(PXUIAssetBadgeView *)self _shouldReverseLayoutDirection] & 1) != 0)
      {
        v66.origin.double x = v8;
        v66.origin.double y = v10;
        v66.size.double width = v12;
        v66.size.double height = v14;
        double v46 = width + CGRectGetMinX(v66);
      }
      else
      {
        CGFloat v47 = *v16;
        v67.origin.double x = v8;
        v67.origin.double y = v10;
        v67.size.double width = v12;
        v67.size.double height = v14;
        CGFloat v48 = CGRectGetMaxX(v67) - width;
        v68.origin.double x = v47;
        v68.origin.double y = v41;
        v68.size.double width = v43;
        v68.size.double height = v45;
        CGFloat v49 = v48 - CGRectGetWidth(v68);
        CGFloat v8 = v53;
        double v46 = v49 + -2.0;
      }
      v69.origin.double x = v8;
      v69.origin.double y = v10;
      v69.size.double width = v12;
      v69.size.double height = v14;
      CGFloat v50 = CGRectGetMaxY(v69) - height;
      v70.origin.double x = v46;
      v70.origin.double y = v41;
      v70.size.double width = v43;
      v70.size.double height = v45;
      -[_PXUIAssetBadgeImageView setFrame:](self->_bottomTrailingImageView, "setFrame:", v46, v50 - CGRectGetHeight(v70) + -4.0, v43, v45);
    }
  }
}

- (void)_removeViewsFromGroup:(id)a3
{
  if (a3)
  {
    id v8 = a3;
    double v3 = [v8 backgroundView];
    [v3 removeFromSuperview];

    [v8 setBackgroundView:0];
    id v4 = [v8 button];
    [v4 removeFromSuperview];

    [v8 setButton:0];
    BOOL v5 = [v8 imageView];
    [v5 removeFromSuperview];

    [v8 setImageView:0];
    CGFloat v6 = [v8 chevronImageView];
    [v6 removeFromSuperview];

    [v8 setChevronImageView:0];
    double v7 = [v8 label];
    [v7 removeFromSuperview];

    [v8 setLabel:0];
  }
}

- (void)_layoutTopGroup:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    [v3 frame];
    double v5 = v4;
    double v7 = v6;
    double v9 = v8;
    double v11 = v10;
    CGFloat v12 = [v3 backgroundView];
    objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

    double v13 = [v3 button];
    objc_msgSend(v13, "setFrame:", v5, v7, v9, v11);

    CGFloat v14 = [v3 imageView];
    [v3 imageFrame];
    objc_msgSend(v14, "setFrame:");

    char v15 = [v3 chevronImageView];
    [v3 chevronImageFrame];
    objc_msgSend(v15, "setFrame:");

    id v24 = [v3 label];
    [v3 labelFrame];
    double v17 = v16;
    double v19 = v18;
    double v21 = v20;
    double v23 = v22;

    objc_msgSend(v24, "setFrame:", v17, v19, v21, v23);
  }
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)PXUIAssetBadgeView;
  [(PXUIAssetBadgeView *)&v3 layoutSubviews];
  [(PXUIAssetBadgeView *)self _updateIfNeeded];
  [(PXUIAssetBadgeView *)self _layoutTopGroup:self->_topLeftPrimaryGroup];
  [(PXUIAssetBadgeView *)self _layoutTopGroup:self->_topLeftSecondaryGroup];
  [(PXUIAssetBadgeView *)self _layoutTopGroup:self->_topRightGroup];
  [(PXUIAssetBadgeView *)self _layoutBottomCornersImages];
  [(PXUIAssetBadgeView *)self _layoutBottomLabel];
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  [(PXUIAssetBadgeView *)self frame];
  v14.origin.double x = v8;
  v14.origin.double y = v9;
  v14.size.double width = v10;
  v14.size.double height = v11;
  v13.origin.double x = x;
  v13.origin.double y = y;
  v13.size.double width = width;
  v13.size.double height = height;
  if (!CGRectEqualToRect(v13, v14))
  {
    v12.receiver = self;
    v12.super_class = (Class)PXUIAssetBadgeView;
    -[PXUIAssetBadgeView setFrame:](&v12, sel_setFrame_, x, y, width, height);
    [(PXUIAssetBadgeView *)self layoutIfNeeded];
  }
}

- (void)performChanges:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  double v6 = (void (**)(void))a3;
  double v7 = v6;
  if (v6)
  {
    if (v4)
    {
      CGFloat v8 = (void *)MEMORY[0x1E4FB1EB0];
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __46__PXUIAssetBadgeView_performChanges_animated___block_invoke;
      v9[3] = &unk_1E5DD3280;
      v9[4] = self;
      CGFloat v10 = v6;
      [v8 transitionWithView:self duration:5242886 options:v9 animations:0 completion:0.3];
    }
    else
    {
      v6[2](v6);
    }
  }
}

uint64_t __46__PXUIAssetBadgeView_performChanges_animated___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  double v2 = *(void **)(a1 + 32);
  return [v2 layoutIfNeeded];
}

- (BOOL)_wantsBottomLabel
{
  [(PXUIAssetBadgeView *)self badgeInfo];
  return v3 > 0.0;
}

- (void)setContentWidth:(double)a3
{
  if (self->_contentWidth != a3)
  {
    self->_double contentWidth = a3;
    [(PXUIAssetBadgeView *)self _invalidate];
  }
}

- (void)setOverContent:(BOOL)a3
{
  if (self->_overContent != a3)
  {
    self->_overContent = a3;
    [(PXUIAssetBadgeView *)self _invalidate];
  }
}

- (void)setStyle:(int64_t)a3
{
  if (self->_style != a3)
  {
    self->_style = a3;
    [(PXUIAssetBadgeView *)self _invalidate];
  }
}

- (void)setBadgeInfo:(PXAssetBadgeInfo *)a3
{
}

- (void)prepareForReuse
{
  [(PXUIAssetBadgeView *)self _removeViewsFromGroup:self->_topLeftPrimaryGroup];
  [(PXUIAssetBadgeView *)self _removeViewsFromGroup:self->_topLeftSecondaryGroup];
  [(PXUIAssetBadgeView *)self _removeViewsFromGroup:self->_topRightGroup];
  [(PXUIAssetBadgeView *)self _invalidate];
}

- (void)setDelegate:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_delegate, obj);
    p_delegateRespondsTo = &self->_delegateRespondsTo;
    p_delegateRespondsTo->menuForBadges = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->userDidSelectBadges = objc_opt_respondsToSelector() & 1;
    p_delegateRespondsTo->dismissPresentedViewController = objc_opt_respondsToSelector() & 1;
  }
}

- (PXUIAssetBadgeView)initWithFrame:(CGRect)a3
{
  v12.receiver = self;
  v12.super_class = (Class)PXUIAssetBadgeView;
  double v3 = -[PXUIAssetBadgeView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  BOOL v4 = v3;
  if (v3)
  {
    double v5 = [(PXUIAssetBadgeView *)v3 layer];
    [v5 setAllowsGroupBlending:0];
    [v5 setAllowsGroupOpacity:0];
    __asm { FMOV            V0.2D, #5.0 }
    v4->_bottomElementsPadding = _Q0;
  }
  return v4;
}

+ (CGSize)sizeForBadgeInfo:(PXAssetBadgeInfo *)a3 contentWidth:(double)a4
{
  long long v4 = *(_OWORD *)&a3->count;
  long long v5 = *(_OWORD *)&a3->badges;
  long long v6 = v4;
  PXAssetBadgeInfoIsNull();
}

uint64_t __52__PXUIAssetBadgeView_sizeForBadgeInfo_contentWidth___block_invoke_3(uint64_t a1)
{
  long long v2 = *(_OWORD *)(a1 + 48);
  v4[0] = *(_OWORD *)(a1 + 32);
  v4[1] = v2;
  [(id)sizeForBadgeInfo_contentWidth__measuringBadgeView setBadgeInfo:v4];
  [(id)sizeForBadgeInfo_contentWidth__measuringBadgeView setStyle:3];
  [(id)sizeForBadgeInfo_contentWidth__measuringBadgeView setOverContent:0];
  return [(id)sizeForBadgeInfo_contentWidth__measuringBadgeView setContentWidth:*(double *)(a1 + 64)];
}

void __52__PXUIAssetBadgeView_sizeForBadgeInfo_contentWidth___block_invoke_2()
{
  v0 = [PXUIAssetBadgeView alloc];
  uint64_t v1 = -[PXUIAssetBadgeView initWithFrame:](v0, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  long long v2 = (void *)sizeForBadgeInfo_contentWidth__measuringBadgeView;
  sizeForBadgeInfo_contentWidth__measuringBadgeView = v1;
}

uint64_t __52__PXUIAssetBadgeView_sizeForBadgeInfo_contentWidth___block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F1C998]);
  uint64_t v1 = (void *)sizeForBadgeInfo_contentWidth__sizeCache;
  sizeForBadgeInfo_contentWidth__sizeCache = (uint64_t)v0;

  long long v2 = (void *)sizeForBadgeInfo_contentWidth__sizeCache;
  return [v2 setCountLimit:42];
}

+ (id)badgeSizeCacheKeyValueFromBadgeInfo:(PXAssetBadgeInfo *)a3 contentWidth:(double)a4
{
  v6[0] = a3->badges;
  v6[1] = *(void *)&a3->duration;
  v6[2] = a3->count;
  *(double *)&v6[3] = a4;
  long long v4 = (void *)[objc_alloc(MEMORY[0x1E4F29238]) initWithBytes:v6 objCType:"{_PXBadgeSizeCacheKey=Qdqd}"];
  return v4;
}

+ (id)measuringLabel
{
  if (measuringLabel_onceToken != -1) {
    dispatch_once(&measuringLabel_onceToken, &__block_literal_global_216_292743);
  }
  long long v2 = (void *)measuringLabel_measuringLabel;
  return v2;
}

void __36__PXUIAssetBadgeView_measuringLabel__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4FB1930]);
  uint64_t v1 = (void *)measuringLabel_measuringLabel;
  measuringLabel_measuringLabel = (uint64_t)v0;

  PXAssetBadgeInfoCreateWithBadges();
}

+ (double)preferredHeightForStyle:(int64_t)a3
{
  double result = 0.0;
  if ((unint64_t)(a3 - 1) <= 6) {
    return dbl_1AB35D2D8[a3 - 1];
  }
  return result;
}

+ (void)preloadResourcesForStyle:(int64_t)a3
{
  if ((unint64_t)(a3 - 3) <= 2 && preloadResourcesForStyle__onceToken != -1) {
    dispatch_once(&preloadResourcesForStyle__onceToken, &__block_literal_global_292745);
  }
  if (a3 == 7)
  {
    if (preloadResourcesForStyle__onceToken_210 == -1) {
      return;
    }
    long long v4 = &preloadResourcesForStyle__onceToken_210;
    long long v5 = &__block_literal_global_212_292748;
  }
  else if (a3 == 6)
  {
    if (preloadResourcesForStyle__onceToken_205 == -1) {
      return;
    }
    long long v4 = &preloadResourcesForStyle__onceToken_205;
    long long v5 = &__block_literal_global_207_292747;
  }
  else
  {
    if (a3 != 1 || preloadResourcesForStyle__onceToken_196 == -1) {
      return;
    }
    long long v4 = &preloadResourcesForStyle__onceToken_196;
    long long v5 = &__block_literal_global_198_292746;
  }
  dispatch_once(v4, v5);
}

void __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_10()
{
  id v0 = +[PXPreloadScheduler sharedScheduler];
  [v0 scheduleMainQueueTask:&__block_literal_global_214_292751];
}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_11()
{
  return +[PXBadgeHelper gradientImage];
}

void __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_8()
{
  id v0 = +[PXPreloadScheduler sharedScheduler];
  [v0 scheduleMainQueueTask:&__block_literal_global_209_292754];
}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_9()
{
  return +[PXBadgeHelper livePhotoBadgeShadowedImage];
}

void __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_4()
{
  id v0 = +[PXPreloadScheduler sharedScheduler];
  [v0 scheduleMainQueueTask:&__block_literal_global_200_292757];

  uint64_t v1 = +[PXPreloadScheduler sharedScheduler];
  [v1 scheduleMainQueueTask:&__block_literal_global_202_292758];

  id v2 = +[PXPreloadScheduler sharedScheduler];
  [v2 scheduleMainQueueTask:&__block_literal_global_204_292759];
}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_7()
{
  return +[PXBadgeHelper cloudBadgeImage];
}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_6()
{
  return +[PXBadgeHelper loopingBadgeImage];
}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_5()
{
  return +[PXBadgeHelper gradientImage];
}

void __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke()
{
  id v0 = +[PXPreloadScheduler sharedScheduler];
  [v0 scheduleMainQueueTask:&__block_literal_global_192];

  id v1 = +[PXPreloadScheduler sharedScheduler];
  [v1 scheduleMainQueueTask:&__block_literal_global_195_292764];
}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_3()
{
  return +[PXBadgeHelper autoReframingImage];
}

id __47__PXUIAssetBadgeView_preloadResourcesForStyle___block_invoke_2()
{
  return +[PXBadgeHelper livePhotoBadgeShadowedImage];
}

@end