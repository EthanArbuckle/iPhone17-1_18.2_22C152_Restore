@interface NCFullScreenStagingBannerView
+ (id)_detailSecondaryFont;
- (CGRect)_contentFrameForActiveStage;
- (CGRect)_contentHitRectForActiveStage;
- (NCFullScreenStagingBannerView)initWithSettings:(id)a3;
- (NCNotificationStaticContentProviding)staticContentProvider;
- (NCUNUIKitPrototypeSettings)settings;
- (NSArray)requiredVisualStyleCategories;
- (UIAction)contentTapAction;
- (UIAction)defaultTapAction;
- (double)_detailTextMaxWidthForBounds:(CGRect)a3 thumbnailVisible:(BOOL)a4;
- (id)_briefPrimaryLabelViewFont;
- (id)_composedDateStringWithDateString:(id)a3 staticContentProvider:(id)a4;
- (id)hitTest:(CGPoint)a3 withEvent:(id)a4;
- (int64_t)stage;
- (unint64_t)_detailLabelsNumberOfLines;
- (void)_configureContentHitRectViewIfNecessary;
- (void)_configureDateLabelIfNecessaryWithStaticContentProvider:(id)a3;
- (void)_configureDetailScrollViewIfNecessary;
- (void)_configureDetailSecondaryLabel;
- (void)_configureGrabberViewIfNecessary;
- (void)_configureInitialViewsForBriefStage;
- (void)_configureInitialViewsForDetailStage;
- (void)_configureInitialViewsForStage:(int64_t)a3;
- (void)_configureTapGestureIfNecessary;
- (void)_configureThumbnailViewIfNecessaryWithStaticContentProvider:(id)a3;
- (void)_handleTap:(id)a3;
- (void)_layoutContentHitRectViewForActiveStage;
- (void)_layoutForBriefStageWithSettings:(id)a3 completion:(id)a4;
- (void)_layoutForDetailStageWithSettings:(id)a3 completion:(id)a4;
- (void)_layoutForDismissedStageFromBriefStageWithSettings:(id)a3 completion:(id)a4;
- (void)_layoutForDismissedStageFromDetailStageWithSettings:(id)a3 completion:(id)a4;
- (void)_layoutForStage:(int64_t)a3 fromStage:(int64_t)a4 settings:(id)a5 completion:(id)a6;
- (void)_prepareForTransitionToBriefStage;
- (void)_prepareForTransitionToDetailStage;
- (void)_prepareForTransitionToStage:(int64_t)a3;
- (void)_setBadgedIconView:(id)a3;
- (void)_setImportantTextVisualStylingProvider:(id)a3;
- (void)_transitionToStage:(int64_t)a3 fromStage:(int64_t)a4 settings:(id)a5 completion:(id)a6;
- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6;
- (void)_updateWithStaticContentForStage:(int64_t)a3;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)dateLabelDidChange:(id)a3;
- (void)layoutSubviews;
- (void)setContentTapAction:(id)a3;
- (void)setDefaultTapAction:(id)a3;
- (void)setStage:(int64_t)a3;
- (void)setStaticContentProvider:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)transitionToStage:(int64_t)a3 completion:(id)a4;
@end

@implementation NCFullScreenStagingBannerView

- (NCFullScreenStagingBannerView)initWithSettings:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)NCFullScreenStagingBannerView;
  v5 = [(NCFullScreenStagingBannerView *)&v10 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    settings = v5->_settings;
    v5->_settings = (NCUNUIKitPrototypeSettings *)v6;

    v8 = [(NCFullScreenStagingBannerView *)v5 layer];
    [v8 setHitTestsAsOpaque:1];

    [(NCFullScreenStagingBannerView *)v5 _configureTapGestureIfNecessary];
  }

  return v5;
}

- (void)setStaticContentProvider:(id)a3
{
  p_staticContentProvider = &self->_staticContentProvider;
  id v5 = a3;
  if ((BSEqualObjects() & 1) == 0) {
    objc_storeStrong((id *)p_staticContentProvider, a3);
  }
}

- (void)setStage:(int64_t)a3
{
}

- (void)transitionToStage:(int64_t)a3 completion:(id)a4
{
  if (self->_stage < a3)
  {
    self->_stage = a3;
    -[NCFullScreenStagingBannerView _transitionToStage:fromStage:settings:completion:](self, "_transitionToStage:fromStage:settings:completion:");
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  v9.receiver = self;
  v9.super_class = (Class)NCFullScreenStagingBannerView;
  -[NCFullScreenStagingBannerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  id v5 = (NCFullScreenStagingBannerView *)objc_claimAutoreleasedReturnValue();
  if (v5 == self)
  {
    uint64_t v6 = [(NCFullScreenStagingBannerView *)self layer];
    if ([v6 allowsHitTesting]) {
      v7 = self;
    }
    else {
      v7 = 0;
    }
    id v5 = v7;
  }

  return v5;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)NCFullScreenStagingBannerView;
  [(NCFullScreenStagingBannerView *)&v8 layoutSubviews];
  if ([(NCUNUIKitPrototypeSettings *)self->_settings isContentHitRectVisible])
  {
    if (self->_stage >= 1)
    {
      [(NCFullScreenStagingBannerView *)self _configureContentHitRectViewIfNecessary];
      objc_initWeak(&location, self);
      v3 = (void *)MEMORY[0x1E4FB1EB0];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __47__NCFullScreenStagingBannerView_layoutSubviews__block_invoke;
      v5[3] = &unk_1E6A919A0;
      objc_copyWeak(&v6, &location);
      [v3 _animateUsingSpringInteractive:0 animations:v5 completion:0];
      objc_destroyWeak(&v6);
      objc_destroyWeak(&location);
    }
  }
  else
  {
    [(UIView *)self->_contentHitRectView removeFromSuperview];
    contentHitRectView = self->_contentHitRectView;
    self->_contentHitRectView = 0;
  }
}

void __47__NCFullScreenStagingBannerView_layoutSubviews__block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    [WeakRetained _layoutContentHitRectViewForActiveStage];
    [v2[66] setAlpha:1.0];
    WeakRetained = v2;
  }
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_1F2F84580;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  id v6 = (MTVisualStylingProvider *)a3;
  strokeVisualStylingProvider = self->_strokeVisualStylingProvider;
  if (strokeVisualStylingProvider != v6)
  {
    v11 = v6;
    objc_super v8 = v6;
    objc_super v9 = self->_strokeVisualStylingProvider;
    self->_strokeVisualStylingProvider = v8;
    objc_super v10 = strokeVisualStylingProvider;

    [(NCFullScreenStagingBannerView *)self _visualStylingProviderDidChange:self->_strokeVisualStylingProvider forCategory:a4 outgoingProvider:v10];
    id v6 = v11;
  }
}

- (void)dateLabelDidChange:(id)a3
{
  dateLabel = self->_dateLabel;
  id v6 = [(BSUIDateLabel *)self->_referenceDateLabel text];
  id v5 = [(NCFullScreenStagingBannerView *)self _composedDateStringWithDateString:v6 staticContentProvider:self->_staticContentProvider];
  [(UILabel *)dateLabel setAttributedText:v5];
}

- (unint64_t)_detailLabelsNumberOfLines
{
  if ([(NCNotificationStaticContentProviding *)self->_staticContentProvider isNumberOfLinesInfinite])return 0; {
  else
  }
    return 2;
}

- (void)_updateVisualStylingOfView:(id)a3 style:(int64_t)a4 visualStylingProvider:(id)a5 outgoingProvider:(id)a6
{
  if (a3)
  {
    id v9 = a5;
    id v10 = a3;
    [a6 stopAutomaticallyUpdatingView:v10];
    [v9 automaticallyUpdateView:v10 withStyle:a4];
  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
}

- (void)_setImportantTextVisualStylingProvider:(id)a3
{
  id v4 = (MTVisualStylingProvider *)a3;
  importantTextVisualStylingProvider = self->_importantTextVisualStylingProvider;
  if (importantTextVisualStylingProvider != v4)
  {
    id v9 = v4;
    id v6 = v4;
    v7 = self->_importantTextVisualStylingProvider;
    self->_importantTextVisualStylingProvider = v6;
    objc_super v8 = importantTextVisualStylingProvider;

    [(NCFullScreenStagingBannerView *)self _updateVisualStylingOfView:self->_dateLabel style:1 visualStylingProvider:self->_importantTextVisualStylingProvider outgoingProvider:v8];
    id v4 = v9;
  }
}

- (void)_configureGrabberViewIfNecessary
{
  if (!self->_grabberView)
  {
    v3 = (PLGrabberView *)objc_alloc_init(MEMORY[0x1E4F91438]);
    grabberView = self->_grabberView;
    self->_grabberView = v3;

    id v5 = self->_grabberView;
    [(NCFullScreenStagingBannerView *)self addSubview:v5];
  }
}

- (id)_briefPrimaryLabelViewFont
{
  return (id)objc_msgSend(MEMORY[0x1E4FB08E0], "bsui_defaultFontForTextStyle:hiFontStyle:", *MEMORY[0x1E4FB2928], 4);
}

- (void)_configureInitialViewsForBriefStage
{
  v20[1] = *MEMORY[0x1E4F143B8];
  [(NCFullScreenStagingBannerView *)self _configureGrabberViewIfNecessary];
  if (!self->_briefPrimaryLabelView)
  {
    v3 = (BSUIPartialStylingLabelView *)[objc_alloc(MEMORY[0x1E4F4F8D8]) initWithTokenType:1];
    briefPrimaryLabelView = self->_briefPrimaryLabelView;
    self->_briefPrimaryLabelView = v3;

    [(BSUIPartialStylingLabelView *)self->_briefPrimaryLabelView setNumberOfLines:1];
    id v5 = self->_briefPrimaryLabelView;
    id v6 = [MEMORY[0x1E4FB1618] labelColor];
    [(BSUIPartialStylingLabelView *)v5 setTextColor:v6];

    v7 = [(NCFullScreenStagingBannerView *)self _briefPrimaryLabelViewFont];
    [(BSUIPartialStylingLabelView *)self->_briefPrimaryLabelView setFont:v7];
    [(NCFullScreenStagingBannerView *)self addSubview:self->_briefPrimaryLabelView];
  }
  if (!self->_briefSecondaryLabel)
  {
    objc_super v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    briefSecondaryLabel = self->_briefSecondaryLabel;
    self->_briefSecondaryLabel = v8;

    [(UILabel *)self->_briefSecondaryLabel setNumberOfLines:1];
    id v10 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2990]];
    uint64_t v19 = *MEMORY[0x1E4FB0950];
    uint64_t v17 = *MEMORY[0x1E4FB09F0];
    v11 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
    v18 = v11;
    v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v18 forKeys:&v17 count:1];
    v20[0] = v12;
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:&v19 count:1];
    v14 = [v10 fontDescriptorByAddingAttributes:v13];

    v15 = self->_briefSecondaryLabel;
    v16 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v14 size:0.0];
    [(UILabel *)v15 setFont:v16];

    [(NCFullScreenStagingBannerView *)self addSubview:self->_briefSecondaryLabel];
    [(NCFullScreenStagingBannerView *)self _updateVisualStylingOfView:self->_briefSecondaryLabel style:2 visualStylingProvider:self->_strokeVisualStylingProvider outgoingProvider:0];
  }
}

- (id)_composedDateStringWithDateString:(id)a3 staticContentProvider:(id)a4
{
  id v5 = a3;
  id v6 = [a4 importantText];
  v7 = v5;
  if ([v6 length])
  {
    objc_super v8 = NSString;
    id v9 = NCUserNotificationsUIKitFrameworkBundle();
    id v10 = [v9 localizedStringForKey:@"IMPORTANT_TEXT_FULLSCREEN_FORMAT" value:&stru_1F2F516F8 table:0];
    v7 = objc_msgSend(v8, "stringWithFormat:", v10, v5, v6);
  }
  v11 = objc_msgSend(MEMORY[0x1E4F28B18], "nc_safeAttributedStringWithString:", v7);

  return v11;
}

