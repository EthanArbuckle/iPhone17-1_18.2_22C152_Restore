@interface CRLConnectionLineKnobTrackerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)crlaxShouldAnnounceValueUponEndMovingKnob;
- (void)moveKnobToCanvasPosition:(CGPoint)a3;
@end

@implementation CRLConnectionLineKnobTrackerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLConnectionLineKnobTracker";
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

- (void)moveKnobToCanvasPosition:(CGPoint)a3
{
  double y = a3.y;
  double x = a3.x;
  char v51 = 0;
  v6 = [(CRLConnectionLineKnobTrackerAccessibility *)self crlaxTarget];
  v7 = [v6 rep];
  v8 = [v7 layout];

  v9 = (objc_class *)objc_opt_class();
  uint64_t v10 = __CRLAccessibilityCastAsClass(v9, (uint64_t)v8, 1, &v51);
  if (v51) {
    goto LABEL_42;
  }
  v11 = (void *)v10;

  v12 = [v11 connectedFrom];
  v13 = [v11 connectedTo];
  v50.receiver = self;
  v50.super_class = (Class)CRLConnectionLineKnobTrackerAccessibility;
  -[CRLConnectionLineKnobTrackerAccessibility moveKnobToCanvasPosition:](&v50, "moveKnobToCanvasPosition:", x, y);
  if (v11)
  {
    v14 = [v11 connectedFrom];
    uint64_t v15 = [v11 connectedTo];
    v16 = (void *)v15;
    if (v12) {
      BOOL v17 = 1;
    }
    else {
      BOOL v17 = v14 == 0;
    }
    int v18 = !v17;
    if (v13) {
      BOOL v19 = 1;
    }
    else {
      BOOL v19 = v15 == 0;
    }
    int v20 = !v19;
    if ((!v12 || (v21 = v12, v14)) && (!v13 || (v21 = v13, v15)))
    {
      if ((v18 | v20) != 1)
      {
        v42 = (void *)v15;
        v43 = v13;
        if (v13 == (void *)v15)
        {
          v42 = v14;
          v43 = v12;
          if (v12 == v14)
          {
            v25 = 0;
            id v26 = 0;
            id v27 = 0;
            goto LABEL_35;
          }
        }
        v44 = +[NSBundle mainBundle];
        v25 = [v44 localizedStringForKey:@"Changed connection from %1$@ to %2$@" value:0 table:0];

        id v26 = v43;
        id v27 = v42;
        if (!v25) {
          goto LABEL_35;
        }
LABEL_21:
        if (v26)
        {
          id v49 = v27;
          v46 = v16;
          v28 = [(CRLConnectionLineKnobTrackerAccessibility *)self crlaxTarget];
          v29 = [v28 rep];
          v30 = [v29 interactiveCanvasController];

          char v51 = 0;
          v31 = [v26 info];
          v47 = v30;
          v32 = [v30 repForInfo:v31];

          v33 = objc_opt_class();
          v48 = __CRLAccessibilityCastAsSafeCategory(v33, (uint64_t)v32, 1, &v51);
          if (!v51)
          {

            if (!v49)
            {
              v38 = [v48 crlaxDescriptionForConnections];
              v41 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v38);
              goto LABEL_32;
            }
            v45 = v14;
            char v51 = 0;
            v34 = [v49 info];
            v35 = [v30 repForInfo:v34];

            v36 = objc_opt_class();
            uint64_t v37 = __CRLAccessibilityCastAsSafeCategory(v36, (uint64_t)v35, 1, &v51);
            if (!v51)
            {
              v38 = (void *)v37;

              v39 = [v48 crlaxDescriptionForConnections];
              v40 = [v38 crlaxDescriptionForConnections];
              v41 = +[NSString localizedStringWithFormat:](NSString, "localizedStringWithFormat:", v25, v39, v40);

              v14 = v45;
LABEL_32:

              if ([v41 length]) {
                CRLAccessibilityPostAnnouncementNotification(self, v41);
              }

              v16 = v46;
              id v27 = v49;
              goto LABEL_35;
            }
          }
LABEL_42:
          abort();
        }
LABEL_35:

        goto LABEL_36;
      }
      if (v18) {
        v21 = v14;
      }
      else {
        v21 = (void *)v15;
      }
      v22 = +[NSBundle mainBundle];
      v23 = v22;
      CFStringRef v24 = @"Connected to %@";
    }
    else
    {
      v22 = +[NSBundle mainBundle];
      v23 = v22;
      CFStringRef v24 = @"Disconnected from %@";
    }
    v25 = [v22 localizedStringForKey:v24 value:0 table:0];

    id v26 = v21;
    id v27 = 0;
    if (!v25) {
      goto LABEL_35;
    }
    goto LABEL_21;
  }
LABEL_36:
}

- (BOOL)crlaxShouldAnnounceValueUponEndMovingKnob
{
  return 1;
}

@end