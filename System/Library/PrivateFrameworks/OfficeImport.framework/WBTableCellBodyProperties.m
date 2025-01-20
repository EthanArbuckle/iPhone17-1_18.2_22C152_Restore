@interface WBTableCellBodyProperties
+ (id)formattingChangeDate:(const WrdDateTime *)a3;
+ (void)mapProperties:(id)a3 toWordProperties:(void *)a4 index:(unint64_t)a5;
+ (void)mapWordProperties:(void *)a3 toProperties:(id)a4 index:(unint64_t)a5;
+ (void)readFrom:(void *)a3 tracked:(void *)a4 properties:(id)a5 index:(unint64_t)a6;
+ (void)write:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 index:(unint64_t)a6;
@end

@implementation WBTableCellBodyProperties

+ (void)readFrom:(void *)a3 tracked:(void *)a4 properties:(id)a5 index:(unint64_t)a6
{
  id v12 = a5;
  if (a3 && v12)
  {
    [v12 setResolveMode:0];
    [a1 mapWordProperties:a3 toProperties:v12 index:a6];
    __int16 PositionOfCell = WrdTableProperties::getPositionOfCell((WrdTableProperties *)a3, (a6 + 1));
    objc_msgSend(v12, "setWidth:", (__int16)(PositionOfCell- WrdTableProperties::getPositionOfCell((WrdTableProperties *)a3, a6)));
    if (a4)
    {
      [v12 setResolveMode:1];
      [a1 mapWordProperties:a4 toProperties:v12 index:a6];
      if ((*((void *)a4 + 2) & 0x4000000000000000) != 0)
      {
        __int16 v11 = WrdTableProperties::getPositionOfCell((WrdTableProperties *)a4, (a6 + 1));
        objc_msgSend(v12, "setWidth:", (__int16)(v11- WrdTableProperties::getPositionOfCell((WrdTableProperties *)a4, a6)));
      }
    }
    [v12 setResolveMode:2];
  }
}

