@interface EXPivotTable
+ (id)edPivotTableFromXmlPivotTableElement:(_xmlNode *)a3 state:(id)a4;
+ (int)edPivotAreaTypeFrom:(id)a3;
+ (int)edPivotConditionalFormatScopeFrom:(id)a3;
+ (int)edPivotConditionalFormatTypeFrom:(id)a3;
+ (int)edPivotDatFieldFormatFrom:(id)a3;
+ (int)edPivotFieldAxisFrom:(id)a3;
+ (int)edPivotItemTypeFrom:(id)a3;
+ (void)readConditionalFormatsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5;
+ (void)readDataFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5;
+ (void)readFieldItemsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5;
+ (void)readFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5;
+ (void)readItemsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5;
+ (void)readLocationFrom:(_xmlNode *)a3 toPivotTable:(id)a4;
+ (void)readPageFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5;
+ (void)readPivotAreaReferencesFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5;
+ (void)readPivotAreasFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5;
+ (void)readPivotFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5;
+ (void)readStyleInfoFrom:(_xmlNode *)a3 toPivotTable:(id)a4;
@end

@implementation EXPivotTable

+ (id)edPivotTableFromXmlPivotTableElement:(_xmlNode *)a3 state:(id)a4
{
  id v6 = a4;
  v7 = v6;
  if (a3)
  {
    v8 = [v6 resources];
    v9 = +[EDPivotTable pivotTableWithResources:v8];

    v10 = [v7 EXSpreadsheetMLNamespace];
    objc_msgSend(a1, "readLocationFrom:toPivotTable:", OCXFindChild(a3, v10, "location"), v9);

    v11 = [v7 EXSpreadsheetMLNamespace];
    objc_msgSend(a1, "readStyleInfoFrom:toPivotTable:", OCXFindChild(a3, v11, "pivotTableStyleInfo"), v9);

    v12 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v13 = OCXFindChild(a3, v12, "pivotFields");
    v14 = [v9 pivotFields];
    [a1 readPivotFieldsFrom:v13 toCollection:v14 state:v7];

    v15 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v16 = OCXFindChild(a3, v15, "rowFields");
    v17 = [v9 rowFields];
    [a1 readFieldsFrom:v16 toCollection:v17 state:v7];

    v18 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v19 = OCXFindChild(a3, v18, "rowItems");
    v20 = [v9 rowItems];
    [a1 readItemsFrom:v19 toCollection:v20 state:v7];

    v21 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v22 = OCXFindChild(a3, v21, "colFields");
    v23 = [v9 columnFields];
    [a1 readFieldsFrom:v22 toCollection:v23 state:v7];

    v24 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v25 = OCXFindChild(a3, v24, "colItems");
    v26 = [v9 columnItems];
    [a1 readItemsFrom:v25 toCollection:v26 state:v7];

    v27 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v28 = OCXFindChild(a3, v27, "pageFields");
    v29 = [v9 pageFields];
    [a1 readPageFieldsFrom:v28 toCollection:v29 state:v7];

    v30 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v31 = OCXFindChild(a3, v30, "dataFields");
    v32 = [v9 dataFields];
    [a1 readDataFieldsFrom:v31 toCollection:v32 state:v7];

    v33 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v34 = OCXFindChild(a3, v33, "conditionalFormats");
    v35 = [v9 conditionalFormats];
    [a1 readConditionalFormatsFrom:v34 toCollection:v35 state:v7];

    v36 = [v7 EXSpreadsheetMLNamespace];
    uint64_t v37 = OCXFindChild(a3, v36, "pivotAreas");
    v38 = [v9 pivotAreas];
    [a1 readPivotAreasFrom:v37 toCollection:v38 state:v7];

    id v58 = 0;
    LODWORD(v36) = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"colHeaderCaption", &v58);
    id v39 = v58;
    if (v36) {
      [v9 setColumnHeaderCaption:v39];
    }
    id v57 = v39;
    BOOL v40 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"rowHeaderCaption", &v57);
    id v41 = v57;

    if (v40) {
      [v9 setRowHeaderCaption:v41];
    }
    id v56 = v41;
    BOOL v42 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"pageStyleName", &v56);
    id v43 = v56;

    if (v42) {
      [v9 setPageStyleName:v43];
    }
    id v55 = v43;
    BOOL v44 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"pivotTableStyle", &v55);
    id v45 = v55;

    if (v44) {
      [v9 setStyleName:v45];
    }
    id v54 = v45;
    BOOL v46 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v54);
    id v47 = v54;

    if (v46) {
      [v9 setName:v47];
    }
    BOOL v53 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyNumberFormats", &v53)) {
      [v9 setApplyNumberFormats:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyBorderFormats", &v53)) {
      [v9 setApplyBorderFormats:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyFontFormats", &v53)) {
      [v9 setApplyFontFormats:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyPatternFormats", &v53)) {
      [v9 setApplyPatternFormats:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyAlignmentFormats", &v53)) {
      [v9 setApplyAlignmentFormats:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"applyWidthHeightFormats", &v53)) {
      [v9 setApplyWidthHeightFormats:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"colGrandTotals", &v53)) {
      [v9 setColGrandTotals:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"useAutoFormatting", &v53)) {
      [v9 setUseAutoFormatting:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rowGrandTotals", &v53)) {
      [v9 setRowGrandTotals:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"customListSort", &v53)) {
      [v9 setCustomListSort:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"compactData", &v53)) {
      [v9 setCompactData:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"compact", &v53)) {
      [v9 setCompact:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataCaption", &v53)) {
      [v9 setDataCaption:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataOnRows", &v53)) {
      [v9 setDataOnRows:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"mergeItem", &v53)) {
      [v9 setMergeItem:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"disableFieldList", &v53)) {
      [v9 setDisableFieldList:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"multipleFieldFilters", &v53)) {
      [v9 setMultipleFieldFilters:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"outline", &v53)) {
      [v9 setOutline:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"outlineData", &v53)) {
      [v9 setOutlineData:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"pageOverThenDown", &v53)) {
      [v9 setPageOverThenDown:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showCalcMbrs", &v53)) {
      [v9 setShowCalcMbrs:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showDataDropDown", &v53)) {
      [v9 setShowDataDropDown:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showDropZones", &v53)) {
      [v9 setShowDropZones:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showEmptyCol", &v53)) {
      [v9 setShowEmptyCol:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showEmptyRow", &v53)) {
      [v9 setShowEmptyRow:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showHeaders", &v53)) {
      [v9 setShowHeaders:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMemberPropertyTips", &v53)) {
      [v9 setShowMemberPropertyTips:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMultipleLabel", &v53)) {
      [v9 setShowMultipleLabel:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showMissing", &v53)) {
      [v9 setShowMissing:v53];
    }
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"subtotalHiddenItems", &v53)) {
      [v9 setSubtotalHiddenItems:v53];
    }
    uint64_t v52 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"pageWrap", &v52)) {
      [v9 setPageWrap:v52];
    }
    uint64_t v51 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"autoFormatId", &v51)) {
      [v9 setAutoFormatId:v51];
    }
    uint64_t v50 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataPosition", &v50)) {
      [v9 setDataPosition:v50];
    }
    id v48 = v9;
  }
  else
  {
    id v48 = 0;
  }

  return v48;
}

+ (void)readLocationFrom:(_xmlNode *)a3 toPivotTable:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v14 = 0;
    BOOL v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"ref", &v14);
    id v7 = v14;
    if (v6)
    {
      v8 = +[EXReference edReferenceFromXmlReference:v7];
      [v5 setPivotTableRange:v8];
    }
    uint64_t v13 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstHeaderRow", &v13)) {
      [v5 setFirstHeaderRow:v13];
    }
    uint64_t v12 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstDataRow", &v12)) {
      [v5 setFirstDataRow:v12];
    }
    uint64_t v11 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"firstDataCol", &v11)) {
      [v5 setFirstDataColumn:v11];
    }
    uint64_t v10 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"rowPageCount", &v10)) {
      [v5 setRowPageCount:v10];
    }
    uint64_t v9 = -1;
    if (CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"colPageCount", &v9)) {
      [v5 setColumnPageCount:v9];
    }
  }
}

