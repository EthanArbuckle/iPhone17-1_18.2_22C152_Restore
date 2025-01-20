@interface PKDiscoverySpacerShelfView
- (CGSize)sizeThatFits:(CGSize)a3;
- (PKDiscoverySpacerShelfView)initWithShelf:(id)a3;
@end

@implementation PKDiscoverySpacerShelfView

- (PKDiscoverySpacerShelfView)initWithShelf:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)PKDiscoverySpacerShelfView;
  v5 = -[PKDiscoveryShelfView initWithFrame:](&v7, sel_initWithFrame_, *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  if (v5) {
    v5->_spacerType = [v4 spacerType];
  }

  return v5;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width = a3.width;
  v5 = PKFontForDefaultDesign((NSString *)*MEMORY[0x1E4FB28C8], 0);
  v8 = v5;
  unint64_t v9 = self->_spacerType - 1;
  v10.n128_u64[0] = 0;
  if (v9 <= 3)
  {
    double v11 = dbl_1A0445AD0[v9];
    [v5 lineHeight];
    v10.n128_f64[0] = v11 * v6.n128_f64[0];
  }
  v6.n128_f64[0] = width;
  PKSizeRoundToPixel(v6, v10, v7);
  double v13 = v12;
  double v15 = v14;

  double v16 = v13;
  double v17 = v15;
  result.height = v17;
  result.CGFloat width = v16;
  return result;
}

@end