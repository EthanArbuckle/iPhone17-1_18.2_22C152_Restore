@interface EpubRightsDataParser
- (EpubRightsDataParser)initWithXMLData:(id)a3;
- (NSData)sinfData;
- (void)dealloc;
- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6;
- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7;
- (void)parser:(id)a3 foundCharacters:(id)a4;
@end

@implementation EpubRightsDataParser

- (EpubRightsDataParser)initWithXMLData:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)EpubRightsDataParser;
  v4 = [(EpubRightsDataParser *)&v7 init];
  if (v4)
  {
    id v5 = [objc_alloc((Class)NSXMLParser) initWithData:a3];
    [v5 setDelegate:v4];
    [v5 parse];
  }
  return v4;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)EpubRightsDataParser;
  [(EpubRightsDataParser *)&v3 dealloc];
}

- (void)parser:(id)a3 didStartElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6 attributes:(id)a7
{
  self->_isSinfElement = [a4 isEqualToString:@"fairplay:sData"];
}

- (void)parser:(id)a3 foundCharacters:(id)a4
{
  if (self->_isSinfElement)
  {
    buffer = self->_buffer;
    if (!buffer)
    {
      buffer = (NSMutableString *)objc_alloc_init((Class)NSMutableString);
      self->_buffer = buffer;
    }
    [(NSMutableString *)buffer appendString:a4];
  }
}

- (void)parser:(id)a3 didEndElement:(id)a4 namespaceURI:(id)a5 qualifiedName:(id)a6
{
  if (self->_isSinfElement)
  {
    self->_sinfData = (NSData *)[objc_alloc((Class)NSData) initWithBase64EncodedString:self->_buffer options:0];
    self->_isSinfElement = 0;
  }
}

- (NSData)sinfData
{
  return self->_sinfData;
}

@end