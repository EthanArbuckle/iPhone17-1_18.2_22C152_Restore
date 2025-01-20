@interface NCDigestMosaicFeaturedNotificationsContainerView
- (BOOL)_isDisplayingRichFeaturedNotifications;
- (BOOL)_shouldShowImageAttachments;
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGRect)_sizingBoundsForLargeFeaturedViewInRect:(CGRect)a3;
- (CGRect)_sizingBoundsForMediumFeaturedViewInRect:(CGRect)a3;
- (CGRect)_sizingBoundsForSmallFeaturedViewInRect:(CGRect)a3;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)featuredNotificationContentProviders;
- (NSArray)requiredVisualStyleCategories;
- (NSString)materialGroupNameBase;
- (NSString)preferredContentSizeCategory;
- (double)_overlapMarginForLargeFeaturedView;
- (id)_newFeaturedNotificationViewForContentProvider:(id)a3 contentViewStyle:(unint64_t)a4 showImageAttachment:(BOOL)a5;
- (id)_newNotificationSeamlessContentViewForContentProvider:(id)a3;
- (id)visualStylingProviderForCategory:(int64_t)a3;
- (unint64_t)_contentViewStyleForIndex:(unint64_t)a3;
- (void)_configureNotificationContentView:(id)a3 withContentProvider:(id)a4 showImageAttachment:(BOOL)a5 contentViewStyle:(unint64_t)a6;
- (void)_layoutLargeFeaturedView:(id)a3;
- (void)_layoutMediumFeaturedView:(id)a3;
- (void)_layoutSmallFeaturedView:(id)a3;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setFeaturedNotificationContentProviders:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)updateContent;
@end

@implementation NCDigestMosaicFeaturedNotificationsContainerView

- (NSArray)featuredNotificationContentProviders
{
  return self->_featuredNotificationContentProviders;
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (BSEqualArrays())
  {
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self updateContent];
  }
  else
  {
    objc_storeStrong((id *)&self->_featuredNotificationContentProviders, a3);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v6 = self->_notificationViews;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v17;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v17 != v9) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v10++) removeFromSuperview];
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v8);
    }

    v11 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    notificationViews = self->_notificationViews;
    self->_notificationViews = v11;

    BOOL v13 = [(NCDigestMosaicFeaturedNotificationsContainerView *)self _shouldShowImageAttachments];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __92__NCDigestMosaicFeaturedNotificationsContainerView_setFeaturedNotificationContentProviders___block_invoke;
    v14[3] = &unk_1E6A953B0;
    v14[4] = self;
    BOOL v15 = v13;
    [v5 enumerateObjectsUsingBlock:v14];
  }
}

void __92__NCDigestMosaicFeaturedNotificationsContainerView_setFeaturedNotificationContentProviders___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v11 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) _contentViewStyleForIndex:a3];
  BOOL v6 = v5 == 1 || *(unsigned char *)(a1 + 40) != 0;
  char v7 = [*(id *)(a1 + 32) _isDisplayingRichFeaturedNotifications];
  uint64_t v8 = *(void **)(a1 + 32);
  if (v7) {
    uint64_t v9 = [v8 _newFeaturedNotificationViewForContentProvider:v11 contentViewStyle:v5 showImageAttachment:v6];
  }
  else {
    uint64_t v9 = [v8 _newNotificationSeamlessContentViewForContentProvider:v11];
  }
  uint64_t v10 = (void *)v9;
  [*(id *)(*(void *)(a1 + 32) + 416) addObject:v9];
  [*(id *)(a1 + 32) addSubview:v10];
}

- (void)updateContent
{
  NSUInteger v3 = [(NSArray *)self->_featuredNotificationContentProviders count];
  if (v3 == [(NSMutableArray *)self->_notificationViews count])
  {
    BOOL v4 = [(NCDigestMosaicFeaturedNotificationsContainerView *)self _shouldShowImageAttachments];
    featuredNotificationContentProviders = self->_featuredNotificationContentProviders;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __65__NCDigestMosaicFeaturedNotificationsContainerView_updateContent__block_invoke;
    v7[3] = &unk_1E6A953B0;
    v7[4] = self;
    BOOL v8 = v4;
    [(NSArray *)featuredNotificationContentProviders enumerateObjectsUsingBlock:v7];
  }
  else
  {
    BOOL v6 = self->_featuredNotificationContentProviders;
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self setFeaturedNotificationContentProviders:v6];
  }
}

