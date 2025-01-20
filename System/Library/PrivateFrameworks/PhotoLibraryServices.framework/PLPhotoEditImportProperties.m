@interface PLPhotoEditImportProperties
+ (id)importPropertiesWithEXIFOrientation:(int64_t)a3;
+ (id)importPropertiesWithEXIFOrientation:(int64_t)a3 duration:(double)a4;
- (double)baseDuration;
- (int64_t)baseEXIFOrientation;
@end

@implementation PLPhotoEditImportProperties

+ (id)importPropertiesWithEXIFOrientation:(int64_t)a3 duration:(double)a4
{
  v6 = (double *)objc_alloc_init((Class)a1);
  if ((unint64_t)(a3 - 1) >= 8) {
    int64_t v7 = 1;
  }
  else {
    int64_t v7 = a3;
  }
  *((void *)v6 + 1) = v7;
  v6[2] = a4;
  return v6;
}

+ (id)importPropertiesWithEXIFOrientation:(int64_t)a3
{
  return (id)[a1 importPropertiesWithEXIFOrientation:a3 duration:0.0];
}

- (double)baseDuration
{
  return self->_baseDuration;
}

- (int64_t)baseEXIFOrientation
{
  return self->_baseEXIFOrientation;
}

@end