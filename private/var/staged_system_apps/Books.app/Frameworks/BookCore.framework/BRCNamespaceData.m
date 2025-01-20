@interface BRCNamespaceData
+ (BOOL)supportsSecureCoding;
+ (NSString)fallbackStorefrontID;
- (BOOL)isEqual:(id)a3;
- (BRCNamespaceData)init;
- (BRCNamespaceData)initWithCoder:(id)a3;
- (NSArray)segmentIDs;
- (NSArray)segmentSetIDs;
- (NSArray)treatmentIDs;
- (NSDictionary)configuration;
- (NSDictionary)systemDefaults;
- (NSMutableArray)subscribers;
- (NSString)bundleID;
- (NSString)namespaceIdentifier;
- (char)_containerIDForContainerIdentifier:(id)a3;
- (id)_IDsToStrings:(id)a3;
- (id)_URLSafeBase64EncodedStringWithData:(id)a3 options:(unint64_t)a4;
- (id)_permanentURLForRecordID:(id)a3 containerIdentifier:(id)a4;
- (id)_storefrontIDFromStorefront:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)segmentSetsAsStrings;
- (id)segmentsAsStrings;
- (id)treatmentsAsStrings;
- (void)_booksRecordIDFrom:(id)a3 completion:(id)a4;
- (void)_updateAssetURLHostIfNeededWithParameters:(id)a3 containerIdentifier:(id)a4;
- (void)cleanupSubscribers;
- (void)encodeWithCoder:(id)a3;
- (void)setBundleID:(id)a3;
- (void)setConfiguration:(id)a3;
- (void)setNamespaceIdentifier:(id)a3;
- (void)setSegmentIDs:(id)a3;
- (void)setSegmentSetIDs:(id)a3;
- (void)setSubscribers:(id)a3;
- (void)setSystemDefaults:(id)a3;
- (void)setTreatmentIDs:(id)a3;
- (void)settingsWithUserID:(id)a3 completion:(id)a4;
@end

@implementation BRCNamespaceData

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [[objc_opt_class() allocWithZone:a3] init];
  v5 = [(BRCNamespaceData *)self namespaceIdentifier];
  [v4 setNamespaceIdentifier:v5];

  v6 = [(BRCNamespaceData *)self bundleID];
  [v4 setBundleID:v6];

  v7 = [(BRCNamespaceData *)self systemDefaults];
  [v4 setSystemDefaults:v7];

  v8 = [(BRCNamespaceData *)self configuration];
  [v4 setConfiguration:v8];

  v9 = [(BRCNamespaceData *)self subscribers];
  [v4 setSubscribers:v9];

  v10 = [(BRCNamespaceData *)self treatmentIDs];
  [v4 setTreatmentIDs:v10];

  v11 = [(BRCNamespaceData *)self segmentIDs];
  [v4 setSegmentIDs:v11];

  v12 = [(BRCNamespaceData *)self segmentSetIDs];
  [v4 setSegmentSetIDs:v12];

  return v4;
}

- (BRCNamespaceData)init
{
  v19.receiver = self;
  v19.super_class = (Class)BRCNamespaceData;
  v2 = [(BRCNamespaceData *)&v19 init];
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    subscribers = v2->_subscribers;
    v2->_subscribers = v3;

    v5 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    configuration = v2->_configuration;
    v2->_configuration = v5;

    v7 = (NSDictionary *)objc_alloc_init((Class)NSDictionary);
    systemDefaults = v2->_systemDefaults;
    v2->_systemDefaults = v7;

    v9 = (NSArray *)objc_alloc_init((Class)NSArray);
    segmentIDs = v2->_segmentIDs;
    v2->_segmentIDs = v9;

    v11 = (NSArray *)objc_alloc_init((Class)NSArray);
    segmentSetIDs = v2->_segmentSetIDs;
    v2->_segmentSetIDs = v11;

    v13 = (NSArray *)objc_alloc_init((Class)NSArray);
    treatmentIDs = v2->_treatmentIDs;
    v2->_treatmentIDs = v13;

    id v15 = objc_alloc((Class)NSUserDefaults);
    v16 = (NSUserDefaults *)[v15 initWithSuiteName:BUBooksGroupContainerIdentifier];
    userDefaults = v2->_userDefaults;
    v2->_userDefaults = v16;
  }
  return v2;
}

- (NSDictionary)systemDefaults
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_systemDefaults;
  objc_sync_exit(v2);

  return v3;
}

