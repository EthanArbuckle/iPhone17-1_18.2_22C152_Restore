@interface WBTableRowProperties
+ (void)mapProperties:(id)a3 toWordProperties:(void *)a4;
+ (void)mapWordProperties:(void *)a3 toProperties:(id)a4;
+ (void)readFrom:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 properties:(id)a6;
+ (void)write:(id)a3 properties:(id)a4 wrdProperties:(void *)a5 tracked:(void *)a6;
@end

@implementation WBTableRowProperties

+ (void)readFrom:(id)a3 wrdProperties:(void *)a4 tracked:(void *)a5 properties:(id)a6
{
  id v13 = a3;
  id v10 = a6;
  v11 = v10;
  if (a4 && v10)
  {
    v12 = [v10 tableProperties];
    if (v12) {
      +[WBTableProperties readFrom:v13 wrdProperties:a4 tracked:a5 properties:v12];
    }
    [v11 setResolveMode:0];
    [a1 mapWordProperties:a4 toProperties:v11];
    if (a5
      && WrdTableProperties::WrdTablePropertiesOverridden::isAnythingOverridden((WrdTableProperties::WrdTablePropertiesOverridden *)((char *)a5 + 16)))
    {
      [v11 setResolveMode:1];
      [a1 mapWordProperties:a5 toProperties:v11];
    }
    [v11 setResolveMode:2];
  }
}

+ (void)mapWordProperties:(void *)a3 toProperties:(id)a4
{
  id v5 = a4;
  uint64_t v6 = *((void *)a3 + 2);
  id v11 = v5;
  if ((v6 & 0x800000000000000) != 0)
  {
    [v5 setWidthBefore:*((__int16 *)a3 + 170)];
    uint64_t v6 = *((void *)a3 + 2);
  }
  int v7 = *((_DWORD *)a3 + 6);
  if ((v6 & 0x20000) != 0)
  {
    [v11 setWidthBeforeType:*((unsigned int *)a3 + 35)];
    uint64_t v6 = *((void *)a3 + 2);
    int v7 = *((_DWORD *)a3 + 6);
  }
  if ((v6 & 0x1000000000000000) != 0)
  {
    [v11 setWidthAfter:*((__int16 *)a3 + 171)];
    uint64_t v6 = *((void *)a3 + 2);
    int v7 = *((_DWORD *)a3 + 6);
  }
  if ((v6 & 0x40000) != 0)
  {
    [v11 setWidthAfterType:*((unsigned int *)a3 + 36)];
    uint64_t v6 = *((void *)a3 + 2);
    int v7 = *((_DWORD *)a3 + 6);
  }
  if ((v7 & 0x100000) != 0)
  {
    [v11 setHeader:*((unsigned char *)a3 + 387) != 0];
    uint64_t v6 = *((void *)a3 + 2);
  }
  v8 = v11;
  if ((v6 & 0x100000000000) != 0)
  {
    int v9 = *((_DWORD *)a3 + 75);
    [v11 setHeightType:v9 >= 0];
    if (v9 >= 0) {
      uint64_t v10 = v9;
    }
    else {
      uint64_t v10 = -v9;
    }
    [v11 setHeight:v10];
    v8 = v11;
  }
}

+ (void)write:(id)a3 properties:(id)a4 wrdProperties:(void *)a5 tracked:(void *)a6
{
  id v13 = a3;
  id v10 = a4;
  id v11 = v10;
  if (v10 && a5)
  {
    v12 = [v10 tableProperties];
    if (v12) {
      +[WBTableProperties write:v13 properties:v12 wrdProperties:a5 tracked:a6];
    }
    [v11 setResolveMode:0];
    [a1 mapProperties:v11 toWordProperties:a5];
    [v11 setResolveMode:2];
  }
}

+ (void)mapProperties:(id)a3 toWordProperties:(void *)a4
{
  id v7 = a3;
  if ([v7 isWidthBeforeOverridden]) {
    WrdTableProperties::setWidthOfInvisibleCellBefore((WrdTableProperties *)a4, [v7 widthBefore]);
  }
  if ([v7 isWidthBeforeTypeOverridden]) {
    WrdTableProperties::setWidthOfInvisibleCellBeforeUnit((uint64_t)a4, [v7 widthBeforeType]);
  }
  if ([v7 isWidthAfterOverridden]) {
    WrdTableProperties::setWidthOfInvisibleCellAfter((WrdTableProperties *)a4, [v7 widthAfter]);
  }
  if ([v7 isWidthAfterTypeOverridden]) {
    WrdTableProperties::setWidthOfInvisibleCellAfterUnit((uint64_t)a4, [v7 widthAfterType]);
  }
  if ([v7 isHeaderOverridden]) {
    WrdTableProperties::setTableHeader((WrdTableProperties *)a4, [v7 header]);
  }
  if ([v7 isHeightOverridden]) {
    uint64_t v5 = [v7 height];
  }
  else {
    uint64_t v5 = 1;
  }
  int v6 = [v7 isHeightTypeOverridden];
  if (v6) {
    int v6 = [v7 heightType];
  }
  if (!v6 && v5 > 0 || v6 == 1 && v5 < 0) {
    uint64_t v5 = -v5;
  }
  WrdTableProperties::setRowHeight((WrdTableProperties *)a4, v5);
  WrdTableProperties::setDefaultTableLeftCellPaddingUnit((uint64_t)a4, 3);
  WrdTableProperties::setDefaultTableRightCellPaddingUnit((uint64_t)a4, 3);
  WrdTableProperties::setHalfOfGapBetweenTextInAdjColOfTableRow((WrdTableProperties *)a4, 108);
  WrdTableProperties::setDefaultTableLeftCellPadding((WrdTableProperties *)a4, 108);
  WrdTableProperties::setDefaultTableRightCellPadding((WrdTableProperties *)a4, 108);
  WrdTableProperties::setCantSplit((WrdTableProperties *)a4, 1);
}

@end