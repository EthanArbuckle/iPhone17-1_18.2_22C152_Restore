@interface _UICollectionLayoutContainer
- (BOOL)isEqual:(id)a3;
- (CGSize)contentSize;
- (CGSize)effectiveContentSize;
- (NSDirectionalEdgeInsets)contentInsets;
- (NSDirectionalEdgeInsets)effectiveContentInsets;
- (NSString)description;
- (double)initWithContentSize:(double)a3 contentInsets:(double)a4;
- (id)containerUpdatingContentSize:(double)a3;
- (id)initWithContentSize:(double)a3 contentInsets:(double)a4 insetsEnvironment:(double)a5;
- (void)setContentInsets:(NSDirectionalEdgeInsets)a3;
- (void)setContentSize:(CGSize)a3;
- (void)setInsetsEnvironment:(id)a3;
@end

@implementation _UICollectionLayoutContainer

- (void).cxx_destruct
{
}

- (CGSize)effectiveContentSize
{
  [(_UICollectionLayoutContainer *)self effectiveContentInsets];
  double v7 = v5 + v6;
  double v8 = self->_contentSize.width - (v3 + v4);
  double v9 = self->_contentSize.height - v7;
  result.height = v9;
  result.width = v8;
  return result;
}

- (NSDirectionalEdgeInsets)effectiveContentInsets
{
  double top = self->_contentInsets.top;
  double leading = self->_contentInsets.leading;
  double bottom = self->_contentInsets.bottom;
  double trailing = self->_contentInsets.trailing;
  double width = self->_contentSize.width;
  if (leading >= 0.5) {
    double v7 = 1.0;
  }
  else {
    double v7 = self->_contentSize.width;
  }
  double v8 = leading * v7;
  if (trailing >= 0.5) {
    double width = 1.0;
  }
  double v9 = trailing * width;
  if (top >= 0.5) {
    double height = 1.0;
  }
  else {
    double height = self->_contentSize.height;
  }
  double v11 = top * height;
  if (bottom >= 0.5) {
    double v12 = 1.0;
  }
  else {
    double v12 = self->_contentSize.height;
  }
  double v13 = bottom * v12;
  result.double trailing = v9;
  result.double bottom = v13;
  result.double leading = v8;
  result.double top = v11;
  return result;
}

- (CGSize)contentSize
{
  double width = self->_contentSize.width;
  double height = self->_contentSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (double)initWithContentSize:(double)a3 contentInsets:(double)a4
{
  if (!a1) {
    return 0;
  }
  v18.receiver = a1;
  v18.super_class = (Class)_UICollectionLayoutContainer;
  double v13 = (double *)objc_msgSendSuper2(&v18, sel_init);
  v14 = v13;
  if (v13)
  {
    v13[2] = fmax(a2, 0.0);
    v13[3] = fmax(a3, 0.0);
    v13[4] = a4;
    v13[5] = a5;
    v13[6] = a6;
    v13[7] = a7;
    uint64_t v15 = +[_UIContentInsetsEnvironment nullEnvironment];
    v16 = (void *)*((void *)v14 + 1);
    *((void *)v14 + 1) = v15;
  }
  return v14;
}

- (NSDirectionalEdgeInsets)contentInsets
{
  double top = self->_contentInsets.top;
  double leading = self->_contentInsets.leading;
  double bottom = self->_contentInsets.bottom;
  double trailing = self->_contentInsets.trailing;
  result.double trailing = trailing;
  result.double bottom = bottom;
  result.double leading = leading;
  result.double top = top;
  return result;
}

- (id)initWithContentSize:(double)a3 contentInsets:(double)a4 insetsEnvironment:(double)a5
{
  if (!a1) {
    return 0;
  }
  v18.receiver = a1;
  v18.super_class = (Class)_UICollectionLayoutContainer;
  uint64_t v15 = (id *)objc_msgSendSuper2(&v18, sel_init);
  v16 = v15;
  if (v15)
  {
    *((double *)v15 + 2) = fmax(a3, 0.0);
    *((double *)v15 + 3) = fmax(a4, 0.0);
    *((double *)v15 + 4) = a5;
    *((double *)v15 + 5) = a6;
    *((double *)v15 + 6) = a7;
    *((double *)v15 + 7) = a8;
    objc_storeStrong(v15 + 1, a2);
  }
  return v16;
}

- (id)containerUpdatingContentSize:(double)a3
{
  if (a1)
  {
    a1 = -[_UICollectionLayoutContainer initWithContentSize:contentInsets:insetsEnvironment:]([_UICollectionLayoutContainer alloc], a1[1], a2, a3, *((double *)a1 + 4), *((double *)a1 + 5), *((double *)a1 + 6), *((double *)a1 + 7));
    uint64_t v3 = vars8;
  }
  return a1;
}

- (NSString)description
{
  uint64_t v3 = NSString;
  double v4 = (objc_class *)objc_opt_class();
  double v5 = NSStringFromClass(v4);
  double v6 = NSStringFromCGSize(self->_contentSize);
  double v7 = NSStringFromDirectionalEdgeInsets(self->_contentInsets);
  double v8 = [v3 stringWithFormat:@"<%@: %p contentSize=%@ contentInsets=%@}>", v5, self, v6, v7];;

  return (NSString *)v8;
}

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    if (self == a3)
    {
      char v6 = 1;
    }
    else
    {
      double v4 = (float64x2_t *)a3;
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0
        && (self->_contentSize.width == v4[1].f64[0] ? (BOOL v5 = self->_contentSize.height == v4[1].f64[1]) : (BOOL v5 = 0), v5))
      {
        char v6 = vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.top, v4[2]), (int32x4_t)vceqq_f64(*(float64x2_t *)&self->_contentInsets.bottom, v4[3]))), 0xFuLL)));
      }
      else
      {
        char v6 = 0;
      }
    }
  }
  else
  {
    char v6 = 0;
  }
  return v6 & 1;
}

- (void)setInsetsEnvironment:(id)a3
{
}

- (void)setContentSize:(CGSize)a3
{
  self->_contentSize = a3;
}

- (void)setContentInsets:(NSDirectionalEdgeInsets)a3
{
  self->_contentInsets = a3;
}

@end