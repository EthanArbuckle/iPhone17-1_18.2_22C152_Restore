@interface NCDigestInlineFeaturedNotificationsContainerView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSArray)featuredNotificationContentProviders;
- (NSString)materialGroupNameBase;
- (NSString)preferredContentSizeCategory;
- (void)_configureDividerViewIfNecessary;
- (void)_configureInlineFeaturedSectionListIfNecessaryWithDelegate:(id)a3;
- (void)_layoutDividerViewIfNecessary;
- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5;
- (void)layoutSubviews;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setFeaturedNotificationContentProviders:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setPreferredContentSizeCategory:(id)a3;
- (void)updateContent;
@end

@implementation NCDigestInlineFeaturedNotificationsContainerView

- (NSArray)featuredNotificationContentProviders
{
  return self->_featuredNotificationContentProviders;
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
  id v9 = a3;
  if (BSEqualArrays())
  {
    [(NCDigestInlineFeaturedNotificationsContainerView *)self updateContent];
  }
  else
  {
    objc_storeStrong((id *)&self->_featuredNotificationContentProviders, a3);
    v5 = [v9 firstObject];
    v6 = [v5 listComponentDelegate];
    [(NCDigestInlineFeaturedNotificationsContainerView *)self _configureInlineFeaturedSectionListIfNecessaryWithDelegate:v6];

    inlineFeaturedSectionList = self->_inlineFeaturedSectionList;
    v8 = [v9 firstObject];
    -[NCNotificationStructuredSectionList setDeviceAuthenticated:](inlineFeaturedSectionList, "setDeviceAuthenticated:", [v8 isDeviceAuthenticated]);

    [(NCNotificationInlineFeaturedSectionList *)self->_inlineFeaturedSectionList setFeaturedNotificationContentProviders:v9];
  }
  [(NCDigestInlineFeaturedNotificationsContainerView *)self setNeedsLayout];
}

