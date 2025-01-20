@interface REElement
+ (id)_supportedDictionaryEncodingKeys;
- (BOOL)_relevanceProvidersEqualToElement:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)isNoContentElement;
- (NSArray)relevanceProviders;
- (NSString)applicationBundleIdentifier;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (NSString)namespacedIdentifier;
- (REContent)content;
- (REContent)idealizedContent;
- (REElement)initWithCoder:(id)a3;
- (REElement)initWithDictionary:(id)a3 relevanceProviderGenerator:(id)a4;
- (REElement)initWithIdentifier:(id)a3 content:(id)a4 action:(id)a5 relevanceProviders:(id)a6;
- (REElement)initWithIdentifier:(id)a3 content:(id)a4 action:(id)a5 relevanceProviders:(id)a6 privacyBehavior:(unint64_t)a7;
- (REElement)initWithIdentifier:(id)a3 content:(id)a4 idealizedContent:(id)a5 action:(id)a6 relevanceProviders:(id)a7;
- (REElement)initWithIdentifier:(id)a3 content:(id)a4 idealizedContent:(id)a5 action:(id)a6 relevanceProviders:(id)a7 privacyBehavior:(unint64_t)a8;
- (REElementAction)action;
- (id)copyElementWithUpdatedRelevanceProviders:(id)a3;
- (id)copyWithZone:(_NSZone *)a3;
- (id)dictionaryEncodingWithRelevanceProviderGenerator:(id)a3;
- (id)shallowCopy;
- (unint64_t)hash;
- (unint64_t)privacyBehavior;
- (void)_updateIdentifier:(id)a3;
- (void)_updateNamespacedIdentifier:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)finalizeContent;
- (void)setApplicationBundleIdentifier:(id)a3;
- (void)setBundleIdentifier:(id)a3;
@end

@implementation REElement

- (REElement)initWithIdentifier:(id)a3 content:(id)a4 idealizedContent:(id)a5 action:(id)a6 relevanceProviders:(id)a7
{
  return [(REElement *)self initWithIdentifier:a3 content:a4 idealizedContent:a5 action:a6 relevanceProviders:a7 privacyBehavior:1];
}

- (REElement)initWithIdentifier:(id)a3 content:(id)a4 action:(id)a5 relevanceProviders:(id)a6
{
  return [(REElement *)self initWithIdentifier:a3 content:a4 idealizedContent:0 action:a5 relevanceProviders:a6 privacyBehavior:1];
}

- (REElement)initWithIdentifier:(id)a3 content:(id)a4 action:(id)a5 relevanceProviders:(id)a6 privacyBehavior:(unint64_t)a7
{
  return [(REElement *)self initWithIdentifier:a3 content:a4 idealizedContent:0 action:a5 relevanceProviders:a6 privacyBehavior:a7];
}

- (REElement)initWithIdentifier:(id)a3 content:(id)a4 idealizedContent:(id)a5 action:(id)a6 relevanceProviders:(id)a7 privacyBehavior:(unint64_t)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  v31.receiver = self;
  v31.super_class = (Class)REElement;
  v19 = [(REElement *)&v31 init];
  if (v19)
  {
    uint64_t v20 = [v14 copy];
    identifier = v19->_identifier;
    v19->_identifier = (NSString *)v20;

    uint64_t v22 = [v15 copy];
    content = v19->_content;
    v19->_content = (REContent *)v22;

    uint64_t v24 = [v16 copy];
    idealizedContent = v19->_idealizedContent;
    v19->_idealizedContent = (REContent *)v24;

    objc_storeStrong((id *)&v19->_action, a6);
    id v26 = objc_alloc(MEMORY[0x263EFF8C0]);
    if (v18) {
      id v27 = v18;
    }
    else {
      id v27 = (id)MEMORY[0x263EFFA68];
    }
    uint64_t v28 = [v26 initWithArray:v27 copyItems:0];
    relevanceProviders = v19->_relevanceProviders;
    v19->_relevanceProviders = (NSArray *)v28;

    v19->_privacyBehavior = a8;
  }

  return v19;
}

+ (id)_supportedDictionaryEncodingKeys
{
  if (_supportedDictionaryEncodingKeys_onceToken != -1) {
    dispatch_once(&_supportedDictionaryEncodingKeys_onceToken, &__block_literal_global_64);
  }
  v2 = (void *)_supportedDictionaryEncodingKeys_EncodingKeys;
  return v2;
}

