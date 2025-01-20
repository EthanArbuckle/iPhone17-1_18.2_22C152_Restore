@interface _PXPhotosBarButtonView
- (NSString)systemIconImageName;
- (NSString)title;
- (PXCuratedLibraryOverlayButton)button;
- (PXPhotosHeaderCustomizationModel)headerCustomizationModel;
- (PXPhotosViewModel)viewModel;
- (PXUpdater)updater;
- (SEL)action;
- (SEL)menuAction;
- (UIBarButtonItem)barButtonItem;
- (_PXPhotosBarButtonSpecManager)specManager;
- (_PXPhotosBarButtonView)initWithTitle:(id)a3 orSystemItem:(int64_t)a4 orSystemIconName:(id)a5 target:(id)a6 action:(SEL)a7 menuAction:(SEL)a8 specManager:(id)a9 viewModel:(id)a10;
- (id)_createButtonConfiguration;
- (id)changeDeliveryHandle;
- (id)target;
- (int64_t)systemItem;
- (unint64_t)extendedHitTestInsetsEdges;
- (void)_handleAction;
- (void)_handleMenuAction;
- (void)_handleWillDismissMenu;
- (void)_handleWillDisplayMenu;
- (void)_invalidateAlpha;
- (void)_invalidateButtons;
- (void)_pauseChangeDelivery;
- (void)_resumeChangeDeliveryIfPossible;
- (void)_updateAlpha;
- (void)_updateButtons;
- (void)dealloc;
- (void)layoutSubviews;
- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5;
- (void)setBarButtonItem:(id)a3;
- (void)setChangeDeliveryHandle:(id)a3;
- (void)setExtendedHitTestInsetsEdges:(unint64_t)a3;
- (void)tintColorDidChange;
@end

@implementation _PXPhotosBarButtonView

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCustomizationModel, 0);
  objc_storeStrong(&self->_changeDeliveryHandle, 0);
  objc_storeStrong((id *)&self->_updater, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
  objc_destroyWeak(&self->_target);
  objc_storeStrong((id *)&self->_systemIconImageName, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_barButtonItem);
}

- (PXPhotosHeaderCustomizationModel)headerCustomizationModel
{
  return self->_headerCustomizationModel;
}

- (void)setChangeDeliveryHandle:(id)a3
{
}

- (id)changeDeliveryHandle
{
  return self->_changeDeliveryHandle;
}

- (PXUpdater)updater
{
  return self->_updater;
}

- (PXCuratedLibraryOverlayButton)button
{
  return self->_button;
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (_PXPhotosBarButtonSpecManager)specManager
{
  return self->_specManager;
}

- (SEL)menuAction
{
  if (self->_menuAction) {
    return self->_menuAction;
  }
  else {
    return 0;
  }
}

- (SEL)action
{
  if (self->_action) {
    return self->_action;
  }
  else {
    return 0;
  }
}

- (id)target
{
  id WeakRetained = objc_loadWeakRetained(&self->_target);
  return WeakRetained;
}

- (NSString)systemIconImageName
{
  return self->_systemIconImageName;
}

- (int64_t)systemItem
{
  return self->_systemItem;
}

- (NSString)title
{
  return self->_title;
}

- (UIBarButtonItem)barButtonItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barButtonItem);
  return (UIBarButtonItem *)WeakRetained;
}

- (unint64_t)extendedHitTestInsetsEdges
{
  return self->_extendedHitTestInsetsEdges;
}

- (void)setExtendedHitTestInsetsEdges:(unint64_t)a3
{
  if (self->_extendedHitTestInsetsEdges != a3)
  {
    self->_extendedHitTestInsetsEdges = a3;
    [(_PXPhotosBarButtonView *)self setNeedsLayout];
  }
}

