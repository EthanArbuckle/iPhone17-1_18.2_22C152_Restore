@interface GQHTable
+ (__CFString)createTableAttachmentIdWithNumber:(int64_t)a3;
+ (const)name;
+ (id)mapBaseFillStyleForRowIndex:(unsigned __int16)a3 columnIndex:(unsigned __int16)a4 state:(id)a5 isGroupingCell:(BOOL)a6;
+ (int)beginCells:(id)a3 state:(id)a4;
+ (int)beginTable:(id)a3 state:(id)a4;
+ (int)endCells:(id)a3 state:(id)a4;
+ (int)endTable:(id)a3 state:(id)a4;
+ (int)handleCell:(id)a3 state:(id)a4;
+ (int)mapCellContent:(id)a3 xml:(id)a4 state:(id)a5;
+ (unsigned)resolveGroupLevel:(id)a3 model:(id)a4 columnIndex:(int)a5 tableState:(id)a6;
+ (void)addMissingCellWithRowIndex:(unsigned __int16)a3 columnIndex:(unsigned __int16)a4 state:(id)a5;
+ (void)addMissingCellsUpToRowIndex:(unsigned __int16)a3 columnIndex:(unsigned __int16)a4 state:(id)a5;
+ (void)beginRowWithIndex:(unsigned __int16)a3 state:(id)a4;
+ (void)getVectorStylesForRowIndex:(unsigned __int16)a3 rowSpan:(unsigned __int16)a4 columnIndex:(unsigned __int16)a5 columnSpan:(unsigned __int16)a6 vectorStyles:(id *)a7 state:(id)a8;
+ (void)mapCellStyle:(id)a3 rowIndex:(unsigned __int16)a4 rowSpan:(unsigned __int16)a5 columnIndex:(unsigned __int16)a6 columnSpan:(unsigned __int16)a7 state:(id)a8 cell:(id)a9 level:(unsigned __int16)a10;
+ (void)mapVectorStyles:(id *)a3 toCellStyle:(id)a4 state:(id)a5;
+ (void)splitTable:(id)a3;
+ (void)startTableWithTableAnchor:(__CFString *)a3 tableHeight:(float)a4 state:(id)a5;
@end

@implementation GQHTable

