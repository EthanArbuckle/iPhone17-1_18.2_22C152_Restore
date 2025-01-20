@interface RUITopLevelElementParser
+ (id)rowWithAttributeDict:(id)a3 delegate:(id)a4 parent:(id)a5;
+ (id)tableRowClassForElementName:(id)a3;
+ (id)textStyleForString:(id)a3;
+ (int64_t)textAlignmentForString:(id)a3;
- (BOOL)_isParsingSwiftUI;
- (BOOL)_isParsingTable;
- (RUIObjectModel)objectModel;
- (RUITopLevelElementParser)initWithXMLElement:(id)a3 elementProvider:(id)a4 objectModel:(id)a5 delegate:(id)a6;
- (RUITopLevelElementParserDelegate)delegate;
- (RUITopLevelElementProvider)elementProvider;
- (RUITopLevelPageElement)primaryElement;
- (RUIXMLElement)xmlElement;
- (id)_createPageWithName:(id)a3 attributes:(id)a4;
- (id)_lastRow;
- (id)_newRowWithAttributeDict:(id)a3;
- (id)_newRowWithAttributeDict:(id)a3 tableViewOM:(id)a4;
- (id)baseURL;
- (id)page;
- (void)_addNavigationBarWithAttributes:(id)a3;
- (void)_addNavigationBarWithAttributes:(id)a3 toPage:(id)a4;
- (void)_addSectionWithAttributes:(id)a3;
- (void)_addSectionWithAttributes:(id)a3 toTableViewOM:(id)a4;
- (void)_finalizeElement:(id)a3;
- (void)_finalizePinView;
- (void)_finalizeSection;
- (void)_logDeprecation:(id)a3 value:(id)a4;
- (void)parse;
- (void)setDelegate:(id)a3;
- (void)setElementProvider:(id)a3;
- (void)setObjectModel:(id)a3;
- (void)setPrimaryElement:(id)a3;
- (void)setXmlElement:(id)a3;
- (void)traversalDelegateDidEndlement:(id)a3;
- (void)traversalDelegateDidStartElement:(id)a3;
- (void)traversalDelegateFoundCData:(id)a3;
@end

@implementation RUITopLevelElementParser

+ (int64_t)textAlignmentForString:(id)a3
{
  v3 = (__CFString *)a3;
  if ([(__CFString *)v3 length])
  {
    v8.length = [(__CFString *)v3 length];
    v8.location = 0;
    v4 = (__CFString *)CFStringTokenizerCopyBestStringLanguage(v3, v8);
    uint64_t v5 = [MEMORY[0x263EFF960] characterDirectionForLanguage:v4];
    if ([(__CFString *)v3 isEqualToString:@"right"])
    {
      int64_t v6 = 2 * (v5 != 2);
    }
    else
    {
      int64_t v6 = 2 * (v5 == 2);
      if (([(__CFString *)v3 isEqualToString:@"left"] & 1) == 0
        && [(__CFString *)v3 isEqualToString:@"center"])
      {
        int64_t v6 = 1;
      }
    }
  }
  else
  {
    int64_t v6 = 4;
  }

  return v6;
}

+ (id)textStyleForString:(id)a3
{
  id v3 = a3;
  id v4 = (id)*MEMORY[0x263F83570];
  uint64_t v5 = [v3 length];
  int64_t v6 = v4;
  if (v5)
  {
    if ([v3 isEqualToString:@"largeTitle"])
    {
      v7 = (void **)MEMORY[0x263F835E0];
LABEL_21:
      int64_t v6 = *v7;
      goto LABEL_22;
    }
    if ([v3 isEqualToString:@"title1"])
    {
      v7 = (void **)MEMORY[0x263F83610];
      goto LABEL_21;
    }
    if ([v3 isEqualToString:@"title2"])
    {
      v7 = (void **)MEMORY[0x263F83618];
      goto LABEL_21;
    }
    if ([v3 isEqualToString:@"title3"])
    {
      v7 = (void **)MEMORY[0x263F83628];
      goto LABEL_21;
    }
    if ([v3 isEqualToString:@"headline"])
    {
      v7 = (void **)MEMORY[0x263F835D0];
      goto LABEL_21;
    }
    char v8 = [v3 isEqualToString:@"body"];
    int64_t v6 = v4;
    if ((v8 & 1) == 0)
    {
      if ([v3 isEqualToString:@"callout"])
      {
        v7 = (void **)MEMORY[0x263F83580];
        goto LABEL_21;
      }
      if ([v3 isEqualToString:@"subheadline"])
      {
        v7 = (void **)MEMORY[0x263F835F0];
        goto LABEL_21;
      }
      if ([v3 isEqualToString:@"footnote"])
      {
        v7 = (void **)MEMORY[0x263F835B8];
        goto LABEL_21;
      }
      if ([v3 isEqualToString:@"caption1"])
      {
        v7 = (void **)MEMORY[0x263F83588];
        goto LABEL_21;
      }
      if ([v3 isEqualToString:@"caption2"]) {
        int64_t v6 = (void *)*MEMORY[0x263F83590];
      }
      else {
        int64_t v6 = v4;
      }
    }
  }
LABEL_22:
  id v9 = v6;

  return v9;
}

+ (id)tableRowClassForElementName:(id)a3
{
  id v3 = a3;
  if (([v3 hasSuffix:@"Row"] & 1) != 0
    || [v3 hasSuffix:@"row"])
  {
    id v4 = objc_msgSend(v3, "substringToIndex:", objc_msgSend(v3, "length") - 3);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (RUITopLevelElementParser)initWithXMLElement:(id)a3 elementProvider:(id)a4 objectModel:(id)a5 delegate:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  v22.receiver = self;
  v22.super_class = (Class)RUITopLevelElementParser;
  v15 = [(RUITopLevelElementParser *)&v22 init];
  v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_xmlElement, a3);
    objc_storeStrong((id *)&v16->_objectModel, a5);
    objc_storeStrong((id *)&v16->_elementProvider, a4);
    uint64_t v17 = objc_opt_new();
    accumulator = v16->_accumulator;
    v16->_accumulator = (NSMutableString *)v17;

    uint64_t v19 = objc_opt_new();
    elementStack = v16->_elementStack;
    v16->_elementStack = (NSMutableArray *)v19;

    objc_storeWeak((id *)&v16->_delegate, v14);
  }

  return v16;
}

- (void)parse
{
  id v3 = [(RUITopLevelElementParser *)self xmlElement];
  [v3 traverseWithDelegate:self];
}

- (id)baseURL
{
  v2 = [(RUITopLevelElementParser *)self objectModel];
  id v3 = [v2 sourceURL];

  return v3;
}

+ (id)rowWithAttributeDict:(id)a3 delegate:(id)a4 parent:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  v10 = [v7 objectForKeyedSubscript:@"class"];
  if ([v10 isEqualToString:@"customContent"])
  {
    id v11 = off_2642110B0;
    goto LABEL_5;
  }
  if ([v10 isEqualToString:@"swiftUI"])
  {
    id v11 = &off_2642110B8;
LABEL_5:
    id v12 = (RUITableViewRow *)[objc_alloc(*v11) initWithAttributes:v7 parent:v8];
    if (v12) {
      goto LABEL_7;
    }
  }
  id v12 = [(RUIElement *)[RUITableViewRow alloc] initWithAttributes:v7 parent:v8];
