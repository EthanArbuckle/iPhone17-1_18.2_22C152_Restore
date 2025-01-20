@interface UIKeyboardStickerEditorViewController
- (UIKeyboardStickerEditorViewController)initWithStickerIdentifier:(id)a3 sourceRect:(CGRect)a4;
- (void)configureBackdropView;
- (void)configureEditorViewController;
- (void)configureVisualEffectView;
- (void)dismiss;
- (void)dismissAnimated:(BOOL)a3;
- (void)showInKeyboard;
- (void)stickerEffectEditorViewControllerControllerDidTapDone;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation UIKeyboardStickerEditorViewController

- (UIKeyboardStickerEditorViewController)initWithStickerIdentifier:(id)a3 sourceRect:(CGRect)a4
{
  CGFloat height = a4.size.height;
  CGFloat width = a4.size.width;
  CGFloat y = a4.origin.y;
  CGFloat x = a4.origin.x;
  id v10 = a3;
  v14.receiver = self;
  v14.super_class = (Class)UIKeyboardStickerEditorViewController;
  v11 = [(UIViewController *)&v14 init];
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_stickerIdentifier, a3);
    v12->_sourceRect.origin.CGFloat x = x;
    v12->_sourceRect.origin.CGFloat y = y;
    v12->_sourceRect.size.CGFloat width = width;
    v12->_sourceRect.size.CGFloat height = height;
  }

  return v12;
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)UIKeyboardStickerEditorViewController;
  [(UIViewController *)&v4 viewDidLoad];
  v3 = [(UIViewController *)self view];
  [v3 setTranslatesAutoresizingMaskIntoConstraints:0];
}

- (void)configureBackdropView
{
  v31[4] = *MEMORY[0x1E4F143B8];
  v3 = [UIKBBackdropView alloc];
  objc_super v4 = [(UIViewController *)self view];
  [v4 bounds];
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  v13 = [(UIViewController *)self view];
  objc_super v14 = [v13 _inheritedRenderConfig];
  v15 = -[UIKBBackdropView initWithFrame:style:](v3, "initWithFrame:style:", [v14 backdropStyle], v6, v8, v10, v12);
  backdropView = self->_backdropView;
  self->_backdropView = v15;

  [(UIView *)self->_backdropView setTranslatesAutoresizingMaskIntoConstraints:0];
  v17 = [(UIViewController *)self view];
  [v17 addSubview:self->_backdropView];
  v30 = [(UIView *)self->_backdropView topAnchor];
  v29 = [v17 topAnchor];
  v28 = [v30 constraintEqualToAnchor:v29];
  v31[0] = v28;
  v27 = [(UIView *)self->_backdropView bottomAnchor];
  v18 = [v17 bottomAnchor];
  v19 = [v27 constraintEqualToAnchor:v18];
  v31[1] = v19;
  v20 = [(UIView *)self->_backdropView leftAnchor];
  v21 = [v17 leftAnchor];
  v22 = [v20 constraintEqualToAnchor:v21];
  v31[2] = v22;
  v23 = [(UIView *)self->_backdropView rightAnchor];
  v24 = [v17 rightAnchor];
  v25 = [v23 constraintEqualToAnchor:v24];
  v31[3] = v25;
  v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:4];

  [MEMORY[0x1E4F5B268] activateConstraints:v26];
}

- (void)configureVisualEffectView
{
  v22[4] = *MEMORY[0x1E4F143B8];
  v3 = [UIVisualEffectView alloc];
  objc_super v4 = +[UIBlurEffect effectWithStyle:1200];
  double v5 = [(UIVisualEffectView *)v3 initWithEffect:v4];
  visualEffectView = self->_visualEffectView;
  self->_visualEffectView = v5;

  [(UIView *)self->_visualEffectView setTranslatesAutoresizingMaskIntoConstraints:0];
  double v7 = +[UIKeyboardEmojiPopoverController visualEffectGroupName];
  [(UIVisualEffectView *)self->_visualEffectView _setGroupName:v7];

  [(UIVisualEffectView *)self->_visualEffectView _setCornerRadius:13.0];
  double v8 = [(UIViewController *)self view];
  [v8 addSubview:self->_visualEffectView];
  v21 = [(UIView *)self->_visualEffectView topAnchor];
  v20 = [v8 topAnchor];
  v19 = [v21 constraintEqualToAnchor:v20];
  v22[0] = v19;
  v18 = [(UIView *)self->_visualEffectView bottomAnchor];
  double v9 = [v8 bottomAnchor];
  double v10 = [v18 constraintEqualToAnchor:v9];
  v22[1] = v10;
  double v11 = [(UIView *)self->_visualEffectView leftAnchor];
  double v12 = [v8 leftAnchor];
  v13 = [v11 constraintEqualToAnchor:v12];
  v22[2] = v13;
  objc_super v14 = [(UIView *)self->_visualEffectView rightAnchor];
  v15 = [v8 rightAnchor];
  v16 = [v14 constraintEqualToAnchor:v15];
  v22[3] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:4];

  [MEMORY[0x1E4F5B268] activateConstraints:v17];
}

