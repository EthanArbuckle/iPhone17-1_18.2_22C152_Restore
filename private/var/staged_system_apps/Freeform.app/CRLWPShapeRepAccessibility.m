@interface CRLWPShapeRepAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxCanBeginEditingChildRepOnDoubleTap:(id)a3;
- (BOOL)crlaxIsEditingChildRep;
- (BOOL)crlaxIsIgnored;
- (BOOL)crlaxIsTextboxRep;
- (BOOL)crlaxNeedsFormatEditOperation;
- (BOOL)crlaxShouldCreateKnobs;
- (BOOL)isAccessibilityElement;
- (CRLTextRepAccessibility)crlaxContainedRep;
- (CRLWPShapeItemAccessibility)crlaxInfo;
- (NSString)crlaxContainedRepText;
- (NSString)crlaxFillColorDescription;
- (NSString)crlaxLabel;
- (NSString)crlaxStrokeDescription;
- (id)_crlaxDescriptionForVerticalAlignment;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomContent;
- (id)accessibilityUserInputLabels;
- (id)crlaxCollaboratorDescription;
- (id)crlaxDescriptionForConnections;
- (id)crlaxFocusedElement;
- (id)crlaxSummaryDescription;
- (void)crlaxBeginEditingAtEnd;
- (void)crlaxLoadChildrenIntoCollection:(id)a3;
- (void)crlaxShapeRepWillBeginEditingContainedRep:(id)a3;
- (void)willBeginEditingContainedInfo:(id)a3;
@end

@implementation CRLWPShapeRepAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLWPShapeRep";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (BOOL)crlaxIsTextboxRep
{
  v2 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  id v3 = [v2 info];
  unsigned __int8 v4 = [v3 isAutogrowingTextBox];

  return v4;
}

- (NSString)crlaxLabel
{
  id v3 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  unsigned __int8 v4 = [v3 info];

  if ([(CRLWPShapeRepAccessibility *)self crlaxIsTextboxRep]) {
    [v4 localizedName];
  }
  else {
  v5 = [v4 crlaxLocalizedName];
  }
  v14 = [v4 accessibilityDescription];
  v12 = __CRLAccessibilityStringForVariables(1, 0, v6, v7, v8, v9, v10, v11, (uint64_t)v5);

  return (NSString *)v12;
}

- (id)accessibilityUserInputLabels
{
  id v3 = [(CRLWPShapeRepAccessibility *)self crlaxLabel];
  uint64_t v11 = v3;
  unsigned __int8 v4 = +[NSArray arrayWithObjects:&v11 count:1];

  v5 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  uint64_t v6 = [v5 info];

  if ([v6 isLine])
  {
    uint64_t v7 = [v6 crlaxLocalizedName];
    uint64_t v10 = v7;
    uint64_t v8 = +[NSArray arrayWithObjects:&v10 count:1];

    unsigned __int8 v4 = (void *)v8;
  }

  return v4;
}

