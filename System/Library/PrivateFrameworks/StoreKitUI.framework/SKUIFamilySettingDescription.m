@interface SKUIFamilySettingDescription
+ (Class)_viewClassForSettingDescription:(id)a3;
- (BOOL)_initiallyHidden;
- (SKUIFamilySettingDescription)initWithViewElement:(id)a3 parent:(id)a4;
- (int64_t)viewState;
- (void)_updateViewState;
- (void)_updateWithViewState:(int64_t)a3;
- (void)handleSelectionOnCompletion:(id)a3;
@end

@implementation SKUIFamilySettingDescription

- (SKUIFamilySettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT))
  {
    -[SKUIFamilySettingDescription initWithViewElement:parent:]();
  }
  v11.receiver = self;
  v11.super_class = (Class)SKUIFamilySettingDescription;
  v8 = [(SKUISettingDescription *)&v11 initWithViewElement:v6 parent:v7];
  v9 = v8;
  if (v8)
  {
    v8->_viewState = -1;
    [(SKUIFamilySettingDescription *)v8 _updateViewState];
  }

  return v9;
}

- (void)handleSelectionOnCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_viewState + 1;
  if (v5 > 3) {
    id v6 = @"complete";
  }
  else {
    id v6 = off_1E64250F8[v5];
  }
  id v7 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1C9E8]), "initWithObjectsAndKeys:", v6, @"state", 0);
  v8 = [(SKUISettingDescription *)self viewElement];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__SKUIFamilySettingDescription_handleSelectionOnCompletion___block_invoke;
  v10[3] = &unk_1E6424378;
  id v11 = v4;
  id v9 = v4;
  [v8 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:v7 completionBlock:v10];
}

void __60__SKUIFamilySettingDescription_handleSelectionOnCompletion___block_invoke(uint64_t a1)
{
}

+ (Class)_viewClassForSettingDescription:(id)a3
{
  return (Class)objc_opt_class();
}

- (BOOL)_initiallyHidden
{
  return (unint64_t)(self->_viewState - 4) < 0xFFFFFFFFFFFFFFFDLL;
}

- (void)_updateViewState
{
  objc_initWeak(&location, self);
  viewStateCoordinator = self->_viewStateCoordinator;
  if (!viewStateCoordinator)
  {
    id v4 = objc_alloc_init(SKUISettingsFamilyViewStateCoordinator);
    unint64_t v5 = self->_viewStateCoordinator;
    self->_viewStateCoordinator = v4;

    viewStateCoordinator = self->_viewStateCoordinator;
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __48__SKUIFamilySettingDescription__updateViewState__block_invoke;
  v6[3] = &unk_1E64250D8;
  objc_copyWeak(&v7, &location);
  [(SKUISettingsFamilyViewStateCoordinator *)viewStateCoordinator checkSettingsFamilyViewStateWithBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__SKUIFamilySettingDescription__updateViewState__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __48__SKUIFamilySettingDescription__updateViewState__block_invoke_2;
  v3[3] = &unk_1E64250B0;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x1E4F14428], v3);
  objc_destroyWeak(v4);
}

void __48__SKUIFamilySettingDescription__updateViewState__block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _updateWithViewState:*(void *)(a1 + 40)];
}

- (void)_updateWithViewState:(int64_t)a3
{
  self->_viewState = a3;
  if ((unint64_t)(a3 - 1) >= 3)
  {
    if (a3)
    {
      if (a3 == -1 && ![(SKUISettingDescription *)self _isHidden])
      {
        [(SKUISettingDescription *)self _hideSetting];
      }
    }
    else
    {
      [(SKUISettingDescription *)self _deleteSetting];
    }
  }
  else
  {
    if ([(SKUISettingDescription *)self _isHidden]) {
      [(SKUISettingDescription *)self _revealSetting];
    }
    [(SKUISettingDescription *)self _reloadSetting];
  }
}

- (int64_t)viewState
{
  return self->_viewState;
}

- (void).cxx_destruct
{
}

- (void)initWithViewElement:parent:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIFamilySettingDescription initWithViewElement:parent:]";
}

@end