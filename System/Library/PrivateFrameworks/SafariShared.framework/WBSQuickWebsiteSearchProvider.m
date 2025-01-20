@interface WBSQuickWebsiteSearchProvider
- (NSDate)dateAdded;
- (NSDate)dateOfLastSearch;
- (NSString)displayName;
- (NSString)hostname;
- (NSString)openSearchDescriptionURLString;
- (NSString)sourcePageURLString;
- (WBSOpenSearchDescription)openSearchDescription;
- (WBSOpenSearchURLTemplate)searchURLTemplate;
- (WBSOpenSearchURLTemplate)searchURLTemplateFromForm;
- (WBSOpenSearchURLTemplate)urlTemplateForSuggestionsInJSON;
- (WBSQuickWebsiteSearchProvider)initWithDictionaryRepresentation:(id)a3 delegate:(id)a4;
- (WBSQuickWebsiteSearchProvider)initWithSourcePageURLString:(id)a3 openSearchDescriptionURLString:(id)a4 delegate:(id)a5;
- (WBSQuickWebsiteSearchProvider)initWithSourcePageURLString:(id)a3 searchURLTemplateFromForm:(id)a4 delegate:(id)a5;
- (id)debugDescription;
- (id)dictionaryRepresentation;
- (void)setDateOfLastSearch:(id)a3;
- (void)setOpenSearchDescriptionURLString:(id)a3;
- (void)setSearchURLTemplateFromForm:(id)a3;
@end

@implementation WBSQuickWebsiteSearchProvider

- (WBSQuickWebsiteSearchProvider)initWithDictionaryRepresentation:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v25.receiver = self;
  v25.super_class = (Class)WBSQuickWebsiteSearchProvider;
  v8 = [(WBSQuickWebsiteSearchProvider *)&v25 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    v10 = objc_msgSend(v6, "safari_stringForKey:", @"SourcePageURLString");
    v11 = objc_msgSend(v6, "safari_stringForKey:", @"SearchURLTemplateStringFromForm");
    v12 = objc_msgSend(v6, "safari_stringForKey:", @"OpenSearchDescriptionURLString");
    if ([v10 length] && (objc_msgSend(v11, "length") || objc_msgSend(v12, "length")))
    {
      uint64_t v13 = [v10 copy];
      sourcePageURLString = v9->_sourcePageURLString;
      v9->_sourcePageURLString = (NSString *)v13;

      v15 = [[WBSOpenSearchURLTemplate alloc] initWithString:v11];
      searchURLTemplateFromForm = v9->_searchURLTemplateFromForm;
      v9->_searchURLTemplateFromForm = v15;

      uint64_t v17 = [v12 copy];
      openSearchDescriptionURLString = v9->_openSearchDescriptionURLString;
      v9->_openSearchDescriptionURLString = (NSString *)v17;

      uint64_t v19 = objc_msgSend(v6, "safari_dateForKey:", @"DateAdded");
      dateAdded = v9->_dateAdded;
      v9->_dateAdded = (NSDate *)v19;

      uint64_t v21 = objc_msgSend(v6, "safari_dateForKey:", @"DateOfLastSearch");
      dateOfLastSearch = v9->_dateOfLastSearch;
      v9->_dateOfLastSearch = (NSDate *)v21;

      v23 = v9;
    }
    else
    {
      v23 = 0;
    }
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (WBSQuickWebsiteSearchProvider)initWithSourcePageURLString:(id)a3 searchURLTemplateFromForm:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v19.receiver = self;
  v19.super_class = (Class)WBSQuickWebsiteSearchProvider;
  v11 = [(WBSQuickWebsiteSearchProvider *)&v19 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    uint64_t v13 = [v8 copy];
    sourcePageURLString = v12->_sourcePageURLString;
    v12->_sourcePageURLString = (NSString *)v13;

    objc_storeStrong((id *)&v12->_searchURLTemplateFromForm, a4);
    uint64_t v15 = [MEMORY[0x1E4F1C9C8] date];
    dateAdded = v12->_dateAdded;
    v12->_dateAdded = (NSDate *)v15;

    uint64_t v17 = v12;
  }

  return v12;
}

- (WBSQuickWebsiteSearchProvider)initWithSourcePageURLString:(id)a3 openSearchDescriptionURLString:(id)a4 delegate:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v21.receiver = self;
  v21.super_class = (Class)WBSQuickWebsiteSearchProvider;
  v11 = [(WBSQuickWebsiteSearchProvider *)&v21 init];
  v12 = v11;
  if (v11)
  {
    objc_storeWeak((id *)&v11->_delegate, v10);
    uint64_t v13 = [v8 copy];
    sourcePageURLString = v12->_sourcePageURLString;
    v12->_sourcePageURLString = (NSString *)v13;

    uint64_t v15 = [v9 copy];
    openSearchDescriptionURLString = v12->_openSearchDescriptionURLString;
    v12->_openSearchDescriptionURLString = (NSString *)v15;

    uint64_t v17 = [MEMORY[0x1E4F1C9C8] date];
    dateAdded = v12->_dateAdded;
    v12->_dateAdded = (NSDate *)v17;

    objc_super v19 = v12;
  }

  return v12;
}

