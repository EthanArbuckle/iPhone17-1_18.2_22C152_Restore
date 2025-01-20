@interface CRLEditorControllerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (CRLSelectionPathAccessibility)crlaxSelectionPath;
- (NSArray)crlaxCurrentEditors;
- (id)crlaxEditorForEditAction:(SEL)a3 withSender:(id)a4;
- (id)crlaxTextInputEditor;
- (void)crlaxSetSelectionPath:(id)a3;
- (void)crlaxSetSelectionPath:(id)a3 withFlags:(unint64_t)a4;
@end

@implementation CRLEditorControllerAccessibility

+ (id)crlaxTargetClassName
{
  return @"CRLEditorController";
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

- (CRLSelectionPathAccessibility)crlaxSelectionPath
{
  char v8 = 0;
  v2 = [(CRLEditorControllerAccessibility *)self crlaxTarget];
  id v3 = [v2 selectionPath];

  v4 = objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsSafeCategory(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (CRLSelectionPathAccessibility *)v6;
}

- (void)crlaxSetSelectionPath:(id)a3
{
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10031D984;
  v4[3] = &unk_1014CBE78;
  v4[4] = self;
  id v3 = a3;
  id v5 = v3;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v4)) {
    abort();
  }
}

- (void)crlaxSetSelectionPath:(id)a3 withFlags:(unint64_t)a4
{
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10031DA30;
  v6[3] = &unk_1014CD770;
  v6[4] = self;
  id v5 = a3;
  id v7 = v5;
  unint64_t v8 = a4;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
}

- (id)crlaxTextInputEditor
{
  v2 = [(CRLEditorControllerAccessibility *)self crlaxTarget];
  id v3 = [v2 textInputEditor];

  return v3;
}

- (NSArray)crlaxCurrentEditors
{
  char v8 = 0;
  v2 = [(CRLEditorControllerAccessibility *)self crlaxTarget];
  id v3 = [v2 currentEditors];

  v4 = (objc_class *)objc_opt_class();
  uint64_t v5 = __CRLAccessibilityCastAsClass(v4, (uint64_t)v3, 1, &v8);
  if (v8) {
    abort();
  }
  v6 = (void *)v5;

  return (NSArray *)v6;
}

- (id)crlaxEditorForEditAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v11 = 0;
  v12 = &v11;
  uint64_t v13 = 0x3032000000;
  v14 = sub_10031DC4C;
  v15 = sub_10031DC5C;
  id v16 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10031DC64;
  v7[3] = &unk_1014EDE08;
  v9 = &v11;
  SEL v10 = a3;
  v7[4] = self;
  id v4 = a4;
  id v8 = v4;
  if (__CRLAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }

  id v5 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v5;
}

@end