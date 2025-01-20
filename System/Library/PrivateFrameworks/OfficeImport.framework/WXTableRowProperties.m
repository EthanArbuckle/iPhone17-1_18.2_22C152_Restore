@interface WXTableRowProperties
+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5;
@end

@implementation WXTableRowProperties

+ (void)readFrom:(_xmlNode *)a3 to:(id)a4 state:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v9 = [v8 WXMainNamespace];
  v10 = (_xmlNode *)OCXFindChild(a3, v9, "ins");

  if (v10)
  {
    v11 = [v7 characterProperties];
    [v11 setEdited:1];

    v12 = [v7 characterProperties];
    v13 = wmxmlGetDateProperty(v10);
    [v12 setEditDate:v13];

    v14 = [v7 characterProperties];
    v15 = [v8 document];
    v16 = wmxmlGetAuthorProperty(v10);
    objc_msgSend(v14, "setIndexToAuthorIDOfEdit:", (unsigned __int16)objc_msgSend(v15, "revisionAuthorAddLookup:", v16));
  }
  v17 = [v8 WXMainNamespace];
  v18 = (_xmlNode *)OCXFindChild(a3, v17, "del");

  if (v18)
  {
    v19 = [v7 characterProperties];
    [v19 setDeleted:1];

    v20 = [v7 characterProperties];
    v21 = wmxmlGetDateProperty(v18);
    [v20 setDeletionDate:v21];

    v22 = [v7 characterProperties];
    v23 = [v8 document];
    v24 = wmxmlGetAuthorProperty(v18);
    objc_msgSend(v22, "setIndexToAuthorIDOfDeletion:", (unsigned __int16)objc_msgSend(v23, "revisionAuthorAddLookup:", v24));
  }
  unsigned int v45 = 0;
  v25 = +[WXCommon heightTypeEnumMap];
  int v26 = readEnumProperty<WDHeightType>(a3, "trHeight", (const xmlChar *)"hRule", v25, &v45, v8);

  if (v26) {
    [v7 setHeightType:v45];
  }
  unsigned int v44 = 1;
  __int16 v43 = 0;
  uint64_t v42 = 0;
  v27 = [v8 WXMainNamespace];
  v28 = (xmlNode *)OCXFindChild(a3, v27, "wBefore");

  v29 = [v8 WXMainNamespace];
  LODWORD(v28) = WXOptionalTableWidthAttribute(v28, v29, (xmlChar *)"w", &v43, &v44);

  if (v28)
  {
    [v7 setWidthBefore:v43];
    [v7 setWidthBeforeType:v44];
  }
  v30 = [v8 WXMainNamespace];
  v31 = (xmlNode *)OCXFindChild(a3, v30, "wAfter");

  v32 = [v8 WXMainNamespace];
  LODWORD(v31) = WXOptionalTableWidthAttribute(v31, v32, (xmlChar *)"w", &v43, &v44);

  if (v31)
  {
    [v7 setWidthAfter:v43];
    [v7 setWidthAfterType:v44];
  }
  v33 = [v8 WXMainNamespace];
  v34 = (_xmlNode *)OCXFindChild(a3, v33, "trHeight");

  v35 = [v8 WXMainNamespace];
  LODWORD(v34) = CXOptionalLongAttribute(v34, v35, (xmlChar *)"val", &v42, 14);

  if (v34) {
    [v7 setHeight:(__int16)v42];
  }
  BOOL v41 = 0;
  v36 = [v8 WXMainNamespace];
  v37 = (_xmlNode *)OCXFindChild(a3, v36, "tblHeader");

  v38 = [v8 WXMainNamespace];
  BOOL v39 = CXOptionalBoolAttribute(v37, v38, (xmlChar *)"val", &v41);

  if (v39)
  {
    BOOL v40 = v41;
LABEL_17:
    [v7 setHeader:v40];
    goto LABEL_18;
  }
  if (v37)
  {
    BOOL v40 = 1;
    goto LABEL_17;
  }
LABEL_18:
  objc_msgSend(v8, "setCurrentRowCNFStyle:", +[WXTableCellProperties bitfieldForCnfStyleFrom:state:](WXTableCellProperties, "bitfieldForCnfStyleFrom:state:", a3, v8));
}

@end