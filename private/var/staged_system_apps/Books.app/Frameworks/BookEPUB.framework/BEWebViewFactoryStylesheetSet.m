@interface BEWebViewFactoryStylesheetSet
- (BEWebViewFactoryStylesheetSet)init;
- (BEWebViewFactoryStylesheetSet)initWithAllFrameStylesheets:(id)a3;
- (BEWebViewFactoryStylesheetSet)initWithMainframeOnlyStylesheets:(id)a3;
- (BEWebViewFactoryStylesheetSet)initWithMainframeOnlyStylesheets:(id)a3 allFrameStylesheets:(id)a4;
- (BEWebViewFactoryStylesheetSet)initWithMainframeOnlyStylesheets:(id)a3 allFrameStylesheets:(id)a4 variableStylesheets:(id)a5 documentAttributes:(id)a6;
- (BOOL)isEqual:(id)a3;
- (NSArray)allFrameStylesheets;
- (NSArray)mainframeOnlyStylesheets;
- (NSArray)variableStylesheets;
- (NSDictionary)documentAttributes;
- (NSString)unifedAllFrameStylesheet;
- (WKContentWorld)allFrameContentWorld;
- (WKContentWorld)mainframeContentWorld;
- (WKContentWorld)variableContentWorld;
- (id)description;
- (void)_addStylesheetSetToUserContentController:(id)a3 includeMainframe:(BOOL)a4 includeAllFrame:(BOOL)a5 includeVariable:(BOOL)a6;
- (void)applyToUserContentController:(id)a3;
- (void)applyToWebView:(id)a3;
- (void)applyVariableStylesheetsToWebView:(id)a3;
- (void)setAllFrameContentWorld:(id)a3;
- (void)setMainframeContentWorld:(id)a3;
- (void)setVariableContentWorld:(id)a3;
@end

@implementation BEWebViewFactoryStylesheetSet

- (BEWebViewFactoryStylesheetSet)init
{
  return [(BEWebViewFactoryStylesheetSet *)self initWithAllFrameStylesheets:&__NSArray0__struct];
}

- (BEWebViewFactoryStylesheetSet)initWithMainframeOnlyStylesheets:(id)a3
{
  return [(BEWebViewFactoryStylesheetSet *)self initWithMainframeOnlyStylesheets:a3 allFrameStylesheets:&__NSArray0__struct];
}

- (BEWebViewFactoryStylesheetSet)initWithAllFrameStylesheets:(id)a3
{
  return [(BEWebViewFactoryStylesheetSet *)self initWithMainframeOnlyStylesheets:&__NSArray0__struct allFrameStylesheets:a3];
}

- (BEWebViewFactoryStylesheetSet)initWithMainframeOnlyStylesheets:(id)a3 allFrameStylesheets:(id)a4
{
  return [(BEWebViewFactoryStylesheetSet *)self initWithMainframeOnlyStylesheets:a3 allFrameStylesheets:a4 variableStylesheets:&__NSArray0__struct documentAttributes:&__NSDictionary0__struct];
}

- (BEWebViewFactoryStylesheetSet)initWithMainframeOnlyStylesheets:(id)a3 allFrameStylesheets:(id)a4 variableStylesheets:(id)a5 documentAttributes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v24.receiver = self;
  v24.super_class = (Class)BEWebViewFactoryStylesheetSet;
  v14 = [(BEWebViewFactoryStylesheetSet *)&v24 init];
  if (v14)
  {
    v15 = (NSArray *)[v10 copy];
    mainframeOnlyStylesheets = v14->_mainframeOnlyStylesheets;
    v14->_mainframeOnlyStylesheets = v15;

    v17 = (NSArray *)[v11 copy];
    allFrameStylesheets = v14->_allFrameStylesheets;
    v14->_allFrameStylesheets = v17;

    v19 = (NSArray *)[v12 copy];
    variableStylesheets = v14->_variableStylesheets;
    v14->_variableStylesheets = v19;

    v21 = (NSDictionary *)[v13 copy];
    documentAttributes = v14->_documentAttributes;
    v14->_documentAttributes = v21;
  }
  return v14;
}

- (NSString)unifedAllFrameStylesheet
{
  v2 = [(BEWebViewFactoryStylesheetSet *)self allFrameStylesheets];
  v3 = [v2 componentsJoinedByString:@"\n"];

  return (NSString *)v3;
}

