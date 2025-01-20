@interface REPredictionElement
+ (BOOL)supportsSecureCoding;
+ (id)predictionElementFromElement:(id)a3;
+ (id)predictionElementWithIdentifier:(id)a3 relevanceProviders:(id)a4 bundleIdentifier:(id)a5;
- (NSArray)relevanceProviders;
- (NSString)applicationBundleIdentifier;
- (NSString)bundleIdentifier;
- (NSString)identifier;
- (NSString)interaction;
- (NSString)section;
- (REPredictionElement)initWithCoder:(id)a3;
- (unint64_t)privacyBehavior;
- (void)encodeWithCoder:(id)a3;
- (void)setSection:(id)a3;
@end

@implementation REPredictionElement

+ (id)predictionElementFromElement:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_new();
  uint64_t v5 = [v3 identifier];
  v6 = (void *)v4[1];
  v4[1] = v5;

  v4[2] = [v3 privacyBehavior];
  uint64_t v7 = [v3 relevanceProviders];
  v8 = (void *)v4[3];
  v4[3] = v7;

  uint64_t v9 = [v3 bundleIdentifier];
  v10 = (void *)v4[4];
  v4[4] = v9;

  uint64_t v11 = [v3 applicationBundleIdentifier];
  v12 = (void *)v4[5];
  v4[5] = v11;

  v13 = [v3 content];

  v14 = [v13 objectForKey:@"REContentInteractionKey"];

  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  v16 = @"REElementInteractionDefault";
  if (isKindOfClass) {
    v16 = v14;
  }
  v17 = v16;
  v18 = (void *)v4[6];
  v4[6] = v17;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (REPredictionElement)initWithCoder:(id)a3
{
  uint64_t v34 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v32.receiver = self;
  v32.super_class = (Class)REPredictionElement;
  uint64_t v5 = [(REPredictionElement *)&v32 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"identifier"];
    identifier = v5->_identifier;
    v5->_identifier = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"bundleIdentifier"];
    bundleIdentifier = v5->_bundleIdentifier;
    v5->_bundleIdentifier = (NSString *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"applicationBundleIdentifier"];
    applicationBundleIdentifier = v5->_applicationBundleIdentifier;
    v5->_applicationBundleIdentifier = (NSString *)v10;

    objc_storeStrong((id *)&v5->_interaction, @"REElementInteractionDefault");
    v12 = (void *)MEMORY[0x263EFFA08];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    v16 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    v17 = [v4 decodeObjectOfClasses:v16 forKey:@"relevanceProviders"];
    v18 = [MEMORY[0x263EFF980] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v19 = v17;
    uint64_t v20 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v20)
    {
      uint64_t v21 = v20;
      uint64_t v22 = *(void *)v29;
      do
      {
        uint64_t v23 = 0;
        do
        {
          if (*(void *)v29 != v22) {
            objc_enumerationMutation(v19);
          }
          v24 = [[RECustomRelevanceProvider alloc] initWithDictionary:*(void *)(*((void *)&v28 + 1) + 8 * v23)];
          [v18 addObject:v24];

          ++v23;
        }
        while (v21 != v23);
        uint64_t v21 = [v19 countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v21);
    }

    uint64_t v25 = [v18 copy];
    relevanceProviders = v5->_relevanceProviders;
    v5->_relevanceProviders = (NSArray *)v25;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  uint64_t v18 = *MEMORY[0x263EF8340];
  id v4 = a3;
  [v4 encodeObject:self->_identifier forKey:@"identifier"];
  [v4 encodeObject:self->_bundleIdentifier forKey:@"bundleIdentifier"];
  [v4 encodeObject:self->_applicationBundleIdentifier forKey:@"applicationBundleIdentifier"];
  uint64_t v5 = [MEMORY[0x263EFF980] array];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = self->_relevanceProviders;
  uint64_t v7 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * v10), "dictionaryEncoding", (void)v13);
        [v5 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [(NSArray *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  v12 = (void *)[v5 copy];
  [v4 encodeObject:v12 forKey:@"relevanceProviders"];
}

- (NSString)identifier
{
  return self->_identifier;
}

- (unint64_t)privacyBehavior
{
  return self->_privacyBehavior;
}

- (NSArray)relevanceProviders
{
  return self->_relevanceProviders;
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (NSString)applicationBundleIdentifier
{
  return self->_applicationBundleIdentifier;
}

- (NSString)interaction
{
  return self->_interaction;
}

- (NSString)section
{
  return self->_section;
}

- (void)setSection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_section, 0);
  objc_storeStrong((id *)&self->_interaction, 0);
  objc_storeStrong((id *)&self->_applicationBundleIdentifier, 0);
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_relevanceProviders, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

+ (id)predictionElementWithIdentifier:(id)a3 relevanceProviders:(id)a4 bundleIdentifier:(id)a5
{
  uint64_t v27 = *MEMORY[0x263EF8340];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = objc_opt_new();
  objc_storeStrong((id *)(v11 + 8), a3);
  objc_storeStrong((id *)(v11 + 32), a5);
  objc_storeStrong((id *)(v11 + 48), @"REElementInteractionDefault");
  v12 = [MEMORY[0x263EFF980] array];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v13 = v9;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v23 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void *)(*((void *)&v22 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass()) {
          objc_msgSend(v12, "addObject:", v18, (void)v22);
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v15);
  }

  uint64_t v19 = [v12 copy];
  uint64_t v20 = *(void **)(v11 + 24);
  *(void *)(v11 + 24) = v19;

  return (id)v11;
}

@end