+ (void)readStyleInfoFrom:(_xmlNode *)a3 toPivotTable:(id)a4
{
  id v5 = a4;
  if (a3)
  {
    id v13 = 0;
    BOOL v6 = CXOptionalStringAttribute(a3, (void *)CXNoNamespace, (xmlChar *)"name", &v13);
    id v7 = v13;
    if (v6) {
      [v5 setStyleName:v7];
    }
    BOOL v12 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showLastColumn", &v12)) {
      [v5 setShowLastColumn:v12];
    }
    BOOL v11 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showRowStripes", &v11)) {
      [v5 setShowRowStripes:v11];
    }
    BOOL v10 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showColStripes", &v10)) {
      [v5 setShowColumnStripes:v10];
    }
    BOOL v9 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showRowHeaders", &v9)) {
      [v5 setShowRowHeaders:v9];
    }
    BOOL v8 = 0;
    if (CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"showColHeaders", &v8)) {
      [v5 setShowColumnHeaders:v8];
    }
  }
}

+ (int)edPivotFieldAxisFrom:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  if (([v3 isEqualToString:@"axisCol"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"axisPage"])
    {
      int v5 = 1;
      goto LABEL_9;
    }
    if ([v4 isEqualToString:@"axisRow"])
    {
      int v5 = 2;
      goto LABEL_9;
    }
LABEL_8:
    int v5 = 3;
    goto LABEL_9;
  }
  int v5 = 0;
