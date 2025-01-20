@interface BICImageMetadata
- (BICImageMetadata)initWithIdentifier:(id)a3 intrinsicAspectRatio:(id)a4 imageColor:(id)a5;
- (NSNumber)intrinsicAspectRatio;
- (NSString)identifier;
- (UIColor)imageColor;
- (void)setIdentifier:(id)a3;
- (void)setImageColor:(id)a3;
- (void)setIntrinsicAspectRatio:(id)a3;
@end

@implementation BICImageMetadata

- (BICImageMetadata)initWithIdentifier:(id)a3 intrinsicAspectRatio:(id)a4 imageColor:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)BICImageMetadata;
  v11 = [(BICImageMetadata *)&v15 init];
  if (v11)
  {
    v12 = (NSString *)[v8 copy];
    identifier = v11->_identifier;
    v11->_identifier = v12;

    objc_storeStrong((id *)&v11->_intrinsicAspectRatio, a4);
    objc_storeStrong((id *)&v11->_imageColor, a5);
  }

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSNumber)intrinsicAspectRatio
{
  return self->_intrinsicAspectRatio;
}

- (void)setIntrinsicAspectRatio:(id)a3
{
}

- (UIColor)imageColor
{
  return self->_imageColor;
}

- (void)setImageColor:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageColor, 0);
  objc_storeStrong((id *)&self->_intrinsicAspectRatio, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end