@interface RAPAddAPlaceLocationRefinementViewController
- (CGRect)previousNavigationControllerFrame;
- (NSLayoutConstraint)textFieldContainerViewBottomConstraint;
- (NSString)editedValue;
- (NSString)textFieldPlaceholder;
- (NSString)textFieldText;
- (NSString)textFieldTitle;
- (RAPAddAPlaceLocationRefinementViewController)initWithCamera:(id)a3 showCrosshair:(BOOL)a4 textFieldTitle:(id)a5 textFieldPlaceholder:(id)a6 textFieldText:(id)a7 textFieldEditBlock:(id)a8;
- (UITextField)textField;
- (UIView)textFieldContainerView;
- (id)backgroundColor;
- (id)textFieldEditBlock;
- (void)adjustTextFieldContainerPositionWithKeyboardFrame:(CGRect)a3;
- (void)dealloc;
- (void)keyboardDidChangeFrameNotification:(id)a3;
- (void)keyboardWillChangeFrame:(id)a3;
- (void)mapViewDidStartUserInteraction:(id)a3;
- (void)setPreviousNavigationControllerFrame:(CGRect)a3;
- (void)setTextField:(id)a3;
- (void)setTextFieldContainerView:(id)a3;
- (void)setTextFieldContainerViewBottomConstraint:(id)a3;
- (void)setTextFieldEditBlock:(id)a3;
- (void)setTextFieldPlaceholder:(id)a3;
- (void)setTextFieldText:(id)a3;
- (void)setTextFieldTitle:(id)a3;
- (void)textDidChange:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation RAPAddAPlaceLocationRefinementViewController

- (RAPAddAPlaceLocationRefinementViewController)initWithCamera:(id)a3 showCrosshair:(BOOL)a4 textFieldTitle:(id)a5 textFieldPlaceholder:(id)a6 textFieldText:(id)a7 textFieldEditBlock:(id)a8
{
  BOOL v11 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (v11) {
    uint64_t v18 = 0;
  }
  else {
    uint64_t v18 = 4;
  }
  v29.receiver = self;
  v29.super_class = (Class)RAPAddAPlaceLocationRefinementViewController;
  v19 = [(LocationRefinementViewController *)&v29 initWithCamera:a3 crosshairType:v18];
  if (v19)
  {
    v20 = (NSString *)[v14 copy];
    textFieldTitle = v19->_textFieldTitle;
    v19->_textFieldTitle = v20;

    v22 = (NSString *)[v16 copy];
    textFieldText = v19->_textFieldText;
    v19->_textFieldText = v22;

    v24 = (NSString *)[v15 copy];
    textFieldPlaceholder = v19->_textFieldPlaceholder;
    v19->_textFieldPlaceholder = v24;

    id v26 = objc_retainBlock(v17);
    id textFieldEditBlock = v19->_textFieldEditBlock;
    v19->_id textFieldEditBlock = v26;
  }
  return v19;
}

