@interface SUUICommenter
- (BOOL)isAttributed;
- (BOOL)isMySelf;
- (BOOL)useImageCopy;
- (NSString)attributedName;
- (SUUICommenter)initWithAuthor:(id)a3;
- (UIImage)thumbnailImage;
- (void)setAttributedName:(id)a3;
- (void)setIsAttributed:(BOOL)a3;
- (void)setIsMySelf:(BOOL)a3;
- (void)setThumbnailImage:(id)a3;
- (void)setUseImageCopy:(BOOL)a3;
@end

@implementation SUUICommenter

- (SUUICommenter)initWithAuthor:(id)a3
{
  id v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SUUICommenter;
  v5 = [(SUUICommenter *)&v11 init];
  if (v5)
  {
    v6 = [v4 thumbnailImageURL];
    [(SUUIMediaSocialAuthor *)v5 setThumbnailImageURL:v6];

    v7 = [v4 name];
    [(SUUIMediaSocialAuthor *)v5 setName:v7];

    v8 = [v4 authorType];
    [(SUUIMediaSocialAuthor *)v5 setAuthorType:v8];

    v9 = [v4 identifier];
    [(SUUIMediaSocialAuthor *)v5 setIdentifier:v9];
  }
  return v5;
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

@end