+ (int)mapCellContent:(id)a3 xml:(id)a4 state:(id)a5
{
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [a4 startElement:"img"];
    id v9 = [a5 processorState];
    if ([a3 BOOLValue]) {
      v10 = @"ctrl_boxChecked_norm";
    }
    else {
      v10 = @"ctrl_boxUnchecked_norm";
    }
    objc_msgSend(a4, "setAttribute:cfStringValue:", "src", objc_msgSend(v9, "uriForBundleResource:ofType:", v10, @"pdf"));
    [a4 endElement];
    return 1;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    goto LABEL_9;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
    {
      id v18 = [a3 resultCell];
      if (v18) {
        [a1 mapCellContent:v18 xml:a4 state:a5];
      }
      return 1;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v20 = objc_msgSend(objc_msgSend(objc_msgSend(a5, "tableState"), "table"), "model");
      LODWORD(v30) = 7;
      LOBYTE(v29) = 1;
      id v21 = [a3 columnIndex];
      id v22 = [a3 level];
      unsigned int v23 = [v20 firstVisibleColumn];
      if (([v20 hasGroupDisplayType:v21 level:v22 displayType:&v30 isTypeVisible:&v29] & 1) == 0&& (v21 > objc_msgSend(v20, "headerColumnCount") || v21 != v23))
      {
        return 1;
      }
      if (v30 == 7)
      {
        id v11 = 0;
        uint64_t v24 = 7;
      }
      else
      {
        id v11 = [a3 createFormattedValue];
        uint64_t v24 = v30;
      }
      v25 = +[GQDTGroupingCell displayTypeString:v24];
      v26 = v25;
      int v27 = v29;
      if (v11 && v25 && (_BYTE)v29)
      {
        [a4 startElement:"span"];
        +[GQHStyle setSingleStyleAttribute:off_9CE68 value:off_9CEA0 node:a4];
        [a4 addContent:v26];
        [a4 endElement];
        int v27 = v29;
      }
      else if (!v11)
      {
        return 1;
      }
      if (v26 && v27)
      {
        [a4 startElement:"span"];
        +[GQHStyle setSingleStyleAttribute:off_9CE68 value:off_9CF20 node:a4];
      }
      [a4 addContent:v11];
      if (v26 && (_BYTE)v29) {
        [a4 endElement];
      }
      goto LABEL_10;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {
      [a3 isMemberOfClass:objc_opt_class()];
      return 1;
    }
LABEL_9:
    id v11 = [a3 createStringValue];
    [a4 addContent:v11];
LABEL_10:
    CFRelease(v11);
    return 1;
  }
  id v13 = [a3 stringValue];
  if (v13)
  {
    v14 = v13;
    uint64_t v29 = 0;
    id v30 = 0;
    if (objc_msgSend(objc_msgSend(a3, "cellStyle"), "overridesObjectProperty:value:", 119, &v30)
      && [v30 overridesObjectProperty:38 value:&v29])
    {
      values = -[GQDWPText initWithContent:]([GQDWPText alloc], "initWithContent:", [v14 UTF8String]);
      v15 = objc_alloc_init(GQDWPParagraph);
      CFArrayRef v16 = CFArrayCreate(0, (const void **)&values, 1, &kCFTypeArrayCallBacks);
      [(GQDWPTextList *)v15 setChildren:v16];
      CFRelease(v16);
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(kCFAllocatorDefault, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      +[GQHParagraph handleParagraph:v15 state:a5 bulletStates:Mutable isMultiColumn:0];
      if (Mutable) {
        CFRelease(Mutable);
      }
    }
    else
    {
      [a4 addContent:v14];
    }
    return 1;
  }
  id v19 = [a3 layoutStorage];
  if (!v19) {
    return 1;
  }
  return +[GQHTextBox handleLayoutStorage:v19 state:a5];
}

+ (void)beginRowWithIndex:(unsigned __int16)a3 state:(id)a4
{
  uint64_t v5 = a3;
  id v7 = [a4 htmlDoc];
  id v8 = [a4 tableState];
  objc_msgSend(objc_msgSend(objc_msgSend(v8, "table"), "model"), "heightForRow:", v5);
  float v10 = v9;
  if ([v8 splitTable])
  {
    [a4 currentAttachmentPosition];
    float v12 = v11;
    if (v12 > 0.0)
    {
      [v8 currentTablePosition];
      double v11 = v13 + v10;
      if (v11 > v12) {
        [a1 splitTable:a4];
      }
    }
    *(float *)&double v11 = v10;
    [v8 addRowHeight:v11];
  }
  [v7 startElement:"tr"];
  v14 = objc_alloc_init(GQHStyle);
  [(GQHStyle *)v14 addAttribute:off_9CE98 pxValue:llroundf(v10)];
  [(GQHStyle *)v14 setStyleOnCurrentNode:a4];
}

+ (void)addMissingCellWithRowIndex:(unsigned __int16)a3 columnIndex:(unsigned __int16)a4 state:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v7 = a3;
  id v9 = [a5 htmlDoc];
  id v10 = [a5 tableState];
  double v11 = (uint64_t *)[v10 cellCountInColumns];
  uint64_t v12 = *v11;
  if (v6 >= (unint64_t)((v11[1] - *v11) >> 1)) {
    return;
  }
  if (*(unsigned __int16 *)(v12 + 2 * v6) != v7) {
    return;
  }
  *(_WORD *)(v12 + 2 * v6) = v7 + 1;
  id v13 = [v10 table];
  id v14 = [v13 model];
  if (![v14 visibilityForRow:v7]
    || ![v14 visibilityForColumn:v6])
  {
    return;
  }
  [a5 enterGraphicObject];
  [v9 startElement:"td"];
  id v15 = [v13 tableStyle];
  if ([v14 headerRowCount] <= v7)
  {
    unsigned int v17 = [v14 rowCount];
    if ((int)(v17 - [v14 footerRowCount]) <= (int)v7)
    {
      uint64_t v16 = 87;
    }
    else if ([v14 headerColumnCount] <= v6)
    {
      if (((v7 - [v14 headerRowCount]) & 0x80000001) == 1)
      {
        if ([v15 valueForBoolProperty:81])
        {
          id v18 = [v15 valueForObjectProperty:82];
          if (v18) {
            goto LABEL_16;
          }
        }
      }
      uint64_t v16 = 84;
    }
    else
    {
      uint64_t v16 = 86;
    }
  }
  else
  {
    uint64_t v16 = 85;
  }
  id v18 = objc_msgSend(objc_msgSend(v15, "valueForObjectProperty:", v16), "valueForObjectProperty:", 67);
LABEL_16:
  [a1 getVectorStylesForRowIndex:v7 rowSpan:1 columnIndex:v6 columnSpan:1 vectorStyles:v21 state:a5];
  id v19 = [a5 cachedClassStringForCellStyle:0 fillStyle:v18 cellClass:objc_opt_class() vectorStyles:v21 groupLevel:0 hasFormula:0];
  if (!v19)
  {
    id v20 = objc_alloc_init(GQHStyle);
    if (v18) {
      +[GQHGraphicStyle mapFill:v18 style:v20 state:a5];
    }
    [a1 mapVectorStyles:v21 toCellStyle:v20 state:a5];
    id v19 = [a5 addCacheForCellStyle:0 fillStyle:v18 cellClass:objc_opt_class() vectorStyles:v21 groupLevel:0 hasFormula:0 baseClassString:&stru_85630 cssCachedStyle:v20];
  }
  [v9 setAttribute:"class" cfStringValue:v19];
  [v9 endElement];
  [a5 leaveGraphicObject];
}

