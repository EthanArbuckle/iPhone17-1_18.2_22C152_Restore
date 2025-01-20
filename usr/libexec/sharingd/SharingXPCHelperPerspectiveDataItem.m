@interface SharingXPCHelperPerspectiveDataItem
+ (BOOL)supportsSecureCoding;
- (CGSize)perspectiveDataSize;
- (NSData)CGImageData;
- (NSData)perspectiveData;
- (SharingXPCHelperPerspectiveDataItem)init;
- (SharingXPCHelperPerspectiveDataItem)initWithCoder:(id)a3;
- (SharingXPCHelperPerspectiveDataItem)initWithPerspectiveData:(id)a3 perspectiveDataSize:(CGSize)a4 CGImageData:(id)a5;
- (id)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation SharingXPCHelperPerspectiveDataItem

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SharingXPCHelperPerspectiveDataItem)init
{
  v3 = objc_opt_new();
  v4 = objc_opt_new();
  v5 = -[SharingXPCHelperPerspectiveDataItem initWithPerspectiveData:perspectiveDataSize:CGImageData:](self, "initWithPerspectiveData:perspectiveDataSize:CGImageData:", v3, v4, 0.0, 0.0);

  return v5;
}

- (SharingXPCHelperPerspectiveDataItem)initWithPerspectiveData:(id)a3 perspectiveDataSize:(CGSize)a4 CGImageData:(id)a5
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v10 = a3;
  id v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)SharingXPCHelperPerspectiveDataItem;
  v12 = [(SharingXPCHelperPerspectiveDataItem *)&v15 init];
  v13 = v12;
  if (v12)
  {
    objc_storeStrong((id *)&v12->_perspectiveData, a3);
    v13->_perspectiveDataSize.CGFloat width = width;
    v13->_perspectiveDataSize.CGFloat height = height;
    objc_storeStrong((id *)&v13->_CGImageData, a5);
  }

  return v13;
}

- (id)description
{
  return 0;
}

- (void)encodeWithCoder:(id)a3
{
  id v9 = a3;
  perspectiveData = self->_perspectiveData;
  if (perspectiveData) {
    [v9 encodeObject:perspectiveData forKey:@"SharingXPCHelperPerspectiveDataItem-PerspectiveData"];
  }
  [(SharingXPCHelperPerspectiveDataItem *)self perspectiveDataSize];
  *(float *)&double v5 = v5;
  [v9 encodeFloat:@"SharingXPCHelperPerspectiveDataItem-PerspectiveDataWidth" forKey:v5];
  [(SharingXPCHelperPerspectiveDataItem *)self perspectiveDataSize];
  *(float *)&double v7 = v6;
  [v9 encodeFloat:@"SharingXPCHelperPerspectiveDataItem-PerspectiveDataHeight" forKey:v7];
  CGImageData = self->_CGImageData;
  if (CGImageData) {
    [v9 encodeObject:CGImageData forKey:@"SharingXPCHelperPerspectiveDataItem-CGImageData"];
  }
}

- (SharingXPCHelperPerspectiveDataItem)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)SharingXPCHelperPerspectiveDataItem;
  double v5 = [(SharingXPCHelperPerspectiveDataItem *)&v12 init];
  if (v5)
  {
    id v6 = v4;
    objc_opt_class();
    NSDecodeObjectIfPresent();

    [v6 decodeFloatForKey:@"SharingXPCHelperPerspectiveDataItem-PerspectiveDataWidth"];
    CGFloat v8 = v7;
    [v6 decodeFloatForKey:@"SharingXPCHelperPerspectiveDataItem-PerspectiveDataHeight"];
    v5->_perspectiveDataSize.CGFloat width = v8;
    v5->_perspectiveDataSize.CGFloat height = v9;
    id v10 = v6;
    objc_opt_class();
    NSDecodeObjectIfPresent();
  }
  return v5;
}

- (NSData)perspectiveData
{
  return self->_perspectiveData;
}

- (CGSize)perspectiveDataSize
{
  double width = self->_perspectiveDataSize.width;
  double height = self->_perspectiveDataSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSData)CGImageData
{
  return self->_CGImageData;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_CGImageData, 0);

  objc_storeStrong((id *)&self->_perspectiveData, 0);
}

@end