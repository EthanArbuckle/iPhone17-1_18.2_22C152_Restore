@interface _UIDocumentPickerRemoteViewController
+ (id)exportedInterface;
+ (id)serviceViewControllerInterface;
- (NSString)identifier;
- (_UIDocumentPickerRemoteViewControllerContaining)publicController;
- (void)_didSelectPicker;
- (void)_didSelectURLBookmark:(id)a3;
- (void)_didSelectURLWrapper:(id)a3;
- (void)_dismissViewController;
- (void)_dismissWithOption:(id)a3;
- (void)_stitchFileCreationAtURL:(id)a3;
- (void)_tintColorDidChangeToColor:(id)a3;
- (void)invalidate;
- (void)setIdentifier:(id)a3;
- (void)setPreferredContentSize:(CGSize)a3;
- (void)setPublicController:(id)a3;
- (void)viewDidLoad;
- (void)viewServiceDidTerminateWithError:(id)a3;
@end

@implementation _UIDocumentPickerRemoteViewController

+ (id)serviceViewControllerInterface
{
  v2 = [MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED700880];
  v3 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v4 = objc_opt_class();
  v5 = objc_msgSend(v3, "setWithObjects:", v4, objc_opt_class(), 0);
  [v2 setClasses:v5 forSelector:sel__setAuxiliaryOptions_ argumentIndex:0 ofReply:0];

  return v2;
}

- (void)invalidate
{
  v3 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v3 _documentPickerDidDismiss];

  [(_UIDocumentPickerRemoteViewController *)self setPublicController:0];
}

+ (id)exportedInterface
{
  return (id)[MEMORY[0x1E4F29280] interfaceWithProtocol:&unk_1ED531DD8];
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerRemoteViewController;
  [(UIViewController *)&v5 viewDidLoad];
  v3 = objc_alloc_init(_UIDocumentPickerRemoteViewControllerTintColorView);
  uint64_t v4 = [(UIViewController *)self view];
  [v4 addSubview:v3];
}

- (void)_didSelectURLWrapper:(id)a3
{
  id v4 = a3;
  id v6 = [(_UIDocumentPickerRemoteViewController *)self publicController];
  objc_super v5 = [v4 url];

  [v6 _didSelectURL:v5];
}

- (void)_didSelectURLBookmark:(id)a3
{
  id v4 = a3;
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  v12 = __63___UIDocumentPickerRemoteViewController__didSelectURLBookmark___block_invoke;
  v13 = &unk_1E52EB458;
  v14 = self;
  id v5 = v4;
  id v15 = v5;
  id v6 = &v10;
  uint64_t v17 = 0;
  v18 = &v17;
  uint64_t v19 = 0x2020000000;
  v7 = (void (*)(id, uint64_t *))_MergedGlobals_3_7;
  v20 = _MergedGlobals_3_7;
  if (!_MergedGlobals_3_7)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __getFPDocumentURLFromBookmarkableStringSymbolLoc_block_invoke;
    v16[3] = &unk_1E52D9900;
    v16[4] = &v17;
    __getFPDocumentURLFromBookmarkableStringSymbolLoc_block_invoke(v16);
    v7 = (void (*)(id, uint64_t *))v18[3];
  }
  _Block_object_dispose(&v17, 8);
  if (v7)
  {
    v7(v5, v6);
  }
  else
  {
    v8 = [MEMORY[0x1E4F28B00] currentHandler];
    v9 = objc_msgSend(NSString, "stringWithUTF8String:", "void _FPDocumentURLFromBookmarkableString(CFStringRef, void (^__strong)(CFURLRef, CFErrorRef))");
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, @"_UIDocumentPickerRemoteViewController.m", 32, @"%s", dlerror(), v10, v11, v12, v13, v14);

    __break(1u);
  }
}

- (void)_dismissViewController
{
  id v2 = [(_UIDocumentPickerRemoteViewController *)self publicController];
  [v2 _dismissViewController];
}

- (void)_didSelectPicker
{
  id v2 = [(_UIDocumentPickerRemoteViewController *)self publicController];
  [v2 _didSelectPicker];
}

- (void)_dismissWithOption:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDocumentPickerRemoteViewController *)self publicController];
  [v5 _dismissWithOption:v4];
}

- (void)viewServiceDidTerminateWithError:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIDocumentPickerRemoteViewController;
  [(_UIRemoteViewController *)&v5 viewServiceDidTerminateWithError:a3];
  id v4 = [(_UIDocumentPickerRemoteViewController *)self publicController];
  [v4 _dismissViewController];
}

- (void)setPreferredContentSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  id v6 = [(_UIDocumentPickerRemoteViewController *)self publicController];
  uint64_t v7 = [v6 modalPresentationStyle];

  if (v7 != 7) {
    double width = 0.0;
  }
  v8 = [(_UIDocumentPickerRemoteViewController *)self publicController];
  objc_msgSend(v8, "setPreferredContentSize:", width, height);

  v9.receiver = self;
  v9.super_class = (Class)_UIDocumentPickerRemoteViewController;
  -[UIViewController setPreferredContentSize:](&v9, sel_setPreferredContentSize_, width, height);
}

- (void)_stitchFileCreationAtURL:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIDocumentPickerRemoteViewController *)self publicController];
  [v5 _stitchFileCreationAtURL:v4];
}

- (void)_tintColorDidChangeToColor:(id)a3
{
  id v4 = a3;
  id v5 = [(_UIRemoteViewController *)self serviceViewControllerProxy];
  [v5 _setTintColor:v4];
}

- (_UIDocumentPickerRemoteViewControllerContaining)publicController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_publicController);
  return (_UIDocumentPickerRemoteViewControllerContaining *)WeakRetained;
}

- (void)setPublicController:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_publicController);
}

@end