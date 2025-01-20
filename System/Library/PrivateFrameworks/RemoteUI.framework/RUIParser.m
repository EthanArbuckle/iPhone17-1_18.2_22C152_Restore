@interface RUIParser
+ (id)rowWithAttributeDict:(id)a3 delegate:(id)a4 parent:(id)a5;
+ (id)tableRowClassForElementName:(id)a3;
+ (id)textStyleForString:(id)a3;
+ (int64_t)textAlignmentForString:(id)a3;
- (BOOL)succeeded;
- (NSData)xmlData;
- (NSError)error;
- (NSURL)baseURL;
- (RUIParser)initWithBaseURL:(id)a3 style:(id)a4 delegate:(id)a5 decodingUserInfo:(id)a6;
- (RUIParser)initWithDelegate:(id)a3;
- (RUIParser)initWithXML:(id)a3;
- (RUIParser)initWithXML:(id)a3 baseURL:(id)a4 delegate:(id)a5;
- (RUIParser)initWithXML:(id)a3 baseURL:(id)a4 style:(id)a5 delegate:(id)a6;
- (RUIParser)initWithXML:(id)a3 baseURL:(id)a4 style:(id)a5 delegate:(id)a6 decodingUserInfo:(id)a7;
- (RUIParserDelegate)delegate;
- (id)actionSignal;
- (id)objectModelParser:(id)a3 createPageWithName:(id)a4 attributes:(id)a5;
- (id)parseXML:(id)a3;
- (id)uiObjectModel;
- (void)parseObjectModelWithXMLElement:(id)a3;
- (void)setBaseURL:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setXmlData:(id)a3;
@end

@implementation RUIParser

+ (int64_t)textAlignmentForString:(id)a3
{
  return +[RUITopLevelElementParser textAlignmentForString:a3];
}

- (RUIParser)initWithXML:(id)a3 baseURL:(id)a4 style:(id)a5 delegate:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  v14 = objc_opt_new();
  v15 = [(RUIParser *)self initWithXML:v13 baseURL:v12 style:v11 delegate:v10 decodingUserInfo:v14];

  return v15;
}

- (RUIParser)initWithDelegate:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)RUIParser;
  v5 = [(RUIParser *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_delegate, v4);
  }

  return v6;
}

- (RUIParser)initWithBaseURL:(id)a3 style:(id)a4 delegate:(id)a5 decodingUserInfo:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v19.receiver = self;
  v19.super_class = (Class)RUIParser;
  v14 = [(RUIParser *)&v19 init];
  v15 = v14;
  if (v14)
  {
    objc_storeWeak((id *)&v14->_delegate, v12);
    v16 = [[RUIObjectModelParser alloc] initWithBaseURL:v10 style:v11 delegate:v15 decodingUserInfo:v13];
    objectModelParser = v15->_objectModelParser;
    v15->_objectModelParser = v16;
  }
  return v15;
}

- (RUIParser)initWithXML:(id)a3 baseURL:(id)a4 style:(id)a5 delegate:(id)a6 decodingUserInfo:(id)a7
{
  id v12 = a3;
  id v13 = [(RUIParser *)self initWithBaseURL:a4 style:a5 delegate:a6 decodingUserInfo:a7];
  v14 = v13;
  if (v13)
  {
    v15 = [(RUIParser *)v13 parseXML:v12];
    [(RUIParser *)v14 parseObjectModelWithXMLElement:v15];
  }
  return v14;
}

- (void)parseObjectModelWithXMLElement:(id)a3
{
  [(RUIObjectModelParser *)self->_objectModelParser parseXMLElement:a3];
  v9 = [(RUIObjectModelParser *)self->_objectModelParser error];
  id v4 = [(RUIObjectModelParser *)self->_objectModelParser uiObjectModel];
  error = self->_error;
  p_error = &self->_error;
  v5 = error;
  if (error) {
    objc_super v8 = v5;
  }
  else {
    objc_super v8 = v9;
  }
  objc_storeStrong((id *)p_error, v8);
  *((unsigned char *)p_error - 24) = *p_error == 0;
  [v4 parseDidFinish];
}

