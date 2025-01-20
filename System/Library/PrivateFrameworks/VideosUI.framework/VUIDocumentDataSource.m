@interface VUIDocumentDataSource
+ (BOOL)isCanonicalDocumentRef:(id)a3;
+ (id)documentDataSourceWithDictionary:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)shouldLoadPageImmediately;
- (BOOL)shouldUseZoomTransition;
- (NSArray)universalLinks;
- (NSString)controllerRef;
- (NSString)documentRef;
- (NSString)documentType;
- (NSString)identifier;
- (NSString)marketingTabIdentifier;
- (NSString)title;
- (VUIDocumentContextData)contextData;
- (VUIDocumentDataSource)initWithDataSourceDict:(id)a3;
- (VUIDocumentDataSource)initWithDocumentRef:(id)a3;
- (VUIDocumentPreFetchedData)prefetchData;
- (VUIDocumentUIConfiguration)uiConfiguration;
- (id)debugDescription;
- (id)jsonData;
- (void)setContextData:(id)a3;
- (void)setControllerRef:(id)a3;
- (void)setDocumentRef:(id)a3;
- (void)setDocumentType:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setMarketingTabIdentifier:(id)a3;
- (void)setPrefetchData:(id)a3;
- (void)setShouldLoadPageImmediately:(BOOL)a3;
- (void)setShouldUseZoomTransition:(BOOL)a3;
- (void)setTitle:(id)a3;
- (void)setUiConfiguration:(id)a3;
- (void)setUniversalLinks:(id)a3;
@end

@implementation VUIDocumentDataSource

- (VUIDocumentUIConfiguration)uiConfiguration
{
  return self->_uiConfiguration;
}

- (NSString)controllerRef
{
  return self->_controllerRef;
}

- (NSString)documentRef
{
  return self->_documentRef;
}

- (NSString)documentType
{
  return self->_documentType;
}

- (VUIDocumentContextData)contextData
{
  return self->_contextData;
}

- (VUIDocumentPreFetchedData)prefetchData
{
  return self->_prefetchData;
}

- (BOOL)shouldUseZoomTransition
{
  return self->_shouldUseZoomTransition;
}

- (BOOL)shouldLoadPageImmediately
{
  return self->_shouldLoadPageImmediately;
}

- (void)setContextData:(id)a3
{
}

- (void)setUiConfiguration:(id)a3
{
}

- (void)setShouldLoadPageImmediately:(BOOL)a3
{
  self->_shouldLoadPageImmediately = a3;
}

- (VUIDocumentDataSource)initWithDocumentRef:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)VUIDocumentDataSource;
  v5 = [(VUIDocumentDataSource *)&v8 init];
  v6 = v5;
  if (v5) {
    [(VUIDocumentDataSource *)v5 setDocumentRef:v4];
  }

  return v6;
}

- (void)setDocumentRef:(id)a3
{
}

- (void)setTitle:(id)a3
{
}

- (void)setDocumentType:(id)a3
{
}

- (void)setControllerRef:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_marketingTabIdentifier, 0);
  objc_storeStrong((id *)&self->_universalLinks, 0);
  objc_storeStrong((id *)&self->_uiConfiguration, 0);
  objc_storeStrong((id *)&self->_prefetchData, 0);
  objc_storeStrong((id *)&self->_contextData, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_controllerRef, 0);
  objc_storeStrong((id *)&self->_documentType, 0);
  objc_storeStrong((id *)&self->_documentRef, 0);
}