LABEL_9:

  return v5;
}

+ (int)edPivotItemTypeFrom:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_11;
  }
  if (([v3 isEqualToString:@"avg"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"blank"])
    {
      int v5 = 1;
      goto LABEL_12;
    }
    if ([v4 isEqualToString:@"count"])
    {
      int v5 = 2;
      goto LABEL_12;
    }
    if ([v4 isEqualToString:@"countA"])
    {
      int v5 = 3;
      goto LABEL_12;
    }
    if (([v4 isEqualToString:@"data"] & 1) == 0)
    {
      if ([v4 isEqualToString:@"default"])
      {
        int v5 = 5;
        goto LABEL_12;
      }
      if ([v4 isEqualToString:@"grand"])
      {
        int v5 = 6;
        goto LABEL_12;
      }
      if ([v4 isEqualToString:@"max"])
      {
        int v5 = 7;
        goto LABEL_12;
      }
      if ([v4 isEqualToString:@"min"])
      {
        int v5 = 8;
        goto LABEL_12;
      }
      if ([v4 isEqualToString:@"product"])
      {
        int v5 = 9;
        goto LABEL_12;
      }
      if ([v4 isEqualToString:@"stdDev"])
      {
        int v5 = 10;
        goto LABEL_12;
      }
      if ([v4 isEqualToString:@"stdDevP"])
      {
        int v5 = 11;
        goto LABEL_12;
      }
      if ([v4 isEqualToString:@"sum"])
      {
        int v5 = 12;
        goto LABEL_12;
      }
      if ([v4 isEqualToString:@"var"])
      {
        int v5 = 13;
        goto LABEL_12;
      }
      if ([v4 isEqualToString:@"varP"])
      {
        int v5 = 14;
        goto LABEL_12;
      }
    }
LABEL_11:
    int v5 = 4;
    goto LABEL_12;
  }
  int v5 = 0;
LABEL_12:

  return v5;
}

+ (int)edPivotDatFieldFormatFrom:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_20;
  }
  if (([v3 isEqualToString:@"difference"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"index"])
    {
      int v5 = 1;
      goto LABEL_21;
    }
    if ([v4 isEqualToString:@"normal"])
    {
      int v5 = 2;
      goto LABEL_21;
    }
    if ([v4 isEqualToString:@"percent"])
    {
      int v5 = 3;
      goto LABEL_21;
    }
    if ([v4 isEqualToString:@"percentDiff"])
    {
      int v5 = 4;
      goto LABEL_21;
    }
    if ([v4 isEqualToString:@"percentOfCol"])
    {
      int v5 = 5;
      goto LABEL_21;
    }
    if ([v4 isEqualToString:@"percentOfRow"])
    {
      int v5 = 6;
      goto LABEL_21;
    }
    if ([v4 isEqualToString:@"percentOfTotal"])
    {
      int v5 = 7;
      goto LABEL_21;
    }
    if ([v4 isEqualToString:@"runTotal"])
    {
      int v5 = 8;
      goto LABEL_21;
    }
LABEL_20:
    int v5 = 9;
    goto LABEL_21;
  }
  int v5 = 0;
