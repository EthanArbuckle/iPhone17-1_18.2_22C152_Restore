@interface WFWidgetConfigurationParametersViewController
- (BOOL)showsWidgetDescription;
- (INIntent)intent;
- (MTVisualStylingProvider)fillProvider;
- (MTVisualStylingProvider)strokeProvider;
- (NSLayoutConstraint)intentDescriptionViewWidthConstraint;
- (NSLayoutConstraint)widgetDescriptionLabelTopSpacingConstraint;
- (NSString)intentIdentifier;
- (NSString)widgetDescription;
- (NSString)widgetDisplayName;
- (UIColor)cardBackgroundColor;
- (UILabel)widgetDescriptionLabel;
- (UIView)scrollDividerView;
- (UIView)widgetDescriptionView;
- (WFWidgetConfigurationParametersViewController)initWithAction:(id)a3 intentIdentifier:(id)a4 widgetFamily:(int64_t)a5 widgetDisplayName:(id)a6 widgetDescription:(id)a7 widgetConfigurationType:(unint64_t)a8;
- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4;
- (double)widgetDescriptionTallScriptCompensatedSpacing;
- (int64_t)widgetFamily;
- (void)applyStylingWithStrokeProvider:(id)a3 fillProvider:(id)a4 cardBackgroundColor:(id)a5;
- (void)configureCell:(id)a3 forAction:(id)a4 parameter:(id)a5;
- (void)finishEditing;
- (void)invalidateIntentDescriptionLabelMetrics;
- (void)loadView;
- (void)populateConfiguredAppIntentWithCompletion:(id)a3;
- (void)populateConfiguredCustomIntentWithCompletion:(id)a3;
- (void)populateConfiguredIntentWithCompletion:(id)a3;
- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)reloadActionParameterModels;
- (void)scrollViewDidScroll:(id)a3;
- (void)setCardBackgroundColor:(id)a3;
- (void)setFillProvider:(id)a3;
- (void)setIntentDescriptionViewWidthConstraint:(id)a3;
- (void)setOverrideUserInterfaceStyle:(int64_t)a3;
- (void)setScrollDividerView:(id)a3;
- (void)setShowsWidgetDescription:(BOOL)a3;
- (void)setStrokeProvider:(id)a3;
- (void)setWidgetDescriptionLabel:(id)a3;
- (void)setWidgetDescriptionLabelTopSpacingConstraint:(id)a3;
- (void)setWidgetDescriptionTallScriptCompensatedSpacing:(double)a3;
- (void)setWidgetDescriptionView:(id)a3;
- (void)setWidgetFamily:(int64_t)a3;
- (void)setwidgetDescriptionTallScriptCompensatedSpacing:(double)a3;
- (void)updateTableHeaderHeight;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewLayoutMarginsDidChange;
@end

@implementation WFWidgetConfigurationParametersViewController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fillProvider, 0);
  objc_storeStrong((id *)&self->_strokeProvider, 0);
  objc_storeStrong((id *)&self->_cardBackgroundColor, 0);
  objc_storeStrong((id *)&self->_widgetDescriptionLabelTopSpacingConstraint, 0);
  objc_storeStrong((id *)&self->_intentDescriptionViewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_widgetDescriptionLabel, 0);
  objc_storeStrong((id *)&self->_widgetDescriptionView, 0);
  objc_storeStrong((id *)&self->_intentIdentifier, 0);
  objc_storeStrong((id *)&self->_scrollDividerView, 0);
  objc_storeStrong((id *)&self->_widgetDescription, 0);
  objc_storeStrong((id *)&self->_widgetDisplayName, 0);
  objc_storeStrong((id *)&self->_intent, 0);
}

- (MTVisualStylingProvider)fillProvider
{
  return self->_fillProvider;
}

- (MTVisualStylingProvider)strokeProvider
{
  return self->_strokeProvider;
}

- (void)setCardBackgroundColor:(id)a3
{
}

