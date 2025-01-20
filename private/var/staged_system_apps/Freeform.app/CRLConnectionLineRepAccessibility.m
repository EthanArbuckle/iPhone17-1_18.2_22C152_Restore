@interface CRLConnectionLineRepAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsAParallelConnectionLineOfLayout:(id)a3;
- (BOOL)isAccessibilityElement;
- (id)_crlaxConnectionDescriptionForHead:(BOOL)a3;
- (id)_crlaxConnectionLineLayout;
- (id)_crlaxCustomActionForNavigatingToRepWithLayout:(id)a3 inRotorCategory:(id)a4 disambiguatedDescriptions:(id)a5;
- (id)_crlaxCustomEdgeConnectionFormatStringForHead:(BOOL)a3;
- (id)_crlaxStrokeDescription;
- (id)accessibilityCustomActions;
- (id)accessibilityCustomContent;
- (id)accessibilityUserInputLabels;
- (id)crlaxConnectionDescription;
- (id)crlaxCustomNavigationActionWithName:(id)a3 inCategory:(id)a4 handlerBody:(id)a5;
- (id)crlaxDescriptionForLayout:(id)a3;
- (id)crlaxInboundConnectedReps;
- (id)crlaxLabel;
- (id)crlaxOutboundConnectedReps;
@end

@implementation CRLConnectionLineRepAccessibility

- (BOOL)isAccessibilityElement
{
  return ![(CRLShapeRepAccessibility *)self crlaxIsIgnored];
}

- (id)crlaxCustomNavigationActionWithName:(id)a3 inCategory:(id)a4 handlerBody:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc((Class)UIAccessibilityCustomAction);
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100092A50;
  v14[3] = &unk_1014D1120;
  id v15 = v7;
  id v11 = v7;
  id v12 = [v10 initWithName:v9 actionHandler:v14];

  [v12 setLocalizedActionRotorCategory:v8];

  return v12;
}

+ (id)crlaxTargetClassName
{
  return @"CRLConnectionLineRep";
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

- (id)crlaxLabel
{
  id v3 = [(CRLConnectionLineRepAccessibility *)self crlaxTarget];
  v4 = [v3 shapeInfo];

  v5 = [v4 localizedName];
  char v48 = 0;
  v6 = [v4 pathSource];
  id v7 = (objc_class *)objc_opt_class();
  uint64_t v8 = __CRLAccessibilityCastAsClass(v7, (uint64_t)v6, 1, &v48);
  if (v48) {
    goto LABEL_27;
  }
  id v9 = (void *)v8;

  char v47 = 0;
  id v10 = [(CRLConnectionLineRepAccessibility *)self crlaxTarget];
  id v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = __CRLAccessibilityCastAsClass(v11, (uint64_t)v10, 1, &v47);
  if (v47) {
LABEL_27:
  }
    abort();
  v13 = (void *)v12;

  v14 = 0;
  if (v9 && v13)
  {
    id v15 = [v9 type];
    if (v15 == (id)1)
    {
      v16 = v13;
      v18 = +[NSBundle mainBundle];
      v19 = v18;
      CFStringRef v20 = @"angled";
    }
    else
    {
      if (v15)
      {
        v14 = 0;
        goto LABEL_13;
      }
      v16 = v13;
      unsigned __int8 v17 = [v13 crlaxIsStraightLine];
      v18 = +[NSBundle mainBundle];
      v19 = v18;
      if (v17) {
        CFStringRef v20 = @"straight";
      }
      else {
        CFStringRef v20 = @"curved";
      }
    }
    v14 = [v18 localizedStringForKey:v20 value:0 table:0];

    v13 = v16;
  }
LABEL_13:
  if (![v4 isLine])
  {
    v27 = 0;
    v28 = 0;
    goto LABEL_24;
  }
  v45 = v13;
  v46 = v5;
  v21 = objc_opt_class();
  v22 = [v4 headLineEnd];
  v23 = __CRLAccessibilityCastAsSafeCategory(v21, (uint64_t)v22, 0, 0);

  v24 = objc_opt_class();
  v25 = [v4 tailLineEnd];
  v26 = __CRLAccessibilityCastAsSafeCategory(v24, (uint64_t)v25, 0, 0);

  if (v26 && ([v26 crlaxIsTypeNone] & 1) == 0)
  {
    v29 = +[NSBundle mainBundle];
    v30 = [v29 localizedStringForKey:@"Start: %@" value:0 table:0];
    v31 = [v26 crlaxStyleInfoDescription];
    v27 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v30, v31);

    if (!v23) {
      goto LABEL_21;
    }
  }
  else
  {
    v27 = 0;
    if (!v23) {
      goto LABEL_21;
    }
  }
  if (([v23 crlaxIsTypeNone] & 1) == 0)
  {
    v44 = +[NSBundle mainBundle];
    v32 = [v44 localizedStringForKey:@"End: %@" value:0 table:0];
    v33 = [v23 crlaxStyleInfoDescription];
    v28 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v32, v33);

    goto LABEL_23;
  }