LABEL_21:

  return v5;
}

+ (void)readFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  BOOL v9 = v8;
  if (a3)
  {
    BOOL v10 = [v8 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v10, "field");

    while (Child)
    {
      uint64_t v14 = -1;
      if (CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"x", &v14))
      {
        BOOL v12 = [NSNumber numberWithUnsignedInteger:v14];
        [v7 addObject:v12];
      }
      id v13 = [v9 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v13, (xmlChar *)"field");
    }
  }
}

+ (void)readItemsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v19 = a1;
  id v20 = a4;
  id v7 = a5;
  id v8 = v7;
  if (a3)
  {
    BOOL v9 = [v7 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v9, "i");

    while (Child)
    {
      BOOL v11 = +[EDPivotItem pivotItem];
      uint64_t v24 = 0;
      if (CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"r", &v24)) {
        [v11 setRepeatedItemCounts:v24];
      }
      id v23 = 0;
      v21 = v11;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"t", &v23);
      id v12 = v23;
      objc_msgSend(v11, "setType:", objc_msgSend(v19, "edPivotItemTypeFrom:", v12));
      id v13 = [v11 itemIndexes];
      uint64_t v14 = [v8 EXSpreadsheetMLNamespace];
      for (i = (_xmlNode *)OCXFindChild(Child, v14, "x"); ; i = OCXFindNextChild(v16, v14, (xmlChar *)"x"))
      {
        uint64_t v16 = i;

        if (!v16) {
          break;
        }
        uint64_t v22 = 0;
        CXOptionalLongAttribute(v16, (CXNamespace *)CXNoNamespace, (xmlChar *)"v", &v22);
        v17 = [NSNumber numberWithLong:v22];
        [v13 addObject:v17];

        uint64_t v14 = [v8 EXSpreadsheetMLNamespace];
      }
      [v20 addObject:v21];
      v18 = [v8 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v18, (xmlChar *)"i");
    }
  }
}

+ (void)readPivotFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (a3)
  {
    BOOL v11 = [v9 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v11, "pivotField");

    while (Child)
    {
      id v13 = +[EDPivotField pivotField];
      uint64_t v27 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"numFmtId", &v27);
      [v13 setNumFmtId:v27];
      id v26 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"axis", &v26);
      id v14 = v26;
      objc_msgSend(v13, "setAxis:", objc_msgSend(a1, "edPivotFieldAxisFrom:", v14));
      BOOL v25 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"compact", &v25);
      [v13 setCompact:v25];
      BOOL v24 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"dataField", &v24);
      [v13 setDataField:v24];
      BOOL v23 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"showDefaultSubTotal", &v23);
      [v13 setShowDefaultSubTotal:v23];
      BOOL v22 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"insertBlankRow", &v22);
      [v13 setInsertBlankRow:v22];
      BOOL v21 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"outline", &v21);
      [v13 setOutlineItems:v21];
      BOOL v20 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"showAll", &v20);
      [v13 setShowAllItems:v20];
      BOOL v19 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"subtotalTop", &v19);
      [v13 setSubtotalTop:v19];
      v15 = [v10 EXSpreadsheetMLNamespace];
      uint64_t v16 = OCXFindChild(Child, v15, "items");

      v17 = [v13 pivotFieldItems];
      [a1 readFieldItemsFrom:v16 toCollection:v17 state:v10];

      [v8 addObject:v13];
      v18 = [v10 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v18, (xmlChar *)"pivotField");
    }
  }
}

