@interface WBTableProperties
+ (id)formattingChangeDate:(const WrdDateTime *)a3;
+ (void)mapWordProperties:(void *)a3 reader:(id)a4 toProperties:(id)a5;
+ (void)readFrom:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 properties:(id)a6;
@end

@implementation WBTableProperties

+ (void)readFrom:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 properties:(id)a6
{
  id v11 = a3;
  id v10 = a6;
  [v10 setResolveMode:0];
  [a1 mapWordProperties:a4 reader:v11 toProperties:v10];
  if (a5)
  {
    [v10 setResolveMode:1];
    [a1 mapWordProperties:a5 reader:v11 toProperties:v10];
  }
  [v10 setResolveMode:2];
}

+ (void)mapWordProperties:(void *)a3 reader:(id)a4 toProperties:(id)a5
{
  id v30 = a4;
  id v8 = a5;
  uint64_t v9 = *((void *)a3 + 2);
  if ((v9 & 0x20) != 0)
  {
    uint64_t TopBorderReference = WrdTableProperties::getTopBorderReference((WrdTableProperties *)a3);
    id v11 = [v8 mutableTopBorder];
    +[WBBorder readFrom:TopBorderReference to:v11];

    uint64_t v9 = *((void *)a3 + 2);
  }
  int v12 = *((_DWORD *)a3 + 6);
  if ((v9 & 0x40) != 0)
  {
    uint64_t LeftBorderReference = WrdTableProperties::getLeftBorderReference((WrdTableProperties *)a3);
    v14 = [v8 mutableLeftBorder];
    +[WBBorder readFrom:LeftBorderReference to:v14];

    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x80) != 0)
  {
    uint64_t BottomBorderReference = WrdTableProperties::getBottomBorderReference((WrdTableProperties *)a3);
    v16 = [v8 mutableBottomBorder];
    +[WBBorder readFrom:BottomBorderReference to:v16];

    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x100) != 0)
  {
    uint64_t RightBorderReference = WrdTableProperties::getRightBorderReference((WrdTableProperties *)a3);
    v18 = [v8 mutableRightBorder];
    +[WBBorder readFrom:RightBorderReference to:v18];

    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x200) != 0)
  {
    uint64_t InnerHorizontalBorderReference = WrdTableProperties::getInnerHorizontalBorderReference((WrdTableProperties *)a3);
    v20 = [v8 mutableInsideHorizontalBorder];
    +[WBBorder readFrom:InnerHorizontalBorderReference to:v20];

    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x400) != 0)
  {
    uint64_t InnerVerticalBorderReference = WrdTableProperties::getInnerVerticalBorderReference((WrdTableProperties *)a3);
    v22 = [v8 mutableInsideVerticalBorder];
    +[WBBorder readFrom:InnerVerticalBorderReference to:v22];

    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x10) != 0)
  {
    uint64_t ShadingReference = WrdTableProperties::getShadingReference((WrdTableProperties *)a3);
    v24 = [v8 mutableShading];
    +[WBShading readFrom:ShadingReference to:v24];

    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v12 & 0x10000000) != 0)
  {
    v25 = [v30 styleAtIndex:*((unsigned __int16 *)a3 + 164) expectedType:3];
    if (v25) {
      [v8 setBaseStyle:v25];
    }

    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x4000) != 0)
  {
    [v8 setJustification:*((unsigned int *)a3 + 32)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x40000000000) != 0)
  {
    [v8 setAlignment:*((unsigned int *)a3 + 60)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x200000000000000) != 0)
  {
    [v8 setWidth:*((__int16 *)a3 + 168)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x8000) != 0)
  {
    [v8 setWidthType:*((unsigned int *)a3 + 33)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x400000000000000) != 0)
  {
    [v8 setIndent:*((__int16 *)a3 + 169)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x10000) != 0)
  {
    [v8 setIndentType:*((unsigned int *)a3 + 34)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v12 & 0x80) != 0)
  {
    [v8 setCellSpacing:*((__int16 *)a3 + 181)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x8000000) != 0)
  {
    [v8 setCellSpacing:*((__int16 *)a3 + 90)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x8000000000) != 0)
  {
    [v8 setVerticalAnchor:*((unsigned int *)a3 + 57)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x10000000000) != 0)
  {
    [v8 setHorizontalAnchor:*((unsigned int *)a3 + 58)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x400000000000) != 0)
  {
    [v8 setVerticalPosition:*((int *)a3 + 77)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x200000000000) != 0)
  {
    [v8 setHorizontalPosition:*((int *)a3 + 76)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x800000000000) != 0)
  {
    [v8 setLeftDistanceFromText:*((int *)a3 + 78)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x1000000000000) != 0)
  {
    [v8 setTopDistanceFromText:*((int *)a3 + 79)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x2000000000000) != 0)
  {
    [v8 setRightDistanceFromText:*((int *)a3 + 80)];
    uint64_t v9 = *((void *)a3 + 2);
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v9 & 0x4000000000000) != 0)
  {
    [v8 setBottomDistanceFromText:*((int *)a3 + 81)];
    int v12 = *((_DWORD *)a3 + 6);
  }
  if ((v12 & 0x200000) != 0) {
    [v8 setBiDirectional:*((unsigned char *)a3 + 388) != 0];
  }
  if (WrdTableProperties::doRevisionsExist((WrdTableProperties *)a3))
  {
    uint64_t v26 = *((void *)a3 + 2);
    if ((v26 & 2) != 0)
    {
      [v8 setIndexToAuthorIDOfFormattingChange:*((unsigned __int16 *)a3 + 166)];
      uint64_t v26 = *((void *)a3 + 2);
    }
    if ((v26 & 4) != 0)
    {
      v27 = [a1 formattingChangeDate:*((void *)a3 + 15)];
      [v8 setFormattingChangeDate:v27];
    }
    if ([v8 isFormattingChangeDateOverridden]
      && [v8 isIndexToAuthorIDOfFormattingChangeOverridden])
    {
      v28 = [v8 document];
      v29 = [v8 formattingChangeDate];
      objc_msgSend(v28, "addChangeTrackingEditAtDate:authorIndex:", v29, objc_msgSend(v8, "indexToAuthorIDOfFormattingChange"));
    }
  }
}

+ (id)formattingChangeDate:(const WrdDateTime *)a3
{
  return (id)objc_msgSend(MEMORY[0x263EFF910], "tc_dateWithWordDate:", a3);
}

@end