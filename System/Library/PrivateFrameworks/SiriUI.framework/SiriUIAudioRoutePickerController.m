@interface SiriUIAudioRoutePickerController
+ (id)_nameForRouteInfo:(id)a3 isSelected:(BOOL *)a4 isBluetooth:(BOOL *)a5 isOverride:(BOOL *)a6 audioRouteName:(id *)a7;
- (BOOL)bluetoothIsPicked;
- (BOOL)hasRoutesToPick;
- (BOOL)isShowingPicker;
- (SiriRoutePickerAlertController)pickerAlertController;
- (SiriUIAudioRoutePickerController)initWithCategory:(id)a3 mode:(id)a4 delegate:(id)a5;
- (SiriUIAudioRoutePickerControllerDelegate)delegate;
- (void)_dismissAlertController:(BOOL)a3;
- (void)_fetchPickableRoutesWithCompletion:(id)a3;
- (void)_pickableRoutesChanged:(id)a3;
- (void)_removeWindow;
- (void)_selectRouteWithInfo:(id)a3;
- (void)_showAlertControllerFromViewController:(id)a3 animated:(BOOL)a4;
- (void)dealloc;
- (void)refreshRoutes;
- (void)setDelegate:(id)a3;
- (void)setPickerAlertController:(id)a3;
- (void)showPickerFromViewController:(id)a3 animated:(BOOL)a4;
@end

@implementation SiriUIAudioRoutePickerController

- (void)dealloc
{
  v3 = [MEMORY[0x263F08A00] defaultCenter];
  [v3 removeObserver:self];

  v4.receiver = self;
  v4.super_class = (Class)SiriUIAudioRoutePickerController;
  [(SiriUIAudioRoutePickerController *)&v4 dealloc];
}

- (SiriUIAudioRoutePickerController)initWithCategory:(id)a3 mode:(id)a4 delegate:(id)a5
{
  v28[2] = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v27.receiver = self;
  v27.super_class = (Class)SiriUIAudioRoutePickerController;
  v11 = [(SiriUIAudioRoutePickerController *)&v27 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    uint64_t v13 = [v8 copy];
    audioCategory = v12->_audioCategory;
    v12->_audioCategory = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    audioMode = v12->_audioMode;
    v12->_audioMode = (NSString *)v15;

    v17 = [MEMORY[0x263F544E0] sharedAVSystemController];
    v18 = (uint64_t *)MEMORY[0x263F543F0];
    uint64_t v19 = *MEMORY[0x263F54308];
    v28[0] = *MEMORY[0x263F543F0];
    v28[1] = v19;
    v20 = [MEMORY[0x263EFF8C0] arrayWithObjects:v28 count:2];
    [v17 setAttribute:v20 forKey:*MEMORY[0x263F544A0] error:0];
    v21 = [MEMORY[0x263F08A00] defaultCenter];
    uint64_t v22 = *v18;
    v23 = [MEMORY[0x263F544E0] sharedAVSystemController];
    [v21 addObserver:v12 selector:sel__pickableRoutesChanged_ name:v22 object:v23];

    uint64_t v24 = *MEMORY[0x263F54308];
    v25 = [MEMORY[0x263F544E0] sharedAVSystemController];
    [v21 addObserver:v12 selector:sel__routeChanged_ name:v24 object:v25];

    [(SiriUIAudioRoutePickerController *)v12 refreshRoutes];
  }

  return v12;
}

- (void)_fetchPickableRoutesWithCompletion:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5 = dispatch_get_global_queue(21, 0);
  v7[0] = MEMORY[0x263EF8330];
  v7[1] = 3221225472;
  v7[2] = __71__SiriUIAudioRoutePickerController__fetchPickableRoutesWithCompletion___block_invoke;
  v7[3] = &unk_26469FA58;
  objc_copyWeak(&v9, &location);
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

