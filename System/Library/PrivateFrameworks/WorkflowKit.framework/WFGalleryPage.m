@interface WFGalleryPage
+ (NSDictionary)properties;
+ (NSString)recordType;
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
- (id)copyWithZone:(_NSZone *)a3;
- (id)mutableCopyWithZone:(_NSZone *)a3;
- (id)subPageMatchingName:(id)a3;
- (id)subPageWithIdentifier:(id)a3;
- (unint64_t)referenceActionForKey:(id)a3;
@end

@implementation WFGalleryPage

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_persistentIdentifier, 0);
  objc_storeStrong((id *)&self->_base, 0);
  objc_storeStrong((id *)&self->_language, 0);
  objc_storeStrong((id *)&self->_donationsGroupedByApp, 0);
  objc_storeStrong((id *)&self->_donations, 0);
  objc_storeStrong((id *)&self->_collections, 0);
  objc_storeStrong((id *)&self->_banners, 0);
  objc_storeStrong((id *)&self->_isRoot, 0);
  objc_storeStrong((id *)&self->_minVersion, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSString)persistentIdentifier
{
  return self->_persistentIdentifier;
}

- (CKRecordID)base
{
  return self->_base;
}

- (NSString)language
{
  return self->_language;
}

- (NSArray)donationsGroupedByApp
{
  return self->_donationsGroupedByApp;
}

- (NSArray)donations
{
  return self->_donations;
}

- (NSArray)collections
{
  return self->_collections;
}

- (NSArray)banners
{
  return self->_banners;
}

- (NSNumber)isRoot
{
  return self->_isRoot;
}

- (NSNumber)minVersion
{
  return self->_minVersion;
}

- (NSString)name
{
  return self->_name;
}

- (CKRecordID)identifier
{
  return self->_identifier;
}

- (id)mutableCopyWithZone:(_NSZone *)a3
{
  v5 = [+[WFMutableGalleryPage allocWithZone:](WFMutableGalleryPage, "allocWithZone:") init];
  v6 = [(WFGalleryPage *)self identifier];
  v7 = (void *)[v6 copyWithZone:a3];
  [(WFMutableGalleryPage *)v5 setIdentifier:v7];

  v8 = [(WFGalleryPage *)self name];
  v9 = (void *)[v8 copyWithZone:a3];
  [(WFMutableGalleryPage *)v5 setName:v9];

  v10 = [(WFGalleryPage *)self minVersion];
  v11 = (void *)[v10 copyWithZone:a3];
  [(WFMutableGalleryPage *)v5 setMinVersion:v11];

  v12 = [(WFGalleryPage *)self isRoot];
  v13 = (void *)[v12 copyWithZone:a3];
  [(WFMutableGalleryPage *)v5 setIsRoot:v13];

  v14 = [(WFGalleryPage *)self banners];
  v15 = (void *)[v14 copyWithZone:a3];
  [(WFMutableGalleryPage *)v5 setBanners:v15];

  v16 = [(WFGalleryPage *)self collections];
  v17 = (void *)[v16 copyWithZone:a3];
  [(WFMutableGalleryPage *)v5 setCollections:v17];

  v18 = [(WFGalleryPage *)self donations];
  v19 = (void *)[v18 copyWithZone:a3];
  [(WFMutableGalleryPage *)v5 setDonations:v19];

  v20 = [(WFGalleryPage *)self donationsGroupedByApp];
  v21 = (void *)[v20 copyWithZone:a3];
  [(WFMutableGalleryPage *)v5 setDonationsGroupedByApp:v21];

  v22 = [(WFGalleryPage *)self language];
  v23 = (void *)[v22 copyWithZone:a3];
  [(WFMutableGalleryPage *)v5 setLanguage:v23];

  v24 = [(WFGalleryPage *)self base];
  [(WFMutableGalleryPage *)v5 setBase:v24];

  v25 = [(WFGalleryPage *)self persistentIdentifier];
  v26 = (void *)[v25 copyWithZone:a3];
  [(WFMutableGalleryPage *)v5 setPersistentIdentifier:v26];

  return v5;
}