- (void)applyToWebView:(id)a3
{
  id v5 = [a3 configuration];
  v4 = [v5 userContentController];
  [(BEWebViewFactoryStylesheetSet *)self _addStylesheetSetToUserContentController:v4 includeMainframe:1 includeAllFrame:1 includeVariable:1];
}

- (void)applyToUserContentController:(id)a3
{
}

- (void)applyVariableStylesheetsToWebView:(id)a3
{
  id v5 = [a3 configuration];
  v4 = [v5 userContentController];
  [(BEWebViewFactoryStylesheetSet *)self _addStylesheetSetToUserContentController:v4 includeMainframe:0 includeAllFrame:0 includeVariable:1];
}

- (BOOL)isEqual:(id)a3
{
  if (a3 == self) {
    return 1;
  }
  id v4 = a3;
  objc_opt_class();
  id v5 = BUDynamicCast();

  if (v5)
  {
    v6 = [(BEWebViewFactoryStylesheetSet *)self mainframeOnlyStylesheets];
    v7 = [v5 mainframeOnlyStylesheets];
    if ([v6 isEqual:v7])
    {
      v8 = [(BEWebViewFactoryStylesheetSet *)self allFrameStylesheets];
      v9 = [v5 allFrameStylesheets];
      if ([v8 isEqual:v9])
      {
        id v10 = [(BEWebViewFactoryStylesheetSet *)self variableStylesheets];
        id v11 = [v5 variableStylesheets];
        if ([v10 isEqual:v11])
        {
          id v12 = [(BEWebViewFactoryStylesheetSet *)self documentAttributes];
          id v13 = [v5 documentAttributes];
          unsigned __int8 v14 = [v12 isEqual:v13];
        }
        else
        {
          unsigned __int8 v14 = 0;
        }
      }
      else
      {
        unsigned __int8 v14 = 0;
      }
    }
    else
    {
      unsigned __int8 v14 = 0;
    }
  }
  else
  {
    unsigned __int8 v14 = 0;
  }

  return v14;
}

- (id)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(BEWebViewFactoryStylesheetSet *)self mainframeOnlyStylesheets];
  v6 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
  v7 = [(BEWebViewFactoryStylesheetSet *)self allFrameStylesheets];
  v8 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
  v9 = [(BEWebViewFactoryStylesheetSet *)self variableStylesheets];
  id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
  id v11 = [(BEWebViewFactoryStylesheetSet *)self documentAttributes];
  id v12 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 count]);
  id v13 = +[NSString stringWithFormat:@"<%@ %p mainframeOnlyStylesheets=[%@ items] allFrameStylesheets=[%@ items] variableStylesheets=[%@ items] documentAttributes=[%@ items]>", v4, self, v6, v8, v10, v12];

  return v13;
}

- (WKContentWorld)mainframeContentWorld
{
  mainframeContentWorld = self->_mainframeContentWorld;
  if (!mainframeContentWorld)
  {
    id v4 = +[WKContentWorld worldWithName:@"BEWebViewFactoryStylesheetSet.mainframe"];
    id v5 = self->_mainframeContentWorld;
    self->_mainframeContentWorld = v4;

    mainframeContentWorld = self->_mainframeContentWorld;
  }

  return mainframeContentWorld;
}

- (WKContentWorld)allFrameContentWorld
{
  allFrameContentWorld = self->_allFrameContentWorld;
  if (!allFrameContentWorld)
  {
    id v4 = +[WKContentWorld worldWithName:@"BEWebViewFactoryStylesheetSet.allFrame"];
    id v5 = self->_allFrameContentWorld;
    self->_allFrameContentWorld = v4;

    allFrameContentWorld = self->_allFrameContentWorld;
  }

  return allFrameContentWorld;
}

- (WKContentWorld)variableContentWorld
{
  variableContentWorld = self->_variableContentWorld;
  if (!variableContentWorld)
  {
    id v4 = +[WKContentWorld worldWithName:@"BEWebViewFactoryStylesheetSet.variable"];
    id v5 = self->_variableContentWorld;
    self->_variableContentWorld = v4;

    variableContentWorld = self->_variableContentWorld;
  }

  return variableContentWorld;
}