LABEL_7:
  [(RUITableViewRow *)v12 setDelegate:v9];

  id v13 = [v8 style];
  [(RUIElement *)v12 setStyle:v13];

  id v14 = [v7 objectForKeyedSubscript:@"checked"];
  -[RUITableViewRow setSelected:](v12, "setSelected:", [v14 BOOLValue]);

  v15 = [v7 objectForKeyedSubscript:@"align"];
  if (![v15 length])
  {
    v18 = [v8 style];
    -[RUITableViewRow setAlignment:](v12, "setAlignment:", [v18 labelRowTextAlignment]);

    goto LABEL_16;
  }
  if ([v15 isEqualToString:@"center"])
  {
    v16 = v12;
    uint64_t v17 = 1;
  }
  else if ([v15 isEqualToString:@"right"])
  {
    v16 = v12;
    uint64_t v17 = 2;
  }
  else
  {
    if (![v15 isEqualToString:@"left"]) {
      goto LABEL_16;
    }
    v16 = v12;
    uint64_t v17 = 0;
  }
  [(RUITableViewRow *)v16 setAlignment:v17];
LABEL_16:

  return v12;
}

- (id)_newRowWithAttributeDict:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(RUITopLevelElementParser *)self elementProvider];
  int64_t v6 = [v5 makeTableViewOM];
  id v7 = [(RUITopLevelElementParser *)self _newRowWithAttributeDict:v4 tableViewOM:v6];

  return v7;
}

- (id)_newRowWithAttributeDict:(id)a3 tableViewOM:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [v5 sections];
  id v8 = [v7 lastObject];

  id v9 = [(id)objc_opt_class() rowWithAttributeDict:v6 delegate:v5 parent:v8];

  [v8 addRow:v9];
  return v9;
}

- (id)page
{
  v2 = [(RUITopLevelElementParser *)self elementProvider];
  id v3 = [v2 parentElement];
  id v4 = [v3 pageElement];
  id v5 = [v4 page];

  return v5;
}

- (id)_lastRow
{
  v2 = [(RUITopLevelElementParser *)self elementProvider];
  id v3 = [v2 makeTableViewOM];
  id v4 = [v3 sections];
  id v5 = [v4 lastObject];

  id v6 = [v5 rows];
  id v7 = [v6 lastObject];

  return v7;
}

- (void)_addNavigationBarWithAttributes:(id)a3
{
  id v4 = a3;
  id v5 = [(RUITopLevelElementParser *)self page];
  [(RUITopLevelElementParser *)self _addNavigationBarWithAttributes:v4 toPage:v5];
}

- (void)_addNavigationBarWithAttributes:(id)a3 toPage:(id)a4
{
  id v10 = a3;
  id v5 = a4;
  id v6 = [v10 objectForKey:@"title"];
  if ([v6 length]) {
    [v5 setNavTitle:v6];
  }
  id v7 = [v10 objectForKey:@"subTitle"];
  if ([v7 length]) {
    [v5 setNavSubTitle:v7];
  }
  id v8 = [v10 objectForKey:@"backButtonTitle"];
  if (v8) {
    [v5 setBackButtonTitle:v8];
  }
  id v9 = [v10 objectForKey:@"hidesBackButton"];
  objc_msgSend(v5, "setHidesBackButton:", objc_msgSend(v9, "BOOLValue"));
}

- (void)_addSectionWithAttributes:(id)a3
{
  id v4 = a3;
  id v6 = [(RUITopLevelElementParser *)self elementProvider];
  id v5 = [v6 makeTableViewOM];
  [(RUITopLevelElementParser *)self _addSectionWithAttributes:v4 toTableViewOM:v5];
}

- (void)_addSectionWithAttributes:(id)a3 toTableViewOM:(id)a4
{
  id v19 = a3;
  id v6 = a4;
  id v7 = [[RUITableViewSection alloc] initWithAttributes:v19 parent:v6];
  [(RUITableViewSection *)v7 setAttributes:v19];
  id v8 = [(RUIObjectModel *)self->_objectModel style];
  [(RUIElement *)v7 setStyle:v8];

  [(RUITableViewSection *)v7 setTableElement:v6];
  id v9 = [v19 objectForKeyedSubscript:@"header"];

  if (v9)
  {
    id v10 = [(RUIElement *)[RUIHeaderElement alloc] initWithAttributes:0 parent:v7];
    id v11 = [v19 objectForKeyedSubscript:@"header"];
    [(RUIElement *)v10 setBody:v11];

    [(RUITableViewSection *)v7 setHeader:v10];
    id v12 = [v19 objectForKeyedSubscript:@"headerHeight"];

    if (v12)
    {
      id v13 = [v19 objectForKeyedSubscript:@"headerHeight"];
      [v13 floatValue];
      [(RUITableViewSection *)v7 setHeaderHeight:v14];
    }
  }
  v15 = [v19 objectForKeyedSubscript:@"footer"];

  if (v15)
  {
    v16 = [(RUIElement *)[RUIFooterElement alloc] initWithAttributes:0 parent:v7];
    uint64_t v17 = [v19 objectForKeyedSubscript:@"footer"];
    [(RUIElement *)v16 setBody:v17];

    [(RUITableViewSection *)v7 setFooter:v16];
  }
  v18 = [v6 sections];
  [v18 addObject:v7];
}

- (void)_logDeprecation:(id)a3 value:(id)a4
{
  uint64_t v21 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [NSString stringWithFormat:@" = \"%@\"", v7];
    id v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v8 = &stru_26C545B50;
  }
  if (_isInternalInstall())
  {
    id v9 = _RUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(RUITopLevelElementParser *)self objectModel];
      id v11 = [v10 sourceURL];
      id v12 = [(NSMutableArray *)self->_elementStack lastObject];
      *(_DWORD *)buf = 138413058;
      float v14 = v11;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      v18 = v8;
      __int16 v19 = 2112;
      v20 = v12;
      _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "Page with baseURL %@ is using deprecated feature \"%@\"%@ in %@ element", buf, 0x2Au);
    }
  }
}

