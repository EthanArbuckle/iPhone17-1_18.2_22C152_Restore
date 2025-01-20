@interface _UIFieldEditorHost
+ (id)fieldEditorHostForTextField:(id)a3;
- (BOOL)isHostingFieldEditor;
- (UIFieldEditor)hostedFieldEditor;
- (_UIFieldEditorHost)initWithHostingView:(id)a3;
- (_UIFieldEditorHostingViewRequirements)hostingView;
- (id)_viewForHostingFieldEditor;
- (id)description;
- (void)addFieldEditor:(id)a3;
- (void)addPlaceholderLabel:(id)a3;
- (void)removeFieldEditor;
@end

@implementation _UIFieldEditorHost

+ (id)fieldEditorHostForTextField:(id)a3
{
  id v3 = a3;
  if (+[UISystemInputViewController canUseSystemInputViewControllerForResponder:v3])
  {
    v4 = off_1E52D5690;
  }
  else
  {
    int v5 = [v3 _isPasscodeStyle];
    v4 = off_1E52D5680;
    if (v5) {
      v4 = off_1E52D5688;
    }
  }
  v6 = (void *)[objc_alloc(*v4) initWithHostingView:v3];

  return v6;
}

- (_UIFieldEditorHost)initWithHostingView:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)_UIFieldEditorHost;
  int v5 = [(_UIFieldEditorHost *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_hostingView, v4);
  }

  return v6;
}

- (BOOL)isHostingFieldEditor
{
  return self->_hostedFieldEditor != 0;
}

- (void)addFieldEditor:(id)a3
{
  int v5 = (UIFieldEditor *)a3;
  id v11 = [(_UIFieldEditorHost *)self _viewForHostingFieldEditor];
  hostedFieldEditor = self->_hostedFieldEditor;
  if (hostedFieldEditor)
  {
    id v7 = [(UIView *)hostedFieldEditor superview];

    if (v7 == v11)
    {
      objc_super v8 = [MEMORY[0x1E4F28B00] currentHandler];
      [v8 handleFailureInMethod:a2, self, @"_UIFieldEditorHost.m", 61, @"The field editor host (%@) is already hosting a field editor!", self object file lineNumber description];
    }
  }
  v9 = self->_hostedFieldEditor;
  self->_hostedFieldEditor = v5;
  v10 = v5;

  [v11 addSubview:self->_hostedFieldEditor];
}

- (id)_viewForHostingFieldEditor
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingView);
  id v3 = [WeakRetained _contentView];

  return v3;
}

- (void)removeFieldEditor
{
  [(UIScrollView *)self->_hostedFieldEditor removeFromSuperview];
  hostedFieldEditor = self->_hostedFieldEditor;
  self->_hostedFieldEditor = 0;
}

- (void)addPlaceholderLabel:(id)a3
{
  hostedFieldEditor = self->_hostedFieldEditor;
  p_hostingView = &self->_hostingView;
  id v6 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_hostingView);
  id v7 = [WeakRetained _contentView];
  objc_super v8 = v7;
  if (hostedFieldEditor) {
    [v7 insertSubview:v6 below:self->_hostedFieldEditor];
  }
  else {
    [v7 addSubview:v6];
  }
}

- (id)description
{
  return +[UIDescriptionBuilder descriptionForObject:self keys:&unk_1ED3EF188];
}

- (_UIFieldEditorHostingViewRequirements)hostingView
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_hostingView);
  return (_UIFieldEditorHostingViewRequirements *)WeakRetained;
}

- (UIFieldEditor)hostedFieldEditor
{
  return self->_hostedFieldEditor;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hostedFieldEditor, 0);
  objc_destroyWeak((id *)&self->_hostingView);
}

@end