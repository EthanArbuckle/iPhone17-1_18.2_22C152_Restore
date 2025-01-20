@interface _UIFieldEditorSystemInputHost
- (BOOL)_isTV;
- (UISystemInputViewController)_systemInputViewController;
- (id)_viewForHostingFieldEditor;
- (id)description;
- (void)_updateFieldEditorBackgroundViewLayoutForcingDefault:(BOOL)a3;
- (void)addFieldEditor:(id)a3;
- (void)addPlaceholderLabel:(id)a3;
- (void)dealloc;
- (void)layoutIfNeeded;
- (void)removeFieldEditor;
@end

@implementation _UIFieldEditorSystemInputHost

- (void)dealloc
{
  [(UISystemInputViewController *)self->_systemInputViewController resetContainingResponder];
  v3.receiver = self;
  v3.super_class = (Class)_UIFieldEditorSystemInputHost;
  [(_UIFieldEditorSystemInputHost *)&v3 dealloc];
}

- (void)addFieldEditor:(id)a3
{
  v23[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(_UIFieldEditorHost *)self hostingView];
  v6 = objc_opt_new();
  [v6 setTranslatesAutoresizingMaskIntoConstraints:0];
  uint64_t v7 = [v5 _blurEffectStyleForAppearance];
  v8 = [UIVisualEffectView alloc];
  v9 = +[UIBlurEffect effectWithStyle:v7];
  v10 = +[UIVibrancyEffect effectForBlurEffect:v9];
  v11 = [(UIVisualEffectView *)v8 initWithEffect:v10];

  [(UIView *)v11 setUserInteractionEnabled:0];
  [(UIVisualEffectView *)v11 _setCornerRadius:6.0];
  [v6 addSubview:v11];
  objc_storeStrong((id *)&self->_containerView, v6);
  objc_storeStrong((id *)&self->_backgroundEffectView, v11);
  v12 = [MEMORY[0x1E4F5B268] constraintWithItem:v6 attribute:8 relatedBy:0 constant:0.0];
  [v6 setHeightConstraint:v12];

  v13 = [MEMORY[0x1E4F5B268] constraintWithItem:v6 attribute:7 relatedBy:0 constant:0.0];
  [v6 setWidthConstraint:v13];

  v14 = (void *)MEMORY[0x1E4F5B268];
  v15 = [v6 heightConstraint];
  v23[0] = v15;
  v16 = [v6 widthConstraint];
  v23[1] = v16;
  v17 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:2];
  [v14 activateConstraints:v17];

  v18 = [(UIVisualEffectView *)v11 contentView];
  [v18 setClipsToBounds:0];

  v22.receiver = self;
  v22.super_class = (Class)_UIFieldEditorSystemInputHost;
  [(_UIFieldEditorHost *)&v22 addFieldEditor:v4];

  v19 = +[UISystemInputViewController systemInputViewControllerForResponder:v5 editorView:v6];
  systemInputViewController = self->_systemInputViewController;
  self->_systemInputViewController = v19;

  [(_UIFieldEditorSystemInputHost *)self _updateFieldEditorBackgroundViewLayoutForcingDefault:1];
  if (self->_systemInputViewController)
  {
    v21 = +[UIViewController _viewControllerForFullScreenPresentationFromView:v5];
    objc_msgSend(v21, "presentViewController:animated:completion:", self->_systemInputViewController, -[UISystemInputViewController isAutomaticResponderTransition](self->_systemInputViewController, "isAutomaticResponderTransition") ^ 1, 0);
  }
}

- (void)removeFieldEditor
{
  systemInputViewController = self->_systemInputViewController;
  if (systemInputViewController)
  {
    [(UIViewController *)systemInputViewController dismissViewControllerAnimated:[(UISystemInputViewController *)self->_systemInputViewController isAutomaticResponderTransition] ^ 1 completion:0];
    [(UISystemInputViewController *)self->_systemInputViewController prepareForRelease];
    id v4 = self->_systemInputViewController;
    self->_systemInputViewController = 0;
  }
  v7.receiver = self;
  v7.super_class = (Class)_UIFieldEditorSystemInputHost;
  [(_UIFieldEditorHost *)&v7 removeFieldEditor];
  containerView = self->_containerView;
  self->_containerView = 0;

  backgroundEffectView = self->_backgroundEffectView;
  self->_backgroundEffectView = 0;
}

- (void)addPlaceholderLabel:(id)a3
{
  id v4 = a3;
  int has_internal_diagnostics = os_variant_has_internal_diagnostics();
  containerView = self->_containerView;
  if (has_internal_diagnostics)
  {
    if (containerView) {
      goto LABEL_3;
    }
    v32 = __UIFaultDebugAssertLog();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_fault_impl(&dword_1853B0000, v32, OS_LOG_TYPE_FAULT, "Should have a _backgroundView when adding the placeholder label.", buf, 2u);
    }
  }
  else
  {
    if (containerView) {
      goto LABEL_3;
    }
    v33 = *(NSObject **)(__UILogGetCategoryCachedImpl("Assert", &addPlaceholderLabel____s_category) + 8);
    if (os_log_type_enabled(v33, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1853B0000, v33, OS_LOG_TYPE_ERROR, "Should have a _backgroundView when adding the placeholder label.", buf, 2u);
    }
  }
  if (!self->_containerView)
  {
    v34.receiver = self;
    v34.super_class = (Class)_UIFieldEditorSystemInputHost;
    [(_UIFieldEditorHost *)&v34 addPlaceholderLabel:v4];
    goto LABEL_7;
  }
