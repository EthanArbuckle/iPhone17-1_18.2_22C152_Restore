@interface MBPrebuddyDoneViewController
+ (id)_phoneTransferImage;
- (MBPrebuddyDoneViewController)initWithFlow:(id)a3;
- (MBViewControllerFlow)flow;
- (UIStackView)bulletedStack;
- (int64_t)mb_step;
- (void)_setUp;
- (void)didTapHighlightedText:(id)a3;
- (void)didTapPrimaryButton:(id)a3;
- (void)setBulletedStack:(id)a3;
- (void)viewDidLoad;
@end

@implementation MBPrebuddyDoneViewController

+ (id)_phoneTransferImage
{
  v3 = +[MBPrebuddyManager twoDeviceImageName];
  v4 = +[NSBundle bundleForClass:a1];
  v5 = +[UIImage imageNamed:v3 inBundle:v4];
  v6 = [v5 imageWithRenderingMode:2];

  return v6;
}

- (MBPrebuddyDoneViewController)initWithFlow:(id)a3
{
  id v4 = a3;
  v5 = MBLocalizedStringFromTable();
  v6 = MBLocalizedStringFromTable();
  v9.receiver = self;
  v9.super_class = (Class)MBPrebuddyDoneViewController;
  v7 = [(MBPrebuddyDoneViewController *)&v9 initWithTitle:v5 detailText:v6 icon:0];

  if (v7) {
    objc_storeWeak((id *)&v7->_flow, v4);
  }

  return v7;
}

- (int64_t)mb_step
{
  return 5;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)MBPrebuddyDoneViewController;
  [(MBPrebuddyDoneViewController *)&v4 viewDidLoad];
  [(MBPrebuddyDoneViewController *)self _setUp];
  v3 = [(MBPrebuddyDoneViewController *)self navigationItem];
  [v3 setHidesBackButton:1];
}

- (void)_setUp
{
  v3 = +[OBBoldTrayButton boldButton];
  objc_super v4 = MBLocalizedStringFromTable();
  [v3 setTitle:v4 forState:0];

  [v3 addTarget:self action:"didTapPrimaryButton:" forEvents:0x2000];
  v54 = v3;
  v5 = [v3 titleLabel];
  LODWORD(v6) = 1036831949;
  [v5 _setHyphenationFactor:v6];

  v7 = [(MBPrebuddyDoneViewController *)self buttonTray];
  [v7 addButton:v3];

  v8 = [MBPrebuddyBulletedIconTextView alloc];
  objc_super v9 = +[UIImage systemImageNamed:@"icloud.and.arrow.up"];
  v10 = MBLocalizedStringFromTable();
  v11 = MBLocalizedStringFromTable();
  v12 = [(MBPrebuddyBulletedIconTextView *)v8 initWithImage:v9 title:v10 detail:v11 tappableText:0];

  v13 = v12;
  v53 = v12;
  [(MBPrebuddyBulletedIconTextView *)v12 setTranslatesAutoresizingMaskIntoConstraints:0];
  v14 = [MBPrebuddyBulletedIconTextView alloc];
  v15 = [(id)objc_opt_class() _phoneTransferImage];
  v16 = MBLocalizedStringFromTable();
  v17 = MBLocalizedStringFromTable();
  v18 = [(MBPrebuddyBulletedIconTextView *)v14 initWithImage:v15 title:v16 detail:v17 tappableText:0];

  v19 = v18;
  v52 = v18;
  [(MBPrebuddyBulletedIconTextView *)v18 setTranslatesAutoresizingMaskIntoConstraints:0];
  v20 = [MBPrebuddyBulletedIconTextView alloc];
  v21 = +[UIImage systemImageNamed:@"arrow.3.trianglepath"];
  v22 = MBLocalizedStringFromTable();
  v23 = MBLocalizedStringFromTable();
  v24 = MBLocalizedStringFromTable();
  v25 = [(MBPrebuddyBulletedIconTextView *)v20 initWithImage:v21 title:v22 detail:v23 tappableText:v24];

  v26 = +[UIColor systemBlueColor];
  [(MBPrebuddyBulletedIconTextView *)v25 setTintColor:v26];

  [(MBPrebuddyBulletedIconTextView *)v25 setDelegate:self];
  v51 = v25;
  [(MBPrebuddyBulletedIconTextView *)v25 setTranslatesAutoresizingMaskIntoConstraints:0];
  id v27 = objc_alloc((Class)UIStackView);
  v56[0] = v13;
  v56[1] = v19;
  v56[2] = v25;
  v28 = +[NSArray arrayWithObjects:v56 count:3];
  v29 = (UIStackView *)[v27 initWithArrangedSubviews:v28];
  bulletedStack = self->_bulletedStack;
  self->_bulletedStack = v29;

  [(UIStackView *)self->_bulletedStack setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIStackView *)self->_bulletedStack setSpacing:25.0];
  [(UIStackView *)self->_bulletedStack setAxis:1];
  v31 = [(MBPrebuddyDoneViewController *)self contentView];
  [v31 addSubview:self->_bulletedStack];

  v49 = [(UIStackView *)self->_bulletedStack leadingAnchor];
  v50 = [(MBPrebuddyDoneViewController *)self contentView];
  v48 = [v50 leadingAnchor];
  v47 = [v49 constraintEqualToAnchor:v48];
  v55[0] = v47;
  v45 = [(UIStackView *)self->_bulletedStack topAnchor];
  v46 = [(MBPrebuddyDoneViewController *)self contentView];
  v44 = [v46 topAnchor];
  v43 = [v45 constraintEqualToAnchor:v44];
  v55[1] = v43;
  v32 = [(UIStackView *)self->_bulletedStack trailingAnchor];
  v33 = [(MBPrebuddyDoneViewController *)self contentView];
  v34 = [v33 trailingAnchor];
  v35 = [v32 constraintEqualToAnchor:v34];
  v55[2] = v35;
  v36 = [(UIStackView *)self->_bulletedStack bottomAnchor];
  v37 = [(MBPrebuddyDoneViewController *)self contentView];
  v38 = [v37 bottomAnchor];
  [(UIStackView *)self->_bulletedStack spacing];
  v40 = [v36 constraintEqualToAnchor:v38 constant:v39 * -2.0];
  v55[3] = v40;
  v41 = +[NSArray arrayWithObjects:v55 count:4];
  +[NSLayoutConstraint activateConstraints:v41];

  v42 = [(MBPrebuddyDoneViewController *)self navigationItem];
  [v42 _setBackgroundHidden:1];
}

- (void)didTapPrimaryButton:(id)a3
{
  objc_super v4 = [(MBPrebuddyDoneViewController *)self navigationController];
  v5 = [v4 view];
  [v5 setUserInteractionEnabled:0];

  id WeakRetained = objc_loadWeakRetained((id *)&self->_flow);
  objc_msgSend(WeakRetained, "mb_didTapNextFromViewController:", self);
}

- (void)didTapHighlightedText:(id)a3
{
  v3 = MBLocalizedStringFromTable();
  id v5 = +[NSURL URLWithString:v3];

  objc_super v4 = +[LSApplicationWorkspace defaultWorkspace];
  [v4 openURL:v5 withOptions:0];
}

- (MBViewControllerFlow)flow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_flow);
  return (MBViewControllerFlow *)WeakRetained;
}

- (UIStackView)bulletedStack
{
  return (UIStackView *)objc_getProperty(self, a2, 16, 1);
}

- (void)setBulletedStack:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bulletedStack, 0);
  objc_destroyWeak((id *)&self->_flow);
}

@end