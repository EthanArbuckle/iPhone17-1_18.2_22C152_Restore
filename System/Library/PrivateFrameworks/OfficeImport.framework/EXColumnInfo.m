@interface EXColumnInfo
+ (id)edColumnInfoFromXmlColumnInfoElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation EXColumnInfo

+ (id)edColumnInfoFromXmlColumnInfoElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  v6 = v5;
  if (a3)
  {
    v7 = [v5 currentSheet];
    v8 = [EDColumnInfo alloc];
    v9 = [v6 resources];
    v10 = [(EDColumnInfo *)v8 initWithResources:v9 worksheet:v7];

    BOOL v18 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"hidden", &v18)) {
      [(EDColumnInfo *)v10 setHidden:v18];
    }
    double v17 = 0.0;
    if (!CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"width", &v17)) {
      CXOptionalDoubleAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"defaultWidth", &v17);
    }
    double v11 = v17;
    if (v17 < 0.0)
    {
      double v17 = 1300.0;
      double v11 = 1300.0;
    }
    [(EDColumnInfo *)v10 setWidth:v11];
    uint64_t v15 = -1;
    uint64_t v16 = -1;
    CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"min", &v16);
    CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"max", &v15);
    [(EDColumnInfo *)v10 setRangeWithFirstColumn:(v16 - 1) lastColumn:(v15 - 1)];
    uint64_t v14 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"style", &v14)) {
      [(EDColumnInfo *)v10 setStyleIndex:v14];
    }
    uint64_t v13 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"outlineLevel", &v13)) {
      [(EDColumnInfo *)v10 setOutlineLevel:v13];
    }
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end