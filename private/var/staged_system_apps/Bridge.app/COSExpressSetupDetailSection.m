@interface COSExpressSetupDetailSection
- (COSExpressSetupDetailSection)init;
- (NSArray)items;
- (NSString)identifier;
- (NSString)subtitle;
- (NSString)title;
- (UIImage)image;
- (void)setImage:(id)a3;
- (void)setItems:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation COSExpressSetupDetailSection

- (COSExpressSetupDetailSection)init
{
  v7.receiver = self;
  v7.super_class = (Class)COSExpressSetupDetailSection;
  v2 = [(COSExpressSetupDetailSection *)&v7 init];
  if (v2)
  {
    v3 = +[NSUUID UUID];
    uint64_t v4 = [v3 UUIDString];
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)v4;
  }
  return v2;
}

- (NSString)identifier
{
  return self->_identifier;
}

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

- (UIImage)image
{
  return self->_image;
}

- (void)setImage:(id)a3
{
}

- (NSArray)items
{
  return self->_items;
}

- (void)setItems:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_items, 0);
  objc_storeStrong((id *)&self->_image, 0);
  objc_storeStrong((id *)&self->_subtitle, 0);
  objc_storeStrong((id *)&self->_title, 0);

  objc_storeStrong((id *)&self->_identifier, 0);
}

@end