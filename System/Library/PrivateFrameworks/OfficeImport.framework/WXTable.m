@interface WXTable
+ (id)newTableGrid:(id)a3;
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXTable

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v22 = a4;
  id v7 = a5;
  v8 = [v7 WXMainNamespace];
  v9 = (_xmlNode *)OCXFindChild(a3, v8, "tblPr");

  if (v9)
  {
    objc_msgSend(v7, "WXMainNamespace", 0);
    v10 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
    v11 = (_xmlNode *)OCXFindChild(v9, v10, "tblStyle");

    if (!v11) {
      goto LABEL_5;
    }
    v12 = [v7 WXMainNamespace];
    v13 = CXDefaultStringAttribute(v11, v12, (xmlChar *)"val", 0);

    v14 = [v22 document];
    v15 = [v14 styleSheet];

    uint64_t v16 = [v15 styleWithId:v13];

    uint64_t v20 = v16;
    if (v16)
    {
      v17 = [v22 properties];
      [v17 setBaseStyle:v16];
    }
    else
    {
LABEL_5:
      uint64_t v20 = 0;
    }
    v18 = objc_msgSend(v22, "properties", v20);
    +[WXTableProperties readFrom:v9 to:v18 state:v7];
  }
  else
  {
    uint64_t v21 = 0;
  }
  objc_msgSend(v7, "WXMainNamespace", v21);
  v19 = (CXNamespace *)objc_claimAutoreleasedReturnValue();
  OCXFindChild(a3, v19, "tblGrid");

  operator new();
}

+ (id)newTableGrid:(id)a3
{
  uint64_t v30 = *MEMORY[0x263EF8340];
  id v24 = a3;
  v3 = [MEMORY[0x263EFF9C0] set];
  for (unint64_t i = 0; i < [v24 rowCount]; ++i)
  {
    v5 = [v24 rowAt:i];
    for (unint64_t j = 0; j < [v5 cellCount]; ++j)
    {
      id v7 = [v5 cellAt:j];
      v8 = [v7 properties];
      uint64_t v9 = (int)[v8 position];

      v10 = [NSNumber numberWithUnsignedLong:v9];
      [v3 addObject:v10];
    }
  }
  id v22 = [MEMORY[0x263F08B30] sortDescriptorWithKey:@"self" ascending:1];
  v11 = objc_msgSend(MEMORY[0x263EFF8C0], "arrayWithObject:");
  v23 = [v3 sortedArrayUsingDescriptors:v11];

  id v12 = objc_alloc_init(MEMORY[0x263EFF980]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = v23;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
  if (v14)
  {
    uint64_t v15 = 0;
    uint64_t v16 = *(void *)v26;
    do
    {
      for (uint64_t k = 0; k != v14; ++k)
      {
        if (*(void *)v26 != v16) {
          objc_enumerationMutation(v13);
        }
        v18 = *(void **)(*((void *)&v25 + 1) + 8 * k);
        uint64_t v19 = [v18 unsignedLongValue];
        uint64_t v20 = [NSNumber numberWithLong:v19 - v15];
        [v12 addObject:v20];
        uint64_t v15 = [v18 unsignedLongValue];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v25 objects:v29 count:16];
    }
    while (v14);
  }

  return v12;
}

@end