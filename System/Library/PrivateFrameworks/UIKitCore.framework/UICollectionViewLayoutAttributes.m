@interface UICollectionViewLayoutAttributes
+ (UICollectionViewLayoutAttributes)layoutAttributesForCellWithIndexPath:(NSIndexPath *)indexPath;
+ (UICollectionViewLayoutAttributes)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind withIndexPath:(NSIndexPath *)indexPath;
+ (UICollectionViewLayoutAttributes)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind withIndexPath:(NSIndexPath *)indexPath;
- (BOOL)_hasMaskViewFrame;
- (BOOL)isEqual:(id)a3;
- (BOOL)isHidden;
- (CATransform3D)transform3D;
- (CGAffineTransform)transform;
- (CGFloat)alpha;
- (CGPoint)center;
- (CGRect)bounds;
- (CGRect)frame;
- (CGSize)size;
- (NSIndexPath)indexPath;
- (NSInteger)zIndex;
- (NSString)description;
- (NSString)representedElementKind;
- (UICollectionElementCategory)representedElementCategory;
- (UICollectionViewLayoutAttributes)init;
- (double)_listLayoutItemMaxWidth;
- (id)_existingListAttributes;
- (id)_preferredSizingData;
- (id)copyWithZone:(_NSZone *)a3;
- (id)initialLayoutAttributesForInsertedDecorationElementOfKind:(id)a3 atIndexPath:(id)a4;
- (int64_t)_zPosition;
- (uint64_t)_isEquivalentTo:(uint64_t)a1;
- (unint64_t)hash;
- (void)__indexPath;
- (void)_isTransitionVisibleTo:(void *)result;
- (void)_listAttributesCreatingIfNecessary;
- (void)_setMaskedCorners:(uint64_t)a1;
- (void)_setPreferredSizingData:(uint64_t)a1;
- (void)_setZPosition:(int64_t)a3;
- (void)setAlpha:(CGFloat)alpha;
- (void)setBounds:(CGRect)bounds;
- (void)setCenter:(CGPoint)center;
- (void)setFrame:(CGRect)frame;
- (void)setHidden:(BOOL)hidden;
- (void)setIndexPath:(NSIndexPath *)indexPath;
- (void)setSize:(CGSize)size;
- (void)setTransform3D:(CATransform3D *)transform3D;
- (void)setTransform:(CGAffineTransform *)transform;
- (void)setZIndex:(NSInteger)zIndex;
@end

@implementation UICollectionViewLayoutAttributes

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listAttributes, 0);
  objc_storeStrong(&self->_preferredSizingData, 0);
  objc_storeStrong((id *)&self->_reuseIdentifier, 0);
  objc_storeStrong((id *)&self->_indexPath, 0);
  objc_storeStrong((id *)&self->_elementKind, 0);
}

- (NSIndexPath)indexPath
{
  if (self->_indexPath)
  {
    char v3 = dyld_program_sdk_at_least();
    indexPath = self->_indexPath;
    if ((v3 & 1) == 0) {
      indexPath = indexPath;
    }
  }
  else
  {
    indexPath = (NSIndexPath *)indexPath_sharedNotFoundPath;
    if (!indexPath_sharedNotFoundPath)
    {
      uint64_t v5 = [MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:0x7FFFFFFFFFFFFFFFLL];
      v6 = (void *)indexPath_sharedNotFoundPath;
      indexPath_sharedNotFoundPath = v5;

      indexPath = (NSIndexPath *)indexPath_sharedNotFoundPath;
    }
  }
  return indexPath;
}

- (void)_listAttributesCreatingIfNecessary
{
  if (a1)
  {
    v2 = a1;
    char v3 = (void *)a1[35];
    if (!v3)
    {
      v4 = objc_alloc_init(_UICollectionLayoutListAttributes);
      uint64_t v5 = (void *)v2[35];
      v2[35] = v4;

      char v3 = (void *)v2[35];
    }
    a1 = v3;
    uint64_t v1 = vars8;
  }
  return a1;
}

