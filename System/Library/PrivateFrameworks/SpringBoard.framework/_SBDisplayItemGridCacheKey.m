@interface _SBDisplayItemGridCacheKey
- (BOOL)isEqual:(id)a3;
- (_SBDisplayItemGridCacheKey)initWithBounds:(CGRect)a3 orientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7;
- (unint64_t)hash;
@end

@implementation _SBDisplayItemGridCacheKey

- (_SBDisplayItemGridCacheKey)initWithBounds:(CGRect)a3 orientation:(int64_t)a4 layoutRestrictionInfo:(id)a5 screenScale:(double)a6 chamoisLayoutAttributes:(id)a7
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  id v16 = a5;
  id v17 = a7;
  v27.receiver = self;
  v27.super_class = (Class)_SBDisplayItemGridCacheKey;
  v18 = [(_SBDisplayItemGridCacheKey *)&v27 init];
  v19 = v18;
  if (v18)
  {
    v18->_bounds.origin.CGFloat x = x;
    v18->_bounds.origin.CGFloat y = y;
    v18->_bounds.size.CGFloat width = width;
    v18->_bounds.size.CGFloat height = height;
    v18->_orientation = a4;
    objc_storeStrong((id *)&v18->_layoutRestrictionInfo, a5);
    v19->_screenScale = a6;
    objc_storeStrong((id *)&v19->_chamoisLayoutAttributes, a7);
    v20 = [MEMORY[0x1E4F4F758] builder];
    id v21 = (id)objc_msgSend(v20, "appendCGRect:", v19->_bounds.origin.x, v19->_bounds.origin.y, v19->_bounds.size.width, v19->_bounds.size.height);
    id v22 = (id)[v20 appendInteger:v19->_orientation];
    id v23 = (id)[v20 appendObject:v19->_layoutRestrictionInfo];
    id v24 = (id)[v20 appendCGFloat:v19->_screenScale];
    if (v19->_chamoisLayoutAttributes) {
      id v25 = (id)objc_msgSend(v20, "appendObject:");
    }
    v19->_cachedHash = [v20 hash];
  }
  return v19;
}

- (unint64_t)hash
{
  return self->_cachedHash;
}

- (BOOL)isEqual:(id)a3
{
  v4 = (_SBDisplayItemGridCacheKey *)a3;
  if (v4 == self)
  {
    char v6 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      if (CGRectEqualToRect(self->_bounds, v5->_bounds)
        && self->_orientation == v5->_orientation
        && BSEqualObjects()
        && self->_screenScale == v5->_screenScale)
      {
        char v6 = BSEqualObjects();
      }
      else
      {
        char v6 = 0;
      }
    }
    else
    {
      char v6 = 0;
    }
  }

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chamoisLayoutAttributes, 0);
  objc_storeStrong((id *)&self->_layoutRestrictionInfo, 0);
}

@end