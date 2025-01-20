@interface SLHighlight
+ (BOOL)supportsSecureCoding;
+ (id)Sha256ForData:(id)a3 withSalt:(id)a4;
+ (id)errorForHighlightDomain:(id)a3 andCode:(int64_t)a4 andUnderlyingError:(id *)a5;
+ (id)requiredSpotlightAttributeKeys;
- (BOOL)isEqual:(id)a3;
- (BOOL)isLocalResource;
- (BOOL)isSyndicatableMedia;
- (NSArray)attributions;
- (NSDate)timestamp;
- (NSDictionary)supplementaryData;
- (NSNumber)score;
- (NSString)identifier;
- (NSString)resourceUTI;
- (NSURL)livePhotoComplementURL;
- (NSURL)resolvedURL;
- (NSURL)resourceURL;
- (SLHighlight)initWithAttribution:(id)a3;
- (SLHighlight)initWithCSSearchableItem:(id)a3;
- (SLHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4;
- (SLHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 error:(id *)a4;
- (SLHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 error:(id *)a5;
- (SLHighlight)initWithCoder:(id)a3;
- (SLHighlight)initWithDictionary:(id)a3;
- (SLHighlight)initWithPortraitHighlight:(id)a3 error:(id *)a4;
- (id)_uniqueIdentifierForResourceURL:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)dictionaryRepresentation;
- (id)portraitHighlight;
- (unint64_t)hash;
- (unint64_t)syndicationType;
- (void)dictionaryRepresentation;
- (void)encodeWithCoder:(id)a3;
- (void)setAttributions:(id)a3;
@end

@implementation SLHighlight

+ (id)Sha256ForData:(id)a3 withSalt:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  memset(&v13, 0, sizeof(v13));
  id v6 = a3;
  CC_SHA256_Init(&v13);
  id v7 = v6;
  v8 = (const void *)objc_msgSend(v7, "bytes", *(_OWORD *)v13.count, *(_OWORD *)&v13.hash[2], *(_OWORD *)&v13.hash[6], *(_OWORD *)&v13.wbuf[2], *(_OWORD *)&v13.wbuf[6], *(_OWORD *)&v13.wbuf[10], *(void *)&v13.wbuf[14]);
  CC_LONG v9 = [v7 length];

  CC_SHA256_Update(&v13, v8, v9);
  if (v5)
  {
    id v10 = v5;
    CC_SHA256_Update(&v13, (const void *)[v10 bytes], objc_msgSend(v10, "length"));
  }
  CC_SHA256_Final(md, &v13);
  v11 = (void *)[objc_alloc(MEMORY[0x1E4F1C9B8]) initWithBytes:md length:32];

  return v11;
}

- (SLHighlight)initWithAttribution:(id)a3
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)SLHighlight;
  id v5 = [(SLHighlight *)&v19 init];
  id v6 = v5;
  if (v5)
  {
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)&stru_1EEC19158;

    uint64_t v8 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EEC19158];
    resourceURL = v6->_resourceURL;
    v6->_resourceURL = (NSURL *)v8;

    uint64_t v10 = [MEMORY[0x1E4F1C9C8] date];
    timestamp = v6->_timestamp;
    v6->_timestamp = (NSDate *)v10;

    v20[0] = v4;
    uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    attributions = v6->_attributions;
    v6->_attributions = (NSArray *)v12;

    supplementaryData = v6->_supplementaryData;
    v6->_supplementaryData = (NSDictionary *)MEMORY[0x1E4F1CC08];

    score = v6->_score;
    v6->_score = (NSNumber *)&unk_1EEC28058;

    uint64_t v16 = [(NSDictionary *)v6->_supplementaryData valueForKey:@"com_apple_mobilesms_resolvedURL"];
    resolvedURL = v6->_resolvedURL;
    v6->_resolvedURL = (NSURL *)v16;
  }
  return v6;
}