- (void)setSystemDefaults:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 bu_dictionaryByRecursivelyRemovingNSNulls];
  systemDefaults = v4->_systemDefaults;
  v4->_systemDefaults = (NSDictionary *)v5;

  objc_sync_exit(v4);
}

- (NSDictionary)configuration
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_configuration;
  objc_sync_exit(v2);

  return v3;
}

- (void)setConfiguration:(id)a3
{
  id v7 = a3;
  id v4 = self;
  objc_sync_enter(v4);
  uint64_t v5 = [v7 bu_dictionaryByRecursivelyRemovingNSNulls];
  configuration = v4->_configuration;
  v4->_configuration = (NSDictionary *)v5;

  objc_sync_exit(v4);
}

- (void)settingsWithUserID:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"BRCEnableMonitoring"];
  v9 = @"com.apple.news.public";
  if (!v8)
  {
    id v14 = 0;
    goto LABEL_10;
  }
  NSInteger v10 = [(NSUserDefaults *)self->_userDefaults integerForKey:@"BRCConfigSource"];
  NSInteger v11 = [(NSUserDefaults *)self->_userDefaults integerForKey:@"BRCServerEnv"];
  NSInteger v12 = v11;
  id v30 = v6;
  if (v11 == 2)
  {
    v13 = BRCSettingsBooksContainerIdentifierQA;
  }
  else
  {
    if (v11 != 1)
    {
      v29 = v9;
      goto LABEL_9;
    }
    v13 = BRCSettingsBooksContainerIdentifierStaging;
  }
  id v15 = *v13;

  v29 = v15;
LABEL_9:
  BOOL v16 = [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"BRCDisableABTesting"];
  BOOL v17 = [(NSUserDefaults *)self->_userDefaults BOOLForKey:@"BRCIgnoreCache"];
  v18 = [(NSUserDefaults *)self->_userDefaults stringForKey:@"BRCOverrideSegmentIDs"];
  objc_super v19 = [(NSUserDefaults *)self->_userDefaults stringForKey:@"BRCAdditionalSegmentIDs"];
  v20 = brc_segmentIDSplit(v18);
  v21 = brc_segmentIDSplit(v19);
  LOBYTE(v28) = 1;
  id v14 = [objc_alloc((Class)RCDebugOverrides) initWithDisableAbTesting:v16 overrideSegmentSetIDs:v20 additionalSegmentSetIDs:v21 configurationSource:v10 debugEnvironment:v12 ignoreCache:v17 enableExtraLogs:v28];

  v9 = v29;
  id v6 = v30;
LABEL_10:
  v22 = [(BRCNamespaceData *)self namespaceIdentifier];
  unsigned int v23 = [v22 isEqualToString:@"BooksDefaults"];

  if (v23)
  {
    v24 = +[BUAccountsProvider sharedProvider];
    v25 = [v24 currentStorefront];

    v26 = [(BRCNamespaceData *)self _storefrontIDFromStorefront:v25];
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_CDBD8;
    v31[3] = &unk_2C89F8;
    v31[4] = self;
    v32 = v9;
    id v33 = v6;
    id v34 = v26;
    id v35 = v14;
    id v36 = v7;
    id v27 = v26;
    [(BRCNamespaceData *)self _booksRecordIDFrom:v27 completion:v31];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)cleanupSubscribers
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  id v4 = [(BRCNamespaceData *)self subscribers];
  id v5 = [v4 copy];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        NSInteger v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        NSInteger v12 = [v11 object:v14];

        if (!v12) {
          [v3 addObject:v11];
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }

  v13 = [(BRCNamespaceData *)self subscribers];
  [v13 removeObjectsInArray:v3];
}

- (id)segmentsAsStrings
{
  return [(BRCNamespaceData *)self _IDsToStrings:self->_segmentIDs];
}

- (id)segmentSetsAsStrings
{
  return [(BRCNamespaceData *)self _IDsToStrings:self->_segmentSetIDs];
}

