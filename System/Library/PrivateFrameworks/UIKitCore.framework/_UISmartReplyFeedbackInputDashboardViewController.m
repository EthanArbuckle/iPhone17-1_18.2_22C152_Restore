@interface _UISmartReplyFeedbackInputDashboardViewController
- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4;
- (UIView)backdropView;
- (_UISmartReplyFeedbackInputDashboardView)inputDashboardView;
- (_UISmartReplyFeedbackInputDashboardViewController)init;
- (double)preferredHeightForTraitCollection:(id)a3;
- (void)setAssistantBarStyle:(int64_t)a3;
- (void)setBackdropView:(id)a3;
- (void)setInputDashboardView:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation _UISmartReplyFeedbackInputDashboardViewController

- (_UISmartReplyFeedbackInputDashboardViewController)init
{
  v10.receiver = self;
  v10.super_class = (Class)_UISmartReplyFeedbackInputDashboardViewController;
  v2 = [(UIViewController *)&v10 init];
  if (v2)
  {
    BOOL v3 = +[_UISmartReplyFeedbackManager showReportConcernUI];
    v4 = off_1E52D5FE8;
    if (!v3) {
      v4 = off_1E52D5FF0;
    }
    id v5 = objc_alloc_init(*v4);
    [(_UISmartReplyFeedbackInputDashboardViewController *)v2 setInputDashboardView:v5];

    v6 = +[_UISmartReplyFeedbackInputDashboardView makeBackgroundView];
    [(_UISmartReplyFeedbackInputDashboardViewController *)v2 setBackdropView:v6];

    v7 = +[UIColor tertiarySystemFillColor];
    v8 = [(_UISmartReplyFeedbackInputDashboardViewController *)v2 backdropView];
    [v8 setBackgroundColor:v7];
  }
  return v2;
}

- (void)setAssistantBarStyle:(int64_t)a3
{
  id v5 = +[UIKeyboardSceneDelegate activeKeyboardSceneDelegate];
  id v9 = [v5 systemInputAssistantViewController];

  v6 = [v9 styleFromAssistantBarStyle:a3];
  uint64_t v7 = [v6 drawsPredictionBackdropView] ^ 1;
  v8 = [(_UISmartReplyFeedbackInputDashboardViewController *)self backdropView];
  [v8 setHidden:v7];
}

