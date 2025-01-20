@interface PKOrderPhysicalCardHeroView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKOrderPhysicalCardHeroView)initWithFrame:(CGRect)a3;
- (PKPhysicalCardArtworkView)artworkView;
- (id)_backgroundImage;
- (void)layoutSubviews;
@end

@implementation PKOrderPhysicalCardHeroView

- (PKOrderPhysicalCardHeroView)initWithFrame:(CGRect)a3
{
  v11.receiver = self;
  v11.super_class = (Class)PKOrderPhysicalCardHeroView;
  v3 = -[PKOrderPhysicalCardHeroView initWithFrame:](&v11, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    v5 = [(PKOrderPhysicalCardHeroView *)v3 _backgroundImage];
    uint64_t v6 = [v4 initWithImage:v5];
    backgroundView = v3->_backgroundView;
    v3->_backgroundView = (UIImageView *)v6;

    [(UIImageView *)v3->_backgroundView setAccessibilityIgnoresInvertColors:1];
    [(UIImageView *)v3->_backgroundView setContentMode:2];
    [(UIImageView *)v3->_backgroundView setClipsToBounds:1];
    [(PKOrderPhysicalCardHeroView *)v3 addSubview:v3->_backgroundView];
    v8 = objc_alloc_init(PKPhysicalCardArtworkView);
    artworkView = v3->_artworkView;
    v3->_artworkView = v8;

    [(PKOrderPhysicalCardHeroView *)v3 addSubview:v3->_artworkView];
  }
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  -[PKPhysicalCardArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", a3.width, 1.79769313e308);
  double v5 = v4 + 120.0;
  double v6 = width;
  result.height = v5;
  result.CGFloat width = v6;
  return result;
}

- (void)layoutSubviews
{
  v8.receiver = self;
  v8.super_class = (Class)PKOrderPhysicalCardHeroView;
  [(PKOrderPhysicalCardHeroView *)&v8 layoutSubviews];
  [(PKOrderPhysicalCardHeroView *)self bounds];
  double v4 = v3;
  double v6 = v5;
  -[UIImageView setFrame:](self->_backgroundView, "setFrame:");
  -[PKPhysicalCardArtworkView sizeThatFits:](self->_artworkView, "sizeThatFits:", v4, v6);
  artworkView = self->_artworkView;
  PKSizeAlignedInRect();
  -[PKPhysicalCardArtworkView setFrame:](artworkView, "setFrame:");
}

- (id)_backgroundImage
{
  unint64_t v2 = PKUIGetMinScreenWidthType();
  if (v2 > 0xE) {
    double v3 = 0;
  }
  else {
    double v3 = off_1E59D0388[v2];
  }

  return PKUIImageNamed(v3);
}

- (PKPhysicalCardArtworkView)artworkView
{
  return self->_artworkView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkView, 0);

  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end