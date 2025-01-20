@interface PRXDisclaimerContentViewController
+ (Class)contentViewClass;
- (NSString)disclaimer;
- (PRXAction)moreInfoAction;
- (void)_updateDisclaimerLabel;
- (void)_updateMoreInfoButton;
- (void)setDisclaimer:(id)a3;
- (void)setMoreInfoAction:(id)a3;
- (void)viewDidLoad;
@end

@implementation PRXDisclaimerContentViewController

+ (Class)contentViewClass
{
  return (Class)objc_opt_class();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)PRXDisclaimerContentViewController;
  [(PRXCardContentViewController *)&v3 viewDidLoad];
  [(PRXDisclaimerContentViewController *)self _updateDisclaimerLabel];
  [(PRXDisclaimerContentViewController *)self _updateMoreInfoButton];
}

- (void)setDisclaimer:(id)a3
{
  id v4 = a3;
  uint64_t disclaimer = (uint64_t)self->_disclaimer;
  if ((id)disclaimer != v4)
  {
    v8 = v4;
    uint64_t disclaimer = [(id)disclaimer isEqualToString:v4];
    id v4 = v8;
    if ((disclaimer & 1) == 0)
    {
      v6 = (NSString *)[v8 copy];
      v7 = self->_disclaimer;
      self->_uint64_t disclaimer = v6;

      uint64_t disclaimer = [(PRXDisclaimerContentViewController *)self _updateDisclaimerLabel];
      id v4 = v8;
    }
  }
  MEMORY[0x270F9A758](disclaimer, v4);
}

- (void)_updateDisclaimerLabel
{
  uint64_t disclaimer = self->_disclaimer;
  id v4 = [(PRXCardContentViewController *)self contentView];
  objc_super v3 = [v4 disclaimerLabel];
  [v3 setText:disclaimer];
}

- (void)setMoreInfoAction:(id)a3
{
  v5 = (PRXAction *)a3;
  p_moreInfoAction = &self->_moreInfoAction;
  if (self->_moreInfoAction != v5)
  {
    v7 = v5;
    objc_storeStrong((id *)p_moreInfoAction, a3);
    p_moreInfoAction = (PRXAction **)[(PRXDisclaimerContentViewController *)self _updateMoreInfoButton];
    v5 = v7;
  }
  MEMORY[0x270F9A758](p_moreInfoAction, v5);
}

- (void)_updateMoreInfoButton
{
  if (self->_moreInfoAction)
  {
    id v5 = +[PRXButton buttonWithProximityType:3];
    objc_super v3 = [(PRXAction *)self->_moreInfoAction title];
    [v5 setTitle:v3 forState:0];

    [v5 addTarget:self->_moreInfoAction action:sel__callHandler forControlEvents:0x2000];
    id v4 = [(PRXCardContentViewController *)self contentView];
    [v4 setMoreInfoButton:v5];
  }
  else
  {
    id v5 = [(PRXCardContentViewController *)self contentView];
    [v5 setMoreInfoButton:0];
  }
}

- (NSString)disclaimer
{
  return self->_disclaimer;
}

- (PRXAction)moreInfoAction
{
  return self->_moreInfoAction;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_moreInfoAction, 0);
  objc_storeStrong((id *)&self->_disclaimer, 0);
}

@end