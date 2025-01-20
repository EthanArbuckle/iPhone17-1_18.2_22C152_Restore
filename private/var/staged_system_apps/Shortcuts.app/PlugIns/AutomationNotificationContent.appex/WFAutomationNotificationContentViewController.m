@interface WFAutomationNotificationContentViewController
- (CGSize)estimatedSizeForNotificationUserInfo:(id)a3;
- (UIView)contentView;
- (void)didReceiveNotification:(id)a3;
- (void)loadView;
@end

@implementation WFAutomationNotificationContentViewController

- (void).cxx_destruct
{
}

- (UIView)contentView
{
  return self->_contentView;
}

- (CGSize)estimatedSizeForNotificationUserInfo:(id)a3
{
  id v4 = a3;
  v5 = [(WFAutomationNotificationContentViewController *)self view];
  [v5 bounds];
  double v7 = v6;

  v8 = WFTriggerIDsToDisableFromNotificationUserInfo();

  double v9 = (double)(unint64_t)(110 * (void)[v8 count]);
  double v10 = v7;
  double v11 = v9;
  result.height = v11;
  result.width = v10;
  return result;
}

- (void)didReceiveNotification:(id)a3
{
  id v4 = a3;
  v5 = [v4 request];
  double v6 = [v5 content];
  double v7 = [v6 categoryIdentifier];
  unsigned int v8 = [v7 isEqualToString:WFNotificationTriggerPromptCategory];

  if (v8)
  {
    double v9 = (UIView *)objc_alloc_init((Class)WFAutomationNotificationContentView);
    double v10 = [(WFAutomationNotificationContentViewController *)self view];
    [v10 bounds];
    -[UIView setFrame:](v9, "setFrame:");

    [(UIView *)v9 setAutoresizingMask:18];
    double v11 = [(WFAutomationNotificationContentViewController *)self view];
    [v11 addSubview:v9];

    [(UIView *)v9 updateUIFromNotification:v4];
LABEL_5:
    contentView = self->_contentView;
    self->_contentView = v9;

    goto LABEL_6;
  }
  v12 = [v4 request];
  v13 = [v12 content];
  v14 = [v13 categoryIdentifier];
  unsigned int v15 = [v14 isEqualToString:WFNotificationTriggerNotifyBackgroundCategory];

  v16 = [v4 request];
  v17 = [v16 content];
  v18 = v17;
  if (v15)
  {
    v19 = [v17 userInfo];
    [(WFAutomationNotificationContentViewController *)self estimatedSizeForNotificationUserInfo:v19];
    -[WFAutomationNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");

    double v9 = (UIView *)objc_alloc_init((Class)WFAutomationNotificationListContentView);
    v20 = [(WFAutomationNotificationContentViewController *)self view];
    [v20 bounds];
    -[UIView setFrame:](v9, "setFrame:");

    [(UIView *)v9 setAutoresizingMask:18];
    v21 = [(WFAutomationNotificationContentViewController *)self view];
    [v21 addSubview:v9];

    v22 = [v4 request];
    v23 = [v22 content];
    v24 = [v23 userInfo];
    [(UIView *)v9 updateUIFromNotificationUserInfo:v24];

    [(UIView *)v9 preferredSize];
    -[WFAutomationNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    goto LABEL_5;
  }
  v26 = [v17 categoryIdentifier];
  unsigned int v27 = [v26 isEqualToString:WFNotificationAutomationsEnabledCategory];

  if (v27)
  {
    +[WFInitialization initializeProcessWithDatabase:1];
    v28 = +[WFDatabase defaultDatabase];
    id v29 = [objc_alloc((Class)WFTriggerManager) initWithDatabase:v28];
    v30 = objc_opt_new();
    v31 = [v29 allConfiguredTriggers];
    v43[0] = _NSConcreteStackBlock;
    v43[1] = 3221225472;
    v43[2] = sub_1000032C8;
    v43[3] = &unk_100004148;
    id v44 = v30;
    id v32 = v30;
    [v31 enumerateObjectsUsingBlock:v43];

    v33 = (void *)os_transaction_create();
    v34 = WFTriggerIDsToDisableNotificationUserInfoFromTriggers();
    [(WFAutomationNotificationContentViewController *)self estimatedSizeForNotificationUserInfo:v34];
    -[WFAutomationNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    v35 = (UIView *)objc_alloc_init((Class)WFAutomationNotificationListContentView);
    v36 = [(WFAutomationNotificationContentViewController *)self view];
    [v36 bounds];
    -[UIView setFrame:](v35, "setFrame:");

    [(UIView *)v35 setAutoresizingMask:18];
    v37 = [(WFAutomationNotificationContentViewController *)self view];
    [v37 addSubview:v35];

    [(UIView *)v35 updateUIFromNotificationUserInfo:v34];
    [(UIView *)v35 preferredSize];
    -[WFAutomationNotificationContentViewController setPreferredContentSize:](self, "setPreferredContentSize:");
    v38 = self->_contentView;
    self->_contentView = v35;
  }
  else
  {
    v39 = getWFTriggerNotificationsLogObject();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT))
    {
      v40 = [v4 request];
      v41 = [v40 content];
      v42 = [v41 categoryIdentifier];
      *(_DWORD *)buf = 136315394;
      v46 = "-[WFAutomationNotificationContentViewController didReceiveNotification:]";
      __int16 v47 = 2112;
      v48 = v42;
      _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_FAULT, "%s Notification content did not match any known category identifier: %@", buf, 0x16u);
    }
  }
LABEL_6:
}

- (void)loadView
{
  id v3 = [objc_alloc((Class)UIView) initWithFrame:0.0, 0.0, 100.0, 100.0];
  [(WFAutomationNotificationContentViewController *)self setView:v3];
}

@end