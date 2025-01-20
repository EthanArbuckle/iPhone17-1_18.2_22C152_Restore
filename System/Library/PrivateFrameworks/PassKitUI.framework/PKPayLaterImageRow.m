@interface PKPayLaterImageRow
- (BOOL)isEqual:(id)a3;
- (Class)cellClass;
- (NSCopying)identifier;
- (NSDirectionalEdgeInsets)contentEdgeInsets;
- (PKPayLaterImageRow)initWithImage:(id)a3;
- (unint64_t)hash;
- (void)configureCell:(id)a3;
- (void)setContentEdgeInsets:(NSDirectionalEdgeInsets)a3;
@end

@implementation PKPayLaterImageRow

- (PKPayLaterImageRow)initWithImage:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPayLaterImageRow;
  v6 = [(PKPayLaterImageRow *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_image, a3);
    long long v8 = *(_OWORD *)(MEMORY[0x1E4FB12A8] + 16);
    *(_OWORD *)&v7->_contentEdgeInsets.top = *MEMORY[0x1E4FB12A8];
    *(_OWORD *)&v7->_contentEdgeInsets.bottom = v8;
  }

  return v7;
}

- (NSCopying)identifier
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  [v3 appendString:v5];

  v6 = [(UIImage *)self->_image description];
  [v3 appendString:v6];

  v7 = (void *)[v3 copy];

  return (NSCopying *)v7;
}

- (Class)cellClass
{
  return (Class)objc_opt_class();
}

- (void)configureCell:(id)a3
{
  id v6 = a3;
  [(PKPayLaterImageRow *)self cellClass];
  if (objc_opt_isKindOfClass())
  {
    v4 = [MEMORY[0x1E4FB1948] plainFooterConfiguration];
    [v4 setImage:self->_image];
    objc_msgSend(v4, "setDirectionalLayoutMargins:", self->_contentEdgeInsets.top, self->_contentEdgeInsets.leading, self->_contentEdgeInsets.bottom, self->_contentEdgeInsets.trailing);
    [v6 setContentConfiguration:v4];
    id v5 = [MEMORY[0x1E4FB1498] clearConfiguration];
    [v6 setBackgroundConfiguration:v5];

    objc_msgSend(v6, "setDirectionalLayoutMargins:", *MEMORY[0x1E4FB12A8], *(double *)(MEMORY[0x1E4FB12A8] + 8), *(double *)(MEMORY[0x1E4FB12A8] + 16), *(double *)(MEMORY[0x1E4FB12A8] + 24));
  }
}

- (unint64_t)hash
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  [v3 safelyAddObject:self->_image];
  PKCombinedHash();
  PKIntegerHash();
  PKIntegerHash();
  PKIntegerHash();
  unint64_t v4 = PKIntegerHash();

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (PKPayLaterImageRow *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v6 = v5;
    if (PKEqualObjects()) {
      char v7 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentEdgeInsets.top, v6[1]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentEdgeInsets.bottom, v6[2]))), 0xFuLL)));
    }
    else {
      char v7 = 0;
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7 & 1;
}

- (NSDirectionalEdgeInsets)contentEdgeInsets
{
  double top = self->_contentEdgeInsets.top;
  double leading = self->_contentEdgeInsets.leading;
  double bottom = self->_contentEdgeInsets.bottom;
  double trailing = self->_contentEdgeInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (void)setContentEdgeInsets:(NSDirectionalEdgeInsets)a3
{
  self->_contentEdgeInsets = a3;
}

- (void).cxx_destruct
{
}

@end