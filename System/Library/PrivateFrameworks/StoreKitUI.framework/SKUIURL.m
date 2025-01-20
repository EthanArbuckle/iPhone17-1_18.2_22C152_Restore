@interface SKUIURL
- (BOOL)isEqual:(id)a3;
- (NSDictionary)queryStringDictionary;
- (NSString)URLBagKey;
- (NSString)actionString;
- (NSString)redeemCode;
- (NSString)referrerApplicationName;
- (NSString)referrerURLString;
- (NSString)searchTerm;
- (NSURL)underlyingURL;
- (SKUIURL)initWithURL:(id)a3;
- (SKUIURL)initWithURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5;
- (SKUIURL)initWithURLBagKey:(id)a3;
- (id)_appStoreSearchURLBagKey;
- (id)_decodedQueryParameter:(id)a3;
- (id)_queryDictionary;
- (id)_searchGroupForSearchKind:(id)a3;
- (id)_searchURLBagKey;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (id)newURLRequest;
- (id)newURLRequestWithBaseURL:(id)a3;
- (id)valueForQueryParameter:(id)a3;
- (unint64_t)hash;
- (void)setReferrerApplicationName:(id)a3;
- (void)setReferrerURLString:(id)a3;
@end

@implementation SKUIURL

- (SKUIURL)initWithURL:(id)a3
{
  id v4 = a3;
  if (os_variant_has_internal_content()
    && _os_feature_enabled_impl()
    && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_DEBUG))
  {
    -[SKUIURL initWithURL:]();
  }
  v14.receiver = self;
  v14.super_class = (Class)SKUIURL;
  v5 = [(SKUIURL *)&v14 init];
  if (v5)
  {
    v6 = [v4 scheme];
    if ([v6 isEqualToString:@"https"])
    {
      uint64_t v7 = [v4 copy];
      url = v5->_url;
      v5->_url = (NSURL *)v7;
    }
    else
    {
      uint64_t v9 = [v6 length];
      v10 = [v4 absoluteString];
      url = objc_msgSend(v10, "stringByReplacingCharactersInRange:withString:", 0, v9, @"https");

      uint64_t v11 = [objc_alloc(MEMORY[0x1E4F1CB10]) initWithString:url];
      v12 = v5->_url;
      v5->_url = (NSURL *)v11;
    }
  }

  return v5;
}

- (SKUIURL)initWithURL:(id)a3 sourceApplication:(id)a4 annotation:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  v10 = [(SKUIURL *)self initWithURL:a3];
  if (v10)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = (void *)SKUIMobileCoreServicesFramework();
      id v12 = *(id *)SKUIWeakLinkedSymbolForString("LSReferrerURLKey", v11);
      if (v12)
      {
        v13 = [v9 objectForKey:v12];
      }
      else
      {
        v13 = 0;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        [(SKUIURL *)v10 setReferrerURLString:v13];
      }
      else
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_super v14 = [v13 absoluteString];
          [(SKUIURL *)v10 setReferrerURLString:v14];
        }
      }
    }
    [(SKUIURL *)v10 setReferrerApplicationName:v8];
  }

  return v10;
}

- (SKUIURL)initWithURLBagKey:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F29088];
  id v5 = a3;
  id v6 = objc_alloc_init(v4);
  [v6 setScheme:@"https"];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [MEMORY[0x1E4F290C8] queryItemWithName:@"action" value:@"bagurl"];
  [v7 addObject:v8];

  id v9 = [MEMORY[0x1E4F290C8] queryItemWithName:@"bagkey" value:v5];

  [v7 addObject:v9];
  [v6 setQueryItems:v7];
  v10 = [v6 URL];
  uint64_t v11 = [(SKUIURL *)self initWithURL:v10];

  return v11;
}