- (WBSOpenSearchDescription)openSearchDescription
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = [WeakRetained quickWebsiteSearchProvider:self openSearchDescriptionForOpenSearchDescriptionURLString:self->_openSearchDescriptionURLString];

  return (WBSOpenSearchDescription *)v4;
}

- (WBSOpenSearchURLTemplate)searchURLTemplate
{
  if (!self->_openSearchDescriptionURLString
    || ([(WBSQuickWebsiteSearchProvider *)self openSearchDescription],
        v3 = objc_claimAutoreleasedReturnValue(),
        [v3 searchURLTemplate],
        v4 = (WBSOpenSearchURLTemplate *)objc_claimAutoreleasedReturnValue(),
        v3,
        !v4))
  {
    v4 = self->_searchURLTemplateFromForm;
  }
  return v4;
}

- (WBSOpenSearchURLTemplate)urlTemplateForSuggestionsInJSON
{
  v2 = [(WBSQuickWebsiteSearchProvider *)self openSearchDescription];
  v3 = [v2 urlTemplateForSuggestionsInJSON];

  return (WBSOpenSearchURLTemplate *)v3;
}

- (id)dictionaryRepresentation
{
  v3 = [MEMORY[0x1E4F1CA60] dictionaryWithObject:self->_sourcePageURLString forKey:@"SourcePageURLString"];
  searchURLTemplateFromForm = self->_searchURLTemplateFromForm;
  if (searchURLTemplateFromForm)
  {
    v5 = [(WBSOpenSearchURLTemplate *)searchURLTemplateFromForm templateString];
    [v3 setObject:v5 forKeyedSubscript:@"SearchURLTemplateStringFromForm"];
  }
  if ([(NSString *)self->_openSearchDescriptionURLString length]) {
    [v3 setObject:self->_openSearchDescriptionURLString forKeyedSubscript:@"OpenSearchDescriptionURLString"];
  }
  dateAdded = self->_dateAdded;
  if (dateAdded) {
    [v3 setObject:dateAdded forKeyedSubscript:@"DateAdded"];
  }
  dateOfLastSearch = self->_dateOfLastSearch;
  if (dateOfLastSearch) {
    [v3 setObject:dateOfLastSearch forKeyedSubscript:@"DateOfLastSearch"];
  }
  return v3;
}

- (NSString)displayName
{
  displayName = self->_displayName;
  if (!displayName)
  {
    v4 = [(NSString *)self->_sourcePageURLString safari_simplifiedUserVisibleURLStringWithSimplifications:511 forDisplayOnly:1 simplifiedStringOffset:0];
    v5 = self->_displayName;
    self->_displayName = v4;

    displayName = self->_displayName;
  }
  return displayName;
}

- (NSString)hostname
{
  hostname = self->_hostname;
  if (!hostname)
  {
    v4 = [MEMORY[0x1E4F1CB10] URLWithString:self->_sourcePageURLString];
    v5 = [v4 host];
    id v6 = self->_hostname;
    self->_hostname = v5;

    hostname = self->_hostname;
  }
  return hostname;
}

- (id)debugDescription
{
  v3 = NSString;
  v4 = (objc_class *)objc_opt_class();
  v5 = NSStringFromClass(v4);
  id v6 = [(WBSQuickWebsiteSearchProvider *)self displayName];
  id v7 = [v3 stringWithFormat:@"<%@: %p display name = %@>", v5, self, v6];;

  return v7;
}

- (NSString)sourcePageURLString
{
  return self->_sourcePageURLString;
}

- (NSDate)dateAdded
{
  return self->_dateAdded;
}

- (WBSOpenSearchURLTemplate)searchURLTemplateFromForm
{
  return self->_searchURLTemplateFromForm;
}

- (void)setSearchURLTemplateFromForm:(id)a3
{
}

- (NSString)openSearchDescriptionURLString
{
  return self->_openSearchDescriptionURLString;
}

- (void)setOpenSearchDescriptionURLString:(id)a3
{
}

- (NSDate)dateOfLastSearch
{
  return self->_dateOfLastSearch;
}

- (void)setDateOfLastSearch:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_dateOfLastSearch, 0);
  objc_storeStrong((id *)&self->_openSearchDescriptionURLString, 0);
  objc_storeStrong((id *)&self->_searchURLTemplateFromForm, 0);
  objc_storeStrong((id *)&self->_dateAdded, 0);
  objc_storeStrong((id *)&self->_sourcePageURLString, 0);
  objc_storeStrong((id *)&self->_hostname, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end