@interface ACMSignInDialogSimple_Modern
- (BOOL)canSignIn;
- (BOOL)prefersStatusBarHidden;
- (BOOL)shouldAuthenticateOnUserInput;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)shouldManuallyChangeStatusBarStyle;
- (BOOL)standardViewController;
- (BOOL)userNameFieldEditable;
- (Class)widgetClass;
- (NSArray)burButtonItems;
- (NSString)accountNameFieldPlaceholder;
- (UIImage)iForgotImage;
- (UIImage)logo;
- (UIImageView)logoView;
- (UIToolbar)toolbar;
- (UIView)container;
- (double)widgetConstraintConstant;
- (double)widgetConstraintMultiplier;
- (id)accountNameField;
- (id)createCancelItem;
- (id)createIForgotItem;
- (id)darkDisabledTextColor;
- (id)darkTextColor;
- (id)passwordField;
- (id)tintColor;
- (id)widget;
- (int64_t)preferredStatusBarStyle;
- (unint64_t)supportedInterfaceOrientations;
- (void)buildConstraints;
- (void)buildHorizontalConstraints;
- (void)buildVerticalConstraints;
- (void)buildWidgetContentGroupHorizontalConstraints;
- (void)buildWidgetContentGroupVerticalConstraints;
- (void)checkFields;
- (void)dealloc;
- (void)disableControls:(BOOL)a3;
- (void)loadView;
- (void)setAccountNameFieldPlaceholder:(id)a3;
- (void)setBurButtonItems:(id)a3;
- (void)setContainer:(id)a3;
- (void)setLogo:(id)a3;
- (void)setLogoView:(id)a3;
- (void)setToolbar:(id)a3;
- (void)toolbar;
- (void)viewDidAppear:(BOOL)a3;
@end

@implementation ACMSignInDialogSimple_Modern

