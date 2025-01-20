@interface TCZipEntryTextWriterProvider
- (BOOL)isCompressed;
- (BOOL)setUp;
- (NSString)entryName;
- (OISFUZipArchiveOutputStream)outputStream;
- (TCZipEntryTextWriterProvider)initWithEntryName:(id)a3 outputStream:(id)a4 isCompressed:(BOOL)a5;
@end

@implementation TCZipEntryTextWriterProvider

- (TCZipEntryTextWriterProvider)initWithEntryName:(id)a3 outputStream:(id)a4 isCompressed:(BOOL)a5
{
  id v8 = a3;
  v9 = (OISFUZipArchiveOutputStream *)a4;
  v14.receiver = self;
  v14.super_class = (Class)TCZipEntryTextWriterProvider;
  v10 = [(TCZipEntryTextWriterProvider *)&v14 init];
  if (v10)
  {
    uint64_t v11 = [v8 copy];
    entryName = v10->_entryName;
    v10->_entryName = (NSString *)v11;

    v10->_outputStream = v9;
    v10->_isCompressed = a5;
  }

  return v10;
}

- (BOOL)setUp
{
  [(OISFUZipArchiveOutputStream *)self->_outputStream beginUnknownSizeEntryWithName:self->_entryName isCompressed:self->_isCompressed];
  IO = xmlOutputBufferCreateIO((xmlOutputWriteCallback)SFUSimpleXmlOutputWriteCallback, (xmlOutputCloseCallback)SFUSimpleXmlOutputCloseCallback, self->_outputStream, 0);
  xmlTextWriterPtr v4 = xmlNewTextWriter(IO);
  return [(TCXmlTextWriterProvider *)self setUpWithTextWriter:v4];
}

- (NSString)entryName
{
  return self->_entryName;
}

- (OISFUZipArchiveOutputStream)outputStream
{
  return self->_outputStream;
}

- (BOOL)isCompressed
{
  return self->_isCompressed;
}

- (void).cxx_destruct
{
}

@end