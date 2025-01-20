@interface SiriTTSHTMLSAXParser
- (SiriTTSHTMLSAXParserDelegate)delegate;
- (void)parse:(id)a3;
- (void)setDelegate:(id)a3;
@end

@implementation SiriTTSHTMLSAXParser

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (SiriTTSHTMLSAXParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (SiriTTSHTMLSAXParserDelegate *)WeakRetained;
}

- (void)parse:(id)a3
{
  htmlSAXParseDoc((const xmlChar *)objc_msgSend(a3, "UTF8String", 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, SiriTTSHTMLSAXParserHandleDocumentStart, SiriTTSHTMLSAXParserHandleDocumentEnd, SiriTTSHTMLSAXParserHandleElementStart, SiriTTSHTMLSAXParserHandleElementEnd,
                       0,
                       SiriTTSHTMLSAXParserHandleCharacters,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0,
                       0),
    "utf-8",
    &v3,
    self);
}

@end