- (id)accessibilityCustomContent
{
  v36.receiver = self;
  v36.super_class = (Class)CRLWPShapeRepAccessibility;
  id v3 = [(CRLCanvasRepAccessibility *)&v36 accessibilityCustomContent];
  id v4 = [v3 mutableCopy];

  v5 = [(CRLWPShapeRepAccessibility *)self crlaxFillColorDescription];
  if ([v5 length])
  {
    uint64_t v6 = +[NSBundle mainBundle];
    uint64_t v7 = [v6 localizedStringForKey:@"Fill color" value:0 table:0];
    uint64_t v8 = +[AXCustomContent customContentWithLabel:v7 value:v5];
    [v4 addObject:v8];
  }
  uint64_t v9 = [(CRLWPShapeRepAccessibility *)self crlaxStrokeDescription];
  if ([v9 length])
  {
    uint64_t v10 = +[NSBundle mainBundle];
    uint64_t v11 = [v10 localizedStringForKey:@"Stroke" value:0 table:0];
    v12 = +[AXCustomContent customContentWithLabel:v11 value:v9];
    [v4 addObject:v12];
  }
  v13 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  v14 = [v13 info];

  if ([v14 isLine])
  {
    v15 = objc_opt_class();
    v16 = [v14 tailLineEnd];
    v17 = __CRLAccessibilityCastAsSafeCategory(v15, (uint64_t)v16, 0, 0);

    if (v17)
    {
      v18 = [v17 crlaxStyleInfoDescription];
      if ([v18 length])
      {
        +[NSBundle mainBundle];
        v20 = v19 = v5;
        v21 = [v20 localizedStringForKey:@"Tail line end" value:0 table:0];
        v22 = +[AXCustomContent customContentWithLabel:v21 value:v18];
        [v4 addObject:v22];

        v5 = v19;
      }
    }
    v23 = objc_opt_class();
    v24 = [v14 headLineEnd];
    v25 = __CRLAccessibilityCastAsSafeCategory(v23, (uint64_t)v24, 0, 0);

    if (v25)
    {
      v26 = [v25 crlaxStyleInfoDescription];
      if ([v26 length])
      {
        v35 = v5;
        v27 = +[NSBundle mainBundle];
        v28 = [v27 localizedStringForKey:@"Head line end" value:0 table:0];
        v29 = +[AXCustomContent customContentWithLabel:v28 value:v26];
        [v4 addObject:v29];

        v5 = v35;
      }
    }
  }
  v30 = [(CRLWPShapeRepAccessibility *)self _crlaxDescriptionForVerticalAlignment];
  if ([v30 length])
  {
    v31 = +[NSBundle mainBundle];
    v32 = [v31 localizedStringForKey:@"Vertical text alignment" value:0 table:0];
    v33 = +[AXCustomContent customContentWithLabel:v32 value:v30];
    [v4 addObject:v33];
  }

  return v4;
}

- (CRLWPShapeItemAccessibility)crlaxInfo
{
  char v8 = 0;
  v2 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  id v3 = [v2 info];

  id v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  uint64_t v6 = (void *)v5;

  return (CRLWPShapeItemAccessibility *)v6;
}

- (CRLTextRepAccessibility)crlaxContainedRep
{
  char v8 = 0;
  v2 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  id v3 = [v2 textRep];

  id v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  uint64_t v6 = (void *)v5;

  return (CRLTextRepAccessibility *)v6;
}

- (BOOL)crlaxIsEditingChildRep
{
  id v3 = [(CRLWPShapeRepAccessibility *)self crlaxContainedRep];

  if (!v3) {
    return 0;
  }
  id v4 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  unsigned __int8 v5 = [v4 isEditingChildRep];

  return v5;
}

- (NSString)crlaxFillColorDescription
{
  char v14 = 0;
  v2 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
  id v3 = [v2 crlaxTarget];

  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v14);
  if (v14) {
    goto LABEL_6;
  }
  uint64_t v6 = (void *)v5;

  char v13 = 0;
  uint64_t v7 = [v6 fill];
  char v8 = objc_opt_class();
  uint64_t v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v7, 1, &v13);
  if (v13) {
LABEL_6:
  }
    abort();
  uint64_t v10 = (void *)v9;

  uint64_t v11 = [v10 crlaxColorFillNameWithOpacity];

  return (NSString *)v11;
}

- (NSString)crlaxStrokeDescription
{
  char v15 = 0;
  v2 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
  id v3 = [v2 crlaxTarget];

  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v15);
  if (v15) {
    goto LABEL_6;
  }
  uint64_t v6 = (void *)v5;

  char v14 = 0;
  uint64_t v7 = [v6 styledInfo];
  char v8 = [v7 stroke];

  uint64_t v9 = objc_opt_class();
  uint64_t v10 = __CRLAccessibilityCastAsSafeCategory(v9, (uint64_t)v8, 1, &v14);
  if (v14) {
LABEL_6:
  }
    abort();
  uint64_t v11 = (void *)v10;

  v12 = [v11 crlaxStrokeFullDescription];

  return (NSString *)v12;
}

