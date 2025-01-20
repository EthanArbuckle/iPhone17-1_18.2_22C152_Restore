@interface SUUIVideoThumbnailView
- (void)layoutSubviews;
@end

@implementation SUUIVideoThumbnailView

- (void)layoutSubviews
{
  v27.receiver = self;
  v27.super_class = (Class)SUUIVideoThumbnailView;
  [(SUUIImageView *)&v27 layoutSubviews];
  if (!layoutSubviews_sPlayButtonImage)
  {
    v3 = (void *)MEMORY[0x263F827E8];
    v4 = SUUIBundle();
    uint64_t v5 = [v3 imageNamed:@"PlayControlPressed" inBundle:v4];
    v6 = (void *)layoutSubviews_sPlayButtonHighlightedImage;
    layoutSubviews_sPlayButtonHighlightedImage = v5;

    v7 = (void *)MEMORY[0x263F827E8];
    v8 = SUUIBundle();
    uint64_t v9 = [v7 imageNamed:@"PlayControl" inBundle:v8];
    v10 = (void *)layoutSubviews_sPlayButtonImage;
    layoutSubviews_sPlayButtonImage = v9;
  }
  if (!self->_playControlView)
  {
    id v11 = objc_alloc(MEMORY[0x263F82828]);
    v12 = (UIImageView *)[v11 initWithImage:layoutSubviews_sPlayButtonImage highlightedImage:layoutSubviews_sPlayButtonHighlightedImage];
    playControlView = self->_playControlView;
    self->_playControlView = v12;

    [(UIImageView *)self->_playControlView setContentMode:1];
    [(SUUIVideoThumbnailView *)self addSubview:self->_playControlView];
  }
  [(SUUIVideoThumbnailView *)self bounds];
  double v15 = v14;
  double v17 = v16;
  [(id)layoutSubviews_sPlayButtonImage size];
  double v20 = v17 + -8.0;
  if (v19 < v17 + -8.0) {
    double v20 = v19;
  }
  if (v18 >= v15 + -8.0) {
    double v21 = v15 + -8.0;
  }
  else {
    double v21 = v18;
  }
  float v22 = (v15 - v21) * 0.5;
  float v23 = (v17 - v20) * 0.5;
  -[UIImageView setFrame:](self->_playControlView, "setFrame:", floorf(v22), floorf(v23));
  v24 = self->_playControlView;
  [(SUUIVideoThumbnailView *)self transform];
  CGAffineTransformInvert(&v26, &v25);
  [(UIImageView *)v24 setTransform:&v26];
}

- (void).cxx_destruct
{
}

@end