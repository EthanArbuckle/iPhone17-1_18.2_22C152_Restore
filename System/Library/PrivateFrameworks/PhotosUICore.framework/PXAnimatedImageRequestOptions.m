@interface PXAnimatedImageRequestOptions
- (BOOL)allowPreCaching;
- (BOOL)useSharedImageDecoding;
- (PXAnimatedImageRequestOptions)init;
- (id)copyWithZone:(_NSZone *)a3;
- (id)photoKitRequestOptions;
- (void)setAllowPreCaching:(BOOL)a3;
- (void)setUseSharedImageDecoding:(BOOL)a3;
@end

@implementation PXAnimatedImageRequestOptions

- (id)photoKitRequestOptions
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F38EB0]);
  [(PXImageRequestOptions *)self copyPropertiesToPhotoKitOptions:v3];
  objc_msgSend(v3, "setAllowPreCaching:", -[PXAnimatedImageRequestOptions allowPreCaching](self, "allowPreCaching"));
  objc_msgSend(v3, "setUseSharedImageDecoding:", -[PXAnimatedImageRequestOptions useSharedImageDecoding](self, "useSharedImageDecoding"));
  return v3;
}

- (void)setUseSharedImageDecoding:(BOOL)a3
{
  self->_useSharedImageDecoding = a3;
}

- (BOOL)useSharedImageDecoding
{
  return self->_useSharedImageDecoding;
}

- (void)setAllowPreCaching:(BOOL)a3
{
  self->_allowPreCaching = a3;
}

- (BOOL)allowPreCaching
{
  return self->_allowPreCaching;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v6.receiver = self;
  v6.super_class = (Class)PXAnimatedImageRequestOptions;
  [(PXAnimatedImageRequestOptions *)&v6 copyPropertiesToOptions:v4];
  [v4 setAllowPreCaching:self->_allowPreCaching];
  [v4 setUseSharedImageDecoding:self->_useSharedImageDecoding];
  return v4;
}

- (PXAnimatedImageRequestOptions)init
{
  v3.receiver = self;
  v3.super_class = (Class)PXAnimatedImageRequestOptions;
  result = [(PXAnimatedImageRequestOptions *)&v3 init];
  if (result) {
    result->_allowPreCaching = 1;
  }
  return result;
}

@end