- (void)observable:(id)a3 didChange:(unint64_t)a4 context:(void *)a5
{
  int v6 = a4;
  id v9 = a3;
  if ((void *)SpecManagerObservationContext_260299 == a5)
  {
    if ((v6 & 1) == 0) {
      goto LABEL_11;
    }
LABEL_9:
    id v11 = v9;
    [(_PXPhotosBarButtonView *)self _invalidateButtons];
    goto LABEL_10;
  }
  if ((void *)ViewModelObservationContext_260300 == a5)
  {
    if ((v6 & 0x1000000) == 0) {
      goto LABEL_11;
    }
    goto LABEL_9;
  }
  if ((void *)HeaderCustomizationModelObservationContext_260301 != a5)
  {
    v10 = [MEMORY[0x1E4F28B00] currentHandler];
    [v10 handleFailureInMethod:a2 object:self file:@"PXPhotosBarButtonItemsController.m" lineNumber:389 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  if ((v6 & 4) != 0)
  {
    id v11 = v9;
    [(_PXPhotosBarButtonView *)self _invalidateAlpha];
LABEL_10:
    id v9 = v11;
  }
LABEL_11:
}

- (void)_updateAlpha
{
  v3 = [(_PXPhotosBarButtonView *)self headerCustomizationModel];
  id v5 = v3;
  if (v3) {
    [v3 alpha];
  }
  else {
    double v4 = 1.0;
  }
  [(_PXPhotosBarButtonView *)self setAlpha:v4];
}

- (void)_invalidateAlpha
{
  id v2 = [(_PXPhotosBarButtonView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateAlpha];
}

- (void)_updateButtons
{
  uint64_t v3 = [(_PXPhotosBarButtonView *)self _createButtonConfiguration];
  button = self->_button;
  id v7 = (id)v3;
  if (!button)
  {
    id v5 = objc_alloc_init(PXCuratedLibraryOverlayButton);
    int v6 = self->_button;
    self->_button = v5;

    uint64_t v3 = (uint64_t)v7;
    button = self->_button;
  }
  [(PXCuratedLibraryOverlayButton *)button setUserData:v3];
  [(_PXPhotosBarButtonView *)self addSubview:self->_button];
}

- (void)_invalidateButtons
{
  id v2 = [(_PXPhotosBarButtonView *)self updater];
  [v2 setNeedsUpdateOf:sel__updateButtons];
}

- (void)_resumeChangeDeliveryIfPossible
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(_PXPhotosBarButtonView *)self changeDeliveryHandle];
  if (v3)
  {
    double v4 = PLUIGetLog();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v10 = v3;
      _os_log_impl(&dword_1A9AE7000, v4, OS_LOG_TYPE_DEFAULT, "Will resume change delivery with handle: %@", buf, 0xCu);
    }

    id v5 = [(_PXPhotosBarButtonView *)self viewModel];
    int v6 = [v5 dataSourceManager];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = __57___PXPhotosBarButtonView__resumeChangeDeliveryIfPossible__block_invoke;
    v7[3] = &unk_1E5DD1458;
    id v8 = v3;
    [v6 performChanges:v7];

    [(_PXPhotosBarButtonView *)self setChangeDeliveryHandle:0];
  }
}

- (void)_pauseChangeDelivery
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  [(_PXPhotosBarButtonView *)self _resumeChangeDeliveryIfPossible];
  uint64_t v8 = 0;
  id v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = __Block_byref_object_copy__260313;
  v12 = __Block_byref_object_dispose__260314;
  id v13 = 0;
  uint64_t v3 = [(_PXPhotosBarButtonView *)self viewModel];
  double v4 = [v3 dataSourceManager];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46___PXPhotosBarButtonView__pauseChangeDelivery__block_invoke;
  v7[3] = &unk_1E5DD1368;
  void v7[4] = &v8;
  [v4 performChanges:v7];

  [(_PXPhotosBarButtonView *)self setChangeDeliveryHandle:v9[5]];
  id v5 = PLUIGetLog();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v6 = v9[5];
    *(_DWORD *)buf = 138412290;
    uint64_t v15 = v6;
    _os_log_impl(&dword_1A9AE7000, v5, OS_LOG_TYPE_DEFAULT, "Paused change delivery with handle: %@", buf, 0xCu);
  }

  _Block_object_dispose(&v8, 8);
}

- (void)_handleWillDismissMenu
{
  [(_PXPhotosBarButtonView *)self _resumeChangeDeliveryIfPossible];
  id v3 = [(_PXPhotosBarButtonView *)self viewModel];
  objc_msgSend(v3, "swift_actionMenuVisibilityChangedToVisible:", 0);
}

- (void)_handleWillDisplayMenu
{
  [(_PXPhotosBarButtonView *)self _pauseChangeDelivery];
  id v3 = [(_PXPhotosBarButtonView *)self viewModel];
  objc_msgSend(v3, "swift_actionMenuVisibilityChangedToVisible:", 1);
}

- (void)_handleMenuAction
{
  id v6 = [(_PXPhotosBarButtonView *)self barButtonItem];
  if ([v6 isEnabled] && -[_PXPhotosBarButtonView menuAction](self, "menuAction"))
  {
    id v3 = [(_PXPhotosBarButtonView *)self target];
    double v4 = [(_PXPhotosBarButtonView *)self menuAction];
    id v5 = [(_PXPhotosBarButtonView *)self button];
    [v3 performSelector:v4 withObject:v5];
  }
}

- (void)_handleAction
{
  id v4 = [(_PXPhotosBarButtonView *)self barButtonItem];
  if ([v4 isEnabled] && -[_PXPhotosBarButtonView action](self, "action"))
  {
    id v3 = [(_PXPhotosBarButtonView *)self target];
    objc_msgSend(v3, "performSelector:withObject:", -[_PXPhotosBarButtonView action](self, "action"), v4);
  }
}