void __71__SiriUIAudioRoutePickerController__fetchPickableRoutesWithCompletion___block_invoke(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x263EF8340];
  v2 = (id *)(a1 + 48);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    from = v2;
    id v4 = [MEMORY[0x263F544E0] sharedAVSystemController];
    uint64_t v19 = a1;
    v5 = [v4 pickableRoutesForCategory:*(void *)(*(void *)(a1 + 32) + 16) andMode:*(void *)(*(void *)(a1 + 32) + 24)];

    v20 = objc_msgSend(objc_alloc(MEMORY[0x263EFF980]), "initWithCapacity:", objc_msgSend(v5, "count"));
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      char v9 = 0;
      BOOL v10 = 0;
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v6);
          }
          uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * i);
          __int16 v29 = 0;
          char v28 = 0;
          v14 = objc_opt_class();
          id v27 = 0;
          id v15 = (id)[v14 _nameForRouteInfo:v13 isSelected:(char *)&v29 + 1 isBluetooth:&v29 isOverride:&v28 audioRouteName:&v27];
          id v16 = v27;
          v17 = v16;
          if (!v28 && ([v16 isEqualToString:@"AirTunes"] & 1) == 0)
          {
            if (HIBYTE(v29)) {
              BOOL v10 = (_BYTE)v29 != 0;
            }
            v9 |= (_BYTE)v29 != 0;
            [v20 addObject:v13];
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v30 objects:v34 count:16];
      }
      while (v8);
    }
    else
    {
      char v9 = 0;
      BOOL v10 = 0;
    }

    if (*(void *)(v19 + 40))
    {
      block[0] = MEMORY[0x263EF8330];
      block[1] = 3221225472;
      block[2] = __71__SiriUIAudioRoutePickerController__fetchPickableRoutesWithCompletion___block_invoke_2;
      block[3] = &unk_26469FA30;
      objc_copyWeak(&v24, from);
      id v23 = *(id *)(v19 + 40);
      id v22 = v20;
      char v25 = v9 & 1;
      BOOL v26 = v10;
      dispatch_async(MEMORY[0x263EF83A0], block);

      objc_destroyWeak(&v24);
    }
  }
}

void __71__SiriUIAudioRoutePickerController__fetchPickableRoutesWithCompletion___block_invoke_2(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  if (WeakRetained)
  {
    id v3 = WeakRetained;
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
    id WeakRetained = v3;
  }
}

- (BOOL)hasRoutesToPick
{
  return self->_hasRoutesToPick;
}

- (BOOL)bluetoothIsPicked
{
  return self->_bluetoothIsPicked;
}

- (void)showPickerFromViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  p_delegate = &self->_delegate;
  id v8 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  [WeakRetained routePickerControllerWillShow:self];

  [(SiriUIAudioRoutePickerController *)self _showAlertControllerFromViewController:v8 animated:v4];
}

- (void)_showAlertControllerFromViewController:(id)a3 animated:(BOOL)a4
{
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x263F1CB68]);
  uint64_t v7 = [SiriRoutePickerAlertWindow alloc];
  id v8 = [MEMORY[0x263F1C920] mainScreen];
  [v8 bounds];
  char v9 = -[SiriRoutePickerAlertWindow initWithFrame:](v7, "initWithFrame:");
  window = self->_window;
  self->_window = v9;

  [(UIWindow *)self->_window setRootViewController:v6];
  [(UIWindow *)self->_window setHidden:0];
  uint64_t v11 = [v5 view];
  v12 = [v11 window];
  [v12 windowLevel];
  [(UIWindow *)self->_window setWindowLevel:v13 + 1.0];

  v14 = [MEMORY[0x263F086E0] bundleWithIdentifier:@"com.apple.SiriUI"];
  id v15 = +[SiriRoutePickerAlertController alertControllerWithTitle:0 message:0 preferredStyle:0];
  pickerAlertController = self->_pickerAlertController;
  self->_pickerAlertController = v15;

  objc_initWeak(&location, self);
  v19[0] = MEMORY[0x263EF8330];
  v19[1] = 3221225472;
  v19[2] = __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke;
  v19[3] = &unk_26469FAD0;
  objc_copyWeak(&v22, &location);
  v19[4] = self;
  id v17 = v14;
  id v20 = v17;
  id v18 = v6;
  id v21 = v18;
  [(SiriUIAudioRoutePickerController *)self _fetchPickableRoutesWithCompletion:v19];

  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);
}

