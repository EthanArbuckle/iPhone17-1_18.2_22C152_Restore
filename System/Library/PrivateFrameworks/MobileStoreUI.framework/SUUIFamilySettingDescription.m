@interface SUUIFamilySettingDescription
+ (Class)_viewClassForSettingDescription:(id)a3;
- (BOOL)_initiallyHidden;
- (SUUIFamilySettingDescription)initWithViewElement:(id)a3 parent:(id)a4;
- (int64_t)viewState;
- (void)_updateViewState;
- (void)_updateWithViewState:(int64_t)a3;
- (void)handleSelectionOnCompletion:(id)a3;
@end

@implementation SUUIFamilySettingDescription

- (SUUIFamilySettingDescription)initWithViewElement:(id)a3 parent:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)SUUIFamilySettingDescription;
  v4 = [(SUUISettingDescription *)&v7 initWithViewElement:a3 parent:a4];
  v5 = v4;
  if (v4)
  {
    v4->_viewState = -1;
    [(SUUIFamilySettingDescription *)v4 _updateViewState];
  }
  return v5;
}

- (void)handleSelectionOnCompletion:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_viewState + 1;
  if (v5 > 3) {
    v6 = @"complete";
  }
  else {
    v6 = off_265402090[v5];
  }
  objc_super v7 = objc_msgSend(objc_alloc(NSDictionary), "initWithObjectsAndKeys:", v6, @"state", 0);
  v8 = [(SUUISettingDescription *)self viewElement];
  v10[0] = MEMORY[0x263EF8330];
  v10[1] = 3221225472;
  v10[2] = __60__SUUIFamilySettingDescription_handleSelectionOnCompletion___block_invoke;
  v10[3] = &unk_265402020;
  id v11 = v4;
  id v9 = v4;
  [v8 dispatchEventOfType:2 canBubble:1 isCancelable:1 extraInfo:v7 completionBlock:v10];
}

void __60__SUUIFamilySettingDescription_handleSelectionOnCompletion___block_invoke(uint64_t a1)
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
    id v4 = objc_alloc_init(SUUISettingsFamilyViewStateCoordinator);
    unint64_t v5 = self->_viewStateCoordinator;
    self->_viewStateCoordinator = v4;

    viewStateCoordinator = self->_viewStateCoordinator;
  }
  v6[0] = MEMORY[0x263EF8330];
  v6[1] = 3221225472;
  v6[2] = __48__SUUIFamilySettingDescription__updateViewState__block_invoke;
  v6[3] = &unk_265402070;
  objc_copyWeak(&v7, &location);
  [(SUUISettingsFamilyViewStateCoordinator *)viewStateCoordinator checkSettingsFamilyViewStateWithBlock:v6];
  objc_destroyWeak(&v7);
  objc_destroyWeak(&location);
}

void __48__SUUIFamilySettingDescription__updateViewState__block_invoke(uint64_t a1, void *a2)
{
  v3[0] = MEMORY[0x263EF8330];
  v3[1] = 3221225472;
  v3[2] = __48__SUUIFamilySettingDescription__updateViewState__block_invoke_2;
  v3[3] = &unk_265402048;
  objc_copyWeak(v4, (id *)(a1 + 32));
  v4[1] = a2;
  dispatch_async(MEMORY[0x263EF83A0], v3);
  objc_destroyWeak(v4);
}

void __48__SUUIFamilySettingDescription__updateViewState__block_invoke_2(uint64_t a1)
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
      if (a3 == -1 && ![(SUUISettingDescription *)self _isHidden])
      {
        [(SUUISettingDescription *)self _hideSetting];
      }
    }
    else
    {
      [(SUUISettingDescription *)self _deleteSetting];
    }
  }
  else
  {
    if ([(SUUISettingDescription *)self _isHidden]) {
      [(SUUISettingDescription *)self _revealSetting];
    }
    [(SUUISettingDescription *)self _reloadSetting];
  }
}

- (int64_t)viewState
{
  return self->_viewState;
}

- (void).cxx_destruct
{
}

@end