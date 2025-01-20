@interface PXSlideBase
+ (id)readLegacyDrawables:(id)a3 state:(id)a4;
+ (void)readFromPackagePart:(id)a3 toSlideBase:(id)a4 presentationState:(id)a5;
@end

@implementation PXSlideBase

+ (void)readFromPackagePart:(id)a3 toSlideBase:(id)a4 presentationState:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  v47 = v7;
  v10 = (_xmlDoc *)[v7 xmlDocument];
  if (!v10) {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
  }
  v11 = OCXGetRootElement(v10);
  if (!v11)
  {
    +[TCMessageException raise:TCInvalidFileFormatMessage];
    v11 = 0;
  }
  uint64_t v49 = 0;
  v48 = v11;
  BOOL v12 = CXOptionalLongAttribute(v11, (CXNamespace *)CXNoNamespace, (xmlChar *)"show", &v49);
  if (v49) {
    BOOL v13 = 0;
  }
  else {
    BOOL v13 = v12;
  }
  if (v13) {
    [v8 setIsHidden:1];
  }
  v14 = [v9 PXPresentationMLNamespace];
  v15 = (_xmlNode *)OCXFindChild(v48, v14, "cSld");

  uint64_t v16 = CXDefaultStringAttribute(v15, (CXNamespace *)CXNoNamespace, (xmlChar *)"name", 0);
  v46 = (void *)v16;
  if (v16) {
    [v8 setName:v16];
  }
  v17 = [v9 officeArtState];
  [v17 setPackagePart:v7];
  v18 = [v9 tableStyleCache];
  [v17 setTableStyleCache:v18];

  v19 = [v8 colorScheme];
  [v17 setColorScheme:v19];

  v20 = [v8 fontScheme];
  [v17 setFontScheme:v20];

  v21 = [v8 colorMap];
  [v17 setColorMap:v21];

  v22 = [v9 PXPresentationMLNamespace];
  uint64_t v23 = +[OAXBackground readBackgroundFromParentNode:v15 inNamespace:v22 state:v17];

  v45 = (void *)v23;
  if (v23) {
    [v8 setBackground:v23];
  }
  v24 = [v9 PXPresentationMLNamespace];
  v25 = (_xmlNode *)OCXFindChild(v15, v24, "spTree");

  p_superclass = (__objc2_class **)(TSUZipWriterEntry + 8);
  if (v25)
  {
    v27 = +[PXSlideBase readLegacyDrawables:v47 state:v9];
    v28 = OCXFirstChild(v25);
    for (unsigned int i = 0; v28; ++i)
      v28 = OCXNextSibling(v28);
    +[TCProgressContext createStageWithSteps:@"read drawables" takingSteps:(double)i name:1.0];
    v30 = [v9 PXPresentationMLNamespace];
    v31 = +[OAXDrawable readDrawablesFromXmlNode:v25 inNamespace:v30 drawingState:v17];

    v32 = objc_msgSend(MEMORY[0x263EFF980], "arrayWithCapacity:", objc_msgSend(v27, "count") + objc_msgSend(v31, "count"));
    [v32 addObjectsFromArray:v31];
    for (unsigned int j = 0; [v27 count] > (unint64_t)j; ++j)
    {
      v34 = [v27 objectAtIndex:j];
      v35 = [v17 oavState];
      char v36 = [v35 isDualDrawable:v34];

      if ((v36 & 1) == 0) {
        [v32 addObject:v34];
      }
    }
    [v8 setDrawables:v32];

    p_superclass = TSUZipWriterEntry.superclass;
  }
  v37 = [v9 tgtPresentation];
  [v37 cacheGraphicStylesForSlideBase:v8];

  [p_superclass + 464 endStage];
  v38 = [v9 PXPresentationMLNamespace];
  uint64_t v39 = OCXFindChild(v48, v38, "timing");

  v40 = [v8 animation];
  +[PXAnimation readAnimationFromTimingXmlNode:v39 tgtAnimation:v40 drawingState:v17];

  v41 = [v9 PXPresentationMLNamespace];
  uint64_t v42 = OCXFindChild(v48, v41, "transition");

  if (v42 || (uint64_t v42 = OCXFindChild(v48, (CXNamespace *)PXMacPowerPointNamespace, "transition")) != 0)
  {
    v43 = objc_alloc_init(PDTransition);
    +[PXTransition readTransitionFromNode:v42 tgtTransition:v43 drawingState:v17];
    [v8 setTransition:v43];
  }
  v44 = +[OAXTable readDefaultTableStyleWithDrawingState:v17];
  [v8 setDefaultTableStyle:v44];
}

+ (id)readLegacyDrawables:(id)a3 state:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 oavState];
  id v8 = [v6 OCXVmlDrawingRelationshipType];
  id v9 = [v5 relationshipsByType:v8];

  if (v9)
  {
    v10 = [v5 package];
    if (!v10) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    if ([v9 count] != 1) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    v11 = [v9 objectAtIndex:0];
    BOOL v12 = [v11 targetLocation];
    BOOL v13 = [v10 partForLocation:v12];

    if (!v13) {
      +[TCMessageException raise:TCInvalidFileFormatMessage];
    }
    v14 = +[OAVDrawable vmlDocumentFromPart:v13];
    v15 = v14;
    if (v14)
    {
      xmlNodePtr v16 = OCXGetRootElement(v14);
      if (!v16) {
        +[TCMessageException raise:TCInvalidFileFormatMessage];
      }
      [v7 resetForNewDrawing];
      [v7 setPackagePart:v13];
      v17 = [v6 PXPresentationMLNamespace];
      v18 = +[OAVDrawable readDrawablesFromParent:v16 inNamespace:v17 state:v7];

      v19 = [v9 objectAtIndexedSubscript:0];
      v20 = [v19 targetLocation];
      [v10 resetPartForLocation:v20];

      xmlFreeDoc(v15);
    }
    else
    {
      v18 = 0;
    }
  }
  else
  {
    v18 = 0;
  }

  return v18;
}

@end