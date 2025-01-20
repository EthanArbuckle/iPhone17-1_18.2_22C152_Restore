@interface TSDEditorControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (NSArray)tsaxCurrentEditors;
- (id)tsaxEditorForEditAction:(SEL)a3 withSender:(id)a4;
- (id)tsaxTextInputEditor;
@end

@implementation TSDEditorControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSDEditorController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)tsaxTextInputEditor
{
  return [(TSDEditorControllerAccessibility *)self tsaxValueForKey:@"textInputEditor"];
}

- (NSArray)tsaxCurrentEditors
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSArray *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSDEditorControllerAccessibility *)self tsaxValueForKey:@"currentEditors"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (id)tsaxEditorForEditAction:(SEL)a3 withSender:(id)a4
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_265F20;
  v11 = sub_265F30;
  uint64_t v12 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_265F3C;
  v6[3] = &unk_46BE20;
  v6[6] = &v7;
  v6[7] = a3;
  v6[4] = self;
  v6[5] = a4;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v6)) {
    abort();
  }
  v4 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v4;
}

@end