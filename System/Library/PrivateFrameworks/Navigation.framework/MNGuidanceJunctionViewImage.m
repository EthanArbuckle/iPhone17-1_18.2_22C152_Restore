@interface MNGuidanceJunctionViewImage
+ (BOOL)supportsSecureCoding;
- (MNGuidanceJunctionViewImage)initWithCoder:(id)a3;
- (NSData)imageData;
- (unint64_t)imageID;
- (void)encodeWithCoder:(id)a3;
- (void)setImageData:(id)a3;
- (void)setImageID:(unint64_t)a3;
@end

@implementation MNGuidanceJunctionViewImage

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (MNGuidanceJunctionViewImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MNGuidanceJunctionViewImage;
  v5 = [(MNGuidanceJunctionViewImage *)&v9 init];
  if (v5)
  {
    v5->_imageID = [v4 decodeIntegerForKey:@"_imageID"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  unint64_t imageID = self->_imageID;
  id v5 = a3;
  [v5 encodeInteger:imageID forKey:@"_imageID"];
  [v5 encodeObject:self->_imageData forKey:@"_imageData"];
}

- (void)setImageID:(unint64_t)a3
{
  self->_unint64_t imageID = a3;
}

- (void)setImageData:(id)a3
{
}

- (unint64_t)imageID
{
  return self->_imageID;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
}

@end