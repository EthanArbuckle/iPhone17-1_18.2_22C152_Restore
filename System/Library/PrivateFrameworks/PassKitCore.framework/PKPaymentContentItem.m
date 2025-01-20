@interface PKPaymentContentItem
+ (BOOL)supportsSecureCoding;
+ (PKPaymentContentItem)itemWithProtobuf:(id)a3;
- (BOOL)isCentered;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToPaymentContentItem:(id)a3;
- (CGImage)image;
- (NSAttributedString)label;
- (NSAttributedString)title;
- (NSURLRequest)imageRequest;
- (PKPaymentContentItem)initWithCoder:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)protobuf;
- (unint64_t)hash;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCentered:(BOOL)a3;
- (void)setImage:(CGImage *)a3;
- (void)setImageRequest:(id)a3;
- (void)setLabel:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation PKPaymentContentItem

+ (PKPaymentContentItem)itemWithProtobuf:(id)a3
{
  id v3 = a3;
  v4 = objc_alloc_init(PKPaymentContentItem);
  v5 = [v3 imageRequest];

  if (v5)
  {
    v6 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v7 = objc_opt_class();
    v8 = [v3 imageRequest];
    v9 = [v6 unarchivedObjectOfClass:v7 fromData:v8 error:0];
    [(PKPaymentContentItem *)v4 setImageRequest:v9];
  }
  v10 = [v3 image];
  v11 = PKCreateCGImage(v10);

  if (v11)
  {
    [(PKPaymentContentItem *)v4 setImage:v11];
    CGImageRelease(v11);
  }
  v12 = [v3 label];

  if (v12)
  {
    v13 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v14 = objc_opt_class();
    v15 = [v3 label];
    v16 = [v13 unarchivedObjectOfClass:v14 fromData:v15 error:0];
    [(PKPaymentContentItem *)v4 setLabel:v16];
  }
  v17 = [v3 title];

  if (v17)
  {
    v18 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v19 = objc_opt_class();
    v20 = [v3 title];
    v21 = [v18 unarchivedObjectOfClass:v19 fromData:v20 error:0];
    [(PKPaymentContentItem *)v4 setTitle:v21];
  }
  -[PKPaymentContentItem setCentered:](v4, "setCentered:", [v3 centered]);

  return v4;
}

- (id)protobuf
{
  id v3 = objc_alloc_init(PKProtobufPaymentContentItem);
  v4 = [(PKPaymentContentItem *)self imageRequest];

  if (v4)
  {
    v5 = (void *)MEMORY[0x1E4F28DB0];
    v6 = [(PKPaymentContentItem *)self imageRequest];
    uint64_t v7 = [v5 archivedDataWithRootObject:v6 requiringSecureCoding:1 error:0];
    [(PKProtobufPaymentContentItem *)v3 setImageRequest:v7];
  }
  v8 = self;
  if ([(PKPaymentContentItem *)v8 image])
  {
    v9 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithCGImage:", -[PKPaymentContentItem image](v8, "image"));
    [(PKProtobufPaymentContentItem *)v3 setImage:v9];
  }
  v10 = [(PKPaymentContentItem *)v8 label];

  if (v10)
  {
    v11 = (void *)MEMORY[0x1E4F28DB0];
    v12 = [(PKPaymentContentItem *)v8 label];
    v13 = [v11 archivedDataWithRootObject:v12 requiringSecureCoding:1 error:0];
    [(PKProtobufPaymentContentItem *)v3 setLabel:v13];
  }
  uint64_t v14 = [(PKPaymentContentItem *)v8 title];

  if (v14)
  {
    v15 = (void *)MEMORY[0x1E4F28DB0];
    v16 = [(PKPaymentContentItem *)v8 title];
    v17 = [v15 archivedDataWithRootObject:v16 requiringSecureCoding:1 error:0];
    [(PKProtobufPaymentContentItem *)v3 setTitle:v17];
  }
  [(PKProtobufPaymentContentItem *)v3 setCentered:[(PKPaymentContentItem *)v8 isCentered]];
  return v3;
}

