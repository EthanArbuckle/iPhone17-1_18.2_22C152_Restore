@interface ASKNQMLParser
+ (void)initialize;
- (ASKNQMLParser)delegate;
- (ASKNQMLParser)init;
- (ASKNQMLParser)initWithString:(id)a3;
- (NSString)string;
- (_xmlParserCtxt)_parserContext;
- (void)parse;
- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4;
- (void)reportParseError:(_xmlError *)a3;
- (void)setDelegate:(id)a3;
- (void)set_parserContext:(_xmlParserCtxt *)a3;
@end

@implementation ASKNQMLParser

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    xmlInitParser();
  }
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___ASKNQMLParser;
  [super initialize];
}

- (ASKNQMLParser)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)ASKNQMLParser;
  v5 = [(ASKNQMLParser *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    string = v5->_string;
    v5->_string = v6;
  }
  return v5;
}

- (ASKNQMLParser)init
{
  return 0;
}

- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = +[NSError errorWithDomain:@"ShelfKit.NqmlParser.errorDomain" code:a3 userInfo:a4];
  v5 = [(ASKNQMLParser *)self delegate];
  [v5 parser:self parseErrorOccurred:v6];
}

- (void)reportParseError:(_xmlError *)a3
{
  if (a3->level == XML_ERR_FATAL)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = +[NSNumber numberWithInt:a3->line];
    [v8 setObject:v5 forKeyedSubscript:@"ShelfKit.NqmlParser.errorLineNumber"];

    id v6 = +[NSNumber numberWithInt:a3->int2];
    [v8 setObject:v6 forKeyedSubscript:@"ShelfKit.NqmlParser.errorColumn"];

    id v7 = [objc_alloc((Class)NSString) initWithUTF8String:a3->message];
    if (v7) {
      [v8 setObject:v7 forKeyedSubscript:NSLocalizedDescriptionKey];
    }
    [(ASKNQMLParser *)self reportErrorWithCode:a3->code userInfo:v8];
  }
}

- (void)parse
{
  objc_super v3 = [(ASKNQMLParser *)self delegate];

  if (!v3) {
    return;
  }
  id v4 = [(ASKNQMLParser *)self string];
  v5 = (const char *)[v4 UTF8String];

  if (!v5
    || ([(ASKNQMLParser *)self string],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = (unint64_t)[v6 lengthOfBytesUsingEncoding:4],
        v6,
        v7 >> 31))
  {
    id v8 = self;
    uint64_t v9 = -101;
LABEL_5:
    [(ASKNQMLParser *)v8 reportErrorWithCode:v9 userInfo:0];
    return;
  }
  htmlParserCtxtPtr MemoryParserCtxt = htmlCreateMemoryParserCtxt(v5, v7);
  if (!MemoryParserCtxt)
  {
    id v8 = self;
    uint64_t v9 = -100;
    goto LABEL_5;
  }
  v11 = MemoryParserCtxt;
  sax = MemoryParserCtxt->sax;
  sax->startDocument = (startDocumentSAXFunc)ASKNQMLParserStartDocument;
  sax->endDocument = (endDocumentSAXFunc)ASKNQMLParserEndDocument;
  sax->error = (errorSAXFunc)ASKNQMLParserError;
  sax->startElement = (startElementSAXFunc)ASKNQMLParserStartElement;
  sax->endElement = (endElementSAXFunc)ASKNQMLParserEndElement;
  sax->characters = (charactersSAXFunc)ASKNQMLParserCharacters;
  MemoryParserCtxt->userData = self;
  MemoryParserCtxt->encoding = (const xmlChar *)"UTF-8";
  MemoryParserCtxt->charset = 1;
  htmlCtxtUseOptions(MemoryParserCtxt, 10305);
  [(ASKNQMLParser *)self set_parserContext:v11];
  if (htmlParseDocument(v11))
  {
    xmlErrorPtr LastError = xmlCtxtGetLastError([(ASKNQMLParser *)self _parserContext]);
    if (LastError) {
      [(ASKNQMLParser *)self reportParseError:LastError];
    }
  }

  [(ASKNQMLParser *)self set_parserContext:0];
}

- (void)set_parserContext:(_xmlParserCtxt *)a3
{
  parserContext = self->__parserContext;
  if (parserContext)
  {
    myDoc = parserContext->myDoc;
    if (myDoc)
    {
      xmlFreeDoc(myDoc);
      parserContext->myDoc = 0;
    }
    parserContext->encoding = 0;
    parserContext->userData = 0;
    htmlFreeParserCtxt(parserContext);
  }
  self->__parserContext = a3;
}

- (NSString)string
{
  return self->_string;
}

- (ASKNQMLParser)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (ASKNQMLParser *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_xmlParserCtxt)_parserContext
{
  return self->__parserContext;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_string, 0);
}

@end