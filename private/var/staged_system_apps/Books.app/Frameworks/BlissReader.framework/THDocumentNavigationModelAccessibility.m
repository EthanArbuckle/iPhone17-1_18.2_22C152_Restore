@interface THDocumentNavigationModelAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (id)thaxChapterAndNumberStringForNavigationUnit:(id)a3;
- (id)thaxChapterNodeForContentNode:(id)a3;
- (id)thaxLessonNodeForContentNode:(id)a3;
- (id)thaxMajorSnippetForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5;
- (id)thaxMinorSnippetForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5;
- (id)thaxNavigationUnitContainingContentNode:(id)a3;
- (id)thaxPageNumberStringForAbsolutePageIndex:(int64_t)a3 forPresentationType:(id)a4;
@end

@implementation THDocumentNavigationModelAccessibility

+ (id)tsaxTargetClassName
{
  return @"THDocumentNavigationModel";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxPageNumberStringForAbsolutePageIndex:(int64_t)a3 forPresentationType:(id)a4
{
  uint64_t v8 = 0;
  v9 = &v8;
  uint64_t v10 = 0x3052000000;
  v11 = sub_297E78;
  v12 = sub_297E88;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_297E94;
  v7[3] = &unk_46BE20;
  v7[6] = &v8;
  v7[7] = a3;
  v7[4] = self;
  v7[5] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  uint64_t v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  LOBYTE(v8) = 0;
  v5 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v5, v4, 1, &v8);
  if ((_BYTE)v8) {
    abort();
  }
  return result;
}

- (id)thaxMajorSnippetForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = sub_297E78;
  uint64_t v13 = sub_297E88;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_297FEC;
  v8[3] = &unk_46C840;
  v8[7] = &v9;
  v8[8] = a3;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
  uint64_t v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  LOBYTE(v9) = 0;
  v6 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v6, v5, 1, &v9);
  if ((_BYTE)v9) {
    abort();
  }
  return result;
}

- (id)thaxMinorSnippetForAbsolutePageIndex:(unint64_t)a3 withDocumentRoot:(id)a4 forPresentationType:(id)a5
{
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = sub_297E78;
  uint64_t v13 = sub_297E88;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_298144;
  v8[3] = &unk_46C840;
  v8[7] = &v9;
  v8[8] = a3;
  v8[4] = self;
  v8[5] = a4;
  v8[6] = a5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
  uint64_t v5 = v10[5];
  _Block_object_dispose(&v9, 8);
  LOBYTE(v9) = 0;
  v6 = (objc_class *)objc_opt_class();
  id result = (id)__TSAccessibilityCastAsClass(v6, v5, 1, &v9);
  if ((_BYTE)v9) {
    abort();
  }
  return result;
}

- (id)thaxLessonNodeForContentNode:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = sub_297E78;
  v12 = sub_297E88;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_298318;
  v7[3] = &unk_457DA0;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  uint64_t v3 = v9[5];
  _Block_object_dispose(&v8, 8);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = sub_297E78;
  v12 = sub_297E88;
  uint64_t v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_298350;
  v6[3] = &unk_4573D8;
  v6[4] = v3;
  v6[5] = &v8;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  uint64_t v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)thaxChapterNodeForContentNode:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = sub_297E78;
  v12 = sub_297E88;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_2984F8;
  v7[3] = &unk_457DA0;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  uint64_t v3 = v9[5];
  _Block_object_dispose(&v8, 8);
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3052000000;
  uint64_t v11 = sub_297E78;
  v12 = sub_297E88;
  uint64_t v13 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_298530;
  v6[3] = &unk_4573D8;
  v6[4] = v3;
  v6[5] = &v8;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  uint64_t v4 = (void *)v9[5];
  _Block_object_dispose(&v8, 8);
  return v4;
}

- (id)thaxNavigationUnitContainingContentNode:(id)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x3052000000;
  uint64_t v9 = sub_297E78;
  uint64_t v10 = sub_297E88;
  uint64_t v11 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_298630;
  v5[3] = &unk_457DA0;
  v5[5] = a3;
  v5[6] = &v6;
  v5[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  uint64_t v3 = (void *)v7[5];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)thaxChapterAndNumberStringForNavigationUnit:(id)a3
{
  char v15 = 0;
  uint64_t v5 = (objc_class *)objc_opt_class();
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x3052000000;
  v12 = sub_297E78;
  uint64_t v13 = sub_297E88;
  uint64_t v14 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_298798;
  v8[3] = &unk_457DA0;
  v8[5] = a3;
  v8[6] = &v9;
  v8[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
  uint64_t v6 = v10[5];
  _Block_object_dispose(&v9, 8);
  id result = (id)__TSAccessibilityCastAsClass(v5, v6, 1, &v15);
  if (v15) {
    abort();
  }
  return result;
}

@end