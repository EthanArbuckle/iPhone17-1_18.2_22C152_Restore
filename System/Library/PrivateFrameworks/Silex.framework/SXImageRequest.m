@interface SXImageRequest
- (BOOL)preserveColorspace;
- (CGSize)size;
- (NSString)imageIdentifier;
- (NSURL)URL;
- (SXImageRequest)initWithImageIdentifier:(id)a3 imageQualities:(unint64_t)a4 url:(id)a5 size:(CGSize)a6 preserveColorspace:(BOOL)a7 loadingBlock:(id)a8;
- (id)loadingBlock;
- (unint64_t)qualities;
- (void)setLoadingBlock:(id)a3;
@end

@implementation SXImageRequest

- (SXImageRequest)initWithImageIdentifier:(id)a3 imageQualities:(unint64_t)a4 url:(id)a5 size:(CGSize)a6 preserveColorspace:(BOOL)a7 loadingBlock:(id)a8
{
  CGFloat height = a6.height;
  CGFloat width = a6.width;
  id v16 = a3;
  id v17 = a5;
  id v18 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SXImageRequest;
  v19 = [(SXImageRequest *)&v24 init];
  v20 = v19;
  if (v19)
  {
    objc_storeStrong((id *)&v19->_imageIdentifier, a3);
    v20->_qualities = a4;
    objc_storeStrong((id *)&v20->_imageIdentifier, a3);
    objc_storeStrong((id *)&v20->_URL, a5);
    v20->_size.CGFloat width = width;
    v20->_size.CGFloat height = height;
    uint64_t v21 = [v18 copy];
    id loadingBlock = v20->_loadingBlock;
    v20->_id loadingBlock = (id)v21;

    v20->_preserveColorspace = a7;
  }

  return v20;
}

- (NSString)imageIdentifier
{
  return self->_imageIdentifier;
}

- (NSURL)URL
{
  return self->_URL;
}

- (CGSize)size
{
  double width = self->_size.width;
  double height = self->_size.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (unint64_t)qualities
{
  return self->_qualities;
}

- (id)loadingBlock
{
  return self->_loadingBlock;
}

- (void)setLoadingBlock:(id)a3
{
}

- (BOOL)preserveColorspace
{
  return self->_preserveColorspace;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_loadingBlock, 0);
  objc_storeStrong((id *)&self->_URL, 0);
  objc_storeStrong((id *)&self->_imageIdentifier, 0);
}

@end