LABEL_21:
  v28 = 0;
LABEL_23:

  v13 = v45;
  v5 = v46;
LABEL_24:
  v34 = [v4 accessibilityDescription];
  v35 = [(CRLConnectionLineRepAccessibility *)self crlaxConnectionDescription];
  v42 = __CRLAccessibilityStringForVariables(1, v5, v36, v37, v38, v39, v40, v41, (uint64_t)v35);

  return v42;
}

- (id)accessibilityUserInputLabels
{
  v2 = [(CRLConnectionLineRepAccessibility *)self crlaxTarget];
  id v3 = [v2 shapeInfo];

  if ([v3 isLine])
  {
    v4 = [v3 crlaxLocalizedName];
    id v7 = v4;
    v5 = +[NSArray arrayWithObjects:&v7 count:1];
  }
  else
  {
    v5 = &__NSArray0__struct;
  }

  return v5;
}

- (id)crlaxInboundConnectedReps
{
  return &__NSArray0__struct;
}

- (id)crlaxOutboundConnectedReps
{
  return &__NSArray0__struct;
}

- (id)accessibilityCustomActions
{
  v51.receiver = self;
  v51.super_class = (Class)CRLConnectionLineRepAccessibility;
  id v3 = [(CRLCanvasRepAccessibility *)&v51 accessibilityCustomActions];
  id v42 = +[NSMutableArray arrayWithArray:v3];

  if (+[CRLAccessibility isVoiceOverEnabled])
  {
    v4 = [(CRLConnectionLineRepAccessibility *)self _crlaxConnectionLineLayout];
    v5 = [v4 connectedTo];
    v6 = [v4 connectedFrom];
    id v7 = +[NSBundle mainBundle];
    uint64_t v8 = [v7 localizedStringForKey:@"Connected Items" value:0 table:0];

    id v9 = +[NSMutableArray array];
    [v9 crl_addNonNilObject:v5];
    [v9 crl_addNonNilObject:v6];
    uint64_t v39 = v9;
    uint64_t v38 = +[NSSet setWithArray:v9];
    uint64_t v10 = +[CRLCanvasRepAccessibility crlaxDisambiguatedConnectionDescriptionsForSet:](CRLCanvasRepAccessibility, "crlaxDisambiguatedConnectionDescriptionsForSet:");
    id v11 = [(CRLConnectionLineRepAccessibility *)self _crlaxCustomActionForNavigatingToRepWithLayout:v5 inRotorCategory:v8 disambiguatedDescriptions:v10];
    [v42 crl_addNonNilObject:v11];

    uint64_t v40 = (void *)v8;
    uint64_t v37 = (void *)v10;
    uint64_t v12 = [(CRLConnectionLineRepAccessibility *)self _crlaxCustomActionForNavigatingToRepWithLayout:v6 inRotorCategory:v8 disambiguatedDescriptions:v10];
    [v42 crl_addNonNilObject:v12];

    v13 = +[NSBundle mainBundle];
    v14 = [v13 localizedStringForKey:@"Parallel Connections" value:0 table:0];

    if (v5 && v6)
    {
      v34 = v6;
      uint64_t v36 = v4;
      uint64_t v41 = +[NSMutableArray array];
      long long v47 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      v35 = v5;
      id v15 = [v5 connectedLayouts];
      id v16 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
      if (v16)
      {
        id v17 = v16;
        uint64_t v18 = *(void *)v48;
        do
        {
          for (i = 0; i != v17; i = (char *)i + 1)
          {
            if (*(void *)v48 != v18) {
              objc_enumerationMutation(v15);
            }
            CFStringRef v20 = *(void **)(*((void *)&v47 + 1) + 8 * i);
            v21 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
            uint64_t v22 = [v21 crlaxTarget];
            if (v20 == (void *)v22)
            {
            }
            else
            {
              v23 = (void *)v22;
              unsigned int v24 = [(CRLConnectionLineRepAccessibility *)self crlaxIsAParallelConnectionLineOfLayout:v20];

              if (v24) {
                [v41 addObject:v20];
              }
            }
          }
          id v17 = [v15 countByEnumeratingWithState:&v47 objects:v53 count:16];
        }
        while (v17);
      }

      v25 = +[NSSet setWithArray:v41];
      v26 = +[CRLCanvasRepAccessibility crlaxDisambiguatedConnectionDescriptionsForSet:v25];

      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v27 = v41;
      id v28 = [v27 countByEnumeratingWithState:&v43 objects:v52 count:16];
      if (v28)
      {
        id v29 = v28;
        uint64_t v30 = *(void *)v44;
        do
        {
          for (j = 0; j != v29; j = (char *)j + 1)
          {
            if (*(void *)v44 != v30) {
              objc_enumerationMutation(v27);
            }
            v32 = [(CRLConnectionLineRepAccessibility *)self _crlaxCustomActionForNavigatingToRepWithLayout:*(void *)(*((void *)&v43 + 1) + 8 * (void)j) inRotorCategory:v14 disambiguatedDescriptions:v26];
            [v42 crl_addNonNilObject:v32];
          }
          id v29 = [v27 countByEnumeratingWithState:&v43 objects:v52 count:16];
        }
        while (v29);
      }

      v5 = v35;
      v4 = v36;
      v6 = v34;
    }
  }

  return v42;
}

