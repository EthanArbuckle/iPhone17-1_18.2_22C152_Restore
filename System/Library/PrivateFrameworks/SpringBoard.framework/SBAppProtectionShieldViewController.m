@interface SBAppProtectionShieldViewController
- (BOOL)_canShowWhileLocked;
- (SBAppProtectionShieldViewController)initWithAssistant:(id)a3 systemAppOutlet:(id)a4;
- (void)viewDidLoad;
- (void)viewWillLayoutSubviews;
@end

@implementation SBAppProtectionShieldViewController

- (SBAppProtectionShieldViewController)initWithAssistant:(id)a3 systemAppOutlet:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SBAppProtectionShieldViewController;
  v8 = [(SBAppProtectionShieldViewController *)&v12 initWithNibName:0 bundle:0];
  if (v8)
  {
    v9 = [[SBAppProtectionShieldView alloc] initWithAssistant:v6 systemAppOutlet:v7];
    shieldView = v8->_shieldView;
    v8->_shieldView = v9;
  }
  return v8;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)SBAppProtectionShieldViewController;
  [(SBAppProtectionShieldViewController *)&v4 viewDidLoad];
  v3 = [(SBAppProtectionShieldViewController *)self view];
  [v3 addSubview:self->_shieldView];
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)SBAppProtectionShieldViewController;
  [(SBAppProtectionShieldViewController *)&v5 viewWillLayoutSubviews];
  shieldView = self->_shieldView;
  objc_super v4 = [(SBAppProtectionShieldViewController *)self view];
  [v4 bounds];
  -[SBAppProtectionShieldView setFrame:](shieldView, "setFrame:");
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void).cxx_destruct
{
}

@end