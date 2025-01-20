@interface NTKComplicationSampleData
+ (BOOL)supportsSecureCoding;
- (BOOL)_validateTemplatesExist;
- (BOOL)encodesTemplatesAsPaths;
- (BOOL)hasTemplateForFamily:(int64_t)a3;
- (NSString)applicationID;
- (NSString)clientID;
- (NTKComplicationSampleData)initWithCoder:(id)a3;
- (NTKComplicationSampleData)initWithSupportedFamilies:(id)a3;
- (id)_decodedTemplateFromPath:(id)a3;
- (id)_uncachedTemplateForFamily:(int64_t)a3;
- (id)copyEncodedToDirectoryPath:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)inflatedCopy;
- (id)supportedFamilies;
- (id)templateForFamily:(int64_t)a3;
- (id)templatePathForFamily:(int64_t)a3;
- (id)templateReferenceForFamily:(int64_t)a3;
- (void)_commonInit;
- (void)_inflateAllTemplates;
- (void)encodeWithCoder:(id)a3;
- (void)setApplicationID:(id)a3;
- (void)setClientID:(id)a3;
- (void)setEncodesTemplatesAsPaths:(BOOL)a3;
- (void)setTemplate:(id)a3 forFamily:(int64_t)a4;
- (void)setTemplatePath:(id)a3 forFamily:(int64_t)a4;
@end

@implementation NTKComplicationSampleData

- (NTKComplicationSampleData)initWithSupportedFamilies:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)NTKComplicationSampleData;
  v5 = [(NTKComplicationSampleData *)&v13 init];
  if (v5)
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    familyToTemplate = v5->_familyToTemplate;
    v5->_familyToTemplate = (NSMutableDictionary *)v6;

    uint64_t v8 = [MEMORY[0x1E4F1CA60] dictionary];
    familyToTemplatePath = v5->_familyToTemplatePath;
    v5->_familyToTemplatePath = (NSMutableDictionary *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1CA80] setWithArray:v4];
    supportedFamilies = v5->_supportedFamilies;
    v5->_supportedFamilies = (NSMutableSet *)v10;

    [(NTKComplicationSampleData *)v5 _commonInit];
  }

  return v5;
}

- (void)_commonInit
{
  self->_encodesTemplatesAsPaths = 1;
}

- (BOOL)hasTemplateForFamily:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  familyToTemplate = v4->_familyToTemplate;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  v7 = [(NSMutableDictionary *)familyToTemplate objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)[v7 copy];

  if (v8)
  {
    char v9 = 1;
  }
  else
  {
    familyToTemplatePath = v4->_familyToTemplatePath;
    v11 = [NSNumber numberWithInteger:a3];
    v12 = [(NSMutableDictionary *)familyToTemplatePath objectForKeyedSubscript:v11];

    if (v12)
    {
      objc_super v13 = [MEMORY[0x1E4F28CB8] defaultManager];
      char v9 = [v13 fileExistsAtPath:v12];
    }
    else
    {
      char v9 = 0;
    }
  }
  objc_sync_exit(v4);

  return v9;
}

- (id)_uncachedTemplateForFamily:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  familyToTemplate = v4->_familyToTemplate;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  v7 = [(NSMutableDictionary *)familyToTemplate objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)[v7 copy];

  if (!v8)
  {
    familyToTemplatePath = v4->_familyToTemplatePath;
    uint64_t v10 = [NSNumber numberWithInteger:a3];
    v11 = [(NSMutableDictionary *)familyToTemplatePath objectForKeyedSubscript:v10];

    if (v11)
    {
      uint64_t v8 = [(NTKComplicationSampleData *)v4 _decodedTemplateFromPath:v11];
    }
    else
    {
      uint64_t v8 = 0;
    }
  }
  objc_sync_exit(v4);

  return v8;
}

- (id)templateForFamily:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  familyToTemplate = v4->_familyToTemplate;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  v7 = [(NSMutableDictionary *)familyToTemplate objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)[v7 copy];

  if (!v8)
  {
    uint64_t v8 = [(NTKComplicationSampleData *)v4 _uncachedTemplateForFamily:a3];
    if ((CLKIsNTKDaemon() & 1) == 0)
    {
      char v9 = v4->_familyToTemplate;
      uint64_t v10 = [NSNumber numberWithInteger:a3];
      [(NSMutableDictionary *)v9 setObject:v8 forKeyedSubscript:v10];
    }
  }
  id v11 = v8;

  objc_sync_exit(v4);
  return v11;
}

