@interface SKUICommenter
- (BOOL)isAttributed;
- (BOOL)isMySelf;
- (BOOL)useImageCopy;
- (NSString)attributedName;
- (SKUICommenter)initWithAuthor:(id)a3;
- (UIImage)thumbnailImage;
- (void)setAttributedName:(id)a3;
- (void)setIsAttributed:(BOOL)a3;
- (void)setIsMySelf:(BOOL)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setUseImageCopy:(BOOL)a3;
@end

@implementation SKUICommenter

- (SKUICommenter)initWithAuthor:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content())
  {
    if (_os_feature_enabled_impl())
    {
      BOOL v5 = os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_FAULT);
      if (v5) {
        -[SKUICommenter initWithAuthor:](v5, v6, v7, v8, v9, v10, v11, v12);
      }
    }
  }
  v19.receiver = self;
  v19.super_class = (Class)SKUICommenter;
  v13 = [(SKUICommenter *)&v19 init];
  if (v13)
  {
    v14 = [v4 thumbnailImageURL];
    [(SKUIMediaSocialAuthor *)v13 setThumbnailImageURL:v14];

    v15 = [v4 name];
    [(SKUIMediaSocialAuthor *)v13 setName:v15];

    v16 = [v4 authorType];
    [(SKUIMediaSocialAuthor *)v13 setAuthorType:v16];

    v17 = [v4 identifier];
    [(SKUIMediaSocialAuthor *)v13 setIdentifier:v17];
  }
  return v13;
}

- (NSString)attributedName
{
  return self->_attributedName;
}

- (void)setAttributedName:(id)a3
{
}

- (BOOL)isAttributed
{
  return self->_isAttributed;
}

- (void)setIsAttributed:(BOOL)a3
{
  self->_isAttributed = a3;
}

- (BOOL)isMySelf
{
  return self->_isMySelf;
}

- (void)setIsMySelf:(BOOL)a3
{
  self->_isMySelf = a3;
}

- (BOOL)useImageCopy
{
  return self->_useImageCopy;
}

- (void)setUseImageCopy:(BOOL)a3
{
  self->_useImageCopy = a3;
}

- (UIImage)thumbnailImage
{
  return self->_thumbnailImage;
}

- (void)setThumbnailImage:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailImage, 0);

  objc_storeStrong((id *)&self->_attributedName, 0);
}

- (void)initWithAuthor:(uint64_t)a3 .cold.1(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end