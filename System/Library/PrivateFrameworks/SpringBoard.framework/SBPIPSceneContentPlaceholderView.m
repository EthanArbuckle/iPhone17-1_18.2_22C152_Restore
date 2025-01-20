@interface SBPIPSceneContentPlaceholderView
- (SBPIPSceneContentPlaceholderView)initWithImage:(id)a3;
- (void)layoutSubviews;
@end

@implementation SBPIPSceneContentPlaceholderView

- (SBPIPSceneContentPlaceholderView)initWithImage:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SBPIPSceneContentPlaceholderView;
  v5 = [(SBPIPSceneContentPlaceholderView *)&v10 init];
  if (v5)
  {
    v6 = (UIImageView *)[objc_alloc(MEMORY[0x1E4F42AA0]) initWithImage:v4];
    [(UIImageView *)v6 setContentMode:2];
    imageView = v5->_imageView;
    v5->_imageView = v6;
    v8 = v6;

    [(SBPIPSceneContentPlaceholderView *)v5 addSubview:v5->_imageView];
  }

  return v5;
}

- (void)layoutSubviews
{
  v4.receiver = self;
  v4.super_class = (Class)SBPIPSceneContentPlaceholderView;
  [(SBPIPSceneContentPlaceholderView *)&v4 layoutSubviews];
  imageView = self->_imageView;
  [(SBPIPSceneContentPlaceholderView *)self bounds];
  -[UIImageView setFrame:](imageView, "setFrame:");
}

- (void).cxx_destruct
{
}

@end