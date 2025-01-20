@interface SUWebScriptReloadContext
- (NSString)referringUserAgent;
- (NSURL)URL;
- (NSURL)referrerURL;
- (id)_copyScriptDictionaryRepresentation;
- (id)copyWithZone:(_NSZone *)a3;
- (void)setReferrerURL:(id)a3;
- (void)setReferringUserAgent:(id)a3;
- (void)setURL:(id)a3;
@end

@implementation SUWebScriptReloadContext

- (id)copyWithZone:(_NSZone *)a3
{
  id v4 = objc_alloc_init((Class)objc_opt_class());
  v5 = [(SUWebScriptReloadContext *)self URL];
  [v4 setURL:v5];

  v6 = [(SUWebScriptReloadContext *)self referringUserAgent];
  [v4 setReferringUserAgent:v6];

  v7 = [(SUWebScriptReloadContext *)self referrerURL];
  [v4 setReferrerURL:v7];

  return v4;
}

- (id)_copyScriptDictionaryRepresentation
{
  id v3 = objc_alloc_init(MEMORY[0x263EFF9A0]);
  id v4 = [(SUWebScriptReloadContext *)self URL];
  v5 = [v4 absoluteString];

  if (v5) {
    [v3 setObject:v5 forKey:@"url"];
  }
  v6 = [(SUWebScriptReloadContext *)self referringUserAgent];
  if (v6) {
    [v3 setObject:v6 forKey:@"referringUserAgent"];
  }
  v7 = [(SUWebScriptReloadContext *)self referrerURL];
  v8 = [v7 absoluteString];

  if (v8) {
    [v3 setObject:v8 forKey:@"referrerURL"];
  }
  v9 = [[SUScriptDictionary alloc] initWithDictionary:v3];

  return v9;
}

- (NSURL)URL
{
  return self->_URL;
}

- (void)setURL:(id)a3
{
}

- (NSString)referringUserAgent
{
  return self->_referringUserAgent;
}

- (void)setReferringUserAgent:(id)a3
{
}

- (NSURL)referrerURL
{
  return self->_referrerURL;
}

- (void)setReferrerURL:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referrerURL, 0);
  objc_storeStrong((id *)&self->_referringUserAgent, 0);

  objc_storeStrong((id *)&self->_URL, 0);
}

@end