- (id)templatePathForFamily:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  familyToTemplatePath = v4->_familyToTemplatePath;
  uint64_t v6 = [NSNumber numberWithInteger:a3];
  v7 = [(NSMutableDictionary *)familyToTemplatePath objectForKeyedSubscript:v6];
  uint64_t v8 = (void *)[v7 copy];

  objc_sync_exit(v4);
  return v8;
}

- (void)setTemplate:(id)a3 forFamily:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  objc_sync_enter(v7);
  if (!v6)
  {
    uint64_t v8 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[NTKComplicationSampleData setTemplate:forFamily:](v8, v9, v10, v11, v12, v13, v14, v15);
    }
  }
  if ((CLKIsNTKDaemon() & 1) == 0)
  {
    familyToTemplate = v7->_familyToTemplate;
    v17 = [NSNumber numberWithInteger:a4];
    [(NSMutableDictionary *)familyToTemplate setObject:v6 forKeyedSubscript:v17];
  }
  supportedFamilies = v7->_supportedFamilies;
  v19 = [NSNumber numberWithInteger:a4];
  [(NSMutableSet *)supportedFamilies addObject:v19];

  objc_sync_exit(v7);
}

- (void)setTemplatePath:(id)a3 forFamily:(int64_t)a4
{
  id v11 = a3;
  id v6 = self;
  objc_sync_enter(v6);
  familyToTemplatePath = v6->_familyToTemplatePath;
  uint64_t v8 = [NSNumber numberWithInteger:a4];
  [(NSMutableDictionary *)familyToTemplatePath setObject:v11 forKeyedSubscript:v8];

  supportedFamilies = v6->_supportedFamilies;
  uint64_t v10 = [NSNumber numberWithInteger:a4];
  [(NSMutableSet *)supportedFamilies addObject:v10];

  objc_sync_exit(v6);
}

- (id)supportedFamilies
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = [(NSMutableSet *)v2->_supportedFamilies allObjects];
  id v4 = (void *)[v3 copy];

  objc_sync_exit(v2);
  return v4;
}

