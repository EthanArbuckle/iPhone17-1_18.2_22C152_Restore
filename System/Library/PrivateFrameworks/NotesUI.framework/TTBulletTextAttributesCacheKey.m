@interface TTBulletTextAttributesCacheKey
- (BOOL)isEqual:(id)a3;
- (TTBulletTextAttributesCacheKey)initWithTextFont:(id)a3 paragraphStyle:(id)a4 zoomFactor:(double)a5;
- (unint64_t)hashValue;
- (void)setHashValue:(unint64_t)a3;
@end

@implementation TTBulletTextAttributesCacheKey

- (TTBulletTextAttributesCacheKey)initWithTextFont:(id)a3 paragraphStyle:(id)a4 zoomFactor:(double)a5
{
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)TTBulletTextAttributesCacheKey;
  v10 = [(TTBulletTextAttributesCacheKey *)&v15 init];
  if (v10)
  {
    uint64_t v11 = [v8 hash];
    uint64_t v12 = [v9 hash];
    float v13 = a5 * 100.0;
    [(TTBulletTextAttributesCacheKey *)v10 setHashValue:v11 ^ v12 ^ vcvtps_u32_f32(v13)];
  }

  return v10;
}

- (void)setHashValue:(unint64_t)a3
{
  self->_hashValue = a3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    unint64_t v5 = [(TTBulletTextAttributesCacheKey *)self hash];
    BOOL v6 = v5 == [v4 hash];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (unint64_t)hashValue
{
  return self->_hashValue;
}

@end