- (void)_configureDetailScrollViewIfNecessary
{
  if (!self->_detailScrollView)
  {
    v3 = (UIScrollView *)objc_alloc_init(MEMORY[0x1E4FB1BE0]);
    detailScrollView = self->_detailScrollView;
    self->_detailScrollView = v3;

    [(UIScrollView *)self->_detailScrollView setShowsVerticalScrollIndicator:1];
    [(UIScrollView *)self->_detailScrollView setShowsHorizontalScrollIndicator:0];
    id v5 = self->_detailScrollView;
    [(NCFullScreenStagingBannerView *)self addSubview:v5];
  }
}

- (void)_configureDateLabelIfNecessaryWithStaticContentProvider:(id)a3
{
  if (!self->_dateLabel)
  {
    id v4 = (void *)MEMORY[0x1E4F4F8A8];
    id v5 = a3;
    id v6 = [v4 sharedInstance];
    v7 = [v5 date];
    objc_super v8 = [v5 timeZone];
    uint64_t v9 = [v5 isDateAllDay];

    id v10 = [v6 startLabelWithStartDate:v7 endDate:0 timeZone:v8 allDay:v9 forStyle:1];
    referenceDateLabel = self->_referenceDateLabel;
    self->_referenceDateLabel = v10;

    [(BSUIDateLabel *)self->_referenceDateLabel setDelegate:self];
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    dateLabel = self->_dateLabel;
    self->_dateLabel = v12;

    [(UILabel *)self->_dateLabel setNumberOfLines:1];
    v14 = self->_dateLabel;
    v15 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    [(UILabel *)v14 setTextColor:v15];

    objc_msgSend(MEMORY[0x1E4FB08E0], "bsui_defaultFontForTextStyle:hiFontStyle:", *MEMORY[0x1E4FB2988], 4);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    [(UILabel *)self->_dateLabel setFont:v16];
    [(NCFullScreenStagingBannerView *)self _configureDetailScrollViewIfNecessary];
    [(UIScrollView *)self->_detailScrollView addSubview:self->_dateLabel];
    [(NCFullScreenStagingBannerView *)self _updateVisualStylingOfView:self->_dateLabel style:1 visualStylingProvider:self->_importantTextVisualStylingProvider outgoingProvider:0];
    [(NCFullScreenStagingBannerView *)self dateLabelDidChange:self->_referenceDateLabel];
  }
}

- (void)_configureThumbnailViewIfNecessaryWithStaticContentProvider:(id)a3
{
  id v4 = a3;
  if (!self->_thumbnailView)
  {
    id v10 = v4;
    id v5 = [v4 thumbnail];

    id v4 = v10;
    if (v5)
    {
      id v6 = objc_alloc(MEMORY[0x1E4FB1838]);
      v7 = [v10 thumbnail];
      objc_super v8 = (UIImageView *)[v6 initWithImage:v7];
      thumbnailView = self->_thumbnailView;
      self->_thumbnailView = v8;

      [(UIImageView *)self->_thumbnailView _setContinuousCornerRadius:20.0];
      [(UIImageView *)self->_thumbnailView setClipsToBounds:1];
      [(NCFullScreenStagingBannerView *)self addSubview:self->_thumbnailView];
      id v4 = v10;
    }
  }
}

- (void)_configureContentHitRectViewIfNecessary
{
  if (!self->_contentHitRectView)
  {
    v3 = (UIView *)objc_alloc_init(MEMORY[0x1E4FB1EB0]);
    contentHitRectView = self->_contentHitRectView;
    self->_contentHitRectView = v3;

    id v5 = self->_contentHitRectView;
    id v6 = [MEMORY[0x1E4FB1618] systemRedColor];
    v7 = [v6 colorWithAlphaComponent:0.25];
    [(UIView *)v5 setBackgroundColor:v7];

    objc_super v8 = [(UIView *)self->_contentHitRectView layer];
    [v8 setAllowsHitTesting:0];

    [(UIView *)self->_contentHitRectView setAlpha:0.0];
    uint64_t v9 = self->_contentHitRectView;
    [(NCFullScreenStagingBannerView *)self insertSubview:v9 atIndex:0];
  }
}

- (void)_configureInitialViewsForDetailStage
{
  [(NCFullScreenStagingBannerView *)self _configureDetailScrollViewIfNecessary];
  if (!self->_detailPrimaryLabel)
  {
    v3 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailPrimaryLabel = self->_detailPrimaryLabel;
    self->_detailPrimaryLabel = v3;

    [(UILabel *)self->_detailPrimaryLabel setNumberOfLines:[(NCFullScreenStagingBannerView *)self _detailLabelsNumberOfLines]];
    id v5 = self->_detailPrimaryLabel;
    id v6 = [MEMORY[0x1E4FB1618] labelColor];
    [(UILabel *)v5 setTextColor:v6];

    v7 = self->_detailPrimaryLabel;
    objc_super v8 = [MEMORY[0x1E4FB08E0] boldSystemFontOfSize:48.0];
    [(UILabel *)v7 setFont:v8];

    [(UIScrollView *)self->_detailScrollView addSubview:self->_detailPrimaryLabel];
  }
  if (!self->_detailSecondaryLabel)
  {
    uint64_t v9 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    detailSecondaryLabel = self->_detailSecondaryLabel;
    self->_detailSecondaryLabel = v9;

    [(UILabel *)self->_detailSecondaryLabel setNumberOfLines:[(NCFullScreenStagingBannerView *)self _detailLabelsNumberOfLines]];
    [(NCFullScreenStagingBannerView *)self _configureDetailSecondaryLabel];
    detailScrollView = self->_detailScrollView;
    v12 = self->_detailSecondaryLabel;
    [(UIScrollView *)detailScrollView addSubview:v12];
  }
}

+ (id)_detailSecondaryFont
{
  if (_detailSecondaryFont_onceToken != -1) {
    dispatch_once(&_detailSecondaryFont_onceToken, &__block_literal_global_4);
  }
  v2 = (void *)_detailSecondaryFont__detailSecondaryFont;

  return v2;
}

void __53__NCFullScreenStagingBannerView__detailSecondaryFont__block_invoke()
{
  v10[1] = *MEMORY[0x1E4F143B8];
  v0 = [MEMORY[0x1E4FB08E8] defaultFontDescriptorWithTextStyle:*MEMORY[0x1E4FB2928]];
  uint64_t v9 = *MEMORY[0x1E4FB0950];
  uint64_t v7 = *MEMORY[0x1E4FB09F0];
  v1 = [NSNumber numberWithDouble:*MEMORY[0x1E4FB09D0]];
  objc_super v8 = v1;
  v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v8 forKeys:&v7 count:1];
  v10[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:&v9 count:1];
  id v4 = [v0 fontDescriptorByAddingAttributes:v3];

  uint64_t v5 = [MEMORY[0x1E4FB08E0] fontWithDescriptor:v4 size:0.0];
  id v6 = (void *)_detailSecondaryFont__detailSecondaryFont;
  _detailSecondaryFont__detailSecondaryFont = v5;
}

- (void)_configureDetailSecondaryLabel
{
  detailSecondaryLabel = self->_detailSecondaryLabel;
  id v4 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
  [(UILabel *)detailSecondaryLabel setTextColor:v4];

  uint64_t v5 = self->_detailSecondaryLabel;
  id v6 = [(id)objc_opt_class() _detailSecondaryFont];
  [(UILabel *)v5 setFont:v6];
}

- (void)_configureInitialViewsForStage:(int64_t)a3
{
  if (a3 == 2)
  {
    [(NCFullScreenStagingBannerView *)self _configureInitialViewsForDetailStage];
  }
  else if (a3 == 1)
  {
    [(NCFullScreenStagingBannerView *)self _configureInitialViewsForBriefStage];
  }
}

- (void)_setBadgedIconView:(id)a3
{
  id v5 = a3;
  p_badgedIconView = &self->_badgedIconView;
  if ((BSEqualObjects() & 1) == 0)
  {
    [(NCBadgedIconView *)*p_badgedIconView removeFromSuperview];
    objc_storeStrong((id *)&self->_badgedIconView, a3);
    if (*p_badgedIconView)
    {
      [(NCFullScreenStagingBannerView *)self addSubview:v5];
      uint64_t v7 = *p_badgedIconView;
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __52__NCFullScreenStagingBannerView__setBadgedIconView___block_invoke;
      v9[3] = &unk_1E6A91EA8;
      v9[4] = self;
      [(NCBadgedIconView *)v7 setBadgeLayoutBlock:v9];
      if (self->_stage >= 1)
      {
        v8[0] = MEMORY[0x1E4F143A8];
        v8[1] = 3221225472;
        v8[2] = __52__NCFullScreenStagingBannerView__setBadgedIconView___block_invoke_2;
        v8[3] = &unk_1E6A91BB0;
        v8[4] = self;
        [MEMORY[0x1E4FB1EB0] performWithoutAnimation:v8];
      }
      [(NCFullScreenStagingBannerView *)self addSubview:*p_badgedIconView];
    }
    [(NCFullScreenStagingBannerView *)self setNeedsLayout];
  }
}

double __52__NCFullScreenStagingBannerView__setBadgedIconView___block_invoke(uint64_t a1, void *a2, CGFloat a3, CGFloat a4, CGFloat a5, CGFloat a6)
{
  id v11 = a2;
  BSRectWithSize();
  double v13 = v12;
  CGFloat v15 = v14;
  CGFloat v17 = v16;
  CGFloat v19 = v18;
  v20 = [*(id *)(a1 + 32) traitCollection];
  uint64_t v21 = [v20 layoutDirection];

  CGFloat v22 = a3;
  CGFloat v23 = a4;
  CGFloat v24 = a5;
  CGFloat v25 = a6;
  if (v21 == 1)
  {
    double MinX = CGRectGetMinX(*(CGRect *)&v22);
    double v27 = -6.0;
  }
  else
  {
    CGFloat MaxX = CGRectGetMaxX(*(CGRect *)&v22);
    CGFloat v29 = v13;
    double v30 = MaxX;
    v36.origin.x = v29;
    v36.origin.y = v15;
    v36.size.width = v17;
    v36.size.height = v19;
    double MinX = v30 - CGRectGetWidth(v36);
    double v27 = 6.0;
  }
  CGFloat v31 = MinX + v27;
  v37.origin.x = a3;
  v37.origin.y = a4;
  v37.size.width = a5;
  v37.size.height = a6;
  CGRectGetMaxY(v37);
  v38.origin.x = v31;
  v38.origin.y = v15;
  v38.size.width = v17;
  v38.size.height = v19;
  CGRectGetHeight(v38);
  v32 = [v11 traitCollection];

  [v32 displayScale];
  UIRectRoundToScale();
  double v34 = v33;

  return v34;
}

uint64_t __52__NCFullScreenStagingBannerView__setBadgedIconView___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 416) layoutIfNeeded];
}