- (SLHighlight)initWithPortraitHighlight:(id)a3 error:(id *)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)SLHighlight;
  id v7 = [(SLHighlight *)&v49 init];
  if (!v7)
  {
LABEL_32:
    v32 = v7;
    goto LABEL_33;
  }
  if (v6)
  {
    uint64_t v8 = [v6 identifier];
    uint64_t v9 = [v8 length];

    if (v9)
    {
      uint64_t v10 = [v6 identifier];
      identifier = v7->_identifier;
      v7->_identifier = (NSString *)v10;

      uint64_t v12 = [v6 resourceURL];

      if (v12)
      {
        uint64_t v13 = [v6 resourceURL];
        resourceURL = v7->_resourceURL;
        v7->_resourceURL = (NSURL *)v13;

        uint64_t v15 = [v6 timestamp];

        if (v15)
        {
          uint64_t v16 = [v6 timestamp];
          timestamp = v7->_timestamp;
          v7->_timestamp = (NSDate *)v16;

          v18 = objc_opt_new();
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          long long v48 = 0u;
          id obj = [v6 attributionIdentifiers];
          uint64_t v19 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
          if (v19)
          {
            uint64_t v20 = v19;
            v41 = a4;
            id v21 = 0;
            uint64_t v22 = *(void *)v46;
            while (2)
            {
              uint64_t v23 = 0;
              v24 = v21;
              do
              {
                if (*(void *)v46 != v22) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v25 = *(void *)(*((void *)&v45 + 1) + 8 * v23);
                v26 = [SLAttribution alloc];
                id v44 = v24;
                v27 = [(SLAttribution *)v26 initWithIdentifier:v25 error:&v44];
                id v21 = v44;

                if (!v27)
                {
                  if (v41)
                  {
                    id v43 = v21;
                    v30 = [(id)objc_opt_class() errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:5 andUnderlyingError:&v43];
                    id v31 = v43;

                    id *v41 = v30;
                    id v21 = v31;
                  }

                  goto LABEL_27;
                }
                [v18 addObject:v27];

                ++v23;
                v24 = v21;
              }
              while (v20 != v23);
              uint64_t v20 = [obj countByEnumeratingWithState:&v45 objects:v50 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }
          else
          {
            id v21 = 0;
          }

          objc_storeStrong((id *)&v7->_attributions, v18);
          uint64_t v33 = [v6 supplementaryData];
          supplementaryData = v7->_supplementaryData;
          v7->_supplementaryData = (NSDictionary *)v33;

          uint64_t v35 = [v6 score];
          score = v7->_score;
          v7->_score = (NSNumber *)v35;

          v37 = [(NSDictionary *)v7->_supplementaryData valueForKey:@"com_apple_mobilesms_resolvedURL"];

          if (v37)
          {
            uint64_t v38 = [(NSDictionary *)v7->_supplementaryData valueForKey:@"com_apple_mobilesms_resolvedURL"];
            resolvedURL = v7->_resolvedURL;
            v7->_resolvedURL = (NSURL *)v38;
          }
          goto LABEL_32;
        }
        if (a4)
        {
          v28 = objc_opt_class();
          uint64_t v29 = 4;
          goto LABEL_26;
        }
LABEL_27:
        v32 = 0;
        goto LABEL_33;
      }
      if (!a4) {
        goto LABEL_27;
      }
      v28 = objc_opt_class();
      uint64_t v29 = 3;
    }
    else
    {
      if (!a4) {
        goto LABEL_27;
      }
      v28 = objc_opt_class();
      uint64_t v29 = 2;
    }
  }
  else
  {
    if (!a4) {
      goto LABEL_27;
    }
    v28 = objc_opt_class();
    uint64_t v29 = 1;
  }
LABEL_26:
  [v28 errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:v29 andUnderlyingError:0];
  v32 = 0;
  *a4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_33:

  return v32;
}

- (id)portraitHighlight
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  v3 = objc_opt_new();
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v4 = [(SLHighlight *)self attributions];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v18 + 1) + 8 * i) uniqueIdentifier];
        [v3 addObject:v9];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    }
    while (v6);
  }

  id v10 = objc_alloc(MEMORY[0x1E4F89F28]);
  v11 = [(SLHighlight *)self identifier];
  uint64_t v12 = [(SLHighlight *)self resourceURL];
  uint64_t v13 = [(SLHighlight *)self timestamp];
  v14 = [(SLHighlight *)self supplementaryData];
  uint64_t v15 = [(SLHighlight *)self score];
  uint64_t v16 = (void *)[v10 initWithIdentifier:v11 resourceURL:v12 timestamp:v13 attributionIdentifiers:v3 supplementaryData:v14 score:v15];

  return v16;
}

- (SLHighlight)initWithCSSearchableItem:(id)a3
{
  return [(SLHighlight *)self initWithCSSearchableItem:a3 error:0];
}