- (UIColor)cardBackgroundColor
{
  return self->_cardBackgroundColor;
}

- (void)setWidgetDescriptionLabelTopSpacingConstraint:(id)a3
{
}

- (NSLayoutConstraint)widgetDescriptionLabelTopSpacingConstraint
{
  return self->_widgetDescriptionLabelTopSpacingConstraint;
}

- (void)setIntentDescriptionViewWidthConstraint:(id)a3
{
}

- (NSLayoutConstraint)intentDescriptionViewWidthConstraint
{
  return self->_intentDescriptionViewWidthConstraint;
}

- (void)setWidgetDescriptionLabel:(id)a3
{
}

- (UILabel)widgetDescriptionLabel
{
  return self->_widgetDescriptionLabel;
}

- (void)setWidgetDescriptionView:(id)a3
{
}

- (UIView)widgetDescriptionView
{
  return self->_widgetDescriptionView;
}

- (void)setWidgetFamily:(int64_t)a3
{
  self->_widgetFamily = a3;
}

- (int64_t)widgetFamily
{
  return self->_widgetFamily;
}

- (NSString)intentIdentifier
{
  return self->_intentIdentifier;
}

- (void)setScrollDividerView:(id)a3
{
}

- (UIView)scrollDividerView
{
  return self->_scrollDividerView;
}

- (void)setWidgetDescriptionTallScriptCompensatedSpacing:(double)a3
{
  self->_widgetDescriptionTallScriptCompensatedSpacing = a3;
}

- (double)widgetDescriptionTallScriptCompensatedSpacing
{
  return self->_widgetDescriptionTallScriptCompensatedSpacing;
}

- (BOOL)showsWidgetDescription
{
  return self->_showsWidgetDescription;
}

- (NSString)widgetDescription
{
  return self->_widgetDescription;
}

- (NSString)widgetDisplayName
{
  return self->_widgetDisplayName;
}

- (INIntent)intent
{
  return self->_intent;
}

- (void)scrollViewDidScroll:(id)a3
{
  [a3 contentOffset];
  if (v4 <= 0.0) {
    double v5 = 0.0;
  }
  else {
    double v5 = 1.0;
  }
  v6 = [(WFWidgetConfigurationParametersViewController *)self scrollDividerView];
  [v6 alpha];
  double v8 = v7;

  if (v8 != v5)
  {
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_100012744;
    v9[3] = &unk_10002D388;
    v9[4] = self;
    *(double *)&v9[5] = v5;
    +[UIView animateWithDuration:v9 animations:0.2];
  }
}

- (void)finishEditing
{
  v3 = [(WFConfigurationParametersViewController *)self delegate];
  char v4 = objc_opt_respondsToSelector();

  if (v4)
  {
    id v5 = [(WFConfigurationParametersViewController *)self delegate];
    [v5 configurationParametersViewControllerDidRequestToClose:self];
  }
}

- (void)presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(WFWidgetConfigurationParametersViewController *)self overrideUserInterfaceStyle]) {
    objc_msgSend(v8, "setOverrideUserInterfaceStyle:", -[WFWidgetConfigurationParametersViewController overrideUserInterfaceStyle](self, "overrideUserInterfaceStyle"));
  }
  v10.receiver = self;
  v10.super_class = (Class)WFWidgetConfigurationParametersViewController;
  [(WFWidgetConfigurationParametersViewController *)&v10 presentViewController:v8 animated:v6 completion:v9];
}

- (double)tableView:(id)a3 heightForHeaderInSection:(int64_t)a4
{
  id v5 = +[UIFont preferredFontForTextStyle:UIFontTextStyleHeadline];
  BOOL v6 = +[UIFontMetrics metricsForTextStyle:UIFontTextStyleHeadline];
  double v7 = [v6 scaledFontForFont:v5];
  [v7 lineHeight];
  double v9 = v8;

  double v10 = 25.0;
  if (!a4) {
    double v10 = 18.0;
  }
  double v11 = v10 + v9;

  return v11;
}

