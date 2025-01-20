@interface EXTableFilterColumn
+ (id)edTableFilterColumnFromXmlTableFilterColumnElement:(_xmlNode *)a3 state:(id)a4;
+ (int)edFilterOperatorFromXmlTypeString:(id)a3;
@end

@implementation EXTableFilterColumn

+ (id)edTableFilterColumnFromXmlTableFilterColumnElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  if (a3)
  {
    id v31 = a1;
    v7 = objc_alloc_init(EDTableFilterColumn);
    uint64_t v36 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"colId", &v36)) {
      [(EDTableFilterColumn *)v7 setColumnIndex:v36];
    }
    v8 = [v6 EXSpreadsheetMLNamespace];
    uint64_t v9 = OCXFindChild(a3, v8, "filters");

    v10 = (_xmlNode *)v9;
    if (v9
      || ([v6 EXSpreadsheetMLNamespace],
          v11 = (CXNamespace *)objc_claimAutoreleasedReturnValue(),
          v10 = (_xmlNode *)OCXFindChild(a3, v11, "customFilters"),
          v11,
          v10))
    {
      double v35 = 0.0;
      BOOL v12 = !CXOptionalLongAttribute(v10, (CXNamespace *)CXNoNamespace, (xmlChar *)"and", (uint64_t *)&v35);
      uint64_t v13 = *(void *)&v35 != 1 || (unint64_t)v12;
      [(EDTableFilterColumn *)v7 setFiltersRelation:v13];
      v14 = [v6 EXSpreadsheetMLNamespace];
      uint64_t v15 = v9 ? OCXFindChild(v10, v14, "filter") : OCXFindChild(v10, v14, "customFilter");
      v16 = (_xmlNode *)v15;

      while (v16)
      {
        v17 = +[EXTableFilter edTableFilterFromXmlTableFilterElement:v16 state:v6];
        [(EDTableFilterColumn *)v7 addFilter:v17];

        v18 = [v6 EXSpreadsheetMLNamespace];
        if (v9) {
          Child = OCXFindNextChild(v16, v18, (xmlChar *)"filter");
        }
        else {
          Child = OCXFindNextChild(v16, v18, (xmlChar *)"customFilter");
        }
        v16 = Child;
      }
    }
    v20 = [v6 EXSpreadsheetMLNamespace];
    v21 = (_xmlNode *)OCXFindChild(a3, v20, "top10");

    if (v21)
    {
      v22 = +[EDTableFilter edTableFilter];
      BOOL v34 = 0;
      BOOL v23 = CXOptionalBoolAttribute(v21, (CXNamespace *)CXNoNamespace, (xmlChar *)"top", &v34);
      if (v23 && !v34) {
        uint64_t v24 = 9;
      }
      else {
        uint64_t v24 = 8;
      }
      [v22 setOperatorType:v24];
      BOOL v33 = 0;
      if (CXOptionalBoolAttribute(v21, (CXNamespace *)CXNoNamespace, (xmlChar *)"percent", &v33)) {
        [v22 setScale:v33];
      }
      double v35 = 0.0;
      if (CXOptionalDoubleAttribute(v21, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v35)) {
        [v22 setValue:v35];
      }
      if (CXOptionalDoubleAttribute(v21, (CXNamespace *)CXNoNamespace, (xmlChar *)"filterVal", &v35)) {
        [v22 setFilterValue:v35];
      }
      [(EDTableFilterColumn *)v7 addFilter:v22];
    }
    v25 = [v6 EXSpreadsheetMLNamespace];
    v26 = (_xmlNode *)OCXFindChild(a3, v25, "dynamicFilter");

    if (v26)
    {
      v27 = +[EDTableFilter edTableFilter];
      id v32 = 0;
      BOOL v28 = CXOptionalStringAttribute(v26, (void *)CXNoNamespace, (xmlChar *)"type", &v32);
      id v29 = v32;
      if (v28) {
        objc_msgSend(v27, "setOperatorType:", objc_msgSend(v31, "edFilterOperatorFromXmlTypeString:", v29));
      }
      double v35 = 0.0;
      if (CXOptionalDoubleAttribute(v26, (CXNamespace *)CXNoNamespace, (xmlChar *)"val", &v35)) {
        [v27 setValue:v35];
      }
      [(EDTableFilterColumn *)v7 addFilter:v27];
    }
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

+ (int)edFilterOperatorFromXmlTypeString:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_6;
  }
  if (([v3 isEqualToString:@"aboveAverage"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"belowAverage"])
    {
      int v5 = 11;
      goto LABEL_7;
    }
LABEL_6:
    int v5 = 0;
    goto LABEL_7;
  }
  int v5 = 10;
LABEL_7:

  return v5;
}

@end