- (void)showInKeyboard
{
  v60[4] = *MEMORY[0x1E4F143B8];
  if (!self->_shown)
  {
    self->_shown = 1;
    v3 = +[UIKeyboardImpl activeInstance];
    objc_super v4 = [v3 _rootInputWindowController];
    double v5 = [v4 bottomEdgeView];

    int v6 = [v3 isEmojiPopoverPresented];
    if (v6)
    {
      double v7 = [v3 emojiPopoverController];
      uint64_t v8 = [v7 view];

      [(UIKeyboardStickerEditorViewController *)self configureVisualEffectView];
      double v5 = (void *)v8;
    }
    else
    {
      [(UIKeyboardStickerEditorViewController *)self configureBackdropView];
    }
    double v9 = [v5 _viewControllerForAncestor];
    double v10 = [v5 _rootInputWindowController];
    double v11 = [(UIViewController *)self view];
    if (!v9) {
      goto LABEL_27;
    }
    BOOL v12 = +[UIKeyboardImpl isFloating];
    if (v12) {
      [v10 _inputView];
    }
    else {
    v13 = [v10 view];
    }
    v57 = v11;
    v58 = v10;
    v56 = v3;
    if (v6)
    {
      objc_super v14 = [v3 emojiPopoverController];
      v15 = [v14 view];

      v16 = [v3 emojiPopoverController];
      v17 = [v16 view];
      uint64_t v18 = [v17 topAnchor];

LABEL_24:
      [v9 addChildViewController:self];
      [v5 addSubview:v11];
      v53 = [v11 topAnchor];
      v54 = (void *)v18;
      v52 = [v53 constraintEqualToAnchor:v18];
      v60[0] = v52;
      v51 = [v11 bottomAnchor];
      v50 = [v15 bottomAnchor];
      v49 = [v51 constraintEqualToAnchor:v50];
      v60[1] = v49;
      v28 = [v11 leftAnchor];
      v29 = [v15 leftAnchor];
      v30 = [v28 constraintEqualToAnchor:v29];
      v60[2] = v30;
      v31 = [v11 rightAnchor];
      v55 = v15;
      [v15 rightAnchor];
      v33 = v32 = v9;
      [v31 constraintEqualToAnchor:v33];
      v35 = v34 = v5;
      v60[3] = v35;
      v36 = [MEMORY[0x1E4F1C978] arrayWithObjects:v60 count:4];

      double v5 = v34;
      double v9 = v32;

      [MEMORY[0x1E4F5B268] activateConstraints:v36];
      [(UIViewController *)self didMoveToParentViewController:v32];
      [(UIKeyboardStickerEditorViewController *)self configureEditorViewController];
      v37 = [(UIViewController *)self view];
      [v37 setAlpha:1.0];

      [(UIView *)self->_backdropView setAlpha:0.0];
      [(UIView *)self->_visualEffectView setAlpha:0.0];
      [v34 layoutIfNeeded];
      v38 = [(UIViewController *)self view];
      v39 = [v38 window];
      v40 = [(STKRemoteStickerEffectEditorViewController *)self->_editorViewController view];
      objc_msgSend(v39, "convertRect:toView:", v40, self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
      double v42 = v41;
      double v44 = v43;
      double v46 = v45;
      double v48 = v47;

      if (objc_opt_respondsToSelector()) {
        -[STKRemoteStickerEffectEditorViewController showStickerEffectViewWithSourceRect:showing:](self->_editorViewController, "showStickerEffectViewWithSourceRect:showing:", 1, v42, v44, v46, v48);
      }
      v59[0] = MEMORY[0x1E4F143A8];
      v59[1] = 3221225472;
      v59[2] = __55__UIKeyboardStickerEditorViewController_showInKeyboard__block_invoke;
      v59[3] = &unk_1E52D9F70;
      v59[4] = self;
      +[UIView animateWithDuration:0 delay:v59 usingSpringWithDamping:&__block_literal_global_513 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];

      v3 = v56;
      double v11 = v57;
      double v10 = v58;
LABEL_27:

      return;
    }
    v19 = [v10 _inputAccessoryView];

    if (v19)
    {
      v20 = [v10 _inputAccessoryView];
      v15 = v13;
      goto LABEL_22;
    }
    v21 = [v10 _inputAssistantView];
    uint64_t v22 = [v21 superview];
    if (v22)
    {
      v23 = (void *)v22;
      v24 = +[UIKeyboardImpl activeInstance];
      char v25 = [v24 _showsScribbleIconsInAssistantView];

      v15 = v13;
      if ((v25 & 1) == 0)
      {
        uint64_t v26 = [v58 _inputAssistantView];
LABEL_21:
        v20 = (void *)v26;
        double v11 = v57;
LABEL_22:
        uint64_t v18 = [v20 topAnchor];

        if (v12)
        {
          +[UIKeyboardPopoverContainer contentInsets];
          +[UIKeyboardPopoverContainer contentInsets];
          +[UIKeyboardPopoverContainer contentInsets];
          +[UIKeyboardPopoverContainer contentInsets];
        }
        goto LABEL_24;
      }
    }
    else
    {

      v15 = v13;
    }
    v27 = [v58 _inputView];

    if (v27) {
      [v58 _inputView];
    }
    else {
    uint64_t v26 = [v58 view];
    }
    goto LABEL_21;
  }
}

void __55__UIKeyboardStickerEditorViewController_showInKeyboard__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1024) setAlpha:1.0];
  [*(id *)(*(void *)(a1 + 32) + 1032) setAlpha:1.0];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:0x1ED148440 object:*(void *)(a1 + 32)];
}

