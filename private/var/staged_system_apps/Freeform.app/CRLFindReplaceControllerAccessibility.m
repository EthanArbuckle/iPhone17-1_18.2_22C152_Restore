@interface CRLFindReplaceControllerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CGPoint)crlaxActiveTextFindResultPoint;
- (CRLWPSelectionAccessibility)crlaxActiveTextFindResultSelection;
- (id)crlaxDecoratedStringForAnnouncement:(id)a3 selectionRange:(_NSRange)a4 excerptRange:(_NSRange)a5;
- (id)crlaxPrimaryFindResultSearchReference;
- (void)crlaxDidChangePrimaryFindResultInInteractiveCanvasController:(id)a3 window:(id)a4;
@end

@implementation CRLFindReplaceControllerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLFindReplaceController";
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

- (id)crlaxPrimaryFindResultSearchReference
{
  v2 = [(CRLFindReplaceControllerAccessibility *)self crlaxTarget];
  id v3 = [v2 primaryFindResultSearchReference];

  return v3;
}

- (CGPoint)crlaxActiveTextFindResultPoint
{
  v2 = [(CRLFindReplaceControllerAccessibility *)self crlaxPrimaryFindResultSearchReference];
  [v2 searchReferencePoint];
  double v4 = v3;
  double v6 = v5;

  double v7 = v4;
  double v8 = v6;
  result.y = v8;
  result.x = v7;
  return result;
}

- (CRLWPSelectionAccessibility)crlaxActiveTextFindResultSelection
{
  double v3 = objc_opt_class();
  double v4 = [(CRLFindReplaceControllerAccessibility *)self crlaxPrimaryFindResultSearchReference];
  double v5 = __CRLAccessibilityCastAsSafeCategory(v3, (uint64_t)v4, 0, 0);

  double v6 = [v5 crlaxSelection];

  return (CRLWPSelectionAccessibility *)v6;
}

- (void)crlaxDidChangePrimaryFindResultInInteractiveCanvasController:(id)a3 window:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = +[CRLAccessibility sharedInstance];
  unsigned int v9 = [v8 needsAccessibilityAnnouncements];

  if (v9)
  {
    v10 = [(CRLFindReplaceControllerAccessibility *)self crlaxPrimaryFindResultSearchReference];
    NSClassFromString(@"CRLWPSearchReference");
    if (objc_opt_isKindOfClass())
    {
      char v41 = 0;
      v11 = [v10 crlaxValueForKey:@"selection"];
      v12 = objc_opt_class();
      uint64_t v13 = __CRLAccessibilityCastAsSafeCategory(v12, (uint64_t)v11, 1, &v41);
      if (v41) {
        goto LABEL_22;
      }
      v14 = (void *)v13;

      char v41 = 0;
      v15 = [v10 crlaxValueForKey:@"storage"];
      v16 = objc_opt_class();
      uint64_t v17 = __CRLAccessibilityCastAsSafeCategory(v16, (uint64_t)v15, 1, &v41);
      if (v41) {
        goto LABEL_22;
      }
      id v18 = (id)v17;

      v19.NSUInteger location = (NSUInteger)[v14 crlaxRange];
      if (!v19.length) {
        goto LABEL_19;
      }
      NSUInteger location = v19.location;
      NSUInteger v21 = v19.length--;
      v42.NSUInteger location = v19.location;
      v42.NSUInteger length = v21;
      NSRange v22 = NSUnionRange(v19, v42);
      v43.NSUInteger location = (NSUInteger)[v18 crlaxRange];
      v43.NSUInteger length = v23;
      NSRange v24 = NSIntersectionRange(v22, v43);
      if (v22.location != v24.location || v22.length != v24.length)
      {
LABEL_19:

        goto LABEL_20;
      }
      NSUInteger length = v22.length;
      [v18 crlaxSubstringWithRange:v22.location, v22.length];
      v26 = v25 = v14;

      if (v26)
      {
        id v27 = v26;
        v28 = v27;
        BOOL v29 = location >= v22.location && v21 + location - v22.location <= (unint64_t)[v27 length];
        if (!CRLAccessibilityShouldPerformValidationChecks()
          || v29
          || (int ShouldCrashOnValidationErrorAfterLaunch = CRLAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
              !__CRLAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"Something is wrong with selectionRange or excerptRange.", v31, v32, v33, v34, v35, v22.length)))
        {
          v36 = v28;
          if (v29
            && [(CRLFindReplaceControllerAccessibility *)self crlaxRespondsToSelector:"crlaxDecoratedStringForAnnouncement:selectionRange:excerptRange:" fromExtrasProtocol:&OBJC_PROTOCOL___CRLFindReplaceControllerAccessibilityExtras])
          {
            v28 = -[CRLFindReplaceControllerAccessibility crlaxDecoratedStringForAnnouncement:selectionRange:excerptRange:](self, "crlaxDecoratedStringForAnnouncement:selectionRange:excerptRange:", v28, location, v21, v22.location, length);
          }
          v38[0] = _NSConcreteStackBlock;
          v38[1] = 3221225472;
          v38[2] = sub_10024F3E4;
          v38[3] = &unk_1014CBE78;
          id v39 = v7;
          id v40 = v28;
          id v18 = v28;
          CRLAccessibilityPerformBlockOnMainThreadAfterDelay(v38, 0.5);

          v14 = v36;
          goto LABEL_19;
        }
LABEL_22:
        abort();
      }
    }
LABEL_20:
  }
}

- (id)crlaxDecoratedStringForAnnouncement:(id)a3 selectionRange:(_NSRange)a4 excerptRange:(_NSRange)a5
{
  NSUInteger location = a5.location;
  NSUInteger length = a4.length;
  NSUInteger v7 = a4.location;
  id v8 = a3;
  id v9 = [objc_alloc((Class)NSMutableAttributedString) initWithString:v8];

  v10 = +[NSNumber numberWithBool:1];
  [v9 addAttribute:@"UIAccessibilityTokenLowPitch" value:v10 range:v7 - location, length];

  return v9;
}

@end