- (id)parseXML:(id)a3
{
  uint64_t v25 = *MEMORY[0x263EF8340];
  id v4 = a3;
  v5 = (void *)[[NSString alloc] initWithData:v4 encoding:4];
  v6 = [MEMORY[0x263F08708] whitespaceAndNewlineCharacterSet];
  v7 = [v5 stringByTrimmingCharactersInSet:v6];

  if (![v7 length])
  {
    if (_isInternalInstall())
    {
      objc_super v8 = _RUILoggingFacility();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_2144F2000, v8, OS_LOG_TYPE_DEFAULT, "Treating empty document as valid", buf, 2u);
      }
    }
    uint64_t v9 = [@"<xmlui action=\"push\"/>" dataUsingEncoding:4];

    id v4 = (id)v9;
  }
  id v10 = objc_alloc_init(RUIXMLSanitizer);
  id v22 = 0;
  id v11 = [(RUIXMLSanitizer *)v10 sanitizedXMLElementWithData:v4 error:&v22];
  id v12 = (NSError *)v22;
  id v21 = 0;
  id v13 = [(RUIXMLSanitizer *)v10 logStringWithXMLString:v5 error:&v21];
  id v14 = v21;
  if (v14)
  {
    v15 = _RUILoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      -[RUIParser parseXML:]((uint64_t)v14, v15);
    }
LABEL_10:

    goto LABEL_11;
  }
  if (_isInternalInstall())
  {
    v15 = _RUILoggingFacility();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v24 = v13;
      _os_log_impl(&dword_2144F2000, v15, OS_LOG_TYPE_DEFAULT, "RUIParser processing document:\n%@", buf, 0xCu);
    }
    goto LABEL_10;
  }
LABEL_11:
  if (v12)
  {
    error = self->_error;
    p_error = &self->_error;
    v16 = error;
    if (error) {
      objc_super v19 = v16;
    }
    else {
      objc_super v19 = v12;
    }
    objc_storeStrong((id *)p_error, v19);
    *((unsigned char *)p_error - 24) = 0;
  }

  return v11;
}

- (RUIParser)initWithXML:(id)a3 baseURL:(id)a4 delegate:(id)a5
{
  return [(RUIParser *)self initWithXML:a3 baseURL:a4 style:0 delegate:a5];
}

- (RUIParser)initWithXML:(id)a3
{
  return [(RUIParser *)self initWithXML:a3 baseURL:0 delegate:0];
}

- (id)actionSignal
{
  return [(RUIObjectModelParser *)self->_objectModelParser actionSignal];
}

- (id)uiObjectModel
{
  return [(RUIObjectModelParser *)self->_objectModelParser uiObjectModel];
}

+ (id)textStyleForString:(id)a3
{
  return +[RUITopLevelElementParser textStyleForString:a3];
}

- (id)objectModelParser:(id)a3 createPageWithName:(id)a4 attributes:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  char v10 = objc_opt_respondsToSelector();

  if (v10)
  {
    id v11 = objc_loadWeakRetained((id *)&self->_delegate);
    id v12 = [v11 parser:self createPageWithName:v7 attributes:v8];
  }
  else
  {
    id v12 = 0;
  }

  return v12;
}

+ (id)tableRowClassForElementName:(id)a3
{
  return +[RUITopLevelElementParser tableRowClassForElementName:a3];
}

+ (id)rowWithAttributeDict:(id)a3 delegate:(id)a4 parent:(id)a5
{
  return +[RUITopLevelElementParser rowWithAttributeDict:a3 delegate:a4 parent:a5];
}

- (NSURL)baseURL
{
  return self->_baseURL;
}

- (void)setBaseURL:(id)a3
{
}

- (NSData)xmlData
{
  return self->_xmlData;
}

- (void)setXmlData:(id)a3
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

- (RUIParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (RUIParserDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_error, 0);
  objc_storeStrong((id *)&self->_xmlData, 0);
  objc_storeStrong((id *)&self->_baseURL, 0);
  objc_storeStrong((id *)&self->_objectModelParser, 0);
}

- (void)parseXML:(uint64_t)a1 .cold.1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x263EF8340];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_2144F2000, a2, OS_LOG_TYPE_ERROR, "RUIParser failed to decode string with error:%@", (uint8_t *)&v2, 0xCu);
}

@end