- (void)configureEditorViewController
{
  v51[2] = *MEMORY[0x1E4F143B8];
  if (!self->_editorViewController)
  {
    uint64_t v45 = 0;
    double v46 = &v45;
    uint64_t v47 = 0x2050000000;
    v3 = (void *)_MergedGlobals_3_24;
    uint64_t v48 = _MergedGlobals_3_24;
    if (!_MergedGlobals_3_24)
    {
      v44[0] = MEMORY[0x1E4F143A8];
      v44[1] = 3221225472;
      v44[2] = __getSTKRemoteStickerEffectEditorViewControllerClass_block_invoke;
      v44[3] = &unk_1E52D9900;
      v44[4] = &v45;
      __getSTKRemoteStickerEffectEditorViewControllerClass_block_invoke((uint64_t)v44);
      v3 = (void *)v46[3];
    }
    objc_super v4 = v3;
    _Block_object_dispose(&v45, 8);
    double v5 = (STKRemoteStickerEffectEditorViewController *)[[v4 alloc] initWithStickerIdentifier:self->_stickerIdentifier];
    editorViewController = self->_editorViewController;
    self->_editorViewController = v5;

    double v7 = self->_editorViewController;
    if (v7)
    {
      [(STKRemoteStickerEffectEditorViewController *)v7 setDelegate:self];
      [(UIViewController *)self addChildViewController:self->_editorViewController];
      v38 = [(UIViewController *)self view];
      v39 = [(STKRemoteStickerEffectEditorViewController *)self->_editorViewController view];
      [v38 addSubview:v39];
      [v39 setTranslatesAutoresizingMaskIntoConstraints:0];
      uint64_t v8 = +[UIKeyboardImpl activeInstance];
      int v9 = [v8 isEmojiPopoverPresented];

      if (v9) {
        double v10 = 10.0;
      }
      else {
        double v10 = 0.0;
      }
      if (v9) {
        double v11 = 15.0;
      }
      else {
        double v11 = 0.0;
      }
      BOOL v12 = [v39 leftAnchor];
      v13 = [v38 leftAnchor];
      objc_super v14 = [v12 constraintEqualToAnchor:v13 constant:v10];
      v51[0] = v14;
      v15 = [v39 rightAnchor];
      v16 = [v38 rightAnchor];
      v17 = [v15 constraintEqualToAnchor:v16 constant:-v10];
      v51[1] = v17;
      uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v51 count:2];
      v19 = (void *)[v18 mutableCopy];

      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v20 = v19;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v50 count:16];
      if (v21)
      {
        uint64_t v23 = *(void *)v41;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v41 != v23) {
              objc_enumerationMutation(v20);
            }
            LODWORD(v22) = 1132068864;
            [*(id *)(*((void *)&v40 + 1) + 8 * i) setPriority:v22];
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v40 objects:v50 count:16];
        }
        while (v21);
      }

      v37 = [v39 centerXAnchor];
      v36 = [v38 centerXAnchor];
      char v25 = [v37 constraintEqualToAnchor:v36];
      v49[0] = v25;
      uint64_t v26 = [v39 topAnchor];
      v27 = [v38 topAnchor];
      v28 = [v26 constraintEqualToAnchor:v27 constant:v11];
      v49[1] = v28;
      v29 = [v39 bottomAnchor];
      v30 = [v38 bottomAnchor];
      v31 = [v29 constraintEqualToAnchor:v30 constant:-v11];
      v49[2] = v31;
      v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:v49 count:3];
      [v20 addObjectsFromArray:v32];

      v33 = [v39 widthAnchor];
      v34 = [v33 constraintLessThanOrEqualToConstant:430.0];

      LODWORD(v35) = 1144750080;
      [v34 setPriority:v35];
      [v20 addObject:v34];
      [MEMORY[0x1E4F5B268] activateConstraints:v20];
      [(STKRemoteStickerEffectEditorViewController *)self->_editorViewController didMoveToParentViewController:self];
    }
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  objc_super v4 = [(UIViewController *)self traitCollection];
  if ([v4 userInterfaceStyle] == 2) {
    +[UIKBRenderConfig darkConfig];
  }
  else {
  id v5 = +[UIKBRenderConfig defaultEmojiConfig];
  }

  -[UIKBBackdropView transitionToStyle:](self->_backdropView, "transitionToStyle:", [v5 backdropStyle]);
}

