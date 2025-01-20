@interface PFTTMLParser
- (BOOL)isDescriptor;
- (NSDictionary)currentElementAttributes;
- (NSXMLParser)parser;
- (PFTTMLParser)initWithContentsOfURL:(id)a3 delegate:(id)a4;
- (PFTTMLParser)initWithData:(id)a3 delegate:(id)a4;
- (PFTTMLParser)initWithStream:(id)a3 delegate:(id)a4;
- (PFTTMLParserDelegate)delegate;
- (double)timeForElementAttribute:(int64_t)a3;
- (id)stringForElementAttribute:(int64_t)a3;
- (int64_t)unitForCurrentSpan;
- (void)abortParsing;
- (void)parse;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
- (void)parser:(id)a3 parseErrorOccurred:(id)a4;
- (void)parser:(id)a3 validationErrorOccurred:(id)a4;
- (void)parserDidEndDocument:(id)a3;
- (void)parserDidStartDocument:(id)a3;
- (void)setCurrentElementAttributes:(id)a3;
- (void)setParser:(id)a3;
@end

@implementation PFTTMLParser

- (PFTTMLParser)initWithData:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PFTTMLParser;
  v8 = [(PFTTMLParser *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29250]) initWithData:v6];
    parser = v9->_parser;
    v9->_parser = (NSXMLParser *)v10;
  }
  return v9;
}

- (PFTTMLParser)initWithStream:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PFTTMLParser;
  v8 = [(PFTTMLParser *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29250]) initWithStream:v6];
    parser = v9->_parser;
    v9->_parser = (NSXMLParser *)v10;
  }
  return v9;
}

- (PFTTMLParser)initWithContentsOfURL:(id)a3 delegate:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PFTTMLParser;
  v8 = [(PFTTMLParser *)&v13 init];
  v9 = v8;
  if (v8)
  {
    objc_storeWeak((id *)&v8->_delegate, v7);
    uint64_t v10 = [objc_alloc(MEMORY[0x1E4F29250]) initWithContentsOfURL:v6];
    parser = v9->_parser;
    v9->_parser = (NSXMLParser *)v10;
  }
  return v9;
}

- (void)parse
{
  v3 = [(PFTTMLParser *)self parser];
  [v3 setDelegate:self];

  id v4 = [(PFTTMLParser *)self parser];
  [v4 parse];
}

- (void)abortParsing
{
  id v2 = [(PFTTMLParser *)self parser];
  [v2 abortParsing];
}

- (int64_t)unitForCurrentSpan
{
  id v2 = [(NSDictionary *)self->_currentElementAttributes objectForKeyedSubscript:@"podcasts:unit"];
  if ([v2 isEqualToString:@"sentence"])
  {
    int64_t v3 = 0;
  }
  else if ([v2 isEqualToString:@"word"])
  {
    int64_t v3 = 1;
  }
  else
  {
    int64_t v3 = 2;
  }

  return v3;
}

- (BOOL)isDescriptor
{
  id v2 = [(NSDictionary *)self->_currentElementAttributes objectForKeyedSubscript:@"podcasts:descriptor"];
  char v3 = [v2 isEqualToString:@"true"];

  return v3;
}

- (id)stringForElementAttribute:(int64_t)a3
{
  currentElementAttributes = self->_currentElementAttributes;
  id v4 = PFTTMLDictionaryKeyForStringAttribute(a3);
  v5 = [(NSDictionary *)currentElementAttributes objectForKeyedSubscript:v4];

  return v5;
}

- (double)timeForElementAttribute:(int64_t)a3
{
  currentElementAttributes = self->_currentElementAttributes;
  id v4 = PFTTMLDictionaryKeyForTimeAttribute(a3);
  v5 = [(NSDictionary *)currentElementAttributes objectForKeyedSubscript:v4];
  [v5 intervalFromTimecode];
  double v7 = v6;

  return v7;
}

- (void)parserDidStartDocument:(id)a3
{
  id v4 = [(PFTTMLParser *)self delegate];
  [v4 parserDidStartDocument:self];
}

- (void)parserDidEndDocument:(id)a3
{
  id v4 = [(PFTTMLParser *)self delegate];
  [v4 parserDidEndDocument:self];
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  id v9 = a4;
  [(PFTTMLParser *)self setCurrentElementAttributes:a7];
  uint64_t v10 = PFTTMLTypeForName(v9);

  v11 = [(PFTTMLParser *)self delegate];
  [v11 parser:self didStartElementType:v10];

  [(PFTTMLParser *)self setCurrentElementAttributes:0];
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  uint64_t v7 = PFTTMLTypeForName(a4);
  id v8 = [(PFTTMLParser *)self delegate];
  [v8 parser:self didEndElementType:v7];
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  id v5 = a4;
  id v6 = [(PFTTMLParser *)self delegate];
  [v6 parser:self foundCharacters:v5];
}

- (void)parser:(id)a3 parseErrorOccurred:(id)a4
{
  id v5 = a4;
  id v6 = [(PFTTMLParser *)self delegate];
  [v6 parser:self parseErrorOccurred:v5];
}

- (void)parser:(id)a3 validationErrorOccurred:(id)a4
{
  id v5 = a4;
  id v6 = [(PFTTMLParser *)self delegate];
  [v6 parser:self validationErrorOccurred:v5];
}

- (PFTTMLParserDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (PFTTMLParserDelegate *)WeakRetained;
}

- (NSXMLParser)parser
{
  return self->_parser;
}

- (void)setParser:(id)a3
{
}

- (NSDictionary)currentElementAttributes
{
  return self->_currentElementAttributes;
}

- (void)setCurrentElementAttributes:(id)a3
{
  self->_currentElementAttributes = (NSDictionary *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_parser, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end