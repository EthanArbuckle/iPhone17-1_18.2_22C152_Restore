@interface SiriUIProfileTemplateView
- (SiriUIProfileTemplateView)initWithDataSource:(id)a3;
- (UIImageView)imageView;
- (int64_t)layoutStyle;
- (void)layoutImage;
- (void)reloadData;
- (void)setImageView:(id)a3;
@end

@implementation SiriUIProfileTemplateView

- (SiriUIProfileTemplateView)initWithDataSource:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)SiriUIProfileTemplateView;
  return [(SiriUILabelStackTemplateView *)&v4 initWithDataSource:a3];
}

- (void)layoutImage
{
  v3 = [(SiriUIBaseTemplateView *)self dataSource];
  uint64_t v4 = [v3 imageURI];
  if (v4)
  {
    v5 = (void *)v4;
    v6 = [v3 imageURI];
    uint64_t v7 = [v6 length];

    if (v7)
    {
      if ([v3 imageStyleValue]) {
        double v8 = 60.0;
      }
      else {
        double v8 = 40.0;
      }
      id v9 = objc_alloc(MEMORY[0x263F1C6D0]);
      v10 = (UIImageView *)objc_msgSend(v9, "initWithFrame:", *MEMORY[0x263F001A8], *(double *)(MEMORY[0x263F001A8] + 8), *(double *)(MEMORY[0x263F001A8] + 16), *(double *)(MEMORY[0x263F001A8] + 24));
      imageView = self->_imageView;
      self->_imageView = v10;

      id v12 = (id)[(UIImageView *)self->_imageView siriui_addHeightConstraint:v8];
      id v13 = (id)[(UIImageView *)self->_imageView siriui_addWidthConstraint:v8];
      [(UIImageView *)self->_imageView setContentMode:2];
      [(UIImageView *)self->_imageView setTranslatesAutoresizingMaskIntoConstraints:0];
      v14 = [(UIImageView *)self->_imageView layer];
      [v14 setCornerRadius:v8 * 0.5];

      [(UIImageView *)self->_imageView setClipsToBounds:1];
      v15 = (void *)[objc_alloc(MEMORY[0x263EFEC20]) initWithStyle:0 diameter:v8];
      v16 = self->_imageView;
      v17 = [v15 silhouetteMonogram];
      [(UIImageView *)v16 setImage:v17];

      uint64_t v18 = [v3 alignmentValue];
      v19 = self->_imageView;
      if (v18 == 1)
      {
        [(SiriUILabelStackTemplateView *)self insertTopView:self->_imageView];
        id v20 = (id)[(UIImageView *)self->_imageView siriui_centerHorizontallyWithItem:self withMargin:0.0];
      }
      else
      {
        v21 = [(SiriUIBaseTemplateView *)self templatedSuperview];
        [v21 templatedContentMargins];
        -[SiriUILabelStackTemplateView insertLeadingView:withMargins:](self, "insertLeadingView:withMargins:", v19);
      }
      [(SiriUIProfileTemplateView *)self setNeedsUpdateConstraints];
      objc_initWeak(&location, self);
      v22 = [(SiriUIProfileTemplateView *)self traitCollection];
      v23[0] = MEMORY[0x263EF8330];
      v23[1] = 3221225472;
      v23[2] = __40__SiriUIProfileTemplateView_layoutImage__block_invoke;
      v23[3] = &unk_26469F3B8;
      objc_copyWeak(&v24, &location);
      [v3 fetchUIImageForTraitCollection:v22 completion:v23];

      objc_destroyWeak(&v24);
      objc_destroyWeak(&location);
    }
  }
}

void __40__SiriUIProfileTemplateView_layoutImage__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (v4 && WeakRetained) {
    [WeakRetained[67] setImage:v4];
  }
}

- (void)reloadData
{
  v3.receiver = self;
  v3.super_class = (Class)SiriUIProfileTemplateView;
  [(SiriUILabelStackTemplateView *)&v3 reloadData];
  [(SiriUIProfileTemplateView *)self layoutImage];
  [(SiriUIProfileTemplateView *)self setNeedsUpdateConstraints];
}

- (int64_t)layoutStyle
{
  v2 = [(SiriUIBaseTemplateView *)self dataSource];
  uint64_t v3 = [v2 alignmentValue];

  if (v3 == 1) {
    return 2;
  }
  else {
    return 1;
  }
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
}

@end