- (void)_finalizePinView
{
  v2 = self;
  uint64_t v55 = *MEMORY[0x263EF8340];
  id v3 = [(RUITopLevelElementParser *)self page];
  id v4 = [v3 passcodeViewOM];
  id v5 = [v4 attributes];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 attributes];
  uint64_t v8 = [(RUIFooterElement *)v7 objectForKeyedSubscript:@"footer"];
  if (v8)
  {
    id v9 = (void *)v8;
    id v10 = [v4 footer];

    if (v10) {
      goto LABEL_25;
    }
    if (_isInternalInstall())
    {
      id v11 = _RUILoggingFacility();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        id v12 = [(RUITopLevelElementParser *)v2 baseURL];
        *(_DWORD *)buf = 138412290;
        v54 = v12;
        _os_log_impl(&dword_2144F2000, v11, OS_LOG_TYPE_DEFAULT, "Page with baseURL %@ is using deprecated pinView attribute 'footer'. Use <footer> instead.", buf, 0xCu);
      }
    }
    id v7 = [(RUIElement *)[RUIFooterElement alloc] initWithAttributes:0 parent:v4];
    [v4 setFooter:v7];
    id v13 = [v4 attributes];
    float v14 = [v13 objectForKeyedSubscript:@"footer"];
    [(RUIElement *)v7 setBody:v14];

    __int16 v15 = [v4 attributes];
    id v16 = [v15 objectForKeyedSubscript:@"footerLinkURL"];

    if (v16)
    {
      __int16 v17 = [v4 attributes];
      v18 = [v17 objectForKeyedSubscript:@"footerLinkURL"];
      [(RUITopLevelElementParser *)v2 _logDeprecation:@"footerLinkURL" value:v18];

      __int16 v19 = [v4 footer];
      v20 = [v19 attributes];
      uint64_t v21 = (void *)[v20 mutableCopy];
      objc_super v22 = v21;
      v46 = v2;
      v47 = v3;
      if (v21) {
        id v23 = v21;
      }
      else {
        id v23 = (id)objc_opt_new();
      }
      v24 = v23;
      v45 = v7;

      v25 = [v4 attributes];
      v26 = [v25 objectForKeyedSubscript:@"footerLinkURL"];
      [v24 setObject:v26 forKeyedSubscript:@"url"];

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v27 = [&unk_26C557FC0 countByEnumeratingWithState:&v48 objects:v52 count:16];
      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v49 != v29) {
              objc_enumerationMutation(&unk_26C557FC0);
            }
            uint64_t v31 = *(void *)(*((void *)&v48 + 1) + 8 * i);
            v32 = [v24 objectForKeyedSubscript:v31];
            if (!v32)
            {
              v33 = [v4 attributes];
              v34 = [v33 objectForKeyedSubscript:v31];

              if (!v34) {
                continue;
              }
              v32 = [v4 attributes];
              v35 = [v32 objectForKeyedSubscript:v31];
              [v24 setObject:v35 forKeyedSubscript:v31];
            }
          }
          uint64_t v28 = [&unk_26C557FC0 countByEnumeratingWithState:&v48 objects:v52 count:16];
        }
        while (v28);
      }
      v36 = [v4 footer];
      [v36 setAttributes:v24];

      v2 = v46;
      id v3 = v47;
      id v7 = v45;
    }
    [v6 removeObjectForKey:@"footer"];
    [v6 removeObjectForKey:@"footerLinkURL"];
  }

LABEL_25:
  v37 = [v4 attributes];
  uint64_t v38 = [(RUIHeaderElement *)v37 objectForKeyedSubscript:@"label"];
  if (!v38)
  {
LABEL_32:

    goto LABEL_33;
  }
  v39 = (void *)v38;
  v40 = [v4 header];

  if (!v40)
  {
    if (_isInternalInstall())
    {
      v41 = _RUILoggingFacility();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        v42 = [(RUITopLevelElementParser *)v2 baseURL];
        *(_DWORD *)buf = 138412290;
        v54 = v42;
        _os_log_impl(&dword_2144F2000, v41, OS_LOG_TYPE_DEFAULT, "Page with baseURL %@ is using deprecated pinView attribute 'label'. Use <header> instead.", buf, 0xCu);
      }
    }
    v37 = [(RUIElement *)[RUIHeaderElement alloc] initWithAttributes:&unk_26C557F70 parent:v4];
    [v4 setHeader:v37];
    v43 = [v4 attributes];
    v44 = [v43 objectForKeyedSubscript:@"label"];
    [(RUIElement *)v37 setBody:v44];

    [v6 removeObjectForKey:@"label"];
    goto LABEL_32;
  }
LABEL_33:
  [v4 setAttributes:v6];
}

- (void)_finalizeSection
{
  id v3 = [(RUITopLevelElementParser *)self elementProvider];
  id v4 = [v3 makeTableViewOM];
  id v5 = [v4 sections];
  id v66 = [v5 lastObject];

  id v6 = [v66 attributes];
  uint64_t v7 = [(RUIHeaderElement *)v6 objectForKeyedSubscript:@"header"];
  if (v7)
  {
    uint64_t v8 = (void *)v7;
    id v9 = [v66 header];

    if (v9) {
      goto LABEL_5;
    }
    id v6 = [(RUIElement *)[RUIHeaderElement alloc] initWithAttributes:0 parent:v66];
    id v10 = [v66 attributes];
    id v11 = [v10 objectForKeyedSubscript:@"header"];
    [(RUIElement *)v6 setBody:v11];

    [v66 setHeader:v6];
  }

LABEL_5:
  id v12 = [v66 attributes];
  uint64_t v13 = [(RUIDetailHeaderElement *)v12 objectForKeyedSubscript:@"detailHeader"];
  if (v13)
  {
    float v14 = (void *)v13;
    __int16 v15 = [v66 detailHeader];

    if (v15) {
      goto LABEL_9;
    }
    id v12 = [(RUIElement *)[RUIDetailHeaderElement alloc] initWithAttributes:0 parent:v66];
    id v16 = [v66 attributes];
    __int16 v17 = [v16 objectForKeyedSubscript:@"detailHeader"];
    [(RUIDetailHeaderElement *)v12 setBody:v17];

    [v66 setDetailHeader:v12];
  }

LABEL_9:
  v18 = [v66 attributes];
  uint64_t v19 = [(RUISubHeaderElement *)v18 objectForKeyedSubscript:@"subHeader"];
  if (v19)
  {
    v20 = (void *)v19;
    uint64_t v21 = [v66 subHeader];

    if (v21) {
      goto LABEL_13;
    }
    v18 = [(RUIElement *)[RUISubHeaderElement alloc] initWithAttributes:0 parent:v66];
    objc_super v22 = [v66 attributes];
    id v23 = [v22 objectForKeyedSubscript:@"subHeader"];
    [(RUIElement *)v18 setBody:v23];

    [v66 setSubHeader:v18];
  }

LABEL_13:
  v24 = [v66 attributes];
  uint64_t v25 = [(RUIFooterElement *)v24 objectForKeyedSubscript:@"footer"];
  if (v25)
  {
    v26 = (void *)v25;
    uint64_t v27 = [v66 footer];

    if (v27) {
      goto LABEL_17;
    }
    v24 = [(RUIElement *)[RUIFooterElement alloc] initWithAttributes:0 parent:v66];
    uint64_t v28 = [v66 attributes];
    uint64_t v29 = [v28 objectForKeyedSubscript:@"footer"];
    [(RUIElement *)v24 setBody:v29];

    [v66 setFooter:v24];
  }

LABEL_17:
  v30 = [v66 header];
  uint64_t v31 = [v30 attributes];

  if (!v31)
  {
    v32 = [v66 attributes];
    v33 = [v66 header];
    [v33 setAttributes:v32];
  }
  v34 = [v66 footer];
  v35 = [v34 attributes];

  if (!v35)
  {
    v36 = [v66 attributes];
    v37 = [v66 footer];
    [v37 setAttributes:v36];
  }
  uint64_t v38 = [v66 footer];
  v39 = [v38 attributes];
  v40 = [v39 objectForKeyedSubscript:@"url"];
  if (v40)
  {
  }
  else
  {
    v41 = [v66 attributes];
    v42 = [v41 objectForKeyedSubscript:@"footerLinkURL"];

    if (!v42) {
      goto LABEL_35;
    }
    v43 = [v66 attributes];
    v44 = [v43 objectForKeyedSubscript:@"footerLinkURL"];
    [(RUITopLevelElementParser *)self _logDeprecation:@"footerLinkURL" value:v44];

    v45 = [v66 footer];
    v46 = [v45 attributes];
    v47 = (void *)[v46 mutableCopy];
    long long v48 = v47;
    if (v47) {
      id v49 = v47;
    }
    else {
      id v49 = (id)objc_opt_new();
    }
    uint64_t v38 = v49;

    long long v50 = [v66 attributes];
    long long v51 = [v50 objectForKeyedSubscript:@"footerLinkURL"];
    [v38 setObject:v51 forKeyedSubscript:@"url"];

    v52 = [v66 attributes];
    v53 = [v52 objectForKeyedSubscript:@"footerLinkURL"];
    [v38 setObject:v53 forKeyedSubscript:@"footerLinkURL"];

    v54 = [v66 attributes];
    uint64_t v55 = [v54 objectForKeyedSubscript:@"httpMethod"];

    if (v55)
    {
      v56 = [v66 attributes];
      v57 = [v56 objectForKeyedSubscript:@"httpMethod"];
      [v38 setObject:v57 forKeyedSubscript:@"httpMethod"];
    }
    v58 = [v66 attributes];
    v59 = [v58 objectForKeyedSubscript:@"footerLinkIsModalHTMLView"];

    if (v59)
    {
      v60 = [v66 attributes];
      v61 = [v60 objectForKeyedSubscript:@"footerLinkIsModalHTMLView"];
      [v38 setObject:v61 forKeyedSubscript:@"fetchLinksInModalWebView"];
    }
    v62 = [v66 attributes];
    v63 = [v62 objectForKeyedSubscript:@"shouldScaleHTMLPageToFit"];

    if (v63)
    {
      v64 = [v66 attributes];
      v65 = [v64 objectForKeyedSubscript:@"shouldScaleHTMLPageToFit"];
      [v38 setObject:v65 forKeyedSubscript:@"shouldScaleHTMLPageToFit"];
    }
    v39 = [v66 footer];
    [v39 setAttributes:v38];
  }

LABEL_35:
}