- (id)_preferredSizingData
{
  if (a1)
  {
    a1 = (id *)a1[34];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (void)setZIndex:(NSInteger)zIndex
{
  self->_zIndex = zIndex;
}

- (NSInteger)zIndex
{
  return self->_zIndex;
}

- (void)setFrame:(CGRect)frame
{
  double height = frame.size.height;
  double width = frame.size.width;
  double y = frame.origin.y;
  double x = frame.origin.x;
  if (dyld_program_sdk_at_least())
  {
    v25.origin.double x = x;
    v25.origin.double y = y;
    v25.size.double width = width;
    v25.size.double height = height;
    if (CGRectIsInfinite(v25))
    {
      v20 = [MEMORY[0x1E4F28B00] currentHandler];
      v29.origin.double x = x;
      v29.origin.double y = y;
      v29.size.double width = width;
      v29.size.double height = height;
      v21 = NSStringFromCGRect(v29);
      objc_msgSend(v20, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICollectionViewLayout.m", 451, @"UICollectionViewLayoutAttributes: -setFrame: with CGRectInfinite is undefined. Attributes: %@; new frame: %@",
        self,
        v21);
    }
    v26.origin.double x = x;
    v26.origin.double y = y;
    v26.size.double width = width;
    v26.size.double height = height;
    if (CGRectIsNull(v26))
    {
      v22 = [MEMORY[0x1E4F28B00] currentHandler];
      v30.origin.double x = x;
      v30.origin.double y = y;
      v30.size.double width = width;
      v30.size.double height = height;
      v23 = NSStringFromCGRect(v30);
      objc_msgSend(v22, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICollectionViewLayout.m", 452, @"UICollectionViewLayoutAttributes: -setFrame: with CGRectNull is undefined. Attributes: %@; new frame: %@",
        self,
        v23);
    }
  }
  if (dyld_program_sdk_at_least())
  {
    if (fabs(x) == INFINITY || (double v9 = fabs(y), v9 >= INFINITY) && v9 <= INFINITY)
    {
      v10 = [MEMORY[0x1E4F28B00] currentHandler];
      v27.origin.double x = x;
      v27.origin.double y = y;
      v27.size.double width = width;
      v27.size.double height = height;
      v11 = NSStringFromCGRect(v27);
      objc_msgSend(v10, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICollectionViewLayout.m", 455, @"UICollectionViewLayoutAttributes: -setFrame: requires finite coordinates. Attributes: %@; new frame: %@",
        self,
        v11);
    }
    if (fabs(width) == INFINITY || (double v12 = fabs(height), v12 >= INFINITY) && v12 <= INFINITY)
    {
      v13 = [MEMORY[0x1E4F28B00] currentHandler];
      v28.origin.double x = x;
      v28.origin.double y = y;
      v28.size.double width = width;
      v28.size.double height = height;
      v14 = NSStringFromCGRect(v28);
      objc_msgSend(v13, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICollectionViewLayout.m", 456, @"UICollectionViewLayoutAttributes: -setFrame: requires finite dimensions. Attributes: %@; new frame: %@",
        self,
        v14);
    }
  }
  -[UICollectionViewLayoutAttributes setSize:](self, "setSize:", width, height);
  -[UICollectionViewLayoutAttributes setCenter:](self, "setCenter:", x + width * 0.5, y + height * 0.5);
  long long v15 = *(_OWORD *)&self->_transform.m33;
  *(_OWORD *)&v24.m31 = *(_OWORD *)&self->_transform.m31;
  *(_OWORD *)&v24.m33 = v15;
  long long v16 = *(_OWORD *)&self->_transform.m43;
  *(_OWORD *)&v24.m41 = *(_OWORD *)&self->_transform.m41;
  *(_OWORD *)&v24.m43 = v16;
  long long v17 = *(_OWORD *)&self->_transform.m13;
  *(_OWORD *)&v24.m11 = *(_OWORD *)&self->_transform.m11;
  *(_OWORD *)&v24.m13 = v17;
  long long v18 = *(_OWORD *)&self->_transform.m23;
  *(_OWORD *)&v24.m21 = *(_OWORD *)&self->_transform.m21;
  *(_OWORD *)&v24.m23 = v18;
  if (CATransform3DIsIdentity(&v24))
  {
    self->_frame.origin.double x = x;
    self->_frame.origin.double y = y;
    self->_frame.size.double width = width;
    self->_frame.size.double height = height;
  }
  else
  {
    CGSize v19 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_frame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_frame.size = v19;
  }
}

- (void)setSize:(CGSize)size
{
  double height = size.height;
  double width = size.width;
  if (dyld_program_sdk_at_least())
  {
    if (fabs(width) == INFINITY || (double v7 = fabs(height), v7 >= INFINITY) && v7 <= INFINITY)
    {
      v8 = [MEMORY[0x1E4F28B00] currentHandler];
      v12.double width = width;
      v12.double height = height;
      double v9 = NSStringFromCGSize(v12);
      objc_msgSend(v8, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICollectionViewLayout.m", 466, @"UICollectionViewLayoutAttributes: -setSize: requires finite dimensions. Attributes: %@; new size: %@",
        self,
        v9);
    }
  }
  if (width != self->_size.width || height != self->_size.height)
  {
    self->_size.double width = width;
    self->_size.double height = height;
    CGSize v11 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_frame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_frame.size = v11;
  }
}

- (void)setCenter:(CGPoint)center
{
  double x = center.x;
  double y = center.y;
  int v5 = dyld_program_sdk_at_least();
  double v7 = x;
  double v6 = y;
  if (v5)
  {
    if (fabs(x) == INFINITY || (double v8 = fabs(y), v8 >= INFINITY) && v8 <= INFINITY)
    {
      double v9 = [MEMORY[0x1E4F28B00] currentHandler];
      v15.double x = x;
      v15.double y = y;
      v10 = NSStringFromCGPoint(v15);
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICollectionViewLayout.m", 477, @"UICollectionViewLayoutAttributes: -setCenter: requires finite coordinates. Attributes: %@; new center: %@",
        self,
        v10);

      double v7 = x;
      double v6 = y;
    }
  }
  if (v7 != self->_center.x || v6 != self->_center.y)
  {
    if (!CGRectIsNull(self->_frame))
    {
      v12.f64[0] = x;
      v12.f64[1] = y;
      self->_frame.origin = (CGPoint)vaddq_f64((float64x2_t)self->_frame.origin, vsubq_f64(v12, (float64x2_t)self->_center));
    }
    self->_center.double x = x;
    self->_center.double y = y;
  }
}

+ (UICollectionViewLayoutAttributes)layoutAttributesForCellWithIndexPath:(NSIndexPath *)indexPath
{
  id v4 = objc_alloc_init((Class)a1);
  *((_WORD *)v4 + 144) |= 1u;
  objc_storeStrong((id *)v4 + 1, @"UICollectionElementKindCell");
  objc_storeStrong((id *)v4 + 2, indexPath);
  return (UICollectionViewLayoutAttributes *)v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  *((void *)v4 + 12) = *(void *)&self->_alpha;
  *((_WORD *)v4 + 144) = *((_WORD *)v4 + 144) & 0xFFFB | *(_WORD *)&self->_layoutFlags & 4;
  objc_storeStrong((id *)v4 + 2, self->_indexPath);
  uint64_t v5 = [(NSString *)self->_reuseIdentifier copy];
  double v6 = (void *)*((void *)v4 + 3);
  *((void *)v4 + 3) = v5;

  uint64_t v7 = [(NSString *)self->_elementKind copy];
  double v8 = (void *)*((void *)v4 + 1);
  *((void *)v4 + 1) = v7;

  *((void *)v4 + 37) = self->_zIndex;
  int v9 = *((_WORD *)v4 + 144) & 0xFFFE | *(_WORD *)&self->_layoutFlags & 1;
  *((_WORD *)v4 + 144) = *((_WORD *)v4 + 144) & 0xFFFE | *(_WORD *)&self->_layoutFlags & 1;
  unsigned int v10 = v9 & 0xFFFFFFFD | (2 * ((*(_WORD *)&self->_layoutFlags >> 1) & 1));
  *((_WORD *)v4 + 144) = v10;
  *((_WORD *)v4 + 144) = v10 & 0xFFF7 | *(_WORD *)&self->_layoutFlags & 8;
  *((void *)v4 + 13) = [(UICollectionViewLayoutAttributes *)self _zPosition];
  int v11 = *((_WORD *)v4 + 144) & 0xFFEF | (16 * ((*(_WORD *)&self->_layoutFlags >> 4) & 1));
  *((_WORD *)v4 + 144) = v11;
  unsigned int v12 = v11 & 0xFFFFFE1F | (32 * ((*(_WORD *)&self->_layoutFlags >> 5) & 0xF));
  *((_WORD *)v4 + 144) = v12;
  *((void *)v4 + 39) = *(void *)&self->_cornerRadius;
  CGSize size = self->_maskViewFrame.size;
  *((_OWORD *)v4 + 15) = self->_maskViewFrame.origin;
  *((CGSize *)v4 + 16) = size;
  unsigned int v14 = v12 & 0xFFFFFBFF | (((*(_WORD *)&self->_layoutFlags >> 10) & 1) << 10);
  *((_WORD *)v4 + 144) = v14;
  *((_WORD *)v4 + 144) = v14 & 0xFDFF | *(_WORD *)&self->_layoutFlags & 0x200;
  long long v15 = *(_OWORD *)&self->_defaultLayoutMargins.bottom;
  *((_OWORD *)v4 + 20) = *(_OWORD *)&self->_defaultLayoutMargins.top;
  *((_OWORD *)v4 + 21) = v15;
  objc_storeStrong((id *)v4 + 34, self->_preferredSizingData);
  uint64_t v16 = [(_UICollectionLayoutListAttributes *)self->_listAttributes copy];
  long long v17 = (void *)*((void *)v4 + 35);
  *((void *)v4 + 35) = v16;

  long long v18 = _getCustomAttributes(self);
  CGSize v19 = v18;
  if (v18)
  {
    v20 = (void *)[v18 mutableCopy];
    objc_setAssociatedObject(v4, &_UICollectionViewLayoutCustomAttributesKey, v20, (void *)1);

    __int16 v21 = *((_WORD *)v4 + 144) | 0x1000;
    *((_WORD *)v4 + 144) = v21;
  }
  else
  {
    __int16 v21 = *((_WORD *)v4 + 144);
  }
  *((void *)v4 + 38) = self->_selectionGrouping;
  *((_WORD *)v4 + 144) = *(_WORD *)&self->_layoutFlags & 0x800 | v21 & 0xF7FF;
  long long v22 = *(_OWORD *)&self->_transform.m11;
  long long v23 = *(_OWORD *)&self->_transform.m13;
  long long v24 = *(_OWORD *)&self->_transform.m23;
  *((_OWORD *)v4 + 9) = *(_OWORD *)&self->_transform.m21;
  *((_OWORD *)v4 + 10) = v24;
  *((_OWORD *)v4 + 7) = v22;
  *((_OWORD *)v4 + 8) = v23;
  long long v25 = *(_OWORD *)&self->_transform.m31;
  long long v26 = *(_OWORD *)&self->_transform.m33;
  long long v27 = *(_OWORD *)&self->_transform.m43;
  *((_OWORD *)v4 + 13) = *(_OWORD *)&self->_transform.m41;
  *((_OWORD *)v4 + 14) = v27;
  *((_OWORD *)v4 + 11) = v25;
  *((_OWORD *)v4 + 12) = v26;
  *((_OWORD *)v4 + 2) = self->_center;
  *((_OWORD *)v4 + 3) = self->_size;
  CGSize v28 = self->_frame.size;
  *((_OWORD *)v4 + 4) = self->_frame.origin;
  *((CGSize *)v4 + 5) = v28;

  return v4;
}

- (UICollectionViewLayoutAttributes)init
{
  v11.receiver = self;
  v11.super_class = (Class)UICollectionViewLayoutAttributes;
  result = [(UICollectionViewLayoutAttributes *)&v11 init];
  if (result)
  {
    char v3 = (_OWORD *)MEMORY[0x1E4F39B10];
    long long v4 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 80);
    *(_OWORD *)&result->_transform.m31 = *(_OWORD *)(MEMORY[0x1E4F39B10] + 64);
    *(_OWORD *)&result->_transform.m33 = v4;
    long long v5 = v3[7];
    *(_OWORD *)&result->_transform.m41 = v3[6];
    *(_OWORD *)&result->_transform.m43 = v5;
    long long v6 = v3[1];
    *(_OWORD *)&result->_transform.m11 = *v3;
    *(_OWORD *)&result->_transform.m13 = v6;
    long long v7 = v3[3];
    *(_OWORD *)&result->_transform.m21 = v3[2];
    *(_OWORD *)&result->_transform.m23 = v7;
    CGPoint v8 = (CGPoint)*MEMORY[0x1E4F1DB20];
    CGSize v9 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    result->_frame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    result->_frame.CGSize size = v9;
    __int16 layoutFlags = (__int16)result->_layoutFlags;
    result->_alpha = 1.0;
    result->_zPosition = 0;
    result->_maskViewFrame.origin = v8;
    result->_maskViewFrame.CGSize size = v9;
    *(_WORD *)&result->___int16 layoutFlags = layoutFlags & 0xFE17 | 0x1E0;
  }
  return result;
}