- (void)viewDidLoad
{
  v53.receiver = self;
  v53.super_class = (Class)RAPAddAPlaceLocationRefinementViewController;
  [(RAPLocationRefinementViewController *)&v53 viewDidLoad];
  v3 = [(LocationRefinementViewController *)self mapView];
  [v3 setMapType:2];

  v4 = +[UIColor clearColor];
  v5 = [(RAPAddAPlaceLocationRefinementViewController *)self view];
  [v5 setBackgroundColor:v4];

  v6 = [(LocationRefinementViewController *)self mapViewConstraints];
  +[NSLayoutConstraint deactivateConstraints:v6];

  v7 = [(RAPAddAPlaceLocationRefinementViewController *)self view];
  v8 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldContainerView];
  [v7 addSubview:v8];

  v9 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldContainerView];
  v10 = [v9 bottomAnchor];
  BOOL v11 = [(RAPAddAPlaceLocationRefinementViewController *)self view];
  v12 = [v11 bottomAnchor];
  v13 = [v10 constraintEqualToAnchor:v12];
  [(RAPAddAPlaceLocationRefinementViewController *)self setTextFieldContainerViewBottomConstraint:v13];

  v52 = [(LocationRefinementViewController *)self mapView];
  v50 = [v52 topAnchor];
  v51 = [(RAPAddAPlaceLocationRefinementViewController *)self view];
  v49 = [v51 topAnchor];
  v48 = [v50 constraintEqualToAnchor:v49];
  v54[0] = v48;
  v47 = [(LocationRefinementViewController *)self mapView];
  v45 = [v47 leadingAnchor];
  v46 = [(RAPAddAPlaceLocationRefinementViewController *)self view];
  v44 = [v46 leadingAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v54[1] = v43;
  v42 = [(LocationRefinementViewController *)self mapView];
  v40 = [v42 trailingAnchor];
  v41 = [(RAPAddAPlaceLocationRefinementViewController *)self view];
  v39 = [v41 trailingAnchor];
  v38 = [v40 constraintEqualToAnchor:v39];
  v54[2] = v38;
  v37 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldContainerView];
  v35 = [v37 topAnchor];
  v36 = [(LocationRefinementViewController *)self mapView];
  v34 = [v36 bottomAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v54[3] = v33;
  v32 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldContainerView];
  v30 = [v32 leadingAnchor];
  v31 = [(RAPAddAPlaceLocationRefinementViewController *)self view];
  objc_super v29 = [v31 safeAreaLayoutGuide];
  v28 = [v29 leadingAnchor];
  v27 = [v30 constraintEqualToAnchor:v28];
  v54[4] = v27;
  id v26 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldContainerView];
  v25 = [v26 trailingAnchor];
  id v14 = [(RAPAddAPlaceLocationRefinementViewController *)self view];
  id v15 = [v14 safeAreaLayoutGuide];
  id v16 = [v15 trailingAnchor];
  id v17 = [v25 constraintEqualToAnchor:v16];
  v54[5] = v17;
  uint64_t v18 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldContainerView];
  v19 = [v18 heightAnchor];
  v20 = [v19 constraintEqualToConstant:46.0];
  v54[6] = v20;
  v21 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldContainerViewBottomConstraint];
  v54[7] = v21;
  v22 = +[NSArray arrayWithObjects:v54 count:8];
  +[NSLayoutConstraint activateConstraints:v22];

  v23 = +[NSNotificationCenter defaultCenter];
  [v23 addObserver:self selector:"keyboardWillChangeFrame:" name:UIKeyboardWillChangeFrameNotification object:0];

  v24 = +[NSNotificationCenter defaultCenter];
  [v24 addObserver:self selector:"keyboardDidChangeFrameNotification:" name:UIKeyboardDidChangeFrameNotification object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RAPAddAPlaceLocationRefinementViewController;
  [(LocationRefinementViewController *)&v5 viewWillAppear:a3];
  v4 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
  [v4 becomeFirstResponder];
}

- (void)viewWillDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)RAPAddAPlaceLocationRefinementViewController;
  [(LocationRefinementViewController *)&v5 viewWillDisappear:a3];
  v4 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
  [v4 resignFirstResponder];
}

- (void)dealloc
{
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)RAPAddAPlaceLocationRefinementViewController;
  [(RAPAddAPlaceLocationRefinementViewController *)&v4 dealloc];
}

- (id)backgroundColor
{
  return +[UIColor colorWithRed:0.952941179 green:0.952941179 blue:0.952941179 alpha:1.0];
}

