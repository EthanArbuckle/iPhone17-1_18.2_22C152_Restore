@interface UGCUserUploadedPhotoInfo
- (CGSize)size;
- (NSURL)url;
- (UGCUserUploadedPhotoInfo)initWithURL:(id)a3 size:(CGSize)a4;
@end

@implementation UGCUserUploadedPhotoInfo

- (UGCUserUploadedPhotoInfo)initWithURL:(id)a3 size:(CGSize)a4
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)UGCUserUploadedPhotoInfo;
  v9 = [(UGCUserUploadedPhotoInfo *)&v12 init];
  v10 = v9;
  if (v9)
  {
    v9->_size.CGFloat width = width;
    v9->_size.CGFloat height = height;
    objc_storeStrong((id *)&v9->_url, a3);
  }

  return v10;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSURL)url
{
  return self->_url;
}

- (void).cxx_destruct
{
}

@end