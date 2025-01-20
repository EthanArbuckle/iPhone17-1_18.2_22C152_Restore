@interface PLUIEditImageViewController
- (PLUIEditImageViewController)initWithPhoto:(id)a3;
- (id)delegate;
- (id)imageTile;
- (id)photo;
- (int)cropOverlayMode;
- (int)mode;
- (int)saveOptions;
- (unint64_t)_contentAutoresizingMask;
- (unint64_t)_tileAutoresizingMask;
- (unsigned)imageFormat;
- (void)cropOverlay:(id)a3 didFinishSaving:(id)a4;
- (void)cropOverlayWasCancelled:(id)a3;
- (void)cropOverlayWasOKed:(id)a3;
- (void)dealloc;
- (void)setDelegate:(id)a3;
- (void)setImageSavingOptions:(int)a3;
- (void)setMode:(int)a3;
@end

@implementation PLUIEditImageViewController

- (void)setMode:(int)a3
{
  self->_mode = a3;
}

- (int)mode
{
  return self->_mode;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = a3;
}

- (id)delegate
{
  return self->_delegate;
}

- (int)cropOverlayMode
{
  int result = self->_mode;
  if (result == 8)
  {
    v4.receiver = self;
    v4.super_class = (Class)PLUIEditImageViewController;
    return [(PLUIImageViewController *)&v4 cropOverlayMode];
  }
  return result;
}

- (id)imageTile
{
  return self->super._imageTile;
}

- (unsigned)imageFormat
{
  return 4007;
}

- (id)photo
{
  return self->super._photo;
}

- (void)cropOverlayWasCancelled:(id)a3
{
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    [delegate editImageViewControllerDidCancel:self];
  }
}

- (void)cropOverlay:(id)a3 didFinishSaving:(id)a4
{
  if (self->_delegate && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id delegate = self->_delegate;
    [delegate editImageViewController:self didEditImageWithOptions:a4];
  }
}

- (void)cropOverlayWasOKed:(id)a3
{
  if (!self->_saveOptions) {
    self->_saveOptions = 4;
  }
  -[PLCropOverlay beginBackgroundSaveWithTile:progressTitle:completionCallbackTarget:options:](self->super._cropOverlay, "beginBackgroundSaveWithTile:progressTitle:completionCallbackTarget:options:", self->super._imageTile, 0);
}

- (PLUIEditImageViewController)initWithPhoto:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)PLUIEditImageViewController;
  v3 = [(PLUIImageViewController *)&v6 initWithPhoto:a3];
  objc_super v4 = v3;
  if (v3)
  {
    [(PLUIImageViewController *)v3 setAllowsEditing:1];
    [(PLUIEditImageViewController *)v4 setMode:8];
    v4->_saveOptions = 0;
  }
  return v4;
}

- (unint64_t)_tileAutoresizingMask
{
  return 45;
}

- (unint64_t)_contentAutoresizingMask
{
  return 0;
}

- (int)saveOptions
{
  return self->_saveOptions;
}

- (void)setImageSavingOptions:(int)a3
{
  self->_saveOptions = a3;
}

- (void)dealloc
{
  [(PLUIEditImageViewController *)self setDelegate:0];
  self->_id delegate = 0;
  v3.receiver = self;
  v3.super_class = (Class)PLUIEditImageViewController;
  [(PLUIImageViewController *)&v3 dealloc];
}

@end