- (NSString)actionString
{
  v3 = [(SKUIURL *)self valueForQueryParameter:@"action"];
  if (!v3)
  {
    id v4 = [(NSURL *)self->_url absoluteString];
    if ([v4 rangeOfString:@"MZSearch.woa"] == 0x7FFFFFFFFFFFFFFFLL
      && [v4 rangeOfString:@"/search?"] == 0x7FFFFFFFFFFFFFFFLL)
    {
      if ([v4 rangeOfString:@"freeProductCodeWizard"] == 0x7FFFFFFFFFFFFFFFLL
        && [v4 rangeOfString:@"redeemLandingPage"] == 0x7FFFFFFFFFFFFFFFLL
        && [v4 rangeOfString:@"showDialogForRedeem"] == 0x7FFFFFFFFFFFFFFFLL)
      {
        if ([v4 rangeOfString:@"buyLandingPage"] == 0x7FFFFFFFFFFFFFFFLL)
        {
          if ([v4 rangeOfString:@"buyCharityGiftWizard"] == 0x7FFFFFFFFFFFFFFFLL)
          {
            if ([v4 rangeOfString:@"MZFinance.woa"] == 0x7FFFFFFFFFFFFFFFLL
              && [v4 rangeOfString:@"finance-app"] == 0x7FFFFFFFFFFFFFFFLL)
            {
              if ([v4 rangeOfString:@"viewEula"] == 0x7FFFFFFFFFFFFFFFLL) {
                v3 = 0;
              }
              else {
                v3 = @"eula";
              }
            }
            else if ([v4 rangeOfString:@"getPass"] == 0x7FFFFFFFFFFFFFFFLL)
            {
              v3 = @"account";
            }
            else
            {
              v3 = @"addpassbookpass";
            }
          }
          else
          {
            v3 = @"donate";
          }
        }
        else
        {
          v3 = @"gift";
        }
      }
      else
      {
        v3 = @"redeem";
      }
    }
    else
    {
      v3 = @"search";
    }
  }

  return (NSString *)v3;
}

- (id)newURLRequest
{
  return [(SKUIURL *)self newURLRequestWithBaseURL:self->_url];
}

- (id)newURLRequestWithBaseURL:(id)a3
{
  id v4 = (NSURL *)a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F18D50]);
  id v6 = [(SKUIURL *)self _queryDictionary];
  id v7 = [v6 objectForKey:@"serialNumber"];
  if (v7) {
    [v5 setValue:v7 forHTTPHeaderField:@"x-apple-serial-number"];
  }
  id v8 = [(NSURL *)v4 host];

  if (v8)
  {
    if (v7 || self->_url != v4)
    {
      id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      v10 = [v6 objectForKey:@"action"];
      int v11 = [v10 isEqualToString:@"search"];

      uint64_t v29 = 0;
      v30 = &v29;
      uint64_t v31 = 0x3032000000;
      v32 = __Block_byref_object_copy__77;
      v33 = __Block_byref_object_dispose__77;
      id v34 = 0;
      id v12 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithObjects:", @"action", @"bagKey", @"x-apple-serial-number", 0);
      v13 = v12;
      if (v11) {
        [v12 addObject:@"libraryid"];
      }
      v23[0] = MEMORY[0x1E4F143A8];
      v23[1] = 3221225472;
      v23[2] = __36__SKUIURL_newURLRequestWithBaseURL___block_invoke;
      v23[3] = &unk_1E6429208;
      char v28 = v11;
      v27 = &v29;
      id v14 = v13;
      id v24 = v14;
      v25 = self;
      id v15 = v9;
      id v26 = v15;
      [v6 enumerateKeysAndObjectsUsingBlock:v23];
      if (v30[5])
      {
        v16 = -[SKUIURL _searchGroupForSearchKind:](self, "_searchGroupForSearchKind:");
        if ([v16 length]) {
          [v15 setObject:v16 forKey:@"group"];
        }
      }
      v17 = (void *)[(NSURL *)v4 copyQueryStringDictionaryWithUnescapedValues:1];
      if (v17) {
        [v15 addEntriesFromDictionary:v17];
      }
      if (v11)
      {
        v18 = [v15 objectForKey:@"string"];
        if (v18)
        {
          [v15 setObject:v18 forKey:@"term"];
          [v15 removeObjectForKey:@"string"];
        }
      }
      uint64_t v19 = [(NSURL *)v4 urlBySettingQueryStringDictionary:v15];

      _Block_object_dispose(&v29, 8);
      id v4 = (NSURL *)v19;
    }
    [v5 setURL:v4];
  }
  v20 = [(SKUIURL *)self referrerApplicationName];
  if (v20) {
    [v5 setValue:v20 forHTTPHeaderField:@"ref-user-agent"];
  }
  v21 = [(SKUIURL *)self referrerURLString];

  if (v21) {
    [v5 setValue:v21 forHTTPHeaderField:@"referer"];
  }

  return v5;
}

