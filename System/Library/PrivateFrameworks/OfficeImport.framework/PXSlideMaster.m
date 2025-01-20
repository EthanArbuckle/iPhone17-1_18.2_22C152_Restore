@interface PXSlideMaster
+ (id)readFromPackagePart:(id)a3 presentationState:(id)a4;
+ (void)readTextStylesFromNode:(_xmlNode *)a3 slideMaster:(id)a4 state:(id)a5;
@end

@implementation PXSlideMaster

+ (id)readFromPackagePart:(id)a3 presentationState:(id)a4
{
  v6 = (OCPPackagePart *)a3;
  id v7 = a4;
  v8 = [PDSlideMaster alloc];
  v9 = [v7 tgtPresentation];
  v53 = [(PDSlideMaster *)v8 initWithPresentation:v9];

  v10 = [(OCPPackagePart *)v6 xmlDocument];
  if (!v10) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  xmlNodePtr v11 = OCXGetRootElement(v10);
  v12 = v11;
  if (!v11 || !xmlStrEqual(v11->name, (const xmlChar *)"sldMaster")) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v13 = [v7 officeArtState];
  v14 = OCXFirstPartWithRelationshipOfTypeToPartWithFallback(v6, v13, (objc_selector *)sel_OCXThemeRelationshipType);
  if (!v14) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v52 = [(PDSlideMaster *)v53 theme];
  +[OAXTheme readFromPackagePart:toTheme:state:](OAXTheme, "readFromPackagePart:toTheme:state:", v14);
  v15 = [v7 PXPresentationMLNamespace];
  uint64_t v16 = OCXFindChild(v12, v15, "clrMap");

  if (!v16) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v17 = [(PDSlideMaster *)v53 colorMap];
  +[OAXColorMap readFromXmlNode:v16 toColorMap:v17];

  [(OCXState *)v13 setPackagePart:v6];
  v18 = [v7 PXPresentationMLNamespace];
  v19 = (_xmlNode *)OCXFindChild(v12, v18, "hf");

  if (v19)
  {
    v20 = CXDefaultStringAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"hdr", (NSString *)@"1");
    v21 = v20;
    if (v20) {
      -[PDSlideMaster setHeaderPlaceholderIsVisible:](v53, "setHeaderPlaceholderIsVisible:", [v20 isEqualToString:@"0"] ^ 1);
    }

    v22 = CXDefaultStringAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"ftr", (NSString *)@"1");
    v23 = v22;
    if (v22) {
      -[PDSlideMaster setFooterPlaceholderIsVisible:](v53, "setFooterPlaceholderIsVisible:", [v22 isEqualToString:@"0"] ^ 1);
    }

    v24 = CXDefaultStringAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"dt", (NSString *)@"1");
    v25 = v24;
    if (v24) {
      -[PDSlideMaster setDateTimePlaceholderIsVisible:](v53, "setDateTimePlaceholderIsVisible:", [v24 isEqualToString:@"0"] ^ 1);
    }

    v26 = CXDefaultStringAttribute(v19, (CXNamespace *)CXNoNamespace, (xmlChar *)"sldNum", (NSString *)@"1");
    v27 = v26;
    if (v26) {
      -[PDSlideMaster setSlideNumberPlaceholderIsVisible:](v53, "setSlideNumberPlaceholderIsVisible:", [v26 isEqualToString:@"0"] ^ 1);
    }
  }
  v28 = [v7 PXPresentationMLNamespace];
  uint64_t v29 = OCXFindChild(v12, v28, "txStyles");

  if (v29) {
    [a1 readTextStylesFromNode:v29 slideMaster:v53 state:v7];
  }
  +[TCProgressContext createStageWithSteps:@"read master slide" takingSteps:1.0 name:0.1];
  +[PXSlideBase readFromPackagePart:v6 toSlideBase:v53 presentationState:v7];
  +[TCProgressContext endStage];
  [v7 resetOfficeArtState];
  v30 = [v7 PXPresentationMLNamespace];
  v31 = (_xmlNode *)OCXFindChild(v12, v30, "sldLayoutIdLst");

  if (v31)
  {
    v32 = [v7 PXPresentationMLNamespace];
    unsigned int v33 = CXCountChildren(v31, v32, (xmlChar *)"sldLayoutId");

    +[TCProgressContext createStageWithSteps:@"read layout slide" takingSteps:(double)v33 name:0.9];
    v34 = [v7 PXPresentationMLNamespace];
    v50 = v14;
    v51 = v13;
    Child = (_xmlNode *)OCXFindChild(v31, v34, "sldLayoutId");

    while (Child)
    {
      id v36 = [NSString alloc];
      v37 = [v7 OCXRelationshipsNamespace];
      v38 = objc_msgSend(v36, "tc_initFromXmlNode:nsWithFallbackNs:attributeName:", Child, v37, "id");

      if (!v38) {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      v39 = -[OCPPackagePart relationshipForIdentifier:](v6, "relationshipForIdentifier:", v38, v50, v51);
      v40 = [(OCPPackagePart *)v6 package];
      v41 = [v39 targetLocation];
      v42 = [v40 partForLocation:v41];

      v43 = [(PDSlideMaster *)v53 addSlideLayout];
      +[PXSlideLayout readFromPackagePart:v42 toSlideLayout:v43 presentationState:v7];
      objc_msgSend(v43, "setSlideId:", CXDefaultUnsignedLongAttribute(Child, (CXNamespace *)CXNoNamespace, (xmlChar *)"id", 0));
      v44 = [v43 transition];
      v45 = [(PDSlideBase *)v53 transition];
      [v44 setParent:v45];

      [v7 resetOfficeArtState];
      v46 = [(OCPPackagePart *)v6 package];
      v47 = [v39 targetLocation];
      [v46 resetPartForLocation:v47];

      v48 = [v7 PXPresentationMLNamespace];
      Child = OCXFindNextChild(Child, v48, (xmlChar *)"sldLayoutId");
    }
    v14 = v50;
    v13 = v51;
    +[TCProgressContext endStage];
  }

  return v53;
}

+ (void)readTextStylesFromNode:(_xmlNode *)a3 slideMaster:(id)a4 state:(id)a5
{
  id v18 = a4;
  id v7 = a5;
  v8 = [v7 officeArtState];
  v9 = [v7 PXPresentationMLNamespace];
  uint64_t v10 = OCXFindChild(a3, v9, "titleStyle");

  if (v10)
  {
    xmlNodePtr v11 = [v18 titleTextStyle];
    +[OAXTextListStyle readNode:v10 textListStyle:v11 state:v8];
  }
  v12 = [v7 PXPresentationMLNamespace];
  uint64_t v13 = OCXFindChild(a3, v12, "bodyStyle");

  if (v13)
  {
    v14 = [v18 bodyTextStyle];
    +[OAXTextListStyle readNode:v13 textListStyle:v14 state:v8];
  }
  v15 = [v7 PXPresentationMLNamespace];
  uint64_t v16 = OCXFindChild(a3, v15, "otherStyle");

  if (v16)
  {
    v17 = [v18 otherTextStyle];
    +[OAXTextListStyle readNode:v16 textListStyle:v17 state:v8];
  }
}

@end