- (id)_createButtonConfiguration
{
  id v4 = [(_PXPhotosBarButtonView *)self viewModel];
  id v5 = [v4 libraryFilterState];
  v25 = [(_PXPhotosBarButtonView *)self specManager];
  id v6 = [v25 spec];
  v26 = v5;
  uint64_t v7 = [v5 viewMode];
  uint64_t v8 = 1;
  if (v7 == 1) {
    uint64_t v8 = 2;
  }
  if (v7 == 2) {
    uint64_t v9 = 3;
  }
  else {
    uint64_t v9 = v8;
  }
  [v6 setVariant:v9];
  objc_msgSend(v6, "setEllipsisButtonSpecialTreatment:", objc_msgSend(v4, "allowsSwitchLibraryAction"));
  uint64_t v10 = [(_PXPhotosBarButtonView *)self title];
  uint64_t v11 = [(_PXPhotosBarButtonView *)self systemIconImageName];
  v27 = [(_PXPhotosBarButtonView *)self tintColor];
  if ([v4 requiresLightTopBars]) {
    uint64_t v12 = 0;
  }
  else {
    uint64_t v12 = 14;
  }
  id v13 = [MEMORY[0x1E4FB1618] tertiarySystemFillColor];
  v14 = [v4 selectionSnapshot];
  [v14 isAnyItemSelected];

  if (v10)
  {
    uint64_t v15 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithTitle:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithTitle:spec:", v10, v6, v11);
  }
  else if (v11)
  {
    uint64_t v15 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithSystemImageName:spec:](PXCuratedLibraryOverlayButtonConfiguration, "configurationWithSystemImageName:spec:", v11, v6, v11);
  }
  else
  {
    switch([(_PXPhotosBarButtonView *)self systemItem])
    {
      case 0:
        v23 = [MEMORY[0x1E4F28B00] currentHandler];
        [v23 handleFailureInMethod:a2 object:self file:@"PXPhotosBarButtonItemsController.m" lineNumber:232 description:@"Code which should be unreachable has been reached"];

        abort();
      case 1:
        if ([v26 isFiltering])
        {

          v27 = 0;
          uint64_t v16 = 1;
          uint64_t v12 = 13;
        }
        else
        {
          uint64_t v16 = 1;
        }
        break;
      case 2:
      case 4:
        uint64_t v12 = 2;
        uint64_t v16 = 2;
        break;
      case 3:
        uint64_t v16 = 3;
        break;
      default:
        uint64_t v16 = 0;
        break;
    }
    uint64_t v15 = +[PXCuratedLibraryOverlayButtonConfiguration configurationWithButtonType:v16 spec:v6];
  }
  v17 = (void *)v15;
  objc_initWeak(location, self);
  v18 = [(_PXPhotosBarButtonView *)self barButtonItem];
  if ([v18 isEnabled])
  {
    v19 = [(_PXPhotosBarButtonView *)self action];

    if (v19)
    {
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke;
      v34[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v35, location);
      [v17 setActionHandler:v34];
      objc_destroyWeak(&v35);
      goto LABEL_26;
    }
  }
  else
  {
  }
  [v17 setActionHandler:0];
LABEL_26:
  v20 = [(_PXPhotosBarButtonView *)self barButtonItem];
  if ([v20 isEnabled])
  {
    v21 = [(_PXPhotosBarButtonView *)self menuAction];

    if (v21)
    {
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_2;
      v32[3] = &unk_1E5DD32D0;
      objc_copyWeak(&v33, location);
      [v17 setMenuActionHandler:v32];
      objc_destroyWeak(&v33);
      goto LABEL_31;
    }
  }
  else
  {
  }
  [v17 setMenuActionHandler:0];
LABEL_31:
  [v17 setTintColor:v27];
  [v17 setStyle:v12];
  [v17 setBackgroundColor:v13];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_3;
  v30[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v31, location);
  [v17 setWillDisplayMenuActionHandler:v30];
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = __52___PXPhotosBarButtonView__createButtonConfiguration__block_invoke_4;
  v28[3] = &unk_1E5DD32D0;
  objc_copyWeak(&v29, location);
  [v17 setWillDismissMenuActionHandler:v28];
  objc_destroyWeak(&v29);
  objc_destroyWeak(&v31);
  objc_destroyWeak(location);

  return v17;
}

- (void)setBarButtonItem:(id)a3
{
  id obj = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_barButtonItem);

  id v5 = obj;
  if (WeakRetained != obj)
  {
    objc_storeWeak((id *)&self->_barButtonItem, obj);
    [(_PXPhotosBarButtonView *)self _invalidateButtons];
    id v5 = obj;
  }
}

- (void)tintColorDidChange
{
  v3.receiver = self;
  v3.super_class = (Class)_PXPhotosBarButtonView;
  [(_PXPhotosBarButtonView *)&v3 tintColorDidChange];
  [(_PXPhotosBarButtonView *)self _invalidateButtons];
}

