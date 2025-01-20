@interface NCDigestSummaryPlatterView
- (BOOL)adjustForContentSizeCategoryChange;
- (BOOL)adjustsFontForContentSizeCategory;
- (BOOL)presentFeaturedNotificationsInline;
- (CGSize)sizeThatFits:(CGSize)a3;
- (NCDigestSummaryPlatterView)initWithRecipe:(int64_t)a3;
- (NCNotificationSummaryContentProviding)appsSummaryContentProvider;
- (NCNotificationSummaryContentProviding)communicationsSummaryContentProvider;
- (NSArray)featuredNotificationContentProviders;
- (NSDate)date;
- (NSString)heading;
- (NSString)subheading;
- (NSTimeZone)timeZone;
- (UIView)clearControlView;
- (id)requiredVisualStyleCategories;
- (int64_t)dateFormatStyle;
- (unint64_t)count;
- (void)_configureSummaryViewIfNecessary;
- (void)didMoveToSuperview;
- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3;
- (void)setAppsSummaryContentProvider:(id)a3;
- (void)setClearControlView:(id)a3;
- (void)setCommunicationsSummaryContentProvider:(id)a3;
- (void)setCount:(unint64_t)a3;
- (void)setDate:(id)a3;
- (void)setDateFormatStyle:(int64_t)a3;
- (void)setFeaturedNotificationContentProviders:(id)a3;
- (void)setHeading:(id)a3;
- (void)setMaterialGroupNameBase:(id)a3;
- (void)setPresentFeaturedNotificationsInline:(BOOL)a3;
- (void)setSubheading:(id)a3;
- (void)setTimeZone:(id)a3;
- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4;
- (void)updateContent;
@end

@implementation NCDigestSummaryPlatterView

- (NCDigestSummaryPlatterView)initWithRecipe:(int64_t)a3
{
  if ((unint64_t)a3 <= 1) {
    a3 = 1;
  }
  v6.receiver = self;
  v6.super_class = (Class)NCDigestSummaryPlatterView;
  v3 = [(PLPlatterView *)&v6 initWithRecipe:a3];
  v4 = v3;
  if (v3)
  {
    [(PLPlatterView *)v3 _setContinuousCornerRadius:28.0];
    [(NCDigestSummaryPlatterView *)v4 _configureSummaryViewIfNecessary];
  }
  return v4;
}

- (void)updateContent
{
  [(NCDigestSummaryView *)self->_summaryView updateContent];

  [(NCDigestSummaryPlatterView *)self setNeedsLayout];
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  -[NCDigestSummaryView sizeThatFits:](self->_summaryView, "sizeThatFits:", a3.width, a3.height);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)didMoveToSuperview
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  v15.receiver = self;
  v15.super_class = (Class)NCDigestSummaryPlatterView;
  [(NCDigestSummaryPlatterView *)&v15 didMoveToSuperview];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  double v3 = [(NCDigestSummaryView *)self->_summaryView requiredVisualStyleCategories];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = [*(id *)(*((void *)&v11 + 1) + 8 * v7) integerValue];
        summaryView = self->_summaryView;
        v10 = [(PLPlatterView *)self visualStylingProviderForCategory:v8];
        [(NCDigestSummaryView *)summaryView setVisualStylingProvider:v10 forCategory:v8];

        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v5);
  }
}

- (NSDate)date
{
  return [(NCDigestSummaryView *)self->_summaryView date];
}

- (void)setDate:(id)a3
{
}

- (NSTimeZone)timeZone
{
  return [(NCDigestSummaryView *)self->_summaryView timeZone];
}

- (void)setTimeZone:(id)a3
{
}

- (int64_t)dateFormatStyle
{
  return [(NCDigestSummaryView *)self->_summaryView dateFormatStyle];
}

- (void)setDateFormatStyle:(int64_t)a3
{
}

- (NSString)heading
{
  return [(NCDigestSummaryView *)self->_summaryView heading];
}

- (void)setHeading:(id)a3
{
}