+ (NSDictionary)properties
{
  v13[8] = *MEMORY[0x1E4F143B8];
  v12[0] = @"name";
  v2 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v13[0] = v2;
  v12[1] = @"minVersion";
  v3 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v13[1] = v3;
  v12[2] = @"isRoot";
  v4 = +[WFCloudKitItemProperty objectPropertyWithName:](WFCloudKitItemProperty, "objectPropertyWithName:");
  v13[2] = v4;
  v12[3] = @"banners";
  v5 = +[WFCloudKitItemProperty itemPropertyWithName:@"banners" itemClass:objc_opt_class()];
  v13[3] = v5;
  v12[4] = @"collections";
  v6 = +[WFCloudKitItemProperty itemPropertyWithName:@"collections" itemClass:objc_opt_class()];
  v13[4] = v6;
  v12[5] = @"language";
  v7 = +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v13[5] = v7;
  v12[6] = @"base";
  v8 = +[WFCloudKitItemProperty itemReferencePropertyWithName:@"base" itemClass:objc_opt_class()];
  v13[6] = v8;
  v12[7] = @"persistentIdentifier";
  v9 = +[WFCloudKitItemProperty objectPropertyWithName:ignoredByDefault:encrypted:](WFCloudKitItemProperty, "objectPropertyWithName:ignoredByDefault:encrypted:");
  v13[7] = v9;
  v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v13 forKeys:v12 count:8];

  return (NSDictionary *)v10;
}

+ (NSString)recordType
{
  return (NSString *)@"GalleryPage";
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [+[WFGalleryPage allocWithZone:](WFGalleryPage, "allocWithZone:") init];
  v6 = [(WFGalleryPage *)self identifier];
  uint64_t v7 = [v6 copyWithZone:a3];
  identifier = v5->_identifier;
  v5->_identifier = (CKRecordID *)v7;

  v9 = [(WFGalleryPage *)self name];
  uint64_t v10 = [v9 copyWithZone:a3];
  name = v5->_name;
  v5->_name = (NSString *)v10;

  v12 = [(WFGalleryPage *)self minVersion];
  uint64_t v13 = [v12 copyWithZone:a3];
  minVersion = v5->_minVersion;
  v5->_minVersion = (NSNumber *)v13;

  v15 = [(WFGalleryPage *)self isRoot];
  uint64_t v16 = [v15 copyWithZone:a3];
  isRoot = v5->_isRoot;
  v5->_isRoot = (NSNumber *)v16;

  v18 = [(WFGalleryPage *)self banners];
  uint64_t v19 = [v18 copyWithZone:a3];
  banners = v5->_banners;
  v5->_banners = (NSArray *)v19;

  v21 = [(WFGalleryPage *)self collections];
  uint64_t v22 = [v21 copyWithZone:a3];
  collections = v5->_collections;
  v5->_collections = (NSArray *)v22;

  v24 = [(WFGalleryPage *)self donations];
  uint64_t v25 = [v24 copyWithZone:a3];
  donations = v5->_donations;
  v5->_donations = (NSArray *)v25;

  v27 = [(WFGalleryPage *)self donationsGroupedByApp];
  uint64_t v28 = [v27 copyWithZone:a3];
  donationsGroupedByApp = v5->_donationsGroupedByApp;
  v5->_donationsGroupedByApp = (NSArray *)v28;

  v30 = [(WFGalleryPage *)self language];
  uint64_t v31 = [v30 copyWithZone:a3];
  language = v5->_language;
  v5->_language = (NSString *)v31;

  uint64_t v33 = [(WFGalleryPage *)self base];
  base = v5->_base;
  v5->_base = (CKRecordID *)v33;

  v35 = [(WFGalleryPage *)self persistentIdentifier];
  uint64_t v36 = [v35 copyWithZone:a3];
  persistentIdentifier = v5->_persistentIdentifier;
  v5->_persistentIdentifier = (NSString *)v36;

  return v5;
}

- (id)subPageWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WFGalleryPage *)self identifier];
  int v6 = [v5 isEqual:v4];

  if (v6)
  {
    uint64_t v7 = self;
  }
  else
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    v8 = [(WFGalleryPage *)self banners];
    v9 = [v8 valueForKey:@"detailPage"];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = [*(id *)(*((void *)&v16 + 1) + 8 * i) subPageWithIdentifier:v4];
          if (v14)
          {
            uint64_t v7 = (WFGalleryPage *)v14;

            goto LABEL_13;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }

    uint64_t v7 = 0;
  }
LABEL_13:

  return v7;
}

- (id)subPageMatchingName:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = [(WFGalleryPage *)self name];
  uint64_t v6 = [v5 rangeOfString:v4 options:129];

  if (v6 == 0x7FFFFFFFFFFFFFFFLL)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v7 = [(WFGalleryPage *)self banners];
    v8 = [v7 valueForKey:@"detailPage"];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = [*(id *)(*((void *)&v16 + 1) + 8 * i) subPageMatchingName:v4];
          if (v13)
          {
            uint64_t v14 = (WFGalleryPage *)v13;

            goto LABEL_13;
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v10) {
          continue;
        }
        break;
      }
    }

    uint64_t v14 = 0;
  }
  else
  {
    uint64_t v14 = self;
  }
LABEL_13:

  return v14;
}

- (unint64_t)referenceActionForKey:(id)a3
{
  return [a3 isEqualToString:@"base"];
}

@end