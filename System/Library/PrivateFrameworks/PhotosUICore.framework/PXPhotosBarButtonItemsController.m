@interface PXPhotosBarButtonItemsController
- (PXPhotosBarButtonItemsController)init;
- (PXPhotosBarButtonItemsController)initWithExtendedTraitCollection:(id)a3 viewModel:(id)a4;
- (PXPhotosViewModel)viewModel;
- (_PXPhotosBarButtonSpecManager)specManager;
- (id)_createBarButtonItemWithTitle:(id)a3 orSystemItem:(int64_t)a4 orSystemIconName:(id)a5 target:(id)a6 action:(SEL)a7 menuAction:(SEL)a8;
- (id)createBarButtonItemWithSystemIconName:(id)a3 target:(id)a4 action:(SEL)a5 menuAction:(SEL)a6;
- (id)createBarButtonItemWithSystemItem:(int64_t)a3 target:(id)a4 action:(SEL)a5 menuAction:(SEL)a6;
- (id)createBarButtonItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5 menuAction:(SEL)a6;
- (id)createStandardBackButtonWithTarget:(id)a3 action:(SEL)a4;
@end

@implementation PXPhotosBarButtonItemsController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_specManager, 0);
}

- (PXPhotosViewModel)viewModel
{
  return self->_viewModel;
}

- (_PXPhotosBarButtonSpecManager)specManager
{
  return self->_specManager;
}

- (id)_createBarButtonItemWithTitle:(id)a3 orSystemItem:(int64_t)a4 orSystemIconName:(id)a5 target:(id)a6 action:(SEL)a7 menuAction:(SEL)a8
{
  id v14 = a6;
  id v15 = a5;
  id v16 = a3;
  v17 = [_PXPhotosBarButtonView alloc];
  v18 = [(PXPhotosBarButtonItemsController *)self specManager];
  v19 = [(PXPhotosBarButtonItemsController *)self viewModel];
  v20 = [(_PXPhotosBarButtonView *)v17 initWithTitle:v16 orSystemItem:a4 orSystemIconName:v15 target:v14 action:a7 menuAction:a8 specManager:v18 viewModel:v19];

  v21 = (void *)[objc_alloc(MEMORY[0x1E4FB14A8]) initWithCustomView:v20];
  [(_PXPhotosBarButtonView *)v20 setBarButtonItem:v21];

  return v21;
}

- (id)createStandardBackButtonWithTarget:(id)a3 action:(SEL)a4
{
  return [(PXPhotosBarButtonItemsController *)self _createBarButtonItemWithTitle:0 orSystemItem:0 orSystemIconName:@"chevron.backward" target:a3 action:a4 menuAction:0];
}

- (id)createBarButtonItemWithSystemIconName:(id)a3 target:(id)a4 action:(SEL)a5 menuAction:(SEL)a6
{
  return [(PXPhotosBarButtonItemsController *)self _createBarButtonItemWithTitle:0 orSystemItem:0 orSystemIconName:a3 target:a4 action:a5 menuAction:a6];
}

- (id)createBarButtonItemWithSystemItem:(int64_t)a3 target:(id)a4 action:(SEL)a5 menuAction:(SEL)a6
{
  return [(PXPhotosBarButtonItemsController *)self _createBarButtonItemWithTitle:0 orSystemItem:a3 orSystemIconName:0 target:a4 action:a5 menuAction:a6];
}

- (id)createBarButtonItemWithTitle:(id)a3 target:(id)a4 action:(SEL)a5 menuAction:(SEL)a6
{
  return [(PXPhotosBarButtonItemsController *)self _createBarButtonItemWithTitle:a3 orSystemItem:0 orSystemIconName:0 target:a4 action:a5 menuAction:a6];
}

- (PXPhotosBarButtonItemsController)initWithExtendedTraitCollection:(id)a3 viewModel:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXPhotosBarButtonItemsController;
  v8 = [(PXPhotosBarButtonItemsController *)&v12 init];
  if (v8)
  {
    v9 = [(PXFeatureSpecManager *)[_PXPhotosBarButtonSpecManager alloc] initWithExtendedTraitCollection:v6];
    specManager = v8->_specManager;
    v8->_specManager = v9;

    objc_storeStrong((id *)&v8->_viewModel, a4);
  }

  return v8;
}

- (PXPhotosBarButtonItemsController)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXPhotosBarButtonItemsController.m", 47, @"%s is not available as initializer", "-[PXPhotosBarButtonItemsController init]");

  abort();
}

@end