- (NSString)crlaxContainedRepText
{
  v2 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  id v3 = [v2 containedRep];
  id v4 = [v3 storage];
  uint64_t v5 = [v4 crlaxString];

  return (NSString *)v5;
}

- (BOOL)crlaxCanBeginEditingChildRepOnDoubleTap:(id)a3
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10005F0F4;
  v6[3] = &unk_1014CEE50;
  char v8 = &v9;
  v6[4] = self;
  id v3 = a3;
  id v7 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }

  char v4 = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);

  return v4;
}

- (void)willBeginEditingContainedInfo:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)CRLWPShapeRepAccessibility;
  [(CRLWPShapeRepAccessibility *)&v4 willBeginEditingContainedInfo:a3];
  if ([(CRLWPShapeRepAccessibility *)self crlaxRespondsToSelector:"crlaxShapeRepWillBeginEditingContainedRep:" fromOptionalExtrasProtocol:&OBJC_PROTOCOL___CRLWPShapeRepAccessibilityExtras])[(CRLWPShapeRepAccessibility *)self crlaxShapeRepWillBeginEditingContainedRep:self]; {
}
  }

- (void)crlaxBeginEditingAtEnd
{
  id v3 = [(CRLWPShapeRepAccessibility *)self crlaxContainedRep];
  objc_super v4 = [v3 crlaxStorage];
  id v15 = [v4 crlaxTarget];

  uint64_t v5 = (char *)[v15 range];
  id v7 = &v5[v6];
  char v8 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  uint64_t v9 = [v8 crlaxTarget];
  uint64_t v10 = [v9 selectionModelTranslator];
  uint64_t v11 = [v10 selectionPathForRange:v7 onStorage:0];

  char v12 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  char v13 = [v12 crlaxEditorController];
  char v14 = [v13 crlaxTarget];
  [v14 setSelectionPath:v11 withFlags:6];
}

- (id)crlaxSummaryDescription
{
  unsigned int v3 = [(CRLWPShapeRepAccessibility *)self crlaxIsTextboxRep];
  objc_super v4 = +[NSBundle mainBundle];
  uint64_t v5 = v4;
  if (v3)
  {
    uint64_t v6 = [v4 localizedStringForKey:@"Text box: %1$@" value:0 table:0];
    id v7 = [(CRLWPShapeRepAccessibility *)self crlaxContainedRep];
    [v7 crlaxSummaryDescription];
  }
  else
  {
    uint64_t v6 = [v4 localizedStringForKey:@"%1$@ shape" value:0 table:0];
    id v7 = [(CRLShapeRepAccessibility *)self crlaxShapeInfo];
    [v7 crlaxShapeTypeLabel];
  char v8 = };
  uint64_t v9 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v6, v8);

  return v9;
}

- (id)crlaxCollaboratorDescription
{
  v8.receiver = self;
  v8.super_class = (Class)CRLWPShapeRepAccessibility;
  unsigned int v3 = [(CRLCanvasRepAccessibility *)&v8 crlaxCollaboratorDescription];
  objc_super v4 = [(CRLWPShapeRepAccessibility *)self crlaxContainedRep];
  uint64_t v5 = [v4 crlaxCollaboratorDescriptionDirect];

  if ([v5 length])
  {
    id v6 = v5;

    unsigned int v3 = v6;
  }

  return v3;
}