+ (void)addMissingCellsUpToRowIndex:(unsigned __int16)a3 columnIndex:(unsigned __int16)a4 state:(id)a5
{
  unsigned int v6 = a4;
  unsigned int v7 = a3;
  id v24 = [a5 htmlDoc];
  id v9 = [a5 tableState];
  int v10 = [v9 prevRowIndex];
  unsigned __int16 v11 = (unsigned __int16)[v9 prevColumnIndex];
  id v12 = objc_msgSend(objc_msgSend(v9, "table"), "model");
  unsigned int v13 = [v12 columnCount];
  unsigned int v14 = [v12 rowCount];
  if (v10 < 0) {
    int v15 = -1;
  }
  else {
    int v15 = v10;
  }
  if (v14 >= v7) {
    uint64_t v16 = v7;
  }
  else {
    uint64_t v16 = v14;
  }
  if (v15 >= (int)v16)
  {
    for (unsigned __int16 i = v11 + 1; v6 > i; ++i)
      [a1 addMissingCellWithRowIndex:(unsigned __int16)v15 columnIndex:i state:a5];
  }
  else
  {
    unint64_t v23 = __PAIR64__(v7, v14);
    if ((v10 & 0x80000000) == 0)
    {
      for (unsigned __int16 j = v11 + 1; v13 > j; ++j)
        [a1 addMissingCellWithRowIndex:(unsigned __int16)v15 columnIndex:j state:a5];
      if ([v12 visibilityForRow:(unsigned __int16)v15]) {
LABEL_16:
      }
        objc_msgSend(v24, "endElement", v23);
    }
    while (1)
    {
      LOWORD(v15) = v15 + 1;
      if (v16 <= (unsigned __int16)v15) {
        break;
      }
      unsigned int v19 = [v12 visibilityForRow:(unsigned __int16)v15];
      char v20 = v19;
      if (v19) {
        [a1 beginRowWithIndex:(unsigned __int16)v15 state:a5];
      }
      if (v13)
      {
        int v21 = 0;
        do
          objc_msgSend(a1, "addMissingCellWithRowIndex:columnIndex:state:", (unsigned __int16)v15, (unsigned __int16)v21++, a5, v23);
        while (v13 > (unsigned __int16)v21);
      }
      if (v20) {
        goto LABEL_16;
      }
    }
    if (v23 > HIDWORD(v23))
    {
      if ([v12 visibilityForRow:HIDWORD(v23)]) {
        [a1 beginRowWithIndex:HIDWORD(v23) state:a5];
      }
      if (v6)
      {
        int v22 = 0;
        do
          objc_msgSend(a1, "addMissingCellWithRowIndex:columnIndex:state:", v16, (unsigned __int16)v22++, a5, v23);
        while (v6 > (unsigned __int16)v22);
      }
    }
  }
}

+ (int)beginTable:(id)a3 state:(id)a4
{
  id v5 = [a4 generatorState];
  +[GQHDrawable aboutToGenerateDrawable:a3 htmlState:v5];
  id v6 = [v5 tableState];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v5 splitNextAttachment])
  {
    [v6 setSplitTable:1];
    objc_msgSend(v6, "setSplitTableIndex:", objc_msgSend(v5, "firstAttachmentId"));
    objc_msgSend(objc_msgSend(a3, "geometry"), "size");
    [v6 setOriginalTableHeight:v7];
  }
  return 1;
}

