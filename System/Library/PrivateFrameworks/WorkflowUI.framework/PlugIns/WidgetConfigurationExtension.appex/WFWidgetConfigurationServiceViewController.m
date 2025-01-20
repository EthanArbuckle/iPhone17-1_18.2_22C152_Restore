@interface WFWidgetConfigurationServiceViewController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
+ (void)initialize;
- (BOOL)shouldShowShortcutPickerPresentation;
- (UIViewController)systemShortcutPickerViewController;
- (WFAction)action;
- (WFSystemShortcutPickerModuleSummaryCoordinator)systemShortcutPickerModuleSummaryCoordinator;
- (WFWidgetConfigurationContainerViewControllerProtocol)rootWidgetConfigurationViewController;
- (WFWidgetConfigurationRequest)request;
- (WFWidgetParameterConfigurationViewController)parameterConfigurationViewController;
- (id)customIntentActionFromRequest:(id)a3;
- (id)hostViewControllerProxy;
- (id)parameterConfigurationViewControllerForAction:(id)a3 request:(id)a4;
- (id)shortcutsMigratedAppIntentForIntent:(id)a3;
- (void)beginRequestWithExtensionContext:(id)a3;
- (void)configurationParametersViewControllerDidRequestToClose:(id)a3;
- (void)dealloc;
- (void)getActionFromRequest:(id)a3 completion:(id)a4;
- (void)getLinkActionFromRequest:(id)a3 completion:(id)a4;
- (void)initializeDatabase;
- (void)initializeDatabaseIfNeeded;
- (void)linkActionOrIntentActionFromRequest:(id)a3 completion:(id)a4;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)requestViewControllerDismissal;
- (void)setAction:(id)a3;
- (void)setConfigurationCardViewFrame:(CGRect)a3;
- (void)setParameterConfigurationViewController:(id)a3;
- (void)setRequest:(id)a3;
- (void)setRootWidgetConfigurationViewController:(id)a3;
- (void)setSystemShortcutPickerModuleSummaryCoordinator:(id)a3;
- (void)setSystemShortcutPickerViewController:(id)a3;
- (void)setupChildViewController:(id)a3;
- (void)startConfigurationWithRequest:(id)a3 completion:(id)a4;
- (void)systemShortcutPickerModuleSummaryCoordinatorDidFinish:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)widgetConfigurationContainerViewControllerDidRequestToClose:(id)a3;
- (void)widgetValuePickerViewControllerDidChooseValue:(id)a3;
@end

@implementation WFWidgetConfigurationServiceViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemShortcutPickerViewController, 0);
  objc_storeStrong((id *)&self->_systemShortcutPickerModuleSummaryCoordinator, 0);
  objc_storeStrong((id *)&self->_parameterConfigurationViewController, 0);
  objc_storeStrong((id *)&self->_rootWidgetConfigurationViewController, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_request, 0);
}

- (void)setSystemShortcutPickerViewController:(id)a3
{
}

- (UIViewController)systemShortcutPickerViewController
{
  return self->_systemShortcutPickerViewController;
}

- (void)setSystemShortcutPickerModuleSummaryCoordinator:(id)a3
{
}

- (WFSystemShortcutPickerModuleSummaryCoordinator)systemShortcutPickerModuleSummaryCoordinator
{
  return self->_systemShortcutPickerModuleSummaryCoordinator;
}

- (void)setParameterConfigurationViewController:(id)a3
{
}

- (WFWidgetParameterConfigurationViewController)parameterConfigurationViewController
{
  return self->_parameterConfigurationViewController;
}

- (void)setRootWidgetConfigurationViewController:(id)a3
{
}

- (WFWidgetConfigurationContainerViewControllerProtocol)rootWidgetConfigurationViewController
{
  return self->_rootWidgetConfigurationViewController;
}

- (void)setAction:(id)a3
{
}

- (WFAction)action
{
  return self->_action;
}

- (void)setRequest:(id)a3
{
}

- (WFWidgetConfigurationRequest)request
{
  return self->_request;
}

- (void)requestViewControllerDismissal
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10001A38C;
  v6[3] = &unk_10002D950;
  v6[4] = self;
  v3 = objc_retainBlock(v6);
  v4 = [(WFWidgetConfigurationServiceViewController *)self systemShortcutPickerModuleSummaryCoordinator];

  if (v4)
  {
    v5 = [(WFWidgetConfigurationServiceViewController *)self systemShortcutPickerModuleSummaryCoordinator];
    [v5 populateConfiguredAppIntentWithCompletion:v3];
  }
  else
  {
    v5 = [(WFWidgetConfigurationServiceViewController *)self parameterConfigurationViewController];
    [v5 populateConfiguredIntentWithCompletion:v3];
  }
}