- (void)_addStylesheetSetToUserContentController:(id)a3 includeMainframe:(BOOL)a4 includeAllFrame:(BOOL)a5 includeVariable:(BOOL)a6
{
  BOOL v40 = a6;
  BOOL v6 = a5;
  BOOL v7 = a4;
  id v9 = a3;
  if (v7)
  {
    id v10 = [(BEWebViewFactoryStylesheetSet *)self mainframeContentWorld];
    [v9 _removeAllUserStyleSheetsAssociatedWithContentWorld:v10];

    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v11 = self->_mainframeOnlyStylesheets;
    id v12 = [(NSArray *)v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
    if (v12)
    {
      id v13 = v12;
      uint64_t v14 = *(void *)v50;
      do
      {
        for (i = 0; i != v13; i = (char *)i + 1)
        {
          if (*(void *)v50 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          id v17 = objc_alloc((Class)_WKUserStyleSheet);
          v18 = [(BEWebViewFactoryStylesheetSet *)self mainframeContentWorld];
          id v19 = [v17 initWithSource:v16 forWKWebView:0 forMainFrameOnly:1 includeMatchPatternStrings:0 excludeMatchPatternStrings:0 baseURL:0 level:0 contentWorld:v18];

          [v9 _addUserStyleSheet:v19];
        }
        id v13 = [(NSArray *)v11 countByEnumeratingWithState:&v49 objects:v55 count:16];
      }
      while (v13);
    }
  }
  if (v6)
  {
    v20 = [(BEWebViewFactoryStylesheetSet *)self allFrameContentWorld];
    [v9 _removeAllUserStyleSheetsAssociatedWithContentWorld:v20];

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    v21 = self->_allFrameStylesheets;
    id v22 = [(NSArray *)v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
    if (v22)
    {
      id v23 = v22;
      uint64_t v24 = *(void *)v46;
      do
      {
        for (j = 0; j != v23; j = (char *)j + 1)
        {
          if (*(void *)v46 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void *)(*((void *)&v45 + 1) + 8 * (void)j);
          id v27 = objc_alloc((Class)_WKUserStyleSheet);
          v28 = [(BEWebViewFactoryStylesheetSet *)self allFrameContentWorld];
          id v29 = [v27 initWithSource:v26 forWKWebView:0 forMainFrameOnly:0 includeMatchPatternStrings:0 excludeMatchPatternStrings:0 baseURL:0 level:0 contentWorld:v28];

          [v9 _addUserStyleSheet:v29];
        }
        id v23 = [(NSArray *)v21 countByEnumeratingWithState:&v45 objects:v54 count:16];
      }
      while (v23);
    }
  }
  if (v40)
  {
    v30 = [(BEWebViewFactoryStylesheetSet *)self variableContentWorld];
    [v9 _removeAllUserStyleSheetsAssociatedWithContentWorld:v30];

    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    v31 = self->_variableStylesheets;
    id v32 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
    if (v32)
    {
      id v33 = v32;
      uint64_t v34 = *(void *)v42;
      do
      {
        for (k = 0; k != v33; k = (char *)k + 1)
        {
          if (*(void *)v42 != v34) {
            objc_enumerationMutation(v31);
          }
          uint64_t v36 = *(void *)(*((void *)&v41 + 1) + 8 * (void)k);
          id v37 = objc_alloc((Class)_WKUserStyleSheet);
          v38 = [(BEWebViewFactoryStylesheetSet *)self variableContentWorld];
          id v39 = [v37 initWithSource:v36 forWKWebView:0 forMainFrameOnly:0 includeMatchPatternStrings:0 excludeMatchPatternStrings:0 baseURL:0 level:0 contentWorld:v38];

          [v9 _addUserStyleSheet:v39];
        }
        id v33 = [(NSArray *)v31 countByEnumeratingWithState:&v41 objects:v53 count:16];
      }
      while (v33);
    }
  }
}

- (NSArray)mainframeOnlyStylesheets
{
  return self->_mainframeOnlyStylesheets;
}

- (NSArray)allFrameStylesheets
{
  return self->_allFrameStylesheets;
}

- (NSArray)variableStylesheets
{
  return self->_variableStylesheets;
}

- (NSDictionary)documentAttributes
{
  return self->_documentAttributes;
}

- (void)setMainframeContentWorld:(id)a3
{
}

- (void)setAllFrameContentWorld:(id)a3
{
}

- (void)setVariableContentWorld:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_variableContentWorld, 0);
  objc_storeStrong((id *)&self->_allFrameContentWorld, 0);
  objc_storeStrong((id *)&self->_mainframeContentWorld, 0);
  objc_storeStrong((id *)&self->_documentAttributes, 0);
  objc_storeStrong((id *)&self->_variableStylesheets, 0);
  objc_storeStrong((id *)&self->_allFrameStylesheets, 0);

  objc_storeStrong((id *)&self->_mainframeOnlyStylesheets, 0);
}

@end