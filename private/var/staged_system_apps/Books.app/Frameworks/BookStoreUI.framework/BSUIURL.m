@interface BSUIURL
+ (id)URLWithURL:(id)a3;
+ (id)URLWithURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5;
- (BSUIURL)initWithURL:(id)a3;
- (NSString)referrerApplicationName;
- (NSString)referrerURLString;
- (NSURL)underlyingURL;
- (id)_queryDictionary;
- (id)actionString;
- (id)valueForQueryParameter:(id)a3;
- (void)setReferrerApplicationName:(id)a3;
- (void)setReferrerURLString:(id)a3;
- (void)setUnderlyingURL:(id)a3;
@end

@implementation BSUIURL

- (BSUIURL)initWithURL:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BSUIURL;
  v5 = [(BSUIURL *)&v9 init];
  if (v5)
  {
    v6 = (NSURL *)[v4 copy];
    underlyingURL = v5->_underlyingURL;
    v5->_underlyingURL = v6;
  }
  return v5;
}

+ (id)URLWithURL:(id)a3
{
  if (a3)
  {
    id v3 = a3;
    id v4 = [[BSUIURL alloc] initWithURL:v3];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

+ (id)URLWithURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5
{
  v5 = (BSUIURL *)a3;
  if (a3)
  {
    id v7 = a5;
    id v8 = a4;
    objc_super v9 = v5;
    v5 = [[BSUIURL alloc] initWithURL:v9];

    [(BSUIURL *)v5 setReferrerApplicationName:v8];
    objc_opt_class();
    v10 = BUDynamicCast();

    v11 = [v10 objectForKey:LSReferrerURLKey];
    objc_opt_class();
    v12 = BUDynamicCast();

    if (v12)
    {
      [(BSUIURL *)v5 setReferrerURLString:v11];
    }
    else
    {
      objc_opt_class();
      v13 = BUDynamicCast();

      if (v13)
      {
        v14 = [v11 absoluteString];
        [(BSUIURL *)v5 setReferrerURLString:v14];
      }
    }
  }

  return v5;
}

- (id)actionString
{
  id v3 = [(BSUIURL *)self valueForQueryParameter:@"action"];
  if (!v3)
  {
    id v4 = [(NSURL *)self->_underlyingURL absoluteString];
    if ([v4 rangeOfString:@"MZSearch.woa"] == (id)0x7FFFFFFFFFFFFFFFLL
      && [v4 rangeOfString:@"/search?"] == (id)0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v4 rangeOfString:@"freeProductCodeWizard"] == (id)0x7FFFFFFFFFFFFFFFLL
        && [v4 rangeOfString:@"redeemLandingPage"] == (id)0x7FFFFFFFFFFFFFFFLL
        && [v4 rangeOfString:@"showDialogForRedeem"] == (id)0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v4 rangeOfString:@"buyLandingPage"] == (id)0x7FFFFFFFFFFFFFFFLL)
        {
          if ([v4 rangeOfString:@"buyCharityGiftWizard"] == (id)0x7FFFFFFFFFFFFFFFLL)
          {
            if ([v4 rangeOfString:@"MZFinance.woa"] == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              if ([v4 rangeOfString:@"viewEula"] == (id)0x7FFFFFFFFFFFFFFFLL) {
                id v3 = 0;
              }
              else {
                id v3 = @"eula";
              }
            }
            else if ([v4 rangeOfString:@"getPass"] == (id)0x7FFFFFFFFFFFFFFFLL)
            {
              id v3 = @"account";
            }
            else
            {
              id v3 = @"addpassbookpass";
            }
          }
          else
          {
            id v3 = @"donate";
          }
        }
        else
        {
          id v3 = @"gift";
        }
      }
      else
      {
        id v3 = @"redeem";
      }
    }
    else
    {
      id v3 = @"search";
    }
  }

  return v3;
}

- (id)valueForQueryParameter:(id)a3
{
  id v4 = a3;
  v5 = [(BSUIURL *)self _queryDictionary];
  v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)_queryDictionary
{
  queryDictionary = self->_queryDictionary;
  if (!queryDictionary)
  {
    id v4 = [(NSURL *)self->_underlyingURL query];
    v5 = [v4 componentsSeparatedByString:@"&"];

    id v6 = objc_alloc_init((Class)NSMutableDictionary);
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = *(void *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v7);
          }
          v12 = [*(id *)(*((void *)&v18 + 1) + 8 * (void)v11) componentsSeparatedByString:@"="];
          if ([v12 count] == (char *)&dword_0 + 2)
          {
            v13 = [v12 objectAtIndex:1];
            v14 = [v12 objectAtIndex:0];
            [v6 setObject:v13 forKey:v14];
          }
          v11 = (char *)v11 + 1;
        }
        while (v9 != v11);
        id v9 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }

    v15 = (NSDictionary *)[v6 copy];
    v16 = self->_queryDictionary;
    self->_queryDictionary = v15;

    queryDictionary = self->_queryDictionary;
  }

  return queryDictionary;
}

- (NSURL)underlyingURL
{
  return self->_underlyingURL;
}

- (void)setUnderlyingURL:(id)a3
{
}

- (NSString)referrerURLString
{
  return self->_referrerURLString;
}

- (void)setReferrerURLString:(id)a3
{
}

- (NSString)referrerApplicationName
{
  return self->_referrerApplicationName;
}

- (void)setReferrerApplicationName:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_referrerApplicationName, 0);
  objc_storeStrong((id *)&self->_referrerURLString, 0);
  objc_storeStrong((id *)&self->_underlyingURL, 0);

  objc_storeStrong((id *)&self->_queryDictionary, 0);
}

@end