@interface TeachableMomentContaineeViewController
+ (BOOL)hasShownTeachableMoment;
- (TeachableMomentContaineeViewController)initWithTeachableMomentConfiguration:(id)a3;
- (double)heightForLayout:(unint64_t)a3;
- (void)_setHasShownTeachableMomentFlag;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)willChangeContainerStyle:(unint64_t)a3;
@end

@implementation TeachableMomentContaineeViewController

- (TeachableMomentContaineeViewController)initWithTeachableMomentConfiguration:(id)a3
{
  id v5 = a3;
  v12.receiver = self;
  v12.super_class = (Class)TeachableMomentContaineeViewController;
  v6 = [(TeachableMomentContaineeViewController *)&v12 initWithNibName:0 bundle:0];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    v8 = [(ContaineeViewController *)v7 cardPresentationController];
    [v8 setHideGrabber:1];

    v9 = [(ContaineeViewController *)v7 cardPresentationController];
    [v9 setAllowsSwipeToDismiss:0];

    v10 = [(ContaineeViewController *)v7 cardPresentationController];
    [v10 setPresentedModally:1];
  }
  return v7;
}

- (void)viewDidLoad
{
  v97.receiver = self;
  v97.super_class = (Class)TeachableMomentContaineeViewController;
  [(ContaineeViewController *)&v97 viewDidLoad];
  v3 = [objc_alloc((Class)UILabel) initWithFrame:CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height];
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  [(UILabel *)self->_titleLabel setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UILabel *)self->_titleLabel setNumberOfLines:0];
  id v5 = +[UIColor labelColor];
  [(UILabel *)self->_titleLabel setTextColor:v5];

  v6 = [(TeachableMomentConfiguration *)self->_configuration title];
  [(UILabel *)self->_titleLabel setText:v6];

  +[DynamicTypeWizard autorefreshLabel:self->_titleLabel withFontProvider:&stru_1013212A0];
  v7 = [(TeachableMomentContaineeViewController *)self view];
  [v7 addSubview:self->_titleLabel];

  v87 = [(UILabel *)self->_titleLabel leadingAnchor];
  v90 = [(TeachableMomentContaineeViewController *)self view];
  v84 = [v90 leadingAnchor];
  v81 = [v87 constraintEqualToAnchor:v84 constant:32.0];
  v101[0] = v81;
  v78 = [(UILabel *)self->_titleLabel trailingAnchor];
  v8 = [(TeachableMomentContaineeViewController *)self view];
  v9 = [v8 trailingAnchor];
  v10 = [v78 constraintEqualToAnchor:v9 constant:-56.0];
  v101[1] = v10;
  v11 = [(UILabel *)self->_titleLabel firstBaselineAnchor];
  objc_super v12 = [(TeachableMomentContaineeViewController *)self view];
  v13 = [v12 topAnchor];
  v14 = [v11 constraintEqualToAnchor:v13 constant:60.0];
  v101[2] = v14;
  v15 = +[NSArray arrayWithObjects:v101 count:3];
  +[NSLayoutConstraint activateConstraints:v15];

  v16 = (UIView *)objc_alloc_init((Class)UIView);
  animationContainer = self->_animationContainer;
  self->_animationContainer = v16;

  [(UIView *)self->_animationContainer setTranslatesAutoresizingMaskIntoConstraints:0];
  v18 = [(TeachableMomentContaineeViewController *)self view];
  [v18 addSubview:self->_animationContainer];

  v88 = [(UIView *)self->_animationContainer leadingAnchor];
  v91 = [(TeachableMomentContaineeViewController *)self view];
  v85 = [v91 leadingAnchor];
  v82 = [v88 constraintEqualToAnchor:v85];
  v100[0] = v82;
  v76 = [(UIView *)self->_animationContainer trailingAnchor];
  v79 = [(TeachableMomentContaineeViewController *)self view];
  v74 = [v79 trailingAnchor];
  v19 = [v76 constraintEqualToAnchor:v74];
  v100[1] = v19;
  v20 = [(UIView *)self->_animationContainer topAnchor];
  v21 = [(UILabel *)self->_titleLabel bottomAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v100[2] = v22;
  v23 = [(UIView *)self->_animationContainer heightAnchor];
  v24 = [(UIView *)self->_animationContainer widthAnchor];
  v25 = [v23 constraintEqualToAnchor:v24 multiplier:0.64533335 constant:0.0];
  v100[3] = v25;
  v26 = +[NSArray arrayWithObjects:v100 count:4];
  +[NSLayoutConstraint activateConstraints:v26];

  v27 = [(TeachableMomentConfiguration *)self->_configuration illustrationViewController];
  [(TeachableMomentContaineeViewController *)self addChildViewController:v27];

  v28 = [(TeachableMomentConfiguration *)self->_configuration illustrationViewController];
  v29 = [v28 view];
  [v29 setTranslatesAutoresizingMaskIntoConstraints:0];

  v30 = self->_animationContainer;
  v31 = [(TeachableMomentConfiguration *)self->_configuration illustrationViewController];
  v32 = [v31 view];
  [(UIView *)v30 addSubview:v32];

  v33 = [(TeachableMomentConfiguration *)self->_configuration illustrationViewController];
  v34 = [v33 view];
  LODWORD(v35) = 1148846080;
  v36 = [v34 _maps_constraintsEqualToEdgesOfView:self->_animationContainer priority:v35];
  v37 = [v36 allConstraints];
  +[NSLayoutConstraint activateConstraints:v37];

  objc_initWeak(&location, self);
  v94[0] = _NSConcreteStackBlock;
  v94[1] = 3221225472;
  v94[2] = sub_100AF6C30;
  v94[3] = &unk_1012E8CD0;
  objc_copyWeak(&v95, &location);
  v38 = +[UIAction actionWithHandler:v94];
  v39 = +[UIButton buttonWithType:1 primaryAction:v38];
  buttomButton = self->_buttomButton;
  self->_buttomButton = v39;

  [(UIButton *)self->_buttomButton setTranslatesAutoresizingMaskIntoConstraints:0];
  v41 = [(UIButton *)self->_buttomButton layer];
  [v41 setCornerRadius:10.0];

  v42 = +[UIColor systemBlueColor];
  [(UIButton *)self->_buttomButton setBackgroundColor:v42];

  v43 = self->_buttomButton;
  v44 = [(TeachableMomentConfiguration *)self->_configuration buttonTitle];
  [(UIButton *)v43 setTitle:v44 forState:0];

  v45 = self->_buttomButton;
  v46 = +[UIColor systemWhiteColor];
  [(UIButton *)v45 setTitleColor:v46 forState:0];

  v47 = [(UIButton *)self->_buttomButton titleLabel];
  +[DynamicTypeWizard autorefreshLabel:v47 withFontProvider:&stru_101321480];

  v48 = [(TeachableMomentContaineeViewController *)self view];
  [v48 addSubview:self->_buttomButton];

  v92 = [(UIButton *)self->_buttomButton leadingAnchor];
  v93 = [(TeachableMomentContaineeViewController *)self view];
  v89 = [v93 leadingAnchor];
  v86 = [v92 constraintEqualToAnchor:v89 constant:20.0];
  v99[0] = v86;
  v80 = [(UIButton *)self->_buttomButton trailingAnchor];
  v83 = [(TeachableMomentContaineeViewController *)self view];
  v77 = [v83 trailingAnchor];
  v75 = [v80 constraintEqualToAnchor:v77 constant:-20.0];
  v99[1] = v75;
  v73 = [(UIButton *)self->_buttomButton topAnchor];
  v72 = [(UIView *)self->_animationContainer bottomAnchor];
  v49 = [v73 constraintEqualToAnchor:v72];
  v99[2] = v49;
  v50 = [(UIButton *)self->_buttomButton heightAnchor];
  v51 = [v50 constraintEqualToConstant:52.0];
  v99[3] = v51;
  v52 = [(UIButton *)self->_buttomButton bottomAnchor];
  v53 = [(TeachableMomentContaineeViewController *)self view];
  v54 = [v53 safeAreaLayoutGuide];
  v55 = [v54 bottomAnchor];
  v56 = [v52 constraintEqualToAnchor:v55];
  v99[4] = v56;
  v57 = +[NSArray arrayWithObjects:v99 count:5];
  +[NSLayoutConstraint activateConstraints:v57];

  v58 = [CardButton alloc];
  v59 = +[CardButtonConfiguration close];
  v60 = [(CardButton *)v58 initWithConfiguration:v59];
  closeButton = self->_closeButton;
  self->_closeButton = v60;

  [(CardButton *)self->_closeButton setTranslatesAutoresizingMaskIntoConstraints:0];
  [(CardButton *)self->_closeButton addTarget:self action:"_closeButtonAction:" forControlEvents:64];
  v62 = [(TeachableMomentContaineeViewController *)self view];
  [v62 addSubview:self->_closeButton];

  v63 = [(CardButton *)self->_closeButton trailingAnchor];
  v64 = [(TeachableMomentContaineeViewController *)self view];
  v65 = [v64 trailingAnchor];
  v66 = [v63 constraintEqualToAnchor:v65 constant:0.0];
  v98[0] = v66;
  v67 = [(CardButton *)self->_closeButton topAnchor];
  v68 = [(TeachableMomentContaineeViewController *)self view];
  v69 = [v68 topAnchor];
  v70 = [v67 constraintEqualToAnchor:v69 constant:0.0];
  v98[1] = v70;
  v71 = +[NSArray arrayWithObjects:v98 count:2];
  +[NSLayoutConstraint activateConstraints:v71];

  objc_destroyWeak(&v95);
  objc_destroyWeak(&location);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)TeachableMomentContaineeViewController;
  [(TeachableMomentContaineeViewController *)&v4 viewDidAppear:a3];
  [(TeachableMomentContaineeViewController *)self _setHasShownTeachableMomentFlag];
}