+ (int)endTable:(id)a3 state:(id)a4
{
  id v6 = [a4 generatorState];
  id v7 = [v6 htmlDoc];
  id v8 = [v6 tableState];
  objc_msgSend(a1, "addMissingCellsUpToRowIndex:columnIndex:state:", objc_msgSend(objc_msgSend(objc_msgSend(v8, "table"), "model"), "rowCount"), 0, v6);
  [v8 setTable:0];
  [v7 endElementWithExpectedName:"tbody"];
  [v7 endElementWithExpectedName:"table"];
  if ([v8 splitTable])
  {
    [v8 setSplitTable:0];
    [v6 finishedWithSplitAttachment];
  }
  [v6 leaveGraphicObject];
  id v9 = [a3 geometry];
  [v9 position];
  double v11 = v10;
  double v13 = v12;
  [v9 size];
  objc_msgSend(v6, "addedDrawableWithBounds:", v11, v13, v14, v15);
  +[GQHDrawable doneGeneratingDrawable:a3 htmlState:v6];
  return 1;
}

+ (void)startTableWithTableAnchor:(__CFString *)a3 tableHeight:(float)a4 state:(id)a5
{
  id v9 = [a5 htmlDoc];
  id v10 = objc_msgSend(objc_msgSend(a5, "tableState"), "table");
  id v11 = [v10 geometry];
  double v12 = v11;
  if (a4 > 0.0)
  {
    [v11 size];
    objc_msgSend(v12, "setSize:");
  }
  [v9 startElement:"table"];
  if (a3) {
    [v9 setAttribute:"id" cfStringValue:a3];
  }
  id v23 = 0;
  double v13 = objc_alloc_init(GQHStyle);
  if ([a5 needAbsolutelyPositionedTables])
  {
    [(GQHStyle *)v13 addAttribute:off_9CF18 value:off_9CFA0];
    [v12 position];
    +[GQHBounds mapPosition:srcGraphicStyle:style:state:](GQHBounds, "mapPosition:srcGraphicStyle:style:state:", 0, v13, a5);
  }
  [(GQHStyle *)v13 addAttribute:off_9CE30 value:off_9CFD0];
  [(GQHStyle *)v13 addAttribute:off_9CE60 value:@"inline-table"];
  [(GQHStyle *)v13 addAttribute:off_9CF28 value:off_9CFE0];
  [v12 size];
  +[GQHBounds mapSize:angle:srcGraphicStyle:style:state:](GQHBounds, "mapSize:angle:srcGraphicStyle:style:state:", 0, v13, a5);
  objc_msgSend(a1, "mapStyle:style:state:", objc_msgSend(v10, "tableStyle"), v13, a5);
  if (objc_msgSend(objc_msgSend(v10, "tableStyle"), "overridesObjectProperty:value:", 68, &v23))
  {
    id v14 = [v23 pattern];
    double v15 = @"0";
    if (v14 && [v14 type] == 1) {
      double v15 = @"1";
    }
    [v9 setAttribute:"border" cfStringValue:v15];
    [v9 setAttribute:"rules" cfStringValue:@"all"];
  }
  id v16 = [v10 tableStyle];
  [v12 size];
  +[GQHTextBox mapScaledImageFill:style:size:](GQHTextBox, "mapScaledImageFill:style:size:", v16, v13);
  -[GQHStyle setStyleOnCurrentNode:mappingBaseStyleClass:baseClassType:](v13, "setStyleOnCurrentNode:mappingBaseStyleClass:baseClassType:", a5, [v10 tableStyle], objc_opt_class());

  id v17 = [v10 model];
  unsigned int v18 = [v17 columnCount];
  if (v18)
  {
    unsigned int v19 = v18;
    for (unsigned __int16 i = 0; i < v19; ++i)
    {
      if ([v17 visibilityForColumn:i])
      {
        [v9 startElement:"col"];
        [v17 widthForColumn:i];
        CFStringRef v22 = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%ld", llroundf(v21));
        [v9 setAttribute:"width" cfStringValue:v22];
        CFRelease(v22);
        [v9 endElement];
      }
    }
  }
  [v9 startElement:"tbody"];
}

