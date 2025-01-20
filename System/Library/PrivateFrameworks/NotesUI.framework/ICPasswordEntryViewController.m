@interface ICPasswordEntryViewController
- (BOOL)_canShowWhileLocked;
- (BOOL)isAnimatingOut;
- (ICNote)note;
- (ICPasswordEntryViewController)initWithNibName:(id)a3 bundle:(id)a4 note:(id)a5 intent:(unint64_t)a6;
- (ICTextBackgroundView)backgroundView;
- (UIButton)largeUnlockButton;
- (UIButton)unlockButton;
- (UIImageView)lockImage;
- (UILabel)titleLabel;
- (id)passwordEntryCompletionHandler;
- (unint64_t)intent;
- (unint64_t)mode;
- (void)applyEntryViewMode;
- (void)beginAuthentication;
- (void)dealloc;
- (void)setBackgroundView:(id)a3;
- (void)setIntent:(unint64_t)a3;
- (void)setIsAnimatingOut:(BOOL)a3;
- (void)setLargeUnlockButton:(id)a3;
- (void)setLockImage:(id)a3;
- (void)setMode:(unint64_t)a3;
- (void)setNote:(id)a3;
- (void)setPasswordEntryCompletionHandler:(id)a3;
- (void)setTitleLabel:(id)a3;
- (void)setUnlockButton:(id)a3;
- (void)unlockPasswordButtonPressed:(id)a3;
- (void)viewDidLoad;
@end

@implementation ICPasswordEntryViewController

- (ICPasswordEntryViewController)initWithNibName:(id)a3 bundle:(id)a4 note:(id)a5 intent:(unint64_t)a6
{
  id v10 = a5;
  v11 = (void *)MEMORY[0x1E4F28B50];
  id v12 = a3;
  v13 = [v11 bundleForClass:objc_opt_class()];
  v16.receiver = self;
  v16.super_class = (Class)ICPasswordEntryViewController;
  v14 = [(ICPasswordEntryViewController *)&v16 initWithNibName:v12 bundle:v13];

  if (v14)
  {
    objc_storeStrong((id *)&v14->_note, a5);
    v14->_intent = a6;
  }

  return v14;
}

- (void)dealloc
{
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)ICPasswordEntryViewController;
  [(ICPasswordEntryViewController *)&v4 dealloc];
}

- (void)setMode:(unint64_t)a3
{
  if (self->_mode != a3)
  {
    self->_mode = a3;
    [(ICPasswordEntryViewController *)self applyEntryViewMode];
  }
}

- (void)applyEntryViewMode
{
  unint64_t mode = self->_mode;
  if (mode == 1)
  {
    v9 = [(ICPasswordEntryViewController *)self titleLabel];
    [v9 setHidden:1];

    id v10 = [(ICPasswordEntryViewController *)self unlockButton];
    [v10 setHidden:1];

    v7 = [(ICPasswordEntryViewController *)self largeUnlockButton];
    id v11 = v7;
    uint64_t v8 = 1;
  }
  else
  {
    if (mode) {
      return;
    }
    objc_super v4 = [(ICPasswordEntryViewController *)self titleLabel];
    [v4 setHidden:0];

    BOOL v5 = [(ICPasswordEntryViewController *)self intent] != 0;
    v6 = [(ICPasswordEntryViewController *)self unlockButton];
    [v6 setHidden:v5];

    v7 = [(ICPasswordEntryViewController *)self largeUnlockButton];
    id v11 = v7;
    uint64_t v8 = 0;
  }
  [v7 setHidden:v8];
}

- (void)viewDidLoad
{
  v21.receiver = self;
  v21.super_class = (Class)ICPasswordEntryViewController;
  [(ICPasswordEntryViewController *)&v21 viewDidLoad];
  objc_super v4 = [MEMORY[0x1E4FB1618] ICBackgroundColor];
  BOOL v5 = [(ICPasswordEntryViewController *)self view];
  [v5 setBackgroundColor:v4];

  int v6 = objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision");
  char v7 = v6;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E4FB1618], "ic_dynamicWhiteBlackColor");
  }
  else
  {
    v2 = [(ICPasswordEntryViewController *)self backgroundView];
    [v2 backgroundColor];
  uint64_t v8 = };
  v9 = [(ICPasswordEntryViewController *)self backgroundView];
  [v9 setBackgroundColor:v8];

  if ((v7 & 1) == 0)
  {

    uint64_t v8 = v2;
  }

  int v10 = objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision");
  char v11 = v10;
  if (v10)
  {
    [MEMORY[0x1E4FB1618] systemGrayColor];
  }
  else
  {
    v2 = [(ICPasswordEntryViewController *)self lockImage];
    [v2 tintColor];
  id v12 = };
  v13 = [(ICPasswordEntryViewController *)self lockImage];
  [v13 setTintColor:v12];

  if ((v11 & 1) == 0)
  {

    id v12 = v2;
  }

  v14 = objc_msgSend(MEMORY[0x1E4FB1618], "ic_noteEditorLabelColor");
  v15 = [(ICPasswordEntryViewController *)self titleLabel];
  [v15 setTextColor:v14];

  objc_super v16 = [(ICPasswordEntryViewController *)self unlockButton];
  [v16 _accessibilitySetIsSpeakThisElement:1];

  if (objc_msgSend(MEMORY[0x1E4FB16C8], "ic_isVision"))
  {
    v17 = [(ICPasswordEntryViewController *)self unlockButton];
    [v17 setTitleColor:0 forState:0];

    v18 = objc_msgSend(MEMORY[0x1E4FB14D8], "ic_filledTintedButtonConfiguration");
    v19 = [(ICPasswordEntryViewController *)self unlockButton];
    [v19 setConfiguration:v18];
  }
  v20 = [(ICPasswordEntryViewController *)self largeUnlockButton];
  [v20 setIsAccessibilityElement:0];

  [(ICPasswordEntryViewController *)self applyEntryViewMode];
}

