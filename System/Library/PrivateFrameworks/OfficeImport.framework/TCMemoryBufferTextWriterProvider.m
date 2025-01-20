@interface TCMemoryBufferTextWriterProvider
- (BOOL)setUp;
- (NSMutableData)memoryBuffer;
- (TCMemoryBufferTextWriterProvider)initWithMemoryBuffer:(id)a3;
@end

@implementation TCMemoryBufferTextWriterProvider

- (TCMemoryBufferTextWriterProvider)initWithMemoryBuffer:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TCMemoryBufferTextWriterProvider;
  v6 = [(TCMemoryBufferTextWriterProvider *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_memoryBuffer, a3);
  }

  return v7;
}

- (BOOL)setUp
{
  IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)sfaxmlNSMutableDataWriteCallback, 0, self->_memoryBuffer, 0);
  if (IO)
  {
    xmlTextWriterPtr v4 = xmlNewTextWriter(IO);
    LOBYTE(IO) = [(TCXmlTextWriterProvider *)self setUpWithTextWriter:v4];
  }
  return (char)IO;
}

- (NSMutableData)memoryBuffer
{
  return self->_memoryBuffer;
}

- (void).cxx_destruct
{
}

@end