- (void)systemShortcutPickerModuleSummaryCoordinatorDidFinish:(id)a3
{
}

- (void)widgetValuePickerViewControllerDidChooseValue:(id)a3
{
}

- (void)widgetConfigurationContainerViewControllerDidRequestToClose:(id)a3
{
}

- (void)configurationParametersViewControllerDidRequestToClose:(id)a3
{
}

- (id)parameterConfigurationViewControllerForAction:(id)a3 request:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 configurableParameters];
  v9 = [v8 firstObject];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
  }
  else
  {
    v10 = 0;
  }
  id v11 = v10;

  if ([v11 allowsMultipleValues]) {
    BOOL v12 = objc_msgSend(v11, "arrayMaxCountForWidgetFamily:", objc_msgSend(v7, "family")) != (id)1;
  }
  else {
    BOOL v12 = 0;
  }
  if ([v7 resolvedWidgetConfigurationStyle] == (id)2
    && ([v8 count] != (id)1 ? (char v13 = 1) : (char v13 = v12),
        (v13 & 1) == 0 && [v11 preferParameterValuePicker]))
  {
    v14 = [WFWidgetValuePickerViewController alloc];
    v15 = [v7 intent];
    v16 = [v15 identifier];
    v17 = -[WFWidgetValuePickerViewController initWithAction:parameter:intentIdentifier:widgetFamily:](v14, "initWithAction:parameter:intentIdentifier:widgetFamily:", v6, v11, v16, [v7 family]);

    [(WFWidgetValuePickerViewController *)v17 setPickerDelegate:self];
    [(WFWidgetValuePickerViewController *)v17 setShowsPrompt:0];
    [(WFWidgetValuePickerViewController *)v17 setShowsCancelButton:0];
  }
  else
  {
    v18 = [WFWidgetConfigurationParametersViewController alloc];
    v19 = [v7 intent];
    v20 = [v19 identifier];
    id v28 = v11;
    v21 = v8;
    v22 = self;
    id v23 = [v7 family];
    v24 = [v7 widgetDisplayName];
    v25 = [v7 widgetDescription];
    v17 = -[WFWidgetConfigurationParametersViewController initWithAction:intentIdentifier:widgetFamily:widgetDisplayName:widgetDescription:widgetConfigurationType:](v18, "initWithAction:intentIdentifier:widgetFamily:widgetDisplayName:widgetDescription:widgetConfigurationType:", v6, v20, v23, v24, v25, [v7 widgetConfigurationType]);

    v26 = v22;
    v8 = v21;
    id v11 = v28;
    [(WFWidgetValuePickerViewController *)v17 setDelegate:v26];
  }

  return v17;
}

- (void)getActionFromRequest:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A7D8;
  v7[3] = &unk_10002D928;
  id v8 = a4;
  id v6 = v8;
  [(WFWidgetConfigurationServiceViewController *)self linkActionOrIntentActionFromRequest:a3 completion:v7];
}

- (void)linkActionOrIntentActionFromRequest:(id)a3 completion:(id)a4
{
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10001A8B0;
  v7[3] = &unk_10002D900;
  id v8 = self;
  id v9 = a3;
  id v10 = a4;
  id v5 = v10;
  id v6 = v9;
  [(WFWidgetConfigurationServiceViewController *)v8 getLinkActionFromRequest:v6 completion:v7];
}

- (void)getLinkActionFromRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void))a4;
  id v8 = +[WFLinkActionProvider sharedProvider];
  id v9 = [v6 intent];
  if (!v9 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    v21 = [v6 intent];
    v22 = [v21 launchId];
    id v23 = [v6 intent];
    v24 = [v23 _className];
    char v13 = [v8 customIntentMigratedActionIdentifierWithLaunchId:v22 className:v24];

    id v9 = 0;
    if (v13) {
      goto LABEL_4;
    }
LABEL_8:
    v7[2](v7, 0);
    goto LABEL_9;
  }
  id v10 = [v9 launchId];
  v36[0] = v10;
  id v11 = [v9 appIntentIdentifier];
  v36[1] = v11;
  BOOL v12 = +[NSArray arrayWithObjects:v36 count:2];
  char v13 = [v12 componentsJoinedByString:@"."];

  if (!v13) {
    goto LABEL_8;
  }