- (id)templateReferenceForFamily:(int64_t)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  supportedFamilies = v4->_supportedFamilies;
  id v6 = [NSNumber numberWithInteger:a3];
  LOBYTE(supportedFamilies) = [(NSMutableSet *)supportedFamilies containsObject:v6];

  if (supportedFamilies)
  {
    familyToTemplatePath = v4->_familyToTemplatePath;
    uint64_t v8 = [NSNumber numberWithInteger:a3];
    uint64_t v9 = [(NSMutableDictionary *)familyToTemplatePath objectForKeyedSubscript:v8];

    familyToTemplate = v4->_familyToTemplate;
    id v11 = [NSNumber numberWithInteger:a3];
    uint64_t v12 = [(NSMutableDictionary *)familyToTemplate objectForKeyedSubscript:v11];

    uint64_t v13 = [[NTKComplicationTemplateReference alloc] initWithPath:v9 existingTemplate:v12];
  }
  else
  {
    uint64_t v13 = 0;
  }
  objc_sync_exit(v4);

  return v13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (NTKComplicationSampleData)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(NTKComplicationSampleData *)self init];
  id v6 = v5;
  if (v5)
  {
    [(NTKComplicationSampleData *)v5 _commonInit];
    v7 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v8 = objc_opt_class();
    uint64_t v9 = objc_opt_class();
    uint64_t v10 = objc_opt_class();
    id v11 = objc_msgSend(v7, "setWithObjects:", v8, v9, v10, objc_opt_class(), 0);
    uint64_t v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_msgSend(v12, "setWithObjects:", v13, v14, objc_opt_class(), 0);
    v16 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v17 = objc_opt_class();
    v18 = objc_msgSend(v16, "setWithObjects:", v17, objc_opt_class(), 0);
    v19 = [v4 decodeObjectOfClasses:v11 forKey:@"FamilyToTemplate"];
    v20 = v19;
    v21 = v19 ? (NSMutableDictionary *)v19 : (NSMutableDictionary *)objc_opt_new();
    familyToTemplate = v6->_familyToTemplate;
    v6->_familyToTemplate = v21;

    v23 = [v4 decodeObjectOfClasses:v15 forKey:@"FamilyToTemplatePath"];
    v24 = v23;
    v25 = v23 ? (NSMutableDictionary *)v23 : (NSMutableDictionary *)objc_opt_new();
    familyToTemplatePath = v6->_familyToTemplatePath;
    v6->_familyToTemplatePath = v25;

    uint64_t v27 = [v4 decodeObjectOfClasses:v18 forKey:@"SupportedFamilies"];
    supportedFamilies = v6->_supportedFamilies;
    v6->_supportedFamilies = (NSMutableSet *)v27;

    v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ClientID"];
    uint64_t v30 = [v29 copy];
    clientID = v6->_clientID;
    v6->_clientID = (NSString *)v30;

    v32 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ApplicationID"];
    uint64_t v33 = [v32 copy];
    applicationID = v6->_applicationID;
    v6->_applicationID = (NSString *)v33;

    if (![(NTKComplicationSampleData *)v6 _validateTemplatesExist])
    {
      v35 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        -[NTKComplicationSampleData initWithCoder:](v35, v36, v37, v38, v39, v40, v41, v42);
      }

      id v6 = 0;
    }
  }

  return v6;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = self;
  objc_sync_enter(v5);
  if (v5->_encodesTemplatesAsPaths)
  {
    id v6 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    v7 = v5->_supportedFamilies;
    uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v24 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v12 = -[NSMutableDictionary objectForKeyedSubscript:](v5->_familyToTemplatePath, "objectForKeyedSubscript:", v11, (void)v23);
          BOOL v13 = v12 == 0;

          if (v13)
          {
            uint64_t v14 = [(NSMutableDictionary *)v5->_familyToTemplate objectForKeyedSubscript:v11];
            [v6 setObject:v14 forKeyedSubscript:v11];
          }
        }
        uint64_t v8 = [(NSMutableSet *)v7 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v8);
    }

    [v4 encodeObject:v5->_familyToTemplatePath forKey:@"FamilyToTemplatePath"];
    [v4 encodeObject:v6 forKey:@"FamilyToTemplate"];
  }
  else
  {
    [(NTKComplicationSampleData *)v5 _inflateAllTemplates];
    [v4 encodeObject:v5->_familyToTemplate forKey:@"FamilyToTemplate"];
  }
  objc_msgSend(v4, "encodeObject:forKey:", v5->_supportedFamilies, @"SupportedFamilies", (void)v23);
  [v4 encodeObject:v5->_clientID forKey:@"ClientID"];
  [v4 encodeObject:v5->_applicationID forKey:@"ApplicationID"];
  if (![(NTKComplicationSampleData *)v5 _validateTemplatesExist])
  {
    uint64_t v15 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[NTKComplicationSampleData encodeWithCoder:](v15, v16, v17, v18, v19, v20, v21, v22);
    }
  }
  objc_sync_exit(v5);
}

- (id)_decodedTemplateFromPath:(id)a3
{
  id v3 = a3;
  id v10 = 0;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithContentsOfFile:v3 options:1 error:&v10];
  id v5 = v10;
  if (v5)
  {
    id v6 = CLKLoggingObjectForDomain();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      -[NTKComplicationSampleData _decodedTemplateFromPath:]();
    }

    v7 = 0;
  }
  else
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F28DC0]) initForReadingFromData:v4 error:0];
    [v8 setDecodingFailurePolicy:0];
    v7 = [v8 decodeObjectOfClass:objc_opt_class() forKey:*MEMORY[0x1E4F284E8]];
  }
  return v7;
}