+ (void)readFieldItemsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (a3)
  {
    BOOL v11 = [v9 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v11, "item");

    while (Child)
    {
      id v13 = +[EDPivotFieldItem pivotFieldItem];
      BOOL v23 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"c", &v23);
      [v13 setChildItems:v23];
      BOOL v22 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"d", &v22);
      [v13 setExpanded:v22];
      BOOL v21 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"f", &v21);
      [v13 setCalculatedMember:v21];
      BOOL v20 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"m", &v20);
      [v13 setMissed:v20];
      BOOL v19 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"s", &v19);
      [v13 setHidden:v19];
      BOOL v18 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"sd", &v18);
      [v13 setDetailsHidden:v18];
      uint64_t v17 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"x", &v17);
      [v13 setItemIndex:v17];
      id v16 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"t", &v16);
      id v14 = v16;
      objc_msgSend(v13, "setType:", objc_msgSend(a1, "edPivotItemTypeFrom:", v14));
      [v8 addObject:v13];
      v15 = [v10 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v15, (xmlChar *)"item");
    }
  }
}

+ (void)readDataFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (a3)
  {
    BOOL v11 = [v9 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v11, "dataField");

    while (Child)
    {
      id v13 = +[EDPivotDataField pivotDataField];
      uint64_t v22 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"baseField", &v22);
      [v13 setBaseField:v22];
      uint64_t v21 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"baseItem", &v21);
      [v13 setBaseItem:v21];
      uint64_t v20 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"fId", &v20);
      [v13 setFieldId:v20];
      uint64_t v19 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"numFmtId", &v19);
      [v13 setNumFmtId:v19];
      id v18 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"name", &v18);
      id v14 = v18;
      [v13 setName:v14];
      id v17 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"showDataAs", &v17);
      id v15 = v17;
      objc_msgSend(v13, "setShowDataAs:", objc_msgSend(a1, "edPivotDatFieldFormatFrom:", v15));
      [v8 addObject:v13];
      id v16 = [v10 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v16, (xmlChar *)"dataField");
    }
  }
}

+ (void)readConditionalFormatsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (a3)
  {
    BOOL v11 = [v9 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v11, "conditionalFormat");

    while (Child)
    {
      id v13 = +[EDPivotConditionalFormat pivotConditionalFormat];
      uint64_t v22 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"priority", &v22);
      [v13 setPriority:v22];
      id v21 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"type", &v21);
      id v14 = v21;
      objc_msgSend(v13, "setType:", objc_msgSend(a1, "edPivotConditionalFormatTypeFrom:", v14));
      id v20 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"scope", &v20);
      id v15 = v20;
      objc_msgSend(v13, "setScope:", objc_msgSend(a1, "edPivotConditionalFormatScopeFrom:", v15));
      id v16 = [v10 EXSpreadsheetMLNamespace];
      uint64_t v17 = OCXFindChild(Child, v16, "pivotAreas");

      id v18 = [v13 pivotAreas];
      [a1 readPivotAreasFrom:v17 toCollection:v18 state:v10];

      [v8 addObject:v13];
      uint64_t v19 = [v10 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v19, (xmlChar *)"conditionalFormat");
    }
  }
}

+ (void)readPivotAreasFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (a3)
  {
    BOOL v11 = [v9 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v11, "pivotArea");

    while (Child)
    {
      id v13 = +[EDPivotArea pivotArea];
      BOOL v25 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"grandCol", &v25);
      [v13 setGrandCol:v25];
      BOOL v24 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"grandRow", &v24);
      [v13 setGrandRow:v24];
      BOOL v23 = 0;
      CXOptionalBoolAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"outline", &v23);
      [v13 setOutline:v23];
      id v22 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"type", &v22);
      id v14 = v22;
      objc_msgSend(v13, "setType:", objc_msgSend(a1, "edPivotAreaTypeFrom:", v14));
      id v21 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"offset", &v21);
      id v15 = v21;
      id v16 = +[EXReference edReferenceFromXmlReference:v15];
      [v13 setOffset:v16];

      uint64_t v17 = [v10 EXSpreadsheetMLNamespace];
      uint64_t v18 = OCXFindChild(Child, v17, "references");

      uint64_t v19 = [v13 references];
      [a1 readPivotAreaReferencesFrom:v18 toCollection:v19 state:v10];

      [v8 addObject:v13];
      id v20 = [v10 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v20, (xmlChar *)"pivotArea");
    }
  }
}

