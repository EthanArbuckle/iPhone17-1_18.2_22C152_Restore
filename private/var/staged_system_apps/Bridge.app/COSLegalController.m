@interface COSLegalController
- (BOOL)errorHasOccurred;
- (BOOL)hasFetchedDocuments;
- (BOOL)sarURLAdded;
- (BOOL)shouldReloadSpecifiersOnResume;
- (BOOL)shouldShowBuiltinAppsPane;
- (COSLegalController)init;
- (NSSManager)nssManager;
- (NSString)builtinAppsMarkup;
- (NSString)legalNoticesMarkup;
- (NSString)licenseMarkup;
- (NSString)rfExposureMarkup;
- (PSSpecifier)builtinAppsSpecifier;
- (PSSpecifier)legalNoticesSpecifier;
- (PSSpecifier)licenseSpecifier;
- (PSSpecifier)remoteLoadingSpecifier;
- (PSSpecifier)rfExposureSpecifier;
- (PSSpecifier)warrantyPointerSpecifier;
- (id)specifiers;
- (void)handleLegalDocuments:(id)a3 error:(id)a4;
- (void)queryGizmoForLegalDocuments;
- (void)setBuiltinAppsMarkup:(id)a3;
- (void)setBuiltinAppsSpecifier:(id)a3;
- (void)setErrorHasOccurred:(BOOL)a3;
- (void)setHasFetchedDocuments:(BOOL)a3;
- (void)setLegalNoticesMarkup:(id)a3;
- (void)setLegalNoticesSpecifier:(id)a3;
- (void)setLicenseMarkup:(id)a3;
- (void)setLicenseSpecifier:(id)a3;
- (void)setNssManager:(id)a3;
- (void)setRemoteLoadingSpecifier:(id)a3;
- (void)setRfExposureMarkup:(id)a3;
- (void)setRfExposureSpecifier:(id)a3;
- (void)setSarURLAdded:(BOOL)a3;
- (void)setWarrantyPointerSpecifier:(id)a3;
- (void)startSpinnerInCellForSpecifier:(id)a3;
- (void)stopSpinner;
- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4;
@end

@implementation COSLegalController

- (COSLegalController)init
{
  v6.receiver = self;
  v6.super_class = (Class)COSLegalController;
  v2 = [(COSLegalController *)&v6 init];
  if (v2)
  {
    objc_storeWeak(&qword_10029AF10, v2);
    uint64_t v3 = objc_opt_new();
    nssManager = v2->_nssManager;
    v2->_nssManager = (NSSManager *)v3;

    [(COSLegalController *)v2 queryGizmoForLegalDocuments];
  }
  return v2;
}

- (void)queryGizmoForLegalDocuments
{
  objc_initWeak(&location, self);
  nssManager = self->_nssManager;
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10002F1A0;
  v4[3] = &unk_100243F08;
  objc_copyWeak(&v5, &location);
  [(NSSManager *)nssManager getLegalDocuments:v4];
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)handleLegalDocuments:(id)a3 error:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = v7;
  self->_hasFetchedDocuments = 1;
  if (!v6 || v7)
  {
    self->_errorHasOccurred = 1;
    v20 = pbb_bridge_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Error has occured: %@", buf, 0xCu);
    }

    legalNoticesMarkup = self->_legalNoticesMarkup;
    self->_legalNoticesMarkup = 0;

    licenseMarkup = self->_licenseMarkup;
    self->_licenseMarkup = 0;

    rfExposureMarkup = self->_rfExposureMarkup;
    self->_rfExposureMarkup = 0;

    self->_sarURLAdded = 0;
    if (self->_remoteLoadingSpecifier == self->_licenseSpecifier)
    {
      v24 = -[COSLegalController indexPathForSpecifier:](self, "indexPathForSpecifier:");
      v25 = [(COSLegalController *)self table];
      v26.receiver = self;
      v26.super_class = (Class)COSLegalController;
      [(COSLegalController *)&v26 tableView:v25 didSelectRowAtIndexPath:v24];
    }
    BPSPresentGizmoUnreachableServiceAlertWithDismissalHandler();
  }
  else
  {
    self->_errorHasOccurred = 0;
    v9 = [v6 objectForKeyedSubscript:kNSSLegalDocumentsLegalNoticesKey];
    v10 = self->_legalNoticesMarkup;
    self->_legalNoticesMarkup = v9;

    v11 = [v6 objectForKeyedSubscript:kNSSLegalDocumentsLicenseKey];
    v12 = self->_licenseMarkup;
    self->_licenseMarkup = v11;

    v13 = [v6 objectForKeyedSubscript:kNSSLegalDocumentsSarStatementKey];
    v14 = self->_rfExposureMarkup;
    self->_rfExposureMarkup = v13;

    v15 = [v6 objectForKeyedSubscript:kNSSLegalDocumentsSarUrlAddedKey];
    self->_sarURLAdded = [v15 BOOLValue];

    v16 = [v6 objectForKeyedSubscript:kNSSLegalDocumentsBuiltinAppsKey];
    builtinAppsMarkup = self->_builtinAppsMarkup;
    self->_builtinAppsMarkup = v16;

    if (self->_remoteLoadingSpecifier)
    {
      v18 = -[COSLegalController indexPathForSpecifier:](self, "indexPathForSpecifier:");
      v19 = [(COSLegalController *)self table];
      [(COSLegalController *)self tableView:v19 didSelectRowAtIndexPath:v18];
    }
  }
  [(COSLegalController *)self stopSpinner];
}