- (SLHighlight)initWithCSSearchableItem:(id)a3 error:(id *)a4
{
  v50[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v49.receiver = self;
  v49.super_class = (Class)SLHighlight;
  uint64_t v7 = [(SLHighlight *)&v49 init];
  if (!v7) {
    goto LABEL_39;
  }
  uint64_t v8 = [v6 attributeSet];
  uint64_t v9 = [v8 messageType];

  char v10 = [v9 isEqualToString:@"lnk"];
  v11 = [v6 domainIdentifier];
  char v12 = [v11 isEqualToString:@"attachmentDomain"];

  if (v12 & 1) != 0 || (v10)
  {
    v14 = [v6 attributeSet];
    uint64_t v15 = [v14 contentURL];
    if (v15 || ([v14 URL], (uint64_t v15 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v16 = v15;
      resourceURL = v7->_resourceURL;
      v7->_resourceURL = v16;

      long long v18 = [(SLHighlight *)v7 _uniqueIdentifierForResourceURL:v7->_resourceURL];
      if ([v18 length])
      {
        objc_storeStrong((id *)&v7->_identifier, v18);
        supplementaryData = v7->_supplementaryData;
        v7->_supplementaryData = (NSDictionary *)MEMORY[0x1E4F1CC08];

        id v48 = 0;
        long long v20 = [[SLAttribution alloc] initWithCSSearchableItem:v6 error:&v48];
        id v21 = v48;
        if (v20)
        {
          v50[0] = v20;
          uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v50 count:1];
          attributions = v7->_attributions;
          v7->_attributions = (NSArray *)v22;

          v24 = [v14 contentCreationDate];
          if (v24)
          {
            long long v45 = v24;
            objc_storeStrong((id *)&v7->_timestamp, v24);
            uint64_t v25 = [v14 customAttributeDictionary];
            v26 = [v25 objectForKey:@"com_apple_mobilesms_isSyndicatedContent"];

            id v44 = v26;
            v7->_syndicationType = [v26 unsignedIntegerValue];
            v27 = [v14 customAttributeDictionary];
            v28 = [v27 objectForKey:@"com_apple_mobilesms_isSyndicatableMedia"];
            v7->_isSyndicatableMedia = [v28 BOOLValue];

            uint64_t v29 = [v14 isLocal];
            v7->_isLocalResource = [v29 BOOLValue];

            v30 = [v14 contentType];
            id v31 = v30;
            id v46 = v21;
            if (v30)
            {
              v32 = v30;
              resourceUTI = v7->_resourceUTI;
              v7->_resourceUTI = v32;
            }
            else
            {
              resourceUTI = SLFrameworkLogHandle();
              if (os_log_type_enabled(resourceUTI, OS_LOG_TYPE_ERROR)) {
                -[SLHighlight initWithCSSearchableItem:error:](v6);
              }
            }

            uint64_t v38 = [v14 customAttributeDictionary];
            v39 = [v38 objectForKey:@"com_apple_mobilesms_livePhotoComplementPath"];

            if (v39)
            {
              uint64_t v40 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v39];
              livePhotoComplementURL = v7->_livePhotoComplementURL;
              v7->_livePhotoComplementURL = (NSURL *)v40;
            }
            else
            {
              livePhotoComplementURL = v7->_livePhotoComplementURL;
              v7->_livePhotoComplementURL = 0;
            }
            id v21 = v46;

            int v34 = 0;
            v24 = v45;
          }
          else
          {
            if (a4)
            {
              *a4 = [(id)objc_opt_class() errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:4 andUnderlyingError:0];
            }
            int v34 = 1;
          }
        }
        else
        {
          if (a4)
          {
            id v47 = v21;
            uint64_t v35 = [(id)objc_opt_class() errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:5 andUnderlyingError:&v47];
            id v36 = v47;
            v37 = v21;
            id v21 = v36;

            *a4 = v35;
          }
          int v34 = 1;
        }
      }
      else
      {
        if (a4)
        {
          *a4 = [(id)objc_opt_class() errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:2 andUnderlyingError:0];
        }
        int v34 = 1;
      }
    }
    else
    {
      if (a4)
      {
        *a4 = [(id)objc_opt_class() errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:3 andUnderlyingError:0];
      }
      int v34 = 1;
    }

    if (v34) {
      goto LABEL_38;
    }
LABEL_39:
    v42 = v7;
    goto LABEL_40;
  }
  uint64_t v13 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
    -[SLHighlight initWithCSSearchableItem:error:](v6);
  }

  if (a4)
  {
    *a4 = [(id)objc_opt_class() errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:6 andUnderlyingError:0];
  }

LABEL_38:
  v42 = 0;
LABEL_40:

  return v42;
}

- (SLHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 forContentType:(unsigned __int8)a4 error:(id *)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  if (v8)
  {
    uint64_t v9 = +[SLHighlight requiredSpotlightAttributeKeys];
    char v10 = [v9 allObjects];

    id v19 = 0;
    v11 = +[SLCoreSpotlightUtilities fetchCSSearchableItemForUniqueIdentifier:v8 forContentType:v6 withRequiredAttributes:v10 error:&v19];
    id v12 = v19;
    if (v11)
    {
      self = [(SLHighlight *)self initWithCSSearchableItem:v11 error:a5];
      uint64_t v13 = self;
    }
    else if (a5)
    {
      id v18 = v12;
      v14 = [(id)objc_opt_class() errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:7 andUnderlyingError:&v18];
      id v15 = v18;

      id v16 = v14;
      uint64_t v13 = 0;
      *a5 = v16;
      id v12 = v15;
    }
    else
    {
      uint64_t v13 = 0;
    }
  }
  else if (a5)
  {
    [(id)objc_opt_class() errorForHighlightDomain:@"com.apple.SocialLayer.SLHighlightErrorDomain" andCode:8 andUnderlyingError:0];
    uint64_t v13 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v13 = 0;
  }

  return v13;
}

