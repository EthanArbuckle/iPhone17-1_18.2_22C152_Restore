@interface TSWPStorageAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)tsaxContainsAnnotationInRange:(_NSRange)a3;
- (NSString)tsaxString;
- (_NSRange)tsaxRange;
- (_NSRange)tsaxRangeForAnnotation:(id)a3;
- (id)tsaxAttachmentOrFootnoteAtCharIndex:(unint64_t)a3;
- (id)tsaxEditableAnnotationForInsertionPointSelection:(id)a3 includeComments:(BOOL)a4 withOutRange:(_NSRange *)a5 outSelectionIsOnEdge:(BOOL *)a6;
- (id)tsaxSmartFieldNearestToCharIndex:(unint64_t)a3 inStorageRange:(_NSRange)a4;
- (id)tsaxSubstringWithRange:(_NSRange)a3;
- (id)tsaxTargetStringForAnnotation:(id)a3;
- (unint64_t)tsaxSelectionRangeMaxForCharIndex:(unint64_t)a3;
- (void)tsaxEnumerateAttachmentsUsingBlock:(id)a3;
- (void)tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:(id)a3;
- (void)tsaxEnumerateSmartFieldsUsingBlock:(id)a3;
- (void)tsaxEnumerateSmartFieldsWithAttributeKind:(int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5;
@end

@implementation TSWPStorageAccessibility

+ (id)tsaxTargetClassName
{
  return @"TSWPStorage";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)tsaxString
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(TSWPStorageAccessibility *)self tsaxValueForKey:@"string"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (_NSRange)tsaxRange
{
  id v2 = [(TSWPStorageAccessibility *)self tsaxRangeValueForKey:@"range"];
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (unint64_t)tsaxSelectionRangeMaxForCharIndex:(unint64_t)a3
{
  uint64_t v6 = 0;
  v7 = &v6;
  uint64_t v8 = 0x2020000000;
  uint64_t v9 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_270494;
  v5[3] = &unk_458E98;
  v5[4] = self;
  v5[5] = &v6;
  v5[6] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  unint64_t v3 = v7[3];
  _Block_object_dispose(&v6, 8);
  return v3;
}

- (id)tsaxSubstringWithRange:(_NSRange)a3
{
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_2705BC;
  v11 = sub_2705CC;
  uint64_t v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2705D8;
  v5[3] = &unk_46B940;
  v5[4] = self;
  v5[5] = &v7;
  _NSRange v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  unint64_t v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)tsaxAttachmentOrFootnoteAtCharIndex:(unint64_t)a3
{
  char v7 = 0;
  char v5 = objc_opt_class();
  id result = __TSAccessibilityCastAsSafeCategory(v5, (uint64_t)[(TSWPStorageAccessibility *)self attachmentOrFootnoteAtCharIndex:a3], 1, &v7);
  if (v7) {
    abort();
  }
  return result;
}

- (void)tsaxEnumerateAttachmentsUsingBlock:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_2706F8;
  v3[3] = &unk_456E88;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (void)tsaxEnumerateFootnoteReferenceAttachmentsUsingBlock:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_270888;
  v3[3] = &unk_456E88;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (id)tsaxSmartFieldNearestToCharIndex:(unint64_t)a3 inStorageRange:(_NSRange)a4
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = sub_2705BC;
  v14 = sub_2705CC;
  uint64_t v15 = 0;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_270A78;
  v9[3] = &unk_46C038;
  v9[4] = &v10;
  v9[5] = a3;
  -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](self, "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, a4.location, a4.length, v9);
  char v8 = 0;
  v4 = objc_opt_class();
  Class v5 = __TSAccessibilityCastAsSafeCategory(v4, v11[5], 1, &v8);
  if (v8) {
    abort();
  }
  Class v6 = v5;
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (void)tsaxEnumerateSmartFieldsUsingBlock:(id)a3
{
  id v6 = [(TSWPStorageAccessibility *)self tsaxRange];

  -[TSWPStorageAccessibility tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:](self, "tsaxEnumerateSmartFieldsWithAttributeKind:inRange:usingBlock:", 6, v6, v5, a3);
}

- (void)tsaxEnumerateSmartFieldsWithAttributeKind:(int)a3 inRange:(_NSRange)a4 usingBlock:(id)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_270B6C;
  v5[3] = &unk_46C088;
  int v7 = a3;
  _NSRange v6 = a4;
  v5[4] = self;
  v5[5] = a5;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
}

- (id)tsaxEditableAnnotationForInsertionPointSelection:(id)a3 includeComments:(BOOL)a4 withOutRange:(_NSRange *)a5 outSelectionIsOnEdge:(BOOL *)a6
{
  uint64_t v10 = 0;
  v11 = &v10;
  uint64_t v12 = 0x3052000000;
  v13 = sub_2705BC;
  v14 = sub_2705CC;
  uint64_t v15 = 0;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_270D78;
  v8[3] = &unk_46C0B0;
  v8[4] = self;
  v8[5] = a3;
  BOOL v9 = a4;
  v8[6] = &v10;
  v8[7] = a5;
  v8[8] = a6;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v8)) {
    abort();
  }
  _NSRange v6 = (void *)v11[5];
  _Block_object_dispose(&v10, 8);
  return v6;
}

- (BOOL)tsaxContainsAnnotationInRange:(_NSRange)a3
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3010000000;
  uint64_t v10 = &unk_41622E;
  uint64_t v11 = 0;
  uint64_t v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_270E98;
  v5[3] = &unk_46B940;
  v5[4] = self;
  v5[5] = &v7;
  _NSRange v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  uint64_t v3 = v8[4];
  _Block_object_dispose(&v7, 8);
  return v3 != 0x7FFFFFFFFFFFFFFFLL;
}

- (_NSRange)tsaxRangeForAnnotation:(id)a3
{
  uint64_t v8 = 0;
  uint64_t v9 = &v8;
  uint64_t v10 = 0x3010000000;
  uint64_t v11 = &unk_41622E;
  uint64_t v12 = 0;
  uint64_t v13 = 0;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_270FB0;
  v7[3] = &unk_457DA0;
  v7[5] = a3;
  v7[6] = &v8;
  v7[4] = self;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v7)) {
    abort();
  }
  NSUInteger v3 = v9[4];
  NSUInteger v4 = v9[5];
  _Block_object_dispose(&v8, 8);
  NSUInteger v5 = v3;
  NSUInteger v6 = v4;
  result.length = v6;
  result.location = v5;
  return result;
}

- (id)tsaxTargetStringForAnnotation:(id)a3
{
  id v5 = [(TSWPStorageAccessibility *)self tsaxRangeForAnnotation:a3];

  return -[TSWPStorageAccessibility tsaxSubstringWithRange:](self, "tsaxSubstringWithRange:", v5, v4);
}

@end