void __65__NCDigestMosaicFeaturedNotificationsContainerView_updateContent__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 _contentViewStyleForIndex:a3];
  BOOL v8 = v7 == 1 || *(unsigned char *)(a1 + 40) != 0;
  uint64_t v9 = *(id **)(a1 + 32);
  id v10 = [v9[52] objectAtIndex:a3];
  [v9 _configureNotificationContentView:v10 withContentProvider:v6 showImageAttachment:v8 contentViewStyle:v7];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  if ([(NCDigestMosaicFeaturedNotificationsContainerView *)self _isDisplayingRichFeaturedNotifications])
  {
    uint64_t v14 = 0;
    BOOL v15 = (double *)&v14;
    uint64_t v16 = 0x2020000000;
    uint64_t v17 = 0;
    notificationViews = self->_notificationViews;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __65__NCDigestMosaicFeaturedNotificationsContainerView_sizeThatFits___block_invoke;
    v13[3] = &unk_1E6A953D8;
    *(double *)&v13[6] = width;
    *(double *)&v13[7] = height;
    v13[4] = self;
    v13[5] = &v14;
    [(NSMutableArray *)notificationViews enumerateObjectsUsingBlock:v13];
    double v7 = v15[3];
    _Block_object_dispose(&v14, 8);
  }
  else
  {
    BOOL v8 = [(NSMutableArray *)self->_notificationViews firstObject];
    uint64_t v9 = v8;
    if (v8)
    {
      objc_msgSend(v8, "sizeThatFits:", width, height);
      double v7 = v10;
    }
    else
    {
      double v7 = 0.0;
    }
  }
  double v11 = width;
  double v12 = v7;
  result.double height = v12;
  result.double width = v11;
  return result;
}

void __65__NCDigestMosaicFeaturedNotificationsContainerView_sizeThatFits___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v21 = a2;
  double v6 = *(double *)(a1 + 48);
  double v5 = *(double *)(a1 + 56);
  uint64_t v7 = [*(id *)(a1 + 32) _contentViewStyleForIndex:a3];
  if (v7)
  {
    if (v7 == 1)
    {
      objc_msgSend(*(id *)(a1 + 32), "_sizingBoundsForSmallFeaturedViewInRect:", 0.0, 0.0, v6, v5);
      objc_msgSend(v21, "sizeThatFits:", v18, v19);
      uint64_t v9 = v21;
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      double v14 = *(double *)(v13 + 24);
      double v15 = 10.0;
    }
    else
    {
      BOOL v8 = v7 == 2;
      uint64_t v9 = v21;
      if (!v8) {
        goto LABEL_11;
      }
      objc_msgSend(*(id *)(a1 + 32), "_sizingBoundsForLargeFeaturedViewInRect:", 0.0, 0.0, v6, v5);
      objc_msgSend(v21, "sizeThatFits:", v10, v11);
      uint64_t v9 = v21;
      uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
      double v14 = *(double *)(v13 + 24);
      double v15 = 20.0;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "_sizingBoundsForMediumFeaturedViewInRect:", 0.0, 0.0, v6, v5);
    objc_msgSend(v21, "sizeThatFits:", v16, v17);
    uint64_t v9 = v21;
    uint64_t v13 = *(void *)(*(void *)(a1 + 40) + 8);
    double v14 = *(double *)(v13 + 24);
    double v15 = 50.0;
  }
  double v20 = v12 + v15;
  if (v14 < v20) {
    double v14 = v20;
  }
  *(double *)(v13 + 24) = v14;
LABEL_11:
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)NCDigestMosaicFeaturedNotificationsContainerView;
  [(NCDigestMosaicFeaturedNotificationsContainerView *)&v7 layoutSubviews];
  BOOL v3 = [(NCDigestMosaicFeaturedNotificationsContainerView *)self _isDisplayingRichFeaturedNotifications];
  notificationViews = self->_notificationViews;
  if (v3)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __66__NCDigestMosaicFeaturedNotificationsContainerView_layoutSubviews__block_invoke;
    v6[3] = &unk_1E6A95400;
    v6[4] = self;
    [(NSMutableArray *)notificationViews enumerateObjectsUsingBlock:v6];
  }
  else
  {
    double v5 = [(NSMutableArray *)notificationViews firstObject];
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self bounds];
    objc_msgSend(v5, "setFrame:");
  }
}

