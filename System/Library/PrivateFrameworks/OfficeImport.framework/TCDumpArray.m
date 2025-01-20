@interface TCDumpArray
- (TCDumpArray)initWithCount:(int)a3 countFieldType:(int)a4 countFieldName:(id)a5 elementType:(id)a6;
- (TCDumpArray)initWithCount:(int)a3 elementType:(id)a4;
- (TCDumpArray)initWithCountFieldName:(id)a3 elementType:(id)a4;
- (TCDumpArray)initWithCountFieldType:(int)a3 elementType:(id)a4;
- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5;
@end

@implementation TCDumpArray

- (TCDumpArray)initWithCount:(int)a3 countFieldType:(int)a4 countFieldName:(id)a5 elementType:(id)a6
{
  id v11 = a5;
  id v12 = a6;
  v16.receiver = self;
  v16.super_class = (Class)TCDumpArray;
  v13 = [(TCDumpType *)&v16 init];
  v14 = v13;
  if (v13)
  {
    v13->mCount = a3;
    v13->mCountFieldType = a4;
    objc_storeStrong((id *)&v13->mCountFieldName, a5);
    objc_storeStrong((id *)&v14->mElementType, a6);
  }

  return v14;
}

- (TCDumpArray)initWithCount:(int)a3 elementType:(id)a4
{
  return [(TCDumpArray *)self initWithCount:*(void *)&a3 countFieldType:0 countFieldName:0 elementType:a4];
}

- (TCDumpArray)initWithCountFieldType:(int)a3 elementType:(id)a4
{
  return [(TCDumpArray *)self initWithCount:0 countFieldType:*(void *)&a3 countFieldName:0 elementType:a4];
}

- (TCDumpArray)initWithCountFieldName:(id)a3 elementType:(id)a4
{
  return [(TCDumpArray *)self initWithCount:0 countFieldType:0 countFieldName:a3 elementType:a4];
}

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  id v15 = a5;
  if (self->mCountFieldType)
  {
    v8 = [[TCDumpNumeric alloc] initWithType:self->mCountFieldType];
    v9 = readIntegerFromBinaryToXml(v8, (NSString *)@"count", a3, a4);
    self->mCount = [v9 intValue];
  }
  if (self->mCountFieldName)
  {
    v10 = objc_msgSend(v15, "valueForField:");
    self->mCount = [v10 intValue];
  }
  if (self->mCount >= 1)
  {
    uint64_t v11 = 0;
    do
    {
      id v12 = xmlNewNode(0, (const xmlChar *)"element");
      xmlAddChild(a4, v12);
      sfaxmlSetLongNoNsProp(v12, (const xmlChar *)"index", v11);
      [(TCDumpType *)self->mElementType fromBinary:a3 toXml:v12 state:0];
      ++v11;
    }
    while (v11 < self->mCount);
  }
  if (self->mPaddingSize > 0)
  {
    v13 = xmlNewNode(0, (const xmlChar *)"padding");
    xmlAddChild(a4, v13);
    v14 = [[TCDumpBlob alloc] initWithSize_:self->mPaddingSize];
    [(TCDumpBlob *)v14 fromBinary:a3 toXml:v13 state:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mElementType, 0);
  objc_storeStrong((id *)&self->mCountFieldName, 0);
}

@end