- (void)layoutSubviews
{
  objc_super v3 = [(_PXPhotosBarButtonView *)self updater];
  [v3 updateIfNeeded];

  id v4 = [(_PXPhotosBarButtonView *)self button];
  [(_PXPhotosBarButtonView *)self bounds];
  objc_msgSend(v4, "setFrame:");
  objc_msgSend(v4, "setExtendedHitTestInsetsEdges:", -[_PXPhotosBarButtonView extendedHitTestInsetsEdges](self, "extendedHitTestInsetsEdges"));
  [v4 updateHitTestInsets];
  [v4 hitTestInsets];
  -[_PXPhotosBarButtonView setHitTestInsets:](self, "setHitTestInsets:");
  id v5 = [(_PXPhotosBarButtonView *)self superview];
  if (layoutSubviews_onceToken != -1) {
    dispatch_once(&layoutSubviews_onceToken, &__block_literal_global_260323);
  }
  if (layoutSubviews_adaptorClass)
  {
    if (v5)
    {
      [v5 hitTestInsets];
      double v7 = v6;
      double v9 = v8;
      double v11 = v10;
      double v13 = v12;
      [v4 hitTestInsets];
      if (v9 != v17 || v7 != v14 || v13 != v16 || v11 != v15) && (objc_opt_isKindOfClass())
      {
        [v4 hitTestInsets];
        objc_msgSend(v5, "setHitTestInsets:");
      }
    }
  }
  v18.receiver = self;
  v18.super_class = (Class)_PXPhotosBarButtonView;
  [(_PXPhotosBarButtonView *)&v18 layoutSubviews];
}

- (void)dealloc
{
  [(_PXPhotosBarButtonView *)self _resumeChangeDeliveryIfPossible];
  v3.receiver = self;
  v3.super_class = (Class)_PXPhotosBarButtonView;
  [(_PXPhotosBarButtonView *)&v3 dealloc];
}

- (_PXPhotosBarButtonView)initWithTitle:(id)a3 orSystemItem:(int64_t)a4 orSystemIconName:(id)a5 target:(id)a6 action:(SEL)a7 menuAction:(SEL)a8 specManager:(id)a9 viewModel:(id)a10
{
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v37 = a9;
  id v19 = a10;
  v38.receiver = self;
  v38.super_class = (Class)_PXPhotosBarButtonView;
  v20 = [(_PXPhotosBarButtonView *)&v38 init];
  if (v20)
  {
    uint64_t v21 = [v16 copy];
    title = v20->_title;
    v20->_title = (NSString *)v21;

    v20->_systemItem = a4;
    uint64_t v23 = [v17 copy];
    systemIconImageName = v20->_systemIconImageName;
    v20->_systemIconImageName = (NSString *)v23;

    objc_storeWeak(&v20->_target, v18);
    if (a7) {
      SEL v25 = a7;
    }
    else {
      SEL v25 = 0;
    }
    v20->_action = v25;
    if (a8) {
      SEL v26 = a8;
    }
    else {
      SEL v26 = 0;
    }
    v20->_menuAction = v26;
    objc_storeStrong((id *)&v20->_specManager, a9);
    [(_PXPhotosBarButtonSpecManager *)v20->_specManager registerChangeObserver:v20 context:SpecManagerObservationContext_260299];
    objc_storeStrong((id *)&v20->_viewModel, a10);
    [(PXPhotosViewModel *)v20->_viewModel registerChangeObserver:v20 context:ViewModelObservationContext_260300];
    uint64_t v27 = [v19 headerCustomizationModel];
    headerCustomizationModel = v20->_headerCustomizationModel;
    v20->_headerCustomizationModel = (PXPhotosHeaderCustomizationModel *)v27;

    [(PXPhotosHeaderCustomizationModel *)v20->_headerCustomizationModel registerChangeObserver:v20 context:HeaderCustomizationModelObservationContext_260301];
    id v29 = [(_PXPhotosBarButtonView *)v20 _createButtonConfiguration];
    +[PXCuratedLibraryOverlayButton sizeWithConfiguration:v29];
    double v31 = v30;
    double v33 = v32;

    -[_PXPhotosBarButtonView setFrame:](v20, "setFrame:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8), v31, v33);
    uint64_t v34 = [objc_alloc((Class)off_1E5DA9778) initWithTarget:v20 needsUpdateSelector:sel_setNeedsLayout];
    updater = v20->_updater;
    v20->_updater = (PXUpdater *)v34;

    [(PXUpdater *)v20->_updater addUpdateSelector:sel__updateButtons needsUpdate:1];
    [(PXUpdater *)v20->_updater addUpdateSelector:sel__updateAlpha needsUpdate:1];
  }

  return v20;
}

@end