- (int64_t)_zPosition
{
  return self->_zPosition;
}

- (void)_setMaskedCorners:(uint64_t)a1
{
  if (a1)
  {
    if (a2 >= 0x10)
    {
      long long v4 = [MEMORY[0x1E4F28B00] currentHandler];
      objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", sel__setMaskedCorners_, a1, @"UICollectionViewLayout.m", 261, @"CACornerMask value (%ld) does not fit in bitfield reserved space", a2);
    }
    *(_WORD *)(a1 + 288) = *(_WORD *)(a1 + 288) & 0xFE1F | (32 * (a2 & 0xF));
  }
}

- (void)setAlpha:(CGFloat)alpha
{
  self->_alpha = alpha;
}

+ (UICollectionViewLayoutAttributes)layoutAttributesForDecorationViewOfKind:(NSString *)decorationViewKind withIndexPath:(NSIndexPath *)indexPath
{
  long long v6 = (id *)objc_alloc_init((Class)a1);
  objc_storeStrong(v6 + 2, indexPath);
  uint64_t v7 = [(NSString *)decorationViewKind copy];
  id v8 = v6[1];
  v6[1] = (id)v7;

  uint64_t v9 = [(NSString *)decorationViewKind copy];
  id v10 = v6[3];
  v6[3] = (id)v9;

  *((_WORD *)v6 + 144) |= 2u;
  return (UICollectionViewLayoutAttributes *)v6;
}

