@interface WBTableRow
+ (void)collectCellProperties:(void *)a3 tracked:(void *)a4 for:(id)a5;
+ (void)readCellsFrom:(id)a3 textRuns:(id)a4 level:(int)a5 to:(id)a6 properties:(void *)a7 tracked:(void *)a8;
+ (void)readFrom:(id)a3 textRuns:(id)a4 to:(id)a5 index:(unint64_t)a6 row:(id)a7;
@end

@implementation WBTableRow

+ (void)readFrom:(id)a3 textRuns:(id)a4 to:(id)a5 index:(unint64_t)a6 row:(id)a7
{
  id v31 = a3;
  id v11 = a4;
  id v30 = a5;
  id v28 = a7;
  v29 = v11;
  v12 = [v11 lastObject];
  uint64_t v13 = [v12 pointerValue];

  uint64_t v14 = *(void *)(v13 + 24);
  uint64_t v15 = *(void *)(v13 + 40);
  uint64_t v16 = *(void *)(v13 + 48);
  v17 = [v28 properties];
  +[WBTableRowProperties readFrom:v31 wrdProperties:v15 tracked:v16 properties:v17];

  WrdCharacterTextRun::WrdCharacterTextRun(&v32);
  unsigned int v18 = *(_DWORD *)(v13 + 12) + *(_DWORD *)(v13 + 16) - 1;
  v32.var1 = *(_DWORD *)(v13 + 8);
  v32.var2 = v18;
  v32.var3 = 1;
  uint64_t v19 = [v31 wrdReader];
  (*(void (**)(uint64_t, WrdCharacterTextRun *))(*(void *)v19 + 192))(v19, &v32);
  var4 = v32.var4;
  var5 = v32.var5;
  v22 = [v30 properties];
  v23 = [v22 document];
  v24 = [v28 properties];
  v25 = [v24 characterProperties];
  +[WBCharacterProperties readFrom:v31 wrdProperties:var4 tracked:var5 document:v23 properties:v25];

  uint64_t v26 = *(void *)(v14 + 16);
  if ((v26 & 0x1000000000000) != 0) {
    uint64_t v27 = *(unsigned int *)(v14 + 244);
  }
  else {
    uint64_t v27 = (v26 >> 1) & 1;
  }
  [a1 readCellsFrom:v31 textRuns:v29 level:v27 to:v28 properties:v15 tracked:v16];
  WrdCharacterTextRun::~WrdCharacterTextRun(&v32);
}

+ (void)readCellsFrom:(id)a3 textRuns:(id)a4 level:(int)a5 to:(id)a6 properties:(void *)a7 tracked:(void *)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  uint64_t v15 = [v13 count];
  uint64_t v16 = [v14 table];
  v17 = [v16 text];
  WrdTextRun::WrdTextRun((uint64_t)v32, [v17 textType], 0);
  uint64_t v18 = v15 - 1;

  if (v18)
  {
    uint64_t v19 = 0;
    char v20 = 1;
    do
    {
      v21 = [v13 objectAtIndex:v19];
      uint64_t v22 = [v21 pointerValue];

      if (v20)
      {
        int v23 = 0;
        int v33 = *(_DWORD *)(v22 + 12);
        int v34 = 0;
      }
      else
      {
        int v23 = v34;
      }
      int v34 = *(_DWORD *)(v22 + 16) + v23;
      if (a5 == 1)
      {
        uint64_t v24 = (*(_DWORD *)(v22 + 16) + *(_DWORD *)(v22 + 12));
        v25 = [v12 readCharactersFrom:(v24 - 1) to:v24 textType:*(unsigned int *)(v22 + 8)];
        char v26 = [v25 isEqualToString:@"\a"];

        if ((v26 & 1) == 0) {
          goto LABEL_15;
        }
      }
      else
      {
        uint64_t v28 = *(void *)(v22 + 24);
        uint64_t v29 = *(void *)(v28 + 16);
        if ((v29 & 0x1000000000000) != 0) {
          unsigned int v30 = *(_DWORD *)(v28 + 244);
        }
        else {
          unsigned int v30 = (v29 >> 1) & 1;
        }
        char v20 = 0;
        if ((v29 & 0x2000000000000) == 0 || v30 != a5) {
          goto LABEL_16;
        }
        if ((*(unsigned char *)(v28 + 296) & 0x10) == 0)
        {
LABEL_15:
          char v20 = 0;
          goto LABEL_16;
        }
      }
      uint64_t v27 = [v14 addCell];
      +[WBTableCell readFrom:textRun:with:tracked:row:index:cell:](WBTableCell, "readFrom:textRun:with:tracked:row:index:cell:", v12, v32, a7, a8, v14, [v14 cellCount] - 1, v27);

      char v20 = 1;
LABEL_16:
      ++v19;
    }
    while (v18 != v19);
  }
}

+ (void)collectCellProperties:(void *)a3 tracked:(void *)a4 for:(id)a5
{
  id v11 = a5;
  uint64_t v7 = [v11 cellCount];
  WrdTableProperties::insertCells((WrdTableProperties *)a3, 0, (__int16)v7, 0);
  WrdTableProperties::insertCells((WrdTableProperties *)a4, 0, (__int16)v7, 0);
  if (v7)
  {
    for (uint64_t i = 0; i != v7; ++i)
    {
      v9 = [v11 cellAt:i];
      v10 = [v9 properties];
      +[WBTableCellBodyProperties write:v10 wrdProperties:a3 tracked:a4 index:i];
    }
  }
}

@end