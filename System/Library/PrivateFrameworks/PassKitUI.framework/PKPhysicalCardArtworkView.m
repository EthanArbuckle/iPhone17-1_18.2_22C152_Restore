@interface PKPhysicalCardArtworkView
- (CGSize)sizeThatFits:(CGSize)a3;
- (NSString)nameOnCard;
- (PKPhysicalCardArtworkView)initWithFrame:(CGRect)a3;
- (UIImage)artworkImage;
- (void)layoutSubviews;
- (void)setArtworkImage:(id)a3;
- (void)setNameOnCard:(id)a3;
@end

@implementation PKPhysicalCardArtworkView

- (PKPhysicalCardArtworkView)initWithFrame:(CGRect)a3
{
  v15.receiver = self;
  v15.super_class = (Class)PKPhysicalCardArtworkView;
  v3 = -[PKPhysicalCardArtworkView initWithFrame:](&v15, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4FB1838]);
    v5 = PKUIImageNamed(@"PhysicalCard");
    uint64_t v6 = [v4 initWithImage:v5];
    artworkImageView = v3->_artworkImageView;
    v3->_artworkImageView = (UIImageView *)v6;

    [(UIImageView *)v3->_artworkImageView setAccessibilityIgnoresInvertColors:1];
    [(UIImageView *)v3->_artworkImageView setContentMode:1];
    [(PKPhysicalCardArtworkView *)v3 addSubview:v3->_artworkImageView];
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E4FB1930]);
    nameLabel = v3->_nameLabel;
    v3->_nameLabel = v8;

    v10 = v3->_nameLabel;
    v11 = PKRoundedSystemFontOfSizeAndWeight(16.0, *MEMORY[0x1E4FB09B8]);
    [(UILabel *)v10 setFont:v11];

    v12 = v3->_nameLabel;
    v13 = [MEMORY[0x1E4FB1618] systemGrayColor];
    [(UILabel *)v12 setTextColor:v13];

    [(UILabel *)v3->_nameLabel setAdjustsFontSizeToFitWidth:1];
    [(UILabel *)v3->_nameLabel setMinimumScaleFactor:0.2];
    [(UILabel *)v3->_nameLabel setNumberOfLines:1];
    [(UIImageView *)v3->_artworkImageView addSubview:v3->_nameLabel];
  }
  return v3;
}

- (void)setArtworkImage:(id)a3
{
  v5 = (UIImage *)a3;
  if (self->_artworkImage != v5)
  {
    uint64_t v6 = v5;
    objc_storeStrong((id *)&self->_artworkImage, a3);
    [(UIImageView *)self->_artworkImageView setImage:self->_artworkImage];
    [(PKPhysicalCardArtworkView *)self setNeedsLayout];
    v5 = v6;
  }
}

- (void)setNameOnCard:(id)a3
{
  if (self->_nameOnCard != a3)
  {
    id v4 = (NSString *)[a3 copy];
    nameOnCard = self->_nameOnCard;
    self->_nameOnCard = v4;

    [(UILabel *)self->_nameLabel setText:self->_nameOnCard];
    [(UILabel *)self->_nameLabel sizeToFit];
    [(PKPhysicalCardArtworkView *)self setNeedsLayout];
  }
}

- (void)layoutSubviews
{
  v6.receiver = self;
  v6.super_class = (Class)PKPhysicalCardArtworkView;
  [(PKPhysicalCardArtworkView *)&v6 layoutSubviews];
  [(PKPhysicalCardArtworkView *)self bounds];
  -[UIImageView setFrame:](self->_artworkImageView, "setFrame:");
  v3 = [(UILabel *)self->_nameLabel font];
  [v3 lineHeight];
  double v5 = v4;

  -[UILabel setFrame:](self->_nameLabel, "setFrame:", 26.0, 110.0, 188.0, v5);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  PKPassFrontFaceContentSize();
  double v4 = 300.0 / v3;
  double v5 = v3 * (300.0 / v3);
  double v7 = v6 * v4;
  result.height = v7;
  result.width = v5;
  return result;
}

- (UIImage)artworkImage
{
  return self->_artworkImage;
}

- (NSString)nameOnCard
{
  return self->_nameOnCard;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nameOnCard, 0);
  objc_storeStrong((id *)&self->_artworkImage, 0);
  objc_storeStrong((id *)&self->_nameLabel, 0);

  objc_storeStrong((id *)&self->_artworkImageView, 0);
}

@end