+ (void)mapWordProperties:(void *)a3 toProperties:(id)a4 index:(unint64_t)a5
{
  __int16 v5 = a5;
  id v34 = a4;
  uint64_t TableCellDescriptorReference = WrdTableProperties::getTableCellDescriptorReference((WrdTableProperties *)a3, v5);
  [v34 setPosition:v5];
  uint64_t v9 = *(unsigned int *)(TableCellDescriptorReference + 8);
  unint64_t v10 = v9 | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  if ((v9 & 2) != 0)
  {
    uint64_t TopBorderReference = WrdTableCellDescriptor::getTopBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    id v12 = [v34 mutableTopBorder];
    +[WBBorder readFrom:TopBorderReference to:v12];

    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 4) != 0)
  {
    uint64_t LeftBorderReference = WrdTableCellDescriptor::getLeftBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    v14 = [v34 mutableLeftBorder];
    +[WBBorder readFrom:LeftBorderReference to:v14];

    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 8) != 0)
  {
    uint64_t BottomBorderReference = WrdTableCellDescriptor::getBottomBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    v16 = [v34 mutableBottomBorder];
    +[WBBorder readFrom:BottomBorderReference to:v16];

    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0x10) != 0)
  {
    uint64_t RightBorderReference = WrdTableCellDescriptor::getRightBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    v18 = [v34 mutableRightBorder];
    +[WBBorder readFrom:RightBorderReference to:v18];

    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if (v10)
  {
    uint64_t ShadingReference = WrdTableCellDescriptor::getShadingReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    v20 = [v34 mutableShading];
    +[WBShading readFrom:ShadingReference to:v20];

    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0x40) != 0)
  {
    uint64_t DiagonalUpBorderReference = WrdTableCellDescriptor::getDiagonalUpBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    v22 = [v34 mutableDiagonalUpBorder];
    +[WBBorder readFrom:DiagonalUpBorderReference to:v22];

    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0x20) != 0)
  {
    uint64_t DiagonalDownBorderReference = WrdTableCellDescriptor::getDiagonalDownBorderReference((WrdTableCellDescriptor *)TableCellDescriptorReference);
    v24 = [v34 mutableDiagonalDownBorder];
    +[WBBorder readFrom:DiagonalDownBorderReference to:v24];

    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0x2000) != 0)
  {
    [v34 setWidthType:*(unsigned int *)(TableCellDescriptorReference + 76)];
    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  v25 = v34;
  if ((v10 & 0x1000000) != 0)
  {
    [v34 setTopMargin:*(__int16 *)(TableCellDescriptorReference + 116)];
    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x8000) != 0)
  {
    [v25 setTopMarginType:*(unsigned int *)(TableCellDescriptorReference + 84)];
    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x2000000) != 0)
  {
    [v25 setBottomMargin:*(__int16 *)(TableCellDescriptorReference + 118)];
    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x10000) != 0)
  {
    [v25 setBottomMarginType:*(unsigned int *)(TableCellDescriptorReference + 88)];
    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x800000) != 0)
  {
    [v25 setLeftMargin:*(__int16 *)(TableCellDescriptorReference + 114)];
    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x4000) != 0)
  {
    [v25 setLeftMarginType:*(unsigned int *)(TableCellDescriptorReference + 80)];
    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x4000000) != 0)
  {
    [v25 setRightMargin:*(__int16 *)(TableCellDescriptorReference + 120)];
    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
    v25 = v34;
  }
  if ((v10 & 0x20000) != 0)
  {
    [v25 setRightMarginType:*(unsigned int *)(TableCellDescriptorReference + 92)];
    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0x1000) != 0)
  {
    [v34 setVerticalAlignment:*(unsigned int *)(TableCellDescriptorReference + 72)];
    unint64_t v10 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v10 & 0xE00000000) != 0)
  {
    int v26 = *(unsigned __int16 *)(TableCellDescriptorReference + 130);
    if ((~v26 & 0xC) != 0)
    {
      if ((v26 & 0x10) != 0) {
        unsigned int v27 = 2;
      }
      else {
        unsigned int v27 = 1;
      }
      if ((v26 & 0x10) != 0) {
        unsigned int v28 = 5;
      }
      else {
        unsigned int v28 = 4;
      }
      if ((v26 & 4) != 0) {
        uint64_t v29 = v28;
      }
      else {
        uint64_t v29 = v27;
      }
      [v34 setTextDirection:v29];
    }
    else
    {
      [v34 setTextDirection:0];
    }
  }
  unint64_t v30 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  if ((v30 & 0x1000000000) != 0)
  {
    [v34 setVerticallyMergedCell:(*(unsigned __int16 *)(TableCellDescriptorReference + 130) >> 5) & 1];
    unint64_t v30 = *(unsigned int *)(TableCellDescriptorReference + 8) | ((unint64_t)*(unsigned __int8 *)(TableCellDescriptorReference + 12) << 32);
  }
  if ((v30 & 0x2000000000) != 0) {
    [v34 setFirstInSetOfVerticallyMergedCells:(*(unsigned __int16 *)(TableCellDescriptorReference + 130) >> 6) & 1];
  }
  if (WrdTableProperties::doRevisionsExist((WrdTableProperties *)a3))
  {
    if ((*((void *)a3 + 2) & 2) != 0) {
      [v34 setIndexToAuthorIDOfFormattingChange:*((unsigned __int16 *)a3 + 166)];
    }
    [v34 setFormattingChanged:1];
    if ((*((void *)a3 + 2) & 4) != 0)
    {
      v31 = [a1 formattingChangeDate:*((void *)a3 + 15)];
      [v34 setFormattingChangeDate:v31];
    }
    if ([v34 isFormattingChangeDateOverridden]
      && [v34 isIndexToAuthorIDOfFormattingChangeOverridden])
    {
      v32 = [v34 document];
      v33 = [v34 formattingChangeDate];
      objc_msgSend(v32, "addChangeTrackingEditAtDate:authorIndex:", v33, objc_msgSend(v34, "indexToAuthorIDOfFormattingChange"));
    }
  }
}