uint64_t __45__REElement__supportedDictionaryEncodingKeys__block_invoke()
{
  uint64_t v0 = [MEMORY[0x263EFFA08] setWithArray:&unk_26CFCD770];
  uint64_t v1 = _supportedDictionaryEncodingKeys_EncodingKeys;
  _supportedDictionaryEncodingKeys_EncodingKeys = v0;
  return MEMORY[0x270F9A758](v0, v1);
}

- (REElement)initWithDictionary:(id)a3 relevanceProviderGenerator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = [v6 objectForKeyedSubscript:@"bundle_id"];
  v9 = [v6 objectForKeyedSubscript:@"id"];
  uint64_t v10 = [v6 objectForKeyedSubscript:@"interaction"];
  v11 = (void *)v10;
  v12 = @"REElementInteractionDefault";
  if (v10) {
    v12 = (__CFString *)v10;
  }
  v13 = v12;

  id v14 = [v6 objectForKeyedSubscript:@"app_bundle_id"];
  id v15 = [v6 objectForKeyedSubscript:@"namespaced_identifier"];
  if (v9)
  {
    id obj = v8;
    id v16 = objc_alloc_init(REContent);
    id v17 = [v6 objectForKeyedSubscript:@"title"];

    if (v17)
    {
      id v18 = objc_alloc(MEMORY[0x263F086A0]);
      v19 = [v6 objectForKeyedSubscript:@"title"];
      uint64_t v20 = (void *)[v18 initWithString:v19];
      [(REContent *)v16 setHeaderText:v20];
    }
    v21 = objc_msgSend(v6, "objectForKeyedSubscript:", @"description1", v7);

    if (v21)
    {
      id v22 = objc_alloc(MEMORY[0x263F086A0]);
      v23 = [v6 objectForKeyedSubscript:@"description1"];
      uint64_t v24 = (void *)[v22 initWithString:v23];
      [(REContent *)v16 setDescription1Text:v24];
    }
    v25 = [v6 objectForKeyedSubscript:@"description2"];

    if (v25)
    {
      id v26 = objc_alloc(MEMORY[0x263F086A0]);
      id v27 = [v6 objectForKeyedSubscript:@"description2"];
      uint64_t v28 = (void *)[v26 initWithString:v27];
      [(REContent *)v16 setDescription2Text:v28];
    }
    v29 = [v6 objectForKeyedSubscript:@"description3"];

    if (v29)
    {
      id v30 = objc_alloc(MEMORY[0x263F086A0]);
      objc_super v31 = [v6 objectForKeyedSubscript:@"description3"];
      v32 = (void *)[v30 initWithString:v31];
      [(REContent *)v16 setDescription3Text:v32];
    }
    [(REContent *)v16 setObject:v13 forKey:@"REContentInteractionKey"];
    v33 = [MEMORY[0x263EFF980] array];
    v41[0] = MEMORY[0x263EF8330];
    v41[1] = 3221225472;
    v41[2] = __59__REElement_initWithDictionary_relevanceProviderGenerator___block_invoke;
    v41[3] = &unk_2644BFDF8;
    id v7 = v39;
    id v42 = v39;
    id v34 = v33;
    id v43 = v34;
    [v6 enumerateKeysAndObjectsUsingBlock:v41];
    v35 = [(REElement *)self initWithIdentifier:v9 content:v16 action:0 relevanceProviders:v34];
    p_isa = (id *)&v35->super.isa;
    v8 = obj;
    if (v35)
    {
      objc_storeStrong((id *)&v35->_bundleIdentifier, obj);
      objc_storeStrong(p_isa + 9, v14);
      objc_storeStrong(p_isa + 8, v15);
    }
    self = p_isa;

    v37 = self;
  }
  else
  {
    v37 = 0;
  }

  return v37;
}

void __59__REElement_initWithDictionary_relevanceProviderGenerator___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() _supportedDictionaryEncodingKeys];
  char v8 = [v7 containsObject:v5];

  if ((v8 & 1) == 0)
  {
    v9 = [*(id *)(a1 + 32) createRelevaneProviderWithType:v5 withOptions:v6];
    if (v9)
    {
      [*(id *)(a1 + 40) addObject:v9];
    }
    else
    {
      uint64_t v10 = RELogForDomain(0);
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        __59__REElement_initWithDictionary_relevanceProviderGenerator___block_invoke_cold_1((uint64_t)v5, v10);
      }
    }
  }
}

