@interface PFXTableCell
- (BOOL)mapStartElementWithState:(id)a3;
- (id)mapStrokeProperty:(const char *)a3 propertySet:(id)a4 readerState:(id)a5;
- (void)dealloc;
- (void)mapEndElementWithState:(id)a3;
@end

@implementation PFXTableCell

- (id)mapStrokeProperty:(const char *)a3 propertySet:(id)a4 readerState:(id)a5
{
  return +[PFXGraphicStyle mapCssStroke:a3 fromStyleProperties:a4 contentState:a5];
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)PFXTableCell;
  [(PFXTableCell *)&v3 dealloc];
}

- (BOOL)mapStartElementWithState:(id)a3
{
  id v5 = [a3 currentTableReader];
  if (v5)
  {
    id v6 = [a3 currentHtmlDocMediaState];
    id v7 = objc_msgSend(objc_msgSend(a3, "currentHtmlStackEntry"), "currentEntryMediaState");
    [a3 setInTable:1];
    [v7 setOverriddenStorage:[v6 temporaryTableCellStorage]];
    v8 = (PFXBody *)objc_alloc_init((Class)[a3 textBodyClass]);
    self->mBodyMapper = v8;
    [(PFXBody *)v8 mapStartElementWithState:a3];
  }
  return v5 != 0;
}

