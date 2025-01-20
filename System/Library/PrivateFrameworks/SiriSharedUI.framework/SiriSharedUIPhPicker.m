@interface SiriSharedUIPhPicker
- (id)completionHandler;
- (void)_dismissWithAnimation:(BOOL)a3;
- (void)dismissPhotoPickerIfExistsWithAnimation:(BOOL)a3;
- (void)picker:(id)a3 didFinishPicking:(id)a4;
- (void)presentPhotoPicker:(id)a3 withSearchString:(id)a4 completion:(id)a5;
- (void)setCompletionHandler:(id)a3;
@end

@implementation SiriSharedUIPhPicker

- (void)presentPhotoPicker:(id)a3 withSearchString:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (self->_pickerViewController
    && ([v8 presentedViewController],
        v11 = (PHPickerViewController *)objc_claimAutoreleasedReturnValue(),
        v12 = self->_pickerViewController,
        v11,
        v11 == v12))
  {
    [(PHPickerViewController *)self->_pickerViewController _searchWithString:v9];
  }
  else
  {
    id v13 = objc_alloc_init(MEMORY[0x263F15210]);
    [v13 setSelectionLimit:0];
    v14 = (PHPickerViewController *)[objc_alloc(MEMORY[0x263F15220]) initWithConfiguration:v13];
    pickerViewController = self->_pickerViewController;
    self->_pickerViewController = v14;

    [(PHPickerViewController *)self->_pickerViewController setDelegate:self];
    v16 = _Block_copy(v10);
    id completionHandler = self->_completionHandler;
    self->_id completionHandler = v16;

    objc_initWeak(&location, self);
    v18 = self->_pickerViewController;
    v19[0] = MEMORY[0x263EF8330];
    v19[1] = 3221225472;
    v19[2] = __71__SiriSharedUIPhPicker_presentPhotoPicker_withSearchString_completion___block_invoke;
    v19[3] = &unk_2640E3698;
    objc_copyWeak(&v21, &location);
    id v20 = v9;
    [v8 presentViewController:v18 animated:1 completion:v19];

    objc_destroyWeak(&v21);
    objc_destroyWeak(&location);
  }
}

uint64_t __71__SiriSharedUIPhPicker_presentPhotoPicker_withSearchString_completion___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    WeakRetained = *(id **)(a1 + 32);
    if (WeakRetained)
    {
      v5 = v3;
      WeakRetained = (id *)[WeakRetained length];
      v3 = v5;
      if (WeakRetained)
      {
        WeakRetained = (id *)[v5[1] _searchWithString:*(void *)(a1 + 32)];
        v3 = v5;
      }
    }
  }
  return MEMORY[0x270F9A758](WeakRetained, v3);
}

- (void)dismissPhotoPickerIfExistsWithAnimation:(BOOL)a3
{
  if (self->_pickerViewController) {
    [(SiriSharedUIPhPicker *)self _dismissWithAnimation:a3];
  }
}

- (void)_dismissWithAnimation:(BOOL)a3
{
  [(PHPickerViewController *)self->_pickerViewController dismissViewControllerAnimated:a3 completion:0];
  pickerViewController = self->_pickerViewController;
  self->_pickerViewController = 0;
}

- (void)picker:(id)a3 didFinishPicking:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v5 = a4;
  v6 = [(SiriSharedUIPhPicker *)self completionHandler];

  if (v6)
  {
    v7 = objc_opt_new();
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * v12), "itemProvider", (void)v15);
          [v7 addObject:v13];

          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }

    v14 = [(SiriSharedUIPhPicker *)self completionHandler];
    ((void (**)(void, void *))v14)[2](v14, v7);
  }
  -[SiriSharedUIPhPicker _dismissWithAnimation:](self, "_dismissWithAnimation:", 1, (void)v15);
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_pickerViewController, 0);
}

@end