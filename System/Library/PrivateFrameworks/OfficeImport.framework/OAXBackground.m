@interface OAXBackground
+ (id)readBackgroundFromParentNode:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5;
@end

@implementation OAXBackground

+ (id)readBackgroundFromParentNode:(_xmlNode *)a3 inNamespace:(id)a4 state:(id)a5
{
  v7 = (CXNamespace *)a4;
  id v8 = a5;
  unsigned int v25 = 0;
  uint64_t v9 = OCXFindChild(a3, v7, "bg");
  if (!v9)
  {
    uint64_t v14 = 0;
    id v11 = 0;
    goto LABEL_19;
  }
  id v24 = 0;
  BOOL v10 = +[OAXStyleMatrix readReferenceFromParentNode:v9 name:"bgRef" inNamespace:v7 color:&v24 index:&v25];
  id v11 = v24;
  if (!v10)
  {
    v17 = (_xmlNode *)OCXFindChild((_xmlNode *)v9, v7, "bgPr");
    if (!v17)
    {
      uint64_t v14 = 0;
      uint64_t v9 = 0;
      goto LABEL_19;
    }
    v18 = OCXFirstChild(v17);
    uint64_t v14 = 0;
    uint64_t v9 = 0;
    while (1)
    {
      if (!v18) {
        goto LABEL_19;
      }
      if (v14)
      {
        if (v9) {
          goto LABEL_17;
        }
      }
      else
      {
        v19 = [v8 packagePart];
        uint64_t v14 = +[OAXFill readFillFromXmlNode:v18 packagePart:v19 drawingState:v8];

        if (v9) {
          goto LABEL_17;
        }
      }
      if (xmlStrEqual(v18->name, (const xmlChar *)"effectLst"))
      {
        v20 = [v8 packagePart];
        uint64_t v9 = +[OAXEffect readEffectsFromXmlNode:v18 packagePart:v20 drawingState:v8];
      }
      else
      {
        uint64_t v9 = 0;
      }
LABEL_17:
      v18 = OCXNextSibling(v18);
    }
  }
  v12 = [v8 styleMatrix];
  v13 = [v12 bgFillAtIndex:v25];
  uint64_t v14 = [v13 copy];

  uint64_t v9 = 0;
  if (v14 && v11)
  {
    [(id)v14 setStyleColor:v11];
    BOOL v15 = 0;
    uint64_t v9 = 0;
    BOOL v16 = 1;
    goto LABEL_20;
  }
LABEL_19:
  BOOL v16 = v14 != 0;
  BOOL v15 = v9 != 0;
  if (!(v14 | v9))
  {
    uint64_t v9 = 0;
    uint64_t v14 = 0;
    v22 = 0;
    goto LABEL_25;
  }
LABEL_20:
  v21 = objc_alloc_init(OADBackgroundProperties);
  v22 = v21;
  if (v16) {
    [(OADBackgroundProperties *)v21 setFill:v14];
  }
  if (v15) {
    [(OADBackgroundProperties *)v22 setEffects:v9];
  }
LABEL_25:

  return v22;
}

@end