@interface TVUsageEntityItem
- (MPArtworkCatalog)artworkCatalog;
- (NSString)fileSizeString;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)placeholderImage;
- (void)setArtworkCatalog:(id)a3;
- (void)setFileSizeString:(id)a3;
- (void)setPlaceholderImage:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVUsageEntityItem

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->_subtitle;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)fileSizeString
{
  return self->_fileSizeString;
}

- (void)setFileSizeString:(id)a3
{
}

- (UIImage)placeholderImage
{
  return self->_placeholderImage;
}

- (void)setPlaceholderImage:(id)a3
{
}

- (MPArtworkCatalog)artworkCatalog
{
  return self->_artworkCatalog;
}

- (void)setArtworkCatalog:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkCatalog, 0);
  objc_storeStrong((id *)&self->_placeholderImage, 0);
  objc_storeStrong((id *)&self->_fileSizeString, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);

  objc_storeStrong((id *)&self->_title, 0);
}

@end