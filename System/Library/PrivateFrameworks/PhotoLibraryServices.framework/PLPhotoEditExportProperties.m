@interface PLPhotoEditExportProperties
+ (id)exportPropertiesWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4 exifOrientation:(int64_t)a5;
+ (id)exportPropertiesWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4 exifOrientation:(int64_t)a5 duration:(double)a6;
- (double)baseDuration;
- (int64_t)baseEXIFOrientation;
- (unint64_t)imageHeight;
- (unint64_t)imageWidth;
@end

@implementation PLPhotoEditExportProperties

+ (id)exportPropertiesWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4 exifOrientation:(int64_t)a5 duration:(double)a6
{
  v10 = (double *)objc_alloc_init((Class)a1);
  *((void *)v10 + 1) = a5;
  *((void *)v10 + 3) = a3;
  *((void *)v10 + 4) = a4;
  v10[2] = a6;
  return v10;
}

+ (id)exportPropertiesWithImageWidth:(unint64_t)a3 imageHeight:(unint64_t)a4 exifOrientation:(int64_t)a5
{
  return (id)[a1 exportPropertiesWithImageWidth:a3 imageHeight:a4 exifOrientation:a5 duration:0.0];
}

- (unint64_t)imageHeight
{
  return self->_imageHeight;
}

- (unint64_t)imageWidth
{
  return self->_imageWidth;
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