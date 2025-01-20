@interface NSURL
- (BOOL)be_isEquivalentToURL:(id)a3 ignoringFragment:(BOOL)a4;
- (id)_be_urlWithoutFragment;
- (id)be_URLByReplacingWithScheme:(id)a3;
- (id)be_unescapedPath;
@end

@implementation NSURL

- (id)_be_urlWithoutFragment
{
  v3 = [(NSURL *)self absoluteURL];
  v4 = [v3 standardizedURL];

  v5 = [(NSURL *)self fragment];
  if (v5)
  {
    v6 = [v4 absoluteString];
    v7 = [@"#" stringByAppendingString:v5];
    v8 = [v6 stringByReplacingOccurrencesOfString:v7 withString:&stru_3D7B70];

    uint64_t v9 = +[NSURL URLWithString:v8];

    v4 = (void *)v9;
  }

  return v4;
}

- (BOOL)be_isEquivalentToURL:(id)a3 ignoringFragment:(BOOL)a4
{
  return _BEAreEquivalentURLsIgnoringFragment(self, a3, a4);
}

- (id)be_unescapedPath
{
  v2 = [(NSURL *)self path];
  v3 = [v2 be_stringByRemovingPercentEscapes];

  if ([v3 hasPrefix:@"/"])
  {
    uint64_t v4 = [v3 substringFromIndex:1];

    v3 = (void *)v4;
  }

  return v3;
}

- (id)be_URLByReplacingWithScheme:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = [(NSURL *)v5 scheme];
  unsigned int v7 = [v6 be_isNotWhitespace];

  if (v7)
  {
    v8 = [(NSURL *)v5 absoluteString];
    uint64_t v9 = [(NSURL *)v5 scheme];
    id v10 = [v8 rangeOfString:v9];
    uint64_t v12 = v11;

    if (v12)
    {
      v13 = [v8 stringByReplacingCharactersInRange:v10 withString:v12];
      uint64_t v14 = +[NSURL URLWithString:v13];

      v5 = (NSURL *)v14;
    }
  }

  return v5;
}

@end