- (void)dealloc
{
  [(ACMSignInDialog *)self setDelegate:0];
  [(ACMSignInDialogSimple_Modern *)self setToolbar:0];
  [(ACMSignInDialogSimple_Modern *)self setBurButtonItems:0];
  [(ACMSignInDialogSimple_Modern *)self setLogo:0];
  [(ACMSignInDialogSimple_Modern *)self setLogoView:0];
  [(ACMSignInDialogSimple_Modern *)self setAccountNameFieldPlaceholder:0];
  v3.receiver = self;
  v3.super_class = (Class)ACMSignInDialogSimple_Modern;
  [(ACMSignInDialogCustom *)&v3 dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return ([(ACMSignInDialogSimple_Modern *)self supportedInterfaceOrientations] >> a3) & 1;
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (id)createIForgotItem
{
  v2 = [objc_alloc(MEMORY[0x263F1C468]) initWithImage: -[ACMSignInDialogSimple_Modern iForgotImage](self, "iForgotImage") style:0 target:self action:sel_onIForgot_];

  return v2;
}

- (id)createCancelItem
{
  v2 = (void *)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:14 target:0 action:0];

  return v2;
}

- (NSArray)burButtonItems
{
  v4[3] = *MEMORY[0x263EF8340];
  result = self->_burButtonItems;
  if (!result)
  {
    if ([(ACMSignInDialog *)self delegate])
    {
      [(ACMSignInDialogCustom *)self setCancelBarButton:[(ACMSignInDialogSimple_Modern *)self createCancelItem]];
      v4[0] = [(ACMSignInDialogCustom *)self cancelBarButton];
      v4[1] = (id)[objc_alloc(MEMORY[0x263F1C468]) initWithBarButtonSystemItem:5 target:0 action:0];
      v4[2] = [(ACMSignInDialogSimple_Modern *)self createIForgotItem];
      result = (NSArray *)(id)[MEMORY[0x263EFF8C0] arrayWithObjects:v4 count:3];
      self->_burButtonItems = result;
    }
    else
    {
      return self->_burButtonItems;
    }
  }
  return result;
}

- (BOOL)shouldManuallyChangeStatusBarStyle
{
  return 0;
}

- (BOOL)userNameFieldEditable
{
  return 1;
}

- (BOOL)shouldAuthenticateOnUserInput
{
  return 1;
}

- (id)tintColor
{
  return 0;
}

- (UIToolbar)toolbar
{
  if (![(ACMSignInDialog *)self delegate]) {
    -[ACMSignInDialogSimple_Modern toolbar]();
  }
  result = self->_toolbar;
  if (!result)
  {
    [[(id)objc_msgSend(MEMORY[0x263F1C408], "sharedApplication") statusBarFrame];
    double v5 = v4;
    double v7 = v6;
    [[MEMORY[0x263F1C920] mainScreen] bounds];
    double v9 = v8;
    *(float *)&double v8 = v7;
    float v10 = v5;
    v12 = -[ACMEToolbar initWithFrame:]([ACMEToolbar alloc], "initWithFrame:", v9, fminf(*(float *)&v8, v10), v11, 60.0);
    self->_toolbar = &v12->super;
    [(ACMEToolbar *)v12 setItems:[(ACMSignInDialogSimple_Modern *)self burButtonItems] animated:0];
    [(UIToolbar *)self->_toolbar setBarStyle:0];
    -[UIToolbar setBarTintColor:](self->_toolbar, "setBarTintColor:", [MEMORY[0x263F1C550] clearColor]);
    [(UIToolbar *)self->_toolbar setTintColor:[(ACMSignInDialogSimple_Modern *)self tintColor]];
    [(UIToolbar *)self->_toolbar setTranslucent:1];
    [(UIToolbar *)self->_toolbar setOpaque:0];
    [(-[ACMSignInDialogSimple_Modern toolbarItems](self, "toolbarItems")) makeObjectsPerformSelector:sel_setTintColor_ withObject:-[ACMSignInDialogSimple_Modern tintColor](self, "tintColor")];
    return self->_toolbar;
  }
  return result;
}

- (BOOL)prefersStatusBarHidden
{
  return 0;
}

- (int64_t)preferredStatusBarStyle
{
  v2 = (void *)[MEMORY[0x263F1C408] sharedApplication];

  return [v2 statusBarStyle];
}

- (id)darkTextColor
{
  return (id)[MEMORY[0x263F1C550] colorWithRed:0.5 green:0.5 blue:0.5 alpha:1.0];
}

- (id)darkDisabledTextColor
{
  return (id)[MEMORY[0x263F1C550] colorWithRed:0.5 green:0.5 blue:0.5 alpha:0.75];
}

- (void)loadView
{
  __assert_rtn("-[ACMSignInDialogSimple_Modern loadView]", "ACMSignInDialogSimple_Modern.m", 144, "nil != self.delegate");
}

- (double)widgetConstraintMultiplier
{
  return 1.0;
}

- (double)widgetConstraintConstant
{
  return -99.0;
}

- (void)buildWidgetContentGroupHorizontalConstraints
{
  uint64_t v3 = [MEMORY[0x263F08938] constraintWithItem:[-[ACMSignInDialogSimple_Modern widget](self, "widget") view] attribute:7 relatedBy:0 toItem:[-[ACMSignInDialogSimple_Modern view](self, "view") view] attribute:7 multiplier:1.0 constant:0.0];
  double v4 = (void *)[(ACMSignInDialogSimple_Modern *)self view];

  [v4 addConstraint:v3];
}

- (void)buildWidgetContentGroupVerticalConstraints
{
  uint64_t v26 = *MEMORY[0x263EF8340];
  uint64_t v3 = _NSDictionaryOfVariableBindings(&cfstr_LogoWidgetButt.isa, [-ACMSignInDialogSimple_Modern logoView](self, "logoView"), [-ACMSignInDialogSimple_Modern widget](self, "widget"), [ACMSignInDialogCustom signInButton](self, "signInButton"), 0);
  double v4 = (void *)MEMORY[0x263F08938];
  double v5 = NSString;
  [(UIImageView *)[(ACMSignInDialogSimple_Modern *)self logoView] frame];
  uint64_t v7 = (int)v6;
  [[-[ACMSignInDialogSimple_Modern widget](self, "widget") view] frame];
  uint64_t v9 = (int)v8;
  [(UIButton *)[(ACMSignInDialogCustom *)self signInButton] frame];
  double v11 = (void *)[[v4 constraintsWithVisualFormat:[v5 stringWithFormat:@"V:[logo(==%d)]-22-[widget(==%d)]-22-[button(==%d)]", v7, v9, (int)v10] options:0 metrics:v3 views:views];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v22;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v11);
        }
        LODWORD(v13) = 1148846080;
        [*(id *)(*((void *)&v21 + 1) + 8 * v16++) setPriority:v13];
      }
      while (v14 != v16);
      uint64_t v14 = [v11 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v14);
  }
  [(-[ACMSignInDialogSimple_Modern view](self, "view")) addConstraints:v11];
  [(-[ACMSignInDialogSimple_Modern view](self, "view")) addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACMSignInDialogSimple_Modern container](self, "container"), 8, 1, 0, 8, 1.0, 0.0)];
  v17 = [MEMORY[0x263F08938] constraintWithItem:-[ACMSignInDialogSimple_Modern container](self, "container") attribute:3 relatedBy:0 toItem:-[ACMSignInDialogSimple_Modern logoView](self, "logoView") attribute:3 multiplier:1.0 constant:0.0];
  [(-[ACMSignInDialogSimple_Modern view](self, "view")) addConstraint:v17];
  LODWORD(v18) = 1148846080;
  [v17 setPriority:v18];
  v19 = [MEMORY[0x263F08938] constraintWithItem:-[ACMSignInDialogSimple_Modern container](self, "container") attribute:4 relatedBy:0 toItem:-[ACMSignInDialogCustom signInButton](self, "signInButton") attribute:4 multiplier:1.0 constant:0.0];
  [(-[ACMSignInDialogSimple_Modern view](self, "view")) addConstraint:v19];
  LODWORD(v20) = 1148846080;
  [v19 setPriority:v20];
}