void __66__NCDigestMosaicFeaturedNotificationsContainerView_layoutSubviews__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v8 = a2;
  uint64_t v5 = [*(id *)(a1 + 32) _contentViewStyleForIndex:a3];
  if (!v5)
  {
    [*(id *)(a1 + 32) _layoutMediumFeaturedView:v8];
    goto LABEL_8;
  }
  if (v5 == 1)
  {
    [*(id *)(a1 + 32) _layoutSmallFeaturedView:v8];
    goto LABEL_8;
  }
  BOOL v6 = v5 == 2;
  objc_super v7 = v8;
  if (v6)
  {
    [*(id *)(a1 + 32) _layoutLargeFeaturedView:v8];
LABEL_8:
    objc_super v7 = v8;
  }
}

- (void)_layoutLargeFeaturedView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v15 = v4;
    [v4 frame];
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    -[NCDigestMosaicFeaturedNotificationsContainerView _sizingBoundsForLargeFeaturedViewInRect:](self, "_sizingBoundsForLargeFeaturedViewInRect:");
    objc_msgSend(v15, "sizeThatFits:", v13, v14);
    if ([(NCDigestMosaicFeaturedNotificationsContainerView *)self _shouldReverseLayoutDirection])
    {
      v17.origin.x = v6;
      v17.origin.y = v8;
      v17.size.double width = v10;
      v17.size.double height = v12;
      CGRectGetMaxX(v17);
    }
    UIRectIntegralWithScale();
    objc_msgSend(v15, "setFrame:");
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self _overlapMarginForLargeFeaturedView];
    objc_msgSend(v15, "setHorizontalMarginForContentOverlap:");
    id v4 = v15;
  }
}

- (void)_layoutMediumFeaturedView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v15 = v4;
    [v4 frame];
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    -[NCDigestMosaicFeaturedNotificationsContainerView _sizingBoundsForMediumFeaturedViewInRect:](self, "_sizingBoundsForMediumFeaturedViewInRect:");
    objc_msgSend(v15, "sizeThatFits:", v13, v14);
    [(NSMutableArray *)self->_notificationViews count];
    if (([(NCDigestMosaicFeaturedNotificationsContainerView *)self _shouldReverseLayoutDirection] & 1) == 0)
    {
      v17.origin.x = v6;
      v17.origin.y = v8;
      v17.size.double width = v10;
      v17.size.double height = v12;
      CGRectGetMaxX(v17);
    }
    UIRectIntegralWithScale();
    objc_msgSend(v15, "setFrame:");
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self bringSubviewToFront:v15];
    id v4 = v15;
  }
}

- (void)_layoutSmallFeaturedView:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v21 = v4;
    [v4 frame];
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self bounds];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v19 = v10;
    CGFloat v20 = v9;
    -[NCDigestMosaicFeaturedNotificationsContainerView _sizingBoundsForSmallFeaturedViewInRect:](self, "_sizingBoundsForSmallFeaturedViewInRect:");
    CGFloat v12 = v11;
    CGFloat v14 = v13;
    CGFloat v16 = v15;
    CGFloat v18 = v17;
    objc_msgSend(v21, "sizeThatFits:", v15, v17);
    v23.origin.x = v12;
    v23.origin.y = v14;
    v23.size.double width = v16;
    v23.size.double height = v18;
    CGRectGetWidth(v23);
    if (([(NCDigestMosaicFeaturedNotificationsContainerView *)self _shouldReverseLayoutDirection] & 1) == 0)
    {
      v24.origin.y = v19;
      v24.origin.x = v20;
      v24.size.double width = v6;
      v24.size.double height = v8;
      CGRectGetMaxX(v24);
    }
    UIRectIntegralWithScale();
    objc_msgSend(v21, "setFrame:");
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self bringSubviewToFront:v21];
    id v4 = v21;
  }
}

