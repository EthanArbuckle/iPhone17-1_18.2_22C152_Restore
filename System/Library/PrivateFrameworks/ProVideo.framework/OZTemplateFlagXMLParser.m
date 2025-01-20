@interface OZTemplateFlagXMLParser
- (BOOL)parse;
- (OZTemplateFlagXMLParser)initWithContentsOfURL:(id)a3;
- (unsigned)templeFlags;
- (void)dealloc;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation OZTemplateFlagXMLParser

- (OZTemplateFlagXMLParser)initWithContentsOfURL:(id)a3
{
  uint64_t v4 = [objc_alloc(MEMORY[0x1E4F29250]) initWithContentsOfURL:a3];
  if (!v4) {
    return 0;
  }
  v5 = (NSXMLParser *)v4;
  v9.receiver = self;
  v9.super_class = (Class)OZTemplateFlagXMLParser;
  v6 = [(OZTemplateFlagXMLParser *)&v9 init];
  v7 = v6;
  if (v6)
  {
    v6->_parser = v5;
    [(NSXMLParser *)v5 setDelegate:v6];
    *(unsigned int *)((char *)&v7->_templeFlags + 3) = 0;
    v7->_templeFlags = 0;
  }
  else
  {
  }
  return v7;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)OZTemplateFlagXMLParser;
  [(OZTemplateFlagXMLParser *)&v3 dealloc];
}

- (BOOL)parse
{
  return [(NSXMLParser *)self->_parser parse] || self->_success;
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  if ([a4 isEqualToString:@"template"]) {
    self->_foundTemplate = 1;
  }
  if ([a4 isEqualToString:@"flags"] && self->_foundTemplate) {
    self->_foundTemplateFlag = 1;
  }
  if ([a4 isEqualToString:@"scene"])
  {
    self->_success = 1;
    [a3 abortParsing];
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if ([a4 isEqualToString:@"flags"] && self->_foundTemplateFlag)
  {
    self->_success = 1;
    [a3 abortParsing];
  }
  if ([a4 isEqualToString:@"template"])
  {
    self->_success = 1;
    [a3 abortParsing];
  }
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  if (self->_foundTemplateFlag)
  {
    id v6 = objc_alloc_init(MEMORY[0x1E4F28EE0]);
    [v6 setNumberStyle:1];
    self->_templeFlags = objc_msgSend((id)objc_msgSend(v6, "numberFromString:", a4), "unsignedIntValue");
  }
}

- (unsigned)templeFlags
{
  return self->_templeFlags;
}

@end