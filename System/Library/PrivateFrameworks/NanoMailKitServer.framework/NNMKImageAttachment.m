@interface NNMKImageAttachment
+ (BOOL)supportsSecureCoding;
- (BOOL)renderOnClient;
- (CGSize)imageSize;
- (NNMKImageAttachment)initWithCoder:(id)a3;
- (id)description;
- (void)encodeWithCoder:(id)a3;
- (void)setImageSize:(CGSize)a3;
- (void)setRenderOnClient:(BOOL)a3;
@end

@implementation NNMKImageAttachment

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NNMKImageAttachment)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)NNMKImageAttachment;
  v5 = [(NNMKAttachment *)&v11 initWithCoder:v4];
  if (v5)
  {
    v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyRenderOnClient"];
    v5->_renderOnClient = [v6 BOOLValue];

    v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"kNSCodingKeyImageSize"];
    [v7 CGSizeValue];
    v5->_imageSize.width = v8;
    v5->_imageSize.height = v9;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)NNMKImageAttachment;
  id v4 = a3;
  [(NNMKAttachment *)&v7 encodeWithCoder:v4];
  v5 = objc_msgSend(NSNumber, "numberWithBool:", self->_renderOnClient, v7.receiver, v7.super_class);
  [v4 encodeObject:v5 forKey:@"kNSCodingKeyRenderOnClient"];

  v6 = objc_msgSend(MEMORY[0x263F08D40], "valueWithCGSize:", self->_imageSize.width, self->_imageSize.height);
  [v4 encodeObject:v6 forKey:@"kNSCodingKeyImageSize"];
}

- (id)description
{
  v8.receiver = self;
  v8.super_class = (Class)NNMKImageAttachment;
  v3 = [(NNMKAttachment *)&v8 description];
  id v4 = (void *)[v3 mutableCopy];

  BOOL renderOnClient = self->_renderOnClient;
  v6 = NSStringFromCGSize(self->_imageSize);
  [v4 appendFormat:@", Render On Client: %d, Size: %@", renderOnClient, v6];

  return v4;
}

- (BOOL)renderOnClient
{
  return self->_renderOnClient;
}

- (void)setRenderOnClient:(BOOL)a3
{
  self->_BOOL renderOnClient = a3;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (void)setImageSize:(CGSize)a3
{
  self->_imageSize = a3;
}

@end