- (id)accessibilityCustomContent
{
  v10.receiver = self;
  v10.super_class = (Class)CRLConnectionLineRepAccessibility;
  id v3 = [(CRLCanvasRepAccessibility *)&v10 accessibilityCustomContent];
  id v4 = [v3 mutableCopy];

  v5 = [(CRLConnectionLineRepAccessibility *)self _crlaxStrokeDescription];
  if ([v5 length])
  {
    v6 = +[NSBundle mainBundle];
    id v7 = [v6 localizedStringForKey:@"Stroke" value:0 table:0];
    uint64_t v8 = +[AXCustomContent customContentWithLabel:v7 value:v5];
    [v4 addObject:v8];
  }

  return v4;
}

- (id)crlaxDescriptionForLayout:(id)a3
{
  id v4 = a3;
  v5 = [(CRLConnectionLineRepAccessibility *)self crlaxTarget];
  v6 = [v5 interactiveCanvasController];

  char v13 = 0;
  id v7 = [v6 repForLayout:v4];
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = __CRLAccessibilityCastAsSafeCategory(v8, (uint64_t)v7, 1, &v13);
  if (v13) {
    abort();
  }
  objc_super v10 = (void *)v9;

  id v11 = [v10 crlaxDescriptionForConnections];

  return v11;
}

