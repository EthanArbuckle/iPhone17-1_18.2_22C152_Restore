@interface PKPassBannerTrailingView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKPassBannerTrailingView)init;
- (PKPassBannerTrailingView)initWithCoder:(id)a3;
- (PKPassBannerTrailingView)initWithFrame:(CGRect)a3;
- (uint64_t)_initWithStyle:(void *)a3 configuration:;
- (void)_updateImage;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PKPassBannerTrailingView

- (PKPassBannerTrailingView)init
{
  return 0;
}

- (PKPassBannerTrailingView)initWithFrame:(CGRect)a3
{
  return 0;
}

- (PKPassBannerTrailingView)initWithCoder:(id)a3
{
  return 0;
}

- (uint64_t)_initWithStyle:(void *)a3 configuration:
{
  v6 = a3;
  if (a1)
  {
    v15.receiver = (id)a1;
    v15.super_class = (Class)PKPassBannerTrailingView;
    id v7 = objc_msgSendSuper2(&v15, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
    a1 = (uint64_t)v7;
    if (v7)
    {
      *((void *)v7 + 51) = a2;
      objc_storeStrong((id *)v7 + 52, a3);
      uint64_t v8 = *(void *)(a1 + 416);
      if (!v8)
      {
LABEL_10:
        -[PKPassBannerTrailingView _updateImage](a1);
        goto LABEL_11;
      }
      if (*(void *)(v8 + 8))
      {
        __break(1u);
      }
      else if (v6)
      {
        v9 = (void *)v6[3];
        goto LABEL_7;
      }
      v9 = 0;
LABEL_7:
      objc_storeStrong((id *)(a1 + 432), v9);
      uint64_t v10 = [objc_alloc(MEMORY[0x1E4FB1838]) initWithImage:0];
      v11 = *(void **)(a1 + 440);
      *(void *)(a1 + 440) = v10;

      [(id)a1 addSubview:*(void *)(a1 + 440)];
      v12 = *(void **)(a1 + 440);
      if (*(void *)(a1 + 432))
      {
        objc_msgSend(*(id *)(a1 + 440), "setTintColor:");
      }
      else
      {
        v13 = [MEMORY[0x1E4FB1618] labelColor];
        [v12 setTintColor:v13];
      }
      goto LABEL_10;
    }
  }
LABEL_11:

  return a1;
}

- (void)_updateImage
{
  if (a1)
  {
    if (*(void *)(a1 + 408))
    {
      id v11 = [(id)a1 traitCollection];
      v2 = objc_msgSend(MEMORY[0x1E4FB1830], "sbui_systemApertureDefaultConfiguration");
      v3 = [MEMORY[0x1E4FB1830] configurationWithTextStyle:*MEMORY[0x1E4FB2988] scale:2];
      v4 = [v2 configurationByApplyingConfiguration:v3];
    }
    else
    {
      if (*(void *)(a1 + 424)) {
        return;
      }
      id v11 = [MEMORY[0x1E4FB1E20] traitCollectionWithPreferredContentSizeCategory:*MEMORY[0x1E4FB27D0]];
      v3 = objc_msgSend(MEMORY[0x1E4FB08E0], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E4FB2928]);
      v4 = [MEMORY[0x1E4FB1830] configurationWithFont:v3 scale:3];
    }

    if (v11 && v4)
    {
      v5 = objc_msgSend(v4, "configurationWithTraitCollection:");

      v6 = (void *)MEMORY[0x1E4FB1818];
      id v7 = *(void **)(a1 + 416);
      if (v7) {
        id v7 = (void *)v7[2];
      }
      uint64_t v8 = v7;
      uint64_t v9 = [v6 _systemImageNamed:v8 withConfiguration:v5];
      uint64_t v10 = *(void **)(a1 + 424);
      *(void *)(a1 + 424) = v9;
    }
    else
    {
      uint64_t v8 = *(void **)(a1 + 424);
      *(void *)(a1 + 424) = 0;
      v5 = v4;
    }

    [*(id *)(a1 + 440) setImage:*(void *)(a1 + 424)];
    [(id)a1 setNeedsLayout];
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassBannerTrailingView;
  [(PKPassBannerTrailingView *)&v9 traitCollectionDidChange:v4];
  v5 = [(PKPassBannerTrailingView *)self traitCollection];
  if (!v4
    || ([v4 preferredContentSizeCategory],
        v6 = (NSString *)objc_claimAutoreleasedReturnValue(),
        [v5 preferredContentSizeCategory],
        id v7 = (NSString *)objc_claimAutoreleasedReturnValue(),
        NSComparisonResult v8 = UIContentSizeCategoryCompareToCategory(v6, v7),
        v7,
        v6,
        v8))
  {
    -[PKPassBannerTrailingView _updateImage]((uint64_t)self);
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  int64_t style = self->_style;
  image = self->_image;
  if (style == 1)
  {
    if (!image)
    {
      double v8 = 1.0;
      double v9 = 1.0;
      goto LABEL_9;
    }
    [(UIImage *)image pkui_alignmentSize];
    v5.n128_u64[0] = 0.5;
    v6.n128_f64[0] = v6.n128_f64[0] * 0.5;
    v7.n128_f64[0] = v7.n128_f64[0] * 0.5;
  }
  else
  {
    if (!image)
    {
      double v8 = *MEMORY[0x1E4F1DB30];
      double v9 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
      goto LABEL_9;
    }
    [(UIImage *)image pkui_alignmentSize];
  }
  PKSizeRoundToPixel(v6, v7, v5);
LABEL_9:
  result.height = v9;
  result.width = v8;
  return result;
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)PKPassBannerTrailingView;
  [(PKPassBannerTrailingView *)&v13 layoutSubviews];
  if (self->_image)
  {
    [(PKPassBannerTrailingView *)self bounds];
    double v7 = v11.n128_f64[0];
    double v8 = v3.n128_f64[0];
    double v9 = v4.n128_f64[0];
    double v10 = v5.n128_f64[0];
    v11.n128_u64[1] = 0;
    image = self->_image;
    if (image) {
      -[UIImage pkui_alignmentSizeThatFits:](image, "pkui_alignmentSizeThatFits:", v4.n128_f64[0], v5.n128_f64[0]);
    }
    v11.n128_f64[0] = v7 + (v9 - 0.0) * 0.5 + 0.0;
    v3.n128_f64[0] = v8 + (v10 - 0.0) * 0.5 + 0.0;
    v4.n128_f64[0] = 0.0 - (0.0 + 0.0);
    v6.n128_f64[0] = 0.0 + 0.0;
    v5.n128_f64[0] = v4.n128_f64[0];
    PKRectRoundToPixel(v11, v3, v4, v5, v6);
    -[UIImageView setFrame:](self->_imageView, "setFrame:");
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageView, 0);
  objc_storeStrong((id *)&self->_imageColor, 0);
  objc_storeStrong((id *)&self->_image, 0);

  objc_storeStrong((id *)&self->_configuration, 0);
}

@end