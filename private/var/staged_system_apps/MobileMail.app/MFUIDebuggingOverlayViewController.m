@interface MFUIDebuggingOverlayViewController
- (MFUIDebuggingOverlayViewController)initWithSpecImage:(id)a3;
- (UIImage)specImage;
- (void)doubleTappedView:(id)a3;
- (void)setSpecImage:(id)a3;
- (void)viewDidLoad;
@end

@implementation MFUIDebuggingOverlayViewController

- (MFUIDebuggingOverlayViewController)initWithSpecImage:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)MFUIDebuggingOverlayViewController;
  v5 = [(MFUIDebuggingOverlayViewController *)&v11 init];
  v6 = v5;
  if (v5)
  {
    [(MFUIDebuggingOverlayViewController *)v5 setSpecImage:v4];
    id v7 = [objc_alloc((Class)UITapGestureRecognizer) initWithTarget:v6 action:"doubleTappedView:"];
    [v7 setNumberOfTapsRequired:2];
    v8 = [(MFUIDebuggingOverlayViewController *)v6 view];
    [v8 addGestureRecognizer:v7];

    v9 = [(MFUIDebuggingOverlayViewController *)v6 view];
    [v9 setAlpha:0.5];

    [(MFUIDebuggingOverlayViewController *)v6 setModalPresentationStyle:4];
  }

  return v6;
}

- (void)doubleTappedView:(id)a3
{
}

- (void)viewDidLoad
{
  v11.receiver = self;
  v11.super_class = (Class)MFUIDebuggingOverlayViewController;
  [(MFUIDebuggingOverlayViewController *)&v11 viewDidLoad];
  id v3 = objc_alloc((Class)UIImageView);
  id v4 = [(MFUIDebuggingOverlayViewController *)self view];
  [v4 bounds];
  v5 = [v3 initWithFrame:];
  specImageView = self->_specImageView;
  self->_specImageView = v5;

  [(UIImageView *)self->_specImageView setAutoresizingMask:18];
  id v7 = [(MFUIDebuggingOverlayViewController *)self view];
  LODWORD(v3) = [v7 mf_prefersRightToLeftInterfaceLayout];

  if (v3) {
    [(UIImageView *)self->_specImageView setContentMode:10];
  }
  v8 = self->_specImageView;
  v9 = [(MFUIDebuggingOverlayViewController *)self specImage];
  [(UIImageView *)v8 setImage:v9];

  v10 = [(MFUIDebuggingOverlayViewController *)self view];
  [v10 addSubview:self->_specImageView];
}

- (void)setSpecImage:(id)a3
{
  p_specImage = &self->_specImage;
  v6 = (UIImage *)a3;
  if (*p_specImage != v6)
  {
    objc_storeStrong((id *)&self->_specImage, a3);
    [(UIImageView *)self->_specImageView setImage:*p_specImage];
  }
}

- (UIImage)specImage
{
  return self->_specImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_specImage, 0);

  objc_storeStrong((id *)&self->_specImageView, 0);
}

@end