- (SLHighlight)initWithCSSearchableItemUniqueIdentifier:(id)a3 error:(id *)a4
{
  return [(SLHighlight *)self initWithCSSearchableItemUniqueIdentifier:a3 forContentType:1 error:a4];
}

+ (id)requiredSpotlightAttributeKeys
{
  v13[19] = *MEMORY[0x1E4F143B8];
  v2 = (void *)MEMORY[0x1E4F1CAD0];
  uint64_t v3 = *MEMORY[0x1E4F22A78];
  v13[0] = *MEMORY[0x1E4F22A10];
  v13[1] = v3;
  uint64_t v4 = *MEMORY[0x1E4F22B28];
  v13[2] = *MEMORY[0x1E4F22B00];
  v13[3] = v4;
  uint64_t v5 = *MEMORY[0x1E4F22B50];
  v13[4] = *MEMORY[0x1E4F22B30];
  v13[5] = v5;
  uint64_t v6 = *MEMORY[0x1E4F22C60];
  v13[6] = *MEMORY[0x1E4F22C38];
  v13[7] = v6;
  uint64_t v7 = *MEMORY[0x1E4F22D28];
  v13[8] = *MEMORY[0x1E4F22C70];
  v13[9] = v7;
  uint64_t v8 = *MEMORY[0x1E4F231D0];
  v13[10] = *MEMORY[0x1E4F23098];
  v13[11] = v8;
  uint64_t v9 = *MEMORY[0x1E4F23670];
  v13[12] = *MEMORY[0x1E4F233E0];
  v13[13] = v9;
  v13[14] = @"com_apple_mobilesms_livePhotoComplementPath";
  v13[15] = @"com_apple_mobilesms_groupPhotoPath";
  v13[16] = @"com_apple_mobilesms_isSyndicatedContent";
  v13[17] = @"com_apple_mobilesms_isSyndicatableMedia";
  v13[18] = *MEMORY[0x1E4F235E8];
  char v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:19];
  v11 = [v2 setWithArray:v10];

  return v11;
}

- (SLHighlight)initWithDictionary:(id)a3
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v50.receiver = self;
  v50.super_class = (Class)SLHighlight;
  uint64_t v5 = [(SLHighlight *)&v50 init];
  if (!v5) {
    goto LABEL_37;
  }
  uint64_t v6 = [v4 objectForKey:@"i"];
  if ([v6 length])
  {
    objc_storeStrong((id *)&v5->_identifier, v6);
    uint64_t v7 = [v4 objectForKey:@"ru"];
    if (v7
      && ([MEMORY[0x1E4F1CB10] URLWithString:v7],
          (uint64_t v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      id v44 = v8;
      long long v45 = v7;
      objc_storeStrong((id *)&v5->_resourceURL, v8);
      uint64_t v9 = objc_opt_new();
      [v4 objectForKey:@"a"];
      long long v46 = 0u;
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v10 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v11 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
      if (v11)
      {
        uint64_t v12 = v11;
        uint64_t v13 = *(void *)v47;
        while (2)
        {
          for (uint64_t i = 0; i != v12; ++i)
          {
            if (*(void *)v47 != v13) {
              objc_enumerationMutation(v10);
            }
            id v15 = [[SLAttribution alloc] initWithDictionary:*(void *)(*((void *)&v46 + 1) + 8 * i)];
            if (!v15)
            {
              v24 = SLFrameworkLogHandle();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
                -[SLHighlight initWithDictionary:].cold.5();
              }
              int v22 = 1;
              uint64_t v25 = v10;
              id v21 = v44;
              uint64_t v7 = v45;
              goto LABEL_34;
            }
            id v16 = v15;
            [v9 addObject:v15];
          }
          uint64_t v12 = [v10 countByEnumeratingWithState:&v46 objects:v51 count:16];
          if (v12) {
            continue;
          }
          break;
        }
      }

      objc_storeStrong((id *)&v5->_attributions, v9);
      v17 = [v4 objectForKey:@"t"];
      id v18 = v17;
      if (v17)
      {
        id v19 = v17;
        p_super = &v5->_timestamp->super;
        v5->_timestamp = v19;
      }
      else
      {
        p_super = SLFrameworkLogHandle();
        if (os_log_type_enabled(p_super, OS_LOG_TYPE_ERROR)) {
          -[SLHighlight initWithDictionary:].cold.4();
        }
      }
      id v43 = v18;

      uint64_t v26 = [v4 objectForKey:@"sd"];
      supplementaryData = v5->_supplementaryData;
      v5->_supplementaryData = (NSDictionary *)v26;

      uint64_t v28 = [v4 objectForKey:@"rt"];
      resourceUTI = v5->_resourceUTI;
      v5->_resourceUTI = (NSString *)v28;

      uint64_t v30 = [v4 objectForKey:@"sc"];
      score = v5->_score;
      v5->_score = (NSNumber *)v30;

      v32 = [v4 objectForKey:@"st"];
      v5->_syndicationType = [v32 unsignedIntegerValue];

      uint64_t v33 = [v4 objectForKey:@"m"];
      v5->_isSyndicatableMedia = [v33 BOOLValue];

      int v34 = [v4 objectForKey:@"lr"];
      v5->_isLocalResource = [v34 BOOLValue];

      v24 = [v4 objectForKey:@"lp"];
      if (v24)
      {
        uint64_t v35 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v24];
        livePhotoComplementURL = v5->_livePhotoComplementURL;
        v5->_livePhotoComplementURL = (NSURL *)v35;
      }
      v37 = [v4 objectForKey:@"com_apple_mobilesms_resolvedURL"];
      uint64_t v7 = v45;
      if (v37
        && ([MEMORY[0x1E4F1CB10] fileURLWithPath:v37],
            (uint64_t v38 = (NSURL *)objc_claimAutoreleasedReturnValue()) != 0))
      {
        resolvedURL = v5->_resolvedURL;
        v5->_resolvedURL = v38;
        uint64_t v40 = v38;
      }
      else
      {
        uint64_t v40 = SLFrameworkLogHandle();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_ERROR)) {
          -[SLHighlight initWithDictionary:]();
        }
      }

      int v22 = 0;
      uint64_t v25 = v43;
      id v21 = v44;