- (void)_updateWithStaticContentForStage:(int64_t)a3
{
  v33[2] = *MEMORY[0x1E4F143B8];
  staticContentProvider = self->_staticContentProvider;
  if (a3 >= 2) {
    id v6 = staticContentProvider;
  }
  else {
    id v6 = (NCNotificationStaticContentProviding *)[(NCNotificationStaticContentProviding *)staticContentProvider copyWithContentHidingEnforcement:-1];
  }
  uint64_t v7 = v6;
  objc_super v8 = [(NCNotificationStaticContentProviding *)v6 badgedIconView];
  [(NCFullScreenStagingBannerView *)self _setBadgedIconView:v8];

  uint64_t v9 = [(NCNotificationStaticContentProviding *)v7 contentSummaryText];
  if (v9)
  {
    id v10 = [(id)objc_opt_class() _detailSecondaryFont];
    id v11 = [MEMORY[0x1E4FB1618] secondaryLabelColor];
    double v12 = _NCContentSummaryText(v9, 0, v10, v11, 0);
  }
  else
  {
    double v12 = [(NCNotificationStaticContentProviding *)v7 secondaryText];
  }
  if (a3 == 2)
  {
    CGFloat v29 = [(NCNotificationStaticContentProviding *)v7 importantTextVisualStylingProvider];
    [(NCFullScreenStagingBannerView *)self _setImportantTextVisualStylingProvider:v29];

    [(NCFullScreenStagingBannerView *)self _configureDateLabelIfNecessaryWithStaticContentProvider:v7];
    [(NCFullScreenStagingBannerView *)self _configureThumbnailViewIfNecessaryWithStaticContentProvider:v7];
    detailPrimaryLabel = self->_detailPrimaryLabel;
    CGFloat v31 = [(NCNotificationStaticContentProviding *)v7 primaryText];
    [(UILabel *)detailPrimaryLabel setText:v31];

    [(UILabel *)self->_detailSecondaryLabel setAttributedText:v12];
    [(NCFullScreenStagingBannerView *)self _configureDetailSecondaryLabel];
  }
  else if (a3 == 1)
  {
    double v13 = (void *)MEMORY[0x1E4FB1830];
    double v14 = [(NCFullScreenStagingBannerView *)self _briefPrimaryLabelViewFont];
    CGFloat v15 = [v13 configurationWithFont:v14];

    double v16 = (void *)MEMORY[0x1E4FB1830];
    CGFloat v17 = [MEMORY[0x1E4FB1618] whiteColor];
    v33[0] = v17;
    double v18 = [MEMORY[0x1E4FB1618] systemRedColor];
    v33[1] = v18;
    CGFloat v19 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:2];
    v20 = [v16 configurationWithPaletteColors:v19];
    uint64_t v21 = [v15 configurationByApplyingConfiguration:v20];

    CGFloat v22 = [(NCNotificationStaticContentProviding *)v7 importantAttributedTextWithImageConfiguration:v21 importantAdornmentEligibleOptions:-1];
    if ([v22 length])
    {
      CGFloat v23 = (void *)[v22 mutableCopy];
      id v24 = objc_alloc(MEMORY[0x1E4F28B18]);
      CGFloat v25 = NSString;
      v26 = [(NCNotificationStaticContentProviding *)v7 primaryText];
      double v27 = [v25 stringWithFormat:@" %@", v26];
      v28 = (void *)[v24 initWithString:v27];
      [v23 appendAttributedString:v28];

      [(BSUIPartialStylingLabelView *)self->_briefPrimaryLabelView setAttributedText:v23];
    }
    else
    {
      briefPrimaryLabelView = self->_briefPrimaryLabelView;
      CGFloat v23 = [(NCNotificationStaticContentProviding *)v7 primaryText];
      [(BSUIPartialStylingLabelView *)briefPrimaryLabelView setText:v23];
    }

    [(UILabel *)self->_briefSecondaryLabel setAttributedText:v12];
  }
}

- (void)_prepareForTransitionToBriefStage
{
  [(NCFullScreenStagingBannerView *)self bounds];
  CGFloat v4 = v3;
  CGFloat v62 = v3;
  CGFloat v63 = v5;
  CGFloat v7 = v6;
  CGFloat v9 = v8;
  id v10 = [(NCFullScreenStagingBannerView *)self traitCollection];
  [v10 displayScale];
  uint64_t v64 = v11;

  grabberView = self->_grabberView;
  [(NCFullScreenStagingBannerView *)self bounds];
  -[PLGrabberView sizeThatFitsContainerWithSize:](grabberView, "sizeThatFitsContainerWithSize:", v13, v14);
  BSRectWithSize();
  CGFloat v16 = v15;
  CGFloat v18 = v17;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  v66.origin.x = v4;
  v66.origin.y = v7;
  v66.size.width = v9;
  v66.size.height = v63;
  CGRectGetMaxY(v66);
  v67.origin.x = v16;
  v67.origin.y = v18;
  v67.size.width = v20;
  v67.size.height = v22;
  CGRectGetHeight(v67);
  UIRectCenteredXInRectScale();
  [(PLGrabberView *)self->_grabberView setFrame:v64];
  [(PLGrabberView *)self->_grabberView setWeighting:0.0];
  BSRectWithSize();
  v68.origin.x = v62;
  v68.origin.y = v7;
  v68.size.width = v9;
  v68.size.height = v63;
  CGRectGetMaxY(v68);
  CGFloat v23 = v9;
  UIRectCenteredXInRectScale();
  CGFloat v59 = v25;
  CGFloat v60 = v24;
  CGFloat v57 = v27;
  CGFloat v58 = v26;
  [(NCBadgedIconView *)self->_badgedIconView setFrame:v64];
  badgedIconView = self->_badgedIconView;
  CGAffineTransformMakeScale(&v65, 0.8, 0.8);
  [(NCBadgedIconView *)badgedIconView setTransform:&v65];
  [(NCBadgedIconView *)self->_badgedIconView setAlpha:0.0];
  [(NCFullScreenStagingBannerView *)self safeAreaInsets];
  double v30 = v29;
  double v32 = v31;
  v69.origin.x = v62;
  v69.origin.y = v7;
  v69.size.width = v23;
  v69.size.height = v63;
  CGFloat v33 = CGRectGetWidth(v69) - v30 - v32;
  v70.origin.x = v62;
  v70.origin.y = v7;
  v70.size.width = v23;
  v70.size.height = v63;
  -[BSUIPartialStylingLabelView sizeThatFits:](self->_briefPrimaryLabelView, "sizeThatFits:", v33, CGRectGetHeight(v70));
  BSRectWithSize();
  CGFloat v35 = v34;
  CGFloat rect = v36;
  CGFloat v38 = v37;
  v71.origin.y = v59;
  v71.origin.x = v60;
  v71.size.height = v57;
  v71.size.width = v58;
  double MaxY = CGRectGetMaxY(v71);
  v72.origin.x = v62;
  v72.origin.y = v7;
  v72.size.width = v23;
  v72.size.height = v63;
  CGFloat v40 = MaxY + CGRectGetHeight(v72) * 0.12553011;
  v73.origin.x = v35;
  v73.origin.y = v40;
  v73.size.width = rect;
  v73.size.height = v38;
  CGRectGetWidth(v73);
  CGFloat v41 = v23;
  UIRectCenteredXInRectScale();
  CGFloat v61 = v42;
  CGFloat v44 = v43;
  CGFloat v46 = v45;
  CGFloat v48 = v47;
  [(BSUIPartialStylingLabelView *)self->_briefPrimaryLabelView setFrame:v64];
  [(BSUIPartialStylingLabelView *)self->_briefPrimaryLabelView setAlpha:0.0];
  v74.origin.x = v62;
  v74.origin.y = v7;
  v74.size.width = v41;
  v74.size.height = v63;
  -[UILabel sizeThatFits:](self->_briefSecondaryLabel, "sizeThatFits:", v33, CGRectGetHeight(v74));
  BSRectWithSize();
  CGFloat v50 = v49;
  CGFloat v52 = v51;
  CGFloat v54 = v53;
  v75.origin.x = v61;
  v75.origin.y = v44;
  v75.size.width = v46;
  v75.size.height = v48;
  CGFloat v55 = CGRectGetMaxY(v75) + 2.0;
  v76.origin.x = v50;
  v76.origin.y = v55;
  v76.size.width = v52;
  v76.size.height = v54;
  CGRectGetWidth(v76);
  UIRectCenteredXInRectScale();
  [(UILabel *)self->_briefSecondaryLabel setFrame:v64];
  [(UILabel *)self->_briefSecondaryLabel setAlpha:0.0];
}

- (double)_detailTextMaxWidthForBounds:(CGRect)a3 thumbnailVisible:(BOOL)a4
{
  BOOL v4 = a4;
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  [(NCFullScreenStagingBannerView *)self safeAreaInsets];
  double v11 = v10;
  double v13 = v12;
  double v14 = [(NCFullScreenStagingBannerView *)self traitCollection];
  uint64_t v15 = [v14 layoutDirection];

  if (v15 == 1) {
    double v16 = v11;
  }
  else {
    double v16 = v13;
  }
  if (v15 == 1) {
    double v17 = v13;
  }
  else {
    double v17 = v11;
  }
  if (v4) {
    double v18 = v16 + 118.0;
  }
  else {
    double v18 = v16;
  }
  double v19 = v17 + 84.0 + 34.0;
  v21.origin.CGFloat x = x;
  v21.origin.CGFloat y = y;
  v21.size.CGFloat width = width;
  v21.size.CGFloat height = height;
  return CGRectGetWidth(v21) - v19 - v18;
}

- (void)_prepareForTransitionToDetailStage
{
  [(NCFullScreenStagingBannerView *)self bounds];
  double v4 = v3;
  CGFloat v67 = v5;
  CGFloat v68 = v3;
  double v6 = v5;
  double v8 = v7;
  CGFloat v65 = v7;
  CGFloat v66 = v9;
  double v10 = v9;
  double v11 = [(NCFullScreenStagingBannerView *)self traitCollection];
  [v11 displayScale];

  double v12 = [(UIImageView *)self->_thumbnailView image];

  double v13 = [(NCFullScreenStagingBannerView *)self traitCollection];
  uint64_t v14 = [v13 layoutDirection];

  -[NCFullScreenStagingBannerView _detailTextMaxWidthForBounds:thumbnailVisible:](self, "_detailTextMaxWidthForBounds:thumbnailVisible:", v12 != 0, v4, v6, v8, v10);
  double v16 = v15;
  -[UILabel sizeThatFits:](self->_dateLabel, "sizeThatFits:");
  BSRectWithSize();
  CGFloat v62 = v18;
  CGFloat v63 = v17;
  CGFloat v20 = v19;
  CGFloat rect = v19;
  CGFloat v22 = v21;
  -[UILabel sizeThatFits:](self->_detailPrimaryLabel, "sizeThatFits:", v16, 1.79769313e308);
  BSRectWithSize();
  CGFloat v60 = v24;
  CGFloat v61 = v23;
  CGFloat v26 = v25;
  CGFloat v58 = v25;
  CGFloat v28 = v27;
  -[UILabel sizeThatFits:](self->_detailSecondaryLabel, "sizeThatFits:", v16, 1.79769313e308);
  BSRectWithSize();
  CGFloat v30 = v29;
  CGFloat v32 = v31;
  CGFloat v59 = v31;
  CGFloat v34 = v33;
  CGFloat v36 = v35;
  v70.size.CGFloat width = v62;
  v70.origin.CGFloat x = v63;
  v70.origin.CGFloat y = v20;
  v70.size.CGFloat height = v22;
  double Width = CGRectGetWidth(v70);
  v71.size.CGFloat width = v60;
  v71.origin.CGFloat x = v61;
  v71.origin.CGFloat y = v26;
  v71.size.CGFloat height = v28;
  double v38 = CGRectGetWidth(v71);
  v72.origin.CGFloat x = v30;
  v72.origin.CGFloat y = v32;
  v72.size.CGFloat width = v34;
  v72.size.CGFloat height = v36;
  double v39 = CGRectGetWidth(v72);
  if (Width >= v38) {
    double v40 = Width;
  }
  else {
    double v40 = v38;
  }
  if (v40 >= v39) {
    CGFloat v41 = v40;
  }
  else {
    CGFloat v41 = v39;
  }
  if (v14 == 1) {
    double v42 = 10.0;
  }
  else {
    double v42 = 0.0;
  }
  v73.origin.CGFloat x = v42;
  v73.origin.CGFloat y = rect;
  v73.size.CGFloat width = v41;
  v73.size.CGFloat height = v22;
  CGRectGetHeight(v73);
  v74.origin.CGFloat x = v42;
  v74.origin.CGFloat y = v58;
  v74.size.CGFloat width = v41;
  v74.size.CGFloat height = v28;
  CGRectGetHeight(v74);
  v75.origin.CGFloat x = v42;
  v75.origin.CGFloat y = v59;
  v75.size.CGFloat width = v41;
  v75.size.CGFloat height = v36;
  CGRectGetHeight(v75);
  [(NCFullScreenStagingBannerView *)self safeAreaInsets];
  [(PLGrabberView *)self->_grabberView frame];
  BSRectWithSize();
  UIRectCenteredYInRect();
  if (v14 == 1)
  {
    v76.origin.CGFloat y = v67;
    v76.origin.CGFloat x = v68;
    v76.size.CGFloat width = v65;
    v76.size.CGFloat height = v66;
    CGRectGetMaxX(v76);
  }
  UIRectRoundToScale();
  -[UIScrollView setFrame:](self->_detailScrollView, "setFrame:");
  detailScrollView = self->_detailScrollView;
  UISizeRoundToScale();
  -[UIScrollView setContentSize:](detailScrollView, "setContentSize:");
  v77.origin.CGFloat x = v42;
  v77.origin.CGFloat y = rect;
  v77.size.CGFloat width = v41;
  v77.size.CGFloat height = v22;
  CGFloat v44 = CGRectGetMaxY(v77) + 6.0;
  v78.origin.CGFloat x = v42;
  v78.origin.CGFloat y = v44;
  v78.size.CGFloat width = v41;
  v78.size.CGFloat height = v28;
  CGRectGetMaxY(v78);
  v79.origin.CGFloat y = v67;
  v79.origin.CGFloat x = v68;
  v79.size.CGFloat width = v65;
  v79.size.CGFloat height = v66;
  CGRectGetHeight(v79);
  dateLabel = self->_dateLabel;
  UIRectRoundToScale();
  -[UILabel setFrame:](dateLabel, "setFrame:");
  [(UILabel *)self->_dateLabel setAlpha:0.0];
  detailPrimaryLabel = self->_detailPrimaryLabel;
  UIRectRoundToScale();
  -[UILabel setFrame:](detailPrimaryLabel, "setFrame:");
  [(UILabel *)self->_detailPrimaryLabel setAlpha:0.0];
  detailSecondaryLabel = self->_detailSecondaryLabel;
  UIRectRoundToScale();
  -[UILabel setFrame:](detailSecondaryLabel, "setFrame:");
  [(UILabel *)self->_detailSecondaryLabel setAlpha:0.0];
  if (v12)
  {
    BSRectWithSize();
    CGFloat v49 = v48;
    CGFloat v51 = v50;
    CGFloat v53 = v52;
    CGFloat v55 = v54;
    if (v14 != 1)
    {
      v80.origin.CGFloat x = v68;
      v80.origin.CGFloat y = v67;
      v80.size.CGFloat width = v65;
      v80.size.CGFloat height = v66;
      CGRectGetWidth(v80);
      v81.origin.CGFloat x = v49;
      v81.origin.CGFloat y = v51;
      v81.size.CGFloat width = v53;
      v81.size.CGFloat height = v55;
      CGRectGetWidth(v81);
    }
    UIRectCenteredYInRect();
    thumbnailView = self->_thumbnailView;
    UIRectRoundToScale();
    -[UIImageView setFrame:](thumbnailView, "setFrame:");
    CGFloat v57 = self->_thumbnailView;
    [(UIImageView *)v57 setAlpha:0.0];
  }
}

