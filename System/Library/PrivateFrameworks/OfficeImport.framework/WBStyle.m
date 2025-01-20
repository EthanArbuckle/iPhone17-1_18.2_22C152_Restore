@interface WBStyle
+ (void)readFrom:(id)a3 wrdStyle:(void *)a4 style:(id)a5;
+ (void)readTableProperties:(id)a3 style:(id)a4 from:(void *)a5;
@end

@implementation WBStyle

+ (void)readFrom:(id)a3 wrdStyle:(void *)a4 style:(id)a5
{
  id v26 = a3;
  id v8 = a5;
  [v8 setHidden:(*((unsigned __int8 *)a4 + 164) >> 1) & 1];
  uint64_t v9 = *((unsigned __int16 *)a4 + 79);
  if (v9 != 4095)
  {
    objc_msgSend(v26, "styleAtIndex:expectedType:", v9, objc_msgSend(v8, "type"));
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    if (v10)
    {
      id v12 = v10;
      while (v12 != v8)
      {
        uint64_t v13 = [v12 baseStyle];

        id v12 = (id)v13;
        if (!v13) {
          goto LABEL_8;
        }
      }

      v11 = 0;
    }
LABEL_8:
    [v8 setBaseStyle:v11];
  }
  uint64_t v14 = *((unsigned __int16 *)a4 + 80);
  if (v14 != 4095)
  {
    v15 = objc_msgSend(v26, "styleAtIndex:expectedType:", v14, objc_msgSend(v8, "type"));
    [v8 setNextStyle:v15];
  }
  v16 = [v8 styleSheet];
  v17 = [v16 document];

  uint64_t v18 = *((void *)a4 + 4);
  uint64_t v19 = *((void *)a4 + 5);
  v20 = [v8 paragraphProperties];
  +[WBParagraphProperties readFrom:v26 wrdProperties:v18 tracked:v19 document:v17 properties:v20];

  uint64_t v21 = *((void *)a4 + 6);
  uint64_t v22 = *((void *)a4 + 7);
  v23 = [v8 characterProperties];
  +[WBCharacterProperties readFrom:v26 wrdProperties:v21 tracked:v22 document:v17 properties:v23];

  v24 = [v8 characterProperties];
  [v24 clearBaseStyle];

  v25 = [v8 paragraphProperties];
  [v25 clearBaseStyle];

  [a1 readTableProperties:v26 style:v8 from:a4];
}

+ (void)readTableProperties:(id)a3 style:(id)a4 from:(void *)a5
{
  id v13 = a3;
  id v7 = a4;
  if ([v7 type] == 3)
  {
    uint64_t v8 = *((void *)a5 + 8);
    uint64_t v9 = [v7 tableRowProperties];
    +[WBTableRowProperties readFrom:v13 wrdProperties:v8 tracked:0 properties:v9];

    id v10 = [v7 tableCellProperties];
    +[WBTableCellStyleProperties readFrom:v8 properties:v10];

    uint64_t v11 = 0;
    do
    {
      id v12 = [v7 tableStyleOverrideForPart:v11];
      +[WBTableStyleOverride readFrom:v13 wrdStyle:a5 style:v7 part:v11 tableStyleOverride:v12];

      uint64_t v11 = (v11 + 1);
    }
    while (v11 != 12);
  }
}

@end