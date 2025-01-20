@interface QuickWebsiteSearchQuery
- (NSString)searchTerms;
- (NSString)websiteNamePrefix;
- (QuickWebsiteSearchQuery)initWithUserEnteredQuery:(id)a3;
- (WBSCompletionQuery)completionQuery;
@end

@implementation QuickWebsiteSearchQuery

- (QuickWebsiteSearchQuery)initWithUserEnteredQuery:(id)a3
{
  id v5 = a3;
  v21.receiver = self;
  v21.super_class = (Class)QuickWebsiteSearchQuery;
  v6 = [(QuickWebsiteSearchQuery *)&v21 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_completionQuery, a3);
    v8 = [v5 queryString];
    v9 = objc_msgSend(v8, "safari_stringByTrimmingWhitespace");

    uint64_t v10 = [v9 rangeOfString:@" "];
    if (v11)
    {
      uint64_t v12 = v10;
      uint64_t v13 = v11;
      uint64_t v14 = [v9 substringToIndex:v10];
      websiteNamePrefix = v7->_websiteNamePrefix;
      v7->_websiteNamePrefix = (NSString *)v14;

      if ([v9 length] <= (unint64_t)(v12 + v13))
      {
LABEL_7:
        v19 = v7;

        goto LABEL_8;
      }
      uint64_t v16 = objc_msgSend(v9, "substringFromIndex:");
      searchTerms = v7->_searchTerms;
      v7->_searchTerms = (NSString *)v16;
    }
    else
    {
      v18 = v9;
      searchTerms = v7->_websiteNamePrefix;
      v7->_websiteNamePrefix = v18;
    }

    goto LABEL_7;
  }
LABEL_8:

  return v7;
}

- (NSString)websiteNamePrefix
{
  return self->_websiteNamePrefix;
}

- (NSString)searchTerms
{
  return self->_searchTerms;
}

- (WBSCompletionQuery)completionQuery
{
  return self->_completionQuery;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_completionQuery, 0);
  objc_storeStrong((id *)&self->_searchTerms, 0);
  objc_storeStrong((id *)&self->_websiteNamePrefix, 0);
}

@end