LABEL_4:
  v14 = [v6 intent];
  v15 = [(WFWidgetConfigurationServiceViewController *)self shortcutsMigratedAppIntentForIntent:v14];

  if (v15)
  {
    id v16 = v15;

    id v9 = v16;
  }
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_10001AC84;
  v34 = sub_10001AC94;
  id v35 = 0;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10001AC9C;
  v25[3] = &unk_10002D8D8;
  v29 = &v30;
  id v26 = v6;
  id v9 = v9;
  id v27 = v9;
  id v28 = v7;
  v17 = objc_retainBlock(v25);
  v18 = [v9 serializedParameters];
  uint64_t v19 = +[WFLinkAction providedActionWithIdentifier:v13 serializedParameters:v18];
  v20 = (void *)v31[5];
  v31[5] = v19;

  ((void (*)(void *))v17[2])(v17);
  _Block_object_dispose(&v30, 8);

LABEL_9:
}

- (id)customIntentActionFromRequest:(id)a3
{
  id v3 = a3;
  v4 = [v3 remoteLocalizedIntent];
  if (v4)
  {
    id v5 = v4;
  }
  else
  {
    id v5 = [v3 intent];
    if (!v5)
    {
      BOOL v12 = 0;
      goto LABEL_12;
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
    {
      id v7 = [v5 appIntentIdentifier];
      id v8 = [v5 launchId];
      id v9 = [v3 remoteLocalizedIntent];
      CFStringRef v10 = @"YES";
      *(_DWORD *)buf = 136315906;
      id v27 = "-[WFWidgetConfigurationServiceViewController customIntentActionFromRequest:]";
      if (!v9) {
        CFStringRef v10 = @"NO";
      }
      __int16 v28 = 2114;
      v29 = v7;
      __int16 v30 = 2114;
      id v31 = v8;
      __int16 v32 = 2114;
      CFStringRef v33 = v10;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_FAULT, "%s Unable to create WFHandleCustomIntentAction because intent is an app intent. Identifier: %{public}@, launchId: %{public}@, remote: %{public}@", buf, 0x2Au);
    }
    id v11 = 0;
    BOOL v12 = v5;
    goto LABEL_20;
  }
  BOOL v12 = v5;
LABEL_12:

  char v13 = [v12 extensionBundleId];
  v14 = v13;
  if (v13)
  {
    id v15 = v13;
  }
  else
  {
    id v15 = [v12 launchId];
  }
  id v5 = v15;

  id v6 = [v12 _className];
  id v16 = WFGetCustomIntentActionIdentifier();
  uint64_t v24 = INAppResolverOptionsSkipSupportedIntentsCheckKey;
  v25 = &__kCFBooleanTrue;
  v17 = +[NSDictionary dictionaryWithObjects:&v25 forKeys:&v24 count:1];
  v18 = +[INAppResolverOptions optionsWithDictionary:v17];

  uint64_t v19 = +[INAppResolver sharedResolver];
  [v19 setOptions:v18 forIntentClassName:v6];

  id v20 = [objc_alloc((Class)WFHandleCustomIntentAction) initWithIdentifier:v16 intent:v12 className:v6 bundleIdentifier:v5];
  if (!v20)
  {
    v21 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315650;
      id v27 = "-[WFWidgetConfigurationServiceViewController customIntentActionFromRequest:]";
      __int16 v28 = 2114;
      v29 = v6;
      __int16 v30 = 2114;
      id v31 = v5;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_FAULT, "%s Unable to create WFHandleCustomIntentAction for %{public}@ in bundle %{public}@", buf, 0x20u);
    }
  }
  objc_msgSend(v20, "setWidgetFamily:", objc_msgSend(v3, "family"));
  v22 = [v20 serializedParametersForDonatedIntent:v12 allowDroppingUnconfigurableValues:1];
  id v11 = [v20 copyWithSerializedParameters:v22];

  objc_msgSend(v11, "setWidgetFamily:", objc_msgSend(v3, "family"));
LABEL_20:

  return v11;
}

- (void)dealloc
{
  v2.receiver = self;
  v2.super_class = (Class)WFWidgetConfigurationServiceViewController;
  [(WFWidgetConfigurationServiceViewController *)&v2 dealloc];
}