- (void)_inflateAllTemplates
{
  v2 = self;
  objc_sync_enter(v2);
  familyToTemplatePath = v2->_familyToTemplatePath;
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __49__NTKComplicationSampleData__inflateAllTemplates__block_invoke;
  v4[3] = &unk_1E62C1C40;
  v4[4] = v2;
  [(NSMutableDictionary *)familyToTemplatePath enumerateKeysAndObjectsUsingBlock:v4];
  objc_sync_exit(v2);
}

void __49__NTKComplicationSampleData__inflateAllTemplates__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 _decodedTemplateFromPath:a3];
  [*(id *)(*(void *)(a1 + 32) + 8) setObject:v7 forKeyedSubscript:v6];
}

- (BOOL)_validateTemplatesExist
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  v2 = self;
  objc_sync_enter(v2);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = v2->_supportedFamilies;
  uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v15 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void *)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v8 = -[NSMutableDictionary objectForKeyedSubscript:](v2->_familyToTemplate, "objectForKeyedSubscript:", v7, (void)v14);
        BOOL v9 = v8 == 0;

        if (v9)
        {
          if (!v2->_encodesTemplatesAsPaths
            || ([(NSMutableDictionary *)v2->_familyToTemplatePath objectForKeyedSubscript:v7], id v10 = objc_claimAutoreleasedReturnValue(), v11 = v10 == 0, v10, v11))
          {
            BOOL v12 = 0;
            goto LABEL_13;
          }
        }
      }
      uint64_t v4 = [(NSMutableSet *)v3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  BOOL v12 = 1;
LABEL_13:

  objc_sync_exit(v2);
  return v12;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v3 = self;
  objc_sync_enter(v3);
  uint64_t v4 = objc_alloc_init((Class)objc_opt_class());
  uint64_t v5 = [(NSMutableSet *)v3->_supportedFamilies mutableCopy];
  id v6 = (void *)v4[3];
  v4[3] = v5;

  uint64_t v7 = [(NSMutableDictionary *)v3->_familyToTemplatePath mutableCopy];
  uint64_t v8 = (void *)v4[2];
  v4[2] = v7;

  uint64_t v9 = [(NSMutableDictionary *)v3->_familyToTemplate mutableCopy];
  id v10 = (void *)v4[1];
  v4[1] = v9;

  *((unsigned char *)v4 + 32) = v3->_encodesTemplatesAsPaths;
  uint64_t v11 = [(NSString *)v3->_clientID copy];
  BOOL v12 = (void *)v4[5];
  void v4[5] = v11;

  uint64_t v13 = [(NSString *)v3->_applicationID copy];
  long long v14 = (void *)v4[6];
  v4[6] = v13;

  objc_sync_exit(v3);
  return v4;
}

- (id)inflatedCopy
{
  v2 = (void *)[(NTKComplicationSampleData *)self copy];
  [v2 _inflateAllTemplates];
  uint64_t v3 = objc_opt_new();
  uint64_t v4 = (void *)v2[2];
  v2[2] = v3;

  return v2;
}

