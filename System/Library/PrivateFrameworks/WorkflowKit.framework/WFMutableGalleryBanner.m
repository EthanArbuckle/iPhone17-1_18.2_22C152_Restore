@interface WFMutableGalleryBanner
- (CKRecordID)base;
- (CKRecordID)detailPage;
- (CKRecordID)identifier;
- (NSArray)supportedIdioms;
- (NSString)language;
- (NSString)name;
- (NSString)persistentIdentifier;
- (NSString)subtitle;
- (void)setBase:(id)a3;
- (void)setDetailPage:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setName:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setSubtitle:(id)a3;
- (void)setSupportedIdioms:(id)a3;
@end

@implementation WFMutableGalleryBanner

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->supportedIdioms, 0);
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong((id *)&self->base, 0);
  objc_storeStrong((id *)&self->language, 0);
  objc_storeStrong((id *)&self->detailPage, 0);
  objc_storeStrong((id *)&self->subtitle, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

- (void)setSupportedIdioms:(id)a3
{
}

- (NSArray)supportedIdioms
{
  return self->supportedIdioms;
}

- (void)setPersistentIdentifier:(id)a3
{
}

- (NSString)persistentIdentifier
{
  return self->persistentIdentifier;
}

- (void)setBase:(id)a3
{
}

- (CKRecordID)base
{
  return self->base;
}

- (void)setLanguage:(id)a3
{
}

- (NSString)language
{
  return self->language;
}

- (void)setDetailPage:(id)a3
{
}

- (CKRecordID)detailPage
{
  return self->detailPage;
}

- (void)setSubtitle:(id)a3
{
}

- (NSString)subtitle
{
  return self->subtitle;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->name;
}

- (void)setIdentifier:(id)a3
{
}

- (CKRecordID)identifier
{
  return self->identifier;
}

@end