void __36__SKUIURL_newURLRequestWithBaseURL___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v7 = a2;
  id v5 = a3;
  if (*(unsigned char *)(a1 + 64)
    && (([v7 isEqualToString:@"kind"] & 1) != 0
     || [v7 isEqualToString:@"entity"]))
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  }
  else if (([*(id *)(a1 + 32) containsObject:v7] & 1) == 0)
  {
    uint64_t v6 = [*(id *)(a1 + 40) _decodedQueryParameter:v5];

    [*(id *)(a1 + 48) setObject:v6 forKey:v7];
    id v5 = (id)v6;
  }
}

- (NSDictionary)queryStringDictionary
{
  v2 = [(SKUIURL *)self _queryDictionary];
  v3 = (void *)[v2 copy];

  return (NSDictionary *)v3;
}

- (NSString)redeemCode
{
  v2 = [(SKUIURL *)self _queryDictionary];
  v3 = [v2 objectForKey:@"code"];
  if (!v3)
  {
    v3 = [v2 objectForKey:@"certId"];
  }

  return (NSString *)v3;
}

- (NSString)searchTerm
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = __Block_byref_object_copy__77;
  v13 = __Block_byref_object_dispose__77;
  id v14 = 0;
  v3 = [(SKUIURL *)self _queryDictionary];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __21__SKUIURL_searchTerm__block_invoke;
  v8[3] = &unk_1E6424100;
  v8[4] = &v9;
  [v3 enumerateKeysAndObjectsUsingBlock:v8];
  uint64_t v4 = [(SKUIURL *)self _decodedQueryParameter:v10[5]];
  id v5 = (void *)v10[5];
  v10[5] = v4;

  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return (NSString *)v6;
}

void __21__SKUIURL_searchTerm__block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v14 = a2;
  id v7 = a3;
  if ([v14 isEqualToString:@"term"])
  {
    uint64_t v8 = [v7 copy];
    uint64_t v9 = *(void *)(*(void *)(a1 + 32) + 8);
    v10 = *(void **)(v9 + 40);
    *(void *)(v9 + 40) = v8;

    *a4 = 1;
  }
  else if ([v14 rangeOfString:@"term" options:13] != 0x7FFFFFFFFFFFFFFFLL {
         || [v14 isEqualToString:@"string"])
  }
  {
    uint64_t v11 = [v7 copy];
    uint64_t v12 = *(void *)(*(void *)(a1 + 32) + 8);
    v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;
  }
}

- (NSString)URLBagKey
{
  v3 = [(SKUIURL *)self _queryDictionary];
  uint64_t v4 = [v3 objectForKey:@"bagkey"];

  if (!v4)
  {
    id v5 = [(SKUIURL *)self actionString];
    uint64_t v4 = @"library-link";
    if (([v5 isEqualToString:@"library-link"] & 1) == 0)
    {
      if ([v5 isEqualToString:@"search"])
      {
        uint64_t v4 = [(SKUIURL *)self _searchURLBagKey];
      }
      else
      {
        uint64_t v4 = @"newsstand";
        if (([v5 isEqualToString:@"newsstand"] & 1) == 0)
        {
          uint64_t v4 = @"passbook";
          if (([v5 isEqualToString:@"passbook"] & 1) == 0)
          {
            uint64_t v4 = @"ringtones";
            if (([v5 isEqualToString:@"ringtones"] & 1) == 0)
            {
              if ([v5 isEqualToString:@"accessory-lookup"]) {
                uint64_t v4 = @"p2-accessory-room";
              }
              else {
                uint64_t v4 = 0;
              }
            }
          }
        }
      }
    }
  }

  return (NSString *)v4;
}

