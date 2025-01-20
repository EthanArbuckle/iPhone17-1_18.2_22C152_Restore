@interface MapsAppTestRAP
- (BOOL)hasOverriddenPrivacyConsent;
- (BOOL)isServerControlledUIEnabled;
- (BOOL)rapHasPrivacyConsent;
- (BOOL)runTest;
- (NSString)rapCurrentSubTestName;
- (NSString)rapDefaultURL;
- (NSString)rapNotificationString;
- (NSString)rapQuestionCellTitle;
- (SEL)rapSel;
- (void)cleanup:(BOOL)a3;
- (void)handleRAPControllerLoaded:(id)a3;
- (void)handleRAPProblemNotListedControllerLoaded:(id)a3;
- (void)handleRAPThankYouControllerLoaded:(id)a3;
- (void)handleSettingsTableViewControllerLoaded:(id)a3;
- (void)handleTappingFromSettingsButtonIntoSettingsTableViewController;
- (void)overridePrivacyConsent;
- (void)overrideProblemSubmissionURL;
- (void)overrideServerControlledUI;
- (void)restorePrivacyConsent;
- (void)restoreProblemSubmissionURL;
- (void)restoreServerControlledUI;
- (void)setHasOverriddenPrivacyConsent:(BOOL)a3;
- (void)setIsServerControlledUIEnabled:(BOOL)a3;
- (void)setRapCurrentSubTestName:(id)a3;
- (void)setRapDefaultURL:(id)a3;
- (void)setRapHasPrivacyConsent:(BOOL)a3;
- (void)setRapNotificationString:(id)a3;
- (void)setRapQuestionCellTitle:(id)a3;
- (void)setRapSel:(SEL)a3;
@end

@implementation MapsAppTestRAP

- (BOOL)runTest
{
  v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestResetForLaunchURL];

  [(MapsAppTestRAP *)self overrideProblemSubmissionURL];
  [(MapsAppTestRAP *)self overridePrivacyConsent];
  [(MapsAppTestRAP *)self overrideServerControlledUI];
  v4 = [[RAPProblemNotListedQuestion alloc] initWithReport:0 parentQuestion:0];
  v5 = [(RAPProblemNotListedQuestion *)v4 localizedTitle];
  rapQuestionCellTitle = self->_rapQuestionCellTitle;
  self->_rapQuestionCellTitle = v5;

  self->_rapSel = "handleRAPProblemNotListedControllerLoaded:";
  objc_storeStrong((id *)&self->_rapNotificationString, @"RAPReportComposerCommentViewControllerDidAppearNotification");
  [(MapsAppTestRAP *)self handleTappingFromSettingsButtonIntoSettingsTableViewController];

  return 1;
}

- (void)cleanup:(BOOL)a3
{
  BOOL v3 = a3;
  [(MapsAppTestRAP *)self restoreProblemSubmissionURL];
  [(MapsAppTestRAP *)self restorePrivacyConsent];
  [(MapsAppTestRAP *)self restoreServerControlledUI];
  rapQuestionCellTitle = self->_rapQuestionCellTitle;
  self->_rapQuestionCellTitle = 0;

  self->_rapSel = 0;
  rapNotificationString = self->_rapNotificationString;
  self->_rapNotificationString = 0;

  rapCurrentSubTestName = self->_rapCurrentSubTestName;
  self->_rapCurrentSubTestName = 0;

  v8.receiver = self;
  v8.super_class = (Class)MapsAppTestRAP;
  [(MapsAppTest *)&v8 cleanup:v3];
}

- (void)overrideServerControlledUI
{
  self->_isServerControlledUIEnabled = GEOConfigGetBOOL();

  GEOConfigSetBOOL();
}

- (void)restoreServerControlledUI
{
}

- (void)overridePrivacyConsent
{
  if (!self->_hasOverriddenPrivacyConsent)
  {
    BOOL v3 = +[NSUserDefaults standardUserDefaults];
    self->_rapHasPrivacyConsent = [v3 BOOLForKey:@"RAPHasReceived2015PrivacyConsent"];

    v4 = +[NSUserDefaults standardUserDefaults];
    [v4 setBool:1 forKey:@"RAPHasReceived2015PrivacyConsent"];

    self->_hasOverriddenPrivacyConsent = 1;
  }
}