- (void)_finalizeElement:(id)a3
{
  id v4 = a3;
  if ([v4 isEqualToString:@"section"])
  {
    [(RUITopLevelElementParser *)self _finalizeSection];
  }
  else if ([v4 isEqualToString:@"pinView"])
  {
    [(RUITopLevelElementParser *)self _finalizePinView];
  }
}

- (BOOL)_isParsingTable
{
  return [(NSMutableArray *)self->_elementStack containsObject:@"tableView"];
}

- (void)traversalDelegateDidStartElement:(id)a3
{
  v153[1] = *MEMORY[0x263EF8340];
  id v5 = a3;
  [(NSMutableString *)self->_accumulator setString:&stru_26C545B50];
  id v6 = [v5 name];
  int v7 = [v6 isEqualToString:@"choiceView"];

  if (v7)
  {
    uint64_t v8 = [v5 attributtes];
    id v9 = (void *)[v8 mutableCopy];

    id v10 = [(RUITopLevelElementParser *)self page];
    id v11 = [v10 navTitle];
    [v9 setObject:v11 forKeyedSubscript:@"navigationTitle"];

    [v9 setObject:@"true" forKeyedSubscript:@"isLegacyChoiceViewHeader"];
    [v5 setAttributtes:v9];
  }
  id v12 = [v5 attributtes];
  uint64_t v13 = [v5 name];
  objc_storeStrong((id *)&self->_currentElementAttributes, v12);
  int v14 = [(NSMutableArray *)self->_elementStack containsObject:@"tableView"];
  int v15 = [(NSMutableArray *)self->_elementStack containsObject:@"section"];
  id v16 = objc_msgSend(MEMORY[0x263EFFA08], "setWithObjects:", @"header", @"footer", @"subHeader", @"detailHeader", @"htmlHeader", @"htmlFooter", @"cancelButton", @"button", @"choice", @"helpLink", @"htmlSubLabel", @"page", 0);
  if ([(RUITopLevelElementParser *)self _isParsingSwiftUI])
  {
    swiftUIStack = self->_swiftUIStack;
LABEL_5:
    v18 = v13;
LABEL_6:
    [(NSMutableArray *)swiftUIStack addObject:v18];
    goto LABEL_21;
  }
  uint64_t v19 = +[RUIContentRegistry sharedRegistry];
  int v20 = [v19 supportsViewNamed:v13];

  if (v20)
  {
    v153[0] = v13;
    uint64_t v21 = [MEMORY[0x263EFF8C0] arrayWithObjects:v153 count:1];
    objc_super v22 = (NSMutableArray *)[v21 mutableCopy];
    id v23 = self->_swiftUIStack;
    self->_swiftUIStack = v22;

    objc_storeStrong((id *)&self->_swiftUIElement, a3);
    v24 = [(RUITopLevelElementParser *)self delegate];
    uint64_t v25 = +[RUIActionSignal signalWithType:2];
    [v24 parser:self setDefaultActionSignal:v25];

    if (![(RUITopLevelElementParser *)self _isParsingTable])
    {
      self->_int parserState = 2;
      goto LABEL_21;
    }
    v151 = @"class";
    v152 = @"customContent";
    v26 = [NSDictionary dictionaryWithObjects:&v152 forKeys:&v151 count:1];

    self->_int parserState = 5;
    swiftUIStack = self->_elementStack;
    v18 = @"customContentRow";
    goto LABEL_6;
  }
  if ([(__CFString *)v13 isEqualToString:@"tableView"])
  {
    uint64_t v27 = [(RUITopLevelElementParser *)self delegate];
    uint64_t v28 = +[RUIActionSignal signalWithType:2];
    [v27 parser:self setDefaultActionSignal:v28];

    uint64_t v29 = [(RUITopLevelElementParser *)self elementProvider];
    v30 = [v29 makeTableViewOM];
    [v30 setAttributes:v12];

    uint64_t v31 = [(RUITopLevelElementParser *)self objectModel];
    v32 = [v31 style];
    v33 = [(RUITopLevelElementParser *)self elementProvider];
    v34 = [(RUIDetailButtonElement *)v33 makeTableViewOM];
    v35 = v34;
    v36 = v32;
LABEL_12:
    [v34 setStyle:v36];

    goto LABEL_19;
  }
  if ([(__CFString *)v13 isEqualToString:@"pinView"])
  {
    v37 = [(RUITopLevelElementParser *)self delegate];
    uint64_t v38 = +[RUIActionSignal signalWithType:2];
    [v37 parser:self setDefaultActionSignal:v38];

    uint64_t v31 = [(RUITopLevelElementParser *)self page];
    v39 = [v31 passcodeViewOM];
    [v39 setAttributes:v12];

    v40 = [(RUITopLevelElementParser *)self objectModel];
    v41 = [v40 style];
    v42 = [v31 passcodeViewOM];
    [v42 setStyle:v41];

    v32 = [v12 objectForKeyedSubscript:@"numberOfFields"];
    uint64_t v43 = [(RUIDetailButtonElement *)v32 integerValue];
    if (v43) {
      uint64_t v44 = v43;
    }
    else {
      uint64_t v44 = 4;
    }
    v45 = [v31 passcodeViewOM];
    [v45 setNumberOfEntryFields:v44];

    goto LABEL_19;
  }
  if ([(__CFString *)v13 isEqualToString:@"spinnerView"])
  {
    v47 = [(RUITopLevelElementParser *)self delegate];
    long long v48 = +[RUIActionSignal signalWithType:2];
    [v47 parser:self setDefaultActionSignal:v48];

    uint64_t v31 = [(RUITopLevelElementParser *)self page];
    id v49 = [v31 spinnerViewOM];
    [v49 setAttributes:v12];

    v32 = [(RUITopLevelElementParser *)self objectModel];
    v33 = [(RUIElement *)v32 style];
    v34 = [v31 spinnerViewOM];
    v35 = v34;
    v36 = v33;
    goto LABEL_12;
  }
  if ([(__CFString *)v13 isEqualToString:@"section"])
  {
    [(RUITopLevelElementParser *)self _addSectionWithAttributes:v12];
    goto LABEL_21;
  }
  if ([(__CFString *)v13 isEqualToString:@"headerView"])
  {
    [(RUITopLevelElementParser *)self _logDeprecation:@"<headerView>" value:&stru_26C545B50];
    long long v50 = [(RUITopLevelElementParser *)self elementProvider];
    long long v51 = [v50 makeTableViewOM];

    v52 = [(RUIElement *)[RUIHeaderElement alloc] initWithAttributes:self->_currentElementAttributes parent:v51];
    [v51 setHeader:v52];
LABEL_34:

    goto LABEL_21;
  }
  if ([(__CFString *)v13 isEqualToString:@"footerView"])
  {
    [(RUITopLevelElementParser *)self _logDeprecation:@"<footerView>" value:&stru_26C545B50];
    v53 = [(RUITopLevelElementParser *)self elementProvider];
    long long v51 = [v53 makeTableViewOM];

    v52 = [(RUIElement *)[RUIFooterElement alloc] initWithAttributes:self->_currentElementAttributes parent:v51];
    [v51 setFooter:v52];
    goto LABEL_34;
  }
  if ([(__CFString *)v13 isEqualToString:@"row"])
  {
    uint64_t v31 = [(RUITopLevelElementParser *)self _newRowWithAttributeDict:v12];
    [v31 setSourceXMLElement:v5];
    self->_int parserState = 4;
    if (!_isInternalInstall()) {
      goto LABEL_20;
    }
    _RUILoggingFacility();
    v32 = (RUIDetailButtonElement *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(&v32->super.super, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_2144F2000, &v32->super.super, OS_LOG_TYPE_DEFAULT, "Warning : RemoteUI markup is specifying a deprecated 'row' element.", buf, 2u);
    }
LABEL_19:

LABEL_20:
    goto LABEL_21;
  }
  if ([(__CFString *)v13 isEqualToString:@"searchTerms"]
    && self->_parserState == 4)
  {
    uint64_t v31 = [MEMORY[0x263EFF9C0] set];
    v32 = [(RUITopLevelElementParser *)self _lastRow];
    [(RUIDetailButtonElement *)v32 setSearchTerms:v31];
    goto LABEL_19;
  }
  if ([(__CFString *)v13 hasSuffix:@"Row"])
  {
    v54 = [(id)objc_opt_class() tableRowClassForElementName:v13];
    uint64_t v55 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v12];
    [v55 setObject:v54 forKey:@"class"];
    self->_int parserState = 4;
    v144 = v54;
    if ([v54 isEqualToString:@"selectPage"])
    {
      v56 = [MEMORY[0x263F08C38] UUID];
      v57 = [v56 UUIDString];
      uint64_t v58 = [@"child-page-" stringByAppendingString:v57];

      id v59 = [(RUITopLevelElementParser *)self _newRowWithAttributeDict:v55];
      v60 = [(RUITopLevelElementParser *)self page];
      v61 = [(RUITopLevelElementParser *)self _createPageWithName:v58 attributes:v12];
      [v61 setPageID:v58];
      v139 = v60;
      [v60 _addChildPage:v61];
      [v59 setLinkedPage:v61];
      uint64_t v62 = [v12 objectForKeyedSubscript:@"linkedTitle"];
      v140 = v59;
      v138 = (void *)v62;
      if (v62)
      {
        v149 = @"title";
        uint64_t v150 = v62;
        uint64_t v63 = [NSDictionary dictionaryWithObjects:&v150 forKeys:&v149 count:1];
      }
      else
      {
        uint64_t v63 = 0;
      }
      v137 = (void *)v63;
      [(RUITopLevelElementParser *)self _addNavigationBarWithAttributes:v63 toPage:v61];
      id v95 = objc_alloc_init(MEMORY[0x263EFF9A0]);
      v143 = (void *)v58;
      [v95 setObject:v58 forKey:@"radioGroup"];
      v96 = [v12 objectForKey:@"autoGoBack"];
      int v97 = [v96 BOOLValue];

      if (v97) {
        [v95 setObject:MEMORY[0x263EFFA88] forKey:@"autoGoBack"];
      }
      v98 = [v55 objectForKeyedSubscript:@"value"];
      uint64_t v99 = [v98 length];

      if (v99)
      {
        v100 = [v55 objectForKeyedSubscript:@"value"];
        [v95 setObject:v100 forKey:@"value"];
      }
      v101 = [v12 objectForKeyedSubscript:@"header"];

      if (v101)
      {
        v102 = [v12 objectForKeyedSubscript:@"header"];
        [v95 setObject:v102 forKey:@"header"];

        v103 = [v12 objectForKeyedSubscript:@"headerHeight"];

        if (v103)
        {
          v104 = [v12 objectForKeyedSubscript:@"headerHeight"];
          [v95 setObject:v104 forKey:@"headerHeight"];
        }
      }
      v105 = [v12 objectForKeyedSubscript:@"footer"];

      if (v105)
      {
        v106 = [v12 objectForKeyedSubscript:@"footer"];
        [v95 setObject:v106 forKey:@"footer"];
      }
      v107 = [v61 tableViewOM];
      [(RUITopLevelElementParser *)self _addSectionWithAttributes:v95 toTableViewOM:v107];
    }
    else
    {
      id v84 = [(RUITopLevelElementParser *)self _newRowWithAttributeDict:v55];
      [v84 setSourceXMLElement:v5];
      v85 = [(RUITopLevelElementParser *)self _lastRow];
      objc_opt_class();
      char isKindOfClass = objc_opt_isKindOfClass();

      if (isKindOfClass)
      {
        v87 = [MEMORY[0x263EFF980] array];
        v88 = self->_swiftUIStack;
        self->_swiftUIStack = v87;

        objc_storeStrong((id *)&self->_swiftUIElement, a3);
        self->_int parserState = 5;
      }
    }
    uint64_t v31 = v144;

    goto LABEL_20;
  }
  if ([(__CFString *)v13 isEqualToString:@"detailButton"]
    && self->_parserState == 4)
  {
    uint64_t v31 = [(RUITopLevelElementParser *)self _lastRow];
    v32 = [[RUIDetailButtonElement alloc] initWithAttributes:self->_currentElementAttributes parent:v31];
    [v31 setDetailButton:v32];
    goto LABEL_19;
  }
  if (([(__CFString *)v13 isEqualToString:@"option"] & 1) == 0
    && ![(__CFString *)v13 isEqualToString:@"linkedOption"])
  {
    if (([(__CFString *)v13 isEqualToString:@"linkDeleteAction"] & 1) != 0
      || [(__CFString *)v13 isEqualToString:@"clientDeleteAction"])
    {
      uint64_t v31 = [(RUITopLevelElementParser *)self _lastRow];
      if (!v31) {
        goto LABEL_20;
      }
      v32 = (RUIDetailButtonElement *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v12];
      [(RUIDetailButtonElement *)v32 setObject:v13 forKey:@"type"];
      [v31 setDeleteAction:v32];
      goto LABEL_19;
    }
    if ([(__CFString *)v13 isEqualToString:@"html"])
    {
      v108 = (void *)[v12 copy];
      v109 = [(RUITopLevelElementParser *)self elementProvider];
      v110 = [v109 makeWebViewOM];
      [v110 setAttributes:v108];

      v111 = [(RUITopLevelElementParser *)self baseURL];
      v112 = [(RUITopLevelElementParser *)self elementProvider];
      v113 = [v112 makeWebViewOM];
      [v113 setBaseURL:v111];

      v114 = [(RUITopLevelElementParser *)self elementProvider];
      v115 = [v114 makeWebViewOM];
      [v115 setSourceXMLElement:v5];

      v116 = [(RUITopLevelElementParser *)self delegate];
      v117 = +[RUIActionSignal signalWithType:2];
      [v116 parser:self setDefaultActionSignal:v117];

      self->_int parserState = 1;
      goto LABEL_21;
    }
    if ([(__CFString *)v13 isEqualToString:@"navigationBar"])
    {
      self->_int parserState = 6;
      [(RUITopLevelElementParser *)self _addNavigationBarWithAttributes:v12];
      goto LABEL_21;
    }
    if ([(__CFString *)v13 isEqualToString:@"toolbar"])
    {
      self->_int parserState = 7;
      uint64_t v31 = [(RUITopLevelElementParser *)self page];
      [v31 setHasToolbar];
      goto LABEL_20;
    }
    if (([(__CFString *)v13 isEqualToString:@"header"] & v14 & v15) == 1)
    {
      v148 = v13;
      v118 = [MEMORY[0x263EFF8C0] arrayWithObjects:&v148 count:1];
      v119 = (NSMutableArray *)[v118 mutableCopy];
      v120 = self->_swiftUIStack;
      self->_swiftUIStack = v119;

      v121 = [v5 children];
      v122 = [v121 firstObject];
      swiftUIElement = self->_swiftUIElement;
      self->_swiftUIElement = v122;

      self->_int parserState = 3;
      swiftUIStack = self->_elementStack;
      goto LABEL_5;
    }
    if (([(__CFString *)v13 isEqualToString:@"buttonBarItem"] & 1) == 0
      && ([(__CFString *)v13 isEqualToString:@"linkBarItem"] & 1) == 0
      && ([(__CFString *)v13 isEqualToString:@"nextBarItem"] & 1) == 0
      && ([(__CFString *)v13 isEqualToString:@"editBarItem"] & 1) == 0
      && ([(__CFString *)v13 isEqualToString:@"titleBarItem"] & 1) == 0
      && ([(__CFString *)v13 isEqualToString:@"closeButtonBarItem"] & 1) == 0
      && ![(__CFString *)v13 isEqualToString:@"backButtonBarItem"])
    {
      if ([v16 containsObject:v13]) {
        goto LABEL_21;
      }
      uint64_t v31 = _RUILoggingFacility();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
        -[RUITopLevelElementParser traversalDelegateDidStartElement:]((uint64_t)v13, v31);
      }
      goto LABEL_20;
    }
    v146 = [(RUITopLevelElementParser *)self page];
    v124 = (void *)[objc_alloc(MEMORY[0x263EFF9A0]) initWithDictionary:v12];
    v125 = [v12 objectForKeyedSubscript:@"type"];
    [v124 setObject:v125 forKeyedSubscript:@"barButtonType"];

    [v124 setObject:v13 forKey:@"type"];
    v126 = [v124 objectForKey:@"position"];
    int parserState = self->_parserState;
    if (parserState == 7)
    {
      [v124 setObject:@"toolbar" forKey:@"parentBar"];
      v133 = [RUIBarButtonItem alloc];
      v134 = [v146 pageElement];
      v130 = [(RUIElement *)v133 initWithAttributes:v124 parent:v134];

      v135 = [(RUITopLevelElementParser *)self objectModel];
      v136 = [v135 style];
      [(RUIElement *)v130 setStyle:v136];

      if ([v126 isEqualToString:@"right"])
      {
        [v146 setRightToolbarButtonItem:v130];
      }
      else if ([v126 isEqualToString:@"left"])
      {
        [v146 setLeftToolbarButtonItem:v130];
      }
      else if ([v126 isEqualToString:@"center"])
      {
        [v146 setMiddleToolbarButtonItem:v130];
      }
    }
    else
    {
      if (parserState != 6)
      {
LABEL_108:

        goto LABEL_21;
      }
      [v124 setObject:@"navigationBar" forKey:@"parentBar"];
      v128 = [RUIBarButtonItem alloc];
      v129 = [v146 pageElement];
      v130 = [(RUIElement *)v128 initWithAttributes:v124 parent:v129];

      v131 = [(RUITopLevelElementParser *)self objectModel];
      v132 = [v131 style];
      [(RUIElement *)v130 setStyle:v132];

      if ([v126 isEqualToString:@"right"])
      {
        [v146 setRightNavigationBarButtonItem:v130];
      }
      else if ([v126 isEqualToString:@"left"])
      {
        [v146 setLeftNavigationBarButtonItem:v130];
      }
    }

    goto LABEL_108;
  }
  if ([(__CFString *)v13 isEqualToString:@"linkedOption"])
  {
    v145 = (void *)[v12 mutableCopy];
    v141 = [(RUITopLevelElementParser *)self elementProvider];
    v64 = [v141 parentElement];
    v65 = [v64 pageElement];
    id v66 = [v65 page];
    v67 = [v66 childPages];
    v68 = [v67 lastObject];

    v142 = v68;
    v69 = [v68 tableViewOM];
    v70 = [v69 sections];
    v71 = [v70 lastObject];

    v72 = [v71 attributes];
    v73 = [v72 objectForKeyedSubscript:@"radioGroup"];
    [v145 setObject:v73 forKeyedSubscript:@"radioGroup"];

    [v145 setObject:@"linkedOption" forKeyedSubscript:@"class"];
    v74 = [v145 objectForKeyedSubscript:@"value"];
    v75 = [v71 attributes];
    v76 = [v75 objectForKeyedSubscript:@"value"];
    LODWORD(v65) = [v74 isEqualToString:v76];

    if (v65) {
      [v145 setObject:@"true" forKeyedSubscript:@"checked"];
    }
    v77 = [v142 tableViewOM];

    v78 = [v142 parentPage];
    v79 = [v78 tableViewOM];
    v80 = [v79 sections];
    v81 = [v80 lastObject];

    v82 = [v81 rows];
    v83 = [v82 lastObject];
  }
  else
  {
    v83 = [(RUITopLevelElementParser *)self _lastRow];
  }
  if (v83)
  {
    v89 = [v83 selectOptions];
    v90 = objc_alloc_init(RUISelectOption);
    v91 = [v12 objectForKey:@"label"];
    [(RUISelectOption *)v90 setLabel:v91];

    v92 = [(RUISelectOption *)v90 label];
    uint64_t v93 = [v92 length];

    if (!v93) {
      [(RUISelectOption *)v90 setLabel:@" "];
    }
    v94 = [v12 objectForKey:@"value"];
    [(RUISelectOption *)v90 setValue:v94];

    [v89 addObject:v90];
  }

