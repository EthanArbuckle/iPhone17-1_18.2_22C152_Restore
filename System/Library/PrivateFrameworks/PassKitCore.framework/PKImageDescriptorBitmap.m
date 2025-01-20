@interface PKImageDescriptorBitmap
+ (BOOL)supportsSecureCoding;
+ (id)createForImage:(id)a3 withTintColor:(int64_t)a4;
+ (id)createForImage:(id)a3 withTintColor:(int64_t)a4 hasBackground:(BOOL)a5;
- (PKImage)image;
- (PKImageDescriptorBitmap)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKImageDescriptorBitmap

+ (id)createForImage:(id)a3 withTintColor:(int64_t)a4
{
  return (id)[a1 createForImage:a3 withTintColor:a4 hasBackground:1];
}

+ (id)createForImage:(id)a3 withTintColor:(int64_t)a4 hasBackground:(BOOL)a5
{
  id v8 = a3;
  if (v8)
  {
    v9 = (id *)+[PKImageDescriptor _createForType:withTintColor:hasBackground:]((uint64_t)PKImageDescriptor, 0, a4, a5);
    objc_storeStrong(v9 + 5, a3);
    uint64_t v10 = [v8 imageHash];
    id v11 = v9[4];
    v9[4] = (id)v10;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKImageDescriptorBitmap)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKImageDescriptorBitmap;
  v5 = [(PKImageDescriptor *)&v11 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (PKImage *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageHash"];
    imageHash = v5->_imageHash;
    v5->_imageHash = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKImageDescriptorBitmap;
  id v4 = a3;
  [(PKImageDescriptor *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_image, @"image", v5.receiver, v5.super_class);
  [v4 encodeObject:self->_imageHash forKey:@"imageHash"];
}

- (PKImage)image
{
  return self->_image;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_imageHash, 0);
}

@end