- (id)_crlaxDescriptionForVerticalAlignment
{
  v2 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  unsigned int v3 = [v2 layoutsForChildReps];

  if ([v3 count] == (id)1)
  {
    char v10 = 0;
    objc_super v4 = [v3 firstObject];
    uint64_t v5 = (objc_class *)objc_opt_class();
    uint64_t v6 = __CRLAccessibilityCastAsClass(v5, (uint64_t)v4, 1, &v10);
    if (v10) {
      abort();
    }
    id v7 = (void *)v6;

    if (v7)
    {
      objc_super v8 = +[NSString crlwpax_descriptionForVerticalAlignment:](NSString, "crlwpax_descriptionForVerticalAlignment:", [v7 verticalAlignment]);
    }
    else
    {
      objc_super v8 = 0;
    }
  }
  else
  {
    objc_super v8 = 0;
  }

  return v8;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v5 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  uint64_t v6 = [v5 shapeLayout];
  unsigned int v7 = [v6 pathIsOpen];
  if (v7)
  {
    v2 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
    uint64_t v8 = [v2 containedRep];
    if (!v8)
    {

      return 1;
    }
    unsigned int v3 = (void *)v8;
  }
  uint64_t v9 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  char v10 = [v9 shapeLayout];
  unsigned __int8 v11 = [v10 pathIsLineSegment];

  if (v7)
  {
  }
  if (v11) {
    return 1;
  }
  char v12 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  char v13 = [v12 containedRep];

  if (v13) {
    return 0;
  }
  v15.receiver = self;
  v15.super_class = (Class)CRLWPShapeRepAccessibility;
  return [(CRLShapeRepAccessibility *)&v15 isAccessibilityElement];
}

- (void)crlaxLoadChildrenIntoCollection:(id)a3
{
  id v4 = a3;
  v6.receiver = self;
  v6.super_class = (Class)CRLWPShapeRepAccessibility;
  [(CRLCanvasRepAccessibility *)&v6 crlaxLoadChildrenIntoCollection:v4];
  unint64_t v5 = -1;
  do
    ++v5;
  while (v5 < (unint64_t)[v4 count]);
}

- (BOOL)crlaxIsIgnored
{
  return 1;
}

- (id)crlaxFocusedElement
{
  char v11 = 0;
  unsigned int v3 = [(CRLCanvasRepAccessibility *)self crlaxValueForKey:@"containedRep"];
  id v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v11);
  if (v11) {
    abort();
  }
  objc_super v6 = (void *)v5;

  if (v6)
  {
    id v7 = v6;
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)CRLWPShapeRepAccessibility;
    id v7 = [(CRLCanvasRepAccessibility *)&v10 crlaxFocusedElement];
  }
  uint64_t v8 = v7;

  return v8;
}

- (BOOL)crlaxShouldCreateKnobs
{
  v2 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
  unsigned int v3 = [v2 textRep];

  return v3 == 0;
}

- (BOOL)crlaxNeedsFormatEditOperation
{
  if ([(CRLCanvasRepAccessibility *)self crlaxIsSelected]
    || [(CRLCanvasRepAccessibility *)self crlaxIsSelectedIgnoringLocking])
  {
    unsigned int v3 = [(CRLWPShapeRepAccessibility *)self crlaxTarget];
    if ([v3 isEditingChildRep]) {
      LOBYTE(v4) = 0;
    }
    else {
      unsigned int v4 = ![(CRLCanvasRepAccessibility *)self crlaxIsInDrawingMode];
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)crlaxDescriptionForConnections
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v4 = [(CRLCanvasRepAccessibility *)self accessibilityLabel];
  if ([v4 length]) {
    [v3 addObject:v4];
  }
  uint64_t v5 = [(CRLWPShapeRepAccessibility *)self crlaxContainedRepText];
  if ([v5 length]) {
    [v3 addObject:v5];
  }
  if ([v3 count])
  {
    objc_super v6 = [v3 componentsJoinedByString:@", "];
  }
  else
  {
    objc_super v6 = 0;
  }

  return v6;
}

- (void)crlaxShapeRepWillBeginEditingContainedRep:(id)a3
{
  id v4 = [(CRLCanvasRepAccessibility *)self crlaxInteractiveCanvasController];
  id v3 = [v4 crlaxCanvasViewController];
  [v3 crlaxCancelEyeDropperMode];
}

- (id)accessibilityCustomActions
{
  v6.receiver = self;
  v6.super_class = (Class)CRLWPShapeRepAccessibility;
  v2 = [(CRLCanvasRepAccessibility *)&v6 accessibilityCustomActions];
  id v3 = [v2 mutableCopy];

  id v4 = [v3 copy];

  return v4;
}

@end