LABEL_3:
  objc_super v7 = [(_UIFieldEditorHost *)self hostingView];
  [(UIView *)self->_containerView bounds];
  objc_msgSend(v7, "placeholderRectForBounds:");
  double v9 = v8;
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  [(UIView *)self->_containerView bounds];
  double v17 = v16;
  double v19 = v18;
  double v21 = v20;
  double v23 = v22;
  [v7 contentScaleFactor];
  double v25 = UIRectCenteredYInRectScale(v9, v11, v13, v15, v17, v19, v21, v23, v24);
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  if ([(_UIFieldEditorSystemInputHost *)self _isTV])
  {
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __53___UIFieldEditorSystemInputHost_addPlaceholderLabel___block_invoke;
    v35[3] = &unk_1E52DA520;
    id v36 = v4;
    double v37 = v25;
    double v38 = v27;
    double v39 = v29;
    double v40 = v31;
    +[UIView performWithoutAnimation:v35];
  }
  else
  {
    objc_msgSend(v4, "setFrame:", v25, v27, v29, v31);
  }
  [(UIView *)self->_containerView addSubview:v4];

LABEL_7:
}

- (void)layoutIfNeeded
{
}

- (id)_viewForHostingFieldEditor
{
  return [(UIVisualEffectView *)self->_backgroundEffectView contentView];
}

- (void)_updateFieldEditorBackgroundViewLayoutForcingDefault:(BOOL)a3
{
  if (self->_systemInputViewController)
  {
    BOOL v3 = a3;
    v5 = [(_UIFieldEditorHost *)self hostingView];
    v6 = v5;
    if (v3)
    {
      objc_super v7 = [(_UIFieldEditorHost *)self hostedFieldEditor];
      double v8 = 600.0;
    }
    else
    {
      if (![v5 _fieldEditorAttached]
        || ![v6 _hasContent]
        || ![(UISystemInputViewController *)self->_systemInputViewController supportsTouchInput])
      {
LABEL_15:

        return;
      }
      objc_super v7 = [(_UIFieldEditorHost *)self hostedFieldEditor];
      double v22 = +[UIScreen mainScreen];
      [v22 bounds];
      double v24 = v23;
      [v22 overscanCompensationInsets];
      double v8 = v24 - (v25 + v26);
      double v27 = [v7 attributedText];
      [v27 size];
      double v29 = v28 + 20.0;
      if (v29 <= v8)
      {
        double v8 = v29;
        if (v29 < 600.0) {
          double v8 = 600.0;
        }
      }
    }
    double v9 = *MEMORY[0x1E4F1DAD8];
    double v10 = *(double *)(MEMORY[0x1E4F1DAD8] + 8);
    -[UIView setFrame:](self->_backgroundEffectView, "setFrame:", *MEMORY[0x1E4F1DAD8], v10, v8, 70.0);
    double v11 = [(_UIFieldEditorSystemInputHostView *)self->_containerView widthConstraint];
    [v11 setConstant:v8];

    double v12 = [(_UIFieldEditorSystemInputHostView *)self->_containerView heightConstraint];
    [v12 setConstant:70.0];

    double v13 = v8 + -20.0;
    double v14 = [v7 attributedText];
    [v14 size];
    double v16 = v15;

    double v17 = [v6 selectedTextRange];
    double v18 = [v17 start];
    uint64_t v19 = [v6 baseWritingDirectionForPosition:v18 inDirection:0];

    if (v19 != 1 && v16 > v13)
    {
      [v7 contentSize];
      double v9 = v20 - v13;
      double v10 = 0.0;
    }
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __86___UIFieldEditorSystemInputHost__updateFieldEditorBackgroundViewLayoutForcingDefault___block_invoke;
    v30[3] = &unk_1E52E7948;
    id v31 = v7;
    long long v32 = xmmword_186B967D0;
    double v33 = v13;
    uint64_t v34 = 0x4051800000000000;
    double v35 = v9;
    double v36 = v10;
    id v21 = v7;
    +[UIView performWithoutAnimation:v30];

    goto LABEL_15;
  }
}

- (BOOL)_isTV
{
  v2 = [(_UIFieldEditorHost *)self hostingView];
  BOOL v3 = [v2 traitCollection];

  if (v3) {
    BOOL v4 = [v3 userInterfaceIdiom] == 2;
  }
  else {
    BOOL v4 = 0;
  }

  return v4;
}

- (id)description
{
  return +[UIDescriptionBuilder descriptionForObject:self keys:&unk_1ED3EFAD0];
}

- (UISystemInputViewController)_systemInputViewController
{
  return self->_systemInputViewController;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemInputViewController, 0);
  objc_storeStrong((id *)&self->_backgroundEffectView, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end