+ (int)beginCells:(id)a3 state:(id)a4
{
  id v6 = [a4 generatorState];
  objc_msgSend(objc_msgSend(v6, "tableState"), "setTable:", a3);
  id v7 = [a3 geometry];
  id v8 = [v6 htmlDoc];
  if (objc_msgSend(objc_msgSend(a3, "model"), "isNameVisible"))
  {
    id v9 = objc_alloc_init(GQHStyle);
    id v10 = objc_msgSend(objc_msgSend(a3, "tableStyle"), "valueForObjectProperty:", 105);
    id v11 = objc_msgSend(objc_msgSend(a3, "tableStyle"), "valueForObjectProperty:", 104);
    [v6 enterGraphicObject];
    [v8 startElement:"div"];
    +[GQHParagraphStyle mapStyle:v10 style:v9 state:v6];
    +[GQHTextBox mapStyle:v11 style:v9 state:v6];
    if (![v6 needAbsolutelyPositionedTables])
    {
LABEL_22:
      CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 2, &kCFTypeArrayCallBacks);
      v32 = CFArrayCreateMutable(0, 2, &kCFTypeArrayCallBacks);
      CFArraySetValueAtIndex(Mutable, 0, v10);
      v33 = (const void *)objc_opt_class();
      CFArraySetValueAtIndex(v32, 0, v33);
      CFArraySetValueAtIndex(Mutable, 1, v11);
      v34 = (const void *)objc_opt_class();
      CFArraySetValueAtIndex(v32, 1, v34);
      [(GQHStyle *)v9 setStyleOnCurrentNode:v6 mappingBaseStyleClasses:Mutable baseClassTypes:v32];
      CFRelease(Mutable);
      CFRelease(v32);

      objc_msgSend(v8, "addContent:", objc_msgSend(objc_msgSend(a3, "model"), "name"));
      [v8 endElement];
      [v6 leaveGraphicObject];
      goto LABEL_23;
    }
    id v42 = 0;
    uint64_t v43 = 0;
    if (([v10 hasValueForFloatProperty:2 value:&v43] & 1) == 0)
    {
      objc_msgSend(objc_msgSend(v6, "implicitStyle"), "valueForFloatProperty:", 2);
      LODWORD(v43) = v12;
    }
    if ([v10 hasValueForObjectProperty:1 value:&v42])
    {
      id v14 = v42;
      if (v42) {
        goto LABEL_7;
      }
    }
    else
    {
      id v14 = objc_msgSend(objc_msgSend(v6, "implicitStyle"), "valueForObjectProperty:", 1);
      id v42 = v14;
      if (v14)
      {
LABEL_7:
        LODWORD(v13) = v43;
        if (+[GQHTextStyle getDefaultLineHeight:v14 fontSize:(char *)&v43 + 4 defLineHeight:v13])
        {
          float v15 = (float)SHIDWORD(v43);
        }
        else
        {
          float v15 = *(float *)&v43 * 1.2;
        }
        goto LABEL_12;
      }
    }
    float v15 = 0.0;
LABEL_12:
    id v41 = 0;
    if ([v10 hasValueForObjectProperty:28 value:&v41])
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unsigned int v16 = [v41 mode];
        [v41 amount];
        float v18 = 1.0;
        if (!v16) {
          float v18 = v15;
        }
        float v15 = v17 * v18;
      }
    }
    unsigned int v19 = [v10 hasValueForFloatProperty:31 value:&v43];
    float v20 = *(float *)&v43;
    if (!v19) {
      float v20 = -0.0;
    }
    float v21 = v15 + v20;
    id v40 = 0;
    if ([v11 hasValueForObjectProperty:47 value:&v40])
    {
      [v40 top];
      float v23 = v22;
      [v40 bottom];
      float v21 = v21 + (float)(v23 + v24);
    }
    v25 = off_9CF50;
    [v7 position];
    [(GQHStyle *)v9 addAttribute:v25 pxValue:(int)(v26 - v21)];
    int v27 = off_9CEA0;
    [v7 position];
    [(GQHStyle *)v9 addAttribute:v27 pxValue:(int)v28];
    uint64_t v29 = off_9CF68;
    [v7 size];
    [(GQHStyle *)v9 addAttribute:v29 pxValue:(int)v30];
    [(GQHStyle *)v9 addAttribute:off_9CF18 value:off_9CFA0];
    goto LABEL_22;
  }
LABEL_23:
  [v6 enterGraphicObject];
  if (objc_msgSend(objc_msgSend(v6, "tableState"), "splitTable"))
  {
    [v6 currentAttachmentPosition];
    float v36 = v35;
    objc_msgSend(objc_msgSend(v6, "tableState"), "setLastAttachmentPosition:", v36);
    id v37 = objc_msgSend(a1, "createTableAttachmentIdWithNumber:", objc_msgSend(v6, "firstAttachmentId"));
    *(float *)&double v38 = v36;
    [a1 startTableWithTableAnchor:v37 tableHeight:v6 state:v38];
    if (v37) {
      CFRelease(v37);
    }
  }
  else
  {
    [a1 startTableWithTableAnchor:0 tableHeight:v6 state:0.0];
  }
  return 1;
}

