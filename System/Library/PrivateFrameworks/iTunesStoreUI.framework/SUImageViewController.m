@interface SUImageViewController
- (id)_imageView;
- (void)_backstopAction:(id)a3;
- (void)dealloc;
- (void)loadView;
- (void)reloadWithStorePage:(id)a3 forURL:(id)a4;
@end

@implementation SUImageViewController

- (void)dealloc
{
  [(SUTouchCaptureView *)self->_backstopView removeTarget:self action:0 forControlEvents:0xFFFFFFFFLL];

  self->_backstopView = 0;
  self->_imageView = 0;
  v3.receiver = self;
  v3.super_class = (Class)SUImageViewController;
  [(SUViewController *)&v3 dealloc];
}

- (void)loadView
{
  objc_super v3 = objc_alloc_init(SUTouchCaptureView);
  self->_backstopView = v3;
  [(SUTouchCaptureView *)v3 addTarget:self action:sel__backstopAction_ forControlEvents:64];
  [(SUTouchCaptureView *)self->_backstopView setAutoresizingMask:18];
  -[SUTouchCaptureView setBackgroundColor:](self->_backstopView, "setBackgroundColor:", [MEMORY[0x263F1C550] clearColor]);
  [(SUTouchCaptureView *)self->_backstopView addSubview:[(SUImageViewController *)self _imageView]];
  backstopView = self->_backstopView;

  [(SUImageViewController *)self setView:backstopView];
}

- (void)reloadWithStorePage:(id)a3 forURL:(id)a4
{
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    objc_msgSend((id)objc_msgSend(MEMORY[0x263F08690], "currentHandler"), "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"SUImageViewController.m", 47, @"Page must be an image");
  }
  id v7 = [(SUImageViewController *)self _imageView];

  [v7 setImage:a3];
}

- (void)_backstopAction:(id)a3
{
  v4 = objc_msgSend(MEMORY[0x263F1C408], "sharedApplication", a3);

  [v4 sendAction:sel_imagePageViewTapped_ to:0 from:self forEvent:0];
}

- (id)_imageView
{
  id result = self->_imageView;
  if (!result)
  {
    v4 = (UIImageView *)objc_alloc_init(MEMORY[0x263F1C6D0]);
    self->_imageView = v4;
    [(UIImageView *)v4 setAutoresizingMask:18];
    [(UIImageView *)self->_imageView setContentMode:1];
    return self->_imageView;
  }
  return result;
}

@end