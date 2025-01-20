@interface VUIDocumentPreFetchedDataPlayerHUD
- (BOOL)includeMultiviewButton;
- (BOOL)isMultiviewPlayer;
- (BOOL)playFromStart;
- (NSArray)excludedCanonicals;
- (NSArray)multiviewIdentifiers;
- (NSString)canonicalId;
- (NSString)locale;
- (NSString)tabId;
- (NSString)title;
- (VUIDocumentPreFetchedDataPlayerHUD)initWithDictionary:(id)a3;
- (id)jsonData;
- (void)setCanonicalId:(id)a3;
- (void)setExcludedCanonicals:(id)a3;
- (void)setIncludeMultiviewButton:(BOOL)a3;
- (void)setIsMultiviewPlayer:(BOOL)a3;
- (void)setLocale:(id)a3;
- (void)setMultiviewIdentifiers:(id)a3;
- (void)setPlayFromStart:(BOOL)a3;
- (void)setTabId:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation VUIDocumentPreFetchedDataPlayerHUD

- (VUIDocumentPreFetchedDataPlayerHUD)initWithDictionary:(id)a3
{
  id v4 = a3;
  v13.receiver = self;
  v13.super_class = (Class)VUIDocumentPreFetchedDataPlayerHUD;
  v5 = [(VUIDocumentPreFetchedData *)&v13 initWithDictionary:v4];
  if (v5)
  {
    v6 = [v4 objectForKey:@"tabId"];
    if (v6) {
      [(VUIDocumentPreFetchedDataPlayerHUD *)v5 setTabId:v6];
    }
    v7 = [v4 objectForKey:@"title"];
    if (v7) {
      [(VUIDocumentPreFetchedDataPlayerHUD *)v5 setTitle:v7];
    }
    v8 = [v4 objectForKey:@"canonicalId"];
    if (v8) {
      [(VUIDocumentPreFetchedDataPlayerHUD *)v5 setCanonicalId:v8];
    }
    -[VUIDocumentPreFetchedDataPlayerHUD setIsMultiviewPlayer:](v5, "setIsMultiviewPlayer:", objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"isMultiviewPlayer", 0));
    -[VUIDocumentPreFetchedDataPlayerHUD setPlayFromStart:](v5, "setPlayFromStart:", objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"playFromStart", 0));
    -[VUIDocumentPreFetchedDataPlayerHUD setIncludeMultiviewButton:](v5, "setIncludeMultiviewButton:", objc_msgSend(v4, "vui_BOOLForKey:defaultValue:", @"includeMultiviewButton", 0));
    v9 = [v4 objectForKey:@"locale"];
    [(VUIDocumentPreFetchedDataPlayerHUD *)v5 setLocale:v9];

    v10 = [v4 objectForKey:@"multiviewIdentifiers"];
    [(VUIDocumentPreFetchedDataPlayerHUD *)v5 setMultiviewIdentifiers:v10];

    v11 = [v4 objectForKey:@"excludedCanonicals"];
    if (v11) {
      [(VUIDocumentPreFetchedDataPlayerHUD *)v5 setExcludedCanonicals:v11];
    }
  }
  return v5;
}

- (id)jsonData
{
  v3 = objc_opt_new();
  id v4 = [(VUIDocumentPreFetchedDataPlayerHUD *)self tabId];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v4, @"tabId");

  v5 = [(VUIDocumentPreFetchedDataPlayerHUD *)self title];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v5, @"title");

  v6 = [(VUIDocumentPreFetchedDataPlayerHUD *)self canonicalId];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v6, @"canonicalId");

  v7 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIDocumentPreFetchedDataPlayerHUD isMultiviewPlayer](self, "isMultiviewPlayer"));
  [v3 setObject:v7 forKey:@"isMultiviewPlayer"];

  v8 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIDocumentPreFetchedDataPlayerHUD playFromStart](self, "playFromStart"));
  [v3 setObject:v8 forKey:@"playFromStart"];

  v9 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithBool:", -[VUIDocumentPreFetchedDataPlayerHUD includeMultiviewButton](self, "includeMultiviewButton"));
  [v3 setObject:v9 forKey:@"includeMultiviewButton"];

  v10 = [(VUIDocumentPreFetchedDataPlayerHUD *)self multiviewIdentifiers];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v10, @"multiviewIdentifiers");

  v11 = [(VUIDocumentPreFetchedDataPlayerHUD *)self locale];
  objc_msgSend(v3, "vui_setObjectIfNotNil:forKey:", v11, @"locale");

  uint64_t v12 = [(VUIDocumentPreFetchedDataPlayerHUD *)self excludedCanonicals];
  objc_super v13 = (void *)v12;
  v14 = (void *)MEMORY[0x1E4F1CBF0];
  if (v12) {
    v14 = (void *)v12;
  }
  id v15 = v14;

  [v3 setObject:v15 forKey:@"excludedCanonicals"];
  v16 = (void *)[v3 copy];

  return v16;
}

- (NSString)canonicalId
{
  return self->_canonicalId;
}

- (void)setCanonicalId:(id)a3
{
}

- (NSString)tabId
{
  return self->_tabId;
}

- (void)setTabId:(id)a3
{
}

- (NSString)title
{
  return self->_title;
}

- (void)setTitle:(id)a3
{
}

- (BOOL)isMultiviewPlayer
{
  return self->_isMultiviewPlayer;
}

- (void)setIsMultiviewPlayer:(BOOL)a3
{
  self->_isMultiviewPlayer = a3;
}

- (NSString)locale
{
  return self->_locale;
}

- (void)setLocale:(id)a3
{
}

- (BOOL)playFromStart
{
  return self->_playFromStart;
}

- (void)setPlayFromStart:(BOOL)a3
{
  self->_playFromStart = a3;
}

- (BOOL)includeMultiviewButton
{
  return self->_includeMultiviewButton;
}

- (void)setIncludeMultiviewButton:(BOOL)a3
{
  self->_includeMultiviewButton = a3;
}

- (NSArray)excludedCanonicals
{
  return self->_excludedCanonicals;
}

- (void)setExcludedCanonicals:(id)a3
{
}

- (NSArray)multiviewIdentifiers
{
  return self->_multiviewIdentifiers;
}

- (void)setMultiviewIdentifiers:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_multiviewIdentifiers, 0);
  objc_storeStrong((id *)&self->_excludedCanonicals, 0);
  objc_storeStrong((id *)&self->_locale, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_tabId, 0);
  objc_storeStrong((id *)&self->_canonicalId, 0);
}

@end