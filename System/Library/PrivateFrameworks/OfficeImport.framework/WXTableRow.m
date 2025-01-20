@interface WXTableRow
+ (void)readCellsFrom:(_xmlNode *)a3 tableGrid:(void *)a4 to:(id)a5 gridIndex:(int64_t *)a6 state:(id)a7;
+ (void)readFrom:(_xmlNode *)a3 tableGrid:(void *)a4 to:(id)a5 state:(id)a6;
@end

@implementation WXTableRow

+ (void)readFrom:(_xmlNode *)a3 tableGrid:(void *)a4 to:(id)a5 state:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v29 = [v8 properties];
  v10 = [v9 WXMainNamespace];
  uint64_t v11 = OCXFindChild(a3, v10, "tblPrEx");

  if (v11)
  {
    v12 = [v29 tableProperties];
    +[WXTableProperties readFrom:v11 to:v12 state:v9];
  }
  v13 = [v9 WXMainNamespace];
  v14 = (_xmlNode *)OCXFindChild(a3, v13, "trPr");

  if (v14) {
    +[WXTableRowProperties readFrom:v14 to:v29 state:v9];
  }
  v28 = [v8 table];
  v15 = [v28 properties];
  if ([v15 isBaseStyleOverridden] && objc_msgSend(v9, "currentRowCNFStyle"))
  {
    v25 = v15;
    v16 = [v15 baseStyle];
    uint64_t v17 = 0;
    do
    {
      if (([v9 currentRowCNFStyle] & (1 << v17)) != 0)
      {
        v18 = [v16 tableStyleOverrideForPart:v17];
        v19 = v18;
        if (v18 && [v18 isTableRowPropertiesOverridden])
        {
          v20 = [v8 properties];
          v21 = [v19 tableRowProperties];
          [v20 addProperties:v21];
        }
      }
      uint64_t v17 = (v17 + 1);
    }
    while (v17 != 12);

    v15 = v25;
  }
  uint64_t v30 = 0;
  if (v14)
  {
    v22 = [v9 WXMainNamespace];
    v23 = (_xmlNode *)OCXFindChild(v14, v22, "gridBefore");

    if (v23)
    {
      v24 = [v9 WXMainNamespace];
      uint64_t v30 = CXDefaultLongAttribute(v23, v24, (xmlChar *)"val", 0);
    }
  }
  [a1 readCellsFrom:a3 tableGrid:a4 to:v8 gridIndex:&v30 state:v9];
  [v9 setCurrentRowCNFStyle:0];
}

+ (void)readCellsFrom:(_xmlNode *)a3 tableGrid:(void *)a4 to:(id)a5 gridIndex:(int64_t *)a6 state:(id)a7
{
  id v37 = a5;
  id v11 = a7;
  v12 = OCXFirstChild(a3);
  v13 = 0;
  char v35 = 0;
  while (v12)
  {
    if (xmlStrEqual(v12->name, (const xmlChar *)"sdt"))
    {
      +[TCMessageContext reportWarning:WXFormsNotSupported];
      v14 = [v11 WXMainNamespace];
      uint64_t v15 = OCXFindChild(v12, v14, "sdtContent");

      if (v15) {
        [a1 readCellsFrom:v15 tableGrid:a4 to:v37 gridIndex:a6 state:v11];
      }
      goto LABEL_30;
    }
    if (xmlStrEqual(v12->name, (const xmlChar *)"commentRangeStart"))
    {
      [v11 addPendingComment:v12];
      goto LABEL_30;
    }
    if (xmlStrEqual(v12->name, (const xmlChar *)"tc"))
    {
      v16 = [v11 WXMainNamespace];
      uint64_t v17 = (_xmlNode *)OCXFindChild(v12, v16, "tcPr");

      if (v17)
      {
        v18 = [v11 WXMainNamespace];
        v19 = (_xmlNode *)OCXFindChild(v17, v18, "gridSpan");

        if (v19)
        {
          v20 = [v11 WXMainNamespace];
          uint64_t v21 = CXDefaultLongAttribute(v19, v20, (xmlChar *)"val", 1);
        }
        else
        {
          uint64_t v21 = 1;
        }
        v22 = [v11 WXMainNamespace];
        v23 = (_xmlNode *)OCXFindChild(v17, v22, "hMerge");

        if (v23)
        {
          v24 = [v11 WXMainNamespace];
          id v38 = 0;
          BOOL v25 = CXOptionalStringAttribute(v23, v24, (xmlChar *)"val", &v38);
          id v26 = v38;

          if (v25) {
            char v27 = [@"restart" isEqualToString:v26];
          }
          else {
            char v27 = 0;
          }

          if ((v35 & 1) != 0 && (v27 & 1) == 0)
          {
            v28 = [v13 properties];
            __int16 v29 = [v28 width];

LABEL_24:
            if (v21 >= 1)
            {
              int64_t v31 = *a6;
              uint64_t v32 = *(void *)a4;
              int64_t v33 = ((*((void *)a4 + 1) - *(void *)a4) >> 3);
              if (*a6 > v33) {
                int64_t v33 = *a6;
              }
              do
              {
                if (v33 == v31) {
                  break;
                }
                v29 += *(void *)(v32 + 8 * v31++);
                *a6 = v31;
                --v21;
              }
              while (v21);
            }
            v34 = [v13 properties];
            [v34 setWidth:v29];

            goto LABEL_30;
          }
          char v35 = v27;
        }
        else
        {
          char v35 = 0;
        }
      }
      else
      {
        char v35 = 0;
        uint64_t v21 = 1;
      }
      uint64_t v30 = [v37 addCell];

      +[WXTableCell readFrom:v12 to:v30 state:v11];
      __int16 v29 = 0;
      v13 = (void *)v30;
      goto LABEL_24;
    }
LABEL_30:
    v12 = OCXNextSibling(v12);
  }
}

@end