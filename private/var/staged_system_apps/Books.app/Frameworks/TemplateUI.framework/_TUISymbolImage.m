@interface _TUISymbolImage
- (BOOL)hasBaseline;
- (BOOL)isEqual:(id)a3;
- (BOOL)isMulticolor;
- (CGImage)CGImage;
- (CGSize)size;
- (UIEdgeInsets)alignmentInsets;
- (UIEdgeInsets)contentInsets;
- (_TUISymbolImage)initWithImage:(id)a3;
- (_TUISymbolImage)initWithImage:(id)a3 contentInsets:(UIEdgeInsets)a4 isMulticolor:(BOOL)a5;
- (_TUISymbolImage)initWithOther:(id)a3;
- (_TUISymbolImage)symbolImageWithBaselineOffsetFromBottom:(double)a3;
- (_TUISymbolImage)symbolImageWithContentInsets:(UIEdgeInsets)a3 alignmentInsets:(UIEdgeInsets)a4;
- (_TUISymbolImage)symbolImageWithoutBaseline;
- (double)baselineOffsetFromBottom;
- (id)newImageWithoutContentInsets;
@end

@implementation _TUISymbolImage

- (_TUISymbolImage)initWithImage:(id)a3 contentInsets:(UIEdgeInsets)a4 isMulticolor:(BOOL)a5
{
  CGFloat right = a4.right;
  CGFloat bottom = a4.bottom;
  CGFloat left = a4.left;
  CGFloat top = a4.top;
  id v12 = a3;
  v22.receiver = self;
  v22.super_class = (Class)_TUISymbolImage;
  v13 = [(_TUISymbolImage *)&v22 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_image, a3);
    v14->_contentInsets.CGFloat top = top;
    v14->_contentInsets.CGFloat left = left;
    v14->_contentInsets.CGFloat bottom = bottom;
    v14->_contentInsets.CGFloat right = right;
    [v12 alignmentRectInsets];
    v14->_alignmentInsets.CGFloat top = v15;
    v14->_alignmentInsets.CGFloat left = v16;
    v14->_alignmentInsets.CGFloat bottom = v17;
    v14->_alignmentInsets.CGFloat right = v18;
    unsigned int v19 = [v12 hasBaseline];
    v14->_hasBaseline = v19;
    double v20 = 0.0;
    if (v19) {
      [v12 baselineOffsetFromBottom];
    }
    v14->_baselineOffsetFromBottom = v20;
    v14->_isMulticolor = a5;
  }

  return v14;
}

- (_TUISymbolImage)initWithImage:(id)a3
{
  id v4 = a3;
  [v4 contentInsets];
  v5 = -[_TUISymbolImage initWithImage:contentInsets:isMulticolor:](self, "initWithImage:contentInsets:isMulticolor:", v4, 0);

  return v5;
}

- (_TUISymbolImage)initWithOther:(id)a3
{
  id v4 = (id *)a3;
  v10.receiver = self;
  v10.super_class = (Class)_TUISymbolImage;
  v5 = [(_TUISymbolImage *)&v10 init];
  v6 = v5;
  if (v5)
  {
    objc_storeStrong((id *)&v5->_image, v4[1]);
    long long v7 = *((_OWORD *)v4 + 3);
    *(_OWORD *)&v6->_contentInsets.CGFloat top = *((_OWORD *)v4 + 2);
    *(_OWORD *)&v6->_contentInsets.CGFloat bottom = v7;
    long long v8 = *((_OWORD *)v4 + 5);
    *(_OWORD *)&v6->_alignmentInsets.CGFloat top = *((_OWORD *)v4 + 4);
    *(_OWORD *)&v6->_alignmentInsets.CGFloat bottom = v8;
    v6->_hasBaseline = *((unsigned char *)v4 + 16);
    *(void *)&v6->_baselineOffsetFromBottom = v4[3];
    v6->_isMulticolor = *((unsigned char *)v4 + 17);
  }

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (float64x2_t *)a3;
  BOOL v7 = v4
    && (uint64_t v5 = objc_opt_class(), v5 == objc_opt_class())
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.top, v4[2]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.bottom, v4[3]))), 0xFuLL))) & 1) != 0&& (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_alignmentInsets.top, v4[4]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_alignmentInsets.bottom, v4[5]))), 0xFuLL))) & 1) != 0&& self->_hasBaseline == LOBYTE(v4[1].f64[0])&& self->_baselineOffsetFromBottom == v4[1].f64[1]&& ((image = self->_image, image == *(UIImage **)&v4->f64[1]) || -[UIImage isEqual:](image, "isEqual:"))&& self->_isMulticolor == BYTE1(v4[1].f64[0]);

  return v7;
}

