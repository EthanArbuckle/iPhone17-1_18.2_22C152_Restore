@interface CarTrafficAlertView
- (BOOL)progressBarHidden;
- (CarCardRoundedButton)cancelButton;
- (CarFocusableButton)closeButton;
- (CarFocusableProgressButton)acceptButton;
- (CarTrafficAlertView)initWithDelegate:(id)a3 incidentLayoutItem:(id)a4;
- (CarTrafficAlertView)initWithDelegate:(id)a3 trafficAlert:(id)a4;
- (CarTrafficAlertViewDelegate)delegate;
- (MNTrafficIncidentAlert)trafficAlert;
- (NSArray)focusOrderSubItems;
- (NSArray)preferredFocusEnvironments;
- (TrafficIncidentLayoutItem)incidentLayoutItem;
- (UILabel)primaryLabel;
- (UILabel)secondaryLabel;
- (UIStackView)buttonStack;
- (double)acceptProgress;
- (id)dataSource;
- (void)_buttonTapped:(id)a3;
- (void)_commonInit;
- (void)_updateView;
- (void)setAcceptButton:(id)a3;
- (void)setAcceptProgress:(double)a3;
- (void)setButtonStack:(id)a3;
- (void)setCancelButton:(id)a3;
- (void)setCloseButton:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setIncidentLayoutItem:(id)a3;
- (void)setPrimaryLabel:(id)a3;
- (void)setProgressBarHidden:(BOOL)a3;
- (void)setSecondaryLabel:(id)a3;
- (void)setTrafficAlert:(id)a3;
@end

@implementation CarTrafficAlertView

- (CarTrafficAlertView)initWithDelegate:(id)a3 trafficAlert:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CarTrafficAlertView;
  v8 = -[CarTrafficAlertView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_trafficAlert, a4);
    [(CarTrafficAlertView *)v9 _commonInit];
  }

  return v9;
}

- (CarTrafficAlertView)initWithDelegate:(id)a3 incidentLayoutItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CarTrafficAlertView;
  v8 = -[CarTrafficAlertView initWithFrame:](&v11, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v6);
    objc_storeStrong((id *)&v9->_incidentLayoutItem, a4);
    [(CarTrafficAlertView *)v9 _commonInit];
  }

  return v9;
}