- (id)valueForQueryParameter:(id)a3
{
  id v4 = a3;
  id v5 = [(SKUIURL *)self _queryDictionary];
  id v6 = [v5 objectForKey:v4];

  return v6;
}

- (id)_queryDictionary
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  queryDictionary = self->_queryDictionary;
  if (!queryDictionary)
  {
    id v4 = [(NSURL *)self->_url query];
    id v5 = [v4 componentsSeparatedByString:@"&"];

    id v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v7 = self->_queryDictionary;
    self->_queryDictionary = v6;

    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v8 = v5;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v19;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v19 != v11) {
            objc_enumerationMutation(v8);
          }
          v13 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v12), "componentsSeparatedByString:", @"=", (void)v18);
          if ([v13 count] == 2)
          {
            id v14 = self->_queryDictionary;
            id v15 = [v13 objectAtIndex:1];
            v16 = [v13 objectAtIndex:0];
            [(NSMutableDictionary *)v14 setObject:v15 forKey:v16];
          }
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);
    }

    queryDictionary = self->_queryDictionary;
  }

  return queryDictionary;
}

- (id)_decodedQueryParameter:(id)a3
{
  v3 = [a3 stringByReplacingOccurrencesOfString:@"+" withString:@" "];
  id v4 = [v3 stringByRemovingPercentEncoding];

  return v4;
}

- (id)_searchGroupForSearchKind:(id)a3
{
  v3 = (__CFString *)a3;
  if (([(__CFString *)v3 isEqualToString:@"epubBook"] & 1) != 0
    || ([(__CFString *)v3 isEqualToString:@"metaEbook"] & 1) != 0
    || ([(__CFString *)v3 isEqualToString:@"ibook"] & 1) != 0
    || ([(__CFString *)v3 isEqualToString:@"ibookTextbook"] & 1) != 0)
  {
    id v4 = @"ebook";
LABEL_6:

    goto LABEL_7;
  }
  if ([(__CFString *)v3 isEqualToString:@"book"])
  {
    id v4 = @"audiobook";
    goto LABEL_6;
  }
  if (([(__CFString *)v3 isEqualToString:@"iMix"] & 1) != 0
    || ([(__CFString *)v3 isEqualToString:@"itunesMix"] & 1) != 0
    || ([(__CFString *)v3 isEqualToString:@"mix"] & 1) != 0
    || ([(__CFString *)v3 isEqualToString:@"preorderAlbum"] & 1) != 0)
  {
    id v4 = @"album";
    goto LABEL_6;
  }
  if ([(__CFString *)v3 isEqualToString:@"shortFilm"])
  {
    id v4 = @"movie";
    goto LABEL_6;
  }
  if ([(__CFString *)v3 isEqualToString:@"tvEpisode"])
  {
    id v4 = @"tvSeason";
    goto LABEL_6;
  }
  if ([(__CFString *)v3 isEqualToString:@"tone"])
  {
    id v4 = @"ringtone";
    goto LABEL_6;
  }
  if ([(__CFString *)v3 isEqualToString:@"course"])
  {
    id v4 = @"iTunesUCourse";
    goto LABEL_6;
  }
  id v4 = v3;
  if ([(__CFString *)v3 isEqualToString:@"any-audio"])
  {
    id v4 = 0;
    goto LABEL_6;
  }
LABEL_7:

  return v4;
}