- (id)_newFeaturedNotificationViewForContentProvider:(id)a3 contentViewStyle:(unint64_t)a4 showImageAttachment:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  double v9 = [NCDigestMosaicFeaturedNotificationContentView alloc];
  double v10 = -[NCNotificationListBaseContentView initWithFrame:](v9, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NCDigestMosaicFeaturedNotificationContentView *)v10 setContentViewStyle:a4];
  double v11 = 0.0;
  if (a4 == 2) {
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self _overlapMarginForLargeFeaturedView];
  }
  [(NCDigestMosaicFeaturedNotificationContentView *)v10 setHorizontalMarginForContentOverlap:v11];
  CGFloat v12 = [v8 notificationRequest];
  double v13 = [v12 sectionIdentifier];
  [(NCDigestMosaicFeaturedNotificationContentView *)v10 setSectionIdentifier:v13];

  [(NCDigestMosaicFeaturedNotificationContentView *)v10 setUserInteractionEnabled:0];
  CGFloat v14 = [(NCDigestMosaicFeaturedNotificationContentView *)v10 layer];
  [v14 setShadowColor:CGColorGetConstantColor((CFStringRef)*MEMORY[0x1E4F1DB60])];
  [v14 setShadowRadius:20.0];
  LODWORD(v15) = 1041865114;
  [v14 setShadowOpacity:v15];
  objc_msgSend(v14, "setShadowOffset:", 0.0, 10.0);
  [(NCDigestMosaicFeaturedNotificationsContainerView *)self _configureNotificationContentView:v10 withContentProvider:v8 showImageAttachment:v5 contentViewStyle:a4];

  return v10;
}

- (id)_newNotificationSeamlessContentViewForContentProvider:(id)a3
{
  id v4 = a3;
  BOOL v5 = [NCNotificationSeamlessContentView alloc];
  CGFloat v6 = -[NCNotificationSeamlessContentView initWithFrame:](v5, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  [(NCNotificationSeamlessContentView *)v6 setThumbnailAlignedWithSecondaryText:1];
  [(NCNotificationSeamlessContentView *)v6 setHorizontalMarginPaddingDisabled:1];
  [(NCNotificationSeamlessContentView *)v6 setVisualStylingProvider:self->_strokeVisualStylingProvider forCategory:1];
  [(NCDigestMosaicFeaturedNotificationsContainerView *)self _configureNotificationContentView:v6 withContentProvider:v4 showImageAttachment:1 contentViewStyle:2];

  return v6;
}

- (void)_configureNotificationContentView:(id)a3 withContentProvider:(id)a4 showImageAttachment:(BOOL)a5 contentViewStyle:(unint64_t)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  CGFloat v12 = v11;
  if (a6 == 1 && [v11 appNotificationCount])
  {
    double v13 = NSString;
    CGFloat v14 = NCUserNotificationsUIKitFrameworkBundle();
    double v15 = [v14 localizedStringForKey:@"NOTIFICATION_DIGEST_FEATURED_COUNT_TEXT" value:&stru_1F2F516F8 table:0];
    CGFloat v16 = objc_msgSend(v13, "localizedStringWithFormat:", v15, objc_msgSend(v12, "appNotificationCount"), 0);
  }
  else
  {
    CGFloat v16 = [v12 primaryText];
  }
  [v10 setPrimaryText:v16];
  double v17 = [v12 primarySubtitleText];
  [v10 setPrimarySubtitleText:v17];

  CGFloat v18 = [v12 secondaryText];
  [v10 setSecondaryText:v18];

  CGFloat v19 = [NCBadgedIconView alloc];
  CGFloat v20 = [v12 icons];
  id v21 = objc_msgSend(MEMORY[0x1E4F28D60], "indexSetWithIndexesInRange:", 0, 2);
  v22 = [v20 objectsAtIndexes:v21];
  CGRect v23 = [(NCDigestMosaicFeaturedNotificationsContainerView *)self traitCollection];
  CGRect v24 = [(NCBadgedIconView *)v19 initWithProminentIcons:v22 subordinateIcons:0 badgeText:0 compatibleWithInitialTraitCollection:v23];
  [v10 setBadgedIconView:v24];

  [v10 setAlpha:1.0];
  if (v7)
  {
    v25 = [v12 thumbnail];
    [v10 setThumbnail:v25];

    if ([(NCDigestMosaicFeaturedNotificationsContainerView *)self _isDisplayingRichFeaturedNotifications])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [v10 imageAttachmentSizeRatio];
        double v27 = v26;
      }
      else
      {
        double v27 = 0.666666667;
      }
      v28[0] = MEMORY[0x1E4F143A8];
      v28[1] = 3221225472;
      v28[2] = __143__NCDigestMosaicFeaturedNotificationsContainerView__configureNotificationContentView_withContentProvider_showImageAttachment_contentViewStyle___block_invoke;
      v28[3] = &unk_1E6A95428;
      id v29 = v10;
      v30 = self;
      [v12 fetchFeaturedAttachmentImageWithSizeRatio:v28 completion:v27];
    }
  }
  [(NCDigestMosaicFeaturedNotificationsContainerView *)self setNeedsLayout];
}