- (void)viewDidLoad
{
  v55[8] = *MEMORY[0x1E4F143B8];
  v54.receiver = self;
  v54.super_class = (Class)_UISmartReplyFeedbackInputDashboardViewController;
  [(UIViewController *)&v54 viewDidLoad];
  BOOL v3 = [(UIViewController *)self view];
  v4 = [(_UISmartReplyFeedbackInputDashboardViewController *)self backdropView];
  [v3 addSubview:v4];

  id v5 = [(UIViewController *)self view];
  v6 = [(_UISmartReplyFeedbackInputDashboardViewController *)self inputDashboardView];
  [v5 addSubview:v6];

  uint64_t v7 = [(_UISmartReplyFeedbackInputDashboardViewController *)self backdropView];
  [v7 setTranslatesAutoresizingMaskIntoConstraints:0];

  v8 = [(_UISmartReplyFeedbackInputDashboardViewController *)self inputDashboardView];
  [v8 setTranslatesAutoresizingMaskIntoConstraints:0];

  id v9 = +[UIDevice currentDevice];
  uint64_t v10 = [v9 userInterfaceIdiom];

  if ((v10 & 0xFFFFFFFFFFFFFFFBLL) == 1) {
    double v11 = 0.0;
  }
  else {
    double v11 = 3.0;
  }
  v37 = (void *)MEMORY[0x1E4F5B268];
  v53 = [(_UISmartReplyFeedbackInputDashboardViewController *)self backdropView];
  v51 = [v53 centerYAnchor];
  v52 = [(UIViewController *)self view];
  v50 = [v52 centerYAnchor];
  v49 = [v51 constraintEqualToAnchor:v50];
  v55[0] = v49;
  v48 = [(_UISmartReplyFeedbackInputDashboardViewController *)self backdropView];
  v46 = [v48 centerXAnchor];
  v47 = [(UIViewController *)self view];
  v45 = [v47 centerXAnchor];
  v44 = [v46 constraintEqualToAnchor:v45];
  v55[1] = v44;
  v43 = [(_UISmartReplyFeedbackInputDashboardViewController *)self backdropView];
  v41 = [v43 widthAnchor];
  v42 = [(UIViewController *)self view];
  v40 = [v42 widthAnchor];
  v39 = [v41 constraintEqualToAnchor:v40];
  v55[2] = v39;
  v38 = [(_UISmartReplyFeedbackInputDashboardViewController *)self backdropView];
  v35 = [v38 heightAnchor];
  v36 = [(UIViewController *)self view];
  v34 = [v36 heightAnchor];
  v33 = [v35 constraintEqualToAnchor:v34];
  v55[3] = v33;
  v32 = [(_UISmartReplyFeedbackInputDashboardViewController *)self inputDashboardView];
  v30 = [v32 centerYAnchor];
  v31 = [(UIViewController *)self view];
  v29 = [v31 centerYAnchor];
  v28 = [v30 constraintEqualToAnchor:v29 constant:v11];
  v55[4] = v28;
  v27 = [(_UISmartReplyFeedbackInputDashboardViewController *)self inputDashboardView];
  v25 = [v27 centerXAnchor];
  v26 = [(UIViewController *)self view];
  v24 = [v26 centerXAnchor];
  v23 = [v25 constraintEqualToAnchor:v24];
  v55[5] = v23;
  v22 = [(_UISmartReplyFeedbackInputDashboardViewController *)self inputDashboardView];
  v12 = [v22 widthAnchor];
  v13 = [(UIViewController *)self view];
  v14 = [v13 widthAnchor];
  v15 = [v12 constraintEqualToAnchor:v14];
  v55[6] = v15;
  v16 = [(_UISmartReplyFeedbackInputDashboardViewController *)self inputDashboardView];
  v17 = [v16 heightAnchor];
  v18 = [(UIViewController *)self view];
  v19 = [v18 heightAnchor];
  v20 = [v17 constraintEqualToAnchor:v19];
  v55[7] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v55 count:8];
  [v37 activateConstraints:v21];
}

- (void)viewDidAppear:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UISmartReplyFeedbackInputDashboardViewController;
  [(UIViewController *)&v6 viewDidAppear:a3];
  BOOL v3 = +[UIKeyboardImpl activeInstance];
  [v3 reportSmartReplyFeedbackUIWasPresented];

  v4 = UIFeedbackServiceLog();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v5 = 0;
    _os_log_impl(&dword_1853B0000, v4, OS_LOG_TYPE_INFO, "_UISmartReplyFeedbackInputDashboardViewController viewDidAppear", v5, 2u);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UISmartReplyFeedbackInputDashboardViewController;
  [(UIViewController *)&v5 viewDidDisappear:a3];
  BOOL v3 = UIFeedbackServiceLog();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1853B0000, v3, OS_LOG_TYPE_INFO, "_UISmartReplyFeedbackInputDashboardViewController viewDidDisappear", v4, 2u);
  }
}

- (BOOL)isVisibleForInputDelegate:(id)a3 inputViews:(id)a4
{
  return 1;
}

- (double)preferredHeightForTraitCollection:(id)a3
{
  return -1.0;
}

- (UIView)backdropView
{
  return self->_backdropView;
}

- (void)setBackdropView:(id)a3
{
}

- (_UISmartReplyFeedbackInputDashboardView)inputDashboardView
{
  return self->_inputDashboardView;
}

- (void)setInputDashboardView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_inputDashboardView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
}

@end