- (id)treatmentsAsStrings
{
  return [(BRCNamespaceData *)self _IDsToStrings:self->_treatmentIDs];
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (BRCNamespaceData *)a3;
  if (self == v4)
  {
    unsigned __int8 v10 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
LABEL_30:
      unsigned __int8 v10 = 0;
      goto LABEL_31;
    }
    namespaceIdentifier = self->_namespaceIdentifier;
    uint64_t v6 = [(BRCNamespaceData *)v4 namespaceIdentifier];
    if (namespaceIdentifier == (NSString *)v6)
    {
    }
    else
    {
      id v7 = (void *)v6;
      id v8 = self->_namespaceIdentifier;
      uint64_t v9 = [(BRCNamespaceData *)v4 namespaceIdentifier];
      LODWORD(v8) = [(NSString *)v8 isEqual:v9];

      if (!v8) {
        goto LABEL_30;
      }
    }
    bundleID = self->_bundleID;
    uint64_t v12 = [(BRCNamespaceData *)v4 bundleID];
    if (bundleID == (NSString *)v12)
    {
    }
    else
    {
      v13 = (void *)v12;
      long long v14 = self->_bundleID;
      long long v15 = [(BRCNamespaceData *)v4 bundleID];
      LODWORD(v14) = [(NSString *)v14 isEqual:v15];

      if (!v14) {
        goto LABEL_30;
      }
    }
    systemDefaults = self->_systemDefaults;
    uint64_t v17 = [(BRCNamespaceData *)v4 systemDefaults];
    if (systemDefaults == (NSDictionary *)v17)
    {
    }
    else
    {
      v18 = (void *)v17;
      objc_super v19 = self->_systemDefaults;
      v20 = [(BRCNamespaceData *)v4 systemDefaults];
      LODWORD(v19) = [(NSDictionary *)v19 isEqual:v20];

      if (!v19) {
        goto LABEL_30;
      }
    }
    configuration = self->_configuration;
    uint64_t v22 = [(BRCNamespaceData *)v4 configuration];
    if (configuration == (NSDictionary *)v22)
    {
    }
    else
    {
      unsigned int v23 = (void *)v22;
      v24 = self->_configuration;
      v25 = [(BRCNamespaceData *)v4 configuration];
      LODWORD(v24) = [(NSDictionary *)v24 isEqual:v25];

      if (!v24) {
        goto LABEL_30;
      }
    }
    subscribers = self->_subscribers;
    uint64_t v27 = [(BRCNamespaceData *)v4 subscribers];
    if (subscribers == (NSMutableArray *)v27)
    {
    }
    else
    {
      uint64_t v28 = (void *)v27;
      v29 = self->_subscribers;
      id v30 = [(BRCNamespaceData *)v4 subscribers];
      LODWORD(v29) = [(NSMutableArray *)v29 isEqual:v30];

      if (!v29) {
        goto LABEL_30;
      }
    }
    treatmentIDs = self->_treatmentIDs;
    uint64_t v32 = [(BRCNamespaceData *)v4 treatmentIDs];
    if (treatmentIDs == (NSArray *)v32)
    {
    }
    else
    {
      id v33 = (void *)v32;
      id v34 = self->_treatmentIDs;
      id v35 = [(BRCNamespaceData *)v4 treatmentIDs];
      LODWORD(v34) = [(NSArray *)v34 isEqual:v35];

      if (!v34) {
        goto LABEL_30;
      }
    }
    segmentIDs = self->_segmentIDs;
    uint64_t v37 = [(BRCNamespaceData *)v4 segmentIDs];
    if (segmentIDs == (NSArray *)v37)
    {
    }
    else
    {
      v38 = (void *)v37;
      v39 = self->_segmentIDs;
      v40 = [(BRCNamespaceData *)v4 segmentIDs];
      LODWORD(v39) = [(NSArray *)v39 isEqual:v40];

      if (!v39) {
        goto LABEL_30;
      }
    }
    segmentSetIDs = self->_segmentSetIDs;
    v43 = [(BRCNamespaceData *)v4 segmentSetIDs];
    if (segmentSetIDs == v43)
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      v44 = self->_segmentSetIDs;
      v45 = [(BRCNamespaceData *)v4 segmentSetIDs];
      unsigned __int8 v10 = [(NSArray *)v44 isEqual:v45];
    }
  }
LABEL_31:

  return v10;
}

- (id)description
{
  id v3 = objc_alloc((Class)NSMutableString);
  id v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  id v6 = [v3 initWithFormat:@"<%@ %p", v5, self];

  id v7 = [(BRCNamespaceData *)self namespaceIdentifier];
  [v6 appendFormat:@" namespaceIdentifier=%@", v7];

  id v8 = [(BRCNamespaceData *)self bundleID];
  [v6 appendFormat:@" bundleID=%@", v8];

  uint64_t v9 = [(BRCNamespaceData *)self systemDefaults];
  [v6 appendFormat:@" systemDefaults=%@", v9];

  unsigned __int8 v10 = [(BRCNamespaceData *)self configuration];
  [v6 appendFormat:@" configuration=%@", v10];

  NSInteger v11 = [(BRCNamespaceData *)self subscribers];
  [v6 appendFormat:@" subscribers=%@", v11];

  uint64_t v12 = [(BRCNamespaceData *)self treatmentIDs];
  [v6 appendFormat:@" treatmentIDs=%@", v12];

  v13 = [(BRCNamespaceData *)self segmentIDs];
  [v6 appendFormat:@" segmentIDs=%@", v13];

  long long v14 = [(BRCNamespaceData *)self segmentSetIDs];
  [v6 appendFormat:@" segmentSetIDs=%@", v14];

  [v6 appendFormat:@">"];
  id v15 = [v6 copy];

  return v15;
}