- (void)updateTableHeaderHeight
{
  double v3 = 0.0;
  if ([(WFWidgetConfigurationParametersViewController *)self showsWidgetDescription])
  {
    char v4 = [(WFWidgetConfigurationParametersViewController *)self tableView];
    [v4 bounds];
    double v6 = v5;
    double height = UILayoutFittingCompressedSize.height;

    double v8 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
    LODWORD(v9) = 1148846080;
    LODWORD(v10) = 1112014848;
    objc_msgSend(v8, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v6, height, v9, v10);
    double v3 = v11;
  }
  v12 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
  [v12 bounds];
  double v13 = CGRectGetHeight(v21);

  if (v13 != v3)
  {
    v14 = [(WFWidgetConfigurationParametersViewController *)self tableView];
    [v14 bounds];
    double v16 = v15;
    v17 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
    objc_msgSend(v17, "setFrame:", 0.0, 0.0, v16, v3);

    id v19 = [(WFWidgetConfigurationParametersViewController *)self tableView];
    v18 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
    [v18 frame];
    [v19 _tableHeaderHeightDidChangeToHeight:CGRectGetHeight(v22)];
  }
}

- (void)invalidateIntentDescriptionLabelMetrics
{
  double v3 = [(WFWidgetConfigurationParametersViewController *)self tableView];
  [v3 bounds];
  double v5 = v4;
  double v6 = [(WFWidgetConfigurationParametersViewController *)self tableView];
  [v6 layoutMargins];
  double v8 = v7;
  double v9 = [(WFWidgetConfigurationParametersViewController *)self tableView];
  [v9 layoutMargins];
  double v11 = v8 + v10 + 2.0;

  v12 = [(WFConfigurationParametersViewController *)self dataSource];
  double v13 = [(WFWidgetConfigurationParametersViewController *)self tableView];
  v14 = [v12 tableView:v13 titleForHeaderInSection:0];

  double v15 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
  [v15 directionalLayoutMargins];
  double v17 = v16;
  double v19 = v18;

  v20 = [(WFWidgetConfigurationParametersViewController *)self tableView];
  [v20 directionalLayoutMargins];
  double v22 = v21;

  if (v22 < v17)
  {
    v23 = [(WFWidgetConfigurationParametersViewController *)self tableView];
    [v23 directionalLayoutMargins];
    double v17 = v24;
  }
  v25 = [(WFWidgetConfigurationParametersViewController *)self tableView];
  [v25 directionalLayoutMargins];
  double v27 = v26;

  if (v27 < v19)
  {
    v28 = [(WFWidgetConfigurationParametersViewController *)self tableView];
    [v28 directionalLayoutMargins];
    double v19 = v29;
  }
  double v30 = v5 - (v11 + 2.0);
  v31 = [(WFWidgetConfigurationParametersViewController *)self tableView];
  [v31 layoutMargins];
  double v33 = v32;

  if (v33 < 8.0) {
    double v33 = 8.0;
  }
  if (v14) {
    double v34 = 0.0;
  }
  else {
    double v34 = v33;
  }
  v35 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
  [v35 directionalLayoutMargins];
  if (v39 == v17 && v36 == v33 && v38 == v19 && v37 == v34)
  {
    v40 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    [v40 preferredMaxLayoutWidth];
    double v42 = v41;

    if (v42 == v30) {
      return;
    }
  }
  else
  {
  }
  v43 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
  objc_msgSend(v43, "setDirectionalLayoutMargins:", v33, v17, v34, v19);

  v44 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
  [v44 setPreferredMaxLayoutWidth:v30];

  [(WFWidgetConfigurationParametersViewController *)self updateTableHeaderHeight];
}

