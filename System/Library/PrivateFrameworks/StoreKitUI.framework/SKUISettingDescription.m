@interface SKUISettingDescription
+ (BOOL)allowsEdit;
+ (Class)_viewClassForSettingDescription:(id)a3;
+ (Class)viewClassForSettingDescription:(id)a3;
- (BOOL)_initiallyHidden;
- (BOOL)_isHidden;
- (BOOL)allowsSelection;
- (BOOL)commitEdits:(id)a3;
- (BOOL)editsValid;
- (SKUISettingDescription)initWithViewElement:(id)a3 parent:(id)a4;
- (SKUISettingsGroupDescription)parent;
- (SKUIViewElement)viewElement;
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

@implementation SKUISettingDescription

- (SKUISettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUISettingDescription initWithViewElement:parent:]();
  }
  v12.receiver = self;
  v12.super_class = (Class)SKUISettingDescription;
  v9 = [(SKUISettingDescription *)&v12 init];
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
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __54__SKUISettingDescription_handleSelectionOnCompletion___block_invoke;
    v7[3] = &unk_1E6424378;
    id v8 = v4;
    [(SKUIViewElement *)viewElement dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:0 completionBlock:v7];
  }
  else
  {
    v4[2](v4);
  }
}

void __54__SKUISettingDescription_handleSelectionOnCompletion___block_invoke(uint64_t a1)
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
  v6 = (SKUIViewElement *)a3;
  objc_storeWeak((id *)&self->_parent, a4);
  viewElement = self->_viewElement;
  self->_viewElement = v6;
}

- (SKUIViewElement)viewElement
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

- (SKUISettingsGroupDescription)parent
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_parent);

  return (SKUISettingsGroupDescription *)WeakRetained;
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

- (void)initWithViewElement:parent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUISettingDescription initWithViewElement:parent:]";
}

@end