LABEL_34:
    }
    else
    {
      id v21 = SLFrameworkLogHandle();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[SLHighlight initWithDictionary:]();
      }
      int v22 = 1;
    }

    if (v22) {
      goto LABEL_36;
    }
LABEL_37:
    v41 = v5;
    goto LABEL_38;
  }
  uint64_t v23 = SLFrameworkLogHandle();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
    -[SLHighlight initWithDictionary:]();
  }

LABEL_36:
  v41 = 0;
LABEL_38:

  return v41;
}

- (id)dictionaryRepresentation
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1CA60] dictionary];
  id v4 = [(SLHighlight *)self identifier];

  if (!v4)
  {
    v37 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[SLHighlight dictionaryRepresentation]();
    }
LABEL_35:

LABEL_36:
    id v36 = 0;
    goto LABEL_37;
  }
  uint64_t v5 = [(SLHighlight *)self identifier];
  [v3 setObject:v5 forKey:@"i"];

  uint64_t v6 = [(SLHighlight *)self resourceURL];

  if (!v6)
  {
    v37 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[SLHighlight dictionaryRepresentation]();
    }
    goto LABEL_35;
  }
  uint64_t v7 = [(SLHighlight *)self resourceURL];
  uint64_t v8 = [v7 absoluteString];
  [v3 setObject:v8 forKey:@"ru"];

  uint64_t v9 = [(SLHighlight *)self timestamp];

  if (!v9)
  {
    v37 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[SLHighlight dictionaryRepresentation]();
    }
    goto LABEL_35;
  }
  id v10 = [(SLHighlight *)self timestamp];
  [v3 setObject:v10 forKey:@"t"];

  uint64_t v11 = [(SLHighlight *)self attributions];

  if (!v11)
  {
    v37 = SLFrameworkLogHandle();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
      -[SLHighlight dictionaryRepresentation].cold.4();
    }
    goto LABEL_35;
  }
  uint64_t v12 = [MEMORY[0x1E4F1CA48] array];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  uint64_t v13 = [(SLHighlight *)self attributions];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v41;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v41 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v19 = [v18 dictionaryRepresentation];
        if (!v19)
        {
          uint64_t v38 = SLFrameworkLogHandle();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR)) {
            [(SLHighlight *)(uint64_t)v18 dictionaryRepresentation];
          }

          goto LABEL_36;
        }
        long long v20 = (void *)v19;
        [v12 addObject:v19];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v40 objects:v44 count:16];
      if (v15) {
        continue;
      }
      break;
    }
  }

  [v3 setObject:v12 forKey:@"a"];
  id v21 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SLHighlight isLocalResource](self, "isLocalResource"));
  [v3 setObject:v21 forKey:@"lr"];

  int v22 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SLHighlight syndicationType](self, "syndicationType"));
  [v3 setObject:v22 forKey:@"st"];

  uint64_t v23 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SLHighlight isSyndicatableMedia](self, "isSyndicatableMedia"));
  [v3 setObject:v23 forKey:@"m"];

  v24 = [(SLHighlight *)self score];

  if (v24)
  {
    uint64_t v25 = [(SLHighlight *)self score];
    [v3 setObject:v25 forKey:@"sc"];
  }
  uint64_t v26 = [(SLHighlight *)self supplementaryData];

  if (v26)
  {
    v27 = [(SLHighlight *)self supplementaryData];
    [v3 setObject:v27 forKey:@"sd"];
  }
  uint64_t v28 = [(SLHighlight *)self resolvedURL];

  if (v28)
  {
    uint64_t v29 = [(SLHighlight *)self resolvedURL];
    uint64_t v30 = [v29 path];
    [v3 setObject:v30 forKey:@"rs"];
  }
  id v31 = [(SLHighlight *)self resourceUTI];

  if (v31)
  {
    v32 = [(SLHighlight *)self resourceUTI];
    [v3 setObject:v32 forKey:@"rt"];
  }
  uint64_t v33 = [(SLHighlight *)self livePhotoComplementURL];

  if (v33)
  {
    int v34 = [(SLHighlight *)self livePhotoComplementURL];
    uint64_t v35 = [v34 path];
    [v3 setObject:v35 forKey:@"lp"];
  }
  id v36 = v3;