+ (id)documentDataSourceWithDictionary:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(v3, "vui_stringForKey:", @"documentRef");
  v5 = objc_msgSend(v3, "vui_dictionaryForKey:", @"uiConfiguration");
  if ([v4 length])
  {
    v6 = [[VUIDocumentDataSource alloc] initWithDataSourceDict:v3];
    [(VUIDocumentDataSource *)v6 setDocumentRef:v4];
  }
  else if ([v5 count])
  {
    v6 = [[VUIDocumentDataSource alloc] initWithDataSourceDict:v3];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (BOOL)isCanonicalDocumentRef:(id)a3
{
  id v3 = a3;
  BOOL v4 = ([v3 isEqualToString:@"TVShowCanonical"] & 1) != 0
    || ([v3 isEqualToString:@"MovieCanonical"] & 1) != 0
    || ([v3 isEqualToString:@"EpisodeCanonical"] & 1) != 0
    || [v3 isEqualToString:@"SportsCanonical"];

  return v4;
}

- (VUIDocumentDataSource)initWithDataSourceDict:(id)a3
{
  id v4 = a3;
  v30.receiver = self;
  v30.super_class = (Class)VUIDocumentDataSource;
  v5 = [(VUIDocumentDataSource *)&v30 init];
  v6 = v5;
  if (v5)
  {
    v5->_shouldLoadPageImmediately = 1;
    v7 = objc_msgSend(v4, "vui_stringForKey:", @"documentType");
    if ([v7 length]) {
      objc_super v8 = v7;
    }
    else {
      objc_super v8 = 0;
    }
    objc_storeStrong((id *)&v6->_documentType, v8);
    v9 = objc_msgSend(v4, "vui_stringForKey:", @"controllerRef");
    if ([v9 length]) {
      v10 = v9;
    }
    else {
      v10 = 0;
    }
    objc_storeStrong((id *)&v6->_controllerRef, v10);
    v11 = objc_msgSend(v4, "vui_stringForKey:", @"title");
    if ([v11 length]) {
      v12 = v11;
    }
    else {
      v12 = 0;
    }
    objc_storeStrong((id *)&v6->_title, v12);
    v13 = objc_msgSend(v4, "vui_dictionaryForKey:", @"contextData");
    if ([v13 count])
    {
      v14 = [[VUIDocumentContextData alloc] initWithDictionary:v13];
      contextData = v6->_contextData;
      v6->_contextData = v14;
    }
    else
    {
      contextData = v6->_contextData;
      v6->_contextData = 0;
    }

    v16 = objc_msgSend(v4, "vui_dictionaryForKey:", @"prefetchedData");
    if ([v16 count])
    {
      v17 = [[VUIDocumentPreFetchedData alloc] initWithDictionary:v16];
      prefetchData = v6->_prefetchData;
      v6->_prefetchData = v17;
    }
    else
    {
      prefetchData = v6->_prefetchData;
      v6->_prefetchData = 0;
    }

    v19 = objc_msgSend(v4, "vui_dictionaryForKey:", @"uiConfiguration");
    uint64_t v20 = +[VUIDocumentUIConfiguration uiConfigurationWithDict:v19];
    uiConfiguration = v6->_uiConfiguration;
    v6->_uiConfiguration = (VUIDocumentUIConfiguration *)v20;

    v22 = objc_msgSend(v4, "vui_arrayForKey:", @"universalLinks");
    uint64_t v23 = objc_msgSend(v22, "vui_arrayByMappingObjectsUsingBlock:", &__block_literal_global_22);
    universalLinks = v6->_universalLinks;
    v6->_universalLinks = (NSArray *)v23;

    uint64_t v25 = objc_msgSend(v4, "vui_stringForKey:", @"identifier");
    identifier = v6->_identifier;
    v6->_identifier = (NSString *)v25;

    v27 = objc_msgSend(v4, "vui_stringForKey:", @"marketingIdentifier");
    if ([v27 length]) {
      v28 = v27;
    }
    else {
      v28 = 0;
    }
    objc_storeStrong((id *)&v6->_marketingTabIdentifier, v28);
  }
  return v6;
}

uint64_t __48__VUIDocumentDataSource_initWithDataSourceDict___block_invoke(uint64_t a1, uint64_t a2)
{
  return [MEMORY[0x1E4F1CB10] URLWithString:a2];
}

- (id)jsonData
{
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  [v3 setValue:self->_documentRef forKey:@"documentRef"];
  id v4 = [(VUIDocumentContextData *)self->_contextData jsonData];
  [v3 setValue:v4 forKey:@"contextData"];

  v5 = [(VUIDocumentPreFetchedData *)self->_prefetchData jsonData];
  [v3 setValue:v5 forKey:@"prefetchedData"];

  [v3 setValue:self->_title forKey:@"title"];
  [v3 setValue:self->_uiConfiguration forKey:@"uiConfiguration"];
  v6 = [(NSArray *)self->_universalLinks vui_arrayByMappingObjectsUsingBlock:&__block_literal_global_198];
  [v3 setValue:v6 forKey:@"universalLinks"];
  [v3 setValue:self->_marketingTabIdentifier forKey:@"marketingIdentifier"];
  v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithDictionary:v3];

  return v7;
}