- (void)viewLayoutMarginsDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)WFWidgetConfigurationParametersViewController;
  [(WFWidgetConfigurationParametersViewController *)&v3 viewLayoutMarginsDidChange];
  [(WFWidgetConfigurationParametersViewController *)self invalidateIntentDescriptionLabelMetrics];
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)WFWidgetConfigurationParametersViewController;
  [(WFWidgetConfigurationParametersViewController *)&v4 viewIsAppearing:a3];
  [(WFWidgetConfigurationParametersViewController *)self invalidateIntentDescriptionLabelMetrics];
}

- (void)viewDidLoad
{
  v9.receiver = self;
  v9.super_class = (Class)WFWidgetConfigurationParametersViewController;
  [(WFConfigurationParametersViewController *)&v9 viewDidLoad];
  objc_super v3 = [(WFWidgetConfigurationParametersViewController *)self widgetDisplayName];
  objc_super v4 = [(WFWidgetConfigurationParametersViewController *)self navigationItem];
  [v4 setTitle:v3];

  id v5 = [objc_alloc((Class)UIBarButtonItem) initWithBarButtonSystemItem:0 target:self action:"finishEditing"];
  double v6 = [(WFWidgetConfigurationParametersViewController *)self navigationItem];
  [v6 setRightBarButtonItem:v5];

  if ([(WFWidgetConfigurationParametersViewController *)self showsWidgetDescription])
  {
    double v7 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
    double v8 = [(WFWidgetConfigurationParametersViewController *)self tableView];
    [v8 setTableHeaderView:v7];
  }
  else
  {
    double v7 = [(WFWidgetConfigurationParametersViewController *)self tableView];
    [v7 setTableHeaderView:0];
  }
}

- (void)loadView
{
  v58.receiver = self;
  v58.super_class = (Class)WFWidgetConfigurationParametersViewController;
  [(WFConfigurationParametersViewController *)&v58 loadView];
  objc_super v3 = +[UIColor clearColor];
  objc_super v4 = [(WFWidgetConfigurationParametersViewController *)self tableView];
  [v4 setBackgroundColor:v3];

  id v5 = [(WFWidgetConfigurationParametersViewController *)self widgetDescription];
  id v6 = [v5 length];

  if (v6)
  {
    id v7 = objc_alloc_init((Class)UILabel);
    [(WFWidgetConfigurationParametersViewController *)self setWidgetDescriptionLabel:v7];

    double v8 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

    objc_super v9 = [(WFWidgetConfigurationParametersViewController *)self widgetDescription];
    double v10 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    [v10 setText:v9];

    double v11 = +[UIFont preferredFontForTextStyle:UIFontTextStyleFootnote];
    v12 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    [v12 setFont:v11];

    double v13 = +[UIColor secondaryLabelColor];
    v14 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    [v14 setTextColor:v13];

    double v15 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    [v15 setNumberOfLines:0];

    double v16 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    [v16 setAdjustsFontForContentSizeCategory:1];

    id v17 = objc_alloc_init((Class)UIView);
    [(WFWidgetConfigurationParametersViewController *)self setWidgetDescriptionView:v17];

    double v18 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
    [v18 setPreservesSuperviewLayoutMargins:1];

    double v19 = [(WFWidgetConfigurationParametersViewController *)self tableView];
    [v19 layoutMargins];
    double v21 = v20;
    double v23 = v22;
    double v25 = v24;
    double v27 = v26;
    v28 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
    objc_msgSend(v28, "setLayoutMargins:", v21, v23, v25, v27);

    double v29 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
    double v30 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    [v29 addSubview:v30];

    v31 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    double v32 = [v31 topAnchor];
    double v33 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
    double v34 = [v33 topAnchor];
    [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionTallScriptCompensatedSpacing];
    objc_msgSend(v32, "constraintEqualToAnchor:constant:", v34);
    v35 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    widgetDescriptionLabelTopSpacingConstraint = self->_widgetDescriptionLabelTopSpacingConstraint;
    self->_widgetDescriptionLabelTopSpacingConstraint = v35;

    v57 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    v54 = [v57 leadingAnchor];
    v56 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
    v55 = [v56 layoutMarginsGuide];
    v53 = [v55 leadingAnchor];
    v52 = [v54 constraintEqualToAnchor:v53 constant:2.0];
    v59[0] = v52;
    v51 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    v48 = [v51 trailingAnchor];
    v50 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
    v49 = [v50 layoutMarginsGuide];
    double v37 = [v49 trailingAnchor];
    double v38 = [v48 constraintEqualToAnchor:v37 constant:-2.0];
    double v39 = self->_widgetDescriptionLabelTopSpacingConstraint;
    v59[1] = v38;
    v59[2] = v39;
    v40 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
    double v41 = [v40 layoutMarginsGuide];
    double v42 = [v41 bottomAnchor];
    v43 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    v44 = [v43 bottomAnchor];
    v45 = [v42 constraintEqualToAnchor:v44 constant:8.0];
    v59[3] = v45;
    v46 = +[NSArray arrayWithObjects:v59 count:4];
    +[NSLayoutConstraint activateConstraints:v46];

    [(WFWidgetConfigurationParametersViewController *)self updateTableHeaderHeight];
  }
  v47 = [(WFWidgetConfigurationParametersViewController *)self tableView];
  [v47 setSectionFooterHeight:0.0];
}

