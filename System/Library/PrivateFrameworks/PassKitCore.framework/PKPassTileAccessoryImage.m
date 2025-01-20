@interface PKPassTileAccessoryImage
+ (BOOL)supportsSecureCoding;
+ (id)createAccessoryImageWithImage:(id)a3;
+ (id)createDefaultDisclosureAccessoryImage;
- (BOOL)_isEqual:(id)a3;
- (BOOL)_setUpWithDictionary:(id)a3;
- (PKPassTileAccessoryImage)initWithCoder:(id)a3;
- (PKPassTileImage)image;
- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
- (void)setImage:(id)a3;
@end

@implementation PKPassTileAccessoryImage

+ (id)createAccessoryImageWithImage:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___PKPassTileAccessoryImage;
    v6 = (id *)objc_msgSendSuper2(&v8, sel__createForType_resolved_, 2, 1);
    objc_storeStrong(v6 + 3, a3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)createDefaultDisclosureAccessoryImage
{
  id v2 = +[PKPassTileImage _createDefaultDisclosureImage];
  id v3 = +[PKPassTileAccessory _createForType:2 resolved:1];
  [v3 setImage:v2];

  return v3;
}

- (BOOL)_setUpWithDictionary:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassTileAccessoryImage;
  if ([(PKPassTileAccessory *)&v10 _setUpWithDictionary:v4])
  {
    id v5 = [v4 PKDictionaryForKey:@"image"];
    v6 = +[PKPassTileImage _createForDictionary:v5];
    image = self->_image;
    self->_image = v6;

    BOOL v8 = self->_image != 0;
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)createResolvedAccessoryWithBundle:(id)a3 privateBundle:(id)a4
{
  v12.receiver = self;
  v12.super_class = (Class)PKPassTileAccessoryImage;
  id v6 = a4;
  id v7 = a3;
  BOOL v8 = [(PKPassTileAccessory *)&v12 createResolvedAccessoryWithBundle:v7 privateBundle:v6];
  id v9 = -[PKPassTileImage createResolvedImageWithBundle:privateBundle:](self->_image, "createResolvedImageWithBundle:privateBundle:", v7, v6, v12.receiver, v12.super_class);

  objc_super v10 = (void *)v8[3];
  v8[3] = v9;

  return v8;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKPassTileAccessoryImage)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)PKPassTileAccessoryImage;
  id v5 = [(PKPassTileAccessory *)&v9 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    image = v5->_image;
    v5->_image = (PKPassTileImage *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)PKPassTileAccessoryImage;
  id v4 = a3;
  [(PKPassTileAccessory *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_image, @"image", v5.receiver, v5.super_class);
}

- (unint64_t)hash
{
  v4.receiver = self;
  v4.super_class = (Class)PKPassTileAccessoryImage;
  id v5 = [(PKPassTileAccessory *)&v4 hash];
  unint64_t v6 = [(PKPassTileImage *)self->_image hash];
  return SipHash();
}

- (BOOL)_isEqual:(id)a3
{
  objc_super v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)PKPassTileAccessoryImage;
  if ([(PKPassTileAccessory *)&v10 _isEqual:v4])
  {
    id v5 = (PKPassTileImage *)v4[3];
    image = self->_image;
    if (v5) {
      BOOL v7 = image == 0;
    }
    else {
      BOOL v7 = 1;
    }
    if (v7) {
      BOOL v8 = v5 == image;
    }
    else {
      BOOL v8 = -[PKPassTileImage isEqual:](v5, "isEqual:");
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (PKPassTileImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (void).cxx_destruct
{
}

@end