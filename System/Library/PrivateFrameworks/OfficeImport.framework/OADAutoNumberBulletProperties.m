@interface OADAutoNumberBulletProperties
- (BOOL)isEqual:(id)a3;
- (OADAutoNumberBulletProperties)initWithAutoNumberSchemeType:(int)a3 startIndex:(unint64_t)a4;
- (int)autoNumberSchemeType;
- (unint64_t)hash;
- (unint64_t)startIndex;
@end

@implementation OADAutoNumberBulletProperties

- (OADAutoNumberBulletProperties)initWithAutoNumberSchemeType:(int)a3 startIndex:(unint64_t)a4
{
  v7.receiver = self;
  v7.super_class = (Class)OADAutoNumberBulletProperties;
  result = [(OADAutoNumberBulletProperties *)&v7 init];
  if (result)
  {
    result->mSchemeType = a3;
    result->mStartIndex = a4;
  }
  return result;
}

- (BOOL)isEqual:(id)a3
{
  v4 = a3;
  objc_opt_class();
  BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && self->mSchemeType == v4[2] && self->mStartIndex == *((void *)v4 + 2);

  return v5;
}

- (int)autoNumberSchemeType
{
  return self->mSchemeType;
}

- (unint64_t)startIndex
{
  return self->mStartIndex;
}

- (unint64_t)hash
{
  return self->mStartIndex ^ self->mSchemeType;
}

@end