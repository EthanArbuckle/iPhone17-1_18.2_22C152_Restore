@interface NCNotificationDigestConciseSummaryOrderProvider
- (BOOL)adjustForContentSizeCategoryChange;
- (NCNotificationSummaryContentProvider)summaryContentProvider;
- (NCNotificationSummaryPlatterView)summaryPlatterView;
- (id)leadingSummaryPlatterViewConfigureIfNecessary;
- (void)_updateSummaryContentProvider;
- (void)_updateSummaryPlatterView;
- (void)setDeviceAuthenticated:(BOOL)a3;
- (void)setSummaryContentProvider:(id)a3;
- (void)setSummaryPlatterView:(id)a3;
@end

@implementation NCNotificationDigestConciseSummaryOrderProvider

- (void)setDeviceAuthenticated:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)NCNotificationDigestConciseSummaryOrderProvider;
  -[NCNotificationSummaryOrderProvider setDeviceAuthenticated:](&v5, sel_setDeviceAuthenticated_);
  [(NCNotificationSummaryContentProvider *)self->_summaryContentProvider setDeviceAuthenticated:v3];
  [(NCNotificationSummaryOrderProvider *)self configureSummaryContentDisplaying:self->_summaryPlatterView withSummaryContentProviding:self->_summaryContentProvider];
}

- (BOOL)adjustForContentSizeCategoryChange
{
  return 1;
}

- (id)leadingSummaryPlatterViewConfigureIfNecessary
{
  summaryPlatterView = self->_summaryPlatterView;
  if (!summaryPlatterView)
  {
    v4 = objc_alloc_init(NCNotificationSummaryPlatterView);
    objc_super v5 = self->_summaryPlatterView;
    self->_summaryPlatterView = v4;

    -[NCNotificationSummaryPlatterView setFrame:](self->_summaryPlatterView, "setFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    v6 = self->_summaryPlatterView;
    v7 = [(NCNotificationSummaryOrderProvider *)self materialGroupNameBase];
    [(PLPlatterView *)v6 setMaterialGroupNameBase:v7];

    v8 = self->_summaryPlatterView;
    v9 = [(NCNotificationSummaryOrderProvider *)self summaryPlatterViewTapGestureRecognizer];
    [(NCNotificationSummaryPlatterView *)v8 addGestureRecognizer:v9];

    [(NCNotificationDigestConciseSummaryOrderProvider *)self _updateSummaryPlatterView];
    summaryPlatterView = self->_summaryPlatterView;
  }

  return summaryPlatterView;
}

- (void)_updateSummaryPlatterView
{
  id v3 = [(NCNotificationDigestConciseSummaryOrderProvider *)self leadingSummaryPlatterViewConfigureIfNecessary];
  [(NCNotificationDigestConciseSummaryOrderProvider *)self _updateSummaryContentProvider];
  [(NCNotificationSummaryOrderProvider *)self configureSummaryContentDisplaying:self->_summaryPlatterView withSummaryContentProviding:self->_summaryContentProvider];
  id v4 = [(NCNotificationSummaryOrderProvider *)self delegate];
  [v4 notificationSummaryOrderProviderRequestsReloadingLeadingSummaryPlatterView:self];
}

- (void)_updateSummaryContentProvider
{
  id v12 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];
  id v3 = [(NCNotificationDigestSummaryOrderProvider *)self userNotificationDigest];
  id v4 = [v3 viewFlattenedGroups];

  objc_super v5 = [(NCNotificationSummaryOrderProvider *)self orderedNotificationGroupLists:v12 forATXUserNotificationDigestNotificationGroup:v4 orderGroupNotifications:0];
  if (![v5 count])
  {
    uint64_t v6 = [(NCNotificationSummaryOrderProvider *)self cachedOrderedNotificationGroupLists];

    objc_super v5 = (void *)v6;
  }
  if ([v5 count])
  {
    v7 = [(NCNotificationSummaryOrderProvider *)self representativeNotificationRequestsForNotificationGroupLists:v5];
    v8 = +[NCNotificationSummaryContentProvider summaryContentProviderOfType:3 notificationRequests:v7];
    summaryContentProvider = self->_summaryContentProvider;
    self->_summaryContentProvider = v8;

    [(NCNotificationSummaryContentProvider *)self->_summaryContentProvider setDeviceAuthenticated:[(NCNotificationSummaryOrderProvider *)self isDeviceAuthenticated]];
    v10 = self->_summaryContentProvider;
    v11 = [(NCNotificationSummaryOrderProvider *)self summaryHeading];
    [(NCNotificationSummaryContentProvider *)v10 setSummaryTitle:v11];
  }
  else
  {
    v7 = self->_summaryContentProvider;
    self->_summaryContentProvider = 0;
  }
}

- (NCNotificationSummaryPlatterView)summaryPlatterView
{
  return self->_summaryPlatterView;
}

- (void)setSummaryPlatterView:(id)a3
{
}

- (NCNotificationSummaryContentProvider)summaryContentProvider
{
  return self->_summaryContentProvider;
}

- (void)setSummaryContentProvider:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_summaryContentProvider, 0);

  objc_storeStrong((id *)&self->_summaryPlatterView, 0);
}

@end