- (PKPaymentContentItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v17.receiver = self;
  v17.super_class = (Class)PKPaymentContentItem;
  v5 = [(PKPaymentContentItem *)&v17 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"title"];
    title = v5->_title;
    v5->_title = (NSAttributedString *)v6;

    v8 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v9 = objc_opt_class();
    v10 = objc_msgSend(v8, "setWithObjects:", v9, objc_opt_class(), 0);
    uint64_t v11 = [v4 decodeObjectOfClasses:v10 forKey:@"label"];
    label = v5->_label;
    v5->_label = (NSAttributedString *)v11;

    uint64_t v13 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"imageRequest"];
    imageRequest = v5->_imageRequest;
    v5->_imageRequest = (NSURLRequest *)v13;

    v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"image"];
    v5->_image = PKCreateCGImage(v15);
    v5->_centered = [v4 decodeBoolForKey:@"centered"];
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v5 = a3;
  [v5 encodeObject:self->_title forKey:@"title"];
  [v5 encodeObject:self->_label forKey:@"label"];
  [v5 encodeObject:self->_imageRequest forKey:@"imageRequest"];
  if (self->_image)
  {
    id v4 = objc_msgSend(MEMORY[0x1E4F1C9B8], "dataWithCGImage:");
    [v5 encodeObject:v4 forKey:@"image"];
  }
  [v5 encodeBool:self->_centered forKey:@"centered"];
}

- (void)dealloc
{
  CGImageRelease(self->_image);
  v3.receiver = self;
  v3.super_class = (Class)PKPaymentContentItem;
  [(PKPaymentContentItem *)&v3 dealloc];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSAttributedString *)self->_title copyWithZone:a3];
  uint64_t v7 = *(void **)(v5 + 32);
  *(void *)(v5 + 32) = v6;

  uint64_t v8 = [(NSAttributedString *)self->_label copyWithZone:a3];
  uint64_t v9 = *(void **)(v5 + 40);
  *(void *)(v5 + 40) = v8;

  uint64_t v10 = [(NSURLRequest *)self->_imageRequest copyWithZone:a3];
  uint64_t v11 = *(void **)(v5 + 16);
  *(void *)(v5 + 16) = v10;

  image = self->_image;
  if (image) {
    *(void *)(v5 + 24) = CGImageCreateCopy(image);
  }
  *(unsigned char *)(v5 + 8) = self->_centered;
  return (id)v5;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (PKPaymentContentItem *)a3;
  uint64_t v5 = v4;
  if (v4 == self) {
    BOOL v6 = 1;
  }
  else {
    BOOL v6 = v4
  }
      && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
      && [(PKPaymentContentItem *)self isEqualToPaymentContentItem:v5];

  return v6;
}

- (BOOL)isEqualToPaymentContentItem:(id)a3
{
  id v4 = a3;
  title = self->_title;
  BOOL v6 = (NSAttributedString *)v4[4];
  if (title) {
    BOOL v7 = v6 == 0;
  }
  else {
    BOOL v7 = 1;
  }
  if (v7)
  {
    if (title != v6) {
      goto LABEL_19;
    }
  }
  else if ((-[NSAttributedString isEqual:](title, "isEqual:") & 1) == 0)
  {
    goto LABEL_19;
  }
  label = self->_label;
  uint64_t v9 = (NSAttributedString *)v4[5];
  if (label && v9)
  {
    if ((-[NSAttributedString isEqual:](label, "isEqual:") & 1) == 0) {
      goto LABEL_19;
    }
  }
  else if (label != v9)
  {
    goto LABEL_19;
  }
  imageRequest = self->_imageRequest;
  uint64_t v11 = (NSURLRequest *)v4[2];
  if (!imageRequest || !v11)
  {
    if (imageRequest == v11) {
      goto LABEL_17;
    }
LABEL_19:
    BOOL v12 = 0;
    goto LABEL_20;
  }
  if ((-[NSURLRequest isEqual:](imageRequest, "isEqual:") & 1) == 0) {
    goto LABEL_19;
  }
LABEL_17:
  BOOL v12 = self->_centered ^ (*((unsigned char *)v4 + 8) == 0);
LABEL_20:

  return v12;
}

- (unint64_t)hash
{
  objc_super v3 = [MEMORY[0x1E4F1CA48] array];
  [v3 safelyAddObject:self->_title];
  [v3 safelyAddObject:self->_label];
  [v3 safelyAddObject:self->_imageRequest];
  id v4 = [NSNumber numberWithBool:self->_centered];
  [v3 safelyAddObject:v4];

  unint64_t v5 = PKCombinedHash(17, v3);
  return v5;
}

- (void)setImage:(CGImage *)a3
{
  image = self->_image;
  if (image != a3)
  {
    CGImageRelease(image);
    self->_image = CGImageRetain(a3);
  }
}

- (NSURLRequest)imageRequest
{
  return self->_imageRequest;
}

- (void)setImageRequest:(id)a3
{
}

- (CGImage)image
{
  return self->_image;
}

- (NSAttributedString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSAttributedString)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
}

- (BOOL)isCentered
{
  return self->_centered;
}

- (void)setCentered:(BOOL)a3
{
  self->_centered = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_imageRequest, 0);
}

@end