LABEL_21:
  int v46 = self->_parserState;
  if ((v46 - 2) >= 2
    && (v46 != 5 || [(__CFString *)v13 isEqualToString:@"swiftUIRow"]))
  {
    [(NSMutableArray *)self->_elementStack addObject:v13];
  }
}

- (void)traversalDelegateDidEndlement:(id)a3
{
  uint64_t v91 = *MEMORY[0x263EF8340];
  id v4 = a3;
  id v5 = (void *)[(NSMutableString *)self->_accumulator copy];
  id v6 = [v4 name];
  BOOL v7 = [(RUITopLevelElementParser *)self _isParsingSwiftUI];
  uint64_t v8 = 32;
  if (v7) {
    uint64_t v8 = 40;
  }
  [*(id *)((char *)&self->super.isa + v8) removeLastObject];
  switch(self->_parserState)
  {
    case 1:
      id v9 = @"html";
      goto LABEL_20;
    case 2:
      if (![(NSMutableArray *)self->_swiftUIStack count])
      {
        int v20 = [(RUITopLevelElementParser *)self page];
        uint64_t v21 = [_TtC8RemoteUI26RUISwiftUIContainerElement alloc];
        swiftUIElement = self->_swiftUIElement;
        id v23 = [v20 pageElement];
        v24 = [(RUISwiftUIContainerElement *)v21 initWithElement:swiftUIElement parent:v23];

        if (v24)
        {
          [(RUITopLevelElementProvider *)self->_elementProvider setPrimaryElement:v24];
          swiftUIStack = self->_swiftUIStack;
          self->_swiftUIStack = 0;

          v26 = self->_swiftUIElement;
          self->_swiftUIElement = 0;
        }
        [(RUISwiftUIContainerElement *)v24 prepareToPreload];
        self->_int parserState = 0;
      }
      goto LABEL_84;
    case 3:
      if (![(NSMutableArray *)self->_swiftUIStack count])
      {
        id v10 = self->_swiftUIElement;
        id v11 = [(RUITopLevelElementParser *)self elementProvider];
        id v12 = [v11 makeTableViewOM];
        uint64_t v13 = [v12 sections];
        int v14 = [v13 lastObject];

        if (v10)
        {
          int v15 = [[_TtC8RemoteUI26RUISwiftUIContainerElement alloc] initWithElement:self->_swiftUIElement parent:v14];
          if (v15) {
            [v14 setHeader:v15];
          }
          [(RUISwiftUIContainerElement *)v15 prepareToPreload];
        }
        else
        {
          int v15 = [(RUIElement *)[RUIHeaderElement alloc] initWithAttributes:self->_currentElementAttributes parent:v14];
          [(RUIElement *)v15 setBody:self->_accumulator];
          [v14 setHeader:v15];
        }

        v70 = self->_swiftUIElement;
        self->_swiftUIElement = 0;

        v71 = self->_swiftUIStack;
        self->_swiftUIStack = 0;

        self->_int parserState = 0;
        v72 = [(NSMutableArray *)self->_elementStack lastObject];
        int v73 = [v72 isEqualToString:v6];

        if (v73) {
          [(NSMutableArray *)self->_elementStack removeLastObject];
        }
      }
      goto LABEL_84;
    case 4:
      if ([v6 isEqualToString:@"searchTerm"])
      {
        id v16 = [(RUITopLevelElementParser *)self _lastRow];
        __int16 v17 = [v16 searchTerms];
        v18 = (void *)[(NSMutableString *)self->_accumulator copy];
        [v17 addObject:v18];
      }
      else if (([v6 hasSuffix:@"Row"] & 1) != 0 {
             || [v6 isEqualToString:@"row"])
      }
      {
        if ([v6 isEqualToString:@"selectPageRow"])
        {
          v75 = v6;
          v41 = [(RUITopLevelElementParser *)self elementProvider];
          v42 = [v41 parentElement];
          uint64_t v43 = [v42 pageElement];
          uint64_t v44 = [v43 page];
          v45 = [v44 childPages];
          int v46 = [v45 lastObject];

          long long v87 = 0u;
          long long v88 = 0u;
          long long v85 = 0u;
          long long v86 = 0u;
          v74 = v46;
          v47 = [v46 tableViewOM];
          long long v48 = [v47 sections];

          id obj = v48;
          uint64_t v79 = [v48 countByEnumeratingWithState:&v85 objects:v90 count:16];
          id v76 = v4;
          id v49 = 0;
          if (v79)
          {
            uint64_t v78 = *(void *)v86;
            do
            {
              uint64_t v50 = 0;
              do
              {
                if (*(void *)v86 != v78) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v80 = v50;
                long long v51 = *(void **)(*((void *)&v85 + 1) + 8 * v50);
                long long v81 = 0u;
                long long v82 = 0u;
                long long v83 = 0u;
                long long v84 = 0u;
                v52 = [v51 rows];
                uint64_t v53 = [v52 countByEnumeratingWithState:&v81 objects:v89 count:16];
                if (v53)
                {
                  uint64_t v54 = v53;
                  uint64_t v55 = *(void *)v82;
                  do
                  {
                    for (uint64_t i = 0; i != v54; ++i)
                    {
                      if (*(void *)v82 != v55) {
                        objc_enumerationMutation(v52);
                      }
                      v57 = [*(id *)(*((void *)&v81 + 1) + 8 * i) attributes];
                      uint64_t v58 = [v57 objectForKeyedSubscript:@"checked"];
                      int v59 = [v58 BOOLValue];

                      if (v59)
                      {
                        uint64_t v60 = [v57 objectForKeyedSubscript:@"label"];

                        id v49 = (void *)v60;
                      }
                    }
                    uint64_t v54 = [v52 countByEnumeratingWithState:&v81 objects:v89 count:16];
                  }
                  while (v54);
                }

                uint64_t v50 = v80 + 1;
              }
              while (v80 + 1 != v79);
              uint64_t v79 = [obj countByEnumeratingWithState:&v85 objects:v90 count:16];
            }
            while (v79);
          }

          id v4 = v76;
          id v6 = v75;
          if ([v49 length])
          {
            v61 = [(RUITopLevelElementParser *)self _lastRow];
            uint64_t v62 = [v61 mutableAttributes];
            [v62 setObject:v49 forKey:@"detailLabel"];
          }
        }
LABEL_21:
        self->_int parserState = 0;
      }
LABEL_22:
      uint64_t v27 = [(NSMutableArray *)self->_elementStack lastObject];
      int v28 = [v27 isEqualToString:@"tableView"];

      uint64_t v29 = [(NSMutableArray *)self->_elementStack lastObject];
      int v30 = [v29 isEqualToString:@"section"];

      [(NSMutableArray *)self->_elementStack containsObject:@"multiChoiceView"];
      uint64_t v31 = [(RUITopLevelElementParser *)self page];
      int v32 = [v31 hasSpinnerView];

      if (!v30)
      {
        if (v28)
        {
          uint64_t v38 = [(RUITopLevelElementParser *)self elementProvider];
          v36 = [v38 makeTableViewOM];

          if (![v6 isEqualToString:@"header"])
          {
            if (![v6 isEqualToString:@"subHeader"]) {
              goto LABEL_82;
            }
LABEL_36:
            v37 = [(RUIElement *)[RUISubHeaderElement alloc] initWithAttributes:self->_currentElementAttributes parent:v36];
            [(RUIElement *)v37 setBody:v5];
            [v36 setSubHeader:v37];
            goto LABEL_81;
          }
        }
        else
        {
          if (![(NSMutableArray *)self->_elementStack containsObject:@"pinView"])
          {
            if (!v32) {
              goto LABEL_83;
            }
            v36 = [(RUITopLevelElementParser *)self page];
            v37 = [v36 spinnerViewOM];
            if ([v6 isEqualToString:@"header"])
            {
              v40 = [(RUIElement *)[RUIHeaderElement alloc] initWithAttributes:self->_currentElementAttributes parent:v37];
              [(RUIElement *)v40 setBody:v5];
              [(RUISubHeaderElement *)v37 setHeader:v40];
            }
            else
            {
              if (![v6 isEqualToString:@"footer"]) {
                goto LABEL_81;
              }
              v40 = [(RUIElement *)[RUIFooterElement alloc] initWithAttributes:self->_currentElementAttributes parent:v37];
              [(RUIElement *)v40 setBody:v5];
              [(RUISubHeaderElement *)v37 setFooter:v40];
            }
            if (v40)
            {
              v67 = [(RUIElement *)v40 attributes];
              v68 = [v67 objectForKey:@"color"];

              if (![v68 length])
              {
                v69 = [(RUIElement *)v40 attributes];
                [v69 setValue:@"labelColor" forKey:@"color"];
              }
            }
            goto LABEL_81;
          }
          v39 = [(RUITopLevelElementParser *)self page];
          v36 = [v39 passcodeViewOM];

          if (![v6 isEqualToString:@"header"])
          {
            if ([v6 isEqualToString:@"htmlHeader"])
            {
              v37 = [(RUIElement *)[RUIHTMLHeaderElement alloc] initWithAttributes:self->_currentElementAttributes parent:v36];
              [(RUISubHeaderElement *)v37 setHTMLContent:v5];
              [v36 setHTMLHeader:v37];
              goto LABEL_81;
            }
            goto LABEL_70;
          }
        }
        v37 = [(RUIElement *)[RUIHeaderElement alloc] initWithAttributes:self->_currentElementAttributes parent:v36];
        [(RUIElement *)v37 setBody:v5];
        goto LABEL_34;
      }
      v33 = [(RUITopLevelElementParser *)self elementProvider];
      v34 = [v33 makeTableViewOM];
      v35 = [v34 sections];
      v36 = [v35 lastObject];

      if ([v6 isEqualToString:@"htmlHeader"])
      {
        v37 = [(RUIElement *)[RUIHTMLHeaderElement alloc] initWithAttributes:self->_currentElementAttributes parent:v36];
        [(RUISubHeaderElement *)v37 setHTMLContent:v5];
LABEL_34:
        [v36 setHeader:v37];
        goto LABEL_81;
      }
      if ([v6 isEqualToString:@"detailHeader"])
      {
        v37 = [(RUIElement *)[RUIDetailHeaderElement alloc] initWithAttributes:self->_currentElementAttributes parent:v36];
        [(RUIElement *)v37 setBody:v5];
        [v36 setDetailHeader:v37];
        goto LABEL_81;
      }
      if ([v6 isEqualToString:@"subHeader"]) {
        goto LABEL_36;
      }
LABEL_70:
      if ([v6 isEqualToString:@"footer"])
      {
        v37 = [(RUIElement *)[RUIFooterElement alloc] initWithAttributes:self->_currentElementAttributes parent:v36];
        [(RUIElement *)v37 setBody:v5];
      }
      else
      {
        if (![v6 isEqualToString:@"htmlFooter"]) {
          goto LABEL_82;
        }
        v37 = [(RUIElement *)[RUIHTMLFooterElement alloc] initWithAttributes:self->_currentElementAttributes parent:v36];
        [(RUISubHeaderElement *)v37 setHTMLContent:v5];
      }
      [v36 setFooter:v37];
LABEL_81:

LABEL_82:
LABEL_83:
      [(RUITopLevelElementParser *)self _finalizeElement:v6];
LABEL_84:
      [(NSMutableString *)self->_accumulator setString:&stru_26C545B50];
LABEL_85:

      return;
    case 5:
      if ([(NSMutableArray *)self->_swiftUIStack count])
      {
        int v19 = 0;
      }
      else
      {
        uint64_t v63 = +[RUIContentRegistry sharedRegistry];
        int v19 = [v63 supportsViewNamed:v6];
      }
      if (([v6 isEqualToString:@"swiftUIRow"] & 1) != 0 || v19)
      {
        v64 = [(RUITopLevelElementParser *)self _lastRow];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          [v64 setXmlElement:self->_swiftUIElement];
          [v64 prepareToPreload];
          v65 = self->_swiftUIStack;
          self->_swiftUIStack = 0;

          id v66 = self->_swiftUIElement;
          self->_swiftUIElement = 0;
        }
        self->_int parserState = 0;
        [(NSMutableArray *)self->_elementStack removeLastObject];
      }
      goto LABEL_85;
    case 6:
      id v9 = @"navigationBar";
      goto LABEL_20;
    case 7:
      id v9 = @"toolbar";
LABEL_20:
      if ([v6 isEqualToString:v9]) {
        goto LABEL_21;
      }
      goto LABEL_22;
    default:
      goto LABEL_22;
  }
}