uint64_t __143__NCDigestMosaicFeaturedNotificationsContainerView__configureNotificationContentView_withContentProvider_showImageAttachment_contentViewStyle___block_invoke(uint64_t a1, uint64_t a2)
{
  [*(id *)(a1 + 32) setThumbnail:a2];
  BOOL v3 = *(void **)(a1 + 40);

  return [v3 setNeedsLayout];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(NCDigestMosaicFeaturedNotificationsContainerView *)self traitCollection];
  id v4 = [v3 preferredContentSizeCategory];

  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    CGFloat v6 = self->_notificationViews;
    uint64_t v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v13;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v13 != v9) {
            objc_enumerationMutation(v6);
          }
          objc_msgSend(*(id *)(*((void *)&v12 + 1) + 8 * v10++), "adjustForContentSizeCategoryChange", (void)v12);
        }
        while (v8 != v10);
        uint64_t v8 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v8);
    }

    [(NCDigestMosaicFeaturedNotificationsContainerView *)self setNeedsLayout];
  }

  return v5 != NSOrderedSame;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider)
  {
    id v4 = strokeVisualStylingProvider;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)NCDigestMosaicFeaturedNotificationsContainerView;
    id v4 = [(NCDigestMosaicFeaturedNotificationsContainerView *)&v6 visualStylingProviderForCategory:a3];
  }

  return v4;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F2F846B8;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  uint64_t v7 = (MTVisualStylingProvider *)a3;
  if (self->_strokeVisualStylingProvider != v7)
  {
    objc_storeStrong((id *)&self->_strokeVisualStylingProvider, a3);
    if (![(NCDigestMosaicFeaturedNotificationsContainerView *)self _isDisplayingRichFeaturedNotifications])
    {
      notificationViews = self->_notificationViews;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __89__NCDigestMosaicFeaturedNotificationsContainerView_setVisualStylingProvider_forCategory___block_invoke;
      v9[3] = &unk_1E6A95450;
      int64_t v11 = a4;
      uint64_t v10 = v7;
      [(NSMutableArray *)notificationViews enumerateObjectsUsingBlock:v9];
    }
  }
}

void __89__NCDigestMosaicFeaturedNotificationsContainerView_setVisualStylingProvider_forCategory___block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  BOOL v3 = [v6 requiredVisualStyleCategories];
  id v4 = [NSNumber numberWithInteger:*(void *)(a1 + 40)];
  int v5 = [v3 containsObject:v4];

  if (v5) {
    [v6 setVisualStylingProvider:*(void *)(a1 + 32) forCategory:*(void *)(a1 + 40)];
  }
}

- (void)setMaterialGroupNameBase:(id)a3
{
}

- (BOOL)_isDisplayingRichFeaturedNotifications
{
  return [(NSArray *)self->_featuredNotificationContentProviders count] > 1;
}

- (BOOL)_shouldShowImageAttachments
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 1;
  BOOL v3 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v3 userInterfaceIdiom] == 1)
  {
    BOOL v4 = [(NCDigestMosaicFeaturedNotificationsContainerView *)self _isDisplayingRichFeaturedNotifications];

    if (v4)
    {
      featuredNotificationContentProviders = self->_featuredNotificationContentProviders;
      v8[0] = MEMORY[0x1E4F143A8];
      v8[1] = 3221225472;
      v8[2] = __79__NCDigestMosaicFeaturedNotificationsContainerView__shouldShowImageAttachments__block_invoke;
      v8[3] = &unk_1E6A95478;
      v8[4] = &v9;
      [(NSArray *)featuredNotificationContentProviders enumerateObjectsUsingBlock:v8];
    }
  }
  else
  {
  }
  char v6 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return v6;
}

uint64_t __79__NCDigestMosaicFeaturedNotificationsContainerView__shouldShowImageAttachments__block_invoke(uint64_t result, void *a2, unint64_t a3)
{
  if (a3 <= 1)
  {
    uint64_t v3 = result;
    if (*(unsigned char *)(*(void *)(*(void *)(result + 32) + 8) + 24))
    {
      CGSize result = [a2 hasAttachmentImage];
      *(unsigned char *)(*(void *)(*(void *)(v3 + 32) + 8) + 24) = result;
    }
  }
  return result;
}