- (void)_setPreferredSizingData:(uint64_t)a1
{
  if (a1) {
    objc_storeStrong((id *)(a1 + 272), a2);
  }
}

- (double)_listLayoutItemMaxWidth
{
  char v3 = -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)&self->super.isa);

  if (!v3) {
    return 0.0;
  }
  -[UICollectionViewLayoutAttributes _existingListAttributes]((id *)&self->super.isa);
  long long v4 = (double *)objc_claimAutoreleasedReturnValue();
  if (v4) {
    double v5 = v4[8];
  }
  else {
    double v5 = 0.0;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = [(NSIndexPath *)self->_indexPath hash];
  NSUInteger v4 = [(NSString *)self->_elementKind hash];
  uint64_t v5 = 1231;
  if ((*(_WORD *)&self->_layoutFlags & 8) == 0) {
    uint64_t v5 = 1237;
  }
  return v4 ^ v3 ^ v5;
}

- (CGRect)frame
{
  if (CGRectIsNull(self->_frame))
  {
    uint64_t v3 = (void *)__geometryCalculationLayer;
    if (!__geometryCalculationLayer)
    {
      id v4 = objc_alloc_init(MEMORY[0x1E4F39BE8]);
      uint64_t v5 = (void *)__geometryCalculationLayer;
      __geometryCalculationLayer = (uint64_t)v4;

      uint64_t v3 = (void *)__geometryCalculationLayer;
    }
    objc_msgSend(v3, "setPosition:", self->_center.x, self->_center.y);
    objc_msgSend((id)__geometryCalculationLayer, "setBounds:", 0.0, 0.0, self->_size.width, self->_size.height);
    long long v6 = *(_OWORD *)&self->_transform.m33;
    v14[4] = *(_OWORD *)&self->_transform.m31;
    v14[5] = v6;
    long long v7 = *(_OWORD *)&self->_transform.m43;
    v14[6] = *(_OWORD *)&self->_transform.m41;
    v14[7] = v7;
    long long v8 = *(_OWORD *)&self->_transform.m13;
    v14[0] = *(_OWORD *)&self->_transform.m11;
    v14[1] = v8;
    long long v9 = *(_OWORD *)&self->_transform.m23;
    v14[2] = *(_OWORD *)&self->_transform.m21;
    v14[3] = v9;
    [(id)__geometryCalculationLayer setTransform:v14];
    [(id)__geometryCalculationLayer frame];
    self->_frame.origin.double x = x;
    self->_frame.origin.double y = y;
    self->_frame.size.double width = width;
    self->_frame.size.double height = height;
  }
  else
  {
    double x = self->_frame.origin.x;
    double y = self->_frame.origin.y;
    double width = self->_frame.size.width;
    double height = self->_frame.size.height;
  }
  result.size.double height = height;
  result.size.double width = width;
  result.origin.double y = y;
  result.origin.double x = x;
  return result;
}

- (id)_existingListAttributes
{
  if (a1)
  {
    a1 = (id *)a1[35];
    uint64_t v1 = vars8;
  }
  return a1;
}

- (CGFloat)alpha
{
  return self->_alpha;
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self)
  {
    LOBYTE(v5) = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = [(NSIndexPath *)self->_indexPath isEqual:*((void *)a3 + 2)];
      if (v5)
      {
        LOBYTE(v5) = -[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)self, (uint64_t)a3);
      }
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  return v5;
}