+ (void)write:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 index:(unint64_t)a6
{
  id v10 = a3;
  if (v10 && a4)
  {
    [v10 setResolveMode:0];
    [a1 mapProperties:v10 toWordProperties:a4 index:a6];
    if (a5)
    {
      [v10 setResolveMode:1];
      [a1 mapProperties:v10 toWordProperties:a5 index:a6];
    }
    [v10 setResolveMode:2];
  }
}

+ (id)formattingChangeDate:(const WrdDateTime *)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF910], "tc_dateWithWordDate:", a3);
}

+ (void)mapProperties:(id)a3 toWordProperties:(void *)a4 index:(unint64_t)a5
{
  unsigned __int8 v5 = a5;
  id v23 = a3;
  WrdTableProperties::setPositionOfCell((WrdTableProperties *)a4, (v5 + 1), [v23 position]);
  uint64_t TableCellDescriptorReference = (WrdTableCellDescriptor *)WrdTableProperties::getTableCellDescriptorReference((WrdTableProperties *)a4, v5);
  if ([v23 isShadingOverridden])
  {
    uint64_t ShadingReference = WrdTableCellDescriptor::getShadingReference(TableCellDescriptorReference);
    uint64_t v9 = [v23 shading];
    +[WBShading write:v9 to:ShadingReference];
  }
  if ([v23 isTopBorderOverridden])
  {
    uint64_t TopBorderReference = WrdTableCellDescriptor::getTopBorderReference(TableCellDescriptorReference);
    __int16 v11 = [v23 topBorder];
    +[WBBorder write:v11 to:TopBorderReference];

    *((_DWORD *)TableCellDescriptorReference + 2) |= 0x80u;
  }
  if ([v23 isLeftBorderOverridden])
  {
    uint64_t LeftBorderReference = WrdTableCellDescriptor::getLeftBorderReference(TableCellDescriptorReference);
    v13 = [v23 leftBorder];
    +[WBBorder write:v13 to:LeftBorderReference];

    *((_DWORD *)TableCellDescriptorReference + 2) |= 0x100u;
  }
  if ([v23 isBottomBorderOverridden])
  {
    uint64_t BottomBorderReference = WrdTableCellDescriptor::getBottomBorderReference(TableCellDescriptorReference);
    v15 = [v23 bottomBorder];
    +[WBBorder write:v15 to:BottomBorderReference];

    *((_DWORD *)TableCellDescriptorReference + 2) |= 0x200u;
  }
  if ([v23 isRightBorderOverridden])
  {
    uint64_t RightBorderReference = WrdTableCellDescriptor::getRightBorderReference(TableCellDescriptorReference);
    v17 = [v23 rightBorder];
    +[WBBorder write:v17 to:RightBorderReference];

    *((_DWORD *)TableCellDescriptorReference + 2) |= 0x400u;
  }
  if ([v23 isDiagonalDownBorderOverridden])
  {
    uint64_t DiagonalDownBorderReference = WrdTableCellDescriptor::getDiagonalDownBorderReference(TableCellDescriptorReference);
    v19 = [v23 diagonalDownBorder];
    +[WBBorder write:v19 to:DiagonalDownBorderReference];
  }
  if ([v23 isDiagonalUpBorderOverridden])
  {
    uint64_t DiagonalUpBorderReference = WrdTableCellDescriptor::getDiagonalUpBorderReference(TableCellDescriptorReference);
    v21 = [v23 diagonalUpBorder];
    +[WBBorder write:v21 to:DiagonalUpBorderReference];
  }
  WrdTableCellDescriptor::setWidth(TableCellDescriptorReference, [v23 width]);
  if ([v23 isWidthTypeOverridden]) {
    WrdTableCellDescriptor::setWidthUnit((uint64_t)TableCellDescriptorReference, [v23 widthType]);
  }
  if ([v23 isTopMarginOverridden]) {
    WrdTableCellDescriptor::setTopPadding(TableCellDescriptorReference, [v23 topMargin]);
  }
  if ([v23 isTopMarginTypeOverridden]) {
    WrdTableCellDescriptor::setTopPaddingUnit((uint64_t)TableCellDescriptorReference, [v23 topMarginType]);
  }
  if ([v23 isLeftMarginOverridden]) {
    WrdTableCellDescriptor::setLeftPadding(TableCellDescriptorReference, [v23 leftMargin]);
  }
  if ([v23 isLeftMarginTypeOverridden]) {
    WrdTableCellDescriptor::setLeftPaddingUnit((uint64_t)TableCellDescriptorReference, [v23 leftMarginType]);
  }
  if ([v23 isBottomMarginOverridden]) {
    WrdTableCellDescriptor::setBottomPadding(TableCellDescriptorReference, [v23 bottomMargin]);
  }
  if ([v23 isBottomMarginTypeOverridden]) {
    WrdTableCellDescriptor::setBottomPaddingUnit((uint64_t)TableCellDescriptorReference, [v23 bottomMarginType]);
  }
  if ([v23 isRightMarginOverridden]) {
    WrdTableCellDescriptor::setRightPadding(TableCellDescriptorReference, [v23 rightMargin]);
  }
  if ([v23 isRightMarginTypeOverridden]) {
    WrdTableCellDescriptor::setRightPaddingUnit((uint64_t)TableCellDescriptorReference, [v23 rightMarginType]);
  }
  if ([v23 isVerticalAlignmentOverridden]) {
    WrdTableCellDescriptor::setVerticalCellAlignment((uint64_t)TableCellDescriptorReference, [v23 verticalAlignment]);
  }
  if ([v23 isVerticallyMergedCellOverridden]) {
    WrdTableCellDescriptor::setIsVerticallyMergedCell(TableCellDescriptorReference, [v23 verticallyMergedCell]);
  }
  if ([v23 isFirstInSetOfVerticallyMergedCellsOverridden]) {
    WrdTableCellDescriptor::setIsFirstInSetOfVerticallyMergedCells(TableCellDescriptorReference, [v23 firstInSetOfVerticallyMergedCells]);
  }
  if ([v23 isFormattingChangedOverridden]) {
    WrdTableProperties::setRevisionMark((WrdTableProperties *)a4, [v23 formattingChanged]);
  }
  if ([v23 isIndexToAuthorIDOfFormattingChangeOverridden]) {
    WrdTableProperties::setAuthorIDForRevision((WrdTableProperties *)a4, [v23 indexToAuthorIDOfFormattingChange]);
  }
  if ([v23 isFormattingChangeDateOverridden])
  {
    v22 = [v23 formattingChangeDate];
    objc_msgSend(v22, "tc_copyToWordDate:", WrdTableProperties::getDttmRevisionMarkReference((WrdTableProperties *)a4));
  }
  if ([v23 isTextDirectionOverridden])
  {
    switch([v23 textDirection])
    {
      case 0u:
        WrdTableCellDescriptor::setBottomToTopTextFlow(TableCellDescriptorReference, 1);
        goto LABEL_50;
      case 2u:
        WrdTableCellDescriptor::setRotateFont(TableCellDescriptorReference, 1);
        break;
      case 4u:
        goto LABEL_50;
      case 5u:
        WrdTableCellDescriptor::setRotateFont(TableCellDescriptorReference, 1);
LABEL_50:
        WrdTableCellDescriptor::setVerticalTextFlow(TableCellDescriptorReference, 1);
        break;
      default:
        break;
    }
  }
}

@end