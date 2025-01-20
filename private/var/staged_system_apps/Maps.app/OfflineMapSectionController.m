@interface OfflineMapSectionController
- (BOOL)hasContent;
- (BOOL)isActive;
- (MUInfoCardAnalyticsDelegate)analyticsDelegate;
- (MUPlaceCallToActionAppearance)submissionStatus;
- (MUPlaceSectionFooterViewModel)sectionFooterViewModel;
- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel;
- (MapDataSubscriptionInfo)subscriptionInfo;
- (NSArray)sectionViews;
- (OfflineMapSectionController)initWithSubscriptionInfo:(id)a3;
- (UIView)sectionView;
- (UIViewController)sectionViewController;
- (id)analyticsModule;
- (id)draggableContent;
- (id)infoCardChildPossibleActions;
- (id)infoCardChildUnactionableUIElements;
- (id)revealedAnalyticsModule;
- (void)setActive:(BOOL)a3;
- (void)setAnalyticsDelegate:(id)a3;
- (void)setSubmissionStatus:(id)a3;
- (void)setSubscriptionInfo:(id)a3;
@end

@implementation OfflineMapSectionController

- (OfflineMapSectionController)initWithSubscriptionInfo:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)OfflineMapSectionController;
  v6 = [(OfflineMapSectionController *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_subscriptionInfo, a3);
  }

  return v7;
}

- (UIView)sectionView
{
  sectionView = self->_sectionView;
  if (!sectionView)
  {
    v4 = [objc_alloc((Class)UIView) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
    id v5 = self->_sectionView;
    self->_sectionView = v4;

    sectionView = self->_sectionView;
  }

  return sectionView;
}

- (NSArray)sectionViews
{
  v2 = [(OfflineMapSectionController *)self sectionView];
  id v5 = v2;
  v3 = +[NSArray arrayWithObjects:&v5 count:1];

  return (NSArray *)v3;
}

- (UIViewController)sectionViewController
{
  return 0;
}

- (id)draggableContent
{
  return 0;
}

- (MUPlaceSectionHeaderViewModel)sectionHeaderViewModel
{
  return 0;
}

- (MUPlaceSectionFooterViewModel)sectionFooterViewModel
{
  return 0;
}

- (BOOL)hasContent
{
  return 1;
}

- (id)infoCardChildPossibleActions
{
  return &__NSArray0__struct;
}

- (id)infoCardChildUnactionableUIElements
{
  return &__NSArray0__struct;
}

- (id)analyticsModule
{
  v2 = objc_opt_new();

  return v2;
}

- (id)revealedAnalyticsModule
{
  return 0;
}

- (BOOL)isActive
{
  return self->_active;
}

- (void)setActive:(BOOL)a3
{
  self->_active = a3;
}

- (MUPlaceCallToActionAppearance)submissionStatus
{
  return self->_submissionStatus;
}

- (void)setSubmissionStatus:(id)a3
{
}

- (MUInfoCardAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (MUInfoCardAnalyticsDelegate *)WeakRetained;
}

- (void)setAnalyticsDelegate:(id)a3
{
}

- (MapDataSubscriptionInfo)subscriptionInfo
{
  return self->_subscriptionInfo;
}

- (void)setSubscriptionInfo:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_subscriptionInfo, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_storeStrong((id *)&self->_submissionStatus, 0);

  objc_storeStrong((id *)&self->_sectionView, 0);
}

@end