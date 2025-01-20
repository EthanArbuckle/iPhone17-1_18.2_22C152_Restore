@interface WXTableCell
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXTableCell

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v8 WXMainNamespace];
  id v35 = 0;
  BOOL v10 = CXOptionalStringAttribute(a3, v9, (xmlChar *)"id", &v35);
  id v11 = v35;

  if (v10) {
    [v7 setIdentifier:v11];
  }
  v12 = [v8 WXMainNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "tcPr");

  if (v13)
  {
    v14 = [v7 properties];
    +[WXTableCellProperties readFrom:v13 to:v14 state:v8];
  }
  v15 = [v7 row];
  v16 = [v15 table];

  v34 = [v16 properties];
  unsigned __int16 v17 = [v8 currentCellCNFStyle];
  unsigned __int16 v18 = [v8 currentRowCNFStyle];
  int v19 = [v34 isBaseStyleOverridden];
  unsigned int v20 = (unsigned __int16)(v18 | v17);
  if (v18 | v17) {
    int v21 = v19;
  }
  else {
    int v21 = 0;
  }
  if (v21 == 1)
  {
    id v33 = v11;
    v22 = [v34 baseStyle];
    uint64_t v23 = 0;
    do
    {
      if ((v20 >> v23))
      {
        v24 = [v22 tableStyleOverrideForPart:v23];
        v25 = v24;
        if (v24 && [v24 isTableCellStylePropertiesOverridden])
        {
          v26 = [v7 properties];
          v27 = [v25 tableCellStyleProperties];
          [v26 addProperties:v27];
        }
      }
      uint64_t v23 = (v23 + 1);
    }
    while (v23 != 12);

    id v11 = v33;
  }
  v28 = [v16 properties];
  int v29 = [v28 isBaseStyleOverridden];

  if (v29)
  {
    v30 = [v16 properties];
    v31 = [v30 baseStyle];
  }
  else
  {
    v31 = 0;
  }
  v32 = [v7 text];
  +[WXText readFrom:a3 baseStyle:v31 to:v32 state:v8];
}

@end