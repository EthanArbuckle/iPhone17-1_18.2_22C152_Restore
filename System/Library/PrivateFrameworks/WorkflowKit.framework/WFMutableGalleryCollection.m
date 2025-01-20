@interface WFMutableGalleryCollection
- (CKRecordID)base;
- (CKRecordID)identifier;
- (NSArray)supportedIdioms;
- (NSArray)workflows;
- (NSDate)modifiedAt;
- (NSString)collectionDescription;
- (NSString)language;
- (NSString)name;
- (NSString)persistentIdentifier;
- (int64_t)minVersion;
- (void)setBase:(id)a3;
- (void)setCollectionDescription:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setLanguage:(id)a3;
- (void)setMinVersion:(int64_t)a3;
- (void)setModifiedAt:(id)a3;
- (void)setName:(id)a3;
- (void)setPersistentIdentifier:(id)a3;
- (void)setSupportedIdioms:(id)a3;
- (void)setWorkflows:(id)a3;
@end

@implementation WFMutableGalleryCollection

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->supportedIdioms, 0);
  objc_storeStrong((id *)&self->persistentIdentifier, 0);
  objc_storeStrong((id *)&self->base, 0);
  objc_storeStrong((id *)&self->language, 0);
  objc_storeStrong((id *)&self->modifiedAt, 0);
  objc_storeStrong((id *)&self->workflows, 0);
  objc_storeStrong((id *)&self->collectionDescription, 0);
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

- (void)setModifiedAt:(id)a3
{
}

- (NSDate)modifiedAt
{
  return self->modifiedAt;
}

- (void)setMinVersion:(int64_t)a3
{
  self->minVersion = a3;
}

- (int64_t)minVersion
{
  return self->minVersion;
}

- (void)setWorkflows:(id)a3
{
}

- (NSArray)workflows
{
  return self->workflows;
}

- (void)setCollectionDescription:(id)a3
{
}

- (NSString)collectionDescription
{
  return self->collectionDescription;
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