- (BOOL)crlaxIsAParallelConnectionLineOfLayout:(id)a3
{
  id v4 = a3;
  v5 = [(CRLConnectionLineRepAccessibility *)self _crlaxConnectionLineLayout];
  v6 = [v5 connectedTo];
  uint64_t v7 = [v5 connectedFrom];
  uint64_t v8 = (void *)v7;
  BOOL v9 = 0;
  if (v6 && v7)
  {
    objc_super v10 = [v4 connectedTo];
    id v11 = [v5 connectedTo];
    if (v10 == v11)
    {
      char v13 = [v4 connectedFrom];
      v14 = [v5 connectedFrom];
      BOOL v12 = v13 == v14;
    }
    else
    {
      BOOL v12 = 0;
    }

    id v15 = [v4 connectedFrom];
    id v16 = [v5 connectedTo];
    if (v15 == v16)
    {
      uint64_t v18 = [v4 connectedTo];
      v19 = [v5 connectedFrom];
      BOOL v17 = v18 == v19;
    }
    else
    {
      BOOL v17 = 0;
    }

    BOOL v9 = v12 || v17;
  }

  return v9;
}

- (id)crlaxConnectionDescription
{
  id v3 = [(CRLConnectionLineRepAccessibility *)self _crlaxConnectionDescriptionForHead:0];
  id v4 = [(CRLConnectionLineRepAccessibility *)self _crlaxConnectionDescriptionForHead:1];
  if ([v3 length] && objc_msgSend(v4, "length"))
  {
    v5 = +[NSBundle mainBundle];
    v6 = [v5 localizedStringForKey:@"Connected from %1$@ to %2$@" value:0 table:0];

    id v11 = v4;
LABEL_6:
    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v3, v11);
    uint64_t v8 = LABEL_7:;

    goto LABEL_8;
  }
  if ([v3 length])
  {
    uint64_t v7 = +[NSBundle mainBundle];
    v6 = [v7 localizedStringForKey:@"Connected from %@" value:0 table:0];

    goto LABEL_6;
  }
  if ([v4 length])
  {
    objc_super v10 = +[NSBundle mainBundle];
    v6 = [v10 localizedStringForKey:@"Connected to %@" value:0 table:0];

    +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, v4, v11);
    goto LABEL_7;
  }
  uint64_t v8 = 0;
LABEL_8:

  return v8;
}

- (id)_crlaxConnectionLineLayout
{
  char v8 = 0;
  v2 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
  id v3 = [v2 crlaxTarget];

  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)_crlaxStrokeDescription
{
  char v15 = 0;
  v2 = [(CRLCanvasRepAccessibility *)self crlaxLayout];
  id v3 = [v2 crlaxTarget];

  id v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v15);
  if (v15) {
    goto LABEL_6;
  }
  v6 = (void *)v5;

  char v14 = 0;
  uint64_t v7 = [v6 styledInfo];
  char v8 = [v7 stroke];

  BOOL v9 = objc_opt_class();
  uint64_t v10 = __CRLAccessibilityCastAsSafeCategory(v9, (uint64_t)v8, 1, &v14);
  if (v14) {
LABEL_6:
  }
    abort();
  id v11 = (void *)v10;

  BOOL v12 = [v11 crlaxStrokeFullDescription];

  return v12;
}

