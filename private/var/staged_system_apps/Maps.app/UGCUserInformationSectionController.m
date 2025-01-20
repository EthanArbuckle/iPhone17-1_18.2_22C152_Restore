@interface UGCUserInformationSectionController
- (BOOL)formInteractionEnabled;
- (BOOL)isInsetGrouped;
- (NSArray)rowItems;
- (UGCPOIEnrichmentAnalyticsDelegate)analyticsDelegate;
- (UGCSectionControllerDelegate)delegate;
- (UGCUserInformationSectionController)initWithInsetGrouped:(BOOL)a3;
- (id)_legalDisclosureString;
- (void)_retrieveUserInformation;
- (void)_setupUserInfoView;
- (void)setDelegate:(id)a3;
- (void)setFormInteractionEnabled:(BOOL)a3;
- (void)userInformationCellDidSelectLegalAttribution:(id)a3;
@end

@implementation UGCUserInformationSectionController

- (UGCUserInformationSectionController)initWithInsetGrouped:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)UGCUserInformationSectionController;
  v4 = [(UGCUserInformationSectionController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_isInsetGrouped = a3;
    [(UGCUserInformationSectionController *)v4 _setupUserInfoView];
  }
  return v5;
}

- (void)_setupUserInfoView
{
  v3 = [[UGCUserInformationCell alloc] initWithEmphasis:1];
  userInformationCell = self->_userInformationCell;
  self->_userInformationCell = v3;

  [(UGCUserInformationCell *)self->_userInformationCell setWantsButtonShapes:!self->_isInsetGrouped];
  [(UGCUserInformationCell *)self->_userInformationCell updateLayoutMarginsForIsInsetGrouped:self->_isInsetGrouped];
  [(UGCUserInformationCell *)self->_userInformationCell setDelegate:self];
  if (!self->_isInsetGrouped
    && sub_1000BBB44(self->_userInformationCell) != 5
    && (MapsFeature_IsEnabled_ARPCommunityID() & 1) == 0)
  {
    [(UGCPOIEnrichmentEditorCell *)self->_userInformationCell setShowTopHairline:1];
  }

  [(UGCUserInformationSectionController *)self _retrieveUserInformation];
}

- (void)_retrieveUserInformation
{
  v3 = +[GEOUserAccountInfo primaryICloudAccount];
  v4 = +[UserInformationManager sharedInstance];
  if (v3)
  {
    v5 = objc_alloc_init(UGCUserInformationViewModel);
    v6 = +[NSBundle mainBundle];
    objc_super v7 = [v6 localizedStringForKey:@"[UGC] Contribution Name" value:@"localized string not found" table:0];
    v8 = [v4 userName];
    v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v7, v8);
    [(UGCUserInformationViewModel *)v5 setUserName:v9];

    v10 = [v4 userEmail];
    [(UGCUserInformationViewModel *)v5 setUserEmail:v10];

    v11 = [v4 userIcon];
    [(UGCUserInformationViewModel *)v5 setUserIcon:v11];

    v12 = [(UGCUserInformationSectionController *)self _legalDisclosureString];
    [(UGCUserInformationViewModel *)v5 setLegalDisclosureString:v12];

    [(UGCUserInformationCell *)self->_userInformationCell setViewModel:v5];
    objc_initWeak(&location, self);
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_100755088;
    v13[3] = &unk_1012EBDD8;
    objc_copyWeak(&v15, &location);
    id v14 = v4;
    [v14 retrieveAddressForLocationWithCompletion:v13];

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (id)_legalDisclosureString
{
  if ([(UGCUserInformationSectionController *)self isInsetGrouped])
  {
    v2 = +[NSBundle mainBundle];
    v3 = v2;
    CFStringRef v4 = @"Inline ratings legal disclaimer [UGC]";
  }
  else
  {
    int IsEnabled_ARPCommunityID = MapsFeature_IsEnabled_ARPCommunityID();
    v2 = +[NSBundle mainBundle];
    v3 = v2;
    if (IsEnabled_ARPCommunityID) {
      CFStringRef v4 = @"Ratings and photos legal disclaimer for CommunityID [UGC]";
    }
    else {
      CFStringRef v4 = @"Ratings and photos legal disclaimer [UGC]";
    }
  }
  v6 = [v2 localizedStringForKey:v4 value:@"localized string not found" table:0];

  return v6;
}

- (NSArray)rowItems
{
  rowItems = self->_rowItems;
  if (!rowItems)
  {
    CFStringRef v4 = +[UGCPOIEnrichmentRowItem rowItemWithView:self->_userInformationCell];
    v12 = v4;
    v5 = +[NSArray arrayWithObjects:&v12 count:1];
    v6 = self->_rowItems;
    self->_rowItems = v5;

    rowItems = self->_rowItems;
    if (self->_isInsetGrouped)
    {
      objc_super v7 = +[UGCPOIEnrichmentGroupedSectionView groupedSectionRowItemWithRowItems:rowItems bottomSpacing:16.0];
      v11 = v7;
      v8 = +[NSArray arrayWithObjects:&v11 count:1];
      v9 = self->_rowItems;
      self->_rowItems = v8;

      rowItems = self->_rowItems;
    }
  }

  return rowItems;
}

- (void)userInformationCellDidSelectLegalAttribution:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained sectionControllerRequestsLegalAttribution:self];
}

- (UGCSectionControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (UGCSectionControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)formInteractionEnabled
{
  return self->_formInteractionEnabled;
}

- (void)setFormInteractionEnabled:(BOOL)a3
{
  self->_formInteractionEnabled = a3;
}

- (UGCPOIEnrichmentAnalyticsDelegate)analyticsDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_analyticsDelegate);

  return (UGCPOIEnrichmentAnalyticsDelegate *)WeakRetained;
}

- (BOOL)isInsetGrouped
{
  return self->_isInsetGrouped;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rowItems, 0);
  objc_destroyWeak((id *)&self->_analyticsDelegate);
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_userInformationCell, 0);
}

@end