- (void)setupChildViewController:(id)a3
{
  id v16 = a3;
  [(WFWidgetConfigurationServiceViewController *)self addChildViewController:v16];
  v4 = [(WFWidgetConfigurationServiceViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  char v13 = [v16 view];
  objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  v14 = [(WFWidgetConfigurationServiceViewController *)self view];
  id v15 = [v16 view];
  [v14 addSubview:v15];

  [v16 didMoveToParentViewController:self];
}

- (void)initializeDatabase
{
  if ((unint64_t)+[WFInitialization initializeProcessWithDatabase:1] >= 2)
  {
    objc_super v2 = getWFWidgetLogObject();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      int v3 = 136315138;
      v4 = "-[WFWidgetConfigurationServiceViewController initializeDatabase]";
      _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_ERROR, "%s Could not initialize database, shortcut may fail to appear in the system shortcut picker!", (uint8_t *)&v3, 0xCu);
    }
  }
}

- (void)initializeDatabaseIfNeeded
{
  int v3 = [(WFWidgetConfigurationServiceViewController *)self request];
  v4 = [v3 intent];
  double v5 = [v4 _className];
  double v6 = v5;
  if (v5 == @"WFShortcutsSmallWidgetConfigurationIntent") {
    goto LABEL_9;
  }
  if (v5)
  {
    unsigned __int8 v7 = [(__CFString *)v5 isEqualToString:@"WFShortcutsSmallWidgetConfigurationIntent"];

    if (v7) {
      goto LABEL_9;
    }
  }
  double v8 = [(WFWidgetConfigurationServiceViewController *)self request];
  double v9 = [v8 intent];
  double v10 = [v9 _className];
  if (v10 == @"WFShortcutsWidgetConfigurationIntent")
  {

LABEL_9:
    goto LABEL_10;
  }
  double v11 = v10;
  if (!v10)
  {

LABEL_14:
    char v13 = [(WFWidgetConfigurationServiceViewController *)self request];
    __int16 v28 = [v13 intent];

    v14 = v28;
    if (!v28 || (objc_opt_class(), char isKindOfClass = objc_opt_isKindOfClass(), v14 = v28, (isKindOfClass & 1) == 0))
    {
LABEL_30:

      return;
    }
    id v16 = [v28 appIntentIdentifier];
    v17 = v16;
    if (v16 == @"RunShortcutConfigurationIntent"
      || v16
      && ((v18 = [(__CFString *)v16 isEqualToString:@"RunShortcutConfigurationIntent"], v17, (v18 & 1) != 0)|| (uint64_t v19 = v17, v19 == @"RunShortcutIntent")|| (v20 = v19, v21 = [(__CFString *)v19 isEqualToString:@"RunShortcutIntent"], v20, v21)))
    {
      v22 = [v28 extensionBundleId];
      id v23 = (void *)VCBundleIdentifierShortcutsWidgetExtension;
      id v24 = v22;
      id v25 = v23;
      if (v24 == v25)
      {
      }
      else
      {
        id v26 = v25;
        if (!v24 || !v25)
        {

          goto LABEL_29;
        }
        unsigned int v27 = [v24 isEqualToString:v25];

        if (!v27) {
          goto LABEL_29;
        }
      }
      [(WFWidgetConfigurationServiceViewController *)self initializeDatabase];
    }
LABEL_29:

    v14 = v28;
    goto LABEL_30;
  }
  unsigned __int8 v12 = [(__CFString *)v10 isEqualToString:@"WFShortcutsWidgetConfigurationIntent"];

  if ((v12 & 1) == 0) {
    goto LABEL_14;
  }
LABEL_10:
  [(WFWidgetConfigurationServiceViewController *)self initializeDatabase];
}

- (id)shortcutsMigratedAppIntentForIntent:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWidgetConfigurationServiceViewController *)self request];
  double v6 = [v5 intent];
  unsigned __int8 v7 = [v6 _className];
  double v8 = v7;
  if (v7 == @"WFShortcutsWidgetConfigurationIntent") {
    goto LABEL_9;
  }
  if (v7)
  {
    unsigned __int8 v9 = [(__CFString *)v7 isEqualToString:@"WFShortcutsWidgetConfigurationIntent"];

    if (v9) {
      goto LABEL_9;
    }
  }
  double v10 = [(WFWidgetConfigurationServiceViewController *)self request];
  double v11 = [v10 intent];
  unsigned __int8 v12 = [v11 _className];
  if (v12 == @"WFShortcutsSmallWidgetConfigurationIntent")
  {

LABEL_9:
    goto LABEL_10;
  }
  char v13 = v12;
  if (!v12)
  {

    goto LABEL_27;
  }
  unsigned __int8 v14 = [(__CFString *)v12 isEqualToString:@"WFShortcutsSmallWidgetConfigurationIntent"];

  if ((v14 & 1) == 0) {
    goto LABEL_28;
  }
LABEL_10:
  id v15 = [v4 launchId];
  id v16 = (void *)VCBundleIdentifierShortcutsiOS;
  id v5 = v15;
  id v17 = v16;
  if (v5 == v17)
  {

    goto LABEL_16;
  }
  unsigned __int8 v18 = v17;
  if (v5 && v17)
  {
    unsigned int v19 = [v5 isEqualToString:v17];

    if (!v19) {
      goto LABEL_28;
    }
LABEL_16:
    id v20 = v4;
    if (!v20 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {

      unsigned int v21 = INIntentWithTypedIntent();
      v22 = [v21 _asMigratedAppIntent];

      if (v22)
      {
        id v20 = v22;
        id v23 = v20;
LABEL_25:

        goto LABEL_29;
      }
      id v24 = getWFWidgetLogObject();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
      {
        int v26 = 136315394;
        unsigned int v27 = "-[WFWidgetConfigurationServiceViewController shortcutsMigratedAppIntentForIntent:]";
        __int16 v28 = 2112;
        id v29 = v20;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "%s Failed to migrate shortcuts intent %@", (uint8_t *)&v26, 0x16u);
      }

      id v20 = 0;
    }
    id v23 = 0;
    goto LABEL_25;
  }

LABEL_27:
LABEL_28:
  id v23 = 0;
LABEL_29:

  return v23;
}

- (BOOL)shouldShowShortcutPickerPresentation
{
  int v3 = [(WFWidgetConfigurationServiceViewController *)self request];
  id v4 = [v3 intent];

  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v4 appIntentIdentifier];
      double v6 = v5;
      if (v5 != @"RunShortcutConfigurationIntent")
      {
        if (!v5
          || (unsigned int v7 = [(__CFString *)v5 isEqualToString:@"RunShortcutConfigurationIntent"], v6, !v7))
        {
          BOOL v14 = 0;
LABEL_18:

          goto LABEL_19;
        }
      }
      double v8 = [v4 extensionBundleId];
      unsigned __int8 v9 = (void *)VCBundleIdentifierShortcutsWidgetExtension;
      id v10 = v8;
      id v11 = v9;
      if (v10 == v11)
      {
      }
      else
      {
        unsigned __int8 v12 = v11;
        if (!v10 || !v11)
        {

          BOOL v14 = 0;
          id v15 = v10;
          goto LABEL_16;
        }
        unsigned int v13 = [v10 isEqualToString:v11];

        if (!v13)
        {
          BOOL v14 = 0;
LABEL_17:

          goto LABEL_18;
        }
      }
      id v15 = [(WFWidgetConfigurationServiceViewController *)self request];
      BOOL v14 = [v15 family] == (id)10;
LABEL_16:

      goto LABEL_17;
    }
  }
  BOOL v14 = 0;
LABEL_19:

  return v14;
}

- (void)startConfigurationWithRequest:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [(WFWidgetConfigurationServiceViewController *)self setRequest:v6];
    [(WFWidgetConfigurationServiceViewController *)self initializeDatabaseIfNeeded];
    double v8 = [(WFWidgetConfigurationServiceViewController *)self request];
    [v8 startAccessingSecurityScopedBundleResource];

    unsigned __int8 v9 = [(WFWidgetConfigurationServiceViewController *)self request];
    id v10 = [v9 appBundleIdentifier];

    if (v10)
    {
      id v11 = objc_alloc((Class)WFShowWidgetConfigurationEvent);
      unsigned __int8 v12 = [(WFWidgetConfigurationServiceViewController *)self request];
      unsigned int v13 = [v12 intent];
      BOOL v14 = [v13 _className];
      id v15 = [(WFWidgetConfigurationServiceViewController *)self request];
      id v16 = (char *)[v15 family] - 1;
      if ((unint64_t)v16 > 3) {
        CFStringRef v17 = @"Invalid";
      }
      else {
        CFStringRef v17 = *(&off_10002D970 + (void)v16);
      }
      id v19 = [v11 initWithAppBundleIdentifier:v10 intentType:v14 sizeClass:v17];

      [v19 track];
    }
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10001BCA4;
    v20[3] = &unk_10002D8B0;
    id v22 = v7;
    v20[4] = self;
    id v21 = v6;
    [(WFWidgetConfigurationServiceViewController *)self getActionFromRequest:v21 completion:v20];
  }
  else
  {
    unsigned __int8 v18 = getWFWidgetConfigurationLogObject();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 136315138;
      id v24 = "-[WFWidgetConfigurationServiceViewController startConfigurationWithRequest:completion:]";
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%s Unable to find widget configuration request on extension item", buf, 0xCu);
    }

    id v10 = +[NSError errorWithDomain:@"WFWidgetConfigurationErrorDomain" code:1000 userInfo:0];
    (*((void (**)(id, void *))v7 + 2))(v7, v10);
  }
}

- (void)beginRequestWithExtensionContext:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)WFWidgetConfigurationServiceViewController;
  [(WFWidgetConfigurationServiceViewController *)&v3 beginRequestWithExtensionContext:a3];
}

- (id)hostViewControllerProxy
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10001C20C;
  v4[3] = &unk_10002D860;
  v4[4] = self;
  objc_super v2 = [(WFWidgetConfigurationServiceViewController *)self _remoteViewControllerProxyWithErrorHandler:v4];
  return v2;
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)WFWidgetConfigurationServiceViewController;
  [(WFWidgetConfigurationServiceViewController *)&v9 preferredContentSizeDidChangeForChildContentContainer:v4];
  uint64_t v5 = [(WFWidgetConfigurationServiceViewController *)self parameterConfigurationViewController];
  if ((id)v5 == v4)
  {

LABEL_5:
    double v8 = [(WFWidgetConfigurationServiceViewController *)self hostViewControllerProxy];
    [v4 preferredContentSize];
    objc_msgSend(v8, "preferredCardSizeDidUpdate:");

    goto LABEL_6;
  }
  id v6 = (void *)v5;
  id v7 = [(WFWidgetConfigurationServiceViewController *)self rootWidgetConfigurationViewController];

  if (v7 == v4) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)viewDidAppear:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)WFWidgetConfigurationServiceViewController;
  [(WFWidgetConfigurationServiceViewController *)&v7 viewDidAppear:a3];
  id v4 = [(WFWidgetConfigurationServiceViewController *)self view];
  uint64_t v5 = [v4 window];
  id v6 = [v5 _rootSheetPresentationController];
  [v6 _setShouldScaleDownBehindDescendantSheets:0];
}

- (void)setConfigurationCardViewFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  objc_super v7 = [(WFWidgetConfigurationServiceViewController *)self rootWidgetConfigurationViewController];
  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      double v8 = v7;
    }
    else {
      double v8 = 0;
    }
  }
  else
  {
    double v8 = 0;
  }
  id v9 = v8;

  objc_msgSend(v9, "setConfigurationCardViewFrame:", x, y, width, height);
}

+ (id)_remoteViewControllerInterface
{
  return (id)_WFWidgetConfigurationHostXPCInterface(a1, a2);
}

+ (id)_exportedInterface
{
  return (id)_WFWidgetConfigurationServiceXPCInterface(a1, a2);
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    objc_super v2 = NSClassFromString(@"INAppTrust");
    ClassMethod = class_getClassMethod(v2, "shouldTrustExtensionForLaunch:");
    id v4 = imp_implementationWithBlock(&stru_10002D558);
    method_setImplementation(ClassMethod, v4);
    uint64_t v5 = class_getClassMethod(v2, "extensionsTrustedForLaunch:");
    id v6 = imp_implementationWithBlock(&stru_10002D598);
    method_setImplementation(v5, v6);
    objc_super v7 = class_getClassMethod(v2, "shouldTrustAppForLaunch:");
    double v8 = imp_implementationWithBlock(&stru_10002D5B8);
    method_setImplementation(v7, v8);
    id v9 = class_getClassMethod(v2, "appsTrustedForLaunch:");
    id v10 = imp_implementationWithBlock(&stru_10002D5D8);
    method_setImplementation(v9, v10);
  }
}

@end