@interface VUIHTMLMarkupParser
+ (void)initialize;
- (NSString)string;
- (VUIHTMLMarkupParser)delegate;
- (VUIHTMLMarkupParser)init;
- (VUIHTMLMarkupParser)initWithString:(id)a3;
- (_xmlParserCtxt)_parserContext;
- (void)parse;
- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4;
- (void)reportParseError:(_xmlError *)a3;
- (void)setDelegate:(id)a3;
- (void)set_parserContext:(_xmlParserCtxt *)a3;
@end

@implementation VUIHTMLMarkupParser

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_string, 0);
}

- (void)setDelegate:(id)a3
{
}

- (void)parse
{
  v3 = [(VUIHTMLMarkupParser *)self delegate];
  if (v3)
  {
    id v4 = [(VUIHTMLMarkupParser *)self string];
    v5 = (const char *)[v4 UTF8String];

    if (!v5
      || ([(VUIHTMLMarkupParser *)self string],
          v6 = objc_claimAutoreleasedReturnValue(),
          unint64_t v7 = [v6 lengthOfBytesUsingEncoding:4],
          v6,
          v7 >> 31))
    {
      v8 = self;
      uint64_t v9 = -101;
LABEL_5:
      [(VUIHTMLMarkupParser *)v8 reportErrorWithCode:v9 userInfo:0];
      goto LABEL_6;
    }
    htmlParserCtxtPtr MemoryParserCtxt = htmlCreateMemoryParserCtxt(v5, v7);
    if (!MemoryParserCtxt)
    {
      v8 = self;
      uint64_t v9 = -100;
      goto LABEL_5;
    }
    v18 = MemoryParserCtxt;
    long long v35 = xmmword_1F3E4CD48;
    long long v36 = unk_1F3E4CD58;
    long long v37 = xmmword_1F3E4CD68;
    long long v38 = unk_1F3E4CD78;
    long long v31 = xmmword_1F3E4CD08;
    long long v32 = unk_1F3E4CD18;
    long long v33 = xmmword_1F3E4CD28;
    long long v34 = *(_OWORD *)&off_1F3E4CD38;
    long long v27 = xmmword_1F3E4CCC8;
    long long v28 = unk_1F3E4CCD8;
    long long v29 = xmmword_1F3E4CCE8;
    long long v30 = *(_OWORD *)&off_1F3E4CCF8;
    long long v23 = xmmword_1F3E4CC88;
    long long v24 = unk_1F3E4CC98;
    long long v25 = xmmword_1F3E4CCA8;
    long long v26 = unk_1F3E4CCB8;
    sax = MemoryParserCtxt->sax;
    if (sax) {
      ((void (*)(_xmlSAXHandler *, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void, void))*MEMORY[0x1E4FBA9D0])(sax, v11, v12, v13, v14, v15, v16, v17, v23, *((void *)&v23 + 1), v24, *((void *)&v24 + 1), v25, *((void *)&v25 + 1), v26, *((void *)&v26 + 1), v27, *((void *)&v27 + 1), v28,
    }
        *((void *)&v28 + 1),
        v29,
        *((void *)&v29 + 1),
        v30,
        *((void *)&v30 + 1),
        v31,
        *((void *)&v31 + 1),
        v32,
        *((void *)&v32 + 1),
        v33,
        *((void *)&v33 + 1),
        v34,
        *((void *)&v34 + 1));
    v18->sax = (_xmlSAXHandler *)&v23;
    v18->userData = self;
    v18->encoding = (const xmlChar *)"UTF-8";
    v18->charset = 1;
    htmlCtxtUseOptions(v18, 10305);
    [(VUIHTMLMarkupParser *)self set_parserContext:v18];
    int v20 = htmlParseDocument(v18);
    myDoc = v18->myDoc;
    if (myDoc) {
      xmlFreeDoc(myDoc);
    }
    if (v20)
    {
      xmlErrorPtr LastError = xmlCtxtGetLastError([(VUIHTMLMarkupParser *)self _parserContext]);
      if (LastError) {
        [(VUIHTMLMarkupParser *)self reportParseError:LastError];
      }
    }
    v18->encoding = 0;
    v18->charset = 0;
    v18->sax = 0;
    v18->userData = 0;
    xmlFreeParserCtxt(v18);
    [(VUIHTMLMarkupParser *)self set_parserContext:0];
  }
LABEL_6:
}

- (NSString)string
{
  return self->_string;
}

- (void)set_parserContext:(_xmlParserCtxt *)a3
{
  self->__parserContext = a3;
}

- (void)reportParseError:(_xmlError *)a3
{
  if (a3->level == XML_ERR_FATAL)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v5 = [MEMORY[0x1E4F28ED0] numberWithInt:a3->line];
    [v8 setObject:v5 forKeyedSubscript:@"VideosUIFramework.HTMLMarkupParser.errorLineNumber"];

    v6 = [MEMORY[0x1E4F28ED0] numberWithInt:a3->int2];
    [v8 setObject:v6 forKeyedSubscript:@"VideosUIFramework.HTMLMarkupParser.errorColumn"];

    unint64_t v7 = (void *)[[NSString alloc] initWithUTF8String:a3->message];
    if (v7) {
      [v8 setObject:v7 forKeyedSubscript:*MEMORY[0x1E4F28568]];
    }
    [(VUIHTMLMarkupParser *)self reportErrorWithCode:a3->code userInfo:v8];
  }
}

- (_xmlParserCtxt)_parserContext
{
  return self->__parserContext;
}

- (VUIHTMLMarkupParser)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (VUIHTMLMarkupParser *)WeakRetained;
}

- (VUIHTMLMarkupParser)initWithString:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)VUIHTMLMarkupParser;
  v5 = [(VUIHTMLMarkupParser *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    string = v5->_string;
    v5->_string = (NSString *)v6;
  }
  return v5;
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1) {
    xmlInitParser();
  }
  v3.receiver = a1;
  v3.super_class = (Class)&OBJC_METACLASS___VUIHTMLMarkupParser;
  objc_msgSendSuper2(&v3, sel_initialize);
}

- (VUIHTMLMarkupParser)init
{
  return 0;
}

- (void)reportErrorWithCode:(unint64_t)a3 userInfo:(id)a4
{
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"VideosUIFramework.HTMLMarkupParser.errorDomain" code:a3 userInfo:a4];
  v5 = [(VUIHTMLMarkupParser *)self delegate];
  [v5 parser:self parseErrorOccurred:v6];
}

@end