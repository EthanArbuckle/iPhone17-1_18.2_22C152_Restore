@interface PKPeerPaymentProfileAppearanceData
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (NSData)imageData;
- (NSString)displayName;
- (PKPeerPaymentProfileAppearanceData)initWithCoder:(id)a3;
- (PKPeerPaymentProfileAppearanceData)initWithDisplayName:(id)a3 imageData:(id)a4;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKPeerPaymentProfileAppearanceData

- (PKPeerPaymentProfileAppearanceData)initWithDisplayName:(id)a3 imageData:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PKPeerPaymentProfileAppearanceData;
  v9 = [(PKPeerPaymentProfileAppearanceData *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_displayName, a3);
    objc_storeStrong((id *)&v10->_imageData, a4);
  }

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPeerPaymentProfileAppearanceData)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)PKPeerPaymentProfileAppearanceData;
  v5 = [(PKPeerPaymentProfileAppearanceData *)&v11 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"displayName"];
    displayName = v5->_displayName;
    v5->_displayName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageData"];
    imageData = v5->_imageData;
    v5->_imageData = (NSData *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  displayName = self->_displayName;
  id v5 = a3;
  [v5 encodeObject:displayName forKey:@"displayName"];
  [v5 encodeObject:self->_imageData forKey:@"imageData"];
}

- (unint64_t)hash
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_displayName];
  [v3 safelyAddObject:self->_imageData];
  unint64_t v4 = PKCombinedHash(17, v3);

  return v4;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_9;
  }
  displayName = self->_displayName;
  uint64_t v6 = (NSString *)v4[1];
  if (!displayName || !v6)
  {
    if (displayName == v6) {
      goto LABEL_5;
    }
LABEL_9:
    char v9 = 0;
    goto LABEL_10;
  }
  if ((-[NSString isEqual:](displayName, "isEqual:") & 1) == 0) {
    goto LABEL_9;
  }
LABEL_5:
  imageData = self->_imageData;
  uint64_t v8 = (NSData *)v4[2];
  if (imageData && v8) {
    char v9 = -[NSData isEqual:](imageData, "isEqual:");
  }
  else {
    char v9 = imageData == v8;
  }
LABEL_10:

  return v9;
}

- (id)description
{
  v3 = [MEMORY[0x1E4F28E78] stringWithFormat:@"<%@: %p; ", objc_opt_class(), self];
  [v3 appendFormat:@"displayName: '%@'; ", self->_displayName];
  [v3 appendFormat:@"imageData: '%@'; ", self->_imageData];
  return v3;
}

- (NSString)displayName
{
  return self->_displayName;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_imageData, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
}

@end