- (uint64_t)_isEquivalentTo:(uint64_t)a1
{
  uint64_t result = 0;
  if (!a1 || !a2) {
    return result;
  }
  if (*(double *)(a1 + 96) != 0.0)
  {
    int v5 = *(unsigned __int16 *)(a1 + 288);
    if (*(double *)(a2 + 96) != 0.0)
    {
      if (((v5 ^ *(unsigned __int16 *)(a2 + 288)) & 4) != 0) {
        return 0;
      }
      goto LABEL_10;
    }
    goto LABEL_7;
  }
  if (*(double *)(a2 + 96) != 0.0)
  {
    LOWORD(v5) = *(_WORD *)(a2 + 288);
LABEL_7:
    if ((v5 & 4) == 0) {
      return 0;
    }
  }
LABEL_10:
  float64x2_t v6 = (float64x2_t)vdupq_n_s64(0x3E80000000000000uLL);
  int32x2_t v7 = vmovn_s64(vcgtq_f64(v6, vabdq_f64(*(float64x2_t *)(a1 + 32), *(float64x2_t *)(a2 + 32))));
  if ((v7.i32[0] & v7.i32[1] & 1) == 0) {
    return 0;
  }
  int32x2_t v8 = vmovn_s64(vcgtq_f64(v6, vabdq_f64(*(float64x2_t *)(a1 + 48), *(float64x2_t *)(a2 + 48))));
  if ((v8.i32[1] & v8.i32[0] & 1) == 0) {
    return 0;
  }
  long long v9 = *(_OWORD *)(a1 + 192);
  *(_OWORD *)&a.m31 = *(_OWORD *)(a1 + 176);
  *(_OWORD *)&a.m33 = v9;
  long long v10 = *(_OWORD *)(a1 + 224);
  *(_OWORD *)&a.m41 = *(_OWORD *)(a1 + 208);
  *(_OWORD *)&a.m43 = v10;
  long long v11 = *(_OWORD *)(a1 + 128);
  *(_OWORD *)&a.m11 = *(_OWORD *)(a1 + 112);
  *(_OWORD *)&a.m13 = v11;
  long long v12 = *(_OWORD *)(a1 + 160);
  *(_OWORD *)&a.m21 = *(_OWORD *)(a1 + 144);
  *(_OWORD *)&a.m23 = v12;
  long long v13 = *(_OWORD *)(a2 + 192);
  *(_OWORD *)&v26.m31 = *(_OWORD *)(a2 + 176);
  *(_OWORD *)&v26.m33 = v13;
  long long v14 = *(_OWORD *)(a2 + 224);
  *(_OWORD *)&v26.m41 = *(_OWORD *)(a2 + 208);
  *(_OWORD *)&v26.m43 = v14;
  long long v15 = *(_OWORD *)(a2 + 128);
  *(_OWORD *)&v26.m11 = *(_OWORD *)(a2 + 112);
  *(_OWORD *)&v26.m13 = v15;
  long long v16 = *(_OWORD *)(a2 + 160);
  *(_OWORD *)&v26.m21 = *(_OWORD *)(a2 + 144);
  *(_OWORD *)&v26.m23 = v16;
  uint64_t result = CATransform3DEqualToTransform(&a, &v26);
  if (!result) {
    return result;
  }
  if (*(void *)(a1 + 296) != *(void *)(a2 + 296)) {
    return 0;
  }
  if (((*(unsigned __int16 *)(a2 + 288) ^ *(unsigned __int16 *)(a1 + 288)) & 8) != 0) {
    return 0;
  }
  double v17 = *(double *)(a1 + 96);
  [(id)a2 alpha];
  if (v17 != v18
    || ((*(_WORD *)(a2 + 288) ^ *(_WORD *)(a1 + 288)) & 0x1F0) != 0
    || *(double *)(a1 + 312) != *(double *)(a2 + 312)
    || *(void *)(a1 + 304) != *(void *)(a2 + 304))
  {
    return 0;
  }
  uint64_t result = CGRectEqualToRect(*(CGRect *)(a1 + 240), *(CGRect *)(a2 + 240));
  if (!result) {
    return result;
  }
  unsigned int v19 = *(unsigned __int16 *)(a1 + 288);
  unsigned int v20 = *(unsigned __int16 *)(a2 + 288);
  if ((((unsigned __int16)v20 ^ (unsigned __int16)v19) & 0xC00) != 0) {
    return 0;
  }
  int v21 = (v19 >> 9) & 1;
  if (v21 != ((v20 >> 9) & 1)
    || v21
    && (vminv_u16((uint16x4_t)vcltz_s16(vshl_n_s16(vmovn_s32(vuzp1q_s32((int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 320), *(float64x2_t *)(a2 + 320)), (int32x4_t)vceqq_f64(*(float64x2_t *)(a1 + 336), *(float64x2_t *)(a2 + 336)))), 0xFuLL))) & 1) == 0)
  {
    return 0;
  }
  long long v22 = *(void **)(a1 + 8);
  if (v22 == *(void **)(a2 + 8) || (uint64_t result = objc_msgSend(v22, "isEqualToString:"), result))
  {
    uint64_t result = UIEqual(*(void **)(a1 + 272), *(void **)(a2 + 272));
    if (result)
    {
      uint64_t result = UIEqual(*(void **)(a1 + 280), *(void **)(a2 + 280));
      if (result)
      {
        long long v23 = _getCustomAttributes((_WORD *)a1);
        long long v24 = _getCustomAttributes((_WORD *)a2);
        uint64_t v25 = UIEqual(v23, v24);

        return v25;
      }
    }
  }
  return result;
}

- (CGRect)bounds
{
  [(UICollectionViewLayoutAttributes *)self size];
  double v3 = v2;
  double v5 = v4;
  double v6 = 0.0;
  double v7 = 0.0;
  result.size.double height = v5;
  result.size.double width = v3;
  result.origin.double y = v7;
  result.origin.double x = v6;
  return result;
}

