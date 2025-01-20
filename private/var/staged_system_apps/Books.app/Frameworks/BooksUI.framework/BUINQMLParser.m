@interface BUINQMLParser
+ (void)initialize;
- (BUINQMLParser)delegate;
- (BUINQMLParser)init;
- (BUINQMLParser)initWithString:(id)a3;
- (NSString)string;
- (_xmlParserCtxt)_parserContext;
- (void)parse;
- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4;
- (void)reportParseError:(_xmlError *)a3;
- (void)setDelegate:(id)a3;
- (void)set_parserContext:(_xmlParserCtxt *)a3;
@end

@implementation BUINQMLParser

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    xmlInitParser();
  }
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___BUINQMLParser;
  [super initialize];
}

- (BUINQMLParser)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)BUINQMLParser;
  v5 = [(BUINQMLParser *)&v9 init];
  if (v5)
  {
    v6 = (NSString *)[v4 copy];
    string = v5->_string;
    v5->_string = v6;
  }
  return v5;
}

- (BUINQMLParser)init
{
  return 0;
}

- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = +[NSError errorWithDomain:@"BooksUI.NQMLParser.errorDomain" code:a3 userInfo:a4];
  v5 = [(BUINQMLParser *)self delegate];
  [v5 parser:self parseErrorOccurred:v6];
}

- (void)reportParseError:(_xmlError *)a3
{
  if (a3->level == XML_ERR_FATAL)
  {
    id v8 = objc_alloc_init((Class)NSMutableDictionary);
    v5 = +[NSNumber numberWithInt:a3->line];
    [v8 setObject:v5 forKeyedSubscript:@"BooksUI.NQMLParser.errorLineNumber"];

    id v6 = +[NSNumber numberWithInt:a3->int2];
    [v8 setObject:v6 forKeyedSubscript:@"BooksUI.NQMLParser.errorColumn"];

    id v7 = [objc_alloc((Class)NSString) initWithUTF8String:a3->message];
    if (v7) {
      [v8 setObject:v7 forKeyedSubscript:NSLocalizedDescriptionKey];
    }
    [(BUINQMLParser *)self reportErrorWithCode:a3->code userInfo:v8];
  }
}

- (void)parse
{
  objc_super v3 = [(BUINQMLParser *)self delegate];

  if (!v3) {
    return;
  }
  id v4 = [(BUINQMLParser *)self string];
  v5 = (const char *)[v4 UTF8String];

  if (!v5
    || ([(BUINQMLParser *)self string],
        id v6 = objc_claimAutoreleasedReturnValue(),
        unint64_t v7 = (unint64_t)[v6 lengthOfBytesUsingEncoding:4],
        v6,
        v7 >> 31))
  {
    id v8 = self;
    uint64_t v9 = -101;
LABEL_5:
    [(BUINQMLParser *)v8 reportErrorWithCode:v9 userInfo:0];
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
  v15[6] = *(_OWORD *)off_2DAD10;
  v15[7] = *(_OWORD *)off_2DAD20;
  v15[11] = *(_OWORD *)&off_2DAD60;
  v15[8] = unk_2DAD30;
  memset(&v15[9], 0, 32);
  memset(&v15[12], 0, 64);
  memset(v15, 0, 96);
  MemoryParserCtxt->sax = (_xmlSAXHandler *)v15;
  MemoryParserCtxt->userData = self;
  MemoryParserCtxt->encoding = (const xmlChar *)"UTF-8";
  MemoryParserCtxt->charset = 1;
  htmlCtxtUseOptions(MemoryParserCtxt, 10305);
  [(BUINQMLParser *)self set_parserContext:v11];
  int v12 = htmlParseDocument(v11);
  myDoc = v11->myDoc;
  if (myDoc) {
    xmlFreeDoc(myDoc);
  }
  v11->encoding = 0;
  v11->charset = 0;
  v11->sax = 0;
  v11->userData = 0;
  xmlFreeParserCtxt(v11);
  [(BUINQMLParser *)self set_parserContext:0];
  if (v12)
  {
    xmlErrorPtr LastError = xmlCtxtGetLastError([(BUINQMLParser *)self _parserContext]);
    if (LastError) {
      [(BUINQMLParser *)self reportParseError:LastError];
    }
  }
}

- (NSString)string
{
  return self->_string;
}

- (BUINQMLParser)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (BUINQMLParser *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (_xmlParserCtxt)_parserContext
{
  return self->__parserContext;
}

- (void)set_parserContext:(_xmlParserCtxt *)a3
{
  self->__parserContext = a3;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong((id *)&self->_string, 0);
}

@end