- (void)_prepareForTransitionToStage:(int64_t)a3
{
  -[NCFullScreenStagingBannerView _configureInitialViewsForStage:](self, "_configureInitialViewsForStage:");
  [(NCFullScreenStagingBannerView *)self _updateWithStaticContentForStage:a3];
  if (a3 == 2)
  {
    [(NCFullScreenStagingBannerView *)self _prepareForTransitionToDetailStage];
  }
  else if (a3 == 1)
  {
    [(NCFullScreenStagingBannerView *)self _prepareForTransitionToBriefStage];
  }
}

- (void)_layoutForBriefStageWithSettings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v84 = a4;
  dispatch_group_t v7 = dispatch_group_create();
  [(NCFullScreenStagingBannerView *)self bounds];
  double v8 = [(NCFullScreenStagingBannerView *)self traitCollection];
  [v8 displayScale];
  uint64_t v93 = v9;

  BSRectWithSize();
  CGFloat v11 = v10;
  CGFloat v89 = v10;
  CGFloat v91 = v12;
  CGFloat v13 = v12;
  CGFloat v87 = v14;
  CGFloat recta = v15;
  [(BSUIPartialStylingLabelView *)self->_briefPrimaryLabelView frame];
  CGFloat v17 = v16;
  v86 = v18;
  CGFloat v20 = v19;
  CGFloat v22 = v21;
  [(UILabel *)self->_briefSecondaryLabel frame];
  CGFloat v24 = v23;
  v85 = v25;
  CGFloat v27 = v26;
  CGFloat v29 = v28;
  v150.origin.CGFloat x = v11;
  v150.origin.CGFloat y = v13;
  v150.size.CGFloat width = v87;
  v150.size.CGFloat height = recta;
  CGRectGetHeight(v150);
  v151.origin.CGFloat x = v17;
  *(void *)&v151.origin.CGFloat y = v86;
  v151.size.CGFloat width = v20;
  v151.size.CGFloat height = v22;
  CGRectGetHeight(v151);
  v152.origin.CGFloat x = v24;
  *(void *)&v152.origin.CGFloat y = v85;
  v152.size.CGFloat width = v27;
  v152.size.CGFloat height = v29;
  CGRectGetHeight(v152);
  v153.origin.CGFloat y = v91;
  v153.origin.CGFloat x = v89;
  v153.size.CGFloat width = v87;
  v153.size.CGFloat height = recta;
  CGRectGetWidth(v153);
  BSRectWithSize();
  UIRectCenteredYInRect();
  CGRectGetMinY(v154);
  UIRectCenteredXInRectScale();
  double v31 = v30;
  double v33 = v32;
  double v35 = v34;
  double v37 = v36;
  objc_initWeak(location, self->_badgedIconView);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke;
  aBlock[3] = &unk_1E6A91F20;
  id v38 = v6;
  id v146 = v38;
  double v39 = v7;
  v147 = v39;
  objc_copyWeak(v148, location);
  v148[1] = v31;
  v148[2] = v33;
  v148[3] = v35;
  v148[4] = v37;
  double v40 = _Block_copy(aBlock);
  v141[0] = MEMORY[0x1E4F143A8];
  v141[1] = 3221225472;
  v141[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_4;
  v141[3] = &unk_1E6A91F70;
  id v41 = v38;
  id v142 = v41;
  double v42 = v39;
  v143 = v42;
  objc_copyWeak(&v144, location);
  v92 = (void (**)(void))_Block_copy(v141);
  objc_initWeak(&from, self->_grabberView);
  v136[0] = MEMORY[0x1E4F143A8];
  v136[1] = 3221225472;
  v136[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_7;
  v136[3] = &unk_1E6A91F70;
  id v43 = v41;
  id v137 = v43;
  CGFloat v44 = v42;
  v138 = v44;
  objc_copyWeak(&v139, &from);
  v90 = (void (**)(void))_Block_copy(v136);
  objc_initWeak(&v135, self);
  v133[0] = MEMORY[0x1E4F143A8];
  v133[1] = 3221225472;
  v133[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_10;
  v133[3] = &unk_1E6A91F98;
  objc_copyWeak(&v134, &v135);
  CGFloat rect = _Block_copy(v133);
  v88 = v40;
  if (v43)
  {
    [(UIViewFloatAnimatableProperty *)self->_floatAnimatablePropertyForBriefIcon invalidate];
    double v45 = (void *)MEMORY[0x1E4FB1ED0];
    id v46 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    double v47 = NSNumber;
    [v43 briefIconPositionMilestone];
    double v48 = objc_msgSend(v47, "numberWithDouble:");
    CGFloat v49 = NSNumber;
    [v43 briefIconScaleMilestone];
    double v50 = objc_msgSend(v49, "numberWithDouble:");
    CGFloat v51 = NSNumber;
    [v43 briefGrabberMilestone];
    double v52 = objc_msgSend(v51, "numberWithDouble:");
    CGFloat v53 = objc_msgSend(v46, "initWithObjects:", v48, v50, v52, 0);
    v127[0] = MEMORY[0x1E4F143A8];
    v127[1] = 3221225472;
    v127[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_11;
    v127[3] = &unk_1E6A91FC0;
    id v129 = rect;
    id v128 = v43;
    id v130 = v88;
    v131 = v92;
    v132 = v90;
    objc_msgSend(v45, "unui_animatablePropertyWithProgressMilestones:block:", v53, v127);
    double v54 = (UIViewFloatAnimatableProperty *)objc_claimAutoreleasedReturnValue();
    floatAnimatablePropertyForBriefIcon = self->_floatAnimatablePropertyForBriefIcon;
    self->_floatAnimatablePropertyForBriefIcon = v54;
  }
  else
  {
    (*((void (**)(void *))v40 + 2))(v40);
    v92[2](v92);
    v90[2](v90);
  }
  objc_initWeak(&v126, self->_floatAnimatablePropertyForBriefIcon);
  v56 = [v43 briefIconOpacitySettings];
  v122[0] = MEMORY[0x1E4F143A8];
  v122[1] = 3221225472;
  v122[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_12;
  v122[3] = &unk_1E6A91FE8;
  v123 = v44;
  objc_copyWeak(&v124, location);
  objc_copyWeak(&v125, &v126);
  v118[0] = MEMORY[0x1E4F143A8];
  v118[1] = 3221225472;
  v118[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_13;
  v118[3] = &unk_1E6A92010;
  CGFloat v57 = v123;
  v119 = v57;
  objc_copyWeak(&v120, &v135);
  objc_copyWeak(&v121, &v126);
  NCPerformActionsAnimatingIfNecessary(v56, v122, v118);

  *(void *)&v155.origin.CGFloat x = v31;
  *(void *)&v155.origin.CGFloat y = v33;
  *(void *)&v155.size.CGFloat width = v35;
  *(void *)&v155.size.CGFloat height = v37;
  CGRectGetMaxY(v155);
  UIRectCenteredXInRectScale();
  CGFloat x = v156.origin.x;
  CGFloat y = v156.origin.y;
  CGFloat width = v156.size.width;
  CGFloat height = v156.size.height;
  CGRectGetMaxY(v156);
  UIRectCenteredXInRectScale();
  CGFloat v63 = v62;
  CGFloat v65 = v64;
  CGFloat v67 = v66;
  CGRect v69 = v68;
  objc_initWeak(&v117, self->_briefPrimaryLabelView);
  objc_initWeak(&v116, self->_briefSecondaryLabel);
  v111[0] = MEMORY[0x1E4F143A8];
  v111[1] = 3221225472;
  v111[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_14;
  v111[3] = &unk_1E6A92060;
  id v70 = v43;
  id v112 = v70;
  CGRect v71 = v57;
  v113 = v71;
  objc_copyWeak(&v114, &v117);
  v115[1] = *(id *)&x;
  v115[2] = *(id *)&y;
  v115[3] = *(id *)&width;
  v115[4] = *(id *)&height;
  objc_copyWeak(v115, &v116);
  v115[5] = v63;
  v115[6] = v65;
  v115[7] = v67;
  v115[8] = v69;
  CGRect v72 = _Block_copy(v111);
  CGRect v73 = v72;
  if (v43)
  {
    [(UIViewFloatAnimatableProperty *)self->_floatAnimatablePropertyForBriefTextPosition invalidate];
    CGRect v74 = (void *)MEMORY[0x1E4FB1ED0];
    id v75 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    CGRect v76 = NSNumber;
    [v70 briefTextPositionMilestone];
    CGRect v77 = objc_msgSend(v76, "numberWithDouble:");
    CGRect v78 = objc_msgSend(v75, "initWithObjects:", v77, 0);
    v108[0] = MEMORY[0x1E4F143A8];
    v108[1] = 3221225472;
    v108[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_17;
    v108[3] = &unk_1E6A92088;
    id v109 = rect;
    id v110 = v73;
    objc_msgSend(v74, "unui_animatablePropertyWithProgressMilestones:block:", v78, v108);
    CGRect v79 = (UIViewFloatAnimatableProperty *)objc_claimAutoreleasedReturnValue();
    floatAnimatablePropertyForBriefTextPosition = self->_floatAnimatablePropertyForBriefTextPosition;
    self->_floatAnimatablePropertyForBriefTextPosition = v79;
  }
  else
  {
    (*((void (**)(void *))v72 + 2))(v72);
  }
  objc_initWeak(&v107, self->_floatAnimatablePropertyForBriefTextPosition);
  CGRect v81 = [v70 briefTextOpacitySettings];
  v102[0] = MEMORY[0x1E4F143A8];
  v102[1] = 3221225472;
  v102[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_18;
  v102[3] = &unk_1E6A920B0;
  v103 = v71;
  objc_copyWeak(&v104, &v117);
  objc_copyWeak(&v105, &v116);
  objc_copyWeak(&v106, &v107);
  v98[0] = MEMORY[0x1E4F143A8];
  v98[1] = 3221225472;
  v98[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_19;
  v98[3] = &unk_1E6A92010;
  v82 = v103;
  v99 = v82;
  objc_copyWeak(&v100, &v135);
  objc_copyWeak(&v101, &v107);
  NCPerformActionsAnimatingIfNecessary(v81, v102, v98);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_20;
  block[3] = &unk_1E6A91DF0;
  id v97 = v84;
  id v83 = v84;
  dispatch_group_notify(v82, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v101);
  objc_destroyWeak(&v100);

  objc_destroyWeak(&v106);
  objc_destroyWeak(&v105);
  objc_destroyWeak(&v104);

  objc_destroyWeak(&v107);
  objc_destroyWeak(v115);
  objc_destroyWeak(&v114);

  objc_destroyWeak(&v116);
  objc_destroyWeak(&v117);
  objc_destroyWeak(&v121);
  objc_destroyWeak(&v120);

  objc_destroyWeak(&v125);
  objc_destroyWeak(&v124);

  objc_destroyWeak(&v126);
  objc_destroyWeak(&v134);
  objc_destroyWeak(&v135);

  objc_destroyWeak(&v139);
  objc_destroyWeak(&from);

  objc_destroyWeak(&v144);
  objc_destroyWeak(v148);

  objc_destroyWeak(location);
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke(uint64_t a1)
{
  v2 = [*(id *)(a1 + 32) briefIconPositionSettings];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_2;
  v6[3] = &unk_1E6A91ED0;
  id v7 = *(id *)(a1 + 40);
  objc_copyWeak(&v8, (id *)(a1 + 48));
  long long v3 = *(_OWORD *)(a1 + 72);
  long long v9 = *(_OWORD *)(a1 + 56);
  long long v10 = v3;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_3;
  v4[3] = &unk_1E6A91EF8;
  id v5 = *(id *)(a1 + 40);
  NCPerformActionsAnimatingIfNecessary(v2, v6, v4);

  objc_destroyWeak(&v8);
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_2(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  PLSetViewFrameMaintainingTransform();
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_3(uint64_t a1)
{
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_4(id *a1)
{
  v2 = [a1[4] briefIconScaleSettings];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_5;
  v5[3] = &unk_1E6A91F48;
  id v6 = a1[5];
  objc_copyWeak(&v7, a1 + 6);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_6;
  v3[3] = &unk_1E6A91EF8;
  id v4 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v5, v3);

  objc_destroyWeak(&v7);
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_5(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  long long v3 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
  v4[0] = *MEMORY[0x1E4F1DAB8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 32);
  [WeakRetained setTransform:v4];
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_6(uint64_t a1)
{
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_7(id *a1)
{
  v2 = [a1[4] briefGrabberSettings];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_8;
  v5[3] = &unk_1E6A91F48;
  id v6 = a1[5];
  objc_copyWeak(&v7, a1 + 6);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_9;
  v3[3] = &unk_1E6A91EF8;
  id v4 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v5, v3);

  objc_destroyWeak(&v7);
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_8(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setWeighting:1.0];
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_9(uint64_t a1)
{
}

BOOL __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_10(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = [WeakRetained stage] == 1;

  return v2;
}

uint64_t __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_11(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    [*(id *)(a1 + 32) briefIconPositionMilestone];
    if (BSFloatApproximatelyEqualToFloat()) {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
    }
    [*(id *)(a1 + 32) briefIconScaleMilestone];
    if (BSFloatApproximatelyEqualToFloat()) {
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    [*(id *)(a1 + 32) briefGrabberMilestone];
    uint64_t result = BSFloatApproximatelyEqualToFloat();
    if (result)
    {
      long long v3 = *(uint64_t (**)(void))(*(void *)(a1 + 64) + 16);
      return v3();
    }
  }
  return result;
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_12(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAlpha:1.0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 setValue:1.0];
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_13(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (id)WeakRetained[61];
    id v6 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)(a1 + 48));

    id WeakRetained = v6;
    if (v3 == v4)
    {
      id v5 = (void *)v6[61];
      v6[61] = 0;

      id WeakRetained = v6;
    }
  }
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_14(uint64_t a1)
{
  BOOL v2 = [*(id *)(a1 + 32) briefTextPositionSettings];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_15;
  v7[3] = &unk_1E6A92038;
  id v8 = *(id *)(a1 + 40);
  objc_copyWeak(&v9, (id *)(a1 + 48));
  long long v3 = *(_OWORD *)(a1 + 80);
  long long v11 = *(_OWORD *)(a1 + 64);
  long long v12 = v3;
  objc_copyWeak(&v10, (id *)(a1 + 56));
  long long v4 = *(_OWORD *)(a1 + 112);
  long long v13 = *(_OWORD *)(a1 + 96);
  long long v14 = v4;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_16;
  v5[3] = &unk_1E6A91EF8;
  id v6 = *(id *)(a1 + 40);
  NCPerformActionsAnimatingIfNecessary(v2, v7, v5);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_15(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_16(uint64_t a1)
{
}

uint64_t __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_17(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_18(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAlpha:1.0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 setAlpha:1.0];

  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  [v4 setValue:1.0];
}

void __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_19(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (id)WeakRetained[62];
    id v6 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)(a1 + 48));

    id WeakRetained = v6;
    if (v3 == v4)
    {
      id v5 = (void *)v6[62];
      v6[62] = 0;

      id WeakRetained = v6;
    }
  }
}

uint64_t __77__NCFullScreenStagingBannerView__layoutForBriefStageWithSettings_completion___block_invoke_20(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_layoutForDetailStageWithSettings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  [(NCFullScreenStagingBannerView *)self bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  CGFloat v17 = [(NCFullScreenStagingBannerView *)self traitCollection];
  [v17 displayScale];
  CGFloat v91 = v18;

  [(BSUIPartialStylingLabelView *)self->_briefPrimaryLabelView frame];
  v95 = v19;
  id v97 = v20;
  double v22 = v21;
  v99 = v23;
  v186.origin.CGFloat x = v10;
  v186.origin.CGFloat y = v12;
  v186.size.CGFloat width = v14;
  v186.size.CGFloat height = v16;
  double Height = CGRectGetHeight(v186);
  [(UILabel *)self->_briefSecondaryLabel frame];
  v92 = v26;
  uint64_t v93 = v25;
  double v28 = v27;
  CGFloat v30 = v29;
  CGFloat v89 = *(id **)&v12;
  v90 = *(id **)&v10;
  v187.origin.CGFloat x = v10;
  v187.origin.CGFloat y = v12;
  CGFloat v31 = v14;
  v187.size.CGFloat width = v14;
  CGFloat rect = v16;
  v187.size.CGFloat height = v16;
  double v32 = CGRectGetHeight(v187);
  objc_initWeak(location, self->_briefPrimaryLabelView);
  objc_initWeak(&from, self->_briefSecondaryLabel);
  double v33 = [v6 detailOutgoingTextPositionSettings];
  v180[0] = MEMORY[0x1E4F143A8];
  v180[1] = 3221225472;
  v180[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke;
  v180[3] = &unk_1E6A92038;
  v181 = v8;
  objc_copyWeak(&v182, location);
  v183[1] = v95;
  *(double *)&v183[2] = v22 + Height * 0.0703986429;
  v183[3] = v99;
  v183[4] = v97;
  objc_copyWeak(v183, &from);
  v183[5] = v93;
  *(double *)&v183[6] = v28 + v32 * 0.0703986429;
  v183[7] = v92;
  v183[8] = v30;
  v178[0] = MEMORY[0x1E4F143A8];
  v178[1] = 3221225472;
  v178[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_2;
  v178[3] = &unk_1E6A91EF8;
  CGFloat v34 = v181;
  v179 = v34;
  NCPerformActionsAnimatingIfNecessary(v33, v180, v178);
  v88 = v7;

  double v35 = [v6 detailOutgoingTextOpacitySettings];
  v174[0] = MEMORY[0x1E4F143A8];
  v174[1] = 3221225472;
  v174[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_3;
  v174[3] = &unk_1E6A91FE8;
  v175 = v34;
  objc_copyWeak(&v176, location);
  objc_copyWeak(&v177, &from);
  v172[0] = MEMORY[0x1E4F143A8];
  v172[1] = 3221225472;
  v172[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_4;
  v172[3] = &unk_1E6A91EF8;
  CGFloat v36 = v175;
  v173 = v36;
  NCPerformActionsAnimatingIfNecessary(v35, v174, v172);

  [(NCBadgedIconView *)self->_badgedIconView center];
  UIRectGetCenter();
  UIPointRoundToScale();
  id v38 = v37;
  double v40 = v39;
  objc_initWeak(&v171, self->_badgedIconView);
  id v41 = [v6 detailIconPositionSettings];
  v168[0] = MEMORY[0x1E4F143A8];
  v168[1] = 3221225472;
  v168[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_5;
  v168[3] = &unk_1E6A920D8;
  v169 = v36;
  objc_copyWeak(v170, &v171);
  v170[1] = v38;
  v170[2] = v40;
  v166[0] = MEMORY[0x1E4F143A8];
  v166[1] = 3221225472;
  v166[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_6;
  v166[3] = &unk_1E6A91EF8;
  double v42 = v169;
  v167 = v42;
  NCPerformActionsAnimatingIfNecessary(v41, v168, v166);

  id v43 = [(NCFullScreenStagingBannerView *)self traitCollection];
  uint64_t v44 = [v43 layoutDirection];

  [(NCFullScreenStagingBannerView *)self safeAreaInsets];
  if (v44 == 1)
  {
    double v47 = v46;
    *(void *)&v188.origin.CGFloat x = v90;
    *(void *)&v188.origin.CGFloat y = v89;
    v188.size.CGFloat width = v31;
    v188.size.CGFloat height = rect;
    double v48 = CGRectGetMaxX(v188) - v47;
    double v49 = -1.0;
  }
  else
  {
    double v48 = v45;
    double v49 = 1.0;
  }
  objc_initWeak(&v165, self);
  objc_initWeak(&v164, self->_dateLabel);
  objc_initWeak(&v163, self->_detailPrimaryLabel);
  objc_initWeak(&v162, self->_thumbnailView);
  *(void *)&v189.origin.CGFloat x = v90;
  *(void *)&v189.origin.CGFloat y = v89;
  v189.size.CGFloat width = v31;
  v189.size.CGFloat height = rect;
  CGFloat v50 = CGRectGetHeight(v189);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_7;
  aBlock[3] = &__block_descriptor_48_e16_v16__0__UIView_8l;
  *(double *)&void aBlock[4] = v50 * 0.00848176421;
  aBlock[5] = v91;
  CGFloat v51 = _Block_copy(aBlock);
  v154[0] = MEMORY[0x1E4F143A8];
  v154[1] = 3221225472;
  v154[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_8;
  v154[3] = &unk_1E6A92148;
  id v52 = v6;
  id v155 = v52;
  CGFloat v53 = v42;
  CGRect v156 = v53;
  id v54 = v51;
  id v157 = v54;
  objc_copyWeak(&v158, &v164);
  objc_copyWeak(&v159, &v163);
  objc_copyWeak(&v160, &v162);
  CGFloat v55 = _Block_copy(v154);
  v148[0] = MEMORY[0x1E4F143A8];
  v148[1] = 3221225472;
  v148[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_11;
  v148[3] = &unk_1E6A92170;
  id v56 = v52;
  id v149 = v56;
  CGFloat v57 = v53;
  CGRect v150 = v57;
  objc_copyWeak(&v151, &v164);
  objc_copyWeak(&v152, &v163);
  objc_copyWeak(&v153, &v162);
  CGFloat recta = (void (**)(void))_Block_copy(v148);
  objc_initWeak(&v147, self->_detailSecondaryLabel);
  v142[0] = MEMORY[0x1E4F143A8];
  v142[1] = 3221225472;
  v142[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_14;
  v142[3] = &unk_1E6A921C0;
  id v58 = v56;
  id v143 = v58;
  CGFloat v59 = v57;
  id v144 = v59;
  id v86 = v54;
  id v145 = v86;
  objc_copyWeak(&v146, &v147);
  id v100 = (void (**)(void))_Block_copy(v142);
  v138[0] = MEMORY[0x1E4F143A8];
  v138[1] = 3221225472;
  v138[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_17;
  v138[3] = &unk_1E6A91F70;
  id v60 = v58;
  id v139 = v60;
  id v61 = v59;
  id v140 = v61;
  objc_copyWeak(&v141, &v147);
  v98 = (void (**)(void))_Block_copy(v138);
  uint64_t v132 = 0;
  v133 = (id *)&v132;
  uint64_t v134 = 0x3042000000;
  id v135 = __Block_byref_object_copy_;
  v136 = __Block_byref_object_dispose_;
  id v137 = 0;
  v126[0] = MEMORY[0x1E4F143A8];
  v126[1] = 3221225472;
  v126[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_35;
  v126[3] = &unk_1E6A92238;
  id v62 = v60;
  id v127 = v62;
  id v87 = v61;
  id v128 = v87;
  objc_copyWeak(&v130, &v171);
  *(double *)&v131[1] = v48 + v49 * 42.0;
  v131[2] = v40;
  id v129 = &v132;
  objc_copyWeak(v131, &v165);
  v94 = v55;
  v96 = (void (**)(void))_Block_copy(v126);
  if (v62)
  {
    v124[0] = MEMORY[0x1E4F143A8];
    v124[1] = 3221225472;
    v124[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_4_38;
    v124[3] = &unk_1E6A91F98;
    objc_copyWeak(&v125, &v165);
    CGFloat v63 = _Block_copy(v124);
    [(UIViewFloatAnimatableProperty *)self->_floatAnimatablePropertyForDetailText invalidate];
    uint64_t v64 = (void *)MEMORY[0x1E4FB1ED0];
    id v65 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    CGFloat v66 = NSNumber;
    [v62 detailTextMilestone];
    CGFloat v67 = objc_msgSend(v66, "numberWithDouble:");
    CGFloat v68 = NSNumber;
    [v62 detailSecondaryTextMilestone];
    CGRect v69 = objc_msgSend(v68, "numberWithDouble:");
    id v70 = objc_msgSend(v65, "initWithObjects:", v67, v69, 0);
    v117[0] = MEMORY[0x1E4F143A8];
    v117[1] = 3221225472;
    v117[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_5_39;
    v117[3] = &unk_1E6A92260;
    id v71 = v63;
    id v119 = v71;
    id v72 = v62;
    id v118 = v72;
    id v120 = v94;
    id v121 = recta;
    v122 = v100;
    v123 = v98;
    objc_msgSend(v64, "unui_animatablePropertyWithProgressMilestones:block:", v70, v117);
    CGRect v73 = (UIViewFloatAnimatableProperty *)objc_claimAutoreleasedReturnValue();
    floatAnimatablePropertyForDetailText = self->_floatAnimatablePropertyForDetailText;
    self->_floatAnimatablePropertyForDetailText = v73;

    objc_storeWeak(v133 + 5, self->_floatAnimatablePropertyForDetailText);
    [(UIViewFloatAnimatableProperty *)self->_floatAnimatablePropertyForDetailIconPosition invalidate];
    id v75 = (void *)MEMORY[0x1E4FB1ED0];
    id v76 = objc_alloc(MEMORY[0x1E4F1CAD0]);
    CGRect v77 = NSNumber;
    [v72 detailIconPositionMilestone];
    CGRect v78 = objc_msgSend(v77, "numberWithDouble:");
    CGRect v79 = objc_msgSend(v76, "initWithObjects:", v78, 0);
    v114[0] = MEMORY[0x1E4F143A8];
    v114[1] = 3221225472;
    v114[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_6_40;
    v114[3] = &unk_1E6A92088;
    id v80 = v71;
    id v115 = v80;
    id v116 = v96;
    objc_msgSend(v75, "unui_animatablePropertyWithProgressMilestones:block:", v79, v114);
    CGRect v81 = (UIViewFloatAnimatableProperty *)objc_claimAutoreleasedReturnValue();
    floatAnimatablePropertyForDetailIconPosition = self->_floatAnimatablePropertyForDetailIconPosition;
    self->_floatAnimatablePropertyForDetailIconPosition = v81;

    objc_destroyWeak(&v125);
  }
  else
  {
    (*((void (**)(void *))v55 + 2))(v55);
    recta[2]();
    v100[2]();
    v98[2]();
    v96[2]();
  }
  objc_initWeak(&v113, self->_floatAnimatablePropertyForDetailIconPosition);
  id v83 = [v62 detailIconScaleSettings];
  v109[0] = MEMORY[0x1E4F143A8];
  v109[1] = 3221225472;
  v109[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_7_41;
  v109[3] = &unk_1E6A91FE8;
  id v110 = v87;
  objc_copyWeak(&v111, &v171);
  objc_copyWeak(&v112, &v113);
  v105[0] = MEMORY[0x1E4F143A8];
  v105[1] = 3221225472;
  v105[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_8_42;
  v105[3] = &unk_1E6A92010;
  id v84 = v110;
  id v106 = v84;
  objc_copyWeak(&v107, &v165);
  objc_copyWeak(&v108, &v113);
  NCPerformActionsAnimatingIfNecessary(v83, v109, v105);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_9_43;
  block[3] = &unk_1E6A91DF0;
  id v104 = v88;
  id v85 = v88;
  dispatch_group_notify(v84, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v108);
  objc_destroyWeak(&v107);

  objc_destroyWeak(&v112);
  objc_destroyWeak(&v111);

  objc_destroyWeak(&v113);
  objc_destroyWeak(v131);
  objc_destroyWeak(&v130);

  _Block_object_dispose(&v132, 8);
  objc_destroyWeak(&v137);

  objc_destroyWeak(&v141);
  objc_destroyWeak(&v146);

  objc_destroyWeak(&v147);
  objc_destroyWeak(&v153);
  objc_destroyWeak(&v152);
  objc_destroyWeak(&v151);

  objc_destroyWeak(&v160);
  objc_destroyWeak(&v159);
  objc_destroyWeak(&v158);

  objc_destroyWeak(&v162);
  objc_destroyWeak(&v163);
  objc_destroyWeak(&v164);
  objc_destroyWeak(&v165);

  objc_destroyWeak(v170);
  objc_destroyWeak(&v171);

  objc_destroyWeak(&v177);
  objc_destroyWeak(&v176);

  objc_destroyWeak(v183);
  objc_destroyWeak(&v182);

  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(v3, "setFrame:", *(double *)(a1 + 88), *(double *)(a1 + 96), *(double *)(a1 + 104), *(double *)(a1 + 112));
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_2(uint64_t a1)
{
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAlpha:0.0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 setAlpha:0.0];
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_4(uint64_t a1)
{
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_5(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "setCenter:", *(double *)(a1 + 48), *(double *)(a1 + 56));
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_6(uint64_t a1)
{
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_7(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    [v2 frame];
    UIRectRoundToScale();
    objc_msgSend(v2, "setFrame:");
  }
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_8(id *a1)
{
  id v2 = [a1[4] detailTextPositionSettings];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_9;
  v5[3] = &unk_1E6A92120;
  id v6 = a1[5];
  id v7 = a1[6];
  objc_copyWeak(&v8, a1 + 7);
  objc_copyWeak(&v9, a1 + 8);
  objc_copyWeak(&v10, a1 + 9);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_10;
  v3[3] = &unk_1E6A91EF8;
  id v4 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v5, v3);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_9(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, WeakRetained);

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_loadWeakRetained((id *)(a1 + 64));
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_10(uint64_t a1)
{
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_11(id *a1)
{
  uint64_t v2 = [a1[4] detailTextOpacitySettings];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_12;
  v5[3] = &unk_1E6A920B0;
  id v6 = a1[5];
  objc_copyWeak(&v7, a1 + 6);
  objc_copyWeak(&v8, a1 + 7);
  objc_copyWeak(&v9, a1 + 8);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_13;
  v3[3] = &unk_1E6A91EF8;
  id v4 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v5, v3);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&v8);
  objc_destroyWeak(&v7);
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_12(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAlpha:0.71];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 setAlpha:1.0];

  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  [v4 setAlpha:1.0];
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_13(uint64_t a1)
{
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_14(id *a1)
{
  uint64_t v2 = [a1[4] detailTextPositionSettings];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_15;
  v5[3] = &unk_1E6A92198;
  id v6 = a1[5];
  id v7 = a1[6];
  objc_copyWeak(&v8, a1 + 7);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_16;
  v3[3] = &unk_1E6A91EF8;
  id v4 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v5, v3);

  objc_destroyWeak(&v8);
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_15(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, WeakRetained);
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_16(uint64_t a1)
{
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_17(id *a1)
{
  uint64_t v2 = [a1[4] detailTextOpacitySettings];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_18;
  v5[3] = &unk_1E6A91F48;
  id v6 = a1[5];
  objc_copyWeak(&v7, a1 + 6);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_19;
  v3[3] = &unk_1E6A91EF8;
  id v4 = a1[5];
  NCPerformActionsAnimatingIfNecessary(v2, v5, v3);

  objc_destroyWeak(&v7);
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_18(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAlpha:1.0];
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_19(uint64_t a1)
{
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_35(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) detailIconPositionSettings];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_2_36;
  v7[3] = &unk_1E6A921E8;
  id v8 = *(id *)(a1 + 40);
  objc_copyWeak(&v10, (id *)(a1 + 56));
  long long v11 = *(_OWORD *)(a1 + 72);
  uint64_t v9 = *(void *)(a1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_3_37;
  v3[3] = &unk_1E6A92210;
  id v4 = *(id *)(a1 + 40);
  objc_copyWeak(&v6, (id *)(a1 + 64));
  uint64_t v5 = *(void *)(a1 + 48);
  NCPerformActionsAnimatingIfNecessary(v2, v7, v3);

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v10);
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_2_36(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "setCenter:", *(double *)(a1 + 56), *(double *)(a1 + 64));

  id v3 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  [v3 setValue:1.0];
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_3_37(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = (id)WeakRetained[64];
    id v6 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));

    id WeakRetained = v6;
    if (v3 == v4)
    {
      uint64_t v5 = (void *)v6[64];
      v6[64] = 0;

      id WeakRetained = v6;
    }
  }
}

BOOL __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_4_38(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v2 = [WeakRetained stage] == 2;

  return v2;
}

uint64_t __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_5_39(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
  if (result)
  {
    [*(id *)(a1 + 32) detailTextMilestone];
    if (BSFloatApproximatelyEqualToFloat())
    {
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    }
    [*(id *)(a1 + 32) detailSecondaryTextMilestone];
    uint64_t result = BSFloatApproximatelyEqualToFloat();
    if (result)
    {
      (*(void (**)(void))(*(void *)(a1 + 64) + 16))();
      id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 72) + 16);
      return v3();
    }
  }
  return result;
}

uint64_t __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_6_40(uint64_t a1)
{
  uint64_t result = (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
  if (result)
  {
    id v3 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v3();
  }
  return result;
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_7_41(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  CGAffineTransformMakeScale(&v4, 0.477272727, 0.477272727);
  [WeakRetained setTransform:&v4];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 setValue:1.0];
}

void __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_8_42(uint64_t a1)
{
  dispatch_group_leave(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    id v3 = (id)WeakRetained[63];
    id v6 = WeakRetained;
    id v4 = objc_loadWeakRetained((id *)(a1 + 48));

    id WeakRetained = v6;
    if (v3 == v4)
    {
      uint64_t v5 = (void *)v6[63];
      v6[63] = 0;

      id WeakRetained = v6;
    }
  }
}

uint64_t __78__NCFullScreenStagingBannerView__layoutForDetailStageWithSettings_completion___block_invoke_9_43(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_layoutForDismissedStageFromBriefStageWithSettings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  [(NCFullScreenStagingBannerView *)self bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  objc_initWeak(location, self->_badgedIconView);
  objc_initWeak(&from, self->_grabberView);
  CGFloat v17 = [v6 dismissIconOpacitySettings];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke;
  v47[3] = &unk_1E6A91FE8;
  double v48 = v8;
  objc_copyWeak(&v49, location);
  objc_copyWeak(&v50, &from);
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_2;
  v45[3] = &unk_1E6A91EF8;
  double v18 = v48;
  double v46 = v18;
  NCPerformActionsAnimatingIfNecessary(v17, v47, v45);

  objc_initWeak(&v44, self->_briefPrimaryLabelView);
  objc_initWeak(&v43, self->_briefSecondaryLabel);
  double v19 = [v6 dismissTextOpacitySettings];
  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_3;
  v39[3] = &unk_1E6A91FE8;
  double v40 = v18;
  objc_copyWeak(&v41, &v44);
  objc_copyWeak(&v42, &v43);
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_4;
  v37[3] = &unk_1E6A91EF8;
  CGFloat v20 = v40;
  id v38 = v20;
  NCPerformActionsAnimatingIfNecessary(v19, v39, v37);

  v53.origin.CGFloat x = v10;
  v53.origin.CGFloat y = v12;
  v53.size.CGFloat width = v14;
  v53.size.CGFloat height = v16;
  CGFloat Height = CGRectGetHeight(v53);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_5;
  aBlock[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  *(double *)&void aBlock[4] = Height * 0.0703986429;
  double v22 = _Block_copy(aBlock);
  double v23 = [v6 dismissTextPositionSettings];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_6;
  v31[3] = &unk_1E6A922A8;
  double v32 = v20;
  id v24 = v22;
  id v33 = v24;
  objc_copyWeak(&v34, &v44);
  objc_copyWeak(&v35, &v43);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_7;
  v29[3] = &unk_1E6A91EF8;
  double v25 = v32;
  CGFloat v30 = v25;
  NCPerformActionsAnimatingIfNecessary(v23, v31, v29);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_8;
  block[3] = &unk_1E6A91DF0;
  id v28 = v7;
  id v26 = v7;
  dispatch_group_notify(v25, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&v34);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&v41);

  objc_destroyWeak(&v43);
  objc_destroyWeak(&v44);

  objc_destroyWeak(&v50);
  objc_destroyWeak(&v49);

  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAlpha:0.0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 setWeighting:0.0];
}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_2(uint64_t a1)
{
}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAlpha:0.0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 setAlpha:0.0];
}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_4(uint64_t a1)
{
}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_5(uint64_t a1, void *a2)
{
  id v2 = a2;
  [v2 frame];
  objc_msgSend(v2, "setFrame:");
}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_6(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, WeakRetained);

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);
}

void __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_7(uint64_t a1)
{
}

uint64_t __95__NCFullScreenStagingBannerView__layoutForDismissedStageFromBriefStageWithSettings_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (void)_layoutForDismissedStageFromDetailStageWithSettings:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  dispatch_group_t v8 = dispatch_group_create();
  [(NCFullScreenStagingBannerView *)self bounds];
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  CGFloat v14 = v13;
  CGFloat v16 = v15;
  objc_initWeak(location, self->_badgedIconView);
  objc_initWeak(&from, self->_grabberView);
  CGFloat v17 = [v6 dismissIconOpacitySettings];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke;
  v54[3] = &unk_1E6A91FE8;
  CGFloat v55 = v8;
  objc_copyWeak(&v56, location);
  objc_copyWeak(&v57, &from);
  v52[0] = MEMORY[0x1E4F143A8];
  v52[1] = 3221225472;
  v52[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_2;
  v52[3] = &unk_1E6A91EF8;
  double v18 = v55;
  CGRect v53 = v18;
  NCPerformActionsAnimatingIfNecessary(v17, v54, v52);

  objc_initWeak(&v51, self->_dateLabel);
  objc_initWeak(&v50, self->_detailPrimaryLabel);
  objc_initWeak(&v49, self->_detailSecondaryLabel);
  objc_initWeak(&v48, self->_thumbnailView);
  double v19 = [v6 dismissTextOpacitySettings];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_3;
  v42[3] = &unk_1E6A922D0;
  id v43 = v18;
  objc_copyWeak(&v44, &v51);
  objc_copyWeak(&v45, &v50);
  objc_copyWeak(&v46, &v49);
  objc_copyWeak(&v47, &v48);
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  v40[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_4;
  v40[3] = &unk_1E6A91EF8;
  CGFloat v20 = v43;
  id v41 = v20;
  NCPerformActionsAnimatingIfNecessary(v19, v42, v40);

  v60.origin.CGFloat x = v10;
  v60.origin.CGFloat y = v12;
  v60.size.CGFloat width = v14;
  v60.size.CGFloat height = v16;
  CGFloat Height = CGRectGetHeight(v60);
  double v22 = v7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_5;
  aBlock[3] = &__block_descriptor_40_e16_v16__0__UIView_8l;
  *(double *)&void aBlock[4] = Height * 0.0703986429;
  double v23 = _Block_copy(aBlock);
  id v24 = [v6 dismissTextPositionSettings];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_6;
  v32[3] = &unk_1E6A922F8;
  id v33 = v20;
  id v25 = v23;
  id v34 = v25;
  objc_copyWeak(&v35, &v51);
  objc_copyWeak(&v36, &v50);
  objc_copyWeak(&v37, &v49);
  objc_copyWeak(&v38, &v48);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_7;
  v30[3] = &unk_1E6A91EF8;
  id v26 = v33;
  CGFloat v31 = v26;
  NCPerformActionsAnimatingIfNecessary(v24, v32, v30);

  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_8;
  block[3] = &unk_1E6A91DF0;
  id v29 = v22;
  id v27 = v22;
  dispatch_group_notify(v26, MEMORY[0x1E4F14428], block);

  objc_destroyWeak(&v38);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v36);
  objc_destroyWeak(&v35);

  objc_destroyWeak(&v47);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v45);
  objc_destroyWeak(&v44);

  objc_destroyWeak(&v48);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v51);

  objc_destroyWeak(&v57);
  objc_destroyWeak(&v56);

  objc_destroyWeak(&from);
  objc_destroyWeak(location);
}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAlpha:0.0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 setWeighting:0.0];
}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_2(uint64_t a1)
{
}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_3(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained setAlpha:0.0];

  id v3 = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 setAlpha:0.0];

  id v4 = objc_loadWeakRetained((id *)(a1 + 56));
  [v4 setAlpha:0.0];

  id v5 = objc_loadWeakRetained((id *)(a1 + 64));
  [v5 setAlpha:0.0];
}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_4(uint64_t a1)
{
}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_5(uint64_t a1, void *a2)
{
  if (a2)
  {
    id v2 = a2;
    [v2 frame];
    objc_msgSend(v2, "setFrame:");
  }
}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_6(uint64_t a1)
{
  dispatch_group_enter(*(dispatch_group_t *)(a1 + 32));
  uint64_t v2 = *(void *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, WeakRetained);

  uint64_t v4 = *(void *)(a1 + 40);
  id v5 = objc_loadWeakRetained((id *)(a1 + 56));
  (*(void (**)(uint64_t, id))(v4 + 16))(v4, v5);

  uint64_t v6 = *(void *)(a1 + 40);
  id v7 = objc_loadWeakRetained((id *)(a1 + 64));
  (*(void (**)(uint64_t, id))(v6 + 16))(v6, v7);

  uint64_t v8 = *(void *)(a1 + 40);
  id v9 = objc_loadWeakRetained((id *)(a1 + 72));
  (*(void (**)(uint64_t, id))(v8 + 16))(v8, v9);
}

void __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_7(uint64_t a1)
{
}

uint64_t __96__NCFullScreenStagingBannerView__layoutForDismissedStageFromDetailStageWithSettings_completion___block_invoke_8(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(uint64_t, uint64_t, void))(result + 16))(result, 1, 0);
  }
  return result;
}

- (CGRect)_contentFrameForActiveStage
{
  int64_t stage = self->_stage;
  if (stage == 1)
  {
    [(NCBadgedIconView *)self->_badgedIconView frame];
    CGFloat v5 = v4;
    CGFloat v7 = v6;
    CGFloat v9 = v8;
    CGFloat v11 = v10;
    [(BSUIPartialStylingLabelView *)self->_briefPrimaryLabelView frame];
    v83.origin.CGFloat x = v12;
    v83.origin.CGFloat y = v13;
    v83.size.CGFloat width = v14;
    v83.size.CGFloat height = v15;
    v73.origin.CGFloat x = v5;
    v73.origin.CGFloat y = v7;
    v73.size.CGFloat width = v9;
    v73.size.CGFloat height = v11;
    CGRect v74 = CGRectUnion(v73, v83);
    CGFloat x = v74.origin.x;
    CGFloat y = v74.origin.y;
    CGFloat width = v74.size.width;
    CGFloat height = v74.size.height;
    [(UILabel *)self->_briefSecondaryLabel frame];
    uint64_t v21 = v20;
    uint64_t v23 = v22;
    uint64_t v25 = v24;
    uint64_t v27 = v26;
    CGFloat v28 = x;
    CGFloat v29 = y;
    CGFloat v30 = width;
    CGFloat v31 = height;
LABEL_6:
    CGRect v81 = CGRectUnion(*(CGRect *)&v28, *(CGRect *)&v21);
    CGFloat v60 = v81.origin.x;
    CGFloat v61 = v81.origin.y;
    CGFloat v62 = v81.size.width;
    CGFloat v63 = v81.size.height;
    goto LABEL_8;
  }
  if (stage != 2)
  {
    CGFloat v62 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    CGFloat v63 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
    CGFloat v60 = *MEMORY[0x1E4F1DB28];
    CGFloat v61 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    goto LABEL_8;
  }
  [(NCBadgedIconView *)self->_badgedIconView frame];
  CGFloat v33 = v32;
  CGFloat v35 = v34;
  CGFloat v37 = v36;
  CGFloat v39 = v38;
  [(UILabel *)self->_dateLabel frame];
  v84.origin.CGFloat x = v40;
  v84.origin.CGFloat y = v41;
  v84.size.CGFloat width = v42;
  v84.size.CGFloat height = v43;
  v75.origin.CGFloat x = v33;
  v75.origin.CGFloat y = v35;
  v75.size.CGFloat width = v37;
  v75.size.CGFloat height = v39;
  CGRect v76 = CGRectUnion(v75, v84);
  CGFloat v44 = v76.origin.x;
  CGFloat v45 = v76.origin.y;
  CGFloat v46 = v76.size.width;
  CGFloat v47 = v76.size.height;
  [(UILabel *)self->_detailPrimaryLabel frame];
  v85.origin.CGFloat x = v48;
  v85.origin.CGFloat y = v49;
  v85.size.CGFloat width = v50;
  v85.size.CGFloat height = v51;
  v77.origin.CGFloat x = v44;
  v77.origin.CGFloat y = v45;
  v77.size.CGFloat width = v46;
  v77.size.CGFloat height = v47;
  CGRect v78 = CGRectUnion(v77, v85);
  CGFloat v52 = v78.origin.x;
  CGFloat v53 = v78.origin.y;
  CGFloat v54 = v78.size.width;
  CGFloat v55 = v78.size.height;
  [(UILabel *)self->_detailSecondaryLabel frame];
  v86.origin.CGFloat x = v56;
  v86.origin.CGFloat y = v57;
  v86.size.CGFloat width = v58;
  v86.size.CGFloat height = v59;
  v79.origin.CGFloat x = v52;
  v79.origin.CGFloat y = v53;
  v79.size.CGFloat width = v54;
  v79.size.CGFloat height = v55;
  CGRect v80 = CGRectUnion(v79, v86);
  CGFloat v60 = v80.origin.x;
  CGFloat v61 = v80.origin.y;
  CGFloat v62 = v80.size.width;
  CGFloat v63 = v80.size.height;
  uint64_t v64 = [(UIImageView *)self->_thumbnailView image];

  if (v64)
  {
    [(UIImageView *)self->_thumbnailView frame];
    uint64_t v21 = v65;
    uint64_t v23 = v66;
    uint64_t v25 = v67;
    uint64_t v27 = v68;
    CGFloat v28 = v60;
    CGFloat v29 = v61;
    CGFloat v30 = v62;
    CGFloat v31 = v63;
    goto LABEL_6;
  }
LABEL_8:
  double v69 = v60;
  double v70 = v61;
  double v71 = v62;
  double v72 = v63;
  result.size.CGFloat height = v72;
  result.size.CGFloat width = v71;
  result.origin.CGFloat y = v70;
  result.origin.CGFloat x = v69;
  return result;
}

- (CGRect)_contentHitRectForActiveStage
{
  [(NCFullScreenStagingBannerView *)self _contentFrameForActiveStage];
  if (CGRectIsEmpty(v31))
  {
    double v3 = *MEMORY[0x1E4F1DB28];
    double v4 = *(double *)(MEMORY[0x1E4F1DB28] + 8);
    double v5 = *(double *)(MEMORY[0x1E4F1DB28] + 16);
    double v6 = *(double *)(MEMORY[0x1E4F1DB28] + 24);
  }
  else
  {
    CGFloat v7 = [(NCFullScreenStagingBannerView *)self traitCollection];
    uint64_t v8 = [v7 layoutDirection];

    [(NCUNUIKitPrototypeSettings *)self->_settings contentHitRectTopMargin];
    settings = self->_settings;
    if (v8 == 1)
    {
      [(NCUNUIKitPrototypeSettings *)settings contentHitRectLeadingMargin];
      [(NCUNUIKitPrototypeSettings *)self->_settings contentHitRectBottomMargin];
      [(NCUNUIKitPrototypeSettings *)self->_settings contentHitRectTrailingMargin];
    }
    else
    {
      [(NCUNUIKitPrototypeSettings *)settings contentHitRectTrailingMargin];
      [(NCUNUIKitPrototypeSettings *)self->_settings contentHitRectBottomMargin];
      [(NCUNUIKitPrototypeSettings *)self->_settings contentHitRectLeadingMargin];
    }
    UIRectInset();
    CGFloat v11 = v10;
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    [(NCFullScreenStagingBannerView *)self bounds];
    v34.origin.CGFloat x = v18;
    v34.origin.CGFloat y = v19;
    v34.size.CGFloat width = v20;
    v34.size.CGFloat height = v21;
    v32.origin.CGFloat x = v11;
    v32.origin.CGFloat y = v13;
    v32.size.CGFloat width = v15;
    v32.size.CGFloat height = v17;
    CGRectIntersection(v32, v34);
    uint64_t v22 = [(NCFullScreenStagingBannerView *)self traitCollection];
    [v22 displayScale];
    UIRectRoundToScale();
    double v3 = v23;
    double v4 = v24;
    double v5 = v25;
    double v6 = v26;
  }
  double v27 = v3;
  double v28 = v4;
  double v29 = v5;
  double v30 = v6;
  result.size.CGFloat height = v30;
  result.size.CGFloat width = v29;
  result.origin.CGFloat y = v28;
  result.origin.CGFloat x = v27;
  return result;
}

- (void)_layoutContentHitRectViewForActiveStage
{
  contentHitRectView = self->_contentHitRectView;
  if (contentHitRectView)
  {
    [(NCFullScreenStagingBannerView *)self _contentHitRectForActiveStage];
    -[UIView setFrame:](contentHitRectView, "setFrame:");
  }
}

- (void)_layoutForStage:(int64_t)a3 fromStage:(int64_t)a4 settings:(id)a5 completion:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke;
  aBlock[3] = &unk_1E6A92320;
  id v12 = v11;
  id v24 = v12;
  CGFloat v13 = _Block_copy(aBlock);
  [(NCFullScreenStagingBannerView *)self _configureContentHitRectViewIfNecessary];
  if (self->_contentHitRectView)
  {
    objc_initWeak(&location, self);
    double v14 = (void *)MEMORY[0x1E4FB1EB0];
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    void v20[2] = __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_2;
    v20[3] = &unk_1E6A919A0;
    objc_copyWeak(&v21, &location);
    [v14 _animateUsingSpringInteractive:0 animations:v20 completion:0];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_3;
    v17[3] = &unk_1E6A92348;
    objc_copyWeak(&v19, &location);
    id v18 = v12;
    CGFloat v15 = _Block_copy(v17);

    objc_destroyWeak(&v19);
    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
    CGFloat v13 = v15;
  }
  switch(a3)
  {
    case 3:
      double v16 = [(NCFullScreenStagingBannerView *)self layer];
      [v16 setAllowsHitTesting:0];

      if (a4 == 2)
      {
        [(NCFullScreenStagingBannerView *)self _layoutForDismissedStageFromDetailStageWithSettings:v10 completion:v13];
      }
      else if (a4 == 1)
      {
        [(NCFullScreenStagingBannerView *)self _layoutForDismissedStageFromBriefStageWithSettings:v10 completion:v13];
      }
      break;
    case 2:
      [(NCFullScreenStagingBannerView *)self _layoutForDetailStageWithSettings:v10 completion:v13];
      break;
    case 1:
      [(NCFullScreenStagingBannerView *)self _layoutForBriefStageWithSettings:v10 completion:v13];
      break;
  }
}

uint64_t __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke(uint64_t a1)
{
  uint64_t result = *(void *)(a1 + 32);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

void __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained[66] setAlpha:0.0];
    id WeakRetained = v2;
  }
}

void __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  double v6 = (void *)MEMORY[0x1E4FB1EB0];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_4;
  v8[3] = &unk_1E6A919A0;
  objc_copyWeak(&v9, (id *)(a1 + 40));
  [v6 _animateUsingSpringInteractive:0 animations:v8 completion:0];
  uint64_t v7 = *(void *)(a1 + 32);
  if (v7) {
    (*(void (**)(uint64_t, uint64_t, uint64_t))(v7 + 16))(v7, a2, a3);
  }
  objc_destroyWeak(&v9);
}

void __79__NCFullScreenStagingBannerView__layoutForStage_fromStage_settings_completion___block_invoke_4(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    uint64_t v2 = WeakRetained;
    [WeakRetained _layoutContentHitRectViewForActiveStage];
    [v2[66] setAlpha:1.0];
    id WeakRetained = v2;
  }
}

- (void)_transitionToStage:(int64_t)a3 fromStage:(int64_t)a4 settings:(id)a5 completion:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4FB1EB0];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  CGFloat v15 = __82__NCFullScreenStagingBannerView__transitionToStage_fromStage_settings_completion___block_invoke;
  double v16 = &unk_1E6A91E60;
  CGFloat v17 = self;
  int64_t v18 = a3;
  id v11 = a6;
  id v12 = a5;
  [v10 performWithoutAnimation:&v13];
  -[NCFullScreenStagingBannerView _layoutForStage:fromStage:settings:completion:](self, "_layoutForStage:fromStage:settings:completion:", a3, a4, v12, v11, v13, v14, v15, v16, v17, v18);
}

uint64_t __82__NCFullScreenStagingBannerView__transitionToStage_fromStage_settings_completion___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _prepareForTransitionToStage:*(void *)(a1 + 40)];
}

- (void)_configureTapGestureIfNecessary
{
  if (!self->_tapGesture)
  {
    double v3 = (UITapGestureRecognizer *)[objc_alloc(MEMORY[0x1E4FB1D38]) initWithTarget:self action:sel__handleTap_];
    tapGesture = self->_tapGesture;
    self->_tapGesture = v3;

    [(UITapGestureRecognizer *)self->_tapGesture setDelegate:self];
    double v5 = self->_tapGesture;
    [(NCFullScreenStagingBannerView *)self addGestureRecognizer:v5];
  }
}

- (void)_handleTap:(id)a3
{
  id v4 = a3;
  [(NCFullScreenStagingBannerView *)self _contentHitRectForActiveStage];
  CGFloat v6 = v5;
  CGFloat v8 = v7;
  CGFloat v10 = v9;
  CGFloat v12 = v11;
  [v4 locationInView:self];
  CGFloat v14 = v13;
  CGFloat v16 = v15;

  v22.origin.CGFloat x = v6;
  v22.origin.CGFloat y = v8;
  v22.size.CGFloat width = v10;
  v22.size.CGFloat height = v12;
  v21.CGFloat x = v14;
  v21.CGFloat y = v16;
  BOOL v17 = CGRectContainsPoint(v22, v21);
  int64_t v18 = &OBJC_IVAR___NCFullScreenStagingBannerView__defaultTapAction;
  if (v17) {
    int64_t v18 = &OBJC_IVAR___NCFullScreenStagingBannerView__contentTapAction;
  }
  id v19 = *(Class *)((char *)&self->super.super.super.isa + *v18);

  [v19 performWithSender:self target:0];
}

- (NCUNUIKitPrototypeSettings)settings
{
  return self->_settings;
}

- (NCNotificationStaticContentProviding)staticContentProvider
{
  return self->_staticContentProvider;
}

- (UIAction)contentTapAction
{
  return self->_contentTapAction;
}

- (void)setContentTapAction:(id)a3
{
}

- (UIAction)defaultTapAction
{
  return self->_defaultTapAction;
}

- (void)setDefaultTapAction:(id)a3
{
}

- (int64_t)stage
{
  return self->_stage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_defaultTapAction, 0);
  objc_storeStrong((id *)&self->_contentTapAction, 0);
  objc_storeStrong((id *)&self->_staticContentProvider, 0);
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_importantTextVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_contentHitRectView, 0);
  objc_storeStrong((id *)&self->_tapGesture, 0);
  objc_storeStrong((id *)&self->_floatAnimatablePropertyForDetailText, 0);
  objc_storeStrong((id *)&self->_floatAnimatablePropertyForDetailIconPosition, 0);
  objc_storeStrong((id *)&self->_floatAnimatablePropertyForBriefTextPosition, 0);
  objc_storeStrong((id *)&self->_floatAnimatablePropertyForBriefIcon, 0);
  objc_storeStrong((id *)&self->_thumbnailView, 0);
  objc_storeStrong((id *)&self->_detailSecondaryLabel, 0);
  objc_storeStrong((id *)&self->_detailPrimaryLabel, 0);
  objc_storeStrong((id *)&self->_detailScrollView, 0);
  objc_storeStrong((id *)&self->_dateLabel, 0);
  objc_storeStrong((id *)&self->_referenceDateLabel, 0);
  objc_storeStrong((id *)&self->_briefSecondaryLabel, 0);
  objc_storeStrong((id *)&self->_briefPrimaryLabelView, 0);
  objc_storeStrong((id *)&self->_badgedIconView, 0);

  objc_storeStrong((id *)&self->_grabberView, 0);
}

@end