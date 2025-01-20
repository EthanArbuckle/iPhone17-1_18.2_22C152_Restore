@interface RUIObjectModelParser
- (BOOL)parseActionSignalWithElementName:(id)a3;
- (BOOL)succeeded;
- (NSError)error;
- (NSURL)baseURL;
- (RUIObjectModelParser)initWithBaseURL:(id)a3 style:(id)a4 delegate:(id)a5 decodingUserInfo:(id)a6;
- (RUIObjectModelParserDelegate)delegate;
- (RUIXMLElement)xmlElement;
- (id)_createAndAddPageWithAttributes:(id)a3;
- (id)_createPageWithName:(id)a3 attributes:(id)a4;
- (id)_lastPageCreateIfNeeded;
- (id)_lastRow;
- (id)actionSignal;
- (id)topLevelElementParser:(id)a3 createPageWithName:(id)a4 attributes:(id)a5;
- (id)uiObjectModel;
- (void)_addNavigationBarWithAttributes:(id)a3;
- (void)_logDeprecation:(id)a3 value:(id)a4;
- (void)_validateDocumentContent;
- (void)dealloc;
- (void)parseXMLElement:(id)a3;
- (void)parser:(id)a3 setDefaultActionSignal:(id)a4;
- (void)setBaseURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setXmlElement:(id)a3;
- (void)traversalDelegateDidEndlement:(id)a3;
- (void)traversalDelegateDidStartElement:(id)a3;
- (void)traversalDelegateFoundCData:(id)a3;
@end

@implementation RUIObjectModelParser

- (RUIObjectModelParser)initWithBaseURL:(id)a3 style:(id)a4 delegate:(id)a5 decodingUserInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v26.receiver = self;
  v26.super_class = (Class)RUIObjectModelParser;
  v14 = [(RUIObjectModelParser *)&v26 init];
  if (v14)
  {
    v15 = objc_alloc_init(RUIObjectModel);
    uiObjectModel = v14->_uiObjectModel;
    v14->_uiObjectModel = v15;

    [(RUIObjectModel *)v14->_uiObjectModel setDecodingUserInfo:v13];
    [(RUIObjectModel *)v14->_uiObjectModel setSourceURL:v10];
    [(RUIObjectModel *)v14->_uiObjectModel setStyle:v11];
    [(RUIObjectModelParser *)v14 setBaseURL:v10];
    [(RUIObjectModelParser *)v14 setDelegate:v12];
    v17 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    pages = v14->_pages;
    v14->_pages = v17;

    v19 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    currentPageStack = v14->_currentPageStack;
    v14->_currentPageStack = v19;

    uint64_t v21 = objc_opt_new();
    accumulator = v14->_accumulator;
    v14->_accumulator = (NSMutableString *)v21;

    uint64_t v23 = objc_opt_new();
    elementStack = v14->_elementStack;
    v14->_elementStack = (NSMutableArray *)v23;
  }
  return v14;
}

- (void)parseXMLElement:(id)a3
{
  [(RUIObjectModelParser *)self setXmlElement:a3];
  v4 = [(RUIObjectModelParser *)self xmlElement];
  [v4 traverseWithDelegate:self];

  [(RUIObjectModelParser *)self _validateDocumentContent];
  uiObjectModel = self->_uiObjectModel;
  [(RUIObjectModel *)uiObjectModel parseDidFinish];
}

- (void)dealloc
{
  uint64_t v24 = *MEMORY[0x263EF8340];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  v3 = self->_pages;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v19;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v19 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v18 + 1) + 8 * v7++) setObjectModel:0];
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v5);
  }

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  v8 = self->_currentPageStack;
  uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        [*(id *)(*((void *)&v14 + 1) + 8 * v12++) setObjectModel:0];
      }
      while (v10 != v12);
      uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v14 objects:v22 count:16];
    }
    while (v10);
  }

  v13.receiver = self;
  v13.super_class = (Class)RUIObjectModelParser;
  [(RUIObjectModelParser *)&v13 dealloc];
}

- (id)uiObjectModel
{
  return self->_uiObjectModel;
}

- (id)actionSignal
{
  return self->_actionSignal;
}