- (void)beginAuthentication
{
  id v3 = [(ICPasswordEntryViewController *)self unlockButton];
  [(ICPasswordEntryViewController *)self unlockPasswordButtonPressed:v3];
}

- (void)unlockPasswordButtonPressed:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  unint64_t v5 = [(ICPasswordEntryViewController *)self intent];
  int v6 = [(ICPasswordEntryViewController *)self note];
  char v7 = +[ICAuthenticationPrompt promptForIntent:v5 object:v6];

  uint64_t v8 = +[ICAuthentication shared];
  v9 = [(ICPasswordEntryViewController *)self view];
  int v10 = [v9 window];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __61__ICPasswordEntryViewController_unlockPasswordButtonPressed___block_invoke;
  v11[3] = &unk_1E5FD94D0;
  objc_copyWeak(&v12, &location);
  v11[4] = self;
  [v8 authenticateWithPrompt:v7 displayWindow:v10 completionHandler:v11];

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);
}

void __61__ICPasswordEntryViewController_unlockPasswordButtonPressed___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = (id *)(a1 + 40);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));

  if (a2 == 2 && WeakRetained)
  {
    int v6 = (void *)MEMORY[0x1E4F83348];
    id v7 = objc_loadWeakRetained(v4);
    uint64_t v8 = [v7 note];
    if ([v6 shouldAuthenticateWithDevicePasswordForObject:v8])
    {
      id v9 = objc_loadWeakRetained(v4);
      int v10 = [v9 note];
      char v11 = [v10 account];
      int v12 = [v11 resolvedLockedNotesMode];

      if (v12 == 1)
      {
        v13 = +[ICLockedNotesModeMigrator sharedMigrator];
        v14 = objc_loadWeakRetained(v4);
        v15 = [v14 note];
        id v16 = objc_loadWeakRetained(v4);
        v17 = [v16 view];
        v18 = [v17 window];
        v19 = v13;
        v20 = v15;
        uint64_t v21 = 1;
        goto LABEL_10;
      }
    }
    else
    {
    }
    v22 = (void *)MEMORY[0x1E4F83348];
    v13 = objc_loadWeakRetained(v4);
    v14 = [v13 note];
    if (![v22 shouldAuthenticateWithCustomPasswordForObject:v14])
    {
LABEL_11:

      goto LABEL_12;
    }
    id v23 = objc_loadWeakRetained(v4);
    v24 = [v23 note];
    v25 = [v24 account];
    int v26 = [v25 resolvedLockedNotesMode];

    if (v26 != 2) {
      goto LABEL_12;
    }
    v13 = +[ICLockedNotesModeMigrator sharedMigrator];
    v14 = objc_loadWeakRetained(v4);
    v15 = [v14 note];
    id v16 = objc_loadWeakRetained(v4);
    v17 = [v16 view];
    v18 = [v17 window];
    v19 = v13;
    v20 = v15;
    uint64_t v21 = 2;
LABEL_10:
    [v19 presentDivergedModeAlertForNote:v20 mode:v21 window:v18 completionHandler:0];

    goto LABEL_11;
  }
LABEL_12:
  v27 = [*(id *)(a1 + 32) passwordEntryCompletionHandler];

  if (v27)
  {
    v28 = [*(id *)(a1 + 32) passwordEntryCompletionHandler];
    v28[2](v28, a2);
  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (ICNote)note
{
  return self->_note;
}

- (void)setNote:(id)a3
{
}

- (unint64_t)intent
{
  return self->_intent;
}

- (void)setIntent:(unint64_t)a3
{
  self->_intent = a3;
}

- (BOOL)isAnimatingOut
{
  return self->_isAnimatingOut;
}

- (void)setIsAnimatingOut:(BOOL)a3
{
  self->_isAnimatingOut = a3;
}

- (id)passwordEntryCompletionHandler
{
  return self->_passwordEntryCompletionHandler;
}

- (void)setPasswordEntryCompletionHandler:(id)a3
{
}

- (unint64_t)mode
{
  return self->_mode;
}

- (ICTextBackgroundView)backgroundView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_backgroundView);
  return (ICTextBackgroundView *)WeakRetained;
}

- (void)setBackgroundView:(id)a3
{
}

- (UIImageView)lockImage
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_lockImage);
  return (UIImageView *)WeakRetained;
}

- (void)setLockImage:(id)a3
{
}

- (UILabel)titleLabel
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_titleLabel);
  return (UILabel *)WeakRetained;
}

- (void)setTitleLabel:(id)a3
{
}

- (UIButton)unlockButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_unlockButton);
  return (UIButton *)WeakRetained;
}

- (void)setUnlockButton:(id)a3
{
}

- (UIButton)largeUnlockButton
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_largeUnlockButton);
  return (UIButton *)WeakRetained;
}

- (void)setLargeUnlockButton:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_largeUnlockButton);
  objc_destroyWeak((id *)&self->_unlockButton);
  objc_destroyWeak((id *)&self->_titleLabel);
  objc_destroyWeak((id *)&self->_lockImage);
  objc_destroyWeak((id *)&self->_backgroundView);
  objc_storeStrong(&self->_passwordEntryCompletionHandler, 0);
  objc_storeStrong((id *)&self->_note, 0);
}

@end