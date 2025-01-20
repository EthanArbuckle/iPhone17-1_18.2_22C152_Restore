@interface CRLCanvasLayoutAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxIsDraggable;
- (BOOL)crlaxIsSelectable;
- (CRLCanvasLayoutGeometryAccessibility)crlaxInspectorGeometry;
- (CRLCanvasRepAccessibility)crlaxRepForLayout;
- (CRLWPStorageAccessibility)crlaxStorage;
- (NSString)crlaxDescriptionForConnections;
- (id)_crlaxCanvas;
- (id)_dragAnnouncementStringForDiff:(CGPoint)a3;
- (id)_longDragAnnouncementStringForDiff:(CGPoint)a3;
- (id)crlaxCommandForAccessibilityIncrementDecrement:(BOOL)a3 forKnobTag:(unint64_t)a4 inSmartPathSource:(id)a5;
- (int64_t)crlaxDragAnnouncementType;
- (void)dragBy:(CGPoint)a3;
- (void)invalidate;
@end

@implementation CRLCanvasLayoutAccessibility

- (void)dragBy:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  v11.receiver = self;
  v11.super_class = (Class)CRLCanvasLayoutAccessibility;
  -[CRLCanvasLayoutAccessibility dragBy:](&v11, "dragBy:");
  +[CRLCanvasRepAccessibility crlaxCurrentRepDragOffset];
  BOOL v9 = vabdd_f64(v6, x) <= 2.0;
  double v8 = vabdd_f64(v7, y);
  BOOL v9 = v9 && v8 <= 2.0;
  if (!v9)
  {
    v10 = -[CRLCanvasLayoutAccessibility _dragAnnouncementStringForDiff:](self, "_dragAnnouncementStringForDiff:", x, y);
    UIAccessibilityPostNotification(UIAccessibilityAnnouncementNotification, v10);
    UIAccessibilityPostNotification(CRLAccessibilityElementMovedNotification, 0);
    +[CRLCanvasRepAccessibility crlaxSetCurrentRepDragOffset:](CRLCanvasRepAccessibility, "crlaxSetCurrentRepDragOffset:", x, y);
  }
}

- (int64_t)crlaxDragAnnouncementType
{
  return 1;
}

- (id)_dragAnnouncementStringForDiff:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  if ((id)[(CRLCanvasLayoutAccessibility *)self crlaxDragAnnouncementType] == (id)1)
  {
    double v6 = -[CRLCanvasLayoutAccessibility _longDragAnnouncementStringForDiff:](self, "_longDragAnnouncementStringForDiff:", x, y);
  }
  else
  {
    double v6 = 0;
  }

  return v6;
}

- (id)_longDragAnnouncementStringForDiff:(CGPoint)a3
{
  double y = a3.y;
  double v4 = fabs(a3.x);
  if (a3.x == 0.0)
  {
    double v7 = 0;
  }
  else
  {
    if (a3.x > 0.0) {
      v5 = @"moving.object.right";
    }
    else {
      v5 = @"moving.object.left";
    }
    double v6 = CRLAccessibilityStringsDictKey(v5);
    double v7 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v6, *(void *)&v4);
  }
  if (y == 0.0)
  {
    v10 = 0;
    double v8 = fabs(y);
  }
  else
  {
    double v8 = fabs(y);
    if (y > 0.0) {
      BOOL v9 = @"moving.object.down";
    }
    else {
      BOOL v9 = @"moving.object.up";
    }
    objc_super v11 = CRLAccessibilityStringsDictKey(v9);
    v10 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v11, *(void *)&v8);
  }
  if (v4 <= v8) {
    v12 = v10;
  }
  else {
    v12 = v7;
  }
  if (v4 <= v8) {
    v13 = v7;
  }
  else {
    v13 = v10;
  }
  id v14 = v10;
  id v15 = v7;
  v22 = __CRLAccessibilityStringForVariables(1, v12, v16, v17, v18, v19, v20, v21, (uint64_t)v13);

  return v22;
}

+ (id)crlaxTargetClassName
{
  return @"CRLCanvasLayout";
}

+ (Class)crlaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (id)crlaxCastFrom:(id)a3
{
  id v3 = a3;
  double v4 = objc_opt_class();
  v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 0, 0);

  return v5;
}