- (unint64_t)_contentViewStyleForIndex:(unint64_t)a3
{
  if (a3) {
    return a3 != 1;
  }
  else {
    return 2;
  }
}

- (CGRect)_sizingBoundsForLargeFeaturedViewInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v7 = CGRectGetWidth(a3) * 0.65;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v12);
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = v7;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGRect)_sizingBoundsForMediumFeaturedViewInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v7 = CGRectGetWidth(a3) * 0.45;
  v12.origin.CGFloat x = x;
  v12.origin.CGFloat y = y;
  v12.size.CGFloat width = width;
  v12.size.CGFloat height = height;
  double v8 = CGRectGetHeight(v12);
  double v9 = 0.0;
  double v10 = 0.0;
  double v11 = v7;
  result.size.CGFloat height = v8;
  result.size.CGFloat width = v11;
  result.origin.CGFloat y = v10;
  result.origin.CGFloat x = v9;
  return result;
}

- (CGRect)_sizingBoundsForSmallFeaturedViewInRect:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  CGFloat v7 = [MEMORY[0x1E4FB16C8] currentDevice];
  double v8 = dbl_1D7D95FD0[[v7 userInterfaceIdiom] == 1];
  v14.origin.CGFloat x = x;
  v14.origin.CGFloat y = y;
  v14.size.CGFloat width = width;
  v14.size.CGFloat height = height;
  CGFloat v9 = CGRectGetWidth(v14) * v8;

  v15.origin.CGFloat x = x;
  v15.origin.CGFloat y = y;
  v15.size.CGFloat width = width;
  v15.size.CGFloat height = height;
  double v10 = CGRectGetHeight(v15);
  double v11 = 0.0;
  double v12 = 0.0;
  double v13 = v9;
  result.size.CGFloat height = v10;
  result.size.CGFloat width = v13;
  result.origin.CGFloat y = v12;
  result.origin.CGFloat x = v11;
  return result;
}

- (double)_overlapMarginForLargeFeaturedView
{
  NSUInteger v3 = [(NSArray *)self->_featuredNotificationContentProviders count];
  double result = 0.0;
  if (v3 >= 2)
  {
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self bounds];
    -[NCDigestMosaicFeaturedNotificationsContainerView _sizingBoundsForLargeFeaturedViewInRect:](self, "_sizingBoundsForLargeFeaturedViewInRect:");
    CGFloat Width = CGRectGetWidth(v19);
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self bounds];
    -[NCDigestMosaicFeaturedNotificationsContainerView _sizingBoundsForMediumFeaturedViewInRect:](self, "_sizingBoundsForMediumFeaturedViewInRect:");
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    if ([(NSArray *)self->_featuredNotificationContentProviders count] >= 3) {
      double v14 = 12.0;
    }
    else {
      double v14 = 0.0;
    }
    [(NCDigestMosaicFeaturedNotificationsContainerView *)self bounds];
    CGFloat v15 = CGRectGetWidth(v20) - v14;
    v21.origin.CGFloat x = v7;
    v21.origin.CGFloat y = v9;
    v21.size.CGFloat width = v11;
    v21.size.CGFloat height = v13;
    CGFloat v16 = v15 - CGRectGetWidth(v21);
    v22.origin.CGFloat x = v7;
    v22.origin.CGFloat y = v9;
    v22.size.CGFloat width = v11;
    v22.size.CGFloat height = v13;
    CGFloat v17 = CGRectGetWidth(v22);
    v23.origin.CGFloat x = 0.0;
    v23.origin.CGFloat y = 0.0;
    v23.size.CGFloat height = 0.0;
    v23.size.CGFloat width = Width;
    double MaxX = CGRectGetMaxX(v23);
    v24.origin.CGFloat y = 0.0;
    v24.size.CGFloat height = 0.0;
    v24.origin.CGFloat x = v16;
    v24.size.CGFloat width = v17;
    return MaxX - CGRectGetMinX(v24) + -8.0;
  }
  return result;
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategorCGFloat y = a3;
}

- (NSString)preferredContentSizeCategory
{
  return self->_preferredContentSizeCategory;
}

- (void)setPreferredContentSizeCategory:(id)a3
{
}

- (NSString)materialGroupNameBase
{
  return self->_materialGroupNameBase;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialGroupNameBase, 0);
  objc_storeStrong((id *)&self->_preferredContentSizeCategory, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_notificationViews, 0);

  objc_storeStrong((id *)&self->_featuredNotificationContentProviders, 0);
}

@end