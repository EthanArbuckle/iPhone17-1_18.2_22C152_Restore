@interface PKContactPicker
- (PKContactPicker)initWithSelectionHandler:(id)a3 cancelationHandler:(id)a4;
- (UIViewController)pickerViewController;
- (id)cancelationHandler;
- (id)selectionHandler;
- (void)contactPicker:(id)a3 didSelectContact:(id)a4;
- (void)contactPickerDidCancel:(id)a3;
- (void)setCancelationHandler:(id)a3;
- (void)setPickerViewController:(id)a3;
- (void)setSelectionHandler:(id)a3;
@end

@implementation PKContactPicker

- (PKContactPicker)initWithSelectionHandler:(id)a3 cancelationHandler:(id)a4
{
  v20[4] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v19.receiver = self;
  v19.super_class = (Class)PKContactPicker;
  v8 = [(PKContactPicker *)&v19 init];
  if (v8)
  {
    v9 = _Block_copy(v6);
    id selectionHandler = v8->_selectionHandler;
    v8->_id selectionHandler = v9;

    v11 = _Block_copy(v7);
    id cancelationHandler = v8->_cancelationHandler;
    v8->_id cancelationHandler = v11;

    v13 = (UIViewController *)objc_alloc_init(MEMORY[0x1E4F1BB80]);
    [(UIViewController *)v13 setShouldDisplaySuggestionsController:1];
    [(UIViewController *)v13 setAllowsEditing:1];
    [(UIViewController *)v13 setDelegate:v8];
    uint64_t v14 = *MEMORY[0x1E4F1ADC8];
    v20[0] = *MEMORY[0x1E4F1AEE0];
    v20[1] = v14;
    uint64_t v15 = *MEMORY[0x1E4F1AEC0];
    v20[2] = *MEMORY[0x1E4F1ADF0];
    v20[3] = v15;
    v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:4];
    [(UIViewController *)v13 setDisplayedPropertyKeys:v16];

    pickerViewController = v8->_pickerViewController;
    v8->_pickerViewController = v13;
  }
  return v8;
}

- (void)contactPickerDidCancel:(id)a3
{
  id cancelationHandler = (void (**)(void))self->_cancelationHandler;
  if (cancelationHandler) {
    cancelationHandler[2]();
  }
}

- (void)contactPicker:(id)a3 didSelectContact:(id)a4
{
  if (self->_selectionHandler)
  {
    v5 = (objc_class *)MEMORY[0x1E4F845D0];
    id v6 = a4;
    id v7 = (id)[[v5 alloc] initWithCNContact:v6];

    (*((void (**)(void))self->_selectionHandler + 2))();
  }
}

- (UIViewController)pickerViewController
{
  return self->_pickerViewController;
}

- (void)setPickerViewController:(id)a3
{
}

- (id)selectionHandler
{
  return self->_selectionHandler;
}

- (void)setSelectionHandler:(id)a3
{
}

- (id)cancelationHandler
{
  return self->_cancelationHandler;
}

- (void)setCancelationHandler:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelationHandler, 0);
  objc_storeStrong(&self->_selectionHandler, 0);

  objc_storeStrong((id *)&self->_pickerViewController, 0);
}

@end