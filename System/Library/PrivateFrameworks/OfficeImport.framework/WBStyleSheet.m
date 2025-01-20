@interface WBStyleSheet
+ (void)initializeStyles:(id)a3 with:(void *)a4 reader:(id)a5;
+ (void)readFrom:(id)a3 styleSheet:(id)a4;
@end

@implementation WBStyleSheet

+ (void)readFrom:(id)a3 styleSheet:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  v7 = +[WBObjectFactory create:57];
  if (v7) {
  else
  }
    v8 = 0;
  uint64_t v9 = [v15 wrdReader];
  (*(void (**)(uint64_t, unsigned __int16 *))(*(void *)v9 + 208))(v9, v8);
  [a1 initializeStyles:v6 with:v8 reader:v15];
  v10 = [v6 defaultCharacterProperties];
  [v10 setResolveMode:0];
  v11 = [v15 fontAtIndex:v8[4]];
  [v10 setFont:v11];
  v12 = [v15 fontAtIndex:v8[7]];

  [v10 setExtendedFont:v12];
  v13 = [v15 fontAtIndex:v8[5]];

  [v10 setFarEastFont:v13];
  v14 = [v15 fontAtIndex:v8[6]];

  [v10 setSymbolFont:v14];
  (*(void (**)(unsigned __int16 *))(*(void *)v8 + 8))(v8);
}

+ (void)initializeStyles:(id)a3 with:(void *)a4 reader:(id)a5
{
  id v30 = a3;
  id v7 = a5;
  int v29 = (unsigned __int16)((*((_DWORD *)a4 + 8) - *((_DWORD *)a4 + 6)) >> 3);
  if ((unsigned __int16)((*((_DWORD *)a4 + 8) - *((_DWORD *)a4 + 6)) >> 3))
  {
    uint64_t v8 = 0;
    v28 = @"Normal";
    do
    {
      uint64_t StyleReference = WrdStyleSheet::getStyleReference((WrdStyleSheet *)a4, (unsigned __int16)v8);
      uint64_t v10 = StyleReference;
      if (*(_DWORD *)(StyleReference + 24))
      {
        v11 = [NSString stringWithCsString:StyleReference + 8];
        v12 = v30;
      }
      else
      {
        v12 = v30;
        v11 = @"__WB_UNKNOWN_DEFAULT_STYLE_NAME__";
        switch((int)v8)
        {
          case 0:
            v13 = v28;
            goto LABEL_21;
          case 1:
            v13 = @"Heading 1";
            goto LABEL_21;
          case 2:
            v13 = @"Heading 2";
            goto LABEL_21;
          case 3:
            v13 = @"Heading 3";
            goto LABEL_21;
          case 4:
            v13 = @"Heading 4";
            goto LABEL_21;
          case 5:
            v13 = @"Heading 5";
            goto LABEL_21;
          case 6:
            v13 = @"Heading 6";
            goto LABEL_21;
          case 7:
            v13 = @"Heading 7";
            goto LABEL_21;
          case 8:
            v13 = @"Heading 8";
            goto LABEL_21;
          case 9:
            v13 = @"Heading 9";
            goto LABEL_21;
          case 10:
            v13 = @"Default Paragraph Font";
            goto LABEL_21;
          case 11:
            v13 = @"Table Normal";
            goto LABEL_21;
          case 12:
            v13 = @"No List";
            goto LABEL_21;
          case 13:
            break;
          case 14:
            v13 = @"Document Map";
LABEL_21:
            v14 = v13;
            v12 = v30;
            v11 = v14;
            break;
          default:
            v11 = &stru_26EBF24D8;
            break;
        }
      }
      id v15 = objc_msgSend(v12, "styleNameToUniqueId:", v11, v28);
      v16 = [v30 styleWithId:v15];
      uint64_t v17 = *(unsigned int *)(v10 + 152);
      if (v16)
      {
        uint64_t v18 = [v30 styleNameToUniqueId:v15];

        v19 = [v30 createStyleWithId:v18 type:v17];

        id v15 = (void *)v18;
        v20 = v19;
        [v19 setName:v11];
      }
      else
      {
        v20 = [v30 createStyleWithId:v15 type:v17];
        [v20 setName:v11];
      }
      if (v8 || v17 != 1)
      {
        if (v8 == 10 && v17 == 2)
        {
          [v30 setDefaultCharacterStyle:v20];
        }
        else if (v8 == 11 && v17 == 3)
        {
          [v30 setDefaultTableStyle:v20];
        }
        else if (v8 == 12 && v17 == 4)
        {
          [v30 setDefaultListStyle:v20];
        }
      }
      else
      {
        [v30 setDefaultParagraphStyle:v20];
      }
      [v7 addStyle:v20 index:v8];

      uint64_t v8 = (v8 + 1);
    }
    while (v29 != v8);
    uint64_t v21 = 0;
    do
    {
      v22 = [v7 styleAtIndex:v21];
      +[WBStyle readFrom:v7 wrdStyle:WrdStyleSheet::getStyleReference((WrdStyleSheet *)a4, (unsigned __int16)v21) style:v22];
      v23 = [v22 name];
      v24 = [v23 componentsSeparatedByString:@","];
      if ((unint64_t)[v24 count] >= 2)
      {
        uint64_t v25 = [v24 count];
        if (v25)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            v27 = [v24 objectAtIndex:i];
            if ([v27 length]) {
              [v30 addStyle:v22 name:v27];
            }
          }
        }
      }

      uint64_t v21 = (v21 + 1);
    }
    while (v21 != v29);
  }
}

@end