- (id)specifiers
{
  uint64_t v3 = OBJC_IVAR___PSListController__specifiers;
  v4 = *(void **)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers];
  if (!v4)
  {
    id v5 = +[NSBundle bundleForClass:objc_opt_class()];
    id v6 = [v5 localizedStringForKey:@"LEGAL_NOTICES" value:&stru_100249230 table:@"Legal"];
    id v7 = +[PSSpecifier preferenceSpecifierNamed:v6 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    legalNoticesSpecifier = self->_legalNoticesSpecifier;
    self->_legalNoticesSpecifier = v7;

    v9 = +[NSBundle bundleForClass:objc_opt_class()];
    v10 = [v9 localizedStringForKey:@"LICENSE" value:&stru_100249230 table:@"Legal"];
    v11 = +[PSSpecifier preferenceSpecifierNamed:v10 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    licenseSpecifier = self->_licenseSpecifier;
    self->_licenseSpecifier = v11;

    v13 = +[NSBundle bundleForClass:objc_opt_class()];
    v14 = [v13 localizedStringForKey:@"WARRANTY_POINTER" value:&stru_100249230 table:@"Legal"];
    v15 = +[PSSpecifier preferenceSpecifierNamed:v14 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    warrantyPointerSpecifier = self->_warrantyPointerSpecifier;
    self->_warrantyPointerSpecifier = v15;

    v17 = +[NSBundle bundleForClass:objc_opt_class()];
    v18 = [v17 localizedStringForKey:@"RF_EXPOSURE" value:&stru_100249230 table:@"Legal"];
    v19 = +[PSSpecifier preferenceSpecifierNamed:v18 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
    rfExposureSpecifier = self->_rfExposureSpecifier;
    self->_rfExposureSpecifier = v19;

    v21 = +[NSMutableArray arrayWithObjects:](NSMutableArray, "arrayWithObjects:", self->_legalNoticesSpecifier, self->_licenseSpecifier, self->_warrantyPointerSpecifier, self->_rfExposureSpecifier, 0);
    if ([(COSLegalController *)self shouldShowBuiltinAppsPane])
    {
      v22 = +[NSBundle bundleForClass:objc_opt_class()];
      v23 = [v22 localizedStringForKey:@"BUILTIN_APPS" value:&stru_100249230 table:@"Legal"];
      v24 = +[PSSpecifier preferenceSpecifierNamed:v23 target:0 set:0 get:0 detail:objc_opt_class() cell:1 edit:0];
      builtinAppsSpecifier = self->_builtinAppsSpecifier;
      self->_builtinAppsSpecifier = v24;

      [v21 insertObject:self->_builtinAppsSpecifier atIndex:[v21 indexOfObject:self->_rfExposureSpecifier]];
    }
    uint64_t v26 = +[NSArray arrayWithArray:v21];
    v27 = *(void **)&self->BPSListController_opaque[v3];
    *(void *)&self->BPSListController_opaque[v3] = v26;

    v4 = *(void **)&self->BPSListController_opaque[v3];
  }

  return v4;
}

- (void)startSpinnerInCellForSpecifier:(id)a3
{
  id v4 = a3;
  [(COSLegalController *)self stopSpinner];
  id v7 = [v4 propertyForKey:PSTableCellKey];
  if (v7)
  {
    id v5 = [objc_alloc((Class)UIActivityIndicatorView) initWithActivityIndicatorStyle:100];
    [v5 startAnimating];
    [v7 setForceHideDisclosureIndicator:1];
    [v7 setAccessoryView:v5];
  }
  remoteLoadingSpecifier = self->_remoteLoadingSpecifier;
  self->_remoteLoadingSpecifier = (PSSpecifier *)v4;
}

- (void)stopSpinner
{
  remoteLoadingSpecifier = self->_remoteLoadingSpecifier;
  if (remoteLoadingSpecifier)
  {
    id v5 = [(PSSpecifier *)remoteLoadingSpecifier propertyForKey:PSTableCellKey];
    [v5 setAccessoryView:0];
    [v5 setForceHideDisclosureIndicator:0];
    id v4 = self->_remoteLoadingSpecifier;
    self->_remoteLoadingSpecifier = 0;
  }
}

- (BOOL)shouldShowBuiltinAppsPane
{
  v2 = [UIApp activeWatch];
  NRWatchOSVersionForRemoteDevice();
  uint64_t v3 = [v2 valueForProperty:NRDevicePropertyGreenTeaDevice];
  if ([v3 BOOLValue]) {
    char IsGreaterThanOrEqual = NRVersionIsGreaterThanOrEqual();
  }
  else {
    char IsGreaterThanOrEqual = 0;
  }

  return IsGreaterThanOrEqual;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(COSLegalController *)self indexForIndexPath:v7];
  if (v8 != (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v9 = [*(id *)&self->BPSListController_opaque[OBJC_IVAR___PSListController__specifiers] objectAtIndex:v8];
    if (v9 == self->_warrantyPointerSpecifier || self->_hasFetchedDocuments && !self->_errorHasOccurred)
    {
      [(COSLegalController *)self stopSpinner];
      v10.receiver = self;
      v10.super_class = (Class)COSLegalController;
      [(COSLegalController *)&v10 tableView:v6 didSelectRowAtIndexPath:v7];
    }
    else
    {
      [v6 deselectRowAtIndexPath:v7 animated:1];
      [(COSLegalController *)self startSpinnerInCellForSpecifier:v9];
      if (self->_errorHasOccurred) {
        [(COSLegalController *)self queryGizmoForLegalDocuments];
      }
    }
  }
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (NSSManager)nssManager
{
  return self->_nssManager;
}

- (void)setNssManager:(id)a3
{
}

- (PSSpecifier)legalNoticesSpecifier
{
  return self->_legalNoticesSpecifier;
}

- (void)setLegalNoticesSpecifier:(id)a3
{
}

- (PSSpecifier)licenseSpecifier
{
  return self->_licenseSpecifier;
}

- (void)setLicenseSpecifier:(id)a3
{
}

- (PSSpecifier)warrantyPointerSpecifier
{
  return self->_warrantyPointerSpecifier;
}

- (void)setWarrantyPointerSpecifier:(id)a3
{
}

- (PSSpecifier)rfExposureSpecifier
{
  return self->_rfExposureSpecifier;
}

- (void)setRfExposureSpecifier:(id)a3
{
}

- (PSSpecifier)builtinAppsSpecifier
{
  return self->_builtinAppsSpecifier;
}

- (void)setBuiltinAppsSpecifier:(id)a3
{
}

- (BOOL)hasFetchedDocuments
{
  return self->_hasFetchedDocuments;
}

- (void)setHasFetchedDocuments:(BOOL)a3
{
  self->_hasFetchedDocuments = a3;
}

- (BOOL)errorHasOccurred
{
  return self->_errorHasOccurred;
}

- (void)setErrorHasOccurred:(BOOL)a3
{
  self->_errorHasOccurred = a3;
}

- (NSString)legalNoticesMarkup
{
  return self->_legalNoticesMarkup;
}

- (void)setLegalNoticesMarkup:(id)a3
{
}

- (NSString)licenseMarkup
{
  return self->_licenseMarkup;
}

- (void)setLicenseMarkup:(id)a3
{
}

- (NSString)rfExposureMarkup
{
  return self->_rfExposureMarkup;
}

- (void)setRfExposureMarkup:(id)a3
{
}

- (NSString)builtinAppsMarkup
{
  return self->_builtinAppsMarkup;
}

- (void)setBuiltinAppsMarkup:(id)a3
{
}

- (BOOL)sarURLAdded
{
  return self->_sarURLAdded;
}

- (void)setSarURLAdded:(BOOL)a3
{
  self->_sarURLAdded = a3;
}

- (PSSpecifier)remoteLoadingSpecifier
{
  return self->_remoteLoadingSpecifier;
}

- (void)setRemoteLoadingSpecifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_remoteLoadingSpecifier, 0);
  objc_storeStrong((id *)&self->_builtinAppsMarkup, 0);
  objc_storeStrong((id *)&self->_rfExposureMarkup, 0);
  objc_storeStrong((id *)&self->_licenseMarkup, 0);
  objc_storeStrong((id *)&self->_legalNoticesMarkup, 0);
  objc_storeStrong((id *)&self->_builtinAppsSpecifier, 0);
  objc_storeStrong((id *)&self->_rfExposureSpecifier, 0);
  objc_storeStrong((id *)&self->_warrantyPointerSpecifier, 0);
  objc_storeStrong((id *)&self->_licenseSpecifier, 0);
  objc_storeStrong((id *)&self->_legalNoticesSpecifier, 0);

  objc_storeStrong((id *)&self->_nssManager, 0);
}

@end