LABEL_37:

  return v36;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (SLHighlight)initWithCoder:(id)a3
{
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)SLHighlight;
  uint64_t v5 = [(SLHighlight *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"i"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"ru"];
    resourceURL = v5->_resourceURL;
    v5->_resourceURL = (NSURL *)v8;

    id v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_msgSend(v10, "setWithObjects:", v11, objc_opt_class(), 0);
    uint64_t v13 = [v4 decodeObjectOfClasses:v12 forKey:@"a"];
    attributions = v5->_attributions;
    v5->_attributions = (NSArray *)v13;

    uint64_t v15 = objc_opt_class();
    uint64_t v16 = [v4 decodeDictionaryWithKeysOfClass:v15 objectsOfClass:objc_opt_class() forKey:@"sd"];
    supplementaryData = v5->_supplementaryData;
    v5->_supplementaryData = (NSDictionary *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"sc"];
    score = v5->_score;
    v5->_score = (NSNumber *)v18;

    long long v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"st"];
    v5->_syndicationType = [v20 unsignedIntegerValue];

    uint64_t v21 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"t"];
    timestamp = v5->_timestamp;
    v5->_timestamp = (NSDate *)v21;

    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"com_apple_mobilesms_resolvedURL"];
    resolvedURL = v5->_resolvedURL;
    v5->_resolvedURL = (NSURL *)v23;

    uint64_t v25 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"m"];
    v5->_isSyndicatableMedia = [v25 BOOLValue];

    uint64_t v26 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lr"];
    v5->_isLocalResource = [v26 BOOLValue];

    uint64_t v27 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"rt"];
    resourceUTI = v5->_resourceUTI;
    v5->_resourceUTI = (NSString *)v27;

    uint64_t v29 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"lp"];
    livePhotoComplementURL = v5->_livePhotoComplementURL;
    v5->_livePhotoComplementURL = (NSURL *)v29;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(SLHighlight *)self identifier];
  [v4 encodeObject:v5 forKey:@"i"];

  uint64_t v6 = [(SLHighlight *)self resourceURL];
  [v4 encodeObject:v6 forKey:@"ru"];

  uint64_t v7 = [(SLHighlight *)self attributions];
  [v4 encodeObject:v7 forKey:@"a"];

  uint64_t v8 = [(SLHighlight *)self supplementaryData];
  [v4 encodeObject:v8 forKey:@"sd"];

  uint64_t v9 = [(SLHighlight *)self resolvedURL];
  [v4 encodeObject:v9 forKey:@"com_apple_mobilesms_resolvedURL"];

  id v10 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedInteger:", -[SLHighlight syndicationType](self, "syndicationType"));
  [v4 encodeObject:v10 forKey:@"st"];

  uint64_t v11 = [(SLHighlight *)self timestamp];
  [v4 encodeObject:v11 forKey:@"t"];

  uint64_t v12 = [(SLHighlight *)self score];
  [v4 encodeObject:v12 forKey:@"sc"];

  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SLHighlight isSyndicatableMedia](self, "isSyndicatableMedia"));
  [v4 encodeObject:v13 forKey:@"m"];

  uint64_t v14 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[SLHighlight isLocalResource](self, "isLocalResource"));
  [v4 encodeObject:v14 forKey:@"lr"];

  uint64_t v15 = [(SLHighlight *)self resourceUTI];
  [v4 encodeObject:v15 forKey:@"rt"];

  id v16 = [(SLHighlight *)self livePhotoComplementURL];
  [v4 encodeObject:v16 forKey:@"lp"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = [SLHighlight alloc];
  uint64_t v5 = [(SLHighlight *)self dictionaryRepresentation];
  uint64_t v6 = [(SLHighlight *)v4 initWithDictionary:v5];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v5 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v6 = v5;
    uint64_t v7 = [(SLHighlight *)self identifier];
    if (v7 || ([v6 identifier], (uint64_t v3 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      uint64_t v8 = [(SLHighlight *)self identifier];
      uint64_t v9 = [v6 identifier];
      int v10 = [v8 isEqualToString:v9];

      if (v7)
      {

        if (!v10) {
          goto LABEL_20;
        }
      }
      else
      {

        if ((v10 & 1) == 0) {
          goto LABEL_20;
        }
      }
    }
    uint64_t v12 = [(SLHighlight *)self resourceURL];
    if (!v12)
    {
      uint64_t v3 = [v6 resourceURL];
      if (!v3) {
        goto LABEL_15;
      }
    }
    uint64_t v13 = [(SLHighlight *)self resourceURL];
    uint64_t v14 = [v6 resourceURL];
    int v15 = [v13 isEqual:v14];

    if (v12)
    {

      if (!v15) {
        goto LABEL_20;
      }
LABEL_15:
      id v16 = [(SLHighlight *)self attributions];
      uint64_t v17 = [v16 count];
      if (v17
        || ([v6 attributions], uint64_t v3 = objc_claimAutoreleasedReturnValue(),
                                              [v3 count]))
      {
        uint64_t v18 = [(SLHighlight *)self attributions];
        uint64_t v19 = [v18 count];
        long long v20 = [v6 attributions];
        uint64_t v21 = [v20 count];

        if (!v17) {
        if (v19 != v21)
        }
          goto LABEL_20;
      }
      else
      {
      }
      uint64_t v23 = [(SLHighlight *)self attributions];
      v24 = [v6 attributions];
      char v11 = [v23 isEqualToArray:v24];

      goto LABEL_21;
    }

    if (v15) {
      goto LABEL_15;
    }
LABEL_20:
    char v11 = 0;
LABEL_21:

    goto LABEL_22;
  }
  char v11 = 0;
LABEL_22:

  return v11;
}

- (unint64_t)hash
{
  uint64_t v3 = [(SLHighlight *)self identifier];
  uint64_t v4 = [v3 hash];
  id v5 = [(SLHighlight *)self resourceURL];
  uint64_t v6 = [v5 hash] ^ v4;
  uint64_t v7 = [(SLHighlight *)self attributions];
  unint64_t v8 = v6 ^ [v7 hash];

  return v8;
}

- (id)description
{
  uint64_t v3 = NSString;
  uint64_t v4 = (objc_class *)objc_opt_class();
  id v5 = NSStringFromClass(v4);
  uint64_t v6 = [(SLHighlight *)self identifier];
  uint64_t v7 = [(SLHighlight *)self resourceURL];
  unint64_t v8 = [(SLHighlight *)self supplementaryData];
  uint64_t v9 = [v3 stringWithFormat:@"[%@: identifier: %@  resourceURL: %@ supplementaryData: %@]", v5, v6, v7, v8];

  return v9;
}

- (void)setAttributions:(id)a3
{
  id v5 = a3;
  if (v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_attributions, a3);
    id v5 = v6;
  }
}

