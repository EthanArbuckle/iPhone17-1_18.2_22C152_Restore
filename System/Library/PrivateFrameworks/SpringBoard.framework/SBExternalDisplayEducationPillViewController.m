@interface SBExternalDisplayEducationPillViewController
- (NSString)requestIdentifier;
- (NSString)requesterIdentifier;
- (SBExternalDisplayEducationPillViewController)initWithExtendedDisplayEnabled:(BOOL)a3;
- (SBExternalDisplayEducationPillViewControllerDelegate)delegate;
- (id)_pillSubtitleContentItem;
- (id)presentableDescription;
- (int64_t)presentableBehavior;
- (void)_handleSingleTap:(id)a3;
- (void)setDelegate:(id)a3;
- (void)viewDidLoad;
@end

@implementation SBExternalDisplayEducationPillViewController

- (SBExternalDisplayEducationPillViewController)initWithExtendedDisplayEnabled:(BOOL)a3
{
  v7.receiver = self;
  v7.super_class = (Class)SBExternalDisplayEducationPillViewController;
  v4 = [(SBExternalDisplayEducationPillViewController *)&v7 init];
  v5 = v4;
  if (v4)
  {
    v4->_extendedDisplayEnabled = a3;
    [(SBExternalDisplayEducationPillViewController *)v4 loadViewIfNeeded];
    [(PLPillView *)v5->_pillView intrinsicContentSize];
    -[SBExternalDisplayEducationPillViewController setPreferredContentSize:](v5, "setPreferredContentSize:");
  }
  return v5;
}

- (void)viewDidLoad
{
  v25[2] = *MEMORY[0x1E4F143B8];
  v24.receiver = self;
  v24.super_class = (Class)SBExternalDisplayEducationPillViewController;
  [(SBExternalDisplayEducationPillViewController *)&v24 viewDidLoad];
  v3 = [(SBExternalDisplayEducationPillViewController *)self view];
  id v4 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v5 = (void *)MEMORY[0x1E4F42A80];
  v6 = (void *)MEMORY[0x1E4F42A98];
  objc_super v7 = [MEMORY[0x1E4F428B8] labelColor];
  v8 = [v6 configurationWithHierarchicalColor:v7];
  v9 = [v5 systemImageNamed:@"display" withConfiguration:v8];
  v10 = (void *)[v4 initWithImage:v9];

  id v11 = objc_alloc(MEMORY[0x1E4F42AA0]);
  v12 = [MEMORY[0x1E4F42A80] systemImageNamed:@"chevron.forward"];
  v13 = (void *)[v11 initWithImage:v12];

  v14 = [MEMORY[0x1E4F28B50] mainBundle];
  v15 = [v14 localizedStringForKey:@"STAGE_MANAGER_EXTENDED_DISPLAY" value:&stru_1F3084718 table:@"SpringBoard"];

  v16 = (PLPillView *)[objc_alloc(MEMORY[0x1E4F91450]) initWithLeadingAccessoryView:v10 trailingAccessoryView:v13];
  pillView = self->_pillView;
  self->_pillView = v16;

  v18 = self->_pillView;
  v19 = (void *)[objc_alloc(MEMORY[0x1E4F91440]) initWithText:v15 style:1];
  v25[0] = v19;
  v20 = [(SBExternalDisplayEducationPillViewController *)self _pillSubtitleContentItem];
  v25[1] = v20;
  v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  [(PLPillView *)v18 setCenterContentItems:v21];

  v22 = self->_pillView;
  [v3 bounds];
  -[PLPillView setFrame:](v22, "setFrame:");
  [(PLPillView *)self->_pillView setAutoresizingMask:18];
  [v3 addSubview:self->_pillView];
  v23 = (void *)[objc_alloc(MEMORY[0x1E4F42EC8]) initWithTarget:self action:sel__handleSingleTap_];
  [v23 setNumberOfTouchesRequired:1];
  [v23 setNumberOfTapsRequired:1];
  [v3 addGestureRecognizer:v23];
}

- (id)_pillSubtitleContentItem
{
  BOOL extendedDisplayEnabled = self->_extendedDisplayEnabled;
  v3 = [MEMORY[0x1E4F28B50] mainBundle];
  id v4 = v3;
  if (extendedDisplayEnabled) {
    v5 = @"STAGE_MANAGER_EXTENDED_DISPLAY_ON";
  }
  else {
    v5 = @"STAGE_MANAGER_EXTENDED_DISPLAY_OFF";
  }
  v6 = [v3 localizedStringForKey:v5 value:&stru_1F3084718 table:@"SpringBoard"];

  objc_super v7 = (void *)[objc_alloc(MEMORY[0x1E4F91440]) initWithText:v6 style:2];
  return v7;
}

- (NSString)requestIdentifier
{
  return (NSString *)@"ExternalDisplayEducation";
}

- (NSString)requesterIdentifier
{
  return (NSString *)@"com.apple.SpringBoard.ExternalDisplayEducation";
}

- (int64_t)presentableBehavior
{
  return 1;
}

- (id)presentableDescription
{
  return @"External Display Education";
}

- (void)_handleSingleTap:(id)a3
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained pillViewControllerDidReceiveUserTap:self];
}

- (SBExternalDisplayEducationPillViewControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SBExternalDisplayEducationPillViewControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_pillView, 0);
}

@end