- (id)_createPageWithName:(id)a3 attributes:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v9 = objc_opt_respondsToSelector();

  if ((v9 & 1) == 0
    || (id v10 = objc_loadWeakRetained((id *)&self->_delegate),
        [v10 objectModelParser:self createPageWithName:v6 attributes:v7],
        uint64_t v11 = (RUIPage *)objc_claimAutoreleasedReturnValue(),
        v10,
        [(RUIPage *)v11 setAttributes:v7],
        !v11))
  {
    uint64_t v11 = [[RUIPage alloc] initWithAttributes:v7];
  }
  uint64_t v12 = [(RUIElement *)[RUIPageElement alloc] initWithAttributes:v7 parent:0];
  [(RUIPage *)v11 setPageElement:v12];
  objc_super v13 = [(RUIObjectModel *)self->_uiObjectModel style];
  [(RUIPage *)v11 setStyle:v13];

  [(RUIPage *)v11 setObjectModel:self->_uiObjectModel];
  [(NSMutableArray *)self->_currentPageStack addObject:v11];

  return v11;
}

- (id)_createAndAddPageWithAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 objectForKeyedSubscript:@"name"];
  id v6 = [(RUIObjectModelParser *)self _createPageWithName:v5 attributes:v4];

  if (v4)
  {
    id v7 = [v4 objectForKeyedSubscript:@"validationFunction"];
    [v6 setValidationFunction:v7];

    v8 = [v4 objectForKeyedSubscript:@"id"];
    [v6 setPageID:v8];

    char v9 = [v4 objectForKeyedSubscript:@"backgroundColor"];
    if (v9)
    {
      id v10 = objc_msgSend(MEMORY[0x263F825C8], "_remoteUI_colorWithString:", v9);
      uint64_t v11 = [v6 view];
      [v11 setBackgroundColor:v10];
    }
  }
  [(NSMutableArray *)self->_pages addObject:v6];

  return v6;
}

- (id)_lastPageCreateIfNeeded
{
  v3 = [(NSMutableArray *)self->_currentPageStack lastObject];
  if (!v3)
  {
    v3 = [(RUIObjectModelParser *)self _createAndAddPageWithAttributes:0];
  }
  return v3;
}

- (id)_lastRow
{
  v2 = [(NSMutableArray *)self->_currentPageStack lastObject];
  v3 = [v2 tableViewOM];
  id v4 = [v3 sections];
  uint64_t v5 = [v4 lastObject];

  id v6 = [v5 rows];
  id v7 = [v6 lastObject];

  return v7;
}

- (void)_addNavigationBarWithAttributes:(id)a3
{
  id v9 = a3;
  id v4 = [(RUIObjectModelParser *)self _lastPageCreateIfNeeded];
  uint64_t v5 = [v9 objectForKey:@"title"];
  if ([v5 length]) {
    [v4 setNavTitle:v5];
  }
  id v6 = [v9 objectForKey:@"subTitle"];
  if ([v6 length]) {
    [v4 setNavSubTitle:v6];
  }
  id v7 = [v9 objectForKey:@"backButtonTitle"];
  if (v7) {
    [v4 setBackButtonTitle:v7];
  }
  v8 = [v9 objectForKey:@"hidesBackButton"];
  objc_msgSend(v4, "setHidesBackButton:", objc_msgSend(v8, "BOOLValue"));
}

- (void)_logDeprecation:(id)a3 value:(id)a4
{
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    [NSString stringWithFormat:@" = \"%@\"", v7];
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_26C545B50;
  }
  if (_isInternalInstall())
  {
    id v9 = _RUILoggingFacility();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      id v10 = [(RUIObjectModelParser *)self baseURL];
      uint64_t v11 = [(NSMutableArray *)self->_elementStack lastObject];
      *(_DWORD *)buf = 138413058;
      objc_super v13 = v10;
      __int16 v14 = 2112;
      id v15 = v6;
      __int16 v16 = 2112;
      long long v17 = v8;
      __int16 v18 = 2112;
      long long v19 = v11;
      _os_log_impl(&dword_2144F2000, v9, OS_LOG_TYPE_DEFAULT, "Page with baseURL %@ is using deprecated feature \"%@\"%@ in %@ element", buf, 0x2Au);
    }
  }
}

- (BOOL)parseActionSignalWithElementName:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[RUIActionSignal signalWithString:v4];
  if (v5)
  {
    actionSignal = self->_actionSignal;
    if (actionSignal)
    {
      id v7 = [(RUIActionSignal *)actionSignal subActions];
      [v7 addObject:v4];
    }
    else
    {
      v8 = v5;
      id v7 = self->_actionSignal;
      self->_actionSignal = v8;
    }
  }
  return v5 != 0;
}