- (UIView)textFieldContainerView
{
  textFieldContainerView = self->_textFieldContainerView;
  if (!textFieldContainerView)
  {
    objc_super v4 = (UIView *)objc_alloc_init((Class)UIView);
    objc_super v5 = self->_textFieldContainerView;
    self->_textFieldContainerView = v4;

    [(UIView *)self->_textFieldContainerView setTranslatesAutoresizingMaskIntoConstraints:0];
    v6 = [(RAPAddAPlaceLocationRefinementViewController *)self backgroundColor];
    [(UIView *)self->_textFieldContainerView setBackgroundColor:v6];

    id v7 = objc_alloc_init((Class)UILabel);
    [v7 setTranslatesAutoresizingMaskIntoConstraints:0];
    v8 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldTitle];
    [v7 setText:v8];

    v9 = +[UIColor grayColor];
    [v7 setTextColor:v9];

    v10 = +[UIFont system17];
    [v7 setFont:v10];

    LODWORD(v11) = 1144750080;
    [v7 setContentHuggingPriority:0 forAxis:v11];
    [(UIView *)self->_textFieldContainerView addSubview:v7];
    v12 = objc_alloc_init(RAPVerticalBar);
    [(RAPVerticalBar *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
    v13 = v12;
    [(UIView *)self->_textFieldContainerView addSubview:v12];
    id v14 = objc_alloc_init((Class)UITextField);
    [(RAPAddAPlaceLocationRefinementViewController *)self setTextField:v14];

    id v15 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    [v15 setTranslatesAutoresizingMaskIntoConstraints:0];

    id v16 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldPlaceholder];
    id v17 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    [v17 setPlaceholder:v16];

    uint64_t v18 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldText];
    v19 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    [v19 setText:v18];

    v20 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    [v20 setAutocorrectionType:1];

    v21 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    [v21 setKeyboardType:13];

    v22 = +[UIFont system17];
    v23 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    [v23 setFont:v22];

    v24 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    [v24 addTarget:self action:"textDidChange:" forControlEvents:0x20000];

    v25 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    LODWORD(v26) = 1144750080;
    [v25 setContentCompressionResistancePriority:0 forAxis:v26];

    v27 = self->_textFieldContainerView;
    v28 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    [(UIView *)v27 addSubview:v28];

    id v59 = objc_alloc_init((Class)NSMutableArray);
    v61[0] = @"kBarThickness";
    objc_super v29 = +[UIScreen mainScreen];
    [v29 scale];
    v31 = +[NSNumber numberWithDouble:1.0 / v30];
    v62[0] = v31;
    v62[1] = &off_1013AF0C8;
    v61[1] = @"kTitleLabelLeading";
    v61[2] = @"kTitleLabelVerticalBarPadding";
    v61[3] = @"kVerticalBarTextFieldPadding";
    v62[2] = &off_1013AF0D8;
    v62[3] = &off_1013AF0E8;
    v32 = +[NSDictionary dictionaryWithObjects:v62 forKeys:v61 count:4];
    v33 = _NSDictionaryOfVariableBindings(@"titleLabel, verticalBar, _textField", v7, v13, self->_textField, 0);
    v34 = +[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", @"H:|-(kTitleLabelLeading)-[titleLabel]-(kTitleLabelVerticalBarPadding)-[verticalBar(kBarThickness)]-(kVerticalBarTextFieldPadding)-[_textField]-|", 0, v32, v33);
    [v59 addObjectsFromArray:v34];

    v58 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    v57 = [v58 topAnchor];
    v56 = [(UIView *)self->_textFieldContainerView topAnchor];
    v55 = [v57 constraintEqualToAnchor:v56];
    v60[0] = v55;
    v54 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    v52 = [v54 bottomAnchor];
    v51 = [(UIView *)self->_textFieldContainerView bottomAnchor];
    v50 = [v52 constraintEqualToAnchor:v51];
    v60[1] = v50;
    objc_super v53 = v13;
    v48 = [(RAPVerticalBar *)v13 topAnchor];
    v47 = [(UIView *)self->_textFieldContainerView topAnchor];
    v46 = [v48 constraintEqualToAnchor:v47];
    v60[2] = v46;
    v45 = [(RAPVerticalBar *)v13 bottomAnchor];
    v44 = [(UIView *)self->_textFieldContainerView bottomAnchor];
    v35 = [v45 constraintEqualToAnchor:v44];
    v60[3] = v35;
    v49 = v7;
    v36 = [v7 topAnchor];
    v37 = [(UIView *)self->_textFieldContainerView topAnchor];
    v38 = [v36 constraintEqualToAnchor:v37];
    v60[4] = v38;
    v39 = [v7 bottomAnchor];
    v40 = [(UIView *)self->_textFieldContainerView bottomAnchor];
    v41 = [v39 constraintEqualToAnchor:v40];
    v60[5] = v41;
    v42 = +[NSArray arrayWithObjects:v60 count:6];
    [v59 addObjectsFromArray:v42];

    +[NSLayoutConstraint activateConstraints:v59];
    textFieldContainerView = self->_textFieldContainerView;
  }

  return textFieldContainerView;
}

- (void)textDidChange:(id)a3
{
  objc_super v4 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldEditBlock];

  if (v4)
  {
    v6 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldEditBlock];
    objc_super v5 = [(RAPAddAPlaceLocationRefinementViewController *)self editedValue];
    v6[2](v6, v5);
  }
}

- (NSString)editedValue
{
  v2 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
  v3 = [v2 text];

  return (NSString *)v3;
}

- (void)setTextFieldPlaceholder:(id)a3
{
  id v4 = a3;
  objc_super v5 = (NSString *)[v4 copy];
  textFieldPlaceholder = self->_textFieldPlaceholder;
  self->_textFieldPlaceholder = v5;

  id v7 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
  [v7 setPlaceholder:v4];
}

- (void)mapViewDidStartUserInteraction:(id)a3
{
  id v4 = +[UIDevice currentDevice];
  objc_super v5 = (char *)[v4 orientation] - 3;

  if ((unint64_t)v5 <= 1)
  {
    id v6 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
    [v6 resignFirstResponder];
  }
}

