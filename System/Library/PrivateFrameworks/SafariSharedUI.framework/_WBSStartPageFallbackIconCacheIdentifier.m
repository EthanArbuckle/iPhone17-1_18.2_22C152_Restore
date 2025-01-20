@interface _WBSStartPageFallbackIconCacheIdentifier
- (BOOL)isEqual:(id)a3;
- (CGSize)imageSize;
- (NSString)title;
- (NSString)url;
- (UIImage)baseImage;
- (WBSTemplateIconMonogramConfiguration)configuration;
- (_WBSStartPageFallbackIconCacheIdentifier)initWithConfiguration:(id)a3 imageSize:(CGSize)a4 title:(id)a5 url:(id)a6 baseImage:(id)a7;
- (unint64_t)hash;
@end

@implementation _WBSStartPageFallbackIconCacheIdentifier

- (_WBSStartPageFallbackIconCacheIdentifier)initWithConfiguration:(id)a3 imageSize:(CGSize)a4 title:(id)a5 url:(id)a6 baseImage:(id)a7
{
  CGFloat height = a4.height;
  CGFloat width = a4.width;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  v26.receiver = self;
  v26.super_class = (Class)_WBSStartPageFallbackIconCacheIdentifier;
  v18 = [(_WBSStartPageFallbackIconCacheIdentifier *)&v26 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_configuration, a3);
    v19->_imageSize.CGFloat width = width;
    v19->_imageSize.CGFloat height = height;
    uint64_t v20 = [v15 copy];
    title = v19->_title;
    v19->_title = (NSString *)v20;

    uint64_t v22 = [v16 copy];
    url = v19->_url;
    v19->_url = (NSString *)v22;

    objc_storeStrong((id *)&v19->_baseImage, a7);
    v24 = v19;
  }

  return v19;
}

- (unint64_t)hash
{
  unint64_t v3 = (unint64_t)self->_imageSize.width | ((unint64_t)self->_imageSize.height << 32);
  NSUInteger v4 = [(NSString *)self->_title hash];
  return v3 ^ v4 ^ [(NSString *)self->_url hash];
}

- (BOOL)isEqual:(id)a3
{
  NSUInteger v4 = (_WBSStartPageFallbackIconCacheIdentifier *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else if ([(_WBSStartPageFallbackIconCacheIdentifier *)v4 isMemberOfClass:objc_opt_class()])
  {
    v5 = v4;
    BOOL v6 = self->_imageSize.width == v5->_imageSize.width && self->_imageSize.height == v5->_imageSize.height;
    if (v6 && WBSIsEqual() && WBSIsEqual() && WBSIsEqual())
    {
      v7 = [(WBSTemplateIconMonogramConfiguration *)self->_configuration backgroundColor];
      v8 = [(WBSTemplateIconMonogramConfiguration *)v5->_configuration backgroundColor];
      char v9 = WBSIsEqual();
    }
    else
    {
      char v9 = 0;
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9;
}

- (WBSTemplateIconMonogramConfiguration)configuration
{
  return self->_configuration;
}

- (CGSize)imageSize
{
  double width = self->_imageSize.width;
  double height = self->_imageSize.height;
  result.double height = height;
  result.double width = width;
  return result;
}

- (NSString)title
{
  return self->_title;
}

- (NSString)url
{
  return self->_url;
}

- (UIImage)baseImage
{
  return self->_baseImage;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_baseImage, 0);
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end