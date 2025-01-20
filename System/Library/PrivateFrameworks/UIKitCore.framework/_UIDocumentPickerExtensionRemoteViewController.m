@interface _UIDocumentPickerExtensionRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (void)_displayLocationMenu:(CGRect)a3;
- (void)_doneButtonPressed;
@end

@implementation _UIDocumentPickerExtensionRemoteViewController

+ (id)serviceViewControllerInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED52FE00];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  v6 = objc_msgSend(v3, "setWithObjects:", v4, v5, objc_opt_class(), 0);
  [v2 setClasses:v6 forSelector:sel__prepareWithExtensionInfo_completionHandler_ argumentIndex:0 ofReply:0];

  return v2;
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED533890];
}

- (void)_displayLocationMenu:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  id v7 = [(_UIDocumentPickerRemoteViewController *)self publicController];
  objc_msgSend(v7, "_displayLocationsMenuFromRect:", x, y, width, height);
}

- (void)_doneButtonPressed
{
  id v2 = [(_UIDocumentPickerRemoteViewController *)self publicController];
  [v2 _dismissViewController];
}

@end