- (void)_commonInit
{
  [(CarTrafficAlertView *)self setAccessibilityIdentifier:@"CarTrafficAlertView"];
  v3 = +[CarFocusableButton closeButton];
  closeButton = self->_closeButton;
  self->_closeButton = v3;

  [(CarFocusableButton *)self->_closeButton setAccessibilityIdentifier:@"CloseButton"];
  -[CarFocusableButton addTarget:action:forControlEvents:](self->_closeButton, "addTarget:action:forControlEvents:", self);
  [(CarTrafficAlertView *)self addSubview:self->_closeButton];
  id v5 = objc_alloc((Class)UILabel);
  double y = CGRectZero.origin.y;
  double width = CGRectZero.size.width;
  double height = CGRectZero.size.height;
  v9 = [v5 initWithFrame:CGRectZero.origin.x, y, width, height];
  primaryLabel = self->_primaryLabel;
  self->_primaryLabel = v9;

  [(UILabel *)self->_primaryLabel setAccessibilityIdentifier:@"PrimaryLabel"];
  [(UILabel *)self->_primaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_primaryLabel setLineBreakMode:4];
  [(UILabel *)self->_primaryLabel setNumberOfLines:0];
  objc_super v11 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleBody weight:UIFontWeightBold];
  [(UILabel *)self->_primaryLabel setFont:v11];

  v12 = +[UIColor labelColor];
  [(UILabel *)self->_primaryLabel setTextColor:v12];

  LODWORD(v13) = 1148846080;
  [(UILabel *)self->_primaryLabel setContentCompressionResistancePriority:1 forAxis:v13];
  [(CarTrafficAlertView *)self addSubview:self->_primaryLabel];
  v14 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, y, width, height];
  secondaryLabel = self->_secondaryLabel;
  self->_secondaryLabel = v14;

  [(UILabel *)self->_secondaryLabel setAccessibilityIdentifier:@"SecondaryLabel"];
  [(UILabel *)self->_secondaryLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_secondaryLabel setLineBreakMode:4];
  [(UILabel *)self->_secondaryLabel setNumberOfLines:0];
  v16 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleFootnote weight:UIFontWeightRegular];
  [(UILabel *)self->_secondaryLabel setFont:v16];

  v17 = [(UILabel *)self->_secondaryLabel font];
  [v17 pointSize];
  v19 = self->_secondaryLabel;
  if (10.0 / v18 > 1.0)
  {
    [(UILabel *)v19 setMinimumScaleFactor:1.0];
  }
  else
  {
    v20 = [(UILabel *)v19 font];
    [v20 pointSize];
    [(UILabel *)self->_secondaryLabel setMinimumScaleFactor:10.0 / v21];
  }
  [(UILabel *)self->_secondaryLabel setAdjustsFontSizeToFitWidth:1];
  v22 = +[UIColor _carSystemPrimaryColor];
  [(UILabel *)self->_secondaryLabel setTextColor:v22];

  LODWORD(v23) = 1148829696;
  [(UILabel *)self->_secondaryLabel setContentCompressionResistancePriority:1 forAxis:v23];
  [(CarTrafficAlertView *)self addSubview:self->_secondaryLabel];
  v24 = -[CarCardRoundedButton initWithFrame:]([CarCardRoundedButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  cancelButton = self->_cancelButton;
  self->_cancelButton = v24;

  [(CarCardRoundedButton *)self->_cancelButton setAccessibilityIdentifier:@"CancelButton"];
  [(CarCardRoundedButton *)self->_cancelButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v26 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleSubheadline weight:UIFontWeightRegular];
  v27 = [(CarCardRoundedButton *)self->_cancelButton titleLabel];
  [v27 setFont:v26];

  v28 = +[UIColor _carSystemQuaternaryColor];
  [(CarFocusableButton *)self->_cancelButton setNonFocusedBackgroundColor:v28];

  v29 = +[UIColor labelColor];
  [(CarFocusableButton *)self->_cancelButton setNonFocusedTintColor:v29];

  v30 = +[UIColor _carSystemFocusColor];
  [(CarFocusableButton *)self->_cancelButton setFocusedBackgroundColor:v30];

  [(CarFocusableButton *)self->_cancelButton setModifiesBackgroundColor:1];
  [(CarCardRoundedButton *)self->_cancelButton addTarget:self action:"_buttonTapped:" forControlEvents:64];
  v31 = -[CarCardRoundedButton initWithFrame:]([CarFocusableProgressButton alloc], "initWithFrame:", CGRectZero.origin.x, y, width, height);
  acceptButton = self->_acceptButton;
  self->_acceptButton = v31;

  [(CarFocusableProgressButton *)self->_acceptButton setAccessibilityIdentifier:@"AcceptButton"];
  [(CarFocusableProgressButton *)self->_acceptButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v33 = +[UIFont _mapsCar_fontForTextStyle:UIFontTextStyleSubheadline weight:UIFontWeightRegular];
  v34 = [(CarFocusableProgressButton *)self->_acceptButton titleLabel];
  [v34 setFont:v33];

  v35 = +[UIColor _carSystemQuaternaryColor];
  [(CarFocusableButton *)self->_acceptButton setNonFocusedBackgroundColor:v35];

  v36 = +[UIColor labelColor];
  [(CarFocusableButton *)self->_acceptButton setNonFocusedTintColor:v36];

  v37 = +[UIColor _carSystemFocusColor];
  [(CarFocusableButton *)self->_acceptButton setFocusedBackgroundColor:v37];

  v38 = +[UIColor _carSystemFocusColor];
  [(CarFocusableProgressButton *)self->_acceptButton setProgressFillColor:v38];

  v39 = +[UIColor _carSystemFocusLabelColor];
  [(CarFocusableProgressButton *)self->_acceptButton setProgressFillFocusedColor:v39];

  [(CarFocusableButton *)self->_acceptButton setModifiesBackgroundColor:1];
  [(CarFocusableProgressButton *)self->_acceptButton setProgress:0.0];
  [(CarFocusableProgressButton *)self->_acceptButton addTarget:self action:"_buttonTapped:" forControlEvents:64];
  v40 = [objc_alloc((Class)UIStackView) initWithFrame:CGRectZero.origin.x, y, width, height];
  buttonStack = self->_buttonStack;
  self->_buttonStack = v40;

  [(UIStackView *)self->_buttonStack setAccessibilityIdentifier:@"ButtonStack"];
  [(UIStackView *)self->_buttonStack setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_buttonStack setAxis:1];
  [(UIStackView *)self->_buttonStack setDistribution:2];
  [(UIStackView *)self->_buttonStack setSpacing:2.0];
  [(CarTrafficAlertView *)self addSubview:self->_buttonStack];
  v82 = [(CarTrafficAlertView *)self topAnchor];
  v81 = [(UILabel *)self->_primaryLabel firstBaselineAnchor];
  v80 = [v82 constraintEqualToAnchor:v81 constant:-24.0];
  v85[0] = v80;
  v79 = [(UILabel *)self->_primaryLabel leadingAnchor];
  v78 = [(CarTrafficAlertView *)self leadingAnchor];
  v77 = [v79 constraintEqualToAnchor:v78 constant:10.0];
  v85[1] = v77;
  v76 = [(UILabel *)self->_primaryLabel lastBaselineAnchor];
  v75 = [(UILabel *)self->_secondaryLabel firstBaselineAnchor];
  v74 = [v76 constraintEqualToAnchor:v75 constant:-18.0];
  v85[2] = v74;
  v73 = [(CarFocusableButton *)self->_closeButton topAnchor];
  v72 = [(UILabel *)self->_primaryLabel topAnchor];
  v71 = [v73 constraintEqualToAnchor:v72];
  v85[3] = v71;
  v70 = [(CarFocusableButton *)self->_closeButton leadingAnchor];
  v69 = [(UILabel *)self->_primaryLabel trailingAnchor];
  v68 = [v70 constraintEqualToAnchor:v69 constant:10.0];
  v85[4] = v68;
  v67 = [(CarFocusableButton *)self->_closeButton trailingAnchor];
  v66 = [(CarTrafficAlertView *)self trailingAnchor];
  v65 = [v67 constraintEqualToAnchor:v66 constant:-10.0];
  v85[5] = v65;
  v64 = [(UILabel *)self->_secondaryLabel leadingAnchor];
  v63 = [(CarTrafficAlertView *)self leadingAnchor];
  v62 = [v64 constraintEqualToAnchor:v63 constant:10.0];
  v85[6] = v62;
  v61 = [(UILabel *)self->_secondaryLabel trailingAnchor];
  v60 = [(CarTrafficAlertView *)self trailingAnchor];
  v59 = [v61 constraintEqualToAnchor:v60 constant:-10.0];
  v85[7] = v59;
  v58 = [(CarCardRoundedButton *)self->_cancelButton heightAnchor];
  +[CarCardRoundedButton buttonMetrics];
  v57 = [v58 constraintEqualToConstant:v84];
  v85[8] = v57;
  v56 = [(CarFocusableProgressButton *)self->_acceptButton heightAnchor];
  +[CarCardRoundedButton buttonMetrics];
  v55 = [v56 constraintEqualToConstant:v83];
  v85[9] = v55;
  v54 = [(UIStackView *)self->_buttonStack topAnchor];
  v53 = [(UILabel *)self->_secondaryLabel lastBaselineAnchor];
  v52 = [v54 constraintEqualToAnchor:v53 constant:10.0];
  v85[10] = v52;
  v51 = [(UIStackView *)self->_buttonStack leadingAnchor];
  v42 = [(CarTrafficAlertView *)self leadingAnchor];
  v43 = [v51 constraintEqualToAnchor:v42 constant:10.0];
  v85[11] = v43;
  v44 = [(UIStackView *)self->_buttonStack trailingAnchor];
  v45 = [(CarTrafficAlertView *)self trailingAnchor];
  v46 = [v44 constraintEqualToAnchor:v45 constant:-10.0];
  v85[12] = v46;
  v47 = [(UIStackView *)self->_buttonStack bottomAnchor];
  v48 = [(CarTrafficAlertView *)self bottomAnchor];
  v49 = [v47 constraintEqualToAnchor:v48 constant:-10.0];
  v85[13] = v49;
  v50 = +[NSArray arrayWithObjects:v85 count:14];
  +[NSLayoutConstraint activateConstraints:v50];

  [(CarTrafficAlertView *)self _updateView];
}

- (id)dataSource
{
  trafficAlert = self->_trafficAlert;
  if (!trafficAlert) {
    trafficAlert = self->_incidentLayoutItem;
  }
  id v3 = trafficAlert;

  return v3;
}

- (void)setTrafficAlert:(id)a3
{
  objc_storeStrong((id *)&self->_trafficAlert, a3);

  [(CarTrafficAlertView *)self _updateView];
}

- (void)setIncidentLayoutItem:(id)a3
{
  id v5 = (TrafficIncidentLayoutItem *)a3;
  if (self->_incidentLayoutItem != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_incidentLayoutItem, a3);
    [(CarTrafficAlertView *)self _updateView];
    id v5 = v6;
  }
}

- (void)setProgressBarHidden:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CarTrafficAlertView *)self acceptButton];
  [v4 setProgressBarHidden:v3];
}