- (id)_IDsToStrings:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) stringValue];
        [v4 addObject:v10];
      }
      id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (char)_containerIDForContainerIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 isEqualToString:@"com.apple.news.public"])
  {
    char v4 = 1;
  }
  else if ([v3 isEqualToString:@"com.apple.news.public.staging"])
  {
    char v4 = 2;
  }
  else if ([v3 isEqualToString:@"com.apple.news.public.qa"])
  {
    char v4 = 3;
  }
  else
  {
    char v4 = 0;
  }

  return v4;
}

- (id)_permanentURLForRecordID:(id)a3 containerIdentifier:(id)a4
{
  char v18 = 2;
  char v17 = 0;
  id v6 = a4;
  id v7 = a3;
  unsigned __int8 v16 = [v7 length];
  unsigned __int8 v15 = [(BRCNamespaceData *)self _containerIDForContainerIdentifier:v6];
  uint64_t v8 = +[NSMutableData data];
  [v8 appendBytes:&v18 length:1];
  [v8 appendBytes:&v15 length:1];
  [v8 appendBytes:&v16 length:1];
  uint64_t v9 = [v7 dataUsingEncoding:4];

  [v8 appendData:v9];
  [v8 appendBytes:&v17 length:1];
  [v8 appendBytes:"17" length:2];
  unsigned __int8 v10 = [(BRCNamespaceData *)self _URLSafeBase64EncodedStringWithData:v8 options:0];
  id v11 = objc_alloc_init((Class)NSURLComponents);
  [v11 setScheme:@"https"];
  [v11 setHost:@"c.apple.news"];
  [(BRCNamespaceData *)self _updateAssetURLHostIfNeededWithParameters:v11 containerIdentifier:v6];

  long long v12 = +[NSString stringWithFormat:@"/%@", v10];
  [v11 setPath:v12];

  long long v13 = [v11 URL];

  return v13;
}

- (void)_updateAssetURLHostIfNeededWithParameters:(id)a3 containerIdentifier:(id)a4
{
  id v6 = a3;
  id v5 = a4;
  if (([v5 isEqualToString:@"com.apple.news.public.staging"] & 1) != 0
    || [v5 isEqualToString:@"com.apple.news.public.qa"])
  {
    [v6 setHost:@"cvws-internal.icloud.com"];
  }
}

- (id)_URLSafeBase64EncodedStringWithData:(id)a3 options:(unint64_t)a4
{
  char v4 = [a3 base64EncodedStringWithOptions:a4];
  id v5 = [v4 mutableCopy];

  [v5 replaceOccurrencesOfString:@"+" withString:@"-" options:0 range:NSMakeRange(0, [v5 length])];
  [v5 replaceOccurrencesOfString:@"/" withString:@"_" options:0 range:[v5 length]];
  objc_msgSend(v5, "replaceOccurrencesOfString:withString:options:range:", @"=", &stru_2CE418, 0, 0, objc_msgSend(v5, "length"));
  id v6 = [v5 copy];

  return v6;
}

