@interface WBSWebExtensionMatchPattern
+ (BOOL)hasPatternMatchingIndividualHost:(id)a3;
+ (BOOL)patternSetContainsAllHostsPattern:(id)a3;
+ (BOOL)supportsSecureCoding;
+ (id)allHostsAndSchemesMatchPattern;
+ (id)allHostsAndSchemesMatchPatternSet;
+ (id)matchPatternForDomain:(id)a3;
+ (id)matchPatternForDomainWithoutSubdomains:(id)a3;
+ (id)matchPatternWithString:(id)a3;
+ (id)matchPatternWtihWebKitPattern:(id)a3;
+ (id)matchPatternsWtihWebKitPatterns:(id)a3;
- (BOOL)isEqual:(id)a3;
- (BOOL)matchesAllHosts;
- (BOOL)matchesAllURLs;
- (BOOL)matchesPattern:(id)a3;
- (BOOL)matchesPattern:(id)a3 options:(unint64_t)a4;
- (BOOL)matchesURL:(id)a3;
- (BOOL)matchesURL:(id)a3 options:(unint64_t)a4;
- (NSArray)expandedMatchPatternStrings;
- (NSString)host;
- (NSString)path;
- (NSString)scheme;
- (WBSWebExtensionMatchPattern)initWithCoder:(id)a3;
- (WBSWebExtensionMatchPattern)initWithScheme:(id)a3 host:(id)a4 path:(id)a5;
- (WBSWebExtensionMatchPattern)initWithString:(id)a3;
- (WBSWebExtensionMatchPattern)initWithString:(id)a3 exception:(id *)a4;
- (WBSWebExtensionMatchPattern)initWithWebKitMatchPattern:(id)a3;
- (WKWebExtensionMatchPattern)webKitMatchPattern;
- (id)_descriptionWithScheme:(id)a3;
- (id)_webKitMatchPattern;
- (id)description;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation WBSWebExtensionMatchPattern

+ (id)allHostsAndSchemesMatchPatternSet
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __64__WBSWebExtensionMatchPattern_allHostsAndSchemesMatchPatternSet__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPatternSet]::onceToken != -1) {
    dispatch_once(&+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPatternSet]::onceToken, block);
  }
  v2 = (void *)+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPatternSet]::allHostsPatternSet;
  return v2;
}

void __64__WBSWebExtensionMatchPattern_allHostsAndSchemesMatchPatternSet__block_invoke(uint64_t a1)
{
  v1 = (void *)MEMORY[0x1E4F1CAD0];
  id v4 = [*(id *)(a1 + 32) allHostsAndSchemesMatchPattern];
  uint64_t v2 = objc_msgSend(v1, "setWithObject:");
  v3 = (void *)+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPatternSet]::allHostsPatternSet;
  +[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPatternSet]::allHostsPatternSet = v2;
}

+ (BOOL)patternSetContainsAllHostsPattern:(id)a3
{
  return objc_msgSend(a3, "safari_containsObjectPassingTest:", &__block_literal_global_63);
}

uint64_t __65__WBSWebExtensionMatchPattern_patternSetContainsAllHostsPattern___block_invoke(uint64_t a1, void *a2)
{
  return [a2 matchesAllHosts];
}

+ (BOOL)hasPatternMatchingIndividualHost:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if ((objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "matchesAllHosts", (void)v8) & 1) == 0)
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

+ (id)allHostsAndSchemesMatchPattern
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __61__WBSWebExtensionMatchPattern_allHostsAndSchemesMatchPattern__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern]::onceToken != -1) {
    dispatch_once(&+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern]::onceToken, block);
  }
  uint64_t v2 = (void *)+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern]::allHostsPattern;
  return v2;
}

void __61__WBSWebExtensionMatchPattern_allHostsAndSchemesMatchPattern__block_invoke(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) matchPatternWithString:@"*://*/*"];
  uint64_t v2 = (void *)+[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern]::allHostsPattern;
  +[WBSWebExtensionMatchPattern allHostsAndSchemesMatchPattern]::allHostsPattern = v1;
}

+ (id)matchPatternForDomain:(id)a3
{
  uint64_t v4 = [NSString stringWithFormat:@"*://*.%@/*", a3];
  uint64_t v5 = [a1 matchPatternWithString:v4];

  return v5;
}

+ (id)matchPatternForDomainWithoutSubdomains:(id)a3
{
  uint64_t v4 = [NSString stringWithFormat:@"*://%@/*", a3];
  uint64_t v5 = [a1 matchPatternWithString:v4];

  return v5;
}

