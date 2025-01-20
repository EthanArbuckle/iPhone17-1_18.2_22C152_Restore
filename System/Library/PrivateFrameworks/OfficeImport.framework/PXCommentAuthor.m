@interface PXCommentAuthor
+ (void)readCommentAuthors:(id)a3 presentation:(id)a4 state:(id)a5;
@end

@implementation PXCommentAuthor

+ (void)readCommentAuthors:(id)a3 presentation:(id)a4 state:(id)a5
{
  id v23 = a3;
  id v7 = a4;
  id v8 = a5;
  v9 = (_xmlDoc *)[v23 xmlDocument];
  if (!v9) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  xmlNodePtr v10 = OCXGetRootElement(v9);
  v11 = v10;
  if (!v10 || !xmlStrEqual(v10->name, (const xmlChar *)"cmAuthorLst")) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v12 = [v8 PXPresentationMLNamespace];
  Child = (_xmlNode *)OCXFindChild(v11, v12, "cmAuthor");

  while (Child)
  {
    v14 = objc_alloc_init(PDCommentAuthor);
    v15 = CXRequiredUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"id");
    uint64_t v16 = [v7 commentAuthorCount];
    v17 = [v8 commentAuthorIdToIndexMap];
    v18 = [NSNumber numberWithUnsignedInt:v16];
    v19 = [NSNumber numberWithUnsignedInt:v15];
    [v17 setObject:v18 forKey:v19];

    [(PDCommentAuthor *)v14 setId:v16];
    v20 = CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"name");
    [(PDCommentAuthor *)v14 setName:v20];
    v21 = CXRequiredStringAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"initials");
    [(PDCommentAuthor *)v14 setInitials:v21];
    [(PDCommentAuthor *)v14 setLastCommentIndex:CXRequiredUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"lastIdx") - 1];
    [(PDCommentAuthor *)v14 setColorIndex:CXRequiredUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"clrIdx")];
    [v7 addCommentAuthor:v14];

    v22 = [v8 PXPresentationMLNamespace];
    Child = OCXFindNextChild(Child, v22, (xmlChar *)"cmAuthor");
  }
}

@end