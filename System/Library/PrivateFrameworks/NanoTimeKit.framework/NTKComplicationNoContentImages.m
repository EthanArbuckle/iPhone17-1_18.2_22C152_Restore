@interface NTKComplicationNoContentImages
+ (BOOL)supportsSecureCoding;
- (NTKComplicationNoContentImages)initWithCoder:(id)a3;
- (UIImage)circularSmallImage;
- (UIImage)extraLargeImage;
- (UIImage)modularSmallImage;
- (UIImage)utilitarianSmallImage;
- (id)copyWithZone:(_NSZone *)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setCircularSmallImage:(id)a3;
- (void)setExtraLargeImage:(id)a3;
- (void)setModularSmallImage:(id)a3;
- (void)setUtilitarianSmallImage:(id)a3;
@end

@implementation NTKComplicationNoContentImages

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationNoContentImages)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NTKComplicationNoContentImages *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modsm"];
    modularSmallImage = v5->_modularSmallImage;
    v5->_modularSmallImage = (UIImage *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"utlsm"];
    utilitarianSmallImage = v5->_utilitarianSmallImage;
    v5->_utilitarianSmallImage = (UIImage *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"crcsm"];
    circularSmallImage = v5->_circularSmallImage;
    v5->_circularSmallImage = (UIImage *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"modxl"];
    extraLargeImage = v5->_extraLargeImage;
    v5->_extraLargeImage = (UIImage *)v12;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  modularSmallImage = self->_modularSmallImage;
  id v5 = a3;
  [v5 encodeObject:modularSmallImage forKey:@"modsm"];
  [v5 encodeObject:self->_utilitarianSmallImage forKey:@"utlsm"];
  [v5 encodeObject:self->_circularSmallImage forKey:@"crcsm"];
  [v5 encodeObject:self->_extraLargeImage forKey:@"modxl"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [+[NTKComplicationNoContentImages allocWithZone:a3] init];
  objc_storeStrong((id *)&v4->_modularSmallImage, self->_modularSmallImage);
  objc_storeStrong((id *)&v4->_utilitarianSmallImage, self->_utilitarianSmallImage);
  objc_storeStrong((id *)&v4->_circularSmallImage, self->_circularSmallImage);
  objc_storeStrong((id *)&v4->_extraLargeImage, self->_extraLargeImage);
  return v4;
}

- (UIImage)modularSmallImage
{
  return self->_modularSmallImage;
}

- (void)setModularSmallImage:(id)a3
{
}

- (UIImage)utilitarianSmallImage
{
  return self->_utilitarianSmallImage;
}

- (void)setUtilitarianSmallImage:(id)a3
{
}

- (UIImage)circularSmallImage
{
  return self->_circularSmallImage;
}

- (void)setCircularSmallImage:(id)a3
{
}

- (UIImage)extraLargeImage
{
  return self->_extraLargeImage;
}

- (void)setExtraLargeImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extraLargeImage, 0);
  objc_storeStrong((id *)&self->_circularSmallImage, 0);
  objc_storeStrong((id *)&self->_utilitarianSmallImage, 0);
  objc_storeStrong((id *)&self->_modularSmallImage, 0);
}

@end