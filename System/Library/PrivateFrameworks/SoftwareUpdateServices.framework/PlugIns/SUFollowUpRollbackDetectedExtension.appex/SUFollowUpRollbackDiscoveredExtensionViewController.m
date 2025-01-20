@interface SUFollowUpRollbackDiscoveredExtensionViewController
- (BOOL)clearFollowUpItem:(id)a3;
- (id)jumpTable;
- (id)rollbackSuggestionTypeFromUserInfo:(id)a3;
- (void)goToSettingsActionWithItem:(id)a3 action:(id)a4 completion:(id)a5;
- (void)handleActionWithItem:(id)a3 action:(id)a4 completion:(id)a5;
- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5;
- (void)removeNowActionWithItem:(id)a3 action:(id)a4 completion:(id)a5;
@end

@implementation SUFollowUpRollbackDiscoveredExtensionViewController

- (id)jumpTable
{
  if (qword_1000081C0 != -1) {
    dispatch_once(&qword_1000081C0, &stru_100004198);
  }
  v2 = (void *)qword_1000081B8;
  return v2;
}

- (void)handleActionWithItem:(id)a3 action:(id)a4 completion:(id)a5
{
  id v7 = a4;
  id v12 = a3;
  SULogInfo();
  v8 = [(SUFollowUpRollbackDiscoveredExtensionViewController *)self jumpTable];
  v9 = [v7 identifier];
  v10 = [v8 objectForKeyedSubscript:v9];
  SEL v11 = NSSelectorFromString(v10);

  [(SUFollowUpRollbackDiscoveredExtensionViewController *)self performSelector:v11 withObject:v12 withObject:v7];
}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v11 = a3;
  v10 = [v9 identifier];
  SULogInfo();

  -[SUFollowUpRollbackDiscoveredExtensionViewController handleActionWithItem:action:completion:](self, "handleActionWithItem:action:completion:", v11, v9, v8, v10);
}

- (void)removeNowActionWithItem:(id)a3 action:(id)a4 completion:(id)a5
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100002E44;
  block[3] = &unk_1000041E8;
  id v10 = a3;
  id v11 = a5;
  block[4] = self;
  id v7 = v10;
  id v8 = v11;
  dispatch_sync((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)goToSettingsActionWithItem:(id)a3 action:(id)a4 completion:(id)a5
{
  SULogInfo();
  +[NSURL URLWithString:@"prefs:root=General&path=About/SW_VERSION_SPECIFIER"];
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  v5 = +[LSApplicationWorkspace defaultWorkspace];
  [v5 openSensitiveURL:v6 withOptions:0];
}

- (BOOL)clearFollowUpItem:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)FLFollowUpController) initWithClientIdentifier:@"com.apple.SoftwareUpdateServices.followup"];
  if (v4)
  {
    v5 = [v3 uniqueIdentifier];
    id v11 = v5;
    id v6 = +[NSArray arrayWithObjects:&v11 count:1];
    id v10 = 0;
    unsigned __int8 v7 = [v4 clearPendingFollowUpItemsWithUniqueIdentifiers:v6 error:&v10];
    id v8 = v10;

    if ((v7 & 1) == 0) {
      SULogInfo();
    }
  }
  else
  {
    SULogInfo();
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (id)rollbackSuggestionTypeFromUserInfo:(id)a3
{
  id v3 = a3;
  id v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  v5 = [v3 objectForKeyedSubscript:kSUFollowUpUserInfoRollbackSuggestionTypeKey];
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

LABEL_10:
    id v9 = kSURollbackSuggestionUnknownReasonRemoveNowTapped;
    goto LABEL_11;
  }
  unsigned int v6 = [v5 intValue];
  unsigned __int8 v7 = (id *)&kSURollbackSuggestionStabilityMonitorRemoveNowTapped;
  id v8 = (id *)&kSURollbackSuggestionProgramInitiatedRemoveNowTapped;
  if (v6 != 2) {
    id v8 = (id *)&kSURollbackSuggestionUnknownReasonRemoveNowTapped;
  }
  if (v6 != 1) {
    unsigned __int8 v7 = v8;
  }
  id v9 = *v7;

LABEL_11:
  return v9;
}

@end