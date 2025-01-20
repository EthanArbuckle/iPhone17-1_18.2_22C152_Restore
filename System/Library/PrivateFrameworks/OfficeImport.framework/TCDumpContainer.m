@interface TCDumpContainer
- (TCDumpContainer)initWithByteSize:(int)a3 byteSizeFieldType:(int)a4 byteSizeFieldName:(id)a5 byteSizeCorrection:(int)a6 elementType:(id)a7;
- (TCDumpContainer)initWithByteSize:(int)a3 elementType:(id)a4;
- (TCDumpContainer)initWithByteSizeFieldName:(id)a3 byteSizeCorrection:(int)a4 elementType:(id)a5;
- (TCDumpContainer)initWithByteSizeFieldName:(id)a3 elementType:(id)a4;
- (TCDumpContainer)initWithByteSizeFieldType:(int)a3 byteSizeCorrection:(int)a4 elementType:(id)a5;
- (TCDumpContainer)initWithByteSizeFieldType:(int)a3 elementType:(id)a4;
- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5;
@end

@implementation TCDumpContainer

- (TCDumpContainer)initWithByteSize:(int)a3 byteSizeFieldType:(int)a4 byteSizeFieldName:(id)a5 byteSizeCorrection:(int)a6 elementType:(id)a7
{
  id v13 = a5;
  id v14 = a7;
  v18.receiver = self;
  v18.super_class = (Class)TCDumpContainer;
  v15 = [(TCDumpType *)&v18 init];
  v16 = v15;
  if (v15)
  {
    v15->mByteSize = a3;
    v15->mByteSizeFieldType = a4;
    objc_storeStrong((id *)&v15->mByteSizeFieldName, a5);
    v16->mByteSizeCorrection = a6;
    objc_storeStrong((id *)&v16->mElementType, a7);
  }

  return v16;
}

- (TCDumpContainer)initWithByteSize:(int)a3 elementType:(id)a4
{
  return [(TCDumpContainer *)self initWithByteSize:*(void *)&a3 byteSizeFieldType:0 byteSizeFieldName:0 byteSizeCorrection:0 elementType:a4];
}

- (TCDumpContainer)initWithByteSizeFieldType:(int)a3 elementType:(id)a4
{
  return [(TCDumpContainer *)self initWithByteSize:0 byteSizeFieldType:*(void *)&a3 byteSizeFieldName:0 byteSizeCorrection:0 elementType:a4];
}

- (TCDumpContainer)initWithByteSizeFieldType:(int)a3 byteSizeCorrection:(int)a4 elementType:(id)a5
{
  return [(TCDumpContainer *)self initWithByteSize:0 byteSizeFieldType:*(void *)&a3 byteSizeFieldName:0 byteSizeCorrection:*(void *)&a4 elementType:a5];
}

- (TCDumpContainer)initWithByteSizeFieldName:(id)a3 elementType:(id)a4
{
  return [(TCDumpContainer *)self initWithByteSize:0 byteSizeFieldType:0 byteSizeFieldName:a3 byteSizeCorrection:0 elementType:a4];
}

- (TCDumpContainer)initWithByteSizeFieldName:(id)a3 byteSizeCorrection:(int)a4 elementType:(id)a5
{
  return [(TCDumpContainer *)self initWithByteSize:0 byteSizeFieldType:0 byteSizeFieldName:a3 byteSizeCorrection:*(void *)&a4 elementType:a5];
}

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  id v14 = a5;
  if (self->mByteSizeFieldType)
  {
    v8 = [[TCDumpNumeric alloc] initWithType:self->mByteSizeFieldType];
    v9 = readIntegerFromBinaryToXml(v8, (NSString *)@"byteSize", a3, a4);
    self->mByteSize = self->mByteSizeCorrection + [v9 intValue];
  }
  if (self->mByteSizeFieldName)
  {
    v10 = objc_msgSend(v14, "valueForField:");
    self->mByteSize = self->mByteSizeCorrection + [v10 intValue];
  }
  off_t v11 = ftello(a3) + self->mByteSize;
  if (ftello(a3) < v11)
  {
    uint64_t v12 = 0;
    do
    {
      id v13 = xmlNewNode(0, (const xmlChar *)"child");
      xmlAddChild(a4, v13);
      sfaxmlSetLongNoNsProp(v13, (const xmlChar *)"index", v12);
      [(TCDumpType *)self->mElementType fromBinary:a3 toXml:v13 state:0];
      ++v12;
    }
    while (ftello(a3) < v11);
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mElementType, 0);
  objc_storeStrong((id *)&self->mByteSizeFieldName, 0);
}

@end