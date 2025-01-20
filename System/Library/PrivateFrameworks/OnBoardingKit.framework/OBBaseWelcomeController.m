@interface OBBaseWelcomeController
+ (CGSize)_preferredContentSizeInBuddy:(BOOL)a3;
+ (CGSize)preferredContentSize;
+ (CGSize)preferredContentSizeInSetupAssistant;
- (BOOL)_isBuddyiPad;
- (BOOL)_isInFormSheet;
- (CGSize)preferredContentSize;
- (NSDirectionalEdgeInsets)directionalLayoutMargins;
- (NSDirectionalEdgeInsets)insetsForTemplateType:(unint64_t)a3;
- (double)autoScrollEdgeTransitionDistance;
- (id)navigationItem;
- (int64_t)navigationBarScrollToEdgeBehavior;
- (unint64_t)templateType;
- (void)_applyChromelessToBar:(int64_t)a3 navigationItem:(id)a4;
- (void)_presentationStyleValidationCheck;
- (void)loadView;
- (void)setTemplateType:(unint64_t)a3;
- (void)updateDirectionalLayoutMargins;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
@end

@implementation OBBaseWelcomeController

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)OBBaseWelcomeController;
  [(OBBaseWelcomeController *)&v5 loadView];
  v3 = [MEMORY[0x1E4FB1618] systemBackgroundColor];
  v4 = [(OBBaseWelcomeController *)self view];
  [v4 setBackgroundColor:v3];

  [(OBBaseWelcomeController *)self updateDirectionalLayoutMargins];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)OBBaseWelcomeController;
  [(OBBaseWelcomeController *)&v3 viewDidLayoutSubviews];
  [(OBBaseWelcomeController *)self updateDirectionalLayoutMargins];
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)OBBaseWelcomeController;
  -[OBBaseWelcomeController viewWillTransitionToSize:withTransitionCoordinator:](&v5, sel_viewWillTransitionToSize_withTransitionCoordinator_, a4, a3.width, a3.height);
  [(OBBaseWelcomeController *)self updateDirectionalLayoutMargins];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)OBBaseWelcomeController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  if ([(OBBaseWelcomeController *)self conformsToProtocol:&unk_1EEC52818]) {
    [(OBBaseWelcomeController *)self setTemplateType:2];
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  v4.receiver = self;
  v4.super_class = (Class)OBBaseWelcomeController;
  [(OBBaseWelcomeController *)&v4 viewDidAppear:a3];
  [(OBBaseWelcomeController *)self _presentationStyleValidationCheck];
}

- (void)updateDirectionalLayoutMargins
{
  [(OBBaseWelcomeController *)self directionalLayoutMargins];
  double v4 = v3;
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  id v11 = [(OBBaseWelcomeController *)self view];
  objc_msgSend(v11, "setDirectionalLayoutMargins:", v4, v6, v8, v10);
}

- (NSDirectionalEdgeInsets)directionalLayoutMargins
{
  double v3 = +[OBDevice currentDevice];
  -[OBBaseWelcomeController insetsForTemplateType:](self, "insetsForTemplateType:", [v3 templateType]);
  double v5 = v4;
  double v7 = v6;
  double v9 = v8;
  double v11 = v10;

  double v12 = v5;
  double v13 = v7;
  double v14 = v9;
  double v15 = v11;
  result.trailing = v15;
  result.bottom = v14;
  result.leading = v13;
  result.top = v12;
  return result;
}

- (NSDirectionalEdgeInsets)insetsForTemplateType:(unint64_t)a3
{
  double v5 = [MEMORY[0x1E4FB16C8] currentDevice];
  if ([v5 userInterfaceIdiom])
  {
  }
  else
  {
    double v6 = [(OBBaseWelcomeController *)self traitCollection];
    uint64_t v7 = [v6 horizontalSizeClass];

    if (v7 == 2)
    {
      double v8 = 5.0;
      goto LABEL_5;
    }
  }
  double v8 = 5.0;
  *(double *)&uint64_t v10 = 0.0;
  switch(a3)
  {
    case 1uLL:
    case 3uLL:
    case 9uLL:
      double v8 = 34.0;
      double v9 = 44.0;
      goto LABEL_19;
    case 2uLL:
    case 4uLL:
    case 8uLL:
      double v9 = 24.0;
      double v11 = 24.0;
      goto LABEL_20;
    case 5uLL:
    case 7uLL:
      double v9 = 16.0;
      double v11 = 16.0;
      goto LABEL_20;
    case 6uLL:
      double v12 = [(OBBaseWelcomeController *)self view];
      double v13 = [v12 window];

      if (v13)
      {
        double v14 = +[OBDevice currentDevice];
        double v15 = [(OBBaseWelcomeController *)self view];
        v16 = [v15 window];
        [v16 bounds];
        uint64_t v18 = [v14 templateTypeForBoundsWidth:v17];

        if (v18 != 6 && !-[OBBaseWelcomeController _isBuddyiPad](self))
        {
          [(OBBaseWelcomeController *)self insetsForTemplateType:v18];
          uint64_t v10 = v24;
          double v9 = v25;
          double v8 = v26;
          goto LABEL_20;
        }
      }
      if (!self
        || !-[UIViewController ob_isFormSheet](self, "ob_isFormSheet") && !-[OBBaseWelcomeController _isBuddyiPad](self))
      {
        v19 = [(OBBaseWelcomeController *)self view];
        [v19 bounds];
        double v9 = (v20 + -624.0) * 0.5;

        goto LABEL_19;
      }
      break;
    case 0xAuLL:
      double v9 = 68.0;
      double v8 = 0.0;
      goto LABEL_19;
    default:
      double v9 = 0.0;
      double v11 = 0.0;
      goto LABEL_20;
  }
LABEL_5:
  double v9 = 88.0;
  *(double *)&uint64_t v10 = 56.0;
LABEL_19:
  double v11 = v9;
LABEL_20:
  double v21 = *(double *)&v10;
  double v22 = v9;
  double v23 = v8;
  result.trailing = v11;
  result.bottom = v23;
  result.leading = v22;
  result.top = v21;
  return result;
}

