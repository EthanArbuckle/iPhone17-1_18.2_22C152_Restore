@interface QLCachedThumbnailDescriptor
- (BOOL)iconMode;
- (BOOL)isEqual:(id)a3;
- (QLCachedThumbnailDescriptor)initWithSize:(float)a3 iconMode:(BOOL)a4 badgeType:(unint64_t)a5;
- (QLCachedThumbnailDescriptor)initWithSize:(float)a3 iconMode:(BOOL)a4 badgeType:(unint64_t)a5 externalGeneratorDataHash:(unint64_t)a6;
- (QLCachedThumbnailDescriptor)initWithThumbnailRequest:(id)a3;
- (float)size;
- (int)interpolationQuality;
- (int64_t)iconVariant;
- (unint64_t)badgeType;
- (unint64_t)externalGeneratorDataHash;
- (unint64_t)hash;
- (void)setExternalGeneratorDataHash:(unint64_t)a3;
- (void)setIconVariant:(int64_t)a3;
- (void)setInterpolationQuality:(int)a3;
@end

@implementation QLCachedThumbnailDescriptor

- (float)size
{
  return self->_size;
}

- (int)interpolationQuality
{
  return self->_interpolationQuality;
}

- (int64_t)iconVariant
{
  return self->_iconVariant;
}

- (BOOL)iconMode
{
  return self->_iconMode;
}

- (unint64_t)externalGeneratorDataHash
{
  return self->_externalGeneratorDataHash;
}

- (unint64_t)badgeType
{
  return self->_badgeType;
}

- (unint64_t)hash
{
  float size = self->_size;
  unint64_t externalGeneratorDataHash = self->_externalGeneratorDataHash;
  if (self->_iconMode) {
    return self->_badgeType ^ externalGeneratorDataHash ^ (unint64_t)size;
  }
  else {
    return -(uint64_t)(self->_badgeType ^ externalGeneratorDataHash ^ (unint64_t)size);
  }
}

- (QLCachedThumbnailDescriptor)initWithSize:(float)a3 iconMode:(BOOL)a4 badgeType:(unint64_t)a5 externalGeneratorDataHash:(unint64_t)a6
{
  v11.receiver = self;
  v11.super_class = (Class)QLCachedThumbnailDescriptor;
  result = [(QLCachedThumbnailDescriptor *)&v11 init];
  if (result)
  {
    result->_float size = a3;
    result->_iconMode = a4;
    result->_badgeType = a5;
    result->_unint64_t externalGeneratorDataHash = a6;
  }
  return result;
}

- (QLCachedThumbnailDescriptor)initWithThumbnailRequest:(id)a3
{
  id v4 = a3;
  [v4 maximumPixelSize];
  int v6 = v5;
  uint64_t v7 = [v4 iconMode];
  uint64_t v8 = [v4 badgeType];
  uint64_t v9 = [v4 externalThumbnailGeneratorDataHash];

  LODWORD(v10) = v6;
  return [(QLCachedThumbnailDescriptor *)self initWithSize:v7 iconMode:v8 badgeType:v9 externalGeneratorDataHash:v10];
}

- (QLCachedThumbnailDescriptor)initWithSize:(float)a3 iconMode:(BOOL)a4 badgeType:(unint64_t)a5
{
  return -[QLCachedThumbnailDescriptor initWithSize:iconMode:badgeType:externalGeneratorDataHash:](self, "initWithSize:iconMode:badgeType:externalGeneratorDataHash:", a4, a5, 0);
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (QLCachedThumbnailDescriptor *)a3;
  if (self == v4)
  {
    BOOL v12 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      int v5 = v4;
      float size = self->_size;
      [(QLCachedThumbnailDescriptor *)v5 size];
      if (size == v7
        && (BOOL iconMode = self->_iconMode, iconMode == [(QLCachedThumbnailDescriptor *)v5 iconMode])
        && (unint64_t badgeType = self->_badgeType, badgeType == [(QLCachedThumbnailDescriptor *)v5 badgeType])
        && (int64_t iconVariant = self->_iconVariant,
            iconVariant == [(QLCachedThumbnailDescriptor *)v5 iconVariant]))
      {
        int interpolationQuality = self->_interpolationQuality;
        BOOL v12 = interpolationQuality == [(QLCachedThumbnailDescriptor *)v5 interpolationQuality];
      }
      else
      {
        BOOL v12 = 0;
      }
    }
    else
    {
      BOOL v12 = 0;
    }
  }

  return v12;
}

- (void)setIconVariant:(int64_t)a3
{
  self->_int64_t iconVariant = a3;
}

- (void)setInterpolationQuality:(int)a3
{
  self->_int interpolationQuality = a3;
}

- (void)setExternalGeneratorDataHash:(unint64_t)a3
{
  self->_unint64_t externalGeneratorDataHash = a3;
}

@end