- (BOOL)progressBarHidden
{
  v2 = [(CarTrafficAlertView *)self acceptButton];
  unsigned __int8 v3 = [v2 progressBarHidden];

  return v3;
}

- (void)setAcceptProgress:(double)a3
{
  id v4 = [(CarTrafficAlertView *)self acceptButton];
  [v4 setProgress:a3];
}

- (double)acceptProgress
{
  v2 = [(CarTrafficAlertView *)self acceptButton];
  [v2 progress];
  double v4 = v3;

  return v4;
}

- (void)_updateView
{
  double v3 = [(CarTrafficAlertView *)self primaryLabel];
  double v4 = [v3 text];
  id v5 = [(CarTrafficAlertView *)self dataSource];
  id v6 = [v5 primaryString];
  unsigned __int8 v7 = [v4 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    if (qword_10160F648 != -1) {
      dispatch_once(&qword_10160F648, &stru_1012F61C8);
    }
    id v8 = objc_alloc((Class)NSAttributedString);
    v9 = [(CarTrafficAlertView *)self dataSource];
    uint64_t v10 = [v9 primaryString];
    objc_super v11 = (void *)v10;
    if (v10) {
      CFStringRef v12 = (const __CFString *)v10;
    }
    else {
      CFStringRef v12 = &stru_101324E70;
    }
    id v13 = [v8 initWithString:v12 attributes:qword_10160F650];
    v14 = [(CarTrafficAlertView *)self primaryLabel];
    [v14 setAttributedText:v13];
  }
  v15 = [(CarTrafficAlertView *)self secondaryLabel];
  v16 = [v15 text];
  v17 = [(CarTrafficAlertView *)self dataSource];
  double v18 = [v17 secondaryString];
  unsigned __int8 v19 = [v16 isEqualToString:v18];

  if ((v19 & 1) == 0)
  {
    v20 = [(CarTrafficAlertView *)self dataSource];
    double v21 = [v20 secondaryString];
    v22 = [(CarTrafficAlertView *)self secondaryLabel];
    [v22 setText:v21];
  }
  double v23 = [(CarTrafficAlertView *)self acceptButton];
  v24 = [v23 titleLabel];
  v25 = [v24 text];
  v26 = [(CarTrafficAlertView *)self dataSource];
  v27 = [v26 acceptString];
  unsigned __int8 v28 = [v25 isEqualToString:v27];

  if ((v28 & 1) == 0)
  {
    v29 = [(CarTrafficAlertView *)self acceptButton];
    v30 = [(CarTrafficAlertView *)self dataSource];
    v31 = [v30 acceptString];
    [v29 setTitle:v31 forState:0];
  }
  v32 = [(CarTrafficAlertView *)self dataSource];
  uint64_t v33 = [v32 cancelString];
  if (!v33)
  {

LABEL_16:
    if (v28) {
      return;
    }
    goto LABEL_17;
  }
  v34 = (void *)v33;
  v35 = [(CarTrafficAlertView *)self cancelButton];
  v36 = [v35 titleLabel];
  v37 = [v36 text];
  v38 = [(CarTrafficAlertView *)self dataSource];
  v39 = [v38 cancelString];
  unsigned __int8 v40 = [v37 isEqualToString:v39];

  if (v40) {
    goto LABEL_16;
  }
  v41 = [(CarTrafficAlertView *)self cancelButton];
  v42 = [(CarTrafficAlertView *)self dataSource];
  v43 = [v42 cancelString];
  [v41 setTitle:v43 forState:0];

LABEL_17:
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v44 = [(CarTrafficAlertView *)self buttonStack];
  v45 = [v44 arrangedSubviews];

  id v46 = [v45 countByEnumeratingWithState:&v62 objects:v66 count:16];
  if (v46)
  {
    id v47 = v46;
    uint64_t v48 = *(void *)v63;
    do
    {
      for (i = 0; i != v47; i = (char *)i + 1)
      {
        if (*(void *)v63 != v48) {
          objc_enumerationMutation(v45);
        }
        uint64_t v50 = *(void *)(*((void *)&v62 + 1) + 8 * i);
        v51 = [(CarTrafficAlertView *)self buttonStack];
        [v51 _maps_removeArrangedSubview:v50];
      }
      id v47 = [v45 countByEnumeratingWithState:&v62 objects:v66 count:16];
    }
    while (v47);
  }

  v52 = +[NSMutableArray array];
  v53 = [(CarTrafficAlertView *)self cancelButton];
  v54 = [v53 titleLabel];
  v55 = [v54 text];

  if (v55)
  {
    v56 = [(CarTrafficAlertView *)self cancelButton];
    [v52 addObject:v56];
  }
  v57 = [(CarTrafficAlertView *)self acceptButton];
  v58 = [v57 titleLabel];
  v59 = [v58 text];

  if (v59)
  {
    v60 = [(CarTrafficAlertView *)self acceptButton];
    [v52 addObject:v60];
  }
  v61 = [(CarTrafficAlertView *)self buttonStack];
  [v61 _maps_setArrangedSubviews:v52];
}