- (CRLCanvasLayoutGeometryAccessibility)crlaxInspectorGeometry
{
  char v8 = 0;
  v2 = [(CRLCanvasLayoutAccessibility *)self crlaxTarget];
  id v3 = [v2 inspectorGeometry];

  double v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  double v6 = (void *)v5;

  return (CRLCanvasLayoutGeometryAccessibility *)v6;
}

- (CRLWPStorageAccessibility)crlaxStorage
{
  return 0;
}

- (BOOL)crlaxIsSelectable
{
  v2 = [(CRLCanvasLayoutAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isSelectable];

  return v3;
}

- (BOOL)crlaxIsDraggable
{
  v2 = [(CRLCanvasLayoutAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 isDraggable];

  return v3;
}

- (CRLCanvasRepAccessibility)crlaxRepForLayout
{
  unsigned __int8 v3 = [(CRLCanvasLayoutAccessibility *)self _crlaxCanvas];
  double v4 = objc_opt_class();
  uint64_t v5 = [v3 crlaxInteractiveCanvasController];
  double v6 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v5, 0, 0);

  double v7 = [v6 crlaxRepForLayout:self];

  return (CRLCanvasRepAccessibility *)v7;
}

- (NSString)crlaxDescriptionForConnections
{
  unsigned __int8 v3 = [(CRLCanvasLayoutAccessibility *)self crlaxRepForLayout];
  double v4 = [v3 crlaxDescriptionForConnections];

  if (![v4 length])
  {
    char v15 = 0;
    uint64_t v5 = [(CRLCanvasLayoutAccessibility *)self crlaxTarget];
    double v6 = [v5 info];

    double v7 = objc_opt_class();
    uint64_t v8 = __CRLAccessibilityCastAsSafeCategory(v7, (uint64_t)v6, 1, &v15);
    if (v15) {
      abort();
    }
    BOOL v9 = (void *)v8;

    v10 = [v9 crlaxTypeDescription];

    objc_super v11 = +[NSBundle mainBundle];
    v12 = [v11 localizedStringForKey:@"Off-screen %@" value:0 table:0];

    uint64_t v13 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v12, v10);

    double v4 = (void *)v13;
  }

  return (NSString *)v4;
}

- (void)invalidate
{
  v11.receiver = self;
  v11.super_class = (Class)CRLCanvasLayoutAccessibility;
  [(CRLCanvasLayoutAccessibility *)&v11 invalidate];
  unsigned __int8 v3 = [(CRLCanvasLayoutAccessibility *)self crlaxStorage];
  if (v3)
  {
    double v4 = [(CRLCanvasLayoutAccessibility *)self _crlaxCanvas];
    uint64_t v5 = objc_opt_class();
    double v6 = [v4 crlaxInteractiveCanvasController];
    double v7 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v6, 0, 0);

    if (v7)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1004816DC;
      v8[3] = &unk_1014CBE78;
      id v9 = v3;
      id v10 = v7;
      if (__CRLAccessibilityPerformSafeBlock((uint64_t)v8)) {
        abort();
      }
    }
  }
}