- (id)_searchURLBagKey
{
  v3 = [(NSURL *)self->_url host];
  uint64_t v4 = [v3 length];

  if (v4)
  {
    id v5 = 0;
  }
  else
  {
    id v6 = [MEMORY[0x1E4F28B50] mainBundle];
    id v7 = [v6 bundleIdentifier];

    if ([v7 isEqualToString:@"com.apple.AppStore"])
    {
      id v5 = [(SKUIURL *)self _appStoreSearchURLBagKey];
    }
    else if ([v7 isEqualToString:@"com.apple.MobileStore"])
    {
      id v5 = @"p2-music-search";
    }
    else if ([v7 isEqualToString:@"com.apple.iBooks"])
    {
      id v5 = @"p2-book-search";
    }
    else if ([v7 isEqualToString:@"com.apple.podcasts"])
    {
      id v5 = @"p2-podcasts-search";
    }
    else if ([v7 isEqualToString:@"com.apple.itunesu"])
    {
      id v5 = @"p2-itunesu-search";
    }
    else
    {
      id v8 = [(SKUIURL *)self _queryDictionary];
      uint64_t v9 = [v8 objectForKey:@"kind"];

      switch(SKUIItemKindForString((uint64_t)v9))
      {
        case 1:
        case 3:
        case 6:
        case 7:
        case 8:
        case 11:
        case 13:
        case 14:
        case 15:
        case 16:
          id v5 = @"p2-music-search";
          break;
        case 2:
          id v5 = @"p2-book-search";
          break;
        case 4:
          id v5 = @"p2-itunesu-search";
          break;
        case 5:
        case 12:
        case 17:
          id v5 = [(SKUIURL *)self _appStoreSearchURLBagKey];
          break;
        case 9:
        case 10:
          id v5 = @"p2-podcasts-search";
          break;
        default:
          id v5 = 0;
          break;
      }
    }
  }

  return v5;
}

- (id)_appStoreSearchURLBagKey
{
  v2 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  v3 = [v2 stringForKey:@"AppStoreSearchKeyOverride"];

  if (v3) {
    uint64_t v4 = v3;
  }
  else {
    uint64_t v4 = @"p2-panda-search";
  }

  return v4;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v5 = objc_msgSend((id)objc_msgSend((id)objc_opt_class(), "allocWithZone:", a3), "init");
  uint64_t v6 = [(NSMutableDictionary *)self->_queryDictionary mutableCopyWithZone:a3];
  id v7 = (void *)v5[1];
  v5[1] = v6;

  uint64_t v8 = [(NSString *)self->_referrerApplicationName copyWithZone:a3];
  uint64_t v9 = (void *)v5[2];
  v5[2] = v8;

  uint64_t v10 = [(NSString *)self->_referrerURLString copyWithZone:a3];
  uint64_t v11 = (void *)v5[3];
  v5[3] = v10;

  uint64_t v12 = [(NSURL *)self->_url copyWithZone:a3];
  v13 = (void *)v5[4];
  v5[4] = v12;

  return v5;
}

- (id)description
{
  v3 = NSString;
  v7.receiver = self;
  v7.super_class = (Class)SKUIURL;
  uint64_t v4 = [(SKUIURL *)&v7 description];
  id v5 = [v3 stringWithFormat:@"%@: %@ [Referrer: %@, %@]", v4, self->_url, self->_referrerApplicationName, self->_referrerURLString];

  return v5;
}

- (unint64_t)hash
{
  v2 = [(SKUIURL *)self underlyingURL];
  unint64_t v3 = [v2 hash];

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  uint64_t v5 = objc_opt_class();
  if (v5 == objc_opt_class())
  {
    objc_super v7 = [(SKUIURL *)self underlyingURL];
    uint64_t v8 = [v4 underlyingURL];
    char v6 = [v7 isEqual:v8];
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (NSString)referrerApplicationName
{
  return self->_referrerApplicationName;
}

- (void)setReferrerApplicationName:(id)a3
{
}

- (NSString)referrerURLString
{
  return self->_referrerURLString;
}

- (void)setReferrerURLString:(id)a3
{
}

- (NSURL)underlyingURL
{
  return self->_url;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_referrerURLString, 0);
  objc_storeStrong((id *)&self->_referrerApplicationName, 0);

  objc_storeStrong((id *)&self->_queryDictionary, 0);
}

- (void)initWithURL:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  int v0 = 136446210;
  v1 = "-[SKUIURL initWithURL:]";
}

@end