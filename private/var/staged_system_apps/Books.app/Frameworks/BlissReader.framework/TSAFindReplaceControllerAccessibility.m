@interface TSAFindReplaceControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (TSWPSelectionAccessibility)tsaxActiveTextFindResultSelection;
- (id)tsaxActiveFindResult;
- (id)tsaxDecoratedStringForAnnouncement:(id)a3 selectionRange:(_NSRange)a4 excerptRange:(_NSRange)a5;
- (void)tsaxDidChangeActiveFindResultInInteractiveCanvasController:(id)a3 window:(id)a4;
@end

@implementation TSAFindReplaceControllerAccessibility

- (id)tsaxDecoratedStringForAnnouncement:(id)a3 selectionRange:(_NSRange)a4 excerptRange:(_NSRange)a5
{
  NSUInteger location = a5.location;
  NSUInteger length = a4.length;
  NSUInteger v7 = a4.location;
  id v8 = [objc_alloc((Class)NSMutableAttributedString) initWithString:a3];
  [v8 addAttribute:@"UIAccessibilityTokenLowPitch" value:[NSNumber numberWithBool:1] range:v7 - location, length];

  return v8;
}

+ (id)tsaxTargetClassName
{
  return @"TSAFindReplaceController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxActiveFindResult
{
  return [(TSAFindReplaceControllerAccessibility *)self tsaxValueForKey:@"activeFindResult"];
}

- (TSWPSelectionAccessibility)tsaxActiveTextFindResultSelection
{
  id v2 = [(TSAFindReplaceControllerAccessibility *)self tsaxActiveFindResult];
  NSClassFromString(@"TSWPSearchReference");
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    id v2 = 0;
  }
  char v5 = 0;
  v3 = objc_opt_class();
  result = (TSWPSelectionAccessibility *)__TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[v2 tsaxValueForKey:@"selection"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)tsaxDidChangeActiveFindResultInInteractiveCanvasController:(id)a3 window:(id)a4
{
  if ([+[TSAccessibility sharedInstance] needsAccessibilityAnnouncements])
  {
    id v7 = [(TSAFindReplaceControllerAccessibility *)self tsaxActiveFindResult];
    NSClassFromString(@"TSWPSearchReference");
    if (objc_opt_isKindOfClass())
    {
      LOBYTE(v53) = 0;
      id v8 = objc_opt_class();
      Class v9 = __TSAccessibilityCastAsSafeCategory(v8, (uint64_t)[v7 tsaxValueForKey:@"selection"], 1, &v53);
      if ((_BYTE)v53) {
        goto LABEL_50;
      }
      Class v10 = v9;
      LOBYTE(v53) = 0;
      v11 = objc_opt_class();
      Class v12 = __TSAccessibilityCastAsSafeCategory(v11, (uint64_t)[v7 tsaxValueForKey:@"storage"], 1, &v53);
      if ((_BYTE)v53) {
        goto LABEL_50;
      }
      Class v13 = v12;
      v14 = (char *)[(objc_class *)v10 tsaxRange];
      if (v15)
      {
        v16 = v14;
        NSUInteger v17 = v15;
        uint64_t v63 = 0;
        v64 = &v63;
        uint64_t v65 = 0x2020000000;
        uint64_t v66 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v59 = 0;
        v60 = &v59;
        uint64_t v61 = 0x2020000000;
        uint64_t v62 = 0x7FFFFFFFFFFFFFFFLL;
        uint64_t v53 = 0;
        v54 = &v53;
        uint64_t v55 = 0x3052000000;
        v56 = sub_26F298;
        v57 = sub_26F2A8;
        uint64_t v58 = 0;
        v52[0] = _NSConcreteStackBlock;
        v52[1] = 3221225472;
        v52[2] = sub_26F2B4;
        v52[3] = &unk_46BF50;
        v52[4] = v13;
        v52[5] = a3;
        v52[6] = &v53;
        v52[7] = &v63;
        v52[9] = v14;
        v52[10] = v15;
        v52[8] = &v59;
        if (__TSAccessibilityPerformSafeBlock((uint64_t)v52)) {
          abort();
        }

        v18 = v64;
        v19.unint64_t location = v64[3];
        if (v19.location == 0x7FFFFFFFFFFFFFFFLL)
        {
          v64[3] = (uint64_t)v16;
          v19.unint64_t location = (NSUInteger)v16;
        }
        uint64_t v20 = v60[3];
        if (v20 == 0x7FFFFFFFFFFFFFFFLL)
        {
          uint64_t v20 = (uint64_t)&v16[v17 - 1];
          v60[3] = v20;
          v19.unint64_t location = v18[3];
        }
        v19.NSUInteger length = v20 - v19.location;
        v67.unint64_t location = (NSUInteger)v16;
        v67.NSUInteger length = v17;
        NSRange v21 = NSUnionRange(v19, v67);
        v68.unint64_t location = (NSUInteger)[(objc_class *)v13 tsaxRange];
        v68.NSUInteger length = v22;
        NSRange v23 = NSIntersectionRange(v21, v68);
        NSUInteger length = 0;
        unint64_t location = 0x7FFFFFFFFFFFFFFFLL;
        id v26 = 0;
        if (v21.location == v23.location && v21.length == v23.length)
        {
          id v26 = -[objc_class tsaxSubstringWithRange:](v13, "tsaxSubstringWithRange:", v21.location, v21.length);
          NSUInteger length = v21.length;
          unint64_t location = v21.location;
        }
        _Block_object_dispose(&v53, 8);
        _Block_object_dispose(&v59, 8);
        _Block_object_dispose(&v63, 8);
        if (v26) {
          goto LABEL_15;
        }
      }
    }
    else
    {
      NSClassFromString(@"TSTSearchReference");
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        NSClassFromString(@"TSCHSearchReference");
        if ((objc_opt_isKindOfClass() & 1) == 0) {
          return;
        }
        v42 = v51;
        v51[0] = _NSConcreteStackBlock;
        v51[1] = 3221225472;
        v51[2] = sub_26F380;
        v51[3] = &unk_456DE0;
        v51[4] = a4;
        goto LABEL_48;
      }
      v16 = (char *)[v7 tsaxRangeValueForKey:@"range"];
      NSUInteger v17 = v28;
      LOBYTE(v53) = 0;
      v29 = (objc_class *)objc_opt_class();
      objc_msgSend(objc_msgSend(v7, "tsaxValueForKey:", @"tableInfo"), "tsaxValueForKey:", @"tableModel");
      [v7 cellID];
      uint64_t v30 = TSTTableStringForCellAtCellID();
      v31 = (void *)__TSAccessibilityCastAsClass(v29, v30, 1, &v53);
      if ((_BYTE)v53) {
LABEL_50:
      }
        abort();
      v32 = v31;
      id v33 = [v31 length];
      if (v16 != (char *)0x7FFFFFFFFFFFFFFFLL)
      {
        if (v17)
        {
          if (v32)
          {
            unint64_t v34 = (unint64_t)v33;
            if (v33 != (id)0x7FFFFFFFFFFFFFFFLL)
            {
              unint64_t location = (unint64_t)(v16 - 60) & ~((uint64_t)(v16 - 60) >> 63);
              if ((uint64_t)(v16 - 60) >= 0) {
                unint64_t v35 = (unint64_t)&v16[v17 + 60];
              }
              else {
                unint64_t v35 = v17 + 120;
              }
              if (v35 > (unint64_t)v33)
              {
                if ((uint64_t)(v16 - 60) >= 1)
                {
                  if (location - 1 >= v17 + location - (unint64_t)v33 + 119) {
                    unint64_t location = -120 - (v17 - (void)v33);
                  }
                  else {
                    unint64_t location = 0;
                  }
                }
                unint64_t v35 = (unint64_t)v33;
              }
              if (TSAccessibilityShouldPerformValidationChecks())
              {
                if (v35 > v34)
                {
                  int ShouldCrashOnValidationErrorAfterLaunch = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch();
                  if (__TSAccessibilityHandleValidationErrorWithDescription(ShouldCrashOnValidationErrorAfterLaunch, 0, @"The excerpt range is invalid!", v37, v38, v39, v40, v41, v49))goto LABEL_50; {
                }
                  }
              }
              if (v35 <= v34)
              {
                NSUInteger length = v35 - location;
                id v26 = [v32 substringWithRange:location, length];
                if (v26)
                {
LABEL_15:
                  BOOL v27 = (unint64_t)v16 >= location && &v16[v17 - location] <= [v26 length];
                  if (!TSAccessibilityShouldPerformValidationChecks()
                    || v27
                    || (int v43 = TSAccessibilityShouldCrashOnValidationErrorAfterLaunch(),
                        !__TSAccessibilityHandleValidationErrorWithDescription(v43, 0, @"Something is wrong with selectionRange or excerptRange.", v44, v45, v46, v47, v48, v49)))
                  {
                    if (v27)
                    {
                      if (-[TSAFindReplaceControllerAccessibility tsaxRespondsToSelector:fromExtrasProtocol:](self, "tsaxRespondsToSelector:fromExtrasProtocol:", "tsaxDecoratedStringForAnnouncement:selectionRange:excerptRange:", &OBJC_PROTOCOL___TSAFindReplaceControllerAccessibilityExtras))id v26 = -[TSAFindReplaceControllerAccessibility tsaxDecoratedStringForAnnouncement:selectionRange:excerptRange:](self, "tsaxDecoratedStringForAnnouncement:selectionRange:excerptRange:", v26, v16, v17, location, length); {
                    }
                      }
                    v42 = v50;
                    v50[0] = _NSConcreteStackBlock;
                    v50[1] = 3221225472;
                    v50[2] = sub_26F3C4;
                    v50[3] = &unk_456E38;
                    v50[4] = a4;
                    v50[5] = v26;
LABEL_48:
                    TSAccessibilityPerformBlockOnMainThreadAfterDelay(v42, 0.5);
                    return;
                  }
                  goto LABEL_50;
                }
              }
            }
          }
        }
      }
    }
  }
}

@end