- (CGPoint)center
{
  double x = self->_center.x;
  double y = self->_center.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (CATransform3D)transform3D
{
  long long v3 = *(_OWORD *)&self[1].m31;
  *(_OWORD *)&retstr->m31 = *(_OWORD *)&self[1].m23;
  *(_OWORD *)&retstr->m33 = v3;
  long long v4 = *(_OWORD *)&self[1].m41;
  *(_OWORD *)&retstr->m41 = *(_OWORD *)&self[1].m33;
  *(_OWORD *)&retstr->m43 = v4;
  long long v5 = *(_OWORD *)&self[1].m11;
  *(_OWORD *)&retstr->m11 = *(_OWORD *)&self->m43;
  *(_OWORD *)&retstr->m13 = v5;
  long long v6 = *(_OWORD *)&self[1].m21;
  *(_OWORD *)&retstr->m21 = *(_OWORD *)&self[1].m13;
  *(_OWORD *)&retstr->m23 = v6;
  return self;
}

- (BOOL)_hasMaskViewFrame
{
  if (result) {
    return !CGRectIsNull(*(CGRect *)(result + 240));
  }
  return result;
}

- (BOOL)isHidden
{
  return (*(_WORD *)&self->_layoutFlags >> 2) & 1;
}

- (void)setHidden:(BOOL)hidden
{
  if (hidden) {
    __int16 v3 = 4;
  }
  else {
    __int16 v3 = 0;
  }
  *(_WORD *)&self->___int16 layoutFlags = *(_WORD *)&self->_layoutFlags & 0xFFFB | v3;
}

+ (UICollectionViewLayoutAttributes)layoutAttributesForSupplementaryViewOfKind:(NSString *)elementKind withIndexPath:(NSIndexPath *)indexPath
{
  id v6 = objc_alloc_init((Class)a1);
  uint64_t v7 = [(NSString *)elementKind copy];
  int32x2_t v8 = (void *)*((void *)v6 + 1);
  *((void *)v6 + 1) = v7;

  objc_storeStrong((id *)v6 + 2, indexPath);
  return (UICollectionViewLayoutAttributes *)v6;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)__indexPath
{
  if (result)
  {
    CGSize result = (void *)result[2];
    if (!result)
    {
      CGSize result = (void *)__indexPath_sharedNotFoundPath;
      if (!__indexPath_sharedNotFoundPath)
      {
        CGSize result = (id)[MEMORY[0x1E4F28D58] indexPathForItem:0x7FFFFFFFFFFFFFFFLL inSection:0x7FFFFFFFFFFFFFFFLL];
        __indexPath_sharedNotFoundPath = (uint64_t)result;
      }
    }
  }
  return result;
}

- (void)_setZPosition:(int64_t)a3
{
  self->_zPosition = a3;
}

- (UICollectionElementCategory)representedElementCategory
{
  if (self)
  {
    __int16 v2 = *(_WORD *)(self + 288);
    UICollectionElementCategory v3 = UICollectionElementCategorySupplementaryView;
    if ((v2 & 2) != 0) {
      UICollectionElementCategory v3 = UICollectionElementCategoryDecorationView;
    }
    if (v2) {
      return 0;
    }
    else {
      return v3;
    }
  }
  return self;
}

- (NSString)representedElementKind
{
  if (*(_WORD *)&self->_layoutFlags) {
    elementKind = 0;
  }
  else {
    elementKind = self->_elementKind;
  }
  UICollectionElementCategory v3 = elementKind;
  return v3;
}

- (void)setBounds:(CGRect)bounds
{
  double height = bounds.size.height;
  double width = bounds.size.width;
  CGFloat y = bounds.origin.y;
  CGFloat x = bounds.origin.x;
  if (bounds.origin.x != 0.0 || bounds.origin.y != 0.0)
  {
    long long v9 = [MEMORY[0x1E4F28B00] currentHandler];
    v12.origin.CGFloat x = x;
    v12.origin.CGFloat y = y;
    v12.size.double width = width;
    v12.size.double height = height;
    long long v10 = NSStringFromCGRect(v12);
    [v9 handleFailureInMethod:a2, self, @"UICollectionViewLayout.m", 444, @"UICollectionViewLayoutAttributes bounds must be set with a (0,0) origin %@ - %@", self, v10 object file lineNumber description];
  }
  -[UICollectionViewLayoutAttributes setSize:](self, "setSize:", width, height);
}

- (void)setIndexPath:(NSIndexPath *)indexPath
{
}

- (id)initialLayoutAttributesForInsertedDecorationElementOfKind:(id)a3 atIndexPath:(id)a4
{
  return 0;
}

- (void)setTransform3D:(CATransform3D *)transform3D
{
  if (dyld_program_sdk_at_least())
  {
    long long v6 = *(_OWORD *)&transform3D->m33;
    *(_OWORD *)&a.m31 = *(_OWORD *)&transform3D->m31;
    *(_OWORD *)&a.m33 = v6;
    long long v7 = *(_OWORD *)&transform3D->m43;
    *(_OWORD *)&a.m41 = *(_OWORD *)&transform3D->m41;
    *(_OWORD *)&a.m43 = v7;
    long long v8 = *(_OWORD *)&transform3D->m13;
    *(_OWORD *)&a.m11 = *(_OWORD *)&transform3D->m11;
    *(_OWORD *)&a.m13 = v8;
    long long v9 = *(_OWORD *)&transform3D->m23;
    *(_OWORD *)&a.m21 = *(_OWORD *)&transform3D->m21;
    *(_OWORD *)&a.m23 = v9;
    if ((_UICATransform3DHasFiniteMembers((float64x2_t *)&a) & 1) == 0)
    {
      uint64_t v25 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v26 = *(_OWORD *)&transform3D->m33;
      *(_OWORD *)&a.m31 = *(_OWORD *)&transform3D->m31;
      *(_OWORD *)&a.m33 = v26;
      long long v27 = *(_OWORD *)&transform3D->m43;
      *(_OWORD *)&a.m41 = *(_OWORD *)&transform3D->m41;
      *(_OWORD *)&a.m43 = v27;
      long long v28 = *(_OWORD *)&transform3D->m13;
      *(_OWORD *)&a.m11 = *(_OWORD *)&transform3D->m11;
      *(_OWORD *)&a.m13 = v28;
      long long v29 = *(_OWORD *)&transform3D->m23;
      *(_OWORD *)&a.m21 = *(_OWORD *)&transform3D->m21;
      *(_OWORD *)&a.m23 = v29;
      CGRect v30 = _NSStringFromCATransform3D(&a);
      objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICollectionViewLayout.m", 493, @"UICollectionViewLayoutAttributes: -setTransform3D: requires that all members in the transform matrix are finite numbers. Attributes: %@; new transform: %@",
        self,
        v30);
    }
  }
  long long v10 = *(_OWORD *)&transform3D->m33;
  *(_OWORD *)&a.m31 = *(_OWORD *)&transform3D->m31;
  *(_OWORD *)&a.m33 = v10;
  long long v11 = *(_OWORD *)&transform3D->m43;
  *(_OWORD *)&a.m41 = *(_OWORD *)&transform3D->m41;
  *(_OWORD *)&a.m43 = v11;
  long long v12 = *(_OWORD *)&transform3D->m13;
  *(_OWORD *)&a.m11 = *(_OWORD *)&transform3D->m11;
  *(_OWORD *)&a.m13 = v12;
  long long v13 = *(_OWORD *)&transform3D->m23;
  *(_OWORD *)&a.m21 = *(_OWORD *)&transform3D->m21;
  *(_OWORD *)&a.m23 = v13;
  long long v14 = *(_OWORD *)&self->_transform.m33;
  *(_OWORD *)&b.m31 = *(_OWORD *)&self->_transform.m31;
  *(_OWORD *)&b.m33 = v14;
  long long v15 = *(_OWORD *)&self->_transform.m43;
  *(_OWORD *)&b.m41 = *(_OWORD *)&self->_transform.m41;
  *(_OWORD *)&b.m43 = v15;
  long long v16 = *(_OWORD *)&self->_transform.m13;
  *(_OWORD *)&b.m11 = *(_OWORD *)&self->_transform.m11;
  *(_OWORD *)&b.m13 = v16;
  long long v17 = *(_OWORD *)&self->_transform.m23;
  *(_OWORD *)&b.m21 = *(_OWORD *)&self->_transform.m21;
  *(_OWORD *)&b.m23 = v17;
  if (!CATransform3DEqualToTransform(&a, &b))
  {
    long long v18 = *(_OWORD *)&transform3D->m11;
    long long v19 = *(_OWORD *)&transform3D->m13;
    long long v20 = *(_OWORD *)&transform3D->m23;
    *(_OWORD *)&self->_transform.m21 = *(_OWORD *)&transform3D->m21;
    *(_OWORD *)&self->_transform.m23 = v20;
    *(_OWORD *)&self->_transform.m11 = v18;
    *(_OWORD *)&self->_transform.m13 = v19;
    long long v21 = *(_OWORD *)&transform3D->m31;
    long long v22 = *(_OWORD *)&transform3D->m33;
    long long v23 = *(_OWORD *)&transform3D->m43;
    *(_OWORD *)&self->_transform.m41 = *(_OWORD *)&transform3D->m41;
    *(_OWORD *)&self->_transform.m43 = v23;
    *(_OWORD *)&self->_transform.m31 = v21;
    *(_OWORD *)&self->_transform.m33 = v22;
    CGSize v24 = *(CGSize *)(MEMORY[0x1E4F1DB20] + 16);
    self->_frame.origin = (CGPoint)*MEMORY[0x1E4F1DB20];
    self->_frame.CGSize size = v24;
  }
}