void __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v21 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 56));
  if (WeakRetained)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v21;
    uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v3)
    {
      uint64_t v4 = *(void *)v30;
      do
      {
        uint64_t v5 = 0;
        do
        {
          if (*(void *)v30 != v4) {
            objc_enumerationMutation(obj);
          }
          uint64_t v6 = *(void *)(*((void *)&v29 + 1) + 8 * v5);
          unsigned __int8 v28 = 0;
          uint64_t v7 = [(id)objc_opt_class() _nameForRouteInfo:v6 isSelected:&v28 isBluetooth:0 isOverride:0 audioRouteName:0];
          id v8 = (void *)MEMORY[0x263F1C3F0];
          v26[0] = MEMORY[0x263EF8330];
          v26[1] = 3221225472;
          v26[2] = __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_2;
          v26[3] = &unk_26469FA80;
          objc_copyWeak(&v27, (id *)(a1 + 56));
          v26[4] = v6;
          char v9 = [v8 actionWithTitle:v7 style:0 handler:v26];
          [v9 _setChecked:v28];
          BOOL v10 = [WeakRetained pickerAlertController];
          [v10 addAction:v9];

          objc_destroyWeak(&v27);
          ++v5;
        }
        while (v3 != v5);
        uint64_t v3 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v3);
    }

    uint64_t v11 = [*(id *)(a1 + 40) localizedStringForKey:@"SIRI_ROUTE_PICKER_CANCEL_BUTTON_TITLE" value:0 table:0];
    v12 = (void *)MEMORY[0x263F1C3F0];
    v24[0] = MEMORY[0x263EF8330];
    v24[1] = 3221225472;
    v24[2] = __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_4;
    v24[3] = &unk_26469FAA8;
    objc_copyWeak(&v25, (id *)(a1 + 56));
    double v13 = [v12 actionWithTitle:v11 style:1 handler:v24];
    v14 = [WeakRetained pickerAlertController];
    [v14 addAction:v13];

    id v15 = *(void **)(a1 + 48);
    id v16 = [WeakRetained pickerAlertController];
    [v15 presentViewController:v16 animated:1 completion:0];

    id v17 = [WeakRetained pickerAlertController];
    id v18 = [v17 popoverPresentationController];

    [v18 setPermittedArrowDirections:0];
    [v18 setSourceView:WeakRetained[4]];
    [WeakRetained[4] bounds];
    objc_msgSend(v18, "setSourceRect:", v19 * 0.5, v20 * 0.5, 1.0, 1.0);

    objc_destroyWeak(&v25);
  }
}

void __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_2(uint64_t a1)
{
  v2[0] = MEMORY[0x263EF8330];
  v2[1] = 3221225472;
  v2[2] = __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_3;
  v2[3] = &unk_26469F0D0;
  objc_copyWeak(&v3, (id *)(a1 + 40));
  v2[4] = *(void *)(a1 + 32);
  dispatch_async(MEMORY[0x263EF83A0], v2);
  objc_destroyWeak(&v3);
}

void __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_3(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  [WeakRetained _selectRouteWithInfo:*(void *)(a1 + 32)];
  [WeakRetained _dismissAlertController:1];
}

void __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_4(uint64_t a1)
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_5;
  block[3] = &unk_26469F1D0;
  objc_copyWeak(&v2, (id *)(a1 + 32));
  dispatch_async(MEMORY[0x263EF83A0], block);
  objc_destroyWeak(&v2);
}

void __84__SiriUIAudioRoutePickerController__showAlertControllerFromViewController_animated___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _dismissAlertController:1];
}

+ (id)_nameForRouteInfo:(id)a3 isSelected:(BOOL *)a4 isBluetooth:(BOOL *)a5 isOverride:(BOOL *)a6 audioRouteName:(id *)a7
{
  id v11 = a3;
  v12 = (void *)MEMORY[0x263F54458];
  double v13 = [v11 objectForKey:*MEMORY[0x263F54458]];
  int v14 = [v13 isEqualToString:*MEMORY[0x263F543D8]];
  id v15 = [v11 objectForKey:*MEMORY[0x263F54420]];
  char v16 = [v15 isEqualToString:@"Speaker"];
  if (!v14 || (v16 & 1) == 0)
  {
    id v18 = [v11 objectForKey:*MEMORY[0x263F54448]];
    if (!a4) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  id v17 = [MEMORY[0x263F1C5C0] currentDevice];
  id v18 = [v17 localizedModel];

  if (a4)
  {
LABEL_6:
    double v19 = [v11 objectForKey:*MEMORY[0x263F54440]];
    *a4 = [v19 BOOLValue];
  }
LABEL_7:
  if ((unint64_t)a5 | (unint64_t)a6)
  {
    double v20 = [v11 objectForKey:*v12];
    id v21 = v20;
    if (a5) {
      *a5 = [v20 isEqualToString:*MEMORY[0x263F543E8]];
    }
    if (a6) {
      *a6 = [v21 isEqualToString:*MEMORY[0x263F543E0]];
    }
  }
  if (a7) {
    *a7 = v15;
  }

  return v18;
}

- (void)_selectRouteWithInfo:(id)a3
{
  id v3 = a3;
  ADClientAddValueForScalarKey();
  uint64_t v4 = [MEMORY[0x263F544E0] sharedAVSystemController];
  uint64_t v5 = *MEMORY[0x263F543F8];
  id v9 = 0;
  char v6 = [v4 setAttribute:v3 forKey:v5 error:&v9];

  id v7 = v9;
  if ((v6 & 1) == 0)
  {
    id v8 = *MEMORY[0x263F28348];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x263F28348], OS_LOG_TYPE_ERROR)) {
      -[SiriUIAudioRoutePickerController _selectRouteWithInfo:]((uint64_t)v7, v8);
    }
  }
}