+ (void)readPivotAreaReferencesFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (a3)
  {
    BOOL v10 = [v8 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v10, "reference");

    while (Child)
    {
      id v12 = +[EDPivotAreaReference pivotAreaReference];
      uint64_t v18 = -1;
      CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"fieldId", &v18);
      [v12 setFieldId:v18];
      uint64_t v17 = -1;
      CXOptionalLongAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"count", &v17);
      [v12 setCount:v17];
      BOOL v16 = 0;
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"byPosition", &v16);
      [v12 setByPosition:v16];
      BOOL v15 = 0;
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"relative", &v15);
      [v12 setRelative:v15];
      BOOL v14 = 0;
      CXOptionalBoolAttribute(a3, (CXNamespace *)CXNoNamespace, (xmlChar *)"selected", &v14);
      [v12 setSelected:v14];
      [v7 addObject:v12];
      id v13 = [v9 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v13, (xmlChar *)"reference");
    }
  }
}

+ (void)readPageFieldsFrom:(_xmlNode *)a3 toCollection:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = v8;
  if (a3)
  {
    BOOL v10 = [v8 EXSpreadsheetMLNamespace];
    Child = (_xmlNode *)OCXFindChild(a3, v10, "pageField");

    while (Child)
    {
      id v12 = +[EDPivotPageField pivotPageField];
      uint64_t v18 = -1;
      CXOptionalLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"fId", &v18);
      [v12 setFieldId:v18];
      id v17 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"name", &v17);
      id v13 = v17;
      [v12 setName:v13];
      id v16 = 0;
      CXOptionalStringAttribute(Child, (void *)CXNoNamespace, (xmlChar *)"cap", &v16);
      id v14 = v16;
      [v12 setCap:v14];
      [v7 addObject:v12];
      BOOL v15 = [v9 EXSpreadsheetMLNamespace];
      Child = OCXFindNextChild(Child, v15, (xmlChar *)"pageField");
    }
  }
}

+ (int)edPivotConditionalFormatTypeFrom:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_10;
  }
  if (([v3 isEqualToString:@"all"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"column"])
    {
      int v5 = 1;
      goto LABEL_11;
    }
    if ([v4 isEqualToString:@"none"])
    {
      int v5 = 2;
      goto LABEL_11;
    }
    if ([v4 isEqualToString:@"row"])
    {
      int v5 = 3;
      goto LABEL_11;
    }
LABEL_10:
    int v5 = 4;
    goto LABEL_11;
  }
  int v5 = 0;
LABEL_11:

  return v5;
}

+ (int)edPivotConditionalFormatScopeFrom:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_8;
  }
  if (([v3 isEqualToString:@"data"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"field"])
    {
      int v5 = 1;
      goto LABEL_9;
    }
    if ([v4 isEqualToString:@"selection"])
    {
      int v5 = 2;
      goto LABEL_9;
    }
LABEL_8:
    int v5 = 3;
    goto LABEL_9;
  }
  int v5 = 0;
LABEL_9:

  return v5;
}

+ (int)edPivotAreaTypeFrom:(id)a3
{
  id v3 = a3;
  v4 = v3;
  if (!v3) {
    goto LABEL_9;
  }
  if (([v3 isEqualToString:@"all"] & 1) == 0)
  {
    if ([v4 isEqualToString:@"button"])
    {
      int v5 = 1;
      goto LABEL_10;
    }
    if ([v4 isEqualToString:@"data"])
    {
      int v5 = 2;
      goto LABEL_10;
    }
    if (([v4 isEqualToString:@"none"] & 1) == 0)
    {
      if ([v4 isEqualToString:@"noraml"])
      {
        int v5 = 4;
        goto LABEL_10;
      }
      if ([v4 isEqualToString:@"origin"])
      {
        int v5 = 5;
        goto LABEL_10;
      }
      if (([v4 isEqualToString:@"topRight"] & 1) != 0
        || ([v4 isEqualToString:@"topEnd"] & 1) != 0)
      {
        int v5 = 6;
        goto LABEL_10;
      }
    }
LABEL_9:
    int v5 = 3;
    goto LABEL_10;
  }
  int v5 = 0;
LABEL_10:

  return v5;
}

@end