- (void)mapEndElementWithState:(id)a3
{
  -[PFXBody mapEndElementWithState:](self->mBodyMapper, "mapEndElementWithState:");

  id v5 = self;
  self->mBodyMapper = 0;
  id v6 = [a3 currentHtmlDocMediaState];
  id v7 = [a3 currentHtmlStackEntry];
  id v8 = [v7 currentEntryMediaState];
  id v67 = [v8 propertySet];
  id v9 = [a3 currentTableReader];
  id v56 = [v8 storage];
  id v10 = [v56 copyWithContext:[v56 context]];
  v55 = v6;
  [v6 clearIDsForTemporaryTableCellStorage];
  [v10 setParentInfo:[v9 tableInfo]];
  v61 = objc_alloc_init((Class)TSTCell);
  if ((uint64_t)objc_msgSend(objc_msgSend(v7, "valueForAttribute:", "colspan"), "integerValue") < 2) {
    id v11 = &dword_0 + 1;
  }
  else {
    id v11 = [[v7 valueForAttribute:@"colspan"] integerValue];
  }
  if ((uint64_t)objc_msgSend(objc_msgSend(v7, "valueForAttribute:", "rowspan"), "integerValue") < 2) {
    unsigned int v12 = 1;
  }
  else {
    unsigned int v12 = [[v7 valueForAttribute:@"rowspan"] integerValue];
  }
  unint64_t v65 = (unint64_t)v11;
  unsigned int v13 = [v9 addCellWithSize:(v12 << 16) | (unint64_t)(unsigned __int16)v11];
  uint64_t v62 = BYTE2(v13);
  unsigned int v14 = (unsigned __int16)v12;
  if ((unsigned __int16)v12 >= 2u) {
    +[PFXTableRow ensureMinimumNumberOfRows:(unsigned __int16)(v13 + v12) withState:a3];
  }
  unsigned int v58 = v12;
  TSTCellClearValue();
  v61[OBJC_IVAR___TSTCell_mPrivate + 1] = 9;
  id v15 = [objc_alloc((Class)TSTRichTextPayload) initWithContext:[v10 context] storage:v10];
  TSTCellSetRichTextPayloadClearingIDConvertToPlaintext();

  uint64_t v60 = (unsigned __int16)v13;
  [a3 setUniqueIdForTableCellStorage:v10, +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@-%lu-%lu", objc_msgSend(a3, "uniqueIdForInfo:", objc_msgSend(v9, "tableInfo")), v60, BYTE2(v13)) withInfoId];
  [a3 setCfiPathForInfo:v10 fromStackEntry:v7];
  id v16 = [v10 paragraphStyleAtCharIndex:0 effectiveRange:0];
  id v17 = *(id *)&v61[OBJC_IVAR___TSTCell_mPrivate + 48];
  if (v17 != v16)
  {
    v18 = v16;

    id v19 = v18;
    *(void *)&v61[OBJC_IVAR___TSTCell_mPrivate + 48] = v19;
    *(_DWORD *)&v61[OBJC_IVAR___TSTCell_mPrivate + 40] = 0;
  }
  [v9 tableModel];
  v54 = (void *)TSTTableDefaultCellStyleForCellID();
  id v20 = objc_alloc_init((Class)TSSPropertyMap);
  id v21 = [v9 verticalStrokeToTheLeftOfColumn:BYTE2(v13) inRow:v60];
  id v63 = [v9 horizontalStrokeAboveRow:v60 inColumn:BYTE2(v13)];
  id v57 = [(PFXTableCell *)v5 mapStrokeProperty:"border-left" propertySet:v67 readerState:a3];
  id v22 = [(PFXTableCell *)v5 mapStrokeProperty:"border-right" propertySet:v67 readerState:a3];
  id v52 = [(PFXTableCell *)v5 mapStrokeProperty:"border-top" propertySet:v67 readerState:a3];
  id v59 = a3;
  id v23 = [(PFXTableCell *)v5 mapStrokeProperty:"border-bottom" propertySet:v67 readerState:a3];
  if (!BYTE2(v13) || (uint64_t v24 = qword_573808, v21 == (id)qword_573808))
  {
    [v9 setVerticalStroke:v57 toTheLeftOfColumn:BYTE2(v13) inRow:(unsigned __int16)v13];
    uint64_t v24 = qword_573808;
  }
  else
  {
    id v57 = v21;
  }
  id v25 = v22;
  id v26 = v63;
  if (!v60 || v63 == (id)v24)
  {
    id v26 = v52;
    [v9 setHorizontalStroke:v52 aboveRow:(unsigned __int16)v13 inColumn:BYTE2(v13)];
  }
  unsigned int v27 = (unsigned __int16)v65;
  unsigned __int16 v64 = BYTE2(v13) + (_WORD)v65;
  [v9 setVerticalStroke:v25 toTheLeftOfColumn:v64 inRow:(unsigned __int16)v13];
  unsigned __int16 v53 = v13 + v58;
  [v9 setHorizontalStroke:v23 aboveRow:(unsigned __int16)(v13 + v58) inColumn:BYTE2(v13)];
  [v20 setObject:v57 forProperty:901];
  [v20 setObject:v26 forProperty:899];
  if ((unsigned __int16)v65 == 1) {
    [v20 setObject:v25 forProperty:902];
  }
  if (v14 == 1) {
    [v20 setObject:v23 forProperty:900];
  }
  [v20 setObject:[PFXGraphicStyle mapCssBackgroundFromStyleProperties:contentState:v67, v59] forProperty:898];
  double v71 = -65536.0;
  v72[0] = -65536.0;
  double v69 = -65536.0;
  double v70 = -65536.0;
  [v8 parentFontSize];
  double v29 = v28;
  [v8 blockWidth];
  +[PFSMargins mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:](PFSMargins, "mapMarginStyleProperty:propertyNames:left:top:right:bottom:parentFontSize:percentageBasis:", v67, +[PFXMargins paddingPropertyNames], &v71, v72, &v69, &v70, v29, v30);
  [v20 setObject:[TSWPPadding paddingWithTopInset:v72[0] leftInset:v71 bottomInset:v70 rightInset:v69] forProperty:904];
  id v31 = [[[v67 valueForProperty:@"white-space"] lastObject] value];
  BOOL v32 = ([v31 isEqualToString:@"pre"] & 1) == 0
     && ![v31 isEqualToString:@"nowrap"];
  [v20 setBoolValue:v32 forProperty:896];
  [v20 setIntValue:[PFXColumnStyle mapVerticalAlignmentWithPropertySet:v67] forProperty:903];
  [v20 minusPropertyMap:[v54 propertyMap]];
  id v33 = objc_msgSend(objc_msgSend(v55, "stylesheet"), "variationOfStyle:propertyMap:", v54, v20);

  id v34 = *(id *)&v61[OBJC_IVAR___TSTCell_mPrivate + 32];
  if (v34 != v33)
  {

    id v35 = v33;
    *(void *)&v61[OBJC_IVAR___TSTCell_mPrivate + 32] = v35;
    *(_DWORD *)&v61[OBJC_IVAR___TSTCell_mPrivate + 24] = 0;
  }
  [v9 tableModel];
  TSTTableSetCellAtCellID();
  unint64_t v36 = v65;
  if (((v58 | v65) & 0xFFFE) != 0)
  {
    [v9 tableModel];
    TSTTableMerge();
    if (v14)
    {
      int v37 = 0;
      unsigned int v66 = HIWORD(v13) << 16;
      __int16 v68 = v13;
      do
      {
        if (v27)
        {
          int v38 = 0;
          int v39 = (unsigned __int16)(v37 + v13);
          unsigned int v40 = v66;
          do
          {
            if ((unsigned __int16)v38 | (unsigned __int16)v37)
            {
              v41 = (char *)objc_alloc_init((Class)TSTCell);
              TSTCellClearValue();
              *(_DWORD *)&v41[OBJC_IVAR___TSTCell_mPrivate] &= 0xFFFF00FF;
              [v9 tableModel];
              unint64_t v36 = v36 & 0xFFFFFFFF00000000 | v40 & 0xFF0000 | v39;
              TSTTableSetCellAtCellID();
            }
            ++v38;
            v40 += 0x10000;
          }
          while (v27 != v38);
        }
        ++v37;
        LOWORD(v13) = v68;
      }
      while (v37 != v14);
    }
    if (v27 >= 2)
    {
      for (int i = 1; i != v27; ++i)
      {
        [v9 horizontalStrokeAboveRow:(unsigned __int16)v13 inColumn:(unsigned __int16)(i + v62)];
        if (!v60) {
          [v9 setHorizontalStroke:qword_573808 aboveRow:0 inColumn:(unsigned __int16)(i + v62)];
        }
      }
      for (int j = 1; j != v27; ++j)
      {
        [v9 horizontalStrokeAboveRow:v53 inColumn:(unsigned __int16)(j + v62)];
        [v9 setHorizontalStroke:qword_573808 aboveRow:v53 inColumn:(unsigned __int16)(j + v62)];
      }
    }
    if (v14 >= 2)
    {
      for (int k = 1; k != v14; ++k)
      {
        id v45 = [v9 verticalStrokeToTheLeftOfColumn:v62 inRow:(unsigned __int16)(k + v13)];
        if (v45 == (id)qword_573800) {
          [v9 setVerticalStroke:qword_573808 toTheLeftOfColumn:v62 inRow:(unsigned __int16)(k + v13)];
        }
      }
      for (int m = 1; m != v14; ++m)
      {
        id v47 = [v9 verticalStrokeToTheLeftOfColumn:v64 inRow:(unsigned __int16)(m + v13)];
        if (v47 == (id)qword_573800) {
          [v9 setVerticalStroke:qword_573808 toTheLeftOfColumn:v64 inRow:(unsigned __int16)(m + v13)];
        }
      }
      for (int n = 1; n != v14; ++n)
      {
        if (v27)
        {
          for (iint i = 0; ii != v27; ++ii)
            [v9 setHorizontalStroke:qword_573810 aboveRow:(unsigned __int16)(n + v13) inColumn:(unsigned __int16)(ii + v62)];
        }
      }
    }
    if (v27 >= 2)
    {
      for (jint j = 1; jj != v27; ++jj)
      {
        if (v14)
        {
          for (kint k = 0; kk != v14; ++kk)
            [v9 setVerticalStroke:qword_573810 toTheLeftOfColumn:(unsigned __int16)(jj + v62) inRow:(unsigned __int16)(kk + v13)];
        }
      }
    }
  }

  [v56 deleteRange:0 length:[v56 length] undoTransaction:0];
  [v8 setOverriddenStorage:0];
  [v59 setInTable:0];
}

@end