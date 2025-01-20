@interface PUStorageManagementBaseController
- (BOOL)canBeShownFromSuspendedState;
- (BOOL)isGridControllerEditing;
- (PHPhotoLibrary)photoLibrary;
- (id)parentController;
- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3;
- (id)readPreferenceValue:(id)a3;
- (id)rootController;
- (id)specifier;
- (void)didMoveToParentViewController:(id)a3;
- (void)handleURL:(id)a3 withCompletion:(id)a4;
- (void)setIsGridControllerEditing:(BOOL)a3;
- (void)setParentController:(id)a3;
- (void)setPreferenceValue:(id)a3 specifier:(id)a4;
- (void)setRootController:(id)a3;
- (void)setSpecifier:(id)a3;
- (void)viewController:(id)a3 didUpdateBarsAnimated:(BOOL)a4 isSelecting:(BOOL)a5;
- (void)viewDidLoad;
@end

@implementation PUStorageManagementBaseController

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_photoLibrary, 0);
  objc_storeStrong((id *)&self->_rootController, 0);
  objc_storeStrong((id *)&self->_parentController, 0);
  objc_storeStrong(&self->_preferenceValue, 0);
  objc_storeStrong((id *)&self->_specifier, 0);
}

- (PHPhotoLibrary)photoLibrary
{
  return self->_photoLibrary;
}

- (void)setIsGridControllerEditing:(BOOL)a3
{
  self->_isGridControllerEditing = a3;
}

- (BOOL)isGridControllerEditing
{
  return self->_isGridControllerEditing;
}

- (BOOL)canBeShownFromSuspendedState
{
  return 1;
}

- (void)handleURL:(id)a3 withCompletion:(id)a4
{
  if (a4) {
    (*((void (**)(id))a4 + 2))(a4);
  }
}

- (id)readPreferenceValue:(id)a3
{
  return self->_preferenceValue;
}

- (void)setPreferenceValue:(id)a3 specifier:(id)a4
{
  v5 = objc_msgSend(a4, "copy", a3);
  id preferenceValue = self->_preferenceValue;
  self->_id preferenceValue = v5;
}

- (id)specifier
{
  return self->_specifier;
}

- (void)setSpecifier:(id)a3
{
}

- (id)rootController
{
  return self->_rootController;
}

- (void)setRootController:(id)a3
{
}

- (id)parentController
{
  return self->_parentController;
}

- (void)setParentController:(id)a3
{
}

- (void)viewController:(id)a3 didUpdateBarsAnimated:(BOOL)a4 isSelecting:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v27 = a3;
  v8 = [(PUStorageManagementBaseController *)self navigationItem];
  v9 = [v27 navigationItem];
  BOOL v10 = [(PUStorageManagementBaseController *)self isGridControllerEditing];
  [(PUStorageManagementBaseController *)self setIsGridControllerEditing:v5];
  if (v5)
  {
    v11 = [v9 leftBarButtonItems];
    [v8 setLeftBarButtonItems:v11 animated:v6];
  }
  else if (v10)
  {
    [v8 setLeftBarButtonItems:MEMORY[0x1E4F1CBF0] animated:v6];
  }
  v12 = [v9 rightBarButtonItems];
  [v8 setRightBarButtonItems:v12 animated:v6];

  v13 = [v27 toolbarItems];
  [(PUStorageManagementBaseController *)self setToolbarItems:v13 animated:v6];

  v14 = [(PUStorageManagementBaseController *)self title];
  [v8 setTitle:v14];

  v15 = [(PUStorageManagementBaseController *)self parentViewController];
  v16 = (objc_class *)objc_opt_class();
  v17 = NSStringFromClass(v16);
  if ([v17 containsString:@"SwiftUI"])
  {
    v18 = [v15 navigationItem];
    v19 = [v8 rightBarButtonItems];
    [v18 setRightBarButtonItems:v19 animated:v6];

    v20 = [v15 navigationItem];
    v21 = [v8 leftBarButtonItems];
    [v20 setLeftBarButtonItems:v21 animated:v6];

    v22 = [v27 toolbarItems];
    [v15 setToolbarItems:v22 animated:v6];

    v23 = [v8 title];
    v24 = [v15 navigationItem];
    [v24 setTitle:v23];
  }
  v25 = [(PUStorageManagementBaseController *)self parentViewController];
  v26 = [v25 navigationItem];
  [v26 setLeftItemsSupplementBackButton:0];
}

- (id)photosViewConfigurationWithShouldExpunge:(BOOL)a3
{
  BOOL v5 = objc_msgSend(MEMORY[0x1E4F28B00], "currentHandler", a3);
  BOOL v6 = (objc_class *)objc_opt_class();
  v7 = NSStringFromClass(v6);
  [v5 handleFailureInMethod:a2, self, @"PUStorageManagementBaseController.m", 66, @"Method %s is a responsibility of subclass %@", "-[PUStorageManagementBaseController photosViewConfigurationWithShouldExpunge:]", v7 object file lineNumber description];

  abort();
}

- (void)didMoveToParentViewController:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(PUStorageManagementBaseController *)self contentScrollViewForEdge:1];
  BOOL v6 = [(PUStorageManagementBaseController *)self contentScrollViewForEdge:4];
  [v4 setContentScrollView:v5 forEdge:1];
  [v4 setContentScrollView:v6 forEdge:4];
  v7.receiver = self;
  v7.super_class = (Class)PUStorageManagementBaseController;
  [(PUStorageManagementBaseController *)&v7 didMoveToParentViewController:v4];
}

- (void)viewDidLoad
{
  v12.receiver = self;
  v12.super_class = (Class)PUStorageManagementBaseController;
  [(PUStorageManagementBaseController *)&v12 viewDidLoad];
  id v3 = objc_alloc(MEMORY[0x1E4F39228]);
  id v4 = [MEMORY[0x1E4F39228] systemPhotoLibraryURL];
  BOOL v5 = (PHPhotoLibrary *)[v3 initWithPhotoLibraryURL:v4];
  photoLibrary = self->_photoLibrary;
  self->_photoLibrary = v5;

  objc_super v7 = [(PUStorageManagementBaseController *)self navigationController];
  uint64_t v8 = objc_opt_class();
  v9 = [(PUStorageManagementBaseController *)self photosViewConfigurationWithShouldExpunge:v8 != objc_opt_class()];

  BOOL v10 = (void *)[objc_alloc(MEMORY[0x1E4F90590]) initWithConfiguration:v9];
  [v10 setContainerViewController:self];
  [v10 setGridPresentationBarsUpdateDelegate:self];
  v11 = [v9 title];
  [v10 setTitle:v11];

  [(PUStorageManagementBaseController *)self px_addOrReplaceChildViewController:v10 activateConstraints:1];
  [(PUStorageManagementBaseController *)self px_setOneUpPresentationStyle:1];
}

@end