- (BOOL)_isParsingSwiftUI
{
  return (self->_parserState < 6u) & (0x2Cu >> self->_parserState);
}

- (void)traversalDelegateFoundCData:(id)a3
{
  id v14 = a3;
  int parserState = self->_parserState;
  if (parserState != 4)
  {
    if (parserState == 1)
    {
      id v5 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
      id v6 = [(RUITopLevelElementParser *)self elementProvider];
      BOOL v7 = [v6 makeWebViewOM];
      [v7 setHtml:v5];

      goto LABEL_11;
    }
LABEL_10:
    accumulator = self->_accumulator;
    id v5 = (void *)[[NSString alloc] initWithData:v14 encoding:4];
    [(NSMutableString *)accumulator appendString:v5];
    goto LABEL_11;
  }
  uint64_t v8 = [(NSMutableArray *)self->_elementStack lastObject];
  int v9 = [v8 isEqualToString:@"htmlSubLabel"];

  if (v9)
  {
    id v5 = [(RUITopLevelElementParser *)self _lastRow];
    [v5 setHtmlSubLabelData:v14];
    goto LABEL_11;
  }
  if (self->_parserState != 4) {
    goto LABEL_10;
  }
  id v10 = [(NSMutableArray *)self->_elementStack lastObject];
  int v11 = [v10 hasSuffix:@"Row"];

  if (!v11) {
    goto LABEL_10;
  }
  id v12 = [(RUITopLevelElementParser *)self _lastRow];
  id v5 = v12;
  if (v12) {
    [v12 setData:v14];
  }
LABEL_11:
}

- (id)_createPageWithName:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if (v9)
  {
    id v10 = objc_loadWeakRetained((id *)&self->_delegate);
    int v11 = [v10 topLevelElementParser:self createPageWithName:v6 attributes:v7];
  }
  else
  {
    int v11 = 0;
  }

  return v11;
}

- (RUIXMLElement)xmlElement
{
  return self->_xmlElement;
}

- (void)setXmlElement:(id)a3
{
}

- (RUITopLevelElementProvider)elementProvider
{
  return self->_elementProvider;
}

- (void)setElementProvider:(id)a3
{
}

- (RUIObjectModel)objectModel
{
  return self->_objectModel;
}

- (void)setObjectModel:(id)a3
{
}

- (RUITopLevelPageElement)primaryElement
{
  return self->_primaryElement;
}

- (void)setPrimaryElement:(id)a3
{
}

- (RUITopLevelElementParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUITopLevelElementParserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_primaryElement, 0);
  objc_storeStrong((id *)&self->_objectModel, 0);
  objc_storeStrong((id *)&self->_elementProvider, 0);
  objc_storeStrong((id *)&self->_xmlElement, 0);
  objc_storeStrong((id *)&self->_swiftUIElement, 0);
  objc_storeStrong((id *)&self->_swiftUIStack, 0);
  objc_storeStrong((id *)&self->_elementStack, 0);
  objc_storeStrong((id *)&self->_currentElementAttributes, 0);
  objc_storeStrong((id *)&self->_accumulator, 0);
}

- (void)traversalDelegateDidStartElement:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2144F2000, a2, OS_LOG_TYPE_ERROR, "Unknown tag in markup, being ignored: '%@'", (uint8_t *)&v2, 0xCu);
}

@end