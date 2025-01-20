@interface WFAssociationStateView
- (UIActivityIndicatorView)activityIndicator;
- (UIImageView)imageView;
- (int64_t)state;
- (void)layoutSubviews;
- (void)setActivityIndicator:(id)a3;
- (void)setImageView:(id)a3;
- (void)setState:(int64_t)a3;
@end

@implementation WFAssociationStateView

- (void)setState:(int64_t)a3
{
  if (self->_state == a3) {
    return;
  }
  self->_state = a3;
  switch(a3)
  {
    case 0:
      v6 = [(WFAssociationStateView *)self imageView];
      v7 = v6;
      uint64_t v8 = 1;
LABEL_10:
      [v6 setHidden:v8];

      v5 = [(WFAssociationStateView *)self activityIndicator];
      [v5 stopAnimating];
      goto LABEL_11;
    case 2:
      v9 = [(WFAssociationStateView *)self imageView];

      if (!v9)
      {
        v10 = +[WFImageCache sharedImageCache];
        v11 = [v10 imageNamed:@"checkmark"];

        v12 = (void *)[objc_alloc(MEMORY[0x263F82828]) initWithImage:v11];
        [(WFAssociationStateView *)self setImageView:v12];

        v13 = [(WFAssociationStateView *)self imageView];
        [(WFAssociationStateView *)self addSubview:v13];
      }
      v6 = [(WFAssociationStateView *)self imageView];
      v7 = v6;
      uint64_t v8 = 0;
      goto LABEL_10;
    case 1:
      v4 = [(WFAssociationStateView *)self activityIndicator];
      [v4 startAnimating];

      v5 = [(WFAssociationStateView *)self imageView];
      [v5 setHidden:1];
LABEL_11:

      break;
  }
  [(WFAssociationStateView *)self setNeedsLayout];
}

- (void)layoutSubviews
{
  v35.receiver = self;
  v35.super_class = (Class)WFAssociationStateView;
  [(WFAssociationStateView *)&v35 layoutSubviews];
  v3 = [MEMORY[0x263F825C8] clearColor];
  [(WFAssociationStateView *)self setBackgroundColor:v3];

  [(WFAssociationStateView *)self center];
  double v5 = v4;
  double v7 = v6;
  uint64_t v8 = [(WFAssociationStateView *)self imageView];
  objc_msgSend(v8, "setCenter:", v5, v7);

  v9 = [(WFAssociationStateView *)self imageView];
  [v9 setContentMode:4];

  [(WFAssociationStateView *)self bounds];
  double v11 = v10;
  double v13 = v12;
  double v15 = v14;
  double v17 = v16 + -1.0;
  v18 = [(WFAssociationStateView *)self imageView];
  objc_msgSend(v18, "setFrame:", v11, v13, v15, v17);

  v19 = [MEMORY[0x263F825C8] clearColor];
  v20 = [(WFAssociationStateView *)self imageView];
  [v20 setBackgroundColor:v19];

  [(WFAssociationStateView *)self center];
  double v22 = v21;
  double v24 = v23;
  v25 = [(WFAssociationStateView *)self activityIndicator];
  objc_msgSend(v25, "setCenter:", v22, v24);

  [(WFAssociationStateView *)self bounds];
  double v27 = v26;
  double v29 = v28;
  double v31 = v30;
  double v33 = v32;
  v34 = [(WFAssociationStateView *)self activityIndicator];
  objc_msgSend(v34, "setFrame:", v27, v29, v31, v33);
}

- (UIActivityIndicatorView)activityIndicator
{
  activityIndicator = self->_activityIndicator;
  if (!activityIndicator)
  {
    double v4 = (UIActivityIndicatorView *)[objc_alloc(MEMORY[0x263F823E8]) initWithActivityIndicatorStyle:100];
    double v5 = [MEMORY[0x263F825C8] altTextColor];
    [(UIActivityIndicatorView *)v4 setColor:v5];

    double v6 = self->_activityIndicator;
    self->_activityIndicator = v4;
    double v7 = v4;

    [(UIActivityIndicatorView *)self->_activityIndicator setHidesWhenStopped:1];
    [(WFAssociationStateView *)self addSubview:self->_activityIndicator];

    activityIndicator = self->_activityIndicator;
  }
  return activityIndicator;
}

- (int64_t)state
{
  return self->_state;
}

- (void)setActivityIndicator:(id)a3
{
}

- (UIImageView)imageView
{
  return self->_imageView;
}

- (void)setImageView:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_activityIndicator, 0);
}

@end