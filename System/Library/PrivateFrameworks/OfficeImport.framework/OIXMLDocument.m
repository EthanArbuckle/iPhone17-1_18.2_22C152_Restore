@interface OIXMLDocument
- (NSString)characterEncoding;
- (NSString)version;
- (OIXMLDocument)initWithRootElement:(id)a3;
- (OIXMLElement)rootElement;
- (id)XMLString;
- (id)closingTagString;
- (id)copyWithZone:(_NSZone *)a3;
- (id)createMutableXMLString;
- (id)openingTagString;
- (void)setCharacterEncoding:(id)a3;
- (void)setRootElement:(id)a3;
- (void)setVersion:(id)a3;
@end

@implementation OIXMLDocument

- (OIXMLDocument)initWithRootElement:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)OIXMLDocument;
  v5 = [(OIXMLDocument *)&v8 init];
  v6 = v5;
  if (v5) {
    [(OIXMLDocument *)v5 setRootElement:v4];
  }

  return v6;
}

- (void)setRootElement:(id)a3
{
}

- (void)setVersion:(id)a3
{
}

- (void)setCharacterEncoding:(id)a3
{
}

- (OIXMLElement)rootElement
{
  return (OIXMLElement *)objc_getProperty(self, a2, 8, 1);
}

- (id)openingTagString
{
  return &stru_26EBF24D8;
}

- (id)closingTagString
{
  return &stru_26EBF24D8;
}

- (id)XMLString
{
  id v2 = [(OIXMLDocument *)self createMutableXMLString];
  return v2;
}

- (id)createMutableXMLString
{
  v3 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithCapacity:100000];
  [(OIXMLElement *)self->_rootElement _appendXMLStringToString:v3 level:0];
  return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  v5 = [OIXMLDocument alloc];
  id v6 = [(OIXMLElement *)self->_rootElement copyWithZone:a3];
  v7 = [(OIXMLDocument *)v5 initWithRootElement:v6];

  objc_super v8 = [(OIXMLDocument *)self version];
  [(OIXMLDocument *)v7 setVersion:v8];

  v9 = [(OIXMLDocument *)self characterEncoding];
  [(OIXMLDocument *)v7 setCharacterEncoding:v9];

  uint64_t v10 = [(NSString *)self->_encoding copyWithZone:a3];
  encoding = v7->_encoding;
  v7->_encoding = (NSString *)v10;

  return v7;
}

- (NSString)characterEncoding
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (NSString)version
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_encoding, 0);
  objc_storeStrong((id *)&self->_version, 0);
  objc_storeStrong((id *)&self->_rootElement, 0);
}

@end