- (id)dictionaryEncodingWithRelevanceProviderGenerator:(id)a3
{
  v37[2] = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = [MEMORY[0x263EFF9A0] dictionary];
  v32[0] = MEMORY[0x263EF8330];
  v32[1] = 3221225472;
  v32[2] = __62__REElement_dictionaryEncodingWithRelevanceProviderGenerator___block_invoke;
  v32[3] = &unk_2644BFE20;
  v32[4] = self;
  id v6 = (void (**)(void, void))MEMORY[0x223C31700](v32);
  v37[0] = @"REContentHeaderTextKey";
  v37[1] = @"REContentCLKHeaderTextKey";
  id v7 = [MEMORY[0x263EFF8C0] arrayWithObjects:v37 count:2];
  char v8 = ((void (**)(void, void *))v6)[2](v6, v7);
  [v5 setObject:v8 forKeyedSubscript:@"title"];

  v36[0] = @"REContentDescription1TextKey";
  v36[1] = @"REContentCLKDescription1TextKey";
  v9 = [MEMORY[0x263EFF8C0] arrayWithObjects:v36 count:2];
  uint64_t v10 = ((void (**)(void, void *))v6)[2](v6, v9);
  [v5 setObject:v10 forKeyedSubscript:@"description1"];

  v35[0] = @"REContentDescription2TextKey";
  v35[1] = @"REContentCLKDescription2TextKey";
  v11 = [MEMORY[0x263EFF8C0] arrayWithObjects:v35 count:2];
  v12 = ((void (**)(void, void *))v6)[2](v6, v11);
  [v5 setObject:v12 forKeyedSubscript:@"description2"];

  v34[0] = @"REContentDescription3TextKey";
  v34[1] = @"REContentCLKDescription3TextKey";
  v13 = [MEMORY[0x263EFF8C0] arrayWithObjects:v34 count:2];
  id v14 = ((void (**)(void, void *))v6)[2](v6, v13);
  [v5 setObject:v14 forKeyedSubscript:@"description3"];

  id v15 = [(REElement *)self bundleIdentifier];
  [v5 setObject:v15 forKeyedSubscript:@"bundle_id"];

  [v5 setObject:self->_identifier forKeyedSubscript:@"id"];
  id v16 = [(REElement *)self content];
  uint64_t v17 = [v16 objectForKey:@"REContentInteractionKey"];
  id v18 = (void *)v17;
  if (v17) {
    v19 = (__CFString *)v17;
  }
  else {
    v19 = @"REElementInteractionDefault";
  }
  [v5 setObject:v19 forKeyedSubscript:@"interaction"];

  [v5 setObject:self->_applicationBundleIdentifier forKeyedSubscript:@"app_bundle_id"];
  [v5 setObject:self->_namespacedIdentifier forKeyedSubscript:@"namespaced_identifier"];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v20 = self->_relevanceProviders;
  uint64_t v21 = [(NSArray *)v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
  if (v21)
  {
    uint64_t v22 = v21;
    uint64_t v23 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v23) {
          objc_enumerationMutation(v20);
        }
        v25 = objc_msgSend(v4, "encodeRelevaneProvider:", *(void *)(*((void *)&v28 + 1) + 8 * i), (void)v28);
        if (v25) {
          [v5 addEntriesFromDictionary:v25];
        }
      }
      uint64_t v22 = [(NSArray *)v20 countByEnumeratingWithState:&v28 objects:v33 count:16];
    }
    while (v22);
  }

  id v26 = (void *)[v5 copy];
  return v26;
}

id __62__REElement_dictionaryEncodingWithRelevanceProviderGenerator___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = a2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        v9 = objc_msgSend(*(id *)(a1 + 32), "content", (void)v13);
        uint64_t v10 = [v9 objectForKey:v8];

        if (objc_opt_respondsToSelector())
        {
          v11 = [v10 contentEncodedString];
          if ([v11 length])
          {

            goto LABEL_13;
          }
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  v11 = 0;
LABEL_13:

  return v11;
}

- (void)finalizeContent
{
  id v3 = [(REContent *)self->_content headerTextProvider];
  [v3 finalize];

  uint64_t v4 = [(REContent *)self->_content description1TextProvider];
  [v4 finalize];

  uint64_t v5 = [(REContent *)self->_content description2TextProvider];
  [v5 finalize];

  id v6 = [(REContent *)self->_content description3TextProvider];
  [v6 finalize];
}

