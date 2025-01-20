@interface PXComment
+ (void)readComments:(id)a3 slide:(id)a4 state:(id)a5;
@end

@implementation PXComment

+ (void)readComments:(id)a3 slide:(id)a4 state:(id)a5
{
  id v39 = a3;
  id v44 = a4;
  id v7 = a5;
  v8 = [v7 PXPresentationMLNamespace];
  v9 = (_xmlDoc *)[v39 xmlDocument];
  if (!v9) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  xmlNodePtr v10 = OCXGetRootElement(v9);
  v11 = v10;
  if (!v10 || !xmlStrEqual(v10->name, (const xmlChar *)"cmLst")) {
    +[TCMessageException raise:](TCMessageException, "raise:", TCInvalidFileFormatMessage, v39);
  }
  Child = (_xmlNode *)OCXFindChild(v11, v8, "cm");
  v43 = v7;
  while (Child)
  {
    v13 = objc_alloc_init(PDComment);
    v14 = CXRequiredUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"authorId");
    v15 = [v7 commentAuthorIdToIndexMap];
    v16 = [NSNumber numberWithUnsignedInt:v14];
    v17 = [v15 objectForKey:v16];

    -[PDComment setAuthorId:](v13, "setAuthorId:", [v17 unsignedIntValue]);
    [(PDComment *)v13 setIndex:CXRequiredUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx") - 1];
    CXDefaultStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"dt", 0);
    v18 = (NSString *)objc_claimAutoreleasedReturnValue();
    v19 = v18;
    if (v18)
    {
      v20 = CXDateForISO8601WithString(v18);
      [(PDComment *)v13 setDate:v20];
    }
    uint64_t v21 = OCXFindChild(Child, v8, "text");
    if (v21)
    {
      uint64_t v22 = *(void *)(v21 + 24);
      if (v22 && *(void *)(v22 + 80))
      {
        objc_msgSend(NSString, "tc_stringWithXmlString:");
        v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v23 = &stru_26EBF24D8;
      }
    }
    else
    {
      v23 = &stru_26EBF24D8;
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    -[PDComment setText:](v13, "setText:", v23, v39);
    v24 = (_xmlNode *)OCXFindChild(Child, v8, "pos");
    if (!v24) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    int v25 = CXDefaultLongAttribute(v24, (CXNamespace *)CXNoNamespace, (xmlChar *)"x", 0, 12);
    -[PDComment setPosition:](v13, "setPosition:", (double)v25 * 0.125, (double)(int)CXDefaultLongAttribute(v24, (CXNamespace *)CXNoNamespace, (xmlChar *)"y", 0, 12) * 0.125);
    v26 = (_xmlNode *)OCXFindChild(Child, v8, "extLst");
    if (v26)
    {
      v27 = (_xmlNode *)OCXFindChild(v26, v8, "ext");
      v28 = v27;
      if (v27)
      {
        v29 = CXRequiredStringAttribute(v27, (CXNamespace *)CXNoNamespace, (xmlChar *)"uri");
        if ([@"{C676402C-5697-4E1C-873F-D02D1690AC5C}" isEqualToString:v29])
        {
          v30 = (_xmlNode *)OCXFindChild(v28, (CXNamespace *)PXPowerPoint2012Namespace, "threadingInfo");
          if (v30)
          {
            v31 = (_xmlNode *)OCXFindChild(v30, (CXNamespace *)PXPowerPoint2012Namespace, "parentCm");
            v32 = v31;
            if (v31)
            {
              v33 = CXRequiredUnsignedLongAttribute(v31, (CXNamespace *)CXNoNamespace, (xmlChar *)"authorId");
              uint64_t v34 = objc_opt_class();
              v42 = [v43 commentAuthorIdToIndexMap];
              v41 = [NSNumber numberWithUnsignedInt:v33];
              v35 = [v42 objectForKey:v41];
              v36 = TSUDynamicCast(v34, (uint64_t)v35);
              uint64_t v40 = [v36 unsignedIntegerValue];

              v37 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", CXRequiredUnsignedLongAttribute(v32, (CXNamespace *)CXNoNamespace, (xmlChar *)"idx") - 1);
              v38 = objc_msgSend(v44, "commentForAuthorId:authorIdx:", v40, objc_msgSend(v37, "unsignedIntegerValue"));

              if (v38) {
                [(PDComment *)v13 setParent:v38];
              }
            }
          }
        }

        id v7 = v43;
      }
    }
    [v44 addComment:v13];

    Child = OCXFindNextChild(Child, v8, (xmlChar *)"cm");
  }
}

@end