@interface SSUIShowScreenshotUIWithImageServiceRequest
+ (BOOL)supportsBSXPCSecureCoding;
+ (id)entitlement;
- (SSUIServiceOptions)options;
- (SSUIShowScreenshotUIWithImageServiceRequest)initWithBSXPCCoder:(id)a3;
- (UIImage)image;
- (void)encodeWithBSXPCCoder:(id)a3;
- (void)setImage:(id)a3;
- (void)setOptions:(id)a3;
@end

@implementation SSUIShowScreenshotUIWithImageServiceRequest

+ (id)entitlement
{
  return SSUIShowScreenshotUIEntitlement;
}

+ (BOOL)supportsBSXPCSecureCoding
{
  return 1;
}

- (void)encodeWithBSXPCCoder:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)SSUIShowScreenshotUIWithImageServiceRequest;
  id v4 = a3;
  [(SSUIServiceRequest *)&v8 encodeWithBSXPCCoder:v4];
  v5 = [(SSUIShowScreenshotUIWithImageServiceRequest *)self image];
  v6 = objc_msgSend(v5, "ss_imageSurfaceFromImage");

  [v4 encodeObject:v6 forKey:@"SSUIServiceRequestImage"];
  v7 = [(SSUIShowScreenshotUIWithImageServiceRequest *)self options];
  [v4 encodeObject:v7 forKey:@"SSUIServiceRequestOptions"];
}

- (SSUIShowScreenshotUIWithImageServiceRequest)initWithBSXPCCoder:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)SSUIShowScreenshotUIWithImageServiceRequest;
  id v3 = a3;
  id v4 = [(SSUIServiceRequest *)&v11 initWithBSXPCCoder:v3];
  v5 = objc_msgSend(v3, "decodeObjectOfClass:forKey:", objc_opt_class(), @"SSUIServiceRequestImage", v11.receiver, v11.super_class);
  uint64_t v6 = objc_msgSend(MEMORY[0x263F1C6B0], "ss_cgImageBackedImageFromImageSurface:", v5);
  image = v4->_image;
  v4->_image = (UIImage *)v6;

  uint64_t v8 = [v3 decodeObjectOfClass:objc_opt_class() forKey:@"SSUIServiceRequestOptions"];

  options = v4->_options;
  v4->_options = (SSUIServiceOptions *)v8;

  return v4;
}

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (SSUIServiceOptions)options
{
  return self->_options;
}

- (void)setOptions:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_options, 0);
  objc_storeStrong((id *)&self->_image, 0);
}

@end