- (void)restorePrivacyConsent
{
  if (self->_hasOverriddenPrivacyConsent)
  {
    BOOL v3 = +[NSUserDefaults standardUserDefaults];
    [v3 setBool:self->_rapHasPrivacyConsent forKey:@"RAPHasReceived2015PrivacyConsent"];

    self->_hasOverriddenPrivacyConsent = 0;
  }
}

- (void)overrideProblemSubmissionURL
{
  if (!self->_rapDefaultURL)
  {
    GEOURLString();
    BOOL v3 = (NSString *)objc_claimAutoreleasedReturnValue();
    rapDefaultURL = self->_rapDefaultURL;
    self->_rapDefaultURL = v3;

    GEOURLConfigKey();
    GEOConfigSetString();
  }
}

- (void)restoreProblemSubmissionURL
{
  if (self->_rapDefaultURL)
  {
    GEOURLConfigKey();
    GEOConfigSetString();
    rapDefaultURL = self->_rapDefaultURL;
    self->_rapDefaultURL = 0;
  }
}

- (void)handleTappingFromSettingsButtonIntoSettingsTableViewController
{
  BOOL v3 = [(MapsAppTest *)self testCoordinator];
  [v3 pptTestOpenSettings];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 addObserver:self selector:"handleSettingsTableViewControllerLoaded:" name:@"SettingsTableViewControllerDidAppearNotification" object:0];
}

- (void)handleSettingsTableViewControllerLoaded:(id)a3
{
  id v11 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:@"SettingsTableViewControllerDidAppearNotification" object:0];
  v5 = [v11 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    v7 = [v11 object];
    objc_super v8 = [v7 indexPathForMenuItem:1];
    if (v8)
    {
      [v4 addObserver:self selector:"handleRAPControllerLoaded:" name:@"RAPReportComposerCategoryViewControllerDidAppearNotification" object:0];
      v9 = [v7 tableView];
      [v9 selectRowAtIndexPath:v8 animated:1 scrollPosition:1];

      [(MapsAppTest *)self startedTest];
      [(MapsAppTest *)self startedSubTest:@"displayRAPController"];
      v10 = [v7 tableView];
      [v7 tableView:v10 didSelectRowAtIndexPath:v8];
    }
    else
    {
      [(MapsAppTest *)self failedTest];
    }
  }
  else
  {
    [(MapsAppTest *)self failedTest];
  }
}

- (void)handleRAPControllerLoaded:(id)a3
{
  id v4 = a3;
  v24 = +[NSNotificationCenter defaultCenter];
  [v24 removeObserver:self name:@"RAPReportComposerCategoryViewControllerDidAppearNotification" object:0];
  [(MapsAppTest *)self finishedSubTest:@"displayRAPController"];
  id v25 = v4;
  [v4 object];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  v23 = long long v29 = 0u;
  v5 = [v23 tableView];
  v6 = [v5 visibleCells];

  id v7 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v27;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v27 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v26 + 1) + 8 * v10);
      v12 = [v11 viewModel];
      v13 = [v12 title];
      unsigned __int8 v14 = [v13 isEqualToString:self->_rapQuestionCellTitle];

      if (v14) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v26 objects:v30 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    v15 = v23;
    v16 = [v23 tableView];
    v17 = [v16 indexPathForCell:v11];

    if (!v17) {
      goto LABEL_13;
    }
    v18 = v24;
    if (self->_rapSel) {
      SEL rapSel = self->_rapSel;
    }
    else {
      SEL rapSel = 0;
    }
    [v24 addObserver:self selector:rapSel name:self->_rapNotificationString object:0];
    v21 = [v23 tableView];
    [v21 selectRowAtIndexPath:v17 animated:1 scrollPosition:1];

    if (self->_rapCurrentSubTestName) {
      -[MapsAppTest startedSubTest:](self, "startedSubTest:");
    }
    v22 = [v23 tableView];
    [v23 tableView:v22 didSelectRowAtIndexPath:v17];

    v20 = v25;
  }
  else
  {
LABEL_9:

    v15 = v23;
LABEL_13:
    [(MapsAppTest *)self failedTest];
    v18 = v24;
    v20 = v25;
  }
}

