@interface WFMutableGalleryPage
- (CKRecordID)base;
- (CKRecordID)identifier;
- (NSArray)banners;
- (NSArray)collections;
- (NSArray)donations;
- (NSArray)donationsGroupedByApp;
- (NSNumber)isRoot;
- (NSNumber)minVersion;
- (NSString)language;
- (NSString)name;
- (NSString)persistentIdentifier;
- (void)setBanners:(id)a3;
- (void)setBase:(id)a3;
- (void)setCollections:(id)a3;
- (void)setDonations:(id)a3;
- (void)setDonationsGroupedByApp:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setIsRoot:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMinVersion:(id)a3;
- (void)setName:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
@end

@implementation WFMutableGalleryPage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->donationsGroupedByApp, 0);
  objc_storeStrong((id *)&self->donations, 0);
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong((id *)&self->base, 0);
  objc_storeStrong((id *)&self->language, 0);
  objc_storeStrong((id *)&self->collections, 0);
  objc_storeStrong((id *)&self->banners, 0);
  objc_storeStrong((id *)&self->isRoot, 0);
  objc_storeStrong((id *)&self->minVersion, 0);
  objc_storeStrong((id *)&self->name, 0);
  objc_storeStrong((id *)&self->identifier, 0);
}

- (void)setDonationsGroupedByApp:(id)a3
{
}

- (NSArray)donationsGroupedByApp
{
  return self->donationsGroupedByApp;
}

- (void)setDonations:(id)a3
{
}

- (NSArray)donations
{
  return self->donations;
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

- (void)setCollections:(id)a3
{
}

- (NSArray)collections
{
  return self->collections;
}

- (void)setBanners:(id)a3
{
}

- (NSArray)banners
{
  return self->banners;
}

- (void)setIsRoot:(id)a3
{
}

- (NSNumber)isRoot
{
  return self->isRoot;
}

- (void)setMinVersion:(id)a3
{
}

- (NSNumber)minVersion
{
  return self->minVersion;
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