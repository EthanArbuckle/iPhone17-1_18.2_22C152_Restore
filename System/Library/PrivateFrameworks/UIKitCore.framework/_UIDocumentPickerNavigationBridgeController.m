@interface _UIDocumentPickerNavigationBridgeController
+ (id)_exportedInterface;
+ (id)_remoteViewControllerInterface;
- (id)popToRootViewControllerAnimated:(BOOL)a3;
- (id)popToViewController:(id)a3 animated:(BOOL)a4;
- (id)popViewControllerAnimated:(BOOL)a3;
- (void)_documentPickerDidDismiss;
- (void)_doneButton:(id)a3;
- (void)_locationsMenu:(id)a3;
- (void)_prepareWithExtensionInfo:(id)a3 completionHandler:(id)a4;
- (void)_setPickableTypes:(id)a3;
- (void)_setPickerMode:(unint64_t)a3;
- (void)_setTintColor:(id)a3;
- (void)_setUploadURLWrapper:(id)a3;
- (void)_updateNavigationItem;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)setViewControllers:(id)a3 animated:(BOOL)a4;
@end

@implementation _UIDocumentPickerNavigationBridgeController

+ (id)_exportedInterface
{
  v2 = (void *)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED52FE00];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0), sel__prepareWithExtensionInfo_completionHandler_, 0, 0);
  return v2;
}

+ (id)_remoteViewControllerInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED533890];
}

- (void)_setPickableTypes:(id)a3
{
  if (objc_msgSend(-[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"), "conformsToProtocol:", &unk_1ED52FE00))id v5 = -[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"); {
  else
  }
    id v5 = 0;
  [v5 _setPickableTypes:a3];
}

- (void)_setPickerMode:(unint64_t)a3
{
  if (objc_msgSend(-[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"), "conformsToProtocol:", &unk_1ED52FE00))id v5 = -[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"); {
  else
  }
    id v5 = 0;
  [v5 _setPickerMode:a3];
}

- (void)_setUploadURLWrapper:(id)a3
{
  if (objc_msgSend(-[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"), "conformsToProtocol:", &unk_1ED52FE00))id v5 = -[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"); {
  else
  }
    id v5 = 0;
  [v5 _setUploadURLWrapper:a3];
}

- (void)_prepareWithExtensionInfo:(id)a3 completionHandler:(id)a4
{
  if (objc_msgSend(-[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"), "conformsToProtocol:", &unk_1ED52FE00))id v7 = -[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"); {
  else
  }
    id v7 = 0;
  if ((dyld_program_sdk_at_least() & 1) == 0) {
    [(UINavigationController *)self setNavigationBarHidden:1];
  }
  if (v7)
  {
    [v7 _prepareWithExtensionInfo:a3 completionHandler:a4];
  }
  else
  {
    uint64_t v8 = _UIApplicationLinkedOnVersion;
    v9 = (void (*)(id, uint64_t))*((void *)a4 + 2);
    v9(a4, v8);
  }
}

- (void)_documentPickerDidDismiss
{
  if (objc_msgSend(-[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"), "conformsToProtocol:", &unk_1ED52FE00))id v3 = -[NSArray firstObject](-[UINavigationController viewControllers](self, "viewControllers"), "firstObject"); {
  else
  }
    id v3 = 0;
  [v3 _documentPickerDidDismiss];
}

- (void)_setTintColor:(id)a3
{
  uint64_t v4 = [(UIViewController *)self view];
  [(UIView *)v4 setTintColor:a3];
}

- (void)_doneButton:(id)a3
{
  id v3 = [(_UIDocumentPickerNavigationBridgeController *)self hostingViewController];
  [v3 _doneButtonPressed];
}

- (void)_locationsMenu:(id)a3
{
  id v5 = (void *)[a3 view];
  objc_msgSend((id)objc_msgSend(a3, "view"), "bounds");
  objc_msgSend(v5, "convertRect:toView:", -[UIViewController view](self, "view"), v6, v7, v8, v9);
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16;
  id v18 = [(_UIDocumentPickerNavigationBridgeController *)self hostingViewController];
  objc_msgSend(v18, "_displayLocationMenu:", v11, v13, v15, v17);
}

- (void)_updateNavigationItem
{
  v5[1] = *MEMORY[0x1E4F143B8];
  if (!self->_hasSetInitialNavigationItem)
  {
    self->_hasSetInitialNavigationItem = 1;
    id v3 = [(NSArray *)[(UINavigationController *)self viewControllers] firstObject];
    objc_msgSend(v3, "_setExistingNavigationItem:", -[_UIDocumentPickerNavigationItem initWithTitle:rightBarButtonItem:]([_UIDocumentPickerNavigationItem alloc], "initWithTitle:rightBarButtonItem:", objc_msgSend((id)objc_msgSend(v3, "_existingNavigationItem"), "title"), -[UIBarButtonItem initWithBarButtonSystemItem:target:action:]([UIBarButtonItem alloc], "initWithBarButtonSystemItem:target:action:", 1, self, sel__doneButton_)));
  }
  uint64_t v4 = [(UINavigationController *)self topViewController];
  if (![(NSArray *)[(UINavigationItem *)[(UIViewController *)v4 navigationItem] rightBarButtonItems] count])
  {
    v5[0] = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:1 target:self action:sel__doneButton_];
    -[UINavigationItem setRightBarButtonItems:](-[UIViewController navigationItem](v4, "navigationItem"), "setRightBarButtonItems:", [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1]);
  }
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerNavigationBridgeController;
  [(UINavigationController *)&v5 pushViewController:a3 animated:a4];
  [(_UIDocumentPickerNavigationBridgeController *)self _updateNavigationItem];
}

- (id)popViewControllerAnimated:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentPickerNavigationBridgeController;
  uint64_t v4 = [(UINavigationController *)&v6 popViewControllerAnimated:a3];
  [(_UIDocumentPickerNavigationBridgeController *)self _updateNavigationItem];
  return v4;
}

- (id)popToViewController:(id)a3 animated:(BOOL)a4
{
  v7.receiver = self;
  v7.super_class = (Class)_UIDocumentPickerNavigationBridgeController;
  objc_super v5 = [(UINavigationController *)&v7 popToViewController:a3 animated:a4];
  [(_UIDocumentPickerNavigationBridgeController *)self _updateNavigationItem];
  return v5;
}

- (id)popToRootViewControllerAnimated:(BOOL)a3
{
  v6.receiver = self;
  v6.super_class = (Class)_UIDocumentPickerNavigationBridgeController;
  uint64_t v4 = [(UINavigationController *)&v6 popToRootViewControllerAnimated:a3];
  [(_UIDocumentPickerNavigationBridgeController *)self _updateNavigationItem];
  return v4;
}

- (void)setViewControllers:(id)a3 animated:(BOOL)a4
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerNavigationBridgeController;
  [(UINavigationController *)&v5 setViewControllers:a3 animated:a4];
  [(_UIDocumentPickerNavigationBridgeController *)self _updateNavigationItem];
}

@end