- (BOOL)_isBuddyiPad
{
  if (!a1 || ![a1 conformsToProtocol:&unk_1EEC52818]) {
    return 0;
  }
  v1 = [MEMORY[0x1E4FB16C8] currentDevice];
  BOOL v2 = [v1 userInterfaceIdiom] == 1;

  return v2;
}

- (BOOL)_isInFormSheet
{
  if (result)
  {
    v1 = (void *)result;
    if (objc_msgSend((id)result, "ob_isFormSheet"))
    {
      return 1;
    }
    else
    {
      return -[OBBaseWelcomeController _isBuddyiPad](v1);
    }
  }
  return result;
}

+ (CGSize)preferredContentSize
{
  [a1 _preferredContentSizeInBuddy:0];
  result.height = v3;
  result.width = v2;
  return result;
}

+ (CGSize)preferredContentSizeInSetupAssistant
{
  [a1 _preferredContentSizeInBuddy:1];
  result.height = v3;
  result.width = v2;
  return result;
}

- (int64_t)navigationBarScrollToEdgeBehavior
{
  return 1;
}

- (double)autoScrollEdgeTransitionDistance
{
  return 16.0;
}

- (id)navigationItem
{
  if (![(OBBaseWelcomeController *)self isViewLoaded])
  {
    int64_t v3 = [(OBBaseWelcomeController *)self navigationBarScrollToEdgeBehavior];
    v8.receiver = self;
    v8.super_class = (Class)OBBaseWelcomeController;
    double v4 = [(OBBaseWelcomeController *)&v8 navigationItem];
    [(OBBaseWelcomeController *)self _applyChromelessToBar:v3 navigationItem:v4];
  }
  v7.receiver = self;
  v7.super_class = (Class)OBBaseWelcomeController;
  double v5 = [(OBBaseWelcomeController *)&v7 navigationItem];
  return v5;
}

- (void)_applyChromelessToBar:(int64_t)a3 navigationItem:(id)a4
{
  id v12 = a4;
  if (([v12 _isManualScrollEdgeAppearanceEnabled] & 1) == 0)
  {
    if (a3 == 2)
    {
      [v12 _setManualScrollEdgeAppearanceEnabled:1];
      objc_super v7 = +[OBDevice currentDevice];
      BOOL v8 = [v7 type] == 2;

      double v9 = (void *)[objc_alloc(MEMORY[0x1E4FB14A0]) initWithIdiom:v8];
      [v9 configureWithTransparentBackground];
      uint64_t v10 = [MEMORY[0x1E4FB1618] clearColor];
      [v9 setBackgroundColor:v10];

      double v11 = (void *)[objc_alloc(MEMORY[0x1E4FB19D8]) initWithBarAppearance:v9];
      [v12 setStandardAppearance:v11];

      [v12 _setBackgroundHidden:1];
    }
    else if (a3 == 1)
    {
      [(OBBaseWelcomeController *)self autoScrollEdgeTransitionDistance];
      *(float *)&double v6 = v6;
      objc_msgSend(v12, "ob_applyAutomaticScrollToEdgeBehaviorWithDistance:", fmaxf(*(float *)&v6, 16.0));
    }
  }
}

- (void)_presentationStyleValidationCheck
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_fault_impl(&dword_19BF0F000, a2, OS_LOG_TYPE_FAULT, "The modal presentation style %@ is not supported; you must use UIModalPresentationFullScreen or UIModalPresentationFormSheet",
    (uint8_t *)&v2,
    0xCu);
}

+ (CGSize)_preferredContentSizeInBuddy:(BOOL)a3
{
  uint64_t v3 = +[OBDevice currentDevice];
  uint64_t v4 = [v3 type];

  if (v4 == 2)
  {
    double v5 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v5 bounds];
    double v7 = v6;

    BOOL v8 = [MEMORY[0x1E4FB1BA8] mainScreen];
    [v8 bounds];
    double v10 = v9;

    if (v7 >= v10) {
      double v11 = v10;
    }
    else {
      double v11 = v7;
    }
    double v12 = fmin(v11 + -88.0, 820.0);
    double v13 = 624.0;
  }
  else
  {
    double v13 = *MEMORY[0x1E4F1DB30];
    double v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  result.height = v12;
  result.width = v13;
  return result;
}

- (CGSize)preferredContentSize
{
  objc_msgSend((id)objc_opt_class(), "_preferredContentSizeInBuddy:", -[OBBaseWelcomeController templateType](self, "templateType") == 2);
  double v4 = v3;
  double v6 = v5;
  double v7 = [(OBBaseWelcomeController *)self navigationController];

  if (v7)
  {
    BOOL v8 = [(OBBaseWelcomeController *)self navigationController];
    double v9 = [v8 navigationBar];
    [v9 frame];
    double v6 = v6 - CGRectGetHeight(v13);
  }
  double v10 = v4;
  double v11 = v6;
  result.height = v11;
  result.width = v10;
  return result;
}

- (unint64_t)templateType
{
  return self->_templateType;
}

- (void)setTemplateType:(unint64_t)a3
{
  self->_templateType = a3;
}

@end