+ (BOOL)hasShownTeachableMoment
{
  return 0;
}

- (void)_setHasShownTeachableMomentFlag
{
  id v4 = +[NSUserDefaults standardUserDefaults];
  v3 = [(TeachableMomentConfiguration *)self->_configuration userDefaultSaveKey];
  [v4 setBool:1 forKey:v3];
}

- (void)willChangeContainerStyle:(unint64_t)a3
{
  if (a3 == 6 || a3 == 3) {
    [(ContaineeViewController *)self handleDismissAction:0];
  }
}

- (double)heightForLayout:(unint64_t)a3
{
  double v3 = -1.0;
  if (a3 == 5)
  {
    double height = UILayoutFittingCompressedSize.height;
    v6 = [(TeachableMomentContaineeViewController *)self view];
    v7 = [(TeachableMomentContaineeViewController *)self view];
    [v7 frame];
    double v9 = v8;
    LODWORD(v8) = 1148846080;
    LODWORD(v10) = 1112014848;
    [v6 systemLayoutSizeFittingSize:v9 withHorizontalFittingPriority:height verticalFittingPriority:v8 v10];
    double v3 = v11;

    objc_super v12 = [(TeachableMomentContaineeViewController *)self view];
    [v12 safeAreaInsets];
    double v14 = v13;

    if (v14 == 0.0)
    {
      v15 = [(ContaineeViewController *)self cardPresentationController];
      [v15 bottomSafeOffset];
      double v3 = v3 + v16;
    }
  }
  return v3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_closeButton, 0);
  objc_storeStrong((id *)&self->_buttomButton, 0);
  objc_storeStrong((id *)&self->_animationContainer, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end