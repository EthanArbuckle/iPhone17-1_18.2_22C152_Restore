@interface TCDumpStruct
- (TCDumpStruct)initWithMembers:(id)a3;
- (TCDumpStruct)initWithSize:(int64_t)a3 members:(id)a4;
- (TCDumpStruct)initWithSize:(int64_t)a3 sizeFieldName:(id)a4 sizeCorrection:(int)a5 members:(id)a6;
- (TCDumpStruct)initWithSizeFieldName:(id)a3 members:(id)a4;
- (TCDumpStruct)initWithSizeFieldName:(id)a3 sizeCorrection:(int)a4 members:(id)a5;
- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5;
@end

@implementation TCDumpStruct

- (TCDumpStruct)initWithSize:(int64_t)a3 sizeFieldName:(id)a4 sizeCorrection:(int)a5 members:(id)a6
{
  id v11 = a4;
  id v12 = a6;
  v24.receiver = self;
  v24.super_class = (Class)TCDumpStruct;
  v13 = [(TCDumpType *)&v24 init];
  v14 = v13;
  if (v13)
  {
    v13->mSize = a3;
    objc_storeStrong((id *)&v13->mSizeFieldName, a4);
    v14->mSizeCorrection = a5;
    v15 = (NSMutableArray *)objc_alloc_init(MEMORY[0x263EFF980]);
    mMembers = v14->mMembers;
    v14->mMembers = v15;

    unint64_t v17 = [v12 count];
    if (v17 >= 2)
    {
      unint64_t v18 = v17 >> 1;
      uint64_t v19 = 1;
      do
      {
        v20 = [v12 objectAtIndex:v19];
        v21 = [v12 objectAtIndex:v19 - 1];
        v22 = [[TCDumpField alloc] initWithType:v20 name:v21];
        [(NSMutableArray *)v14->mMembers addObject:v22];

        v19 += 2;
        --v18;
      }
      while (v18);
    }
  }

  return v14;
}

- (TCDumpStruct)initWithMembers:(id)a3
{
  return [(TCDumpStruct *)self initWithSize:-1 sizeFieldName:0 sizeCorrection:0 members:a3];
}

- (TCDumpStruct)initWithSize:(int64_t)a3 members:(id)a4
{
  return [(TCDumpStruct *)self initWithSize:a3 sizeFieldName:0 sizeCorrection:0 members:a4];
}

- (TCDumpStruct)initWithSizeFieldName:(id)a3 members:(id)a4
{
  return [(TCDumpStruct *)self initWithSize:-1 sizeFieldName:a3 sizeCorrection:0 members:a4];
}

- (TCDumpStruct)initWithSizeFieldName:(id)a3 sizeCorrection:(int)a4 members:(id)a5
{
  return [(TCDumpStruct *)self initWithSize:-1 sizeFieldName:a3 sizeCorrection:*(void *)&a4 members:a5];
}

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  id v25 = a5;
  v8 = objc_alloc_init(TCDumpBinaryToXmlState);
  off_t v24 = ftello(a3);
  uint64_t v9 = [(NSMutableArray *)self->mMembers count];
  if (v9)
  {
    for (uint64_t i = 0; i != v9; ++i)
    {
      id v11 = [(NSMutableArray *)self->mMembers objectAtIndex:i];
      id v12 = [v11 name];

      v13 = a4;
      if (v12)
      {
        id v14 = [v11 name];
        v13 = xmlNewNode(0, (const xmlChar *)[v14 UTF8String]);

        xmlAddChild(a4, v13);
      }
      v15 = [v11 name];
      [(TCDumpBinaryToXmlState *)v8 setCurrentField:v15];

      v16 = [v11 type];
      [v16 fromBinary:a3 toXml:v13 state:v8];

      [(TCDumpBinaryToXmlState *)v8 setCurrentField:0];
    }
  }
  off_t v17 = ftello(a3);
  if (self->mSizeFieldName)
  {
    unint64_t v18 = objc_msgSend(v25, "valueForField:");
    if (!v18)
    {
      unint64_t v18 = [(TCDumpBinaryToXmlState *)v8 valueForField:self->mSizeFieldName];
    }
    self->int64_t mSize = self->mSizeCorrection + (int)[v18 intValue];
  }
  off_t v19 = v17 - v24;
  int64_t mSize = self->mSize;
  if (mSize != -1 && mSize > v19)
  {
    v22 = xmlNewNode(0, (const xmlChar *)"padding");
    xmlAddChild(a4, v22);
    v23 = [[TCDumpBlob alloc] initWithSize_:self->mSize - v19];
    [(TCDumpBlob *)v23 fromBinary:a3 toXml:v22 state:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mMembers, 0);
  objc_storeStrong((id *)&self->mSizeFieldName, 0);
}

@end