- (id)_uniqueIdentifierForResourceURL:(id)a3
{
  uint64_t v3 = [a3 absoluteString];
  uint64_t v4 = [v3 dataUsingEncoding:4];

  id v5 = [(id)objc_opt_class() Sha256ForData:v4 withSalt:0];
  id v6 = [v5 base64EncodedStringWithOptions:0];

  return v6;
}

+ (id)errorForHighlightDomain:(id)a3 andCode:(int64_t)a4 andUnderlyingError:(id *)a5
{
  v28[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  switch(a4)
  {
    case 1:
      uint64_t v27 = *MEMORY[0x1E4F28228];
      v28[0] = @"SLHighlight Init failed. Invalid or nil PPSocialHighlight.";
      unint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = (__CFString **)v28;
      int v10 = &v27;
      goto LABEL_11;
    case 2:
      uint64_t v25 = *MEMORY[0x1E4F28228];
      uint64_t v26 = @"SLHighlight Init failed. PPSocialHighlight contains an invalid or nil identifier.";
      unint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v26;
      int v10 = &v25;
      goto LABEL_11;
    case 3:
      uint64_t v23 = *MEMORY[0x1E4F28228];
      v24 = @"SLHighlight Init failed. PPSocialHighlight contains an invalid or nil URL.";
      unint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v24;
      int v10 = &v23;
      goto LABEL_11;
    case 4:
      uint64_t v21 = *MEMORY[0x1E4F28228];
      int v22 = @"SLHighlight Init failed. PPSocialHighlight contains an invalid or nil timestamp.";
      unint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v22;
      int v10 = &v21;
      goto LABEL_11;
    case 5:
      uint64_t v19 = *MEMORY[0x1E4F28228];
      long long v20 = @"SLHighlight Init failed.  One of the attribution identifiers in PPSocialHighlight is invalid or nil.";
      unint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v20;
      int v10 = &v19;
      goto LABEL_11;
    case 6:
      uint64_t v17 = *MEMORY[0x1E4F28228];
      uint64_t v18 = @"SLHighlight Init failed. CSSearchableItem contains an invalid or nil domain identifier.";
      unint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v18;
      int v10 = &v17;
      goto LABEL_11;
    case 7:
      uint64_t v15 = *MEMORY[0x1E4F28228];
      id v16 = @"SLHighlight Init failed. Failed to fetch CSSearchableItem.";
      unint64_t v8 = (void *)MEMORY[0x1E4F1C9E8];
      uint64_t v9 = &v16;
      int v10 = &v15;
LABEL_11:
      char v11 = [v8 dictionaryWithObjects:v9 forKeys:v10 count:1];
      if (a5) {
        goto LABEL_12;
      }
      goto LABEL_13;
    default:
      char v11 = 0;
      if (!a5) {
        goto LABEL_13;
      }
LABEL_12:
      uint64_t v12 = (void *)[v11 mutableCopy];
      [v12 setObject:*a5 forKey:*MEMORY[0x1E4F28A50]];

      char v11 = v12;
LABEL_13:
      uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:v7 code:a4 userInfo:v11];

      return v13;
  }
}

