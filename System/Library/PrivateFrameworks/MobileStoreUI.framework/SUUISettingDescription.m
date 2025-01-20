@interface SUUISettingDescription
+ (BOOL)allowsEdit;
+ (Class)_viewClassForSettingDescription:(id)a3;
+ (Class)viewClassForSettingDescription:(id)a3;
- (BOOL)_initiallyHidden;
- (BOOL)_isHidden;
- (BOOL)allowsSelection;
- (BOOL)commitEdits:(id)a3;
- (BOOL)editsValid;
- (SUUISettingDescription)initWithViewElement:(id)a3 parent:(id)a4;
- (SUUISettingsGroupDescription)parent;
- (SUUIViewElement)viewElement;
- (id)indexPath;
- (void)_deleteSetting;
- (void)_dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_dispatchUpdate:(id)a3;
- (void)_hideSetting;
- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5;
- (void)_reloadSetting;
- (void)_revealSetting;
- (void)_setEditsValid:(BOOL)a3;
- (void)handleSelectionOnCompletion:(id)a3;
- (void)reloadWithViewElement:(id)a3 parent:(id)a4;
- (void)setParent:(id)a3;
- (void)setViewElement:(id)a3;
@end

@implementation SUUISettingDescription

- (SUUISettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)SUUISettingDescription;
  v9 = [(SUUISettingDescription *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeWeak((id *)&v9->_parent, v8);
    objc_storeStrong((id *)&v10->_viewElement, a3);
  }

  return v10;
}

+ (BOOL)allowsEdit
{
  return 0;
}

+ (Class)viewClassForSettingDescription:(id)a3
{
  id v3 = a3;
  v4 = [(id)objc_opt_class() _viewClassForSettingDescription:v3];

  return (Class)v4;
}

- (BOOL)allowsSelection
{
  return 1;
}

- (BOOL)commitEdits:(id)a3
{
  return 0;
}

- (BOOL)editsValid
{
  return ![(id)objc_opt_class() allowsEdit] || self->_editsValid;
}

- (void)handleSelectionOnCompletion:(id)a3
{
  v4 = (void (**)(void))a3;
  v5 = v4;
  viewElement = self->_viewElement;
  if (viewElement)
  {
    v7[0] = MEMORY[0x263EF8330];
    v7[1] = 3221225472;
    v7[2] = __54__SUUISettingDescription_handleSelectionOnCompletion___block_invoke;
    v7[3] = &unk_265402020;
    id v8 = v4;
    [(SUUIViewElement *)viewElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:v7];
  }
  else
  {
    v4[2](v4);
  }
}

void __54__SUUISettingDescription_handleSelectionOnCompletion___block_invoke(uint64_t a1)
{
}

- (id)indexPath
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  v4 = [WeakRetained indexPathForSettingDescription:self];

  return v4;
}

- (void)reloadWithViewElement:(id)a3 parent:(id)a4
{
  v6 = (SUUIViewElement *)a3;
  objc_storeWeak((id *)&self->_parent, a4);
  viewElement = self->_viewElement;
  self->_viewElement = v6;
}

- (SUUIViewElement)viewElement
{
  return self->_viewElement;
}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  return 0;
}

- (void)_deleteSetting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained deleteSettingDescription:self];
}

- (void)_dismissViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  p_parent = &self->_parent;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  [WeakRetained _dismissViewController:v9 animated:v5 completion:v8];
}

- (void)_dispatchUpdate:(id)a3
{
  p_parent = &self->_parent;
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  [WeakRetained dispatchUpdate:v4];
}

- (void)_hideSetting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained hideSettingDescription:self];
}

- (BOOL)_initiallyHidden
{
  return 0;
}

- (BOOL)_isHidden
{
  v2 = self;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  LOBYTE(v2) = [WeakRetained isSettingDescriptionHidden:v2];

  return (char)v2;
}

- (void)_presentViewController:(id)a3 animated:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  p_parent = &self->_parent;
  id v8 = a5;
  id v9 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_parent);
  [WeakRetained _presentViewController:v9 animated:v5 completion:v8];
}

- (void)_reloadSetting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained reloadSettingDescription:self];
}

- (void)_revealSetting
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  [WeakRetained revealSettingDescription:self];
}

- (void)_setEditsValid:(BOOL)a3
{
  if (self->_editsValid != a3)
  {
    self->_editsValid = a3;
    id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
    [WeakRetained _updatedEditsValid];
  }
}

- (SUUISettingsGroupDescription)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);
  return (SUUISettingsGroupDescription *)WeakRetained;
}

- (void)setParent:(id)a3
{
}

- (void)setViewElement:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_parent);
  objc_storeStrong((id *)&self->_viewElement, 0);
}

@end