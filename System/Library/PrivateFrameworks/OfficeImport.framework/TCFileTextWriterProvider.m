@interface TCFileTextWriterProvider
- (BOOL)setUp;
- (NSString)filePath;
- (TCFileTextWriterProvider)initWithFilePath:(id)a3;
@end

@implementation TCFileTextWriterProvider

- (TCFileTextWriterProvider)initWithFilePath:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCFileTextWriterProvider;
  v5 = [(TCFileTextWriterProvider *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    filePath = v5->_filePath;
    v5->_filePath = (NSString *)v6;
  }
  return v5;
}

- (BOOL)setUp
{
  xmlTextWriterPtr v3 = xmlNewTextWriterFilename([(NSString *)self->_filePath UTF8String], 0);
  return [(TCXmlTextWriterProvider *)self setUpWithTextWriter:v3];
}

- (NSString)filePath
{
  return self->_filePath;
}

- (void).cxx_destruct
{
}

@end