- (id)crlaxCommandForAccessibilityIncrementDecrement:(BOOL)a3 forKnobTag:(unint64_t)a4 inSmartPathSource:(id)a5
{
  BOOL v6 = a3;
  id v8 = a5;
  char v84 = 0;
  id v9 = [(CRLCanvasLayoutAccessibility *)self crlaxTarget];
  id v10 = [v9 info];

  objc_super v11 = (objc_class *)objc_opt_class();
  uint64_t v12 = __CRLAccessibilityCastAsClass(v11, (uint64_t)v10, 1, &v84);
  if (v84) {
    goto LABEL_93;
  }
  uint64_t v13 = (void *)v12;

  char v83 = 0;
  id v14 = [(CRLCanvasLayoutAccessibility *)self crlaxTarget];
  char v15 = [v14 info];

  uint64_t v16 = (objc_class *)objc_opt_class();
  uint64_t v17 = __CRLAccessibilityCastAsClass(v16, (uint64_t)v15, 1, &v83);
  if (v83) {
    goto LABEL_93;
  }
  uint64_t v18 = (void *)v17;

  if (objc_opt_respondsToSelector())
  {
    uint64_t v19 = [(CRLCanvasLayoutAccessibility *)self crlaxTarget];
    uint64_t v20 = [v19 maskLayout];

    uint64_t v21 = [v20 maskInfo];
    char v82 = 0;
    v22 = [v21 pathSource];
    v23 = (objc_class *)objc_opt_class();
    uint64_t v24 = __CRLAccessibilityCastAsClassAndProtocol(v23, (Protocol *)&OBJC_PROTOCOL___CRLSmartPathSource, v22, 1, &v82);
    if (v82) {
      goto LABEL_93;
    }
    v25 = (void *)v24;

    if (!v18 || !v21)
    {

      if (!v13) {
        goto LABEL_21;
      }
      goto LABEL_12;
    }
    unsigned int v26 = [v25 crlaxIsAdjustableForKnobTag:a4];

    if (v26)
    {
      if (v20)
      {
        int v27 = 1;
        goto LABEL_13;
      }
LABEL_21:
      id v36 = 0;
      goto LABEL_75;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }
  if (!v13) {
    goto LABEL_21;
  }
LABEL_12:
  int v27 = 0;
LABEL_13:
  if ([v8 crlaxIsAdjustableForKnobTag:a4])
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v81 = 0;
      id v28 = v8;
      v29 = (objc_class *)objc_opt_class();
      uint64_t v30 = __CRLAccessibilityCastAsClass(v29, (uint64_t)v28, 1, &v81);
      if (!v81)
      {
        v31 = (void *)v30;

        if (a4 == 14)
        {
          if (v6)
          {
            [v31 maxTailSize];
            double v53 = v52;
            [v31 tailSize];
            double v55 = v54 + 1.0;
            if (v53 < v55) {
              double v55 = v53;
            }
          }
          else
          {
            [v31 minTailSize];
            double v65 = v64;
            [v31 tailSize];
            double v55 = v66 + -1.0;
            if (v65 >= v55) {
              double v55 = v65;
            }
          }
          if (v27) {
            +[CRLPathSourceCommandHelper commandForSettingCalloutTailSize:v28 withPathSource:v18 imageItem:v20 maskLayout:v55];
          }
          else {
            +[CRLPathSourceCommandHelper commandForSettingCalloutTailSize:v28 withPathSource:v13 shapeItem:v55];
          }
          goto LABEL_52;
        }
        if (a4 == 13)
        {
          if (v6)
          {
            [v31 maxCornerRadius];
            double v33 = v32;
            [v31 cornerRadius];
            double v35 = v34 + 1.0;
          }
          else
          {
            [v31 minCornerRadius];
            double v33 = v56;
            [v31 cornerRadius];
            double v58 = floor(v57 + -1.0);
            if (v33 < v58) {
              double v33 = v58;
            }
            [v31 maxCornerRadius];
            double v35 = floor(v59 + -1.0);
          }
          if (v33 < v35) {
            double v35 = v33;
          }
          if (v27) {
            +[CRLPathSourceCommandHelper commandForSettingCalloutCornerRadius:v28 withPathSource:v18 imageItem:v20 maskLayout:v35];
          }
          else {
            +[CRLPathSourceCommandHelper commandForSettingCalloutCornerRadius:v28 withPathSource:v13 shapeItem:v35];
          }
          uint64_t v60 = LABEL_52:;
LABEL_72:
          v51 = (void *)v60;
          goto LABEL_73;
        }
        goto LABEL_40;
      }
      goto LABEL_93;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v80 = 0;
      id v37 = v8;
      v38 = (objc_class *)objc_opt_class();
      uint64_t v39 = __CRLAccessibilityCastAsClass(v38, (uint64_t)v37, 1, &v80);
      if (!v80)
      {
        v31 = (void *)v39;

        id v40 = [v31 type];
        if (v40 == (id)1)
        {
          if (v6)
          {
            unint64_t v61 = +[CRLScalarPathSource crlaxMaximumAllowedPolygonPointsDuringAdjustment];
            [v31 scalar];
            double v63 = v62 + 1.0;
            if (v63 > (double)v61) {
              double v63 = (double)v61;
            }
          }
          else
          {
            [v31 scalar];
            double v63 = fmax(v68 + -1.0, 3.0);
          }
          if (v27) {
            +[CRLPathSourceCommandHelper commandForSettingNumberOfSides:v37 withPathSource:v18 imageItem:v20 maskLayout:v63];
          }
          else {
            +[CRLPathSourceCommandHelper commandForSettingNumberOfSides:v37 withPathSource:v13 shapeItem:v63];
          }
        }
        else
        {
          if (v40) {
            goto LABEL_40;
          }
          if (v6)
          {
            [v31 maxCornerRadius];
            double v42 = v41;
            [v31 scalar];
            double v44 = v43 + 1.0;
            if (v42 < v44) {
              double v44 = v42;
            }
          }
          else
          {
            [v31 scalar];
            double v44 = fmax(v67 + -1.0, 0.0);
          }
          if (v27) {
            +[CRLPathSourceCommandHelper commandForSettingCornerRadius:v37 withPathSource:v18 imageItem:v20 maskLayout:v44];
          }
          else {
            +[CRLPathSourceCommandHelper commandForSettingCornerRadius:v37 withPathSource:v13 shapeItem:v44];
          }
        uint64_t v60 = };
        goto LABEL_72;
      }
      goto LABEL_93;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      char v79 = 0;
      id v45 = v8;
      v46 = (objc_class *)objc_opt_class();
      uint64_t v47 = __CRLAccessibilityCastAsClass(v46, (uint64_t)v45, 1, &v79);
      if (!v79)
      {
        v31 = (void *)v47;

        if ([v31 type] == (id)100)
        {
          if (a4 == 13)
          {
            if (v6)
            {
              [v31 maxStarRadius];
              double v71 = v70;
              [v31 starRadius];
              double v73 = v72 + 0.05;
              if (v71 < v73) {
                double v73 = v71;
              }
            }
            else
            {
              [v31 minStarRadius];
              double v77 = v76;
              [v31 starRadius];
              double v73 = v78 + -0.05;
              if (v77 >= v73) {
                double v73 = v77;
              }
            }
            if (v27) {
              +[CRLPathSourceCommandHelper commandForSettingStarRadius:v45 withPathSource:v18 imageItem:v20 maskLayout:v73];
            }
            else {
              +[CRLPathSourceCommandHelper commandForSettingStarRadius:v45 withPathSource:v13 shapeItem:v73];
            }
          }
          else
          {
            if (a4 != 12) {
              goto LABEL_40;
            }
            if (v6)
            {
              v48 = (char *)[v31 maxStarPoints];
              v49 = (char *)[v31 starPoints];
              if (v48 >= v49 + 1) {
                v50 = v49 + 1;
              }
              else {
                v50 = v48;
              }
            }
            else
            {
              v74 = (char *)[v31 minStarPoints];
              v50 = (char *)[v31 starPoints] - 1;
              if (v74 > v50) {
                v50 = v74;
              }
            }
            double v75 = (double)(unint64_t)v50;
            if (v27) {
              +[CRLPathSourceCommandHelper commandForSettingStarPoints:v45 withPathSource:v18 imageItem:v20 maskLayout:v75];
            }
            else {
              +[CRLPathSourceCommandHelper commandForSettingStarPoints:v45 withPathSource:v13 shapeItem:v75];
            }
          uint64_t v60 = };
          goto LABEL_72;
        }
LABEL_40:
        v51 = 0;
LABEL_73:

        goto LABEL_74;
      }
LABEL_93:
      abort();
    }
  }
  v51 = 0;
LABEL_74:
  id v36 = v51;
LABEL_75:

  return v36;
}

- (id)_crlaxCanvas
{
  char v9 = 0;
  v2 = [(CRLCanvasLayoutAccessibility *)self crlaxTarget];
  unsigned __int8 v3 = [v2 layoutController];
  double v4 = [v3 canvas];

  uint64_t v5 = objc_opt_class();
  uint64_t v6 = __CRLAccessibilityCastAsSafeCategory(v5, (uint64_t)v4, 1, &v9);
  if (v9) {
    abort();
  }
  double v7 = (void *)v6;

  return v7;
}

@end