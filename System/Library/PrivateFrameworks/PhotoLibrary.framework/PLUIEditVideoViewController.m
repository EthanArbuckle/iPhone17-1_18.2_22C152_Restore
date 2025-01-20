@interface PLUIEditVideoViewController
- (BOOL)_displaysFullScreen;
- (BOOL)_editingForThirdParty;
- (BOOL)parentInPopoverException;
- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3;
- (BOOL)videoViewCanCreateMetadata:(id)a3;
- (CGRect)previewFrame;
- (Class)_viewClass;
- (PLUIEditVideoViewController)initWithPhoto:(id)a3 trimTitle:(id)a4;
- (PLUIEditVideoViewController)initWithProperties:(id)a3;
- (PLUIEditVideoViewController)initWithVideoURL:(id)a3 trimTitle:(id)a4;
- (double)videoViewScrubberYOrigin:(id)a3 forOrientation:(int64_t)a4;
- (id)_trimMessage;
- (id)delegate;
- (id)navigationItem;
- (id)uiipc_imagePickerController;
- (id)uiipc_imagePickerOptions;
- (int)cropOverlayMode;
- (void)_cancelTrim:(id)a3;
- (void)_trimVideo:(id)a3;
- (void)dealloc;
- (void)didChooseVideoAtURL:(id)a3 options:(id)a4;
- (void)loadView;
- (void)setDelegate:(id)a3;
- (void)setImagePickerOptions:(id)a3;
- (void)setParentInPopoverException:(BOOL)a3;
- (void)setViewClass:(Class)a3;
- (void)setupNavigationItem;
- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4;
- (void)videoViewPlaybackDidFail:(id)a3;
- (void)viewDidLoad;
@end

@implementation PLUIEditVideoViewController

- (void)setParentInPopoverException:(BOOL)a3
{
  self->_parentInPopoverException = a3;
}

- (BOOL)parentInPopoverException
{
  return self->_parentInPopoverException;
}

- (void)videoViewPlaybackDidFail:(id)a3
{
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    v5 = objc_msgSend(v4, "initWithObjectsAndKeys:", PLLocalizedFrameworkString(), *MEMORY[0x1E4F28568], 0);
    uint64_t v6 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F8C500] code:-1100 userInfo:v5];

    id delegate = self->_delegate;
    [delegate editVideoViewController:self didFailWithError:v6];
  }
}

- (BOOL)videoViewCanCreateMetadata:(id)a3
{
  return self->_canCreateMetadata != 0;
}

- (double)videoViewScrubberYOrigin:(id)a3 forOrientation:(int64_t)a4
{
  return 0.0;
}

- (void)_trimVideo:(id)a3
{
  v3.receiver = self;
  v3.super_class = (Class)PLUIEditVideoViewController;
  [(PLUIImageViewController *)&v3 cropOverlayWasOKed:0];
}

- (CGRect)previewFrame
{
  double v2 = 320.0;
  double v3 = 426.0;
  double v4 = 0.0;
  double v5 = 20.0;
  result.size.height = v3;
  result.size.width = v2;
  result.origin.y = v5;
  result.origin.x = v4;
  return result;
}

- (int)cropOverlayMode
{
  return 5;
}

- (void)_cancelTrim:(id)a3
{
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    [delegate editVideoViewControllerDidCancel:self];
  }
}

- (void)videoRemakerDidEndRemaking:(id)a3 temporaryPath:(id)a4
{
  v8.receiver = self;
  v8.super_class = (Class)PLUIEditVideoViewController;
  -[PLUIImageViewController videoRemakerDidEndRemaking:temporaryPath:](&v8, sel_videoRemakerDidEndRemaking_temporaryPath_, a3);
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    if (a4)
    {
      uint64_t v6 = [MEMORY[0x1E4F1CB10] fileURLWithPath:a4 isDirectory:0];
      uint64_t v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v6 forKey:*MEMORY[0x1E4F43998]];
    }
    else
    {
      uint64_t v7 = 0;
    }
    [self->_delegate editVideoViewController:self didTrimVideoWithOptions:v7];
  }
}

- (void)didChooseVideoAtURL:(id)a3 options:(id)a4
{
  uint64_t v6 = (void *)[MEMORY[0x1E4F1CA60] dictionaryWithDictionary:a4];
  uint64_t v7 = v6;
  if (a3) {
    [v6 setObject:a3 forKey:*MEMORY[0x1E4F43998]];
  }
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    [delegate editVideoViewController:self didTrimVideoWithOptions:v7];
  }
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)PLUIEditVideoViewController;
  [(PLUIEditVideoViewController *)&v5 viewDidLoad];
  double v3 = objc_msgSend((id)-[PLUIEditVideoViewController navigationController](self, "navigationController"), "navigationBar");
  objc_msgSend(v3, "setScrollEdgeAppearance:", objc_msgSend(v3, "standardAppearance"));
  double v4 = objc_msgSend((id)-[PLUIEditVideoViewController navigationController](self, "navigationController"), "toolbar");
  objc_msgSend(v4, "setScrollEdgeAppearance:", objc_msgSend(v4, "standardAppearance"));
}