- (void)configureCell:(id)a3 forAction:(id)a4 parameter:(id)a5
{
  id v6 = a3;
  id v7 = [(WFWidgetConfigurationParametersViewController *)self cardBackgroundColor];
  [v6 setCardBackgroundColor:v7];

  double v8 = [(WFWidgetConfigurationParametersViewController *)self fillProvider];
  [v6 setFillProvider:v8];

  id v9 = [(WFWidgetConfigurationParametersViewController *)self strokeProvider];
  [v6 setStrokeProvider:v9];
}

- (void)reloadActionParameterModels
{
  if ([(WFWidgetConfigurationParametersViewController *)self isViewLoaded])
  {
    objc_super v3 = [(WFConfigurationParametersViewController *)self dataSource];
    objc_super v4 = [(WFConfigurationParametersViewController *)self action];
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_1000135B0;
    v5[3] = &unk_10002D7A8;
    v5[4] = self;
    [v3 applyParametersFromAction:v4 animatingDifferences:1 completion:v5];
  }
}

- (void)populateConfiguredAppIntentWithCompletion:(id)a3
{
  objc_super v4 = (void (**)(id, id, void))a3;
  id v5 = [(WFConfigurationParametersViewController *)self action];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v6 = v5;
    }
    else {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }
  id v7 = v6;

  id v8 = objc_alloc((Class)INAppIntent);
  id v9 = [v7 fullyQualifiedLinkActionIdentifier];
  double v10 = [v9 bundleIdentifier];
  double v11 = [v7 fullyQualifiedLinkActionIdentifier];
  v12 = [v11 actionIdentifier];
  double v13 = [(WFConfigurationParametersViewController *)self action];
  v14 = [v13 serializedParameters];
  id v20 = [v8 initWithAppBundleIdentifier:v10 appIntentIdentifier:v12 serializedParameters:v14];

  double v15 = [v7 metadata];

  double v16 = [v15 effectiveBundleIdentifiers];
  id v17 = [v16 array];
  double v18 = objc_msgSend(v17, "if_firstObjectPassingTest:", &stru_10002D360);
  double v19 = [v18 bundleIdentifier];
  [v20 _setExtensionBundleId:v19];

  v4[2](v4, v20, 0);
}

- (void)populateConfiguredCustomIntentWithCompletion:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100013908;
  v4[3] = &unk_10002D340;
  id v5 = self;
  id v6 = a3;
  id v3 = v6;
  [(WFConfigurationParametersViewController *)v5 populateConfiguredActionWithCompletion:v4];
}