- (CGImage)CGImage
{
  return [(UIImage *)self->_image CGImage];
}

- (id)newImageWithoutContentInsets
{
  id v3 = objc_alloc((Class)UIImage);
  id v4 = [(UIImage *)self->_image CGImage];
  [(UIImage *)self->_image scale];
  uint64_t v5 = [v3 tui_initWithCGImage:v4];

  if (self->_hasBaseline)
  {
    v6 = [v5 imageWithBaselineOffsetFromBottom:self->_baselineOffsetFromBottom - self->_contentInsets.bottom];

    return v6;
  }
  return v5;
}

- (CGSize)size
{
  [(UIImage *)self->_image size];
  double v4 = v3;
  double v6 = v5;
  [(UIImage *)self->_image contentInsets];
  double v11 = v6 - (v9 + v10);
  double v12 = v4 - (v7 + v8) + self->_contentInsets.left + self->_contentInsets.right;
  double v13 = v11 + self->_contentInsets.top + self->_contentInsets.bottom;
  result.height = v13;
  result.width = v12;
  return result;
}

- (_TUISymbolImage)symbolImageWithContentInsets:(UIEdgeInsets)a3 alignmentInsets:(UIEdgeInsets)a4
{
  double right = a4.right;
  double bottom = a4.bottom;
  double left = a4.left;
  double top = a4.top;
  double v8 = a3.right;
  double v9 = a3.bottom;
  double v10 = a3.left;
  double v11 = a3.top;
  double v12 = self;
  double v13 = v12;
  BOOL v16 = v10 == v12->_contentInsets.left
     && v11 == v12->_contentInsets.top
     && v8 == v12->_contentInsets.right
     && v9 == v12->_contentInsets.bottom;
  if (!v16
    || (left == v12->_alignmentInsets.left ? (BOOL v17 = top == v12->_alignmentInsets.top) : (BOOL v17 = 0),
        v17 ? (BOOL v18 = right == v12->_alignmentInsets.right) : (BOOL v18 = 0),
        v18 ? (BOOL v19 = bottom == v12->_alignmentInsets.bottom) : (BOOL v19 = 0),
        !v19))
  {
    double v20 = [[_TUISymbolImage alloc] initWithOther:v12];

    v20->_contentInsets.double top = v11;
    v20->_contentInsets.double left = v10;
    v20->_contentInsets.double bottom = v9;
    v20->_contentInsets.double right = v8;
    v20->_alignmentInsets.double top = top;
    v20->_alignmentInsets.double left = left;
    double v13 = v20;
    v20->_alignmentInsets.double bottom = bottom;
    v20->_alignmentInsets.double right = right;
  }

  return v13;
}

- (_TUISymbolImage)symbolImageWithoutBaseline
{
  v2 = self;
  if (v2->_hasBaseline)
  {
    double v3 = [[_TUISymbolImage alloc] initWithOther:v2];

    v3->_hasBaseline = 0;
    v3->_baselineOffsetFromBottom = 0.0;
    v2 = v3;
  }

  return v2;
}

- (_TUISymbolImage)symbolImageWithBaselineOffsetFromBottom:(double)a3
{
  double v4 = self;
  double v5 = v4;
  if (!v4->_hasBaseline || v4->_baselineOffsetFromBottom != a3)
  {
    double v6 = [[_TUISymbolImage alloc] initWithOther:v4];

    v6->_hasBaseline = 1;
    v6->_baselineOffsetFromBottom = a3;
    double v5 = v6;
  }

  return v5;
}

- (UIEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double left = self->_contentInsets.left;
  double bottom = self->_contentInsets.bottom;
  double right = self->_contentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (UIEdgeInsets)alignmentInsets
{
  double top = self->_alignmentInsets.top;
  double left = self->_alignmentInsets.left;
  double bottom = self->_alignmentInsets.bottom;
  double right = self->_alignmentInsets.right;
  result.double right = right;
  result.double bottom = bottom;
  result.double left = left;
  result.double top = top;
  return result;
}

- (BOOL)hasBaseline
{
  return self->_hasBaseline;
}

- (double)baselineOffsetFromBottom
{
  return self->_baselineOffsetFromBottom;
}

- (BOOL)isMulticolor
{
  return self->_isMulticolor;
}

- (void).cxx_destruct
{
}

@end