- (void)setTransform:(CGAffineTransform *)transform
{
  if (dyld_program_sdk_at_least())
  {
    float64x2_t v6 = *(float64x2_t *)&transform->tx;
    *(int32x2_t *)v7.i8 = vmovn_s64((int64x2_t)vorrq_s8((int8x16_t)vcltzq_f64(v6), (int8x16_t)vcgezq_f64(v6)));
    v7.i64[1] = -1;
    float64x2_t v8 = (float64x2_t)vdupq_n_s64(0x7FF0000000000000uLL);
    *(int32x2_t *)&v6.f64[0] = vmovn_s64((int64x2_t)vmvnq_s8((int8x16_t)vceqq_f64(vabsq_f64(v6), v8)));
    v6.f64[1] = NAN;
    int8x8_t v9 = vmovn_s16((int16x8_t)vandq_s8((int8x16_t)vuzp1q_s16((int16x8_t)vmvnq_s8((int8x16_t)vuzp1q_s32((int32x4_t)vceqq_f64(vabsq_f64(*(float64x2_t *)&transform->a), v8), (int32x4_t)vceqq_f64(vabsq_f64(*(float64x2_t *)&transform->c), v8))), (int16x8_t)v6), (int8x16_t)vuzp1q_s16((int16x8_t)vuzp1q_s32((int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*(float64x2_t *)&transform->a), (int8x16_t)vcgezq_f64(*(float64x2_t *)&transform->a)), (int32x4_t)vorrq_s8((int8x16_t)vcltzq_f64(*(float64x2_t *)&transform->c), (int8x16_t)vcgezq_f64(*(float64x2_t *)&transform->c))), v7)));
    v10.i32[0] = v9.u8[4];
    v10.i32[1] = v9.u8[5];
    LODWORD(v6.f64[0]) = v9.u8[0];
    HIDWORD(v6.f64[0]) = v9.u8[1];
    v11.i32[0] = v9.u8[6];
    v11.i32[1] = v9.u8[7];
    LODWORD(v8.f64[0]) = v9.u8[2];
    HIDWORD(v8.f64[0]) = v9.u8[3];
    int8x8_t v12 = vand_s8(vand_s8(*(int8x8_t *)&v6.f64[0], v10), vand_s8(*(int8x8_t *)&v8.f64[0], v11));
    v13.i64[0] = v12.u32[0];
    v13.i64[1] = v12.u32[1];
    int64x2_t v14 = vcltzq_s64(vshlq_n_s64(v13, 0x3FuLL));
    if ((vandq_s8((int8x16_t)v14, (int8x16_t)vdupq_laneq_s64(v14, 1)).u64[0] & 0x8000000000000000) == 0)
    {
      long long v16 = [MEMORY[0x1E4F28B00] currentHandler];
      long long v17 = *(_OWORD *)&transform->c;
      *(_OWORD *)&m.CATransform3D a = *(_OWORD *)&transform->a;
      *(_OWORD *)&m.c = v17;
      *(_OWORD *)&m.tCGFloat x = *(_OWORD *)&transform->tx;
      long long v18 = NSStringFromCGAffineTransform(&m);
      objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"UICollectionViewLayout.m", 507, @"UICollectionViewLayoutAttributes: -setTransform: requires that all members in the transform matrix be finite numbers. Attributes: %@; new transform: %@",
        self,
        v18);
    }
  }
  long long v15 = *(_OWORD *)&transform->c;
  *(_OWORD *)&m.CATransform3D a = *(_OWORD *)&transform->a;
  *(_OWORD *)&m.c = v15;
  *(_OWORD *)&m.tCGFloat x = *(_OWORD *)&transform->tx;
  CATransform3DMakeAffineTransform(&v19, &m);
  [(UICollectionViewLayoutAttributes *)self setTransform3D:&v19];
}