uint64_t __33__VUIDocumentDataSource_jsonData__block_invoke(uint64_t a1, void *a2)
{
  return [a2 absoluteString];
}

- (id)debugDescription
{
  id v3 = [(VUIDocumentDataSource *)self uiConfiguration];
  id v4 = NSString;
  v5 = [(VUIDocumentDataSource *)self documentRef];
  v6 = [v4 stringWithFormat:@"DocumentRef: %@ uiConfiguration %@ action type %ld", v5, v3, objc_msgSend(v3, "type")];

  return v6;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (VUIDocumentDataSource *)a3;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      v5 = v4;
      v6 = [(VUIDocumentDataSource *)self documentType];
      v7 = [(VUIDocumentDataSource *)v5 documentType];
      if (v6 == v7)
      {
        v10 = [(VUIDocumentDataSource *)self controllerRef];
        v11 = [(VUIDocumentDataSource *)v5 controllerRef];
        if (v10 == v11)
        {
          v12 = [(VUIDocumentDataSource *)self title];
          v13 = [(VUIDocumentDataSource *)v5 title];
          if (v12 == v13)
          {
            uint64_t v14 = [(VUIDocumentDataSource *)self identifier];
            v15 = [(VUIDocumentDataSource *)v5 identifier];
            v35 = (void *)v14;
            if ((void *)v14 == v15)
            {
              id v34 = v15;
              uint64_t v16 = [(VUIDocumentDataSource *)self universalLinks];
              v17 = [(VUIDocumentDataSource *)v5 universalLinks];
              v33 = (void *)v16;
              if ((void *)v16 == v17)
              {
                id v32 = v17;
                v31 = [(VUIDocumentDataSource *)self marketingTabIdentifier];
                v18 = [(VUIDocumentDataSource *)v5 marketingTabIdentifier];
                BOOL v8 = v31 == v18;

                v17 = v32;
              }
              else
              {
                BOOL v8 = 0;
              }

              v15 = v34;
            }
            else
            {
              BOOL v8 = 0;
            }
          }
          else
          {
            BOOL v8 = 0;
          }
        }
        else
        {
          BOOL v8 = 0;
        }
      }
      else
      {
        BOOL v8 = 0;
      }

      v19 = [(VUIDocumentDataSource *)self contextData];

      if (v19) {
        int v20 = 0;
      }
      else {
        int v20 = v8;
      }
      if (v19 && v8)
      {
        v21 = [(VUIDocumentDataSource *)self contextData];
        v22 = [(VUIDocumentDataSource *)v5 contextData];
        int v20 = [v21 isEqual:v22];
      }
      uint64_t v23 = [(VUIDocumentDataSource *)self prefetchData];

      if (v23) {
        int v24 = 0;
      }
      else {
        int v24 = v20;
      }
      if (v23 && v20)
      {
        uint64_t v25 = [(VUIDocumentDataSource *)self prefetchData];
        v26 = [(VUIDocumentDataSource *)v5 prefetchData];
        int v24 = [v25 isEqual:v26];
      }
      v27 = [(VUIDocumentDataSource *)self uiConfiguration];

      if (v27) {
        char v9 = 0;
      }
      else {
        char v9 = v24;
      }
      if (v27 && v24)
      {
        v28 = [(VUIDocumentDataSource *)self uiConfiguration];
        v29 = [(VUIDocumentDataSource *)v5 uiConfiguration];
        char v9 = [v28 isEqual:v29];
      }
    }
    else
    {
      char v9 = 0;
    }
  }

  return v9;
}

- (NSString)title
{
  return self->_title;
}

- (void)setPrefetchData:(id)a3
{
}

- (NSArray)universalLinks
{
  return self->_universalLinks;
}

- (void)setUniversalLinks:(id)a3
{
}

- (NSString)marketingTabIdentifier
{
  return self->_marketingTabIdentifier;
}

- (void)setMarketingTabIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (void)setShouldUseZoomTransition:(BOOL)a3
{
  self->_shouldUseZoomTransition = a3;
}

@end