+ (int)endCells:(id)a3 state:(id)a4
{
  return 1;
}

+ (int)handleCell:(id)a3 state:(id)a4
{
  id v6 = [a4 generatorState];
  id v7 = [v6 tableState];
  id v8 = [v6 htmlDoc];
  id v9 = [a3 columnIndex];
  id v10 = [a3 rowIndex];
  id v11 = [a3 columnSpan];
  id v12 = [a3 rowSpan];
  [a1 addMissingCellsUpToRowIndex:v10 columnIndex:v9 state:v6];
  double v13 = (uint64_t *)[v7 cellCountInColumns];
  uint64_t v14 = *v13;
  unint64_t v15 = (v13[1] - *v13) >> 1;
  if (v15 <= v9) {
    return 3;
  }
  unint64_t v16 = (v11 + v9);
  if (v15 < v16) {
    return 3;
  }
  if (v11)
  {
    int v19 = (int)v9;
    do
      *(_WORD *)(v14 + 2 * (unsigned __int16)v19++) += (_WORD)v12;
    while (v16 > (unsigned __int16)v19);
  }
  [v7 setPrevRowIndex:v10 columnIndex:(v16 - 1)];
  id v20 = objc_msgSend(objc_msgSend(v7, "table"), "model");
  if (([v20 visibilityForRow:v10] & 1) == 0
    || ![v20 visibilityForColumn:v9])
  {
    return 1;
  }
  [v6 enterGraphicObject];
  [v8 startElement:"td"];
  if (v11 != 1)
  {
    CFStringRef cfa = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", v11);
    [v8 setAttribute:"colspan" cfStringValue:cfa];
    CFRelease(cfa);
  }
  if (v12 != 1)
  {
    CFStringRef cfb = CFStringCreateWithFormat(kCFAllocatorDefault, 0, @"%d", v12);
    [v8 setAttribute:"rowspan" cfStringValue:cfb];
    CFRelease(cfb);
  }
  id cf = [a3 cellStyle];
  uint64_t v25 = 0;
  if ([cf hasValueForObjectProperty:119 value:&v25]) {
    [v6 pushImplicitStyle:v25];
  }
  LOWORD(v21) = (unsigned __int16)[a1 resolveGroupLevel:a3 model:v20 columnIndex:v9 tableState:v7];
  [a1 mapCellStyle:cf rowIndex:v10 rowSpan:v12 columnIndex:v9 columnSpan:v11 state:v6 cell:a3 level:v21];
  int v17 = [a1 mapCellContent:a3 xml:v8 state:v6];
  if (v25) {
    [v6 popImplicitStyle];
  }
  [v8 endElement];
  [v6 leaveGraphicObject];
  return v17;
}

+ (const)name
{
  return "t";
}

+ (id)mapBaseFillStyleForRowIndex:(unsigned __int16)a3 columnIndex:(unsigned __int16)a4 state:(id)a5 isGroupingCell:(BOOL)a6
{
  unsigned int v7 = a4;
  signed int v8 = a3;
  id v9 = objc_msgSend(objc_msgSend(a5, "tableState"), "table");
  id v10 = [v9 model];
  id v11 = [v9 tableStyle];
  if ([v10 headerColumnCount] > v7) {
    return 0;
  }
  unsigned int v12 = [v10 rowCount];
  if ((int)(v12 - [v10 footerRowCount]) <= v8) {
    return 0;
  }
  unsigned int v13 = [v10 headerRowCount];
  id result = 0;
  if (((v8 - v13) & 0x80000001) == 1 && !a6)
  {
    int v17 = 0;
    char v16 = 0;
    unsigned int v15 = [v11 hasValueForBoolProperty:81 value:&v16];
    id result = 0;
    if (v15)
    {
      if (v16)
      {
        if ([v11 hasValueForObjectProperty:82 value:&v17]) {
          return v17;
        }
        else {
          return 0;
        }
      }
    }
  }
  return result;
}

