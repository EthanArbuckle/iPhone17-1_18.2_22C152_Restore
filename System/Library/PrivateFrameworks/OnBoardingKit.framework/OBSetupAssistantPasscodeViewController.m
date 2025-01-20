@interface OBSetupAssistantPasscodeViewController
- (BOOL)shouldAnimateEntireView;
- (void)animateDetailText:(id)a3 animationType:(unint64_t)a4 heightDifference:(id)a5;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation OBSetupAssistantPasscodeViewController

- (void)loadView
{
  [(OBWelcomeController *)self setIncludePaddingAboveContentView:0];
  v3.receiver = self;
  v3.super_class = (Class)OBSetupAssistantPasscodeViewController;
  [(OBWelcomeController *)&v3 loadView];
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)OBSetupAssistantPasscodeViewController;
  [(OBBaseWelcomeController *)&v3 viewDidLoad];
  [(OBWelcomeController *)self setShouldAdjustScrollViewInsetForKeyboard:1];
  [(OBWelcomeController *)self setShouldAdjustButtonTrayForKeyboard:1];
}

- (void)animateDetailText:(id)a3 animationType:(unint64_t)a4 heightDifference:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  v8 = (void (**)(void, double))a5;
  id v9 = a3;
  v10 = [(OBWelcomeController *)self headerView];
  [v10 setDetailText:v9];

  v11 = [(OBWelcomeController *)self headerView];
  v12 = [v11 detailLabel];
  [v12 frame];
  double v14 = v13;

  v15 = [(OBWelcomeController *)self headerView];
  v16 = [v15 detailLabel];
  v17 = [(OBWelcomeController *)self headerView];
  [v17 bounds];
  double v19 = v18;
  LODWORD(v18) = 1112014848;
  LODWORD(v20) = 1132068864;
  objc_msgSend(v16, "systemLayoutSizeFittingSize:withHorizontalFittingPriority:verticalFittingPriority:", v19, 0.0, v18, v20);
  double v22 = v21;

  if (v8 && ![(OBSetupAssistantPasscodeViewController *)self shouldAnimateEntireView]) {
    v8[2](v8, v14 - v22);
  }
  v23 = @"fade";
  if (!a4) {
    v23 = @"fromLeft";
  }
  if (a4 == 1) {
    v24 = @"fromRight";
  }
  else {
    v24 = v23;
  }
  v25 = [(OBWelcomeController *)self headerView];
  uint64_t v26 = [v25 detailLabel];
  if (v26)
  {
    v27 = (void *)v26;
    v28 = [(OBWelcomeController *)self contentView];

    if (v28)
    {
      v29 = [(OBWelcomeController *)self headerView];
      v30 = [v29 detailLabel];
      v31 = [(OBWelcomeController *)self contentView];
      v35[1] = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];

      [(OBWelcomeController *)self _animatePushTransitionForViews:v32 transitionSubtype:v24];
      goto LABEL_15;
    }
  }
  else
  {
  }
  v32 = _OBLoggingFacility();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
  {
    v33 = [(OBWelcomeController *)self headerView];
    v34 = [(OBWelcomeController *)self contentView];
    *(_DWORD *)buf = 138412546;
    v37 = v33;
    __int16 v38 = 2112;
    v39 = v34;
    _os_log_impl(&dword_19BF0F000, v32, OS_LOG_TYPE_DEFAULT, "Animating DetailText failed as prerequisite headerView and contentView was not fulfilled headerView:%@, contentView:%@", buf, 0x16u);
  }
LABEL_15:
}

- (BOOL)shouldAnimateEntireView
{
  objc_super v3 = [(OBWelcomeController *)self contentView];
  [v3 frame];
  double MaxY = CGRectGetMaxY(v11);

  double v5 = MaxY + 22.0;
  v6 = [(OBSetupAssistantPasscodeViewController *)self view];
  [v6 frame];
  double v7 = CGRectGetMaxY(v12);
  [(OBWelcomeController *)self keyboardFrame];
  double v9 = v7 - v8;

  return v5 > v9;
}

@end