- (CGAffineTransform)transform
{
  long long v5 = *(_OWORD *)&self->_transform.m33;
  *(_OWORD *)&v16.m31 = *(_OWORD *)&self->_transform.m31;
  *(_OWORD *)&v16.m33 = v5;
  long long v6 = *(_OWORD *)&self->_transform.m43;
  *(_OWORD *)&v16.m41 = *(_OWORD *)&self->_transform.m41;
  *(_OWORD *)&v16.m43 = v6;
  long long v7 = *(_OWORD *)&self->_transform.m13;
  *(_OWORD *)&v16.m11 = *(_OWORD *)&self->_transform.m11;
  *(_OWORD *)&v16.m13 = v7;
  long long v8 = *(_OWORD *)&self->_transform.m23;
  *(_OWORD *)&v16.m21 = *(_OWORD *)&self->_transform.m21;
  *(_OWORD *)&v16.m23 = v8;
  CGSize result = (CGAffineTransform *)MEMORY[0x18C1031B0](&v16, a3);
  if (result)
  {
    long long v10 = *(_OWORD *)&self->_transform.m33;
    *(_OWORD *)&v16.m31 = *(_OWORD *)&self->_transform.m31;
    *(_OWORD *)&v16.m33 = v10;
    long long v11 = *(_OWORD *)&self->_transform.m43;
    *(_OWORD *)&v16.m41 = *(_OWORD *)&self->_transform.m41;
    *(_OWORD *)&v16.m43 = v11;
    long long v12 = *(_OWORD *)&self->_transform.m13;
    *(_OWORD *)&v16.m11 = *(_OWORD *)&self->_transform.m11;
    *(_OWORD *)&v16.m13 = v12;
    long long v13 = *(_OWORD *)&self->_transform.m23;
    *(_OWORD *)&v16.m21 = *(_OWORD *)&self->_transform.m21;
    *(_OWORD *)&v16.m23 = v13;
    return CATransform3DGetAffineTransform(retstr, &v16);
  }
  else
  {
    uint64_t v14 = MEMORY[0x1E4F1DAB8];
    long long v15 = *(_OWORD *)(MEMORY[0x1E4F1DAB8] + 16);
    *(_OWORD *)&retstr->CATransform3D a = *MEMORY[0x1E4F1DAB8];
    *(_OWORD *)&retstr->c = v15;
    *(_OWORD *)&retstr->tCGFloat x = *(_OWORD *)(v14 + 32);
  }
  return result;
}

- (NSString)description
{
  UICollectionElementCategory v3 = (void *)MEMORY[0x1E4F28E78];
  long long v4 = (objc_class *)objc_opt_class();
  long long v5 = NSStringFromClass(v4);
  long long v6 = [v3 stringWithFormat:@"<%@: %p; ", v5, self];

  long long v7 = [(NSIndexPath *)self->_indexPath _ui_shortDescription];
  [v6 appendFormat:@"index path: %@; ", v7];

  if ((*(_WORD *)&self->_layoutFlags & 1) == 0) {
    [v6 appendFormat:@"element kind: (%@); ", self->_elementKind];
  }
  [(UICollectionViewLayoutAttributes *)self frame];
  objc_msgSend(v6, "appendFormat:", @"frame = (%g %g; %g %g); ", v8, v9, v10, v11);
  memset(&v19, 0, sizeof(v19));
  [(UICollectionViewLayoutAttributes *)self transform3D];
  CATransform3D v18 = v19;
  if (!CATransform3DIsIdentity(&v18))
  {
    CATransform3D v18 = v19;
    if (MEMORY[0x18C1031B0](&v18))
    {
      CATransform3D v18 = v19;
      CATransform3DGetAffineTransform(&transform, &v18);
      long long v12 = NSStringFromCGAffineTransform(&transform);
      [v6 appendFormat:@"transforCGAffineTransform m = %@; ", v12];
    }
    else
    {
      [v6 appendString:@"non-affine transform; "];
    }
  }
  if ([(UICollectionViewLayoutAttributes *)self isHidden]) {
    [v6 appendFormat:@"hidden = YES; "];
  }
  [(UICollectionViewLayoutAttributes *)self alpha];
  if (v13 != 1.0) {
    objc_msgSend(v6, "appendFormat:", @"alphCATransform3D a = %g; ", *(void *)&v13);
  }
  if (self->_zIndex) {
    objc_msgSend(v6, "appendFormat:", @"zIndeCGFloat x = %ld; ", self->_zIndex);
  }
  if ((*(_WORD *)&self->_layoutFlags & 8) != 0) {
    [v6 appendFormat:@"IS CLONE; "];
  }
  uint64_t v14 = [v6 rangeOfString:@"; " options:4];
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    [v6 appendString:@">"];
  }
  else {
    objc_msgSend(v6, "replaceCharactersInRange:withString:", v14, v15, @">");
  }
  return (NSString *)v6;
}

- (void)_isTransitionVisibleTo:(void *)result
{
  if (result)
  {
    UICollectionElementCategory v3 = result;
    [result alpha];
    if (v4 == 0.0) {
      int v5 = 0;
    }
    else {
      int v5 = [v3 isHidden] ^ 1;
    }
    [a2 alpha];
    if (v6 == 0.0) {
      int v7 = 0;
    }
    else {
      int v7 = [a2 isHidden] ^ 1;
    }
    if ((v5 | v7) != 1) {
      return 0;
    }
    [v3 size];
    double v9 = *MEMORY[0x1E4F1DB30];
    double v10 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
    BOOL v12 = v11 == *MEMORY[0x1E4F1DB30] && v8 == v10;
    if (v12 && (([a2 size], v14 == v9) ? (BOOL v15 = v13 == v10) : (BOOL v15 = 0), v15)) {
      return 0;
    }
    else {
      return (void *)(-[UICollectionViewLayoutAttributes _isEquivalentTo:]((uint64_t)v3, (uint64_t)a2) ^ 1);
    }
  }
  return result;
}

@end