- (void)_buttonTapped:(id)a3
{
  id v12 = a3;
  if (self->_trafficAlert) {
    unsigned int v4 = +[CarTrafficAlertCardViewController alertVotable:](CarTrafficAlertCardViewController, "alertVotable:");
  }
  else {
    unsigned int v4 = 0;
  }
  id v5 = [(CarTrafficAlertView *)self acceptButton];

  if (v5 == v12)
  {
    v9 = [(CarTrafficAlertView *)self delegate];
    id v8 = v9;
    if (v4) {
      uint64_t v11 = 3;
    }
    else {
      uint64_t v11 = 1;
    }
    goto LABEL_14;
  }
  id v6 = [(CarTrafficAlertView *)self cancelButton];

  if (v6 == v12)
  {
    v9 = [(CarTrafficAlertView *)self delegate];
    id v8 = v9;
    if (v4) {
      uint64_t v11 = 4;
    }
    else {
      uint64_t v11 = 2;
    }
LABEL_14:
    uint64_t v10 = self;
    goto LABEL_16;
  }
  id v7 = [(CarTrafficAlertView *)self closeButton];

  id v8 = [(CarTrafficAlertView *)self delegate];
  v9 = v8;
  uint64_t v10 = self;
  if (v7 == v12) {
    uint64_t v11 = 5;
  }
  else {
    uint64_t v11 = 0;
  }
LABEL_16:
  [v9 trafficAlertView:v10 didDismissWithResult:v11];
}