- (id)copyEncodedToDirectoryPath:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  uint64_t v4 = [(NTKComplicationSampleData *)self copy];
  uint64_t v5 = objc_opt_new();
  id v6 = *(void **)(v4 + 16);
  *(void *)(v4 + 16) = v5;

  uint64_t v7 = objc_opt_new();
  uint64_t v8 = *(void **)(v4 + 8);
  v51 = (id *)v4;
  *(void *)(v4 + 8) = v7;

  uint64_t v9 = self;
  objc_sync_enter(v9);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  obj = v9->_supportedFamilies;
  uint64_t v10 = [(NSMutableSet *)obj countByEnumeratingWithState:&v56 objects:v60 count:16];
  if (v10)
  {
    uint64_t v50 = *(void *)v57;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v57 != v50) {
        objc_enumerationMutation(obj);
      }
      BOOL v12 = *(void **)(*((void *)&v56 + 1) + 8 * v11);
      uint64_t v13 = NSString;
      [v12 unsignedIntegerValue];
      long long v14 = CLKStringForComplicationFamily();
      long long v15 = [v13 stringWithFormat:@"%@.sample-template", v14];

      long long v16 = [v52 stringByAppendingPathComponent:v15];
      long long v17 = [(NSMutableDictionary *)v9->_familyToTemplatePath objectForKey:v12];
      if (v17
        && ([MEMORY[0x1E4F28CB8] defaultManager],
            uint64_t v18 = objc_claimAutoreleasedReturnValue(),
            int v19 = [v18 fileExistsAtPath:v17],
            v18,
            v19))
      {
        uint64_t v20 = [MEMORY[0x1E4F28CB8] defaultManager];
        id v55 = 0;
        [v20 copyItemAtPath:v17 toPath:v16 error:&v55];
        id v21 = v55;

        if (v21)
        {
          uint64_t v41 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
          if (os_log_type_enabled(v41, OS_LOG_TYPE_ERROR)) {
            -[NTKComplicationSampleData copyEncodedToDirectoryPath:]((uint64_t)v21, v41, v43, v44, v45, v46, v47, v48);
          }
          goto LABEL_21;
        }
      }
      else
      {
        uint64_t v22 = (void *)MEMORY[0x1E4F28DB0];
        long long v23 = [(NSMutableDictionary *)v9->_familyToTemplate objectForKey:v12];
        id v54 = 0;
        uint64_t v41 = [v22 archivedDataWithRootObject:v23 requiringSecureCoding:1 error:&v54];
        id v21 = v54;

        if (v21)
        {
          uint64_t v27 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[NTKComplicationSampleData copyEncodedToDirectoryPath:]((uint64_t)v21, v27, v28, v29, v30, v31, v32, v33);
          }
LABEL_20:

LABEL_21:
          objc_sync_exit(v9);

          long long v26 = 0;
          long long v25 = v51;
          goto LABEL_22;
        }
        id v53 = 0;
        [v41 writeToFile:v16 options:1 error:&v53];
        id v24 = v53;
        if (v24)
        {
          id v21 = v24;
          uint64_t v27 = _NTKLoggingObjectForDomain(18, (uint64_t)"NTKLoggingDomainComplication");
          if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
            -[NTKComplicationSampleData copyEncodedToDirectoryPath:]((uint64_t)v21, v27, v34, v35, v36, v37, v38, v39);
          }
          goto LABEL_20;
        }
      }
      [v51[2] setObject:v16 forKeyedSubscript:v12];

      if (v10 == ++v11)
      {
        uint64_t v10 = [(NSMutableSet *)obj countByEnumeratingWithState:&v56 objects:v60 count:16];
        if (v10) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  objc_sync_exit(v9);
  long long v25 = v51;
  long long v26 = v51;
LABEL_22:

  return v26;
}

- (NSString)clientID
{
  return self->_clientID;
}

- (void)setClientID:(id)a3
{
}

- (NSString)applicationID
{
  return self->_applicationID;
}

- (void)setApplicationID:(id)a3
{
}

- (BOOL)encodesTemplatesAsPaths
{
  return self->_encodesTemplatesAsPaths;
}

- (void)setEncodesTemplatesAsPaths:(BOOL)a3
{
  self->_encodesTemplatesAsPaths = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationID, 0);
  objc_storeStrong((id *)&self->_clientID, 0);
  objc_storeStrong((id *)&self->_supportedFamilies, 0);
  objc_storeStrong((id *)&self->_familyToTemplatePath, 0);
  objc_storeStrong((id *)&self->_familyToTemplate, 0);
}

- (void)setTemplate:(uint64_t)a3 forFamily:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)initWithCoder:(os_log_t)log .cold.2(void *a1, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 138412290;
  *(void *)(buf + 4) = a1;
  _os_log_error_impl(&dword_1BC5A9000, log, OS_LOG_TYPE_ERROR, "Could not decode NTKComplicationSampleData '%@'", buf, 0xCu);
}

- (void)encodeWithCoder:(uint64_t)a3 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)_decodedTemplateFromPath:.cold.1()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Error decoding sample complication template at path %@: %@");
}

- (void)_decodedTemplateFromPath:.cold.2()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_3(&dword_1BC5A9000, v0, v1, "Error loading data for sample complication template at path %@: %@");
}

- (void)copyEncodedToDirectoryPath:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyEncodedToDirectoryPath:(uint64_t)a3 .cold.2(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

- (void)copyEncodedToDirectoryPath:(uint64_t)a3 .cold.3(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
}

@end