+ (id)matchPatternWithString:(id)a3
{
  uint64_t v4 = [MEMORY[0x1E4F466D0] matchPatternWithString:a3];
  uint64_t v5 = v4;
  if (v4)
  {
    v6 = objc_getAssociatedObject(v4, (const void *)webKitPatternAssociationKey);
    v7 = v6;
    if (v6 && ([v6 object], (long long v8 = objc_claimAutoreleasedReturnValue()) != 0))
    {
    }
    else
    {

      long long v8 = (void *)[objc_alloc((Class)a1) initWithWebKitMatchPattern:v5];
    }
  }
  else
  {
    long long v8 = 0;
  }

  return v8;
}

+ (id)matchPatternsWtihWebKitPatterns:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    if ([v4 count])
    {
      v9[0] = MEMORY[0x1E4F143A8];
      v9[1] = 3221225472;
      v9[2] = __63__WBSWebExtensionMatchPattern_matchPatternsWtihWebKitPatterns___block_invoke;
      v9[3] = &__block_descriptor_40_e65___WBSWebExtensionMatchPattern_16__0__WKWebExtensionMatchPattern_8l;
      v9[4] = a1;
      uint64_t v6 = objc_msgSend(v5, "safari_mapAndFilterObjectsUsingBlock:", v9);
    }
    else
    {
      uint64_t v6 = [MEMORY[0x1E4F1CAD0] set];
    }
    v7 = (void *)v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __63__WBSWebExtensionMatchPattern_matchPatternsWtihWebKitPatterns___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[objc_alloc(*(Class *)(a1 + 32)) initWithWebKitMatchPattern:v3];

  return v4;
}

+ (id)matchPatternWtihWebKitPattern:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)[objc_alloc((Class)a1) initWithWebKitMatchPattern:v4];

  return v5;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (WBSWebExtensionMatchPattern)initWithString:(id)a3
{
  return [(WBSWebExtensionMatchPattern *)self initWithString:a3 exception:0];
}

- (WBSWebExtensionMatchPattern)initWithString:(id)a3 exception:(id *)a4
{
  id v6 = a3;
  v18.receiver = self;
  v18.super_class = (Class)WBSWebExtensionMatchPattern;
  v7 = [(WBSWebExtensionMatchPattern *)&v18 init];
  if (v7)
  {
    id v17 = 0;
    uint64_t v8 = [objc_alloc(MEMORY[0x1E4F466D0]) initWithString:v6 error:&v17];
    id v9 = v17;
    webKitMatchPattern = v7->_webKitMatchPattern;
    v7->_webKitMatchPattern = (WKWebExtensionMatchPattern *)v8;

    long long v11 = v7->_webKitMatchPattern;
    if (v11) {
      BOOL v12 = v9 == 0;
    }
    else {
      BOOL v12 = 0;
    }
    if (v12)
    {
      v14 = objc_getAssociatedObject(v11, (const void *)webKitPatternAssociationKey);
      v15 = v14;
      if (v14 && ([v14 object], (a4 = (id *)objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {

        a4 = v7;
      }
    }
    else if (a4)
    {
      uint64_t v13 = [v9 userInfo];
      *a4 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28228]];

      a4 = 0;
    }
  }
  else
  {
    a4 = 0;
  }

  return (WBSWebExtensionMatchPattern *)a4;
}

- (WBSWebExtensionMatchPattern)initWithScheme:(id)a3 host:(id)a4 path:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(WBSWebExtensionMatchPattern *)self init];
  if (v11
    && (uint64_t v12 = [objc_alloc(MEMORY[0x1E4F466D0]) initWithScheme:v8 host:v9 path:v10 error:0],
        webKitMatchPattern = v11->_webKitMatchPattern,
        v11->_webKitMatchPattern = (WKWebExtensionMatchPattern *)v12,
        webKitMatchPattern,
        v11->_webKitMatchPattern))
  {
    v14 = v11;
  }
  else
  {
    v14 = 0;
  }

  return v14;
}

- (WBSWebExtensionMatchPattern)initWithWebKitMatchPattern:(id)a3
{
  id v5 = a3;
  id v6 = [(WBSWebExtensionMatchPattern *)self init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_webKitMatchPattern, a3);
    id v8 = (const void *)webKitPatternAssociationKey;
    id v9 = [MEMORY[0x1E4F98430] wrapperWithObject:v7];
    objc_setAssociatedObject(v5, v8, v9, (void *)1);

    id v10 = v7;
  }

  return v7;
}