+ (void)mapCellStyle:(id)a3 rowIndex:(unsigned __int16)a4 rowSpan:(unsigned __int16)a5 columnIndex:(unsigned __int16)a6 columnSpan:(unsigned __int16)a7 state:(id)a8 cell:(id)a9 level:(unsigned __int16)a10
{
  uint64_t v11 = a7;
  uint64_t v12 = a6;
  uint64_t v13 = a5;
  uint64_t v14 = a4;
  id v38 = [a8 htmlDoc];
  value = 0;
  if (([a3 hasValueForObjectProperty:118 value:&value] & 1) == 0) {
    value = 0;
  }
  id v42 = 0;
  if (([a3 hasValueForObjectProperty:119 value:&v42] & 1) == 0) {
    id v42 = 0;
  }
  objc_opt_class();
  id v40 = [a1 mapBaseFillStyleForRowIndex:v14 columnIndex:v12 state:a8 isGroupingCell:objc_opt_isKindOfClass() & 1];
  [a1 getVectorStylesForRowIndex:v14 rowSpan:v13 columnIndex:v12 columnSpan:v11 vectorStyles:v44 state:a8];
  if ([a9 isMemberOfClass:objc_opt_class()]) {
    unsigned int v39 = [a9 hasFormulaValue];
  }
  else {
    unsigned int v39 = 0;
  }
  if ([a9 isMemberOfClass:objc_opt_class()]) {
    [a9 resultCell];
  }
  id v17 = [a8 cachedClassStringForCellStyle:a3 fillStyle:v40 cellClass:objc_opt_class() vectorStyles:v44 groupLevel:a10 hasFormula:v39];
  if (!v17)
  {
    id v36 = a1;
    float v18 = objc_alloc_init(GQHStyle);
    if (v40) {
      +[GQHGraphicStyle mapFill:v40 style:v18 state:a8];
    }
    +[GQHGraphicStyle mapStyle:a3 style:v18 state:a8 suppressNullFillOverride:v40 != 0];
    int v19 = v18;
    if (value) {
      +[GQHTextBox mapStyle:value style:v18 state:a8];
    }
    id v20 = v36;
    if (v42) {
      +[GQHParagraphStyle mapStyle:v42 style:v19 state:a8];
    }
    if (a9) {
      +[GQHTableCellStyle mapStyle:a3 style:v19 state:a8 cell:a9 level:a10];
    }
    id v37 = v19;
    [v20 mapVectorStyles:v44 toCellStyle:v19 state:a8];
    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
    float v22 = CFArrayCreateMutable(kCFAllocatorDefault, 0, 0);
    if (a3)
    {
      CFArrayAppendValue(Mutable, a3);
      float v23 = (const void *)objc_opt_class();
      CFArrayAppendValue(v22, v23);
    }
    if (value)
    {
      CFArrayAppendValue(Mutable, value);
      float v24 = (const void *)objc_opt_class();
      CFArrayAppendValue(v22, v24);
    }
    if (v42)
    {
      CFArrayAppendValue(Mutable, v42);
      uint64_t v25 = (const void *)objc_opt_class();
      CFArrayAppendValue(v22, v25);
    }
    CFTypeRef cf = 0;
    +[GQHStyle createBaseStyleClassesString:Mutable classString:&cf classTypes:v22 state:a8];
    uint64_t v26 = objc_opt_class();
    int v27 = (__CFString *)cf;
    if (!cf) {
      int v27 = &stru_85630;
    }
    id v17 = [a8 addCacheForCellStyle:a3 fillStyle:v40 cellClass:v26 vectorStyles:v44 groupLevel:a10 hasFormula:v39 baseClassString:v27 cssCachedStyle:v37];
    if (cf) {
      CFRelease(cf);
    }
    CFRelease(v22);
    CFRelease(Mutable);
  }
  if (+[GQHTextBox styleNeedsImageFillMapping:a3])
  {
    double v28 = objc_alloc_init(GQHStyle);
    id v29 = objc_msgSend(objc_msgSend(objc_msgSend(a8, "tableState"), "table"), "model");
    double v30 = 0.0;
    double v31 = 0.0;
    if (v11)
    {
      int v32 = 0;
      do
      {
        [v29 widthForColumn:(unsigned __int16)(v32 + v12)];
        double v31 = v31 + v33;
        ++v32;
      }
      while (v11 > (unsigned __int16)v32);
    }
    if (v13)
    {
      int v34 = 0;
      double v30 = 0.0;
      do
      {
        [v29 heightForRow:(unsigned __int16)(v34 + v14)];
        double v30 = v30 + v35;
        ++v34;
      }
      while (v13 > (unsigned __int16)v34);
    }
    +[GQHTextBox mapScaledImageFill:style:size:](GQHTextBox, "mapScaledImageFill:style:size:", a3, v28, v31, v30);
    if (v17) {
      [(GQHStyle *)v28 addClass:v17];
    }
    [(GQHStyle *)v28 setStyleOnCurrentNode:a8];
  }
  else if (v17)
  {
    [v38 setAttribute:"class" cfStringValue:v17];
  }
}