- (void)loadView
{
  v5.receiver = self;
  v5.super_class = (Class)PLUIEditVideoViewController;
  [(PLUIImageViewController *)&v5 loadView];
  uint64_t v3 = [(PLUIEditVideoViewController *)self view];
  if (v3)
  {
    double v4 = (void *)v3;
    if (objc_opt_respondsToSelector()) {
      objc_msgSend(v4, "setDisableViewInPopoverRule:", -[PLUIEditVideoViewController parentInPopoverException](self, "parentInPopoverException"));
    }
  }
}

- (void)setViewClass:(Class)a3
{
  self->_viewClass = a3;
}

- (Class)_viewClass
{
  return self->_viewClass;
}

- (id)uiipc_imagePickerController
{
  return 0;
}

- (id)_trimMessage
{
  [(PLUIEditVideoViewController *)self _editingForThirdParty];
  return (id)PLLocalizedFrameworkString();
}

- (id)uiipc_imagePickerOptions
{
  return self->_options;
}

- (void)setImagePickerOptions:(id)a3
{
  options = self->_options;
  if (options != a3)
  {

    self->_options = (NSDictionary *)[a3 copy];
  }
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PLUIEditVideoViewController;
  [(PLUIImageViewController *)&v3 dealloc];
}

- (void)setDelegate:(id)a3
{
  self->_id delegate = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (id)navigationItem
{
  id result = self->_navItem;
  if (!result)
  {
    id result = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F42C00]), "initWithTitle:", -[PLUIEditVideoViewController title](self, "title"));
    self->_navItem = (UINavigationItem *)result;
  }
  return result;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(int64_t)a3
{
  return 1;
}

- (PLUIEditVideoViewController)initWithVideoURL:(id)a3 trimTitle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PLUIEditVideoViewController;
  double v4 = -[PLUIImageViewController initWithVideoURL:](&v7, sel_initWithVideoURL_, a3, a4);
  objc_super v5 = v4;
  if (v4)
  {
    [(PLUIImageViewController *)v4 setAllowsEditing:1];
    v5->_canCreateMetadata = 0;
    v5->_viewClass = (Class)objc_opt_class();
  }
  return v5;
}

- (PLUIEditVideoViewController)initWithProperties:(id)a3
{
  uint64_t v5 = [a3 objectForKey:*MEMORY[0x1E4F44230]];
  v9.receiver = self;
  v9.super_class = (Class)PLUIEditVideoViewController;
  uint64_t v6 = [(PLUIImageViewController *)&v9 initWithVideoURL:v5];
  objc_super v7 = v6;
  if (v6)
  {
    [(PLUIEditVideoViewController *)v6 setImagePickerOptions:a3];
    [(PLUIImageViewController *)v7 setAllowsEditing:1];
    v7->_canCreateMetadata = 0;
    v7->_viewClass = (Class)objc_opt_class();
  }
  return v7;
}

- (PLUIEditVideoViewController)initWithPhoto:(id)a3 trimTitle:(id)a4
{
  v7.receiver = self;
  v7.super_class = (Class)PLUIEditVideoViewController;
  double v4 = -[PLUIImageViewController initWithPhoto:](&v7, sel_initWithPhoto_, a3, a4);
  uint64_t v5 = v4;
  if (v4)
  {
    [(PLUIImageViewController *)v4 setAllowsEditing:1];
    [(PLUIEditVideoViewController *)v5 setParentInPopoverException:0];
    v5->_canCreateMetadata = PLIsAssetsd();
    v5->_viewClass = (Class)objc_opt_class();
  }
  return v5;
}

- (void)setupNavigationItem
{
  [(PLUIEditVideoViewController *)self setExtendedLayoutIncludesOpaqueBars:1];
  id v3 = [(PLUIEditVideoViewController *)self navigationItem];
  [(PLUIEditVideoViewController *)self _editingForThirdParty];
  [v3 setTitle:PLLocalizedFrameworkString()];
  double v4 = (void *)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:1 target:self action:sel__cancelTrim_];
  [v3 setLeftBarButtonItem:v4];

  id v5 = (id)[objc_alloc(MEMORY[0x1E4F427C0]) initWithBarButtonSystemItem:3 target:self action:sel__trimVideo_];
  [v3 setRightBarButtonItem:v5];
}

- (BOOL)_editingForThirdParty
{
  return [(NSDictionary *)self->_options objectForKey:*MEMORY[0x1E4F44230]] != 0;
}

- (BOOL)_displaysFullScreen
{
  return 0;
}

@end