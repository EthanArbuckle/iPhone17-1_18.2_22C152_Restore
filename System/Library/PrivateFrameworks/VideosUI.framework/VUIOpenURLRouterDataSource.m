@interface VUIOpenURLRouterDataSource
+ (id)routerDataSourceWithDict:(id)a3 appContext:(id)a4;
- (BOOL)actionFirst;
- (NSArray)documentDataSources;
- (NSDictionary)localLibraryLink;
- (NSString)nativePageName;
- (NSString)tabIdentifier;
- (VUIAction)action;
- (VUIAction)postAction;
- (void)setAction:(id)a3;
- (void)setActionFirst:(BOOL)a3;
- (void)setDocumentDataSources:(id)a3;
- (void)setLocalLibraryLink:(id)a3;
- (void)setNativePageName:(id)a3;
- (void)setPostAction:(id)a3;
- (void)setTabIdentifier:(id)a3;
@end

@implementation VUIOpenURLRouterDataSource

+ (id)routerDataSourceWithDict:(id)a3 appContext:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  v7 = objc_msgSend(v5, "vui_arrayForKey:", @"documentDataSources");
  v35 = v7;
  if ([v7 count])
  {
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v7, "count"));
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v38;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v38 != v12) {
            objc_enumerationMutation(v9);
          }
          v14 = +[VUIDocumentDataSource documentDataSourceWithDictionary:*(void *)(*((void *)&v37 + 1) + 8 * i)];
          if (v14) {
            [v8 addObject:v14];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v37 objects:v41 count:16];
      }
      while (v11);
    }
  }
  else
  {
    v8 = 0;
  }
  v15 = objc_msgSend(v5, "vui_dictionaryForKey:", @"actionDataSource");
  v16 = +[VUIAction actionWithDictionary:v15 appContext:v6];
  v17 = objc_msgSend(v5, "vui_dictionaryForKey:", @"postActionDataSource");
  v36 = v6;
  v18 = +[VUIAction actionWithDictionary:v17 appContext:v6];
  v19 = objc_msgSend(v5, "vui_stringForKey:", @"tabIdentifier");
  v20 = objc_msgSend(v5, "vui_stringForKey:", @"nativePageSource");
  v21 = objc_msgSend(v5, "vui_dictionaryForKey:", @"localLibraryDataSource");
  unsigned int v22 = objc_msgSend(v5, "vui_BOOLForKey:defaultValue:", @"actionFirst", 0);
  if (v16 || [v8 count] || v19 || v21 || v20)
  {
    unsigned int v33 = v22;
    v23 = objc_opt_new();
    v34 = v21;
    id v24 = v5;
    v25 = v20;
    v26 = v19;
    v27 = v16;
    v28 = v18;
    v29 = v17;
    v30 = v15;
    v31 = (void *)[v8 copy];
    [v23 setDocumentDataSources:v31];

    v15 = v30;
    v17 = v29;
    v18 = v28;
    v16 = v27;
    v19 = v26;
    v20 = v25;
    id v5 = v24;
    v21 = v34;
    [v23 setAction:v16];
    [v23 setPostAction:v18];
    [v23 setTabIdentifier:v19];
    [v23 setNativePageName:v20];
    [v23 setLocalLibraryLink:v34];
    [v23 setActionFirst:v33];
  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (NSArray)documentDataSources
{
  return self->_documentDataSources;
}

- (void)setDocumentDataSources:(id)a3
{
}

- (VUIAction)action
{
  return self->_action;
}

- (void)setAction:(id)a3
{
}

- (VUIAction)postAction
{
  return self->_postAction;
}

- (void)setPostAction:(id)a3
{
}

- (NSString)tabIdentifier
{
  return self->_tabIdentifier;
}

- (void)setTabIdentifier:(id)a3
{
}

- (NSDictionary)localLibraryLink
{
  return self->_localLibraryLink;
}

- (void)setLocalLibraryLink:(id)a3
{
}

- (NSString)nativePageName
{
  return self->_nativePageName;
}

- (void)setNativePageName:(id)a3
{
}

- (BOOL)actionFirst
{
  return self->_actionFirst;
}

- (void)setActionFirst:(BOOL)a3
{
  self->_actionFirst = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nativePageName, 0);
  objc_storeStrong((id *)&self->_localLibraryLink, 0);
  objc_storeStrong((id *)&self->_tabIdentifier, 0);
  objc_storeStrong((id *)&self->_postAction, 0);
  objc_storeStrong((id *)&self->_action, 0);
  objc_storeStrong((id *)&self->_documentDataSources, 0);
}

@end