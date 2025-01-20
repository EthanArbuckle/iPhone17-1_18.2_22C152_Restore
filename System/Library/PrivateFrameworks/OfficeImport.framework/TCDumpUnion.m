@interface TCDumpUnion
- (TCDumpUnion)initWithSelectorField:(id)a3 members:(id)a4;
- (TCDumpUnion)initWithSelectorFieldName:(id)a3 selectorEnumType:(id)a4 members:(id)a5;
- (TCDumpUnion)initWithSelectorFieldName:(id)a3 selectorEnumType:(id)a4 selectorField:(id)a5 members:(id)a6;
- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5;
@end

@implementation TCDumpUnion

- (TCDumpUnion)initWithSelectorFieldName:(id)a3 selectorEnumType:(id)a4 selectorField:(id)a5 members:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v32 = a5;
  id v13 = a6;
  v36.receiver = self;
  v36.super_class = (Class)TCDumpUnion;
  v33 = v11;
  v14 = [(TCDumpType *)&v36 init];
  p_isa = (id *)&v14->super.super.isa;
  if (v14)
  {
    v15 = v14;
    objc_storeStrong((id *)&v14->mSelectorFieldName, a3);
    p_mSelectorField = (id *)&v15->mSelectorField;
    objc_storeStrong((id *)&v15->mSelectorField, a5);
    v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    mSelectorToMemberMap = v15->mSelectorToMemberMap;
    v15->mSelectorToMemberMap = v16;

    unint64_t v18 = objc_msgSend(v13, "count", v32);
    v19 = v12;
    if (v18 >= 3)
    {
      unint64_t v20 = v18 / 3;
      uint64_t v21 = 1;
      do
      {
        v22 = [v13 objectAtIndex:v21 - 1];
        unsigned int v23 = [v22 characterAtIndex:0];
        if (v23 <= 0x7F)
        {
          if ((*(_DWORD *)(MEMORY[0x263EF8318] + 4 * v23 + 60) & 0x400) == 0)
          {
LABEL_8:
            v25 = v19;
            if (!v19)
            {
              v25 = [*p_mSelectorField enumType];
            }
            v19 = v25;
            uint64_t v24 = [v25 valueForName:v22];
            goto LABEL_11;
          }
        }
        else if (!__maskrune(v23, 0x400uLL))
        {
          goto LABEL_8;
        }
        uint64_t v24 = objc_msgSend(NSNumber, "numberWithLong:", (int)objc_msgSend(v22, "intValue"));
LABEL_11:
        v26 = (void *)v24;
        v27 = [v13 objectAtIndex:v21 + 1];
        v28 = [v13 objectAtIndex:v21];
        v29 = [[TCDumpField alloc] initWithType:v27 name:v28];
        [p_isa[4] setObject:v29 forKey:v26];

        v21 += 3;
        --v20;
      }
      while (v20);
    }
  }
  else
  {
    v19 = v12;
  }
  v30 = p_isa;

  return v30;
}

- (TCDumpUnion)initWithSelectorFieldName:(id)a3 selectorEnumType:(id)a4 members:(id)a5
{
  return [(TCDumpUnion *)self initWithSelectorFieldName:a3 selectorEnumType:a4 selectorField:0 members:a5];
}

- (TCDumpUnion)initWithSelectorField:(id)a3 members:(id)a4
{
  return [(TCDumpUnion *)self initWithSelectorFieldName:0 selectorEnumType:0 selectorField:a3 members:a4];
}

- (void)fromBinary:(__sFILE *)a3 toXml:(_xmlNode *)a4 state:(id)a5
{
  id v8 = a5;
  id v15 = v8;
  if (self->mSelectorFieldName) {
    objc_msgSend(v8, "valueForField:");
  }
  else {
  v9 = readIntegerFromBinaryToXml(self->mSelectorField, (NSString *)@"selector", a3, a4);
  }
  v10 = [(NSMutableDictionary *)self->mSelectorToMemberMap objectForKey:v9];
  id v11 = v10;
  if (v10)
  {
    id v12 = [v10 name];
    id v13 = xmlNewNode(0, (const xmlChar *)[v12 UTF8String]);
    xmlAddChild(a4, v13);
    v14 = [v11 type];
    [v14 fromBinary:a3 toXml:v13 state:0];
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->mSelectorToMemberMap, 0);
  objc_storeStrong((id *)&self->mSelectorField, 0);
  objc_storeStrong((id *)&self->mSelectorFieldName, 0);
}

@end