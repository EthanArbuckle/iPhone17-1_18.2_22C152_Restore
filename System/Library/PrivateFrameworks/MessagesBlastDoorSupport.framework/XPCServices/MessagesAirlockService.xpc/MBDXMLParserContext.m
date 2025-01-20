@interface MBDXMLParserContext
- (MBDXMLParserContext)initWithContent:(id)a3;
- (MBDXMLParserContext)initWithContentAsData:(id)a3;
- (NSArray)resultsForLogging;
- (NSData)inContentAsData;
- (NSString)name;
- (id)inContent;
@end

@implementation MBDXMLParserContext

- (MBDXMLParserContext)initWithContent:(id)a3
{
  v4 = [a3 dataUsingEncoding:4];
  v5 = [(MBDXMLParserContext *)self initWithContentAsData:v4];

  return v5;
}

- (MBDXMLParserContext)initWithContentAsData:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MBDXMLParserContext;
  v6 = [(MBDXMLParserContext *)&v9 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_inContentAsData, a3);
    [(MBDXMLParserContext *)v7 reset];
  }

  return v7;
}

- (id)inContent
{
  id v2 = [objc_alloc((Class)NSString) initWithData:self->_inContentAsData encoding:4];

  return v2;
}

- (NSString)name
{
  return (NSString *)@"Base";
}

- (NSArray)resultsForLogging
{
  return 0;
}

- (NSData)inContentAsData
{
  return (NSData *)objc_getProperty(self, a2, 8, 1);
}

- (void).cxx_destruct
{
}

@end