- (void)populateConfiguredIntentWithCompletion:(id)a3
{
  id v10 = a3;
  objc_super v4 = [(WFConfigurationParametersViewController *)self action];
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

  uint64_t v6 = [(WFConfigurationParametersViewController *)self action];
  if (v6)
  {
    id v7 = (void *)v6;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v8 = v7;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;

    if (!v5)
    {
      if (!v9) {
        goto LABEL_17;
      }
      [(WFWidgetConfigurationParametersViewController *)self populateConfiguredAppIntentWithCompletion:v10];
      goto LABEL_16;
    }
  }
  else
  {
    if (!v5) {
      goto LABEL_17;
    }
    id v9 = 0;
  }
  [(WFWidgetConfigurationParametersViewController *)self populateConfiguredCustomIntentWithCompletion:v10];
  id v7 = v9;
LABEL_16:

LABEL_17:
}

- (void)applyStylingWithStrokeProvider:(id)a3 fillProvider:(id)a4 cardBackgroundColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(WFWidgetConfigurationParametersViewController *)self fillProvider];
  id v12 = v9;
  double v13 = v12;
  if (v11 == v12)
  {

LABEL_7:
    id v14 = [(WFWidgetConfigurationParametersViewController *)self strokeProvider];
    id v17 = v8;
    double v18 = v17;
    if (v14 == v17)
    {

      goto LABEL_24;
    }
    if (v17 && v14)
    {
      unsigned __int8 v19 = [v14 isEqual:v17];

      if (v19) {
        goto LABEL_24;
      }
      goto LABEL_16;
    }

    double v15 = v14;
    goto LABEL_14;
  }
  id v14 = v12;
  double v15 = v11;
  if (v12)
  {
    id v14 = v12;
    double v15 = v11;
    if (v11)
    {
      unsigned int v16 = [v11 isEqual:v12];

      if (!v16) {
        goto LABEL_15;
      }
      goto LABEL_7;
    }
  }
LABEL_14:

LABEL_15:
LABEL_16:
  [(WFWidgetConfigurationParametersViewController *)self setCardBackgroundColor:v10];
  [(WFWidgetConfigurationParametersViewController *)self setStrokeProvider:v8];
  [(WFWidgetConfigurationParametersViewController *)self setFillProvider:v13];
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v20 = [(WFWidgetConfigurationParametersViewController *)self tableView];
  double v21 = [v20 visibleCells];

  id v22 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v22)
  {
    id v23 = v22;
    uint64_t v24 = *(void *)v27;
    do
    {
      for (i = 0; i != v23; i = (char *)i + 1)
      {
        if (*(void *)v27 != v24) {
          objc_enumerationMutation(v21);
        }
        [*(id *)(*((void *)&v26 + 1) + 8 * i) applyStylingWithStrokeProvider:v8 fillProvider:v13 cardBackgroundColor:v10];
      }
      id v23 = [v21 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v23);
  }

LABEL_24:
}

