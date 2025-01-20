@interface EXTable
+ (id)edTableFromXmlTableElement:(_xmlNode *)a3 state:(id)a4;
@end

@implementation EXTable

+ (id)edTableFromXmlTableElement:(_xmlNode *)a3 state:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    v6 = [EDTable alloc];
    v7 = [v5 resources];
    v8 = [(EDTable *)v6 initWithResources:v7];

    id v54 = 0;
    BOOL v9 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v54);
    id v10 = v54;
    if (v9) {
      [(EDTable *)v8 setName:v10];
    }
    id v37 = v10;
    id v53 = 0;
    BOOL v11 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"displayName", &v53);
    id v12 = v53;
    if (v11) {
      [(EDTable *)v8 setDisplayName:v12];
    }
    v35 = v12;
    id v52 = 0;
    BOOL v13 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"ref", &v52);
    id v36 = v52;
    if (v13)
    {
      v14 = +[EXReference edReferenceFromXmlReference:v36];
      [(EDTable *)v8 setTableRange:v14];
    }
    uint64_t v51 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"totalsRowCount", &v51)) {
      [(EDTable *)v8 setTotalsRowCount:v51];
    }
    uint64_t v50 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"headerRowCount", &v50)) {
      [(EDTable *)v8 setHeaderRowCount:v50];
    }
    uint64_t v49 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"headerRowBorderDxfId", &v49)) {
      [(EDTable *)v8 setHeaderRowBorderDxfIndex:v49];
    }
    uint64_t v48 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataAreaBorderDxfId", &v48)) {
      [(EDTable *)v8 setDataAreaBorderDxfIndex:v48];
    }
    uint64_t v47 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"totalsRowBorderDxfId", &v47)) {
      [(EDTable *)v8 setTotalsRowBorderDxfIndex:v47];
    }
    uint64_t v46 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"headerRowDxfId", &v46)) {
      [(EDTable *)v8 setHeaderRowDxfIndex:v46];
    }
    uint64_t v45 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataDxfId", &v45)) {
      [(EDTable *)v8 setDataAreaDxfIndex:v45];
    }
    uint64_t v44 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"totalsRowDxfId", &v44)) {
      [(EDTable *)v8 setTotalsRowDxfIndex:v44];
    }
    uint64_t v43 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"tableBorderDxfId", &v43)) {
      [(EDTable *)v8 setTableBorderDxfIndex:v43];
    }
    v15 = [(EDTable *)v8 tableColumns];
    v16 = [v5 EXSpreadsheetMLNamespace];
    v17 = (_xmlNode *)OCXFindChild(a3, v16, "tableColumns");

    if (v17)
    {
      v18 = [v5 EXSpreadsheetMLNamespace];
      Child = (_xmlNode *)OCXFindChild(v17, v18, "tableColumn");

      while (Child)
      {
        v20 = +[EXTableColumn edTableColumnFromXmlTableColumnElement:Child state:v5];
        [v15 addObject:v20];

        v21 = [v5 EXSpreadsheetMLNamespace];
        Child = OCXFindNextChild(Child, v21, (xmlChar *)"tableColumn");
      }
    }
    v22 = [v5 EXSpreadsheetMLNamespace];
    v23 = v37;
    v24 = (_xmlNode *)OCXFindChild(a3, v22, "autoFilter");

    if (v24)
    {
      v25 = [(EDTable *)v8 columnFilters];
      v26 = [v5 EXSpreadsheetMLNamespace];
      v27 = (_xmlNode *)OCXFindChild(v24, v26, "filterColumn");

      while (v27)
      {
        v28 = +[EXTableFilterColumn edTableFilterColumnFromXmlTableFilterColumnElement:v27 state:v5];
        [v25 addObject:v28];

        v29 = [v5 EXSpreadsheetMLNamespace];
        v27 = OCXFindNextChild(v27, v29, (xmlChar *)"filterColumn");
      }
      v23 = v37;
    }
    v30 = [v5 EXSpreadsheetMLNamespace];
    v31 = (_xmlNode *)OCXFindChild(a3, v30, "tableStyleInfo");

    if (v31)
    {
      id v42 = 0;
      BOOL v32 = CXOptionalStringAttribute(v31, (void *)CXNoNamespace, (xmlChar *)"name", &v42);
      id v33 = v42;
      if (v32) {
        [(EDTable *)v8 setStyleName:v33];
      }
      BOOL v41 = 0;
      if (CXOptionalBoolAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"showFirstColumn", &v41)) {
        [(EDTable *)v8 setShowFirstColumn:v41];
      }
      BOOL v40 = 0;
      if (CXOptionalBoolAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"showLastColumn", &v40)) {
        [(EDTable *)v8 setShowLastColumn:v40];
      }
      BOOL v39 = 0;
      if (CXOptionalBoolAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"showRowStripes", &v39)) {
        [(EDTable *)v8 setShowRowStripes:v39];
      }
      BOOL v38 = 0;
      if (CXOptionalBoolAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"showColumnStripes", &v38)) {
        [(EDTable *)v8 setShowColumnStripes:v38];
      }
    }
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

@end