- (void)_dismissAlertController:(BOOL)a3
{
  BOOL v3 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  [WeakRetained routePickerControllerWillDismiss:self];

  [(SiriRoutePickerAlertController *)self->_pickerAlertController dismissViewControllerAnimated:v3 completion:0];
  [(SiriUIAudioRoutePickerController *)self _removeWindow];
}

- (void)_removeWindow
{
  [(UIWindow *)self->_window setHidden:1];
  [(UIWindow *)self->_window setRootViewController:0];
  window = self->_window;
  self->_window = 0;
}

- (BOOL)isShowingPicker
{
  id v2 = [(SiriRoutePickerAlertController *)self->_pickerAlertController presentingViewController];
  BOOL v3 = v2 != 0;

  return v3;
}

- (void)refreshRoutes
{
}

- (void)_pickableRoutesChanged:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __59__SiriUIAudioRoutePickerController__pickableRoutesChanged___block_invoke;
  v5[3] = &unk_26469FAF8;
  objc_copyWeak(&v6, &location);
  [(SiriUIAudioRoutePickerController *)self _fetchPickableRoutesWithCompletion:v5];
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

uint64_t __59__SiriUIAudioRoutePickerController__pickableRoutesChanged___block_invoke(uint64_t a1, uint64_t a2, unsigned __int8 a3, unsigned __int8 a4)
{
  id WeakRetained = (unsigned __int8 *)objc_loadWeakRetained((id *)(a1 + 32));
  id v7 = WeakRetained;
  if (WeakRetained)
  {
    double v13 = WeakRetained;
    if ((a3 & 1) == 0)
    {
      int v8 = [WeakRetained isShowingPicker];
      id v7 = v13;
      if (v8)
      {
        [v13 cancelPickerAnimated:1];
        id v7 = v13;
      }
    }
    v7[40] = a3;
    v7[41] = a4;
    id v9 = (id *)(v7 + 8);
    id v10 = objc_loadWeakRetained((id *)v7 + 1);
    [v10 routePickerController:v13 hasRoutesToPick:v13[40]];

    id v11 = objc_loadWeakRetained(v9);
    [v11 routePickerControllerPickedNewRoute:v13 isBluetooth:v13[41]];

    id v7 = v13;
  }
  return MEMORY[0x270F9A758](WeakRetained, v7);
}

- (SiriUIAudioRoutePickerControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriUIAudioRoutePickerControllerDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (SiriRoutePickerAlertController)pickerAlertController
{
  return self->_pickerAlertController;
}

- (void)setPickerAlertController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_pickerAlertController, 0);
  objc_storeStrong((id *)&self->_window, 0);
  objc_storeStrong((id *)&self->_audioMode, 0);
  objc_storeStrong((id *)&self->_audioCategory, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

- (void)_selectRouteWithInfo:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v6 = *MEMORY[0x263EF8340];
  int v2 = 136315394;
  BOOL v3 = "-[SiriUIAudioRoutePickerController _selectRouteWithInfo:]";
  __int16 v4 = 2114;
  uint64_t v5 = a1;
  _os_log_error_impl(&dword_2231EF000, a2, OS_LOG_TYPE_ERROR, "%s Failed picking route %{public}@", (uint8_t *)&v2, 0x16u);
}

@end