@interface SharingXPCHelperImageItem
+ (BOOL)supportsSecureCoding;
- (CGImage)image;
- (NSArray)contactIDs;
- (NSData)imageData;
- (NSString)cacheLookupKey;
- (NSString)imageTitle;
- (SharingXPCHelperImageItem)initWithCoder:(id)a3;
- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3;
- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3 image:(CGImage *)a4 cacheLookupKey:(id)a5;
- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3 imageData:(id)a4 cacheLookupKey:(id)a5;
- (id)description;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
- (void)setCacheLookupKey:(id)a3;
- (void)setContactIDs:(id)a3;
@end

@implementation SharingXPCHelperImageItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3
{
  return [(SharingXPCHelperImageItem *)self initWithImageTitle:a3 imageData:0 cacheLookupKey:0];
}

- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3 imageData:(id)a4 cacheLookupKey:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)SharingXPCHelperImageItem;
  v12 = [(SharingXPCHelperImageItem *)&v16 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_imageTitle, a3);
    objc_storeStrong((id *)&v13->_imageData, a4);
    objc_storeStrong((id *)&v13->_cacheLookupKey, a5);
    contactIDs = v13->_contactIDs;
    v13->_contactIDs = (NSArray *)&__NSArray0__struct;
  }
  return v13;
}

- (SharingXPCHelperImageItem)initWithImageTitle:(id)a3 image:(CGImage *)a4 cacheLookupKey:(id)a5
{
  v6 = [(SharingXPCHelperImageItem *)self initWithImageTitle:a3 imageData:0 cacheLookupKey:a5];
  if (v6) {
    v6->_image = (CGImage *)CFRetain(a4);
  }
  return v6;
}

- (SharingXPCHelperImageItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SharingXPCHelperImageItem;
  v5 = [(SharingXPCHelperImageItem *)&v11 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v7 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v8 = v7;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    id v9 = v8;
    objc_opt_class();
    NSDecodeStandardContainerIfPresent();
  }
  return v5;
}

- (void)dealloc
{
  image = self->_image;
  if (image) {
    CFRelease(image);
  }
  v4.receiver = self;
  v4.super_class = (Class)SharingXPCHelperImageItem;
  [(SharingXPCHelperImageItem *)&v4 dealloc];
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  imageTitle = self->_imageTitle;
  id v11 = v4;
  if (imageTitle)
  {
    [v4 encodeObject:imageTitle forKey:@"SharingXPCHelperImageItem-ImageTitle"];
    id v4 = v11;
  }
  imageData = self->_imageData;
  if (imageData)
  {
    [v4 encodeObject:imageData forKey:@"SharingXPCHelperImageItem-ImageData"];
  }
  else if (self->_image)
  {
    id v7 = SFDataFromCGImage();
    [v11 encodeObject:v7 forKey:@"SharingXPCHelperImageItem-ImageData"];
  }
  cacheLookupKey = self->_cacheLookupKey;
  if (cacheLookupKey) {
    [v11 encodeObject:cacheLookupKey forKey:@"SharingXPCHelperImageItem-CacheLookupKey"];
  }
  contactIDs = self->_contactIDs;
  id v10 = v11;
  if (contactIDs)
  {
    [v11 encodeObject:contactIDs forKey:@"SharingXPCHelperImageItem-ContactIDsKey"];
    id v10 = v11;
  }
}

- (id)description
{
  NSAppendPrintF();
  id v2 = 0;

  return v2;
}

- (NSString)imageTitle
{
  return self->_imageTitle;
}

- (NSData)imageData
{
  return self->_imageData;
}

- (CGImage)image
{
  return self->_image;
}

- (NSString)cacheLookupKey
{
  return self->_cacheLookupKey;
}

- (void)setCacheLookupKey:(id)a3
{
}

- (NSArray)contactIDs
{
  return self->_contactIDs;
}

- (void)setContactIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contactIDs, 0);
  objc_storeStrong((id *)&self->_cacheLookupKey, 0);
  objc_storeStrong((id *)&self->_imageData, 0);

  objc_storeStrong((id *)&self->_imageTitle, 0);
}

@end