- (NSArray)focusOrderSubItems
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = [(CarTrafficAlertView *)self closeButton];
  [v3 addObject:v4];

  id v5 = [(CarTrafficAlertView *)self buttonStack];
  id v6 = [v5 arrangedSubviews];
  [v3 addObjectsFromArray:v6];

  return (NSArray *)v3;
}

- (NSArray)preferredFocusEnvironments
{
  id v3 = [(CarTrafficAlertView *)self buttonStack];
  unsigned int v4 = [v3 arrangedSubviews];
  id v5 = [(CarTrafficAlertView *)self acceptButton];
  unsigned int v6 = [v4 containsObject:v5];

  if (v6)
  {
    id v7 = [(CarTrafficAlertView *)self acceptButton];
    uint64_t v10 = v7;
    id v8 = +[NSArray arrayWithObjects:&v10 count:1];
  }
  else
  {
    id v8 = &__NSArray0__struct;
  }

  return (NSArray *)v8;
}

- (CarTrafficAlertViewDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (CarTrafficAlertViewDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (MNTrafficIncidentAlert)trafficAlert
{
  return self->_trafficAlert;
}

- (TrafficIncidentLayoutItem)incidentLayoutItem
{
  return self->_incidentLayoutItem;
}

- (UILabel)primaryLabel
{
  return self->_primaryLabel;
}

- (void)setPrimaryLabel:(id)a3
{
}

- (UILabel)secondaryLabel
{
  return self->_secondaryLabel;
}

- (void)setSecondaryLabel:(id)a3
{
}

- (CarFocusableButton)closeButton
{
  return self->_closeButton;
}

- (void)setCloseButton:(id)a3
{
}

- (UIStackView)buttonStack
{
  return (UIStackView *)objc_getProperty(self, a2, 56, 1);
}

- (void)setButtonStack:(id)a3
{
}

- (CarCardRoundedButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
}

- (CarFocusableProgressButton)acceptButton
{
  return self->_acceptButton;
}

- (void)setAcceptButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_acceptButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_buttonStack, 0);
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_secondaryLabel, 0);
  objc_storeStrong((id *)&self->_primaryLabel, 0);
  objc_storeStrong((id *)&self->_incidentLayoutItem, 0);
  objc_storeStrong((id *)&self->_trafficAlert, 0);

  objc_destroyWeak((id *)&self->_delegate);
}

@end