- (void)updateContent
{
  [(NCNotificationInlineFeaturedSectionList *)self->_inlineFeaturedSectionList updateContent];

  [(NCDigestInlineFeaturedNotificationsContainerView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  v5 = [(NCNotificationStructuredSectionList *)self->_inlineFeaturedSectionList listView];
  objc_msgSend(v5, "sizeThatFits:", width, height);
  double v7 = v6;

  double v8 = width;
  double v9 = v7;
  result.double height = v9;
  result.double width = v8;
  return result;
}

- (void)layoutSubviews
{
  v12.receiver = self;
  v12.super_class = (Class)NCDigestInlineFeaturedNotificationsContainerView;
  [(NCDigestInlineFeaturedNotificationsContainerView *)&v12 layoutSubviews];
  [(NCDigestInlineFeaturedNotificationsContainerView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  v11 = [(NCNotificationStructuredSectionList *)self->_inlineFeaturedSectionList listView];
  objc_msgSend(v11, "setVisibleRect:", v4, v6, v8, v10);
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  [(NCDigestInlineFeaturedNotificationsContainerView *)self _configureDividerViewIfNecessary];
  [(NCDigestInlineFeaturedNotificationsContainerView *)self _layoutDividerViewIfNecessary];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  double v3 = [(NCDigestInlineFeaturedNotificationsContainerView *)self traitCollection];
  double v4 = [v3 preferredContentSizeCategory];

  NSComparisonResult v5 = UIContentSizeCategoryCompareToCategory(v4, self->_preferredContentSizeCategory);
  if (v5)
  {
    objc_storeStrong((id *)&self->_preferredContentSizeCategory, v4);
    [(NCNotificationStructuredSectionList *)self->_inlineFeaturedSectionList adjustForContentSizeCategoryChange];
    [(NCDigestInlineFeaturedNotificationsContainerView *)self setNeedsLayout];
  }

  return v5 != NSOrderedSame;
}

- (void)setMaterialGroupNameBase:(id)a3
{
}

- (void)_configureInlineFeaturedSectionListIfNecessaryWithDelegate:(id)a3
{
  id v4 = a3;
  if (!self->_inlineFeaturedSectionList)
  {
    id v10 = v4;
    NSComparisonResult v5 = [(NCNotificationStructuredSectionList *)[NCNotificationInlineFeaturedSectionList alloc] initWithTitle:0 sectionType:9];
    inlineFeaturedSectionList = self->_inlineFeaturedSectionList;
    self->_inlineFeaturedSectionList = v5;

    [(NCNotificationStructuredSectionList *)self->_inlineFeaturedSectionList setLogDescription:@"Inline Featured Digest"];
    double v7 = self->_inlineFeaturedSectionList;
    double v8 = objc_alloc_init(NCNotificationListCache);
    [(NCNotificationStructuredSectionList *)v7 setNotificationListCache:v8];

    if ([v10 conformsToProtocol:&unk_1F2F93F28]) {
      [(NCNotificationStructuredSectionList *)self->_inlineFeaturedSectionList setDelegate:v10];
    }
    double v9 = [(NCNotificationStructuredSectionList *)self->_inlineFeaturedSectionList listView];
    [(NCDigestInlineFeaturedNotificationsContainerView *)self addSubview:v9];

    id v4 = v10;
  }
}

- (void)_configureDividerViewIfNecessary
{
  unint64_t v3 = [(NCNotificationStructuredSectionList *)self->_inlineFeaturedSectionList notificationCount];
  dividerView = self->_dividerView;
  if (dividerView) {
    BOOL v5 = 0;
  }
  else {
    BOOL v5 = v3 >= 2;
  }
  if (v5)
  {
    id v7 = objc_alloc(MEMORY[0x1E4FB1EB0]);
    double v8 = (UIView *)objc_msgSend(v7, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    double v9 = self->_dividerView;
    self->_dividerView = v8;

    id v10 = self->_dividerView;
    v11 = [MEMORY[0x1E4FB1618] blackColor];
    [(UIView *)v10 setBackgroundColor:v11];

    objc_super v12 = self->_dividerView;
    v13 = [(NCNotificationListBaseContentView *)self visualStylingProviderForCategory:1];
    [(NCNotificationListBaseContentView *)self _updateVisualStylingOfView:v12 style:3 visualStylingProvider:v13 outgoingProvider:0];

    v14 = self->_dividerView;
    [(NCDigestInlineFeaturedNotificationsContainerView *)self addSubview:v14];
  }
  else
  {
    if (dividerView) {
      BOOL v6 = v3 > 1;
    }
    else {
      BOOL v6 = 1;
    }
    if (!v6)
    {
      [(UIView *)dividerView removeFromSuperview];
      v15 = self->_dividerView;
      self->_dividerView = 0;
    }
  }
}

- (void)_layoutDividerViewIfNecessary
{
  if (self->_dividerView)
  {
    [(NCDigestInlineFeaturedNotificationsContainerView *)self bounds];
    CGFloat v4 = v3;
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    [(UIView *)self->_dividerView frame];
    id v11 = [(NCNotificationStructuredSectionList *)self->_inlineFeaturedSectionList listView];
    [v11 layoutOffsetForViewAtIndex:1];
    v13.origin.x = v4;
    v13.origin.y = v6;
    v13.size.double width = v8;
    v13.size.double height = v10;
    CGRectGetWidth(v13);
    UIRectIntegralWithScale();
    -[UIView setFrame:](self->_dividerView, "setFrame:");
  }
}

- (void)_visualStylingProviderDidChange:(id)a3 forCategory:(int64_t)a4 outgoingProvider:(id)a5
{
  v10.receiver = self;
  v10.super_class = (Class)NCDigestInlineFeaturedNotificationsContainerView;
  id v8 = a5;
  id v9 = a3;
  [(NCNotificationListBaseContentView *)&v10 _visualStylingProviderDidChange:v9 forCategory:a4 outgoingProvider:v8];
  -[NCNotificationListBaseContentView _updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:](self, "_updateVisualStylingOfView:style:visualStylingProvider:outgoingProvider:", self->_dividerView, 3, v9, v8, v10.receiver, v10.super_class);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return self->_adjustsFontForContentSizeCategory;
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
  self->_adjustsFontForContentSizeCategory = a3;
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
  objc_storeStrong((id *)&self->_dividerView, 0);
  objc_storeStrong((id *)&self->_inlineFeaturedSectionList, 0);
  objc_storeStrong((id *)&self->_strokeVisualStylingProvider, 0);

  objc_storeStrong((id *)&self->_featuredNotificationContentProviders, 0);
}

@end