- (id)copyElementWithUpdatedRelevanceProviders:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(REElement *)self shallowCopy];
  uint64_t v6 = [v4 copy];

  id v7 = (void *)v5[5];
  v5[5] = v6;

  return v5;
}

- (REElement)initWithCoder:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 decodeObjectForKey:@"_identifier"];
  uint64_t v6 = [v4 decodeObjectForKey:@"_content"];
  id v7 = [v4 decodeObjectForKey:@"_idealizedContent"];
  uint64_t v8 = [v4 decodeObjectForKey:@"_action"];
  v9 = [v4 decodeObjectForKey:@"_relevanceProviders"];
  uint64_t v10 = -[REElement initWithIdentifier:content:idealizedContent:action:relevanceProviders:privacyBehavior:](self, "initWithIdentifier:content:idealizedContent:action:relevanceProviders:privacyBehavior:", v5, v6, v7, v8, v9, [v4 decodeIntegerForKey:@"_privacyBehavior"]);
  if (v10)
  {
    uint64_t v11 = [v4 decodeObjectForKey:@"_bundleIdentifier"];
    bundleIdentifier = v10->_bundleIdentifier;
    v10->_bundleIdentifier = (NSString *)v11;

    uint64_t v13 = [v4 decodeObjectForKey:@"_applicationBundleIdentifier"];
    applicationBundleIdentifier = v10->_applicationBundleIdentifier;
    v10->_applicationBundleIdentifier = (NSString *)v13;

    uint64_t v15 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_namespacedIdentifier"];
    namespacedIdentifier = v10->_namespacedIdentifier;
    v10->_namespacedIdentifier = (NSString *)v15;
  }
  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  identifier = self->_identifier;
  id v6 = a3;
  [v6 encodeObject:identifier forKey:@"_identifier"];
  uint64_t v5 = [(REElement *)self bundleIdentifier];
  [v6 encodeObject:v5 forKey:@"_bundleIdentifier"];

  [v6 encodeInteger:self->_privacyBehavior forKey:@"_privacyBehavior"];
  [v6 encodeObject:self->_content forKey:@"_content"];
  [v6 encodeObject:self->_idealizedContent forKey:@"_idealizedContent"];
  [v6 encodeObject:self->_action forKey:@"_action"];
  [v6 encodeObject:self->_applicationBundleIdentifier forKey:@"_applicationBundleIdentifier"];
  [v6 encodeObject:self->_namespacedIdentifier forKey:@"_namespacedIdentifier"];
}

- (id)copyWithZone:(_NSZone *)a3
{
  uint64_t v4 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  objc_storeStrong((id *)(v4 + 8), self->_identifier);
  *(void *)(v4 + 16) = self->_privacyBehavior;
  objc_storeStrong((id *)(v4 + 24), self->_content);
  objc_storeStrong((id *)(v4 + 32), self->_idealizedContent);
  objc_storeStrong((id *)(v4 + 48), self->_action);
  uint64_t v5 = [objc_alloc(MEMORY[0x263EFF8C0]) initWithArray:self->_relevanceProviders copyItems:1];
  id v6 = *(void **)(v4 + 40);
  *(void *)(v4 + 40) = v5;

  objc_storeStrong((id *)(v4 + 56), self->_bundleIdentifier);
  objc_storeStrong((id *)(v4 + 72), self->_applicationBundleIdentifier);
  objc_storeStrong((id *)(v4 + 64), self->_namespacedIdentifier);
  return (id)v4;
}

- (id)shallowCopy
{
  id v3 = (id *)objc_alloc_init((Class)objc_opt_class());
  objc_storeStrong(v3 + 1, self->_identifier);
  v3[2] = self->_privacyBehavior;
  objc_storeStrong(v3 + 3, self->_content);
  objc_storeStrong(v3 + 4, self->_idealizedContent);
  objc_storeStrong(v3 + 6, self->_action);
  objc_storeStrong(v3 + 5, self->_relevanceProviders);
  objc_storeStrong(v3 + 7, self->_bundleIdentifier);
  objc_storeStrong(v3 + 9, self->_applicationBundleIdentifier);
  objc_storeStrong(v3 + 8, self->_namespacedIdentifier);
  return v3;
}

