@interface WFiTunesObject
+ (BOOL)supportsSecureCoding;
+ (Class)classForParsingJSONDictionary:(id)a3;
+ (id)JSONKeyPathsByPropertyKey;
+ (id)allowedSecureCodingClassesByPropertyKey;
+ (id)artworkURLsJSONTransformer;
+ (id)identifierJSONTransformer;
+ (id)releaseDateJSONTransformer;
- (NSDictionary)artworkURLs;
- (NSString)censoredName;
- (NSString)identifier;
- (NSString)kind;
- (NSString)name;
- (NSURL)viewURL;
- (WFiTunesObject)initWithName:(id)a3 identifier:(id)a4 kind:(id)a5;
- (void)setIdentifier:(id)a3;
- (void)setKind:(id)a3;
- (void)setName:(id)a3;
@end

@implementation WFiTunesObject

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_artworkURLs, 0);
  objc_storeStrong((id *)&self->_viewURL, 0);
  objc_storeStrong((id *)&self->_censoredName, 0);
  objc_storeStrong((id *)&self->_kind, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (NSDictionary)artworkURLs
{
  return self->_artworkURLs;
}

- (NSURL)viewURL
{
  return self->_viewURL;
}

- (NSString)censoredName
{
  return self->_censoredName;
}

- (void)setKind:(id)a3
{
}

- (NSString)kind
{
  return self->_kind;
}

- (void)setName:(id)a3
{
}

- (NSString)name
{
  return self->_name;
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (WFiTunesObject)initWithName:(id)a3 identifier:(id)a4 kind:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v15.receiver = self;
  v15.super_class = (Class)WFiTunesObject;
  v11 = [(MTLModel *)&v15 init];
  v12 = v11;
  if (v11)
  {
    [(WFiTunesObject *)v11 setName:v8];
    [(WFiTunesObject *)v12 setIdentifier:v9];
    [(WFiTunesObject *)v12 setKind:v10];
    v13 = v12;
  }

  return v12;
}

+ (Class)classForParsingJSONDictionary:(id)a3
{
  id v4 = a3;
  v5 = [v4 objectForKeyedSubscript:@"wrapperType"];
  v6 = [v4 objectForKeyedSubscript:@"kind"];
  if ([v5 isEqualToString:@"artist"]) {
    goto LABEL_10;
  }
  if ([v6 isEqualToString:@"podcast"])
  {
    [v4 objectForKeyedSubscript:@"intent"];

LABEL_10:
    objc_opt_class();
    id v8 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_11;
  }
  if ([v5 isEqualToString:@"collection"]) {
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"audiobook"]) {
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"track"]) {
    goto LABEL_10;
  }
  if ([v5 isEqualToString:@"software"]) {
    goto LABEL_10;
  }
  v7 = [v4 objectForKeyedSubscript:@"trackId"];

  if (v7) {
    goto LABEL_10;
  }
  id v8 = a1;
LABEL_11:
  id v9 = v8;

  return (Class)v9;
}

+ (id)artworkURLsJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_216 reverseBlock:&__block_literal_global_229_42046];
}

id __44__WFiTunesObject_artworkURLsJSONTransformer__block_invoke_227(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = objc_opt_new();
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = v2;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = objc_msgSend(NSString, "stringWithFormat:", @"artworkUrl%lu", objc_msgSend(v9, "unsignedLongValue"));
        v11 = [v4 objectForKeyedSubscript:v9];
        v12 = [v11 absoluteString];
        [v3 setObject:v12 forKeyedSubscript:v10];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

id __44__WFiTunesObject_artworkURLsJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v25 = objc_opt_new();
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v27 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        id v9 = NSNumber;
        id v10 = [v8 substringFromIndex:10];
        v11 = objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "integerValue"));

        v12 = (void *)MEMORY[0x1E4F1CB10];
        v13 = [v3 objectForKeyedSubscript:v8];
        long long v14 = [v12 URLWithString:v13];

        if (v11) {
          BOOL v15 = v14 == 0;
        }
        else {
          BOOL v15 = 1;
        }
        if (!v15) {
          [v25 setObject:v14 forKeyedSubscript:v11];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v5);
  }

  uint64_t v16 = [v25 objectForKeyedSubscript:&unk_1F2316B78];
  if (v16)
  {
    long long v17 = (void *)v16;
    v18 = [v25 objectForKeyedSubscript:&unk_1F2316B90];

    if (!v18)
    {
      uint64_t v19 = (void *)MEMORY[0x1E4F1CB10];
      v20 = [v25 objectForKeyedSubscript:&unk_1F2316B78];
      v21 = [v20 absoluteString];
      v22 = [v21 stringByReplacingOccurrencesOfString:@"100x100" withString:@"512x512"];
      v23 = [v19 URLWithString:v22];
      [v25 setObject:v23 forKeyedSubscript:&unk_1F2316B90];
    }
  }

  return v25;
}

+ (id)releaseDateJSONTransformer
{
  id v2 = (void *)MEMORY[0x1E4F29248];
  id v3 = [MEMORY[0x1E4F1CA20] localeWithLocaleIdentifier:@"en_US_POSIX"];
  uint64_t v4 = [MEMORY[0x1E4F1CAF0] timeZoneWithName:@"UTC"];
  uint64_t v5 = objc_msgSend(v2, "mtl_dateTransformerWithDateFormat:calendar:locale:timeZone:defaultDate:", @"yyyy-MM-dd'T'HH:mm:ss'Z'", 0, v3, v4, 0);

  return v5;
}

+ (id)identifierJSONTransformer
{
  return +[MTLValueTransformer transformerUsingForwardBlock:&__block_literal_global_42073];
}

id __43__WFiTunesObject_identifierJSONTransformer__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = [v2 stringValue];
LABEL_5:
    uint64_t v4 = v3;
    goto LABEL_7;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v3 = v2;
    goto LABEL_5;
  }
  uint64_t v4 = 0;
LABEL_7:

  return v4;
}

+ (id)JSONKeyPathsByPropertyKey
{
  v5[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = @"artworkURLs";
  v5[0] = &unk_1F2317A18;
  id v2 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v5 forKeys:&v4 count:1];
  return v2;
}

+ (id)allowedSecureCodingClassesByPropertyKey
{
  v7[3] = *MEMORY[0x1E4F143B8];
  v6.receiver = a1;
  v6.super_class = (Class)&OBJC_METACLASS___WFiTunesObject;
  id v2 = objc_msgSendSuper2(&v6, sel_allowedSecureCodingClassesByPropertyKey);
  id v3 = (void *)[v2 mutableCopy];

  v7[0] = objc_opt_class();
  v7[1] = objc_opt_class();
  v7[2] = objc_opt_class();
  uint64_t v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:3];
  [v3 setObject:v4 forKey:@"artworkURLs"];

  return v3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end