- (void)keyboardWillChangeFrame:(id)a3
{
  id v4 = a3;
  objc_super v5 = [(RAPAddAPlaceLocationRefinementViewController *)self navigationController];
  id v6 = [v5 view];
  id v7 = [v6 superview];
  [v7 frame];
  -[RAPAddAPlaceLocationRefinementViewController setPreviousNavigationControllerFrame:](self, "setPreviousNavigationControllerFrame:");

  v8 = [v4 userInfo];

  v9 = [v8 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
  [v9 CGRectValue];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;

  id v18 = [(RAPAddAPlaceLocationRefinementViewController *)self view];
  [v18 convertRect:0 fromView:v11, v13, v15, v17];
  -[RAPAddAPlaceLocationRefinementViewController adjustTextFieldContainerPositionWithKeyboardFrame:](self, "adjustTextFieldContainerPositionWithKeyboardFrame:");
}

- (void)keyboardDidChangeFrameNotification:(id)a3
{
  id v31 = a3;
  id v4 = [(RAPAddAPlaceLocationRefinementViewController *)self textField];
  if ([v4 isFirstResponder])
  {
    [(RAPAddAPlaceLocationRefinementViewController *)self previousNavigationControllerFrame];
    CGFloat v6 = v5;
    CGFloat v8 = v7;
    CGFloat v10 = v9;
    CGFloat v12 = v11;
    double v13 = [(RAPAddAPlaceLocationRefinementViewController *)self navigationController];
    double v14 = [v13 view];
    double v15 = [v14 superview];
    [v15 frame];
    v34.origin.x = v16;
    v34.origin.y = v17;
    v34.size.width = v18;
    v34.size.height = v19;
    v33.origin.x = v6;
    v33.origin.y = v8;
    v33.size.width = v10;
    v33.size.height = v12;
    BOOL v20 = CGRectEqualToRect(v33, v34);

    if (v20) {
      goto LABEL_5;
    }
    v21 = [v31 userInfo];
    v22 = [v21 objectForKeyedSubscript:UIKeyboardFrameEndUserInfoKey];
    [v22 CGRectValue];
    double v24 = v23;
    double v26 = v25;
    double v28 = v27;
    double v30 = v29;

    id v4 = [(RAPAddAPlaceLocationRefinementViewController *)self view];
    [v4 convertRect:0 fromView:v24, v26, v28, v30];
    -[RAPAddAPlaceLocationRefinementViewController adjustTextFieldContainerPositionWithKeyboardFrame:](self, "adjustTextFieldContainerPositionWithKeyboardFrame:");
  }

LABEL_5:
}

- (void)adjustTextFieldContainerPositionWithKeyboardFrame:(CGRect)a3
{
  double MinY = CGRectGetMinY(a3);
  double v5 = [(RAPAddAPlaceLocationRefinementViewController *)self view];
  [v5 bounds];
  double v6 = MinY - CGRectGetMaxY(v9);

  id v7 = [(RAPAddAPlaceLocationRefinementViewController *)self textFieldContainerViewBottomConstraint];
  [v7 setConstant:fmin(v6, 0.0)];
}

- (NSString)textFieldPlaceholder
{
  return self->_textFieldPlaceholder;
}

- (UITextField)textField
{
  return self->_textField;
}

- (void)setTextField:(id)a3
{
}

- (NSLayoutConstraint)textFieldContainerViewBottomConstraint
{
  return self->_textFieldContainerViewBottomConstraint;
}

- (void)setTextFieldContainerViewBottomConstraint:(id)a3
{
}

- (void)setTextFieldContainerView:(id)a3
{
}

- (id)textFieldEditBlock
{
  return self->_textFieldEditBlock;
}

- (void)setTextFieldEditBlock:(id)a3
{
}

- (NSString)textFieldTitle
{
  return self->_textFieldTitle;
}

- (void)setTextFieldTitle:(id)a3
{
}

- (NSString)textFieldText
{
  return self->_textFieldText;
}

- (void)setTextFieldText:(id)a3
{
}

- (CGRect)previousNavigationControllerFrame
{
  double x = self->_previousNavigationControllerFrame.origin.x;
  double y = self->_previousNavigationControllerFrame.origin.y;
  double width = self->_previousNavigationControllerFrame.size.width;
  double height = self->_previousNavigationControllerFrame.size.height;
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (void)setPreviousNavigationControllerFrame:(CGRect)a3
{
  self->_previousNavigationControllerFrame = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_textFieldText, 0);
  objc_storeStrong((id *)&self->_textFieldTitle, 0);
  objc_storeStrong(&self->_textFieldEditBlock, 0);
  objc_storeStrong((id *)&self->_textFieldContainerView, 0);
  objc_storeStrong((id *)&self->_textFieldContainerViewBottomConstraint, 0);
  objc_storeStrong((id *)&self->_textField, 0);

  objc_storeStrong((id *)&self->_textFieldPlaceholder, 0);
}

@end