- (BOOL)isNoContentElement
{
  uint64_t v12 = *MEMORY[0x263EF8340];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_relevanceProviders;
  uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_updateIdentifier:(id)a3
{
}

- (void)_updateNamespacedIdentifier:(id)a3
{
}

- (unint64_t)hash
{
  unint64_t v3 = self->_privacyBehavior ^ [(NSString *)self->_identifier hash];
  unint64_t v4 = [(REContent *)self->_content hash];
  unint64_t v5 = v3 ^ v4 ^ [(REContent *)self->_idealizedContent hash];
  uint64_t v6 = [(REElementAction *)self->_action hash];
  uint64_t v7 = v6 ^ [(NSArray *)self->_relevanceProviders hash];
  return v5 ^ v7 ^ [(NSString *)self->_applicationBundleIdentifier hash];
}

- (BOOL)_relevanceProvidersEqualToElement:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  unint64_t v4 = [a3 relevanceProviders];
  NSUInteger v5 = [(NSArray *)self->_relevanceProviders count];
  if (v5 == [v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v6 = self->_relevanceProviders;
    uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!objc_msgSend(v4, "containsObject:", *(void *)(*((void *)&v13 + 1) + 8 * i), (void)v13))
          {
            BOOL v11 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 1;
LABEL_13:
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)isEqual:(id)a3
{
  unint64_t v4 = (REElement *)a3;
  if (v4 == self)
  {
    char v11 = 1;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      NSUInteger v5 = v4;
      identifier = self->_identifier;
      uint64_t v7 = v5->_identifier;
      if (identifier == v7)
      {
      }
      else
      {
        uint64_t v8 = v7;
        uint64_t v9 = identifier;
        int v10 = [(NSString *)v9 isEqual:v8];

        if (!v10) {
          goto LABEL_25;
        }
      }
      if (self->_privacyBehavior == v5->_privacyBehavior)
      {
        content = self->_content;
        long long v13 = v5->_content;
        if (content == v13)
        {
        }
        else
        {
          long long v14 = v13;
          long long v15 = content;
          BOOL v16 = [(REContent *)v15 isEqual:v14];

          if (!v16) {
            goto LABEL_25;
          }
        }
        idealizedContent = self->_idealizedContent;
        uint64_t v18 = v5->_idealizedContent;
        if (idealizedContent == v18)
        {
        }
        else
        {
          v19 = v18;
          uint64_t v20 = idealizedContent;
          BOOL v21 = [(REContent *)v20 isEqual:v19];

          if (!v21) {
            goto LABEL_25;
          }
        }
        action = self->_action;
        uint64_t v23 = v5->_action;
        if (action == v23)
        {
        }
        else
        {
          uint64_t v24 = v23;
          v25 = action;
          int v26 = [(REElementAction *)v25 isEqual:v24];

          if (!v26) {
            goto LABEL_25;
          }
        }
        if ([(REElement *)self _relevanceProvidersEqualToElement:v5])
        {
          applicationBundleIdentifier = self->_applicationBundleIdentifier;
          long long v28 = v5->_applicationBundleIdentifier;
          long long v29 = applicationBundleIdentifier;
          long long v30 = v29;
          if (v29 == v28) {
            char v11 = 1;
          }
          else {
            char v11 = [(NSString *)v29 isEqual:v28];
          }

          goto LABEL_26;
        }
      }
LABEL_25:
      char v11 = 0;
LABEL_26:

      goto LABEL_27;
    }
    char v11 = 0;
  }
LABEL_27:

  return v11;
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)privacyBehavior
{
  return self->_privacyBehavior;
}

- (REContent)content
{
  return self->_content;
}

- (REContent)idealizedContent
{
  return self->_idealizedContent;
}

- (NSArray)relevanceProviders
{
  return self->_relevanceProviders;
}

- (REElementAction)action
{
  return self->_action;
}

- (NSString)bundleIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 56, 1);
}

- (void)setBundleIdentifier:(id)a3
{
}

- (NSString)namespacedIdentifier
{
  return self->_namespacedIdentifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (void)setApplicationBundleIdentifier:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_namespacedIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_relevanceProviders, 0);
  objc_storeStrong((id *)&self->_idealizedContent, 0);
  objc_storeStrong((id *)&self->_content, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

void __59__REElement_initWithDictionary_relevanceProviderGenerator___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_21E6E6000, a2, OS_LOG_TYPE_ERROR, "Unable to create relevance provider with type: %@", (uint8_t *)&v2, 0xCu);
}

@end