- (id)_webKitMatchPattern
{
  return self->_webKitMatchPattern;
}

- (void)encodeWithCoder:(id)a3
{
}

- (WBSWebExtensionMatchPattern)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(WBSWebExtensionMatchPattern *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pattern"];
    webKitMatchPattern = v5->_webKitMatchPattern;
    v5->_webKitMatchPattern = (WKWebExtensionMatchPattern *)v6;

    id v8 = v5;
  }

  return v5;
}

- (unint64_t)hash
{
  uint64_t v2 = [(WBSWebExtensionMatchPattern *)self description];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = (WBSWebExtensionMatchPattern *)a3;
  id v5 = v4;
  if (self == v4)
  {
    char v9 = 1;
  }
  else
  {
    uint64_t v6 = v4;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      v7 = v6;
    }
    else {
      v7 = 0;
    }
    id v8 = v7;

    if (v8) {
      char v9 = [(WKWebExtensionMatchPattern *)self->_webKitMatchPattern isEqual:v8->_webKitMatchPattern];
    }
    else {
      char v9 = 0;
    }
  }
  return v9;
}

- (NSArray)expandedMatchPatternStrings
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(WBSWebExtensionMatchPattern *)self matchesAllURLs])
  {
    unint64_t v3 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:2];
    long long v13 = 0u;
    long long v14 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    id v4 = +[WBSWebExtensionData supportedWebExtensionPatternSchemes];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v12;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v12 != v6) {
            objc_enumerationMutation(v4);
          }
          id v8 = *(void **)(*((void *)&v11 + 1) + 8 * i);
          if (([v8 isEqualToString:@"*"] & 1) == 0)
          {
            char v9 = [NSString stringWithFormat:@"%@://*/*", v8];
            [v3 addObject:v9];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v16 count:16];
      }
      while (v5);
    }
  }
  else
  {
    id v4 = [(WBSWebExtensionMatchPattern *)self description];
    v15 = v4;
    unint64_t v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
  }

  return (NSArray *)v3;
}

- (NSString)scheme
{
  return (NSString *)[(WKWebExtensionMatchPattern *)self->_webKitMatchPattern scheme];
}

- (NSString)host
{
  return (NSString *)[(WKWebExtensionMatchPattern *)self->_webKitMatchPattern host];
}

- (NSString)path
{
  return (NSString *)[(WKWebExtensionMatchPattern *)self->_webKitMatchPattern path];
}

- (BOOL)matchesAllURLs
{
  return [(WKWebExtensionMatchPattern *)self->_webKitMatchPattern matchesAllURLs];
}

- (BOOL)matchesAllHosts
{
  return [(WKWebExtensionMatchPattern *)self->_webKitMatchPattern matchesAllHosts];
}

- (id)description
{
  return (id)[(WKWebExtensionMatchPattern *)self->_webKitMatchPattern description];
}

- (id)_descriptionWithScheme:(id)a3
{
  id v4 = a3;
  uint64_t v5 = NSString;
  uint64_t v6 = [(WBSWebExtensionMatchPattern *)self host];
  v7 = [(WBSWebExtensionMatchPattern *)self path];
  id v8 = [v5 stringWithFormat:@"%@://%@%@", v4, v6, v7];

  return v8;
}

- (BOOL)matchesURL:(id)a3
{
  return [(WBSWebExtensionMatchPattern *)self matchesURL:a3 options:0];
}

- (BOOL)matchesURL:(id)a3 options:(unint64_t)a4
{
  return [(WKWebExtensionMatchPattern *)self->_webKitMatchPattern matchesURL:a3 options:a4 & 7];
}

- (BOOL)matchesPattern:(id)a3
{
  return [(WBSWebExtensionMatchPattern *)self matchesPattern:a3 options:0];
}

- (BOOL)matchesPattern:(id)a3 options:(unint64_t)a4
{
  char v4 = a4;
  webKitMatchPattern = self->_webKitMatchPattern;
  uint64_t v6 = [a3 _webKitMatchPattern];
  char v7 = [(WKWebExtensionMatchPattern *)webKitMatchPattern matchesPattern:v6 options:v4 & 7];

  return v7;
}

- (WKWebExtensionMatchPattern)webKitMatchPattern
{
  return self->_webKitMatchPattern;
}

- (void).cxx_destruct
{
}

@end