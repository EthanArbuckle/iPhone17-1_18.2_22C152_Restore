@interface SHTokenizedURL
+ (id)replaceToken:(int64_t)a3 withValue:(id)a4 urlString:(id)a5;
+ (id)tokenForTokenType:(int64_t)a3;
- (BOOL)containsToken:(int64_t)a3;
- (BOOL)containsTokens;
- (BOOL)updateToken:(int64_t)a3 withValue:(id)a4;
- (NSMutableDictionary)tokenDictionary;
- (NSString)host;
- (NSString)originalURLPath;
- (NSString)tokenURLPath;
- (SHTokenizedURL)initWithHost:(id)a3 URLPath:(id)a4;
- (SHTokenizedURL)initWithString:(id)a3;
- (id)URLRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (void)setHost:(id)a3;
- (void)setOriginalURLPath:(id)a3;
- (void)setTokenDictionary:(id)a3;
@end

@implementation SHTokenizedURL

- (SHTokenizedURL)initWithString:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SHTokenizedURL;
  v6 = [(SHTokenizedURL *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_originalURLPath, a3);
    uint64_t v8 = [MEMORY[0x263EFF9A0] dictionary];
    tokenDictionary = v7->_tokenDictionary;
    v7->_tokenDictionary = (NSMutableDictionary *)v8;
  }
  return v7;
}

- (SHTokenizedURL)initWithHost:(id)a3 URLPath:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SHTokenizedURL;
  v9 = [(SHTokenizedURL *)&v14 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_host, a3);
    objc_storeStrong((id *)&v10->_originalURLPath, a4);
    uint64_t v11 = [MEMORY[0x263EFF9A0] dictionary];
    tokenDictionary = v10->_tokenDictionary;
    v10->_tokenDictionary = (NSMutableDictionary *)v11;
  }
  return v10;
}

+ (id)replaceToken:(int64_t)a3 withValue:(id)a4 urlString:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  v10 = [a1 tokenForTokenType:a3];
  uint64_t v11 = [v8 stringByReplacingOccurrencesOfString:v10 withString:v9];

  return v11;
}

- (BOOL)updateToken:(int64_t)a3 withValue:(id)a4
{
  id v6 = a4;
  id v7 = [(SHTokenizedURL *)self originalURLPath];
  id v8 = [(id)objc_opt_class() tokenForTokenType:a3];
  int v9 = [v7 containsString:v8];

  if (v9)
  {
    v10 = [(id)objc_opt_class() tokenForTokenType:a3];
    uint64_t v11 = [(SHTokenizedURL *)self tokenDictionary];
    v12 = (void *)[v6 copy];
    [v11 setValue:v12 forKey:v10];
  }
  return v9;
}

+ (id)tokenForTokenType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) > 0xE) {
    return @"{deviceid}";
  }
  else {
    return off_2647E57D8[a3 - 1];
  }
}

- (NSString)tokenURLPath
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  v3 = [(SHTokenizedURL *)self originalURLPath];
  v4 = (void *)[v3 copy];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(SHTokenizedURL *)self tokenDictionary];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      uint64_t v9 = 0;
      v10 = v4;
      do
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v9);
        v12 = [(SHTokenizedURL *)self tokenDictionary];
        v13 = [v12 objectForKeyedSubscript:v11];

        v4 = [v10 stringByReplacingOccurrencesOfString:v11 withString:v13];

        ++v9;
        v10 = v4;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }

  return (NSString *)v4;
}

- (id)URLRepresentation
{
  if ([(SHTokenizedURL *)self containsTokens])
  {
    v3 = 0;
  }
  else
  {
    v4 = [(SHTokenizedURL *)self host];

    if (v4)
    {
      id v5 = objc_alloc_init(MEMORY[0x263F08BA0]);
      [v5 setScheme:@"https"];
      uint64_t v6 = [(SHTokenizedURL *)self host];
      [v5 setHost:v6];

      uint64_t v7 = [(SHTokenizedURL *)self tokenURLPath];
      uint64_t v8 = [v7 componentsSeparatedByString:@"?"];

      if ((unint64_t)[v8 count] >= 2)
      {
        v10 = [v8 firstObject];
        [v5 setPath:v10];

        uint64_t v11 = [v8 lastObject];
        [v5 setQuery:v11];

        v3 = [v5 URL];
      }
      else
      {
        v3 = 0;
      }
    }
    else
    {
      uint64_t v9 = NSURL;
      id v5 = [(SHTokenizedURL *)self tokenURLPath];
      v3 = [v9 URLWithString:v5];
    }
  }
  return v3;
}

- (BOOL)containsToken:(int64_t)a3
{
  v4 = [(SHTokenizedURL *)self tokenURLPath];
  id v5 = [(id)objc_opt_class() tokenForTokenType:a3];
  char v6 = [v4 containsString:v5];

  return v6;
}

- (BOOL)containsTokens
{
  if ([(SHTokenizedURL *)self containsToken:0]
    || [(SHTokenizedURL *)self containsToken:1]
    || [(SHTokenizedURL *)self containsToken:2]
    || [(SHTokenizedURL *)self containsToken:3]
    || [(SHTokenizedURL *)self containsToken:4]
    || [(SHTokenizedURL *)self containsToken:5]
    || [(SHTokenizedURL *)self containsToken:9]
    || [(SHTokenizedURL *)self containsToken:10]
    || [(SHTokenizedURL *)self containsToken:11]
    || [(SHTokenizedURL *)self containsToken:12]
    || [(SHTokenizedURL *)self containsToken:13]
    || [(SHTokenizedURL *)self containsToken:15])
  {
    return 1;
  }
  return [(SHTokenizedURL *)self containsToken:14];
}

- (id)description
{
  v2 = [(SHTokenizedURL *)self URLRepresentation];
  v3 = [v2 absoluteString];

  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = +[SHTokenizedURL allocWithZone:](SHTokenizedURL, "allocWithZone:");
  char v6 = [(SHTokenizedURL *)self host];
  uint64_t v7 = (void *)[v6 copyWithZone:a3];
  uint64_t v8 = [(SHTokenizedURL *)self originalURLPath];
  uint64_t v9 = (void *)[v8 copyWithZone:a3];
  v10 = [(SHTokenizedURL *)v5 initWithHost:v7 URLPath:v9];

  uint64_t v11 = [(SHTokenizedURL *)self tokenDictionary];
  v12 = (void *)[v11 mutableCopyWithZone:a3];
  [(SHTokenizedURL *)v10 setTokenDictionary:v12];

  return v10;
}

- (NSString)host
{
  return self->_host;
}

- (void)setHost:(id)a3
{
}

- (NSString)originalURLPath
{
  return self->_originalURLPath;
}

- (void)setOriginalURLPath:(id)a3
{
}

- (NSMutableDictionary)tokenDictionary
{
  return self->_tokenDictionary;
}

- (void)setTokenDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tokenDictionary, 0);
  objc_storeStrong((id *)&self->_originalURLPath, 0);
  objc_storeStrong((id *)&self->_host, 0);
}

@end