- (NSString)identifier
{
  return self->_identifier;
}

- (NSURL)resourceURL
{
  return self->_resourceURL;
}

- (NSArray)attributions
{
  return self->_attributions;
}

- (NSDictionary)supplementaryData
{
  return self->_supplementaryData;
}

- (NSNumber)score
{
  return self->_score;
}

- (BOOL)isLocalResource
{
  return self->_isLocalResource;
}

- (BOOL)isSyndicatableMedia
{
  return self->_isSyndicatableMedia;
}

- (NSURL)livePhotoComplementURL
{
  return self->_livePhotoComplementURL;
}

- (NSString)resourceUTI
{
  return self->_resourceUTI;
}

- (unint64_t)syndicationType
{
  return self->_syndicationType;
}

- (NSURL)resolvedURL
{
  return self->_resolvedURL;
}

- (NSDate)timestamp
{
  return self->_timestamp;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timestamp, 0);
  objc_storeStrong((id *)&self->_resolvedURL, 0);
  objc_storeStrong((id *)&self->_resourceUTI, 0);
  objc_storeStrong((id *)&self->_livePhotoComplementURL, 0);
  objc_storeStrong((id *)&self->_score, 0);
  objc_storeStrong((id *)&self->_supplementaryData, 0);
  objc_storeStrong((id *)&self->_attributions, 0);
  objc_storeStrong((id *)&self->_resourceURL, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (void)initWithCSSearchableItem:(void *)a1 error:.cold.1(void *a1)
{
  v1 = [a1 uniqueIdentifier];
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "WARNING: Item with unique identifier %@ had a nil UTI.", v4, v5, v6, v7, 2u);
}

- (void)initWithCSSearchableItem:(void *)a1 error:.cold.2(void *a1)
{
  v1 = [a1 domainIdentifier];
  OUTLINED_FUNCTION_2_1(&dword_19BE17000, v2, v3, "Attempted to initialize SLH using a CSSearchableItem outside the attachment/links domain. Failing initialization from CSSearchableItem. domain: %@", v4, v5, v6, v7, 2u);
}

- (void)initWithDictionary:.cold.1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLH dictionary identifier was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.2()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLH dictionary resourceURL was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.3()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLH dictionary resolvedURL was nil.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.4()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLH dictionary timestamp was nil.", v2, v3, v4, v5, v6);
}

- (void)initWithDictionary:.cold.5()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_2(&dword_19BE17000, v0, v1, "SLH dictionary attribution was nil. Failing initialization from dictionary.", v2, v3, v4, v5, v6);
}

- (void)dictionaryRepresentation
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_19BE17000, a2, OS_LOG_TYPE_ERROR, "SLH an SLA failed dictionary serialization. Failing dictionary serialization for the SLH as well. Offending SLA: %@", (uint8_t *)&v2, 0xCu);
}

@end