- (id)_storefrontIDFromStorefront:(id)a3
{
  id v3 = a3;
  if (!v3) {
    goto LABEL_3;
  }
  char v4 = +[NSCharacterSet characterSetWithCharactersInString:@" -,"];
  id v5 = [v3 componentsSeparatedByCharactersInSet:v4];
  id v6 = [v5 firstObject];

  if (!v6)
  {
LABEL_3:
    id v6 = +[BRCNamespaceData fallbackStorefrontID];
    id v7 = BRCConfigLog();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&def_7D91C, v7, OS_LOG_TYPE_INFO, "BRCNamespaceData: _storefrontIDFromStorefront: unable to get storefrontID from %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCNamespaceData *)self namespaceIdentifier];
  [v4 encodeObject:v5 forKey:@"namespaceIdentifier"];

  id v6 = [(BRCNamespaceData *)self bundleID];
  [v4 encodeObject:v6 forKey:@"bundleID"];

  id v7 = [(BRCNamespaceData *)self systemDefaults];
  [v4 encodeObject:v7 forKey:@"systemDefaults"];

  uint64_t v8 = [(BRCNamespaceData *)self configuration];
  [v4 encodeObject:v8 forKey:@"configuration"];

  int v9 = [(BRCNamespaceData *)self treatmentIDs];
  [v4 encodeObject:v9 forKey:@"treatmentIDs"];

  id v10 = [(BRCNamespaceData *)self segmentIDs];
  [v4 encodeObject:v10 forKey:@"segmentIDs"];

  id v11 = [(BRCNamespaceData *)self segmentSetIDs];
  [v4 encodeObject:v11 forKey:@"segmentSetIDs"];
}

- (BRCNamespaceData)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCNamespaceData *)self init];
  if (v5)
  {
    id v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"namespaceIdentifier"];
    [(BRCNamespaceData *)v5 setNamespaceIdentifier:v6];

    id v7 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleID"];
    [(BRCNamespaceData *)v5 setBundleID:v7];

    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    long long v12 = [v4 decodeObjectOfClasses:v11 forKey:@"systemDefaults"];
    [(BRCNamespaceData *)v5 setSystemDefaults:v12];

    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    unsigned __int8 v16 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    char v17 = [v4 decodeObjectOfClasses:v16 forKey:@"configuration"];
    [(BRCNamespaceData *)v5 setConfiguration:v17];

    uint64_t v18 = objc_opt_class();
    objc_super v19 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v18, objc_opt_class(), 0);
    v20 = [v4 decodeObjectOfClasses:v19 forKey:@"treatmentIDs"];
    [(BRCNamespaceData *)v5 setTreatmentIDs:v20];

    uint64_t v21 = objc_opt_class();
    uint64_t v22 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v21, objc_opt_class(), 0);
    unsigned int v23 = [v4 decodeObjectOfClasses:v22 forKey:@"segmentIDs"];
    [(BRCNamespaceData *)v5 setSegmentIDs:v23];

    uint64_t v24 = objc_opt_class();
    v25 = +[NSSet setWithObjects:](NSSet, "setWithObjects:", v24, objc_opt_class(), 0);
    v26 = [v4 decodeObjectOfClasses:v25 forKey:@"segmentSetIDs"];
    [(BRCNamespaceData *)v5 setSegmentSetIDs:v26];
  }
  return v5;
}

- (NSString)namespaceIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 32, 1);
}

- (void)setNamespaceIdentifier:(id)a3
{
}

- (NSString)bundleID
{
  return (NSString *)objc_getProperty(self, a2, 40, 1);
}

- (void)setBundleID:(id)a3
{
}

- (NSMutableArray)subscribers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setSubscribers:(id)a3
{
}

- (NSArray)treatmentIDs
{
  return (NSArray *)objc_getProperty(self, a2, 56, 1);
}

- (void)setTreatmentIDs:(id)a3
{
}

- (NSArray)segmentIDs
{
  return (NSArray *)objc_getProperty(self, a2, 64, 1);
}

- (void)setSegmentIDs:(id)a3
{
}

- (NSArray)segmentSetIDs
{
  return (NSArray *)objc_getProperty(self, a2, 72, 1);
}

- (void)setSegmentSetIDs:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_segmentSetIDs, 0);
  objc_storeStrong((id *)&self->_segmentIDs, 0);
  objc_storeStrong((id *)&self->_treatmentIDs, 0);
  objc_storeStrong((id *)&self->_subscribers, 0);
  objc_storeStrong((id *)&self->_bundleID, 0);
  objc_storeStrong((id *)&self->_namespaceIdentifier, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_systemDefaults, 0);

  objc_storeStrong((id *)&self->_userDefaults, 0);
}

+ (NSString)fallbackStorefrontID
{
  NSString v2 = sub_1F2160();

  return (NSString *)v2;
}

- (void)_booksRecordIDFrom:(id)a3 completion:(id)a4
{
  id v5 = _Block_copy(a4);
  uint64_t v6 = sub_1F2190();
  uint64_t v8 = v7;
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v5;
  uint64_t v10 = self;
  BRCNamespaceData._booksRecordID(from:completion:)(v6, v8, (uint64_t)sub_1C66EC, v9);

  swift_bridgeObjectRelease();

  swift_release();
}

@end