+ (void)getVectorStylesForRowIndex:(unsigned __int16)a3 rowSpan:(unsigned __int16)a4 columnIndex:(unsigned __int16)a5 columnSpan:(unsigned __int16)a6 vectorStyles:(id *)a7 state:(id)a8
{
  uint64_t v9 = a6;
  uint64_t v10 = a5;
  uint64_t v11 = a4;
  uint64_t v12 = a3;
  id v13 = objc_msgSend(objc_msgSend(a8, "tableState"), "table");
  id v14 = [v13 model];
  *a7 = objc_msgSend(v13, "defaultVectorStyleForVectorType:", objc_msgSend(v14, "typeOfVectorAlongGridline:offset:length:vertical:", v12, v10, v9, 0));
  a7[1] = objc_msgSend(v13, "defaultVectorStyleForVectorType:", objc_msgSend(v14, "typeOfVectorAlongGridline:offset:length:vertical:", (unsigned __int16)(v11 + v12), v10, v9, 0));
  a7[2] = objc_msgSend(v13, "defaultVectorStyleForVectorType:", objc_msgSend(v14, "typeOfVectorAlongGridline:offset:length:vertical:", v10, v12, v11, 1));
  a7[3] = objc_msgSend(v13, "defaultVectorStyleForVectorType:", objc_msgSend(v14, "typeOfVectorAlongGridline:offset:length:vertical:", (unsigned __int16)(v9 + v10), v12, v11, 1));
}

+ (void)mapVectorStyles:(id *)a3 toCellStyle:(id)a4 state:(id)a5
{
  id v8 = *a3;
  if (__PAIR128__(*a3, *a3) == *(_OWORD *)(a3 + 1) && v8 == a3[3])
  {
    uint64_t v11 = 0;
    if ([v8 hasValueForObjectProperty:128 value:&v11]) {
      +[GQHGraphicStyle mapStroke:v11 toBorderType:0 style:a4 state:a5];
    }
  }
  else
  {
    for (uint64_t i = 0; i != 4; ++i)
    {
      id v10 = a3[i];
      if (v10)
      {
        uint64_t v11 = 0;
        if ([v10 hasValueForObjectProperty:128 value:&v11]) {
          +[GQHGraphicStyle mapStroke:v11 toBorderType:dword_5F050[i] style:a4 state:a5];
        }
      }
    }
  }
}

+ (unsigned)resolveGroupLevel:(id)a3 model:(id)a4 columnIndex:(int)a5 tableState:(id)a6
{
  if ([a4 firstVisibleColumn] == a5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = [a3 level];
      [a6 setGroupLevel:v8];
    }
    else
    {
      LOWORD(v8) = (unsigned __int16)[a6 groupLevel];
    }
  }
  else
  {
    LOWORD(v8) = 0;
  }
  return (unsigned __int16)v8;
}

+ (void)splitTable:(id)a3
{
  id v5 = [a3 htmlDoc];
  [v5 endElementWithExpectedName:"tbody"];
  [v5 endElementWithExpectedName:"table"];
  [a3 moveToNextAttachmentPosition];
  double v7 = v6;
  id v8 = [a3 tableState];
  if (v7 <= 0.0)
  {
    [v8 originalTableHeight];
    double v13 = v12;
    objc_msgSend(objc_msgSend(a3, "tableState"), "lastAttachmentPosition");
    id v11 = 0;
    double v10 = v13 - v14;
  }
  else
  {
    [v8 lastAttachmentPosition];
    double v10 = v7 - v9;
    id v11 = objc_msgSend(a1, "createTableAttachmentIdWithNumber:", objc_msgSend(objc_msgSend(a3, "tableState"), "nextSplitTableIndex"));
  }
  objc_msgSend(objc_msgSend(a3, "tableState"), "setLastAttachmentPosition:", v7);
  float v15 = v10;
  *(float *)&double v16 = v15;
  [a1 startTableWithTableAnchor:v11 tableHeight:a3 state:v16];
  if (v11)
  {
    CFRelease(v11);
  }
}

+ (__CFString)createTableAttachmentIdWithNumber:(int64_t)a3
{
  return (__CFString *)CFStringCreateWithFormat(0, 0, @"tableAtt-%ld", a3);
}

@end