- (void)stickerEffectEditorViewControllerControllerDidTapDone
{
}

- (void)dismiss
{
  [(UIViewController *)self willMoveToParentViewController:0];
  v3 = [(UIViewController *)self view];
  [v3 removeFromSuperview];

  [(UIViewController *)self removeFromParentViewController];
}

- (void)dismissAnimated:(BOOL)a3
{
  if (self->_shown)
  {
    if (a3)
    {
      objc_super v4 = [(UIViewController *)self view];
      id v5 = [v4 window];
      int v6 = [(STKRemoteStickerEffectEditorViewController *)self->_editorViewController view];
      objc_msgSend(v5, "convertRect:toView:", v6, self->_sourceRect.origin.x, self->_sourceRect.origin.y, self->_sourceRect.size.width, self->_sourceRect.size.height);
      double v8 = v7;
      double v10 = v9;
      double v12 = v11;
      double v14 = v13;

      if (objc_opt_respondsToSelector()) {
        -[STKRemoteStickerEffectEditorViewController showStickerEffectViewWithSourceRect:showing:](self->_editorViewController, "showStickerEffectViewWithSourceRect:showing:", 0, v8, v10, v12, v14);
      }
      v16[4] = self;
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __57__UIKeyboardStickerEditorViewController_dismissAnimated___block_invoke;
      v17[3] = &unk_1E52D9F70;
      v17[4] = self;
      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      v16[2] = __57__UIKeyboardStickerEditorViewController_dismissAnimated___block_invoke_2;
      v16[3] = &unk_1E52DC3A0;
      +[UIView animateWithDuration:0 delay:v17 usingSpringWithDamping:v16 initialSpringVelocity:0.5 options:0.0 animations:1.0 completion:1.0];
    }
    else
    {
      v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v15 postNotificationName:0x1ED148460 object:self];

      [(UIKeyboardStickerEditorViewController *)self dismiss];
    }
  }
}

void __57__UIKeyboardStickerEditorViewController_dismissAnimated___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 1024) setAlpha:0.0];
  [*(id *)(*(void *)(a1 + 32) + 1032) setAlpha:0.0];
  id v2 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v2 postNotificationName:0x1ED148460 object:*(void *)(a1 + 32)];
}

uint64_t __57__UIKeyboardStickerEditorViewController_dismissAnimated___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) dismiss];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_storeStrong((id *)&self->_backdropView, 0);
  objc_storeStrong((id *)&self->_editorViewController, 0);
  objc_storeStrong((id *)&self->_stickerIdentifier, 0);
}

@end