- (void)buildHorizontalConstraints
{
  [(ACMSignInDialogSimple_Modern *)self buildWidgetContentGroupHorizontalConstraints];
  [[-[ACMSignInDialogSimple_Modern view](self, "view") addConstraint:objc_msgSend(MEMORY[0x263F08938], "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", -[ACMSignInDialogSimple_Modern toolbar](self, "toolbar"), 9, 0, -[ACMSignInDialogSimple_Modern view](self, "view"), 9, 1.0, 0.0)];
  [(-[ACMSignInDialogSimple_Modern view](self, "view")) addConstraint:[MEMORY[0x263F08938] constraintWithItem:-[ACMSignInDialogSimple_Modern toolbar](self, "toolbar") attribute:7 relatedBy:0 toItem:-[ACMSignInDialogSimple_Modern view](self, "view") attribute:7 multiplier:1.0 constant:0.0]];
  [(-[ACMSignInDialogSimple_Modern view](self, "view")) addConstraint:[MEMORY[0x263F08938] constraintWithItem:-[ACMSignInDialogSimple_Modern logoView](self, "logoView") attribute:9 relatedBy:0 toItem:-[ACMSignInDialogSimple_Modern view](self, "view") attribute:9 multiplier:1.0 constant:0.0]];
  uint64_t v3 = [MEMORY[0x263F08938] constraintWithItem:-[ACMSignInDialogCustom signInButton](self, "signInButton") attribute:9 relatedBy:0 toItem:-[ACMSignInDialogSimple_Modern view](self, "view") attribute:9 multiplier:1.0 constant:0.0];
  double v4 = (void *)[(ACMSignInDialogSimple_Modern *)self view];

  [v4 addConstraint:v3];
}

- (void)buildVerticalConstraints
{
  [(ACMSignInDialogSimple_Modern *)self buildWidgetContentGroupVerticalConstraints];
  uint64_t v3 = (void *)MEMORY[0x263F08938];
  double v4 = [(ACMSignInDialogSimple_Modern *)self container];
  uint64_t v5 = [(ACMSignInDialogSimple_Modern *)self view];
  [(ACMSignInDialogSimple_Modern *)self widgetConstraintMultiplier];
  double v7 = v6;
  [(ACMSignInDialogSimple_Modern *)self widgetConstraintConstant];
  [((id)-[ACMSignInDialogSimple_Modern view](self, "view")) addConstraint:[v3 constraintWithItem:v4 attribute:10 relatedBy:0 toItem:v5 attribute:10 multiplier:v7 constant:v8]];
  uint64_t v9 = (void *)MEMORY[0x263F08938];
  double v10 = [(ACMSignInDialogSimple_Modern *)self toolbar];
  uint64_t v11 = [(ACMSignInDialogSimple_Modern *)self view];
  [(UIToolbar *)[(ACMSignInDialogSimple_Modern *)self toolbar] frame];
  uint64_t v12 = [v9 constraintWithItem:v10 attribute:3 relatedBy:0 toItem:v11 attribute:3 multiplier:1.0 constant:x0];
  double v13 = (void *)[(ACMSignInDialogSimple_Modern *)self view];

  [v13 addConstraint:v12];
}

- (void)buildConstraints
{
  [(UIToolbar *)[(ACMSignInDialogSimple_Modern *)self toolbar] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIImageView *)[(ACMSignInDialogSimple_Modern *)self logoView] setTranslatesAutoresizingMaskIntoConstraints:0];
  [((id)objc_msgSend(-[ACMSignInDialogSimple_Modern widget](self, "widget"), "view")) setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIButton *)[(ACMSignInDialogCustom *)self signInButton] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(UIView *)[(ACMSignInDialogSimple_Modern *)self container] setTranslatesAutoresizingMaskIntoConstraints:0];
  [(ACMSignInDialogSimple_Modern *)self buildHorizontalConstraints];

  [(ACMSignInDialogSimple_Modern *)self buildVerticalConstraints];
}

