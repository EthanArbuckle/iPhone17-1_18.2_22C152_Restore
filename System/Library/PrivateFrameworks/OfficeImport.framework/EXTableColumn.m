@interface EXTableColumn
+ (id)edTableColumnFromXmlTableColumnElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation EXTableColumn

+ (id)edTableColumnFromXmlTableColumnElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = [EDTableColumn alloc];
    v7 = [v5 resources];
    v8 = [(EDTableColumn *)v6 initWithResources:v7];

    id v25 = 0;
    BOOL v9 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v25);
    id v10 = v25;
    if (v9)
    {
      v11 = (void *)[objc_alloc(MEMORY[0x263F089D8]) initWithString:v10];
      +[EXString replaceEscapeAsciiCodes:v11];
      v12 = +[EDString edStringWithString:v11];
      [(EDTableColumn *)v8 setName:v12];
    }
    id v24 = 0;
    BOOL v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"uniqueName", &v24);
    id v14 = v24;
    if (v13)
    {
      v15 = +[EDString edStringWithString:v14];
      [(EDTableColumn *)v8 setUniqueName:v15];
    }
    id v23 = 0;
    BOOL v16 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"totalsRowLabel", &v23);
    id v17 = v23;
    if (v16)
    {
      v18 = +[EDString edStringWithString:v17];
      [(EDTableColumn *)v8 setTotalsRowLabel:v18];
    }
    uint64_t v22 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"headerRowDxfId", &v22)) {
      [(EDTableColumn *)v8 setHeaderRowDxfIndex:v22];
    }
    uint64_t v21 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataDxfId", &v21)) {
      [(EDTableColumn *)v8 setDataAreaDxfIndex:v21];
    }
    uint64_t v20 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"totalsRowDxfId", &v20)) {
      [(EDTableColumn *)v8 setTotalsRowDxfIndex:v20];
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end