- (id)_crlaxConnectionDescriptionForHead:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v5 = [(CRLConnectionLineRepAccessibility *)self _crlaxConnectionLineLayout];
  v6 = v5;
  if (v3)
  {
    uint64_t v7 = [v5 connectedTo];
    id v8 = [v6 headMagnetType];
  }
  else
  {
    uint64_t v7 = [v5 connectedFrom];
    id v8 = [v6 tailMagnetType];
  }
  id v9 = v8;
  uint64_t v10 = [(CRLConnectionLineRepAccessibility *)self crlaxDescriptionForLayout:v7];
  if ([v10 length])
  {
    switch((unint64_t)v9)
    {
      case 0uLL:
      case 7uLL:
        id v11 = v10;
        goto LABEL_15;
      case 1uLL:
        BOOL v12 = +[NSBundle mainBundle];
        char v13 = v12;
        CFStringRef v14 = @"center of %@";
        goto LABEL_13;
      case 2uLL:
        BOOL v12 = +[NSBundle mainBundle];
        char v13 = v12;
        CFStringRef v14 = @"top of %@";
        goto LABEL_13;
      case 3uLL:
        BOOL v12 = +[NSBundle mainBundle];
        char v13 = v12;
        CFStringRef v14 = @"right of %@";
        goto LABEL_13;
      case 4uLL:
        BOOL v12 = +[NSBundle mainBundle];
        char v13 = v12;
        CFStringRef v14 = @"bottom of %@";
        goto LABEL_13;
      case 5uLL:
        BOOL v12 = +[NSBundle mainBundle];
        char v13 = v12;
        CFStringRef v14 = @"left of %@";
LABEL_13:
        char v15 = [v12 localizedStringForKey:v14 value:0 table:0];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v15, v10);
        id v11 = (id)objc_claimAutoreleasedReturnValue();

        break;
      case 6uLL:
        char v13 = [(CRLConnectionLineRepAccessibility *)self _crlaxCustomEdgeConnectionFormatStringForHead:v3];
        +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v13, v10);
        id v11 = (id)objc_claimAutoreleasedReturnValue();
        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    id v11 = 0;
  }
LABEL_15:

  return v11;
}

- (id)_crlaxCustomEdgeConnectionFormatStringForHead:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CRLConnectionLineRepAccessibility *)self _crlaxConnectionLineLayout];
  uint64_t v5 = v4;
  if (v4)
  {
    if (v3) {
      [v4 headMagnetNormalizedPosition];
    }
    else {
      [v4 tailMagnetNormalizedPosition];
    }
    switch(+[CRLCanvasKnobAccessibility crlaxEdgePositionTypeFromNormalizedPosition:](CRLCanvasKnobAccessibility, "crlaxEdgePositionTypeFromNormalizedPosition:"))
    {
      case 0:
        v6 = @"edge of %@";
        break;
      case 1:
        uint64_t v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"top-left corner of %@";
        goto LABEL_16;
      case 2:
        uint64_t v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"top-right corner of %@";
        goto LABEL_16;
      case 3:
        uint64_t v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"bottom-left corner of %@";
        goto LABEL_16;
      case 4:
        uint64_t v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"bottom-right corner of %@";
        goto LABEL_16;
      case 5:
        uint64_t v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"top edge of %@";
        goto LABEL_16;
      case 6:
        uint64_t v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"bottom edge of %@";
        goto LABEL_16;
      case 7:
        uint64_t v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"left edge of %@";
        goto LABEL_16;
      case 8:
        uint64_t v7 = +[NSBundle mainBundle];
        id v8 = v7;
        CFStringRef v9 = @"right edge of %@";
LABEL_16:
        v6 = [v7 localizedStringForKey:v9 value:0 table:0];

        break;
      default:
        goto LABEL_7;
    }
  }
  else
  {
LABEL_7:
    v6 = 0;
  }

  return v6;
}

- (id)_crlaxCustomActionForNavigatingToRepWithLayout:(id)a3 inRotorCategory:(id)a4 disambiguatedDescriptions:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (v8 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    id v11 = +[NSBundle mainBundle];
    BOOL v12 = [v11 localizedStringForKey:@"Go to %@" value:0 table:0];

    char v13 = +[CRLCanvasRepAccessibility crlaxBoardItemIDForLayout:v8];
    if (v13)
    {
      CFStringRef v14 = [v10 objectForKeyedSubscript:v13];
      char v15 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v14);
      v19[0] = _NSConcreteStackBlock;
      v19[1] = 3221225472;
      v19[2] = sub_100501DD0;
      v19[3] = &unk_1014EA900;
      id v20 = v8;
      v21 = self;
      id v16 = objc_retainBlock(v19);
      BOOL v17 = [(CRLConnectionLineRepAccessibility *)self crlaxCustomNavigationActionWithName:v15 inCategory:v9 handlerBody:v16];
    }
    else
    {
      BOOL v17 = 0;
    }
  }
  else
  {
    BOOL v17 = 0;
  }

  return v17;
}

@end