- (id)accountNameField
{
  id v2 = [(ACMSignInDialogSimple_Modern *)self widget];

  return (id)[v2 accountField];
}

- (id)passwordField
{
  id v2 = [(ACMSignInDialogSimple_Modern *)self widget];

  return (id)[v2 passwordField];
}

- (BOOL)canSignIn
{
  uint64_t v3 = [[-[ACMSignInDialogSimple_Modern widget](self, "widget") passwordField] text].length;
  if (v3) {
    LOBYTE(v3) = [[-[ACMSignInDialogSimple_Modern widget](self, "widget") text] length] != 0;
  }
  return v3;
}

- (void)checkFields
{
  BOOL v3 = [(ACMSignInDialogSimple_Modern *)self canSignIn];
  double v4 = [(ACMSignInDialogCustom *)self signInButton];

  [(UIButton *)v4 setEnabled:v3];
}

- (void)viewDidAppear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ACMSignInDialogSimple_Modern;
  [(ACMSignInDialog *)&v5 viewDidAppear:a3];
  if (objc_msgSend((id)objc_msgSend(-[ACMSignInDialogSimple_Modern accountNameField](self, "accountNameField"), "text"), "length"))
  {
    id v4 = [(ACMSignInDialogSimple_Modern *)self passwordField];
  }
  else
  {
    id v4 = [(ACMSignInDialogSimple_Modern *)self accountNameField];
  }
  [v4 becomeFirstResponder];
  [(ACMSignInDialogSimple_Modern *)self checkFields];
}

- (UIImage)iForgotImage
{
  id v2 = (void *)ACMImageWithName(@"forgotButton.png");

  return (UIImage *)[v2 imageWithRenderingMode:2];
}

- (id)widget
{
  widget = self->super._widget;
  if (!widget)
  {
    v4.receiver = self;
    v4.super_class = (Class)ACMSignInDialogSimple_Modern;
    widget = [(ACMSignInDialogCustom *)&v4 widget];
    -[ACMSignInWidgetProtocol setPosition:](widget, "setPosition:", 0.0, 152.0);
    [(ACMSignInWidgetProtocol *)widget setShouldAuthenticateOnUserInput:1];
    [(ACMSignInWidgetProtocol *)widget setHideTopSeparator:1];
  }
  return widget;
}

- (Class)widgetClass
{
  return (Class)objc_opt_class();
}

- (BOOL)standardViewController
{
  return 1;
}

- (void)disableControls:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v16 = *MEMORY[0x263EF8340];
  -[ACMSignInDialog controlsWillChangeState:](self, "controlsWillChangeState:");
  v14.receiver = self;
  v14.super_class = (Class)ACMSignInDialogSimple_Modern;
  [(ACMSignInDialogCustom *)&v14 disableControls:v3];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  objc_super v5 = [(ACMSignInDialogSimple_Modern *)self burButtonItems];
  uint64_t v6 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * v9++) setEnabled:v3 ^ 1];
      }
      while (v7 != v9);
      uint64_t v7 = [(NSArray *)v5 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v7);
  }
  [(ACMSignInDialog *)self controlsDidChangeState:v3];
}

- (UIImage)logo
{
  return self->_logo;
}

- (void)setLogo:(id)a3
{
}

- (UIImageView)logoView
{
  return self->_logoView;
}

- (void)setLogoView:(id)a3
{
}

- (NSString)accountNameFieldPlaceholder
{
  return self->_accountNameFieldPlaceholder;
}

- (void)setAccountNameFieldPlaceholder:(id)a3
{
}

- (UIView)container
{
  return self->_container;
}

- (void)setContainer:(id)a3
{
}

- (void)setToolbar:(id)a3
{
}

- (void)setBurButtonItems:(id)a3
{
}

- (void)toolbar
{
  __assert_rtn("-[ACMSignInDialogSimple_Modern toolbar]", "ACMSignInDialogSimple_Modern.m", 102, "nil != self.delegate");
}

@end