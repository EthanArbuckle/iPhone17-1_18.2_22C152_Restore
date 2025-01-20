@interface PBOutlineBulletKey
- (BOOL)isEqual:(id)a3;
- (PBOutlineBulletKey)initWithOutlineBullet:(id)a3;
- (PBOutlineBulletKey)initWithSlideId:(unsigned int)a3 textType:(int)a4 placeholderIndex:(unsigned int)a5;
- (unint64_t)hash;
@end

@implementation PBOutlineBulletKey

- (PBOutlineBulletKey)initWithOutlineBullet:(id)a3
{
  id v4 = a3;
  v5 = (const void *)[v4 eshObject];
  if (v5
  {
    self = [(PBOutlineBulletKey *)self initWithSlideId:v6[12] textType:v6[13] placeholderIndex:EshRecord::getInstance((EshRecord *)v6)];
    v7 = self;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (PBOutlineBulletKey)initWithSlideId:(unsigned int)a3 textType:(int)a4 placeholderIndex:(unsigned int)a5
{
  v9.receiver = self;
  v9.super_class = (Class)PBOutlineBulletKey;
  result = [(PBOutlineBulletKey *)&v9 init];
  if (result)
  {
    result->mSlideId = a3;
    result->mTextType = a4;
    result->mPlaceholderIndex = a5;
  }
  return result;
}

- (unint64_t)hash
{
  return (LOBYTE(self->mTextType) << 16) | (self->mPlaceholderIndex << 24) | LOWORD(self->mSlideId);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    v5 = v4;
    BOOL v6 = self->mSlideId == v5[2] && self->mTextType == v5[3] && self->mPlaceholderIndex == v5[4];
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

@end