- (void)handleRAPProblemNotListedControllerLoaded:(id)a3
{
  id v15 = a3;
  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 removeObserver:self name:self->_rapNotificationString object:0];
  v5 = [v15 object];
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  if (isKindOfClass)
  {
    id v7 = [v15 object];
    id v8 = [v7 rapReportComposerCommentTableViewCell];
    uint64_t v9 = v8;
    if (v8)
    {
      [v8 beginEditingCommentIfPossible];
      [v9 setCommentText:@"Test, Not a real report"];
      uint64_t v10 = [v9 textDidChange];

      if (v10)
      {
        id v11 = [v9 textDidChange];
        v12 = [v9 commentText];
        ((void (**)(void, void *))v11)[2](v11, v12);
      }
      [v4 addObserver:self selector:"handleRAPThankYouControllerLoaded:" name:@"RAPAcknowledgementViewControllerDidAppearNotification" object:0];
      [(MapsAppTest *)self startedSubTest:@"displayRAPThankYouController"];
      v13 = [v7 navigationController];
      if (objc_opt_respondsToSelector())
      {
        unsigned __int8 v14 = +[RAPAcknowledgementOptions defaultOptions];
        [v13 _sendWithFinalOutcome:1 acknowledgementOptions:v14];
      }
    }
    else
    {
      [(MapsAppTest *)self failedTest];
    }
  }
  else
  {
    [(MapsAppTest *)self failedTest];
  }
}

- (void)handleRAPThankYouControllerLoaded:(id)a3
{
  [(MapsAppTest *)self finishedSubTest:@"displayRAPThankYouController"];

  [(MapsAppTest *)self finishedTest];
}

- (SEL)rapSel
{
  if (self->_rapSel) {
    return self->_rapSel;
  }
  else {
    return 0;
  }
}

- (void)setRapSel:(SEL)a3
{
  if (a3) {
    BOOL v3 = a3;
  }
  else {
    BOOL v3 = 0;
  }
  self->_SEL rapSel = v3;
}

- (NSString)rapQuestionCellTitle
{
  return self->_rapQuestionCellTitle;
}

- (void)setRapQuestionCellTitle:(id)a3
{
}

- (NSString)rapNotificationString
{
  return self->_rapNotificationString;
}

- (void)setRapNotificationString:(id)a3
{
}

- (NSString)rapCurrentSubTestName
{
  return self->_rapCurrentSubTestName;
}

- (void)setRapCurrentSubTestName:(id)a3
{
}

- (BOOL)rapHasPrivacyConsent
{
  return self->_rapHasPrivacyConsent;
}

- (void)setRapHasPrivacyConsent:(BOOL)a3
{
  self->_rapHasPrivacyConsent = a3;
}

- (NSString)rapDefaultURL
{
  return self->_rapDefaultURL;
}

- (void)setRapDefaultURL:(id)a3
{
}

- (BOOL)hasOverriddenPrivacyConsent
{
  return self->_hasOverriddenPrivacyConsent;
}

- (void)setHasOverriddenPrivacyConsent:(BOOL)a3
{
  self->_hasOverriddenPrivacyConsent = a3;
}

- (BOOL)isServerControlledUIEnabled
{
  return self->_isServerControlledUIEnabled;
}

- (void)setIsServerControlledUIEnabled:(BOOL)a3
{
  self->_isServerControlledUIEnabled = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rapDefaultURL, 0);
  objc_storeStrong((id *)&self->_rapCurrentSubTestName, 0);
  objc_storeStrong((id *)&self->_rapNotificationString, 0);

  objc_storeStrong((id *)&self->_rapQuestionCellTitle, 0);
}

@end