- (NSString)subheading
{
  return [(NCDigestSummaryView *)self->_summaryView subheading];
}

- (void)setSubheading:(id)a3
{
}

- (unint64_t)count
{
  return [(NCDigestSummaryView *)self->_summaryView count];
}

- (void)setCount:(unint64_t)a3
{
}

- (BOOL)presentFeaturedNotificationsInline
{
  return [(NCDigestSummaryView *)self->_summaryView presentFeaturedNotificationsInline];
}

- (void)setPresentFeaturedNotificationsInline:(BOOL)a3
{
}

- (NSArray)featuredNotificationContentProviders
{
  return [(NCDigestSummaryView *)self->_summaryView featuredNotificationContentProviders];
}

- (void)setFeaturedNotificationContentProviders:(id)a3
{
}

- (NCNotificationSummaryContentProviding)communicationsSummaryContentProvider
{
  return [(NCDigestSummaryView *)self->_summaryView communicationsSummaryContentProvider];
}

- (void)setCommunicationsSummaryContentProvider:(id)a3
{
}

- (NCNotificationSummaryContentProviding)appsSummaryContentProvider
{
  return [(NCDigestSummaryView *)self->_summaryView appsSummaryContentProvider];
}

- (void)setAppsSummaryContentProvider:(id)a3
{
}

- (UIView)clearControlView
{
  return [(NCDigestSummaryView *)self->_summaryView clearControlView];
}

- (void)setClearControlView:(id)a3
{
}

- (id)requiredVisualStyleCategories
{
  double v3 = (void *)MEMORY[0x1E4F1CA80];
  v9.receiver = self;
  v9.super_class = (Class)NCDigestSummaryPlatterView;
  uint64_t v4 = [(PLPlatterView *)&v9 requiredVisualStyleCategories];
  uint64_t v5 = [v3 setWithArray:v4];

  uint64_t v6 = [(NCDigestSummaryView *)self->_summaryView requiredVisualStyleCategories];
  [v5 addObjectsFromArray:v6];

  uint64_t v7 = [v5 allObjects];

  return v7;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)NCDigestSummaryPlatterView;
  id v6 = a3;
  [(PLPlatterView *)&v7 setVisualStylingProvider:v6 forCategory:a4];
  -[NCDigestSummaryView setVisualStylingProvider:forCategory:](self->_summaryView, "setVisualStylingProvider:forCategory:", v6, a4, v7.receiver, v7.super_class);
}

- (void)setMaterialGroupNameBase:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)NCDigestSummaryPlatterView;
  id v4 = a3;
  [(PLPlatterView *)&v5 setMaterialGroupNameBase:v4];
  -[NCDigestSummaryView setMaterialGroupNameBase:](self->_summaryView, "setMaterialGroupNameBase:", v4, v5.receiver, v5.super_class);
}

- (BOOL)adjustsFontForContentSizeCategory
{
  return [(NCDigestSummaryView *)self->_summaryView adjustsFontForContentSizeCategory];
}

- (void)setAdjustsFontForContentSizeCategory:(BOOL)a3
{
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return [(NCDigestSummaryView *)self->_summaryView adjustForContentSizeCategoryChange];
}

- (void)_configureSummaryViewIfNecessary
{
  if (!self->_summaryView)
  {
    id v6 = [(PLPlatterView *)self customContentView];
    double v3 = [NCDigestSummaryView alloc];
    [v6 bounds];
    id v4 = -[NCDigestSummaryView initWithFrame:](v3, "initWithFrame:");
    summaryView = self->_summaryView;
    self->_summaryView = v4;

    [v6 addSubview:self->_summaryView];
    [(NCDigestSummaryView *)self->_summaryView setAutoresizingMask:18];
    [(NCDigestSummaryView *)self->_summaryView _setContinuousCornerRadius:28.0];
    [(NCDigestSummaryView *)self->_summaryView setClipsToBounds:1];
  }
}

- (void).cxx_destruct
{
}

@end