- (void)setFillProvider:(id)a3
{
  id v4 = a3;
  id v5 = [(WFWidgetConfigurationParametersViewController *)self fillProvider];
  id v6 = v4;
  id v11 = v6;
  if (v5 == v6)
  {

    fillProvider = (MTVisualStylingProvider *)v11;
LABEL_9:

    id v8 = v11;
    goto LABEL_10;
  }
  if (!v6 || !v5)
  {

    id v8 = v11;
    goto LABEL_8;
  }
  unsigned __int8 v7 = [v5 isEqual:v6];

  id v8 = v11;
  if ((v7 & 1) == 0)
  {
LABEL_8:
    id v10 = v8;
    fillProvider = self->_fillProvider;
    self->_fillProvider = v10;
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setStrokeProvider:(id)a3
{
  id v5 = a3;
  id v6 = [(WFWidgetConfigurationParametersViewController *)self strokeProvider];
  id v7 = v5;
  id v13 = v7;
  if (v6 == v7)
  {

    id v9 = v13;
    id v10 = v13;
LABEL_9:

    goto LABEL_10;
  }
  if (!v7 || !v6)
  {

    goto LABEL_8;
  }
  unsigned __int8 v8 = [v6 isEqual:v7];

  if ((v8 & 1) == 0)
  {
LABEL_8:
    id v11 = [(WFWidgetConfigurationParametersViewController *)self strokeProvider];
    id v12 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    [v11 stopAutomaticallyUpdatingView:v12];

    objc_storeStrong((id *)&self->_strokeProvider, a3);
    id v10 = [(WFWidgetConfigurationParametersViewController *)self strokeProvider];
    id v9 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabel];
    [v10 automaticallyUpdateView:v9 withStyle:1];
    goto LABEL_9;
  }
LABEL_10:
}

- (void)setShowsWidgetDescription:(BOOL)a3
{
  if ([(WFWidgetConfigurationParametersViewController *)self showsWidgetDescription] != a3)
  {
    self->_showsWidgetDescription = a3;
    if ([(WFWidgetConfigurationParametersViewController *)self isViewLoaded])
    {
      [(WFWidgetConfigurationParametersViewController *)self invalidateIntentDescriptionLabelMetrics];
      if ([(WFWidgetConfigurationParametersViewController *)self showsWidgetDescription])
      {
        id v5 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionView];
        id v6 = [(WFWidgetConfigurationParametersViewController *)self tableView];
        [v6 setTableHeaderView:v5];
      }
      else
      {
        id v5 = [(WFWidgetConfigurationParametersViewController *)self tableView];
        [v5 setTableHeaderView:0];
      }

      [(WFWidgetConfigurationParametersViewController *)self updateTableHeaderHeight];
    }
  }
}

- (void)setwidgetDescriptionTallScriptCompensatedSpacing:(double)a3
{
  self->_widgetDescriptionTallScriptCompensatedSpacing = a3;
  id v4 = [(WFWidgetConfigurationParametersViewController *)self widgetDescriptionLabelTopSpacingConstraint];
  [v4 setConstant:a3];
}

- (void)setOverrideUserInterfaceStyle:(int64_t)a3
{
  v6.receiver = self;
  v6.super_class = (Class)WFWidgetConfigurationParametersViewController;
  -[WFWidgetConfigurationParametersViewController setOverrideUserInterfaceStyle:](&v6, "setOverrideUserInterfaceStyle:");
  id v5 = [(WFWidgetConfigurationParametersViewController *)self presentedViewController];
  [v5 setOverrideUserInterfaceStyle:a3];
}

- (WFWidgetConfigurationParametersViewController)initWithAction:(id)a3 intentIdentifier:(id)a4 widgetFamily:(int64_t)a5 widgetDisplayName:(id)a6 widgetDescription:(id)a7 widgetConfigurationType:(unint64_t)a8
{
  id v14 = a4;
  id v15 = a6;
  id v16 = a7;
  v26.receiver = self;
  v26.super_class = (Class)WFWidgetConfigurationParametersViewController;
  id v17 = [(WFConfigurationParametersViewController *)&v26 initWithAction:a3 hiddenParameterKeys:0 footerButtons:&__NSArray0__struct widgetType:a8];
  if (v17)
  {
    double v18 = (NSString *)[v14 copy];
    intentIdentifier = v17->_intentIdentifier;
    v17->_intentIdentifier = v18;

    v17->_widgetFamily = a5;
    id v20 = (NSString *)[v15 copy];
    widgetDisplayName = v17->_widgetDisplayName;
    v17->_widgetDisplayName = v20;

    id v22 = (NSString *)[v16 copy];
    widgetDescription = v17->_widgetDescription;
    v17->_widgetDescription = v22;

    v17->_showsWidgetDescription = 1;
    uint64_t v24 = v17;
  }

  return v17;
}

@end