- (void)traversalDelegateDidStartElement:(id)a3
{
  id v4 = a3;
  [(NSMutableString *)self->_accumulator setString:&stru_26C545B50];
  uint64_t v5 = [v4 attributtes];
  id v6 = [v4 name];
  objc_storeStrong((id *)&self->_currentElementAttributes, v5);
  if ([v6 isEqualToString:@"buddyFlowComplete"])
  {
    if (_isInternalInstall())
    {
      id v7 = _RUILoggingFacility();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2144F2000, v7, OS_LOG_TYPE_DEFAULT, "Buddy Flow Complete!", buf, 2u);
      }
    }
    v8 = +[RUIActionSignal signalWithType:1];
    actionSignal = self->_actionSignal;
    self->_actionSignal = v8;

    *(_WORD *)&self->_foundXMLUI = 257;
    goto LABEL_55;
  }
  if ([v6 isEqualToString:@"xmlui"])
  {
    if (!self->_error && ![(NSMutableArray *)self->_elementStack count]) {
      *(_WORD *)&self->_foundXMLUI = 257;
    }
    id v10 = [v5 objectForKey:@"action"];
    uiObjectModel = self->_uiObjectModel;
    uint64_t v12 = [v5 objectForKey:@"id"];
    [(RUIObjectModel *)uiObjectModel setIdentifier:v12];

    objc_super v13 = self->_uiObjectModel;
    __int16 v14 = [v5 objectForKey:@"idOfOldestObjectModelToRemoveAfterPush"];
    [(RUIObjectModel *)v13 setIdentifierMarkingStackRemovalAfterPush:v14];

    id v15 = [v5 objectForKeyedSubscript:@"idOfObjectModelToReplace"];
    [(RUIObjectModel *)self->_uiObjectModel setIdOfObjectModelToReplace:v15];

    __int16 v16 = +[RUIActionSignal signalWithString:v10];
    if (v16)
    {
      objc_storeStrong((id *)&self->_actionSignal, v16);
    }
    else if ([v10 length])
    {
      long long v21 = _RUILoggingFacility();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
        -[RUIObjectModelParser traversalDelegateDidStartElement:]((uint64_t)v10, v21);
      }
    }
    v22 = [v5 objectForKey:@"validationFunction"];
    [(RUIObjectModel *)self->_uiObjectModel setValidationFunction:v22];

    uint64_t v23 = [v5 objectForKey:@"refresh"];
    uint64_t v24 = [v23 componentsSeparatedByString:@";"];
    if ([v24 count] == 2)
    {
      v25 = [v24 objectAtIndex:0];
      -[RUIObjectModel setRefreshDelay:](self->_uiObjectModel, "setRefreshDelay:", [v25 intValue]);

      objc_super v26 = [v24 objectAtIndex:1];
      [(RUIObjectModel *)self->_uiObjectModel setRefreshURL:v26];
    }
    v27 = [(RUIObjectModel *)self->_uiObjectModel style];

    if (!v27)
    {
      v28 = [v5 objectForKey:@"style"];
      v50 = v10;
      if ([v28 isEqualToString:@"setupAssistant"])
      {
        v29 = self->_uiObjectModel;
        uint64_t v30 = +[RUIStyle setupAssistantStyle];
      }
      else if ([v28 isEqualToString:@"setupAssistantModal"])
      {
        v29 = self->_uiObjectModel;
        uint64_t v30 = +[RUIStyle setupAssistantModalStyle];
      }
      else if ([v28 isEqualToString:@"oslo"])
      {
        v29 = self->_uiObjectModel;
        uint64_t v30 = +[RUIStyle osloStyle];
      }
      else if ([v28 isEqualToString:@"atv"])
      {
        v29 = self->_uiObjectModel;
        uint64_t v30 = +[RUIStyle frontRowStyle];
      }
      else
      {
        int v42 = [v28 isEqualToString:@"defaultStyle"];
        v29 = self->_uiObjectModel;
        if (v42) {
          v43 = RUIDefaultAppearanceStyle;
        }
        else {
          v43 = RUIStyle;
        }
        uint64_t v30 = [(__objc2_class *)v43 defaultStyle];
      }
      v44 = (void *)v30;
      [(RUIObjectModel *)v29 setStyle:v30];

      id v10 = v50;
    }
    v45 = [v5 objectForKeyedSubscript:@"tintColor"];

    if (v45)
    {
      v46 = (void *)MEMORY[0x263F825C8];
      v47 = [v5 objectForKeyedSubscript:@"tintColor"];
      v48 = objc_msgSend(v46, "_remoteUI_colorWithString:defaultColor:", v47, 0);

      v49 = [(RUIObjectModel *)self->_uiObjectModel style];
      [v49 setTintColor:v48];
    }
    goto LABEL_55;
  }
  if ([v6 isEqualToString:@"actions"])
  {
    if (!_isInternalInstall()) {
      goto LABEL_55;
    }
    long long v17 = _RUILoggingFacility();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v51 = 0;
      _os_log_impl(&dword_2144F2000, v17, OS_LOG_TYPE_DEFAULT, "Starting to parse actions", v51, 2u);
    }
LABEL_30:

    goto LABEL_55;
  }
  if ([v6 isEqualToString:@"script"])
  {
    __int16 v18 = NSURL;
    long long v19 = [v5 objectForKey:@"src"];
    uint64_t v20 = [v18 URLWithString:v19];
    [(RUIObjectModel *)self->_uiObjectModel setScriptURL:v20];

    self->_parserState = 1;
    goto LABEL_55;
  }
  if ([v6 isEqualToString:@"page"])
  {
    long long v17 = [(RUIObjectModelParser *)self _createAndAddPageWithAttributes:v5];
    v31 = [RUITopLevelElementParser alloc];
    v32 = [v17 elementProvider];
    v33 = [(RUITopLevelElementParser *)v31 initWithXMLElement:v4 elementProvider:v32 objectModel:self->_uiObjectModel delegate:self];

    v34 = [v17 pageElement];
    [v34 setSourceXMLElement:v4];

    [(RUITopLevelElementParser *)v33 parse];
    goto LABEL_30;
  }
  if ([v6 isEqualToString:@"alert"])
  {
    self->_parserState = 2;
    v35 = [[RUIAlertView alloc] initWithAttributes:v5 parent:0];
    v36 = [(RUIObjectModel *)self->_uiObjectModel style];
    [(RUIElement *)v35 setStyle:v36];

    v37 = [v5 objectForKey:@"title"];
    [(RUIAlertView *)v35 setTitle:v37];

    v38 = [v5 objectForKey:@"message"];
    [(RUIAlertView *)v35 setMessage:v38];

    v39 = [v5 objectForKey:@"cancelButtonTitle"];

    if (v39)
    {
      v40 = [v5 objectForKeyedSubscript:@"cancelButtonTitle"];
      [(RUIAlertView *)v35 addButtonWithTitle:v40 URL:0 style:1 attributes:0];
    }
    currentAlert = self->_currentAlert;
    self->_currentAlert = v35;
  }
  else if ([v6 isEqualToString:@"clientInfo"])
  {
    [(RUIObjectModel *)self->_uiObjectModel setClientInfo:v5];
  }
  else if ([v6 isEqualToString:@"serverInfo"])
  {
    [(RUIObjectModel *)self->_uiObjectModel setServerInfo:v5];
  }
  else if ([v6 isEqualToString:@"updateInfo"])
  {
    [(RUIObjectModel *)self->_uiObjectModel setUpdateInfo:v5];
  }
  else
  {
    [(RUIObjectModelParser *)self parseActionSignalWithElementName:v6];
  }
LABEL_55:
  [(NSMutableArray *)self->_elementStack addObject:v6];
}

- (void)traversalDelegateDidEndlement:(id)a3
{
  accumulator = self->_accumulator;
  id v5 = a3;
  id v15 = (id)[(NSMutableString *)accumulator copy];
  id v6 = [v5 name];

  int parserState = self->_parserState;
  if (parserState)
  {
    if (parserState == 2)
    {
      if ([v6 isEqualToString:@"cancelButton"])
      {
        [(RUIAlertView *)self->_currentAlert addButtonWithTitle:v15 URL:0 style:1 attributes:self->_currentElementAttributes];
      }
      else if ([v6 isEqualToString:@"button"])
      {
        v8 = [(NSDictionary *)self->_currentElementAttributes objectForKeyedSubscript:@"destructive"];
        if ([v8 BOOLValue]) {
          uint64_t v9 = 2;
        }
        else {
          uint64_t v9 = 0;
        }

        id v10 = NSURL;
        currentAlert = self->_currentAlert;
        uint64_t v12 = [(NSDictionary *)self->_currentElementAttributes objectForKeyedSubscript:@"url"];
        objc_super v13 = [v10 URLWithString:v12];
        [(RUIAlertView *)currentAlert addButtonWithTitle:v15 URL:v13 style:v9 attributes:self->_currentElementAttributes];
      }
      else if ([v6 isEqualToString:@"alert"])
      {
        [(RUIObjectModel *)self->_uiObjectModel addAlertElement:self->_currentAlert];
        self->_int parserState = 0;
        __int16 v14 = self->_currentAlert;
        self->_currentAlert = 0;
      }
    }
    else if (parserState == 1 && [v6 isEqualToString:@"script"])
    {
      self->_int parserState = 0;
    }
  }
  else if ([v6 isEqualToString:@"xmlui"])
  {
    [(RUIObjectModel *)self->_uiObjectModel setPages:self->_pages];
    [(NSMutableArray *)self->_currentPageStack removeAllObjects];
    [(NSMutableArray *)self->_pages removeAllObjects];
  }
  else if ([v6 isEqualToString:@"page"])
  {
    [(NSMutableArray *)self->_currentPageStack removeLastObject];
  }
  [(NSMutableString *)self->_accumulator setString:&stru_26C545B50];
}

- (void)_validateDocumentContent
{
  id v9 = [(RUIObjectModel *)self->_uiObjectModel allPages];
  if ([v9 count] || self->_actionSignal)
  {
LABEL_8:

    return;
  }
  v3 = [(RUIObjectModel *)self->_uiObjectModel primaryAlert];
  if (v3
    || ([(RUIObjectModel *)self->_uiObjectModel scriptURL],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(RUIObjectModel *)self->_uiObjectModel inlineScript],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0)
    || ([(RUIObjectModel *)self->_uiObjectModel clientInfo],
        (v3 = objc_claimAutoreleasedReturnValue()) != 0))
  {

    goto LABEL_8;
  }
  id v4 = [(RUIObjectModel *)self->_uiObjectModel serverInfo];

  if (!v4 && !self->_foundXMLUI)
  {
    if (_isInternalInstall())
    {
      id v5 = _RUILoggingFacility();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2144F2000, v5, OS_LOG_TYPE_DEFAULT, "No usable content in document!", buf, 2u);
      }
    }
    uiObjectModel = self->_uiObjectModel;
    self->_uiObjectModel = 0;

    self->_succeeded = 0;
    id v7 = +[RUIHTTPRequest errorWithCode:4];
    error = self->_error;
    self->_error = v7;
  }
}

- (void)traversalDelegateFoundCData:(id)a3
{
  id v7 = a3;
  accumulator = self->_accumulator;
  id v5 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
  [(NSMutableString *)accumulator appendString:v5];

  if (self->_parserState == 1)
  {
    id v6 = (void *)[[NSString alloc] initWithData:v7 encoding:4];
    [(RUIObjectModel *)self->_uiObjectModel setInlineScript:v6];
  }
}

- (void)parser:(id)a3 setDefaultActionSignal:(id)a4
{
  id v6 = a4;
  actionSignal = self->_actionSignal;
  p_actionSignal = &self->_actionSignal;
  if (!actionSignal)
  {
    id v9 = v6;
    objc_storeStrong((id *)p_actionSignal, a4);
    id v6 = v9;
  }
}

- (id)topLevelElementParser:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  return [(RUIObjectModelParser *)self _createPageWithName:a4 attributes:a5];
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (RUIXMLElement)xmlElement
{
  return self->_xmlElement;
}

- (void)setXmlElement:(id)a3
{
}

- (BOOL)succeeded
{
  return self->_succeeded;
}

- (NSError)error
{
  return self->_error;
}

- (RUIObjectModelParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIObjectModelParserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_xmlElement, 0);
  objc_storeStrong((id *)&self->_elementStack, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_actionSignal, 0);
  objc_storeStrong((id *)&self->_currentPageStack, 0);
  objc_storeStrong((id *)&self->_pages, 0);
  objc_storeStrong((id *)&self->_uiObjectModel, 0);
  objc_storeStrong((id *)&self->_currentAlert, 0);
  objc_storeStrong((id *)&self->_currentElementAttributes, 0);
  objc_storeStrong((id *)&self->_accumulator, 0);
}

- (void)traversalDelegateDidStartElement:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2144F2000, a2, OS_LOG_TYPE_ERROR, "warning: unknown action signal '%@'", (uint8_t *)&v2, 0xCu);
}

@end