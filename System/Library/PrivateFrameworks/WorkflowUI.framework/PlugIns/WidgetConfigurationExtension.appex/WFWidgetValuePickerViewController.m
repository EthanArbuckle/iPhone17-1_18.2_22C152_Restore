@interface WFWidgetValuePickerViewController
- (NSString)intentIdentifier;
- (WFAction)action;
- (WFWidgetValuePickerViewController)initWithAction:(id)a3 parameter:(id)a4 intentIdentifier:(id)a5 widgetFamily:(int64_t)a6;
- (WFWidgetValuePickerViewControllerDelegate)pickerDelegate;
- (void)parameterValuePickerViewController:(id)a3 didFinishWithParameterState:(id)a4;
- (void)populateConfiguredAppIntentWithAction:(id)a3 completion:(id)a4;
- (void)populateConfiguredCustomIntentWithAction:(id)a3 completion:(id)a4;
- (void)populateConfiguredIntentWithCompletion:(id)a3;
- (void)setPickerDelegate:(id)a3;
@end

@implementation WFWidgetValuePickerViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_intentIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_destroyWeak((id *)&self->_pickerDelegate);
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (WFAction)action
{
  return self->_action;
}

- (void)setPickerDelegate:(id)a3
{
}

- (WFWidgetValuePickerViewControllerDelegate)pickerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_pickerDelegate);
  return (WFWidgetValuePickerViewControllerDelegate *)WeakRetained;
}

- (void)parameterValuePickerViewController:(id)a3 didFinishWithParameterState:(id)a4
{
  id v5 = a4;
  v6 = [(WFWidgetValuePickerViewController *)self parameter];
  if (![v6 allowsMultipleValues]
    || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {

LABEL_4:
    id v7 = v5;
    goto LABEL_5;
  }

  if (!v5) {
    goto LABEL_4;
  }
  v13 = [(WFWidgetValuePickerViewController *)self parameter];
  v14 = (objc_class *)[v13 multipleStateClass];

  id v15 = [v14 alloc];
  id v17 = v5;
  v16 = +[NSArray arrayWithObjects:&v17 count:1];
  id v7 = [v15 initWithParameterStates:v16];

LABEL_5:
  v8 = [(WFWidgetValuePickerViewController *)self action];
  uint64_t v9 = [(WFWidgetValuePickerViewController *)self parameter];
  v10 = [(id)v9 key];
  [v8 setParameterState:v7 forKey:v10];

  v11 = [(WFWidgetValuePickerViewController *)self pickerDelegate];
  LOBYTE(v9) = objc_opt_respondsToSelector();

  if (v9)
  {
    v12 = [(WFWidgetValuePickerViewController *)self pickerDelegate];
    [v12 widgetValuePickerViewControllerDidChooseValue:self];
  }
}

- (void)populateConfiguredAppIntentWithAction:(id)a3 completion:(id)a4
{
  v6 = (void (**)(id, id, void))a4;
  id v7 = a3;
  id v8 = objc_alloc((Class)INAppIntent);
  uint64_t v9 = [v7 fullyQualifiedLinkActionIdentifier];
  v10 = [v9 bundleIdentifier];
  v11 = [v7 fullyQualifiedLinkActionIdentifier];
  v12 = [v11 actionIdentifier];
  v13 = [(WFWidgetValuePickerViewController *)self action];
  v14 = [v13 serializedParameters];
  id v20 = [v8 initWithAppBundleIdentifier:v10 appIntentIdentifier:v12 serializedParameters:v14];

  id v15 = [v7 metadata];

  v16 = [v15 effectiveBundleIdentifiers];
  id v17 = [v16 array];
  v18 = objc_msgSend(v17, "if_firstObjectPassingTest:", &stru_10002D3F8);
  v19 = [v18 bundleIdentifier];
  [v20 _setExtensionBundleId:v19];

  v6[2](v6, v20, 0);
}

- (void)populateConfiguredCustomIntentWithAction:(id)a3 completion:(id)a4
{
  id v6 = a3;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100014C28;
  v9[3] = &unk_10002D3D8;
  v11 = self;
  id v12 = a4;
  id v10 = v6;
  id v7 = v6;
  id v8 = v12;
  [v7 processParametersWithoutAskingForValuesWithInput:0 workQueue:&_dispatch_main_q completionHandler:v9];
}

- (void)populateConfiguredIntentWithCompletion:(id)a3
{
  id v11 = a3;
  v4 = [(WFWidgetValuePickerViewController *)self action];
  if (v4)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v5 = v4;
    }
    else {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }
  id v6 = v5;

  uint64_t v7 = [(WFWidgetValuePickerViewController *)self action];
  if (v7)
  {
    id v8 = (void *)v7;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      uint64_t v9 = v8;
    }
    else {
      uint64_t v9 = 0;
    }
    id v10 = v9;

    if (!v6)
    {
      if (!v10) {
        goto LABEL_17;
      }
      [(WFWidgetValuePickerViewController *)self populateConfiguredAppIntentWithAction:v10 completion:v11];
      goto LABEL_16;
    }
  }
  else
  {
    if (!v6) {
      goto LABEL_17;
    }
    id v10 = 0;
  }
  [(WFWidgetValuePickerViewController *)self populateConfiguredCustomIntentWithAction:v6 completion:v11];
  id v8 = v10;
LABEL_16:

LABEL_17:
}

- (WFWidgetValuePickerViewController)initWithAction:(id)a3 parameter:(id)a4 intentIdentifier:(id)a5 widgetFamily:(int64_t)a6
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a4;
  v14 = [v13 key];
  id v15 = [v11 parameterStateForKey:v14];

  if (v15)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v16 = v15;
    }
    else {
      v16 = 0;
    }
  }
  else
  {
    v16 = 0;
  }
  id v17 = v16;

  v23.receiver = self;
  v23.super_class = (Class)WFWidgetValuePickerViewController;
  v18 = [(WFWidgetValuePickerViewController *)&v23 initWithParameter:v13 widgetFamily:a6 allowsVariables:0 initialCollection:0 currentState:v17 delegate:self];

  if (v18)
  {
    objc_storeStrong((id *)&v18->_action, a3);
    v19 = (NSString *)[v12 copy];
    intentIdentifier = v18->_intentIdentifier;
    v18->_intentIdentifier = v19;

    v21 = v18;
  }

  return v18;
}

@end