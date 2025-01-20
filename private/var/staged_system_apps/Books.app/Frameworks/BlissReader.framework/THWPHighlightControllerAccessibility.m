@interface THWPHighlightControllerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)p_setLineProperties:(id)a3 fromRange:(_NSRange)a4 isUnderline:(BOOL)a5;
- (BOOL)p_updateHighlight:(id)a3 toRange:(_NSRange)a4 rect:(CGRect)a5;
- (NSDictionary)thaxAnnotationCache;
- (id)thaxAnnotationForRange:(_NSRange)a3;
- (id)thaxAnnotationsForRange:(_NSRange)a3;
- (id)thaxHighlightAtCanvasPoint:(CGPoint)a3;
- (unint64_t)thaxAnnotationCacheVersion;
- (void)_thaxAnnotationsDidChange;
- (void)p_addHighlight:(id)a3 forCachedAnnotation:(id)a4;
- (void)p_clearAnnotationCache;
- (void)p_removeCachedAnnotation:(id)a3;
- (void)p_removeHighlightForCachedAnnotation:(id)a3;
- (void)p_removeNoteForCachedAnnotation:(id)a3;
- (void)p_updateMarginNoteForCachedAnnotation:(id)a3;
- (void)p_updateMarginNoteForHighlight:(id)a3;
- (void)thaxShowEditorForHighlight:(id)a3;
- (void)updateCachedAnnotations;
@end

@implementation THWPHighlightControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"THWPHighlightController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSDictionary)thaxAnnotationCache
{
  char v5 = 0;
  v3 = (objc_class *)objc_opt_class();
  result = (NSDictionary *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THWPHighlightControllerAccessibility *)self tsaxValueForKey:@"annotationCache"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (void)thaxShowEditorForHighlight:(id)a3
{
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_29428C;
  v3[3] = &unk_456E38;
  v3[4] = self;
  v3[5] = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v3)) {
    abort();
  }
}

- (id)thaxHighlightAtCanvasPoint:(CGPoint)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_294388;
  v11 = sub_294398;
  uint64_t v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2943A4;
  v5[3] = &unk_46B940;
  v5[4] = self;
  v5[5] = &v7;
  CGPoint v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)thaxAnnotationForRange:(_NSRange)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_294388;
  v11 = sub_294398;
  uint64_t v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2944CC;
  v5[3] = &unk_46B940;
  v5[4] = self;
  v5[5] = &v7;
  _NSRange v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (id)thaxAnnotationsForRange:(_NSRange)a3
{
  uint64_t v7 = 0;
  v8 = &v7;
  uint64_t v9 = 0x3052000000;
  v10 = sub_294388;
  v11 = sub_294398;
  uint64_t v12 = 0;
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_2945F4;
  v5[3] = &unk_46B940;
  v5[4] = self;
  v5[5] = &v7;
  _NSRange v6 = a3;
  if (__TSAccessibilityPerformSafeBlock((uint64_t)v5)) {
    abort();
  }
  v3 = (void *)v8[5];
  _Block_object_dispose(&v7, 8);
  return v3;
}

- (void)updateCachedAnnotations
{
  v3.receiver = self;
  v3.super_class = (Class)THWPHighlightControllerAccessibility;
  [(THWPHighlightControllerAccessibility *)&v3 updateCachedAnnotations];
  if (+[NSThread isMainThread]) {
    [(THWPHighlightControllerAccessibility *)self _thaxAnnotationsDidChange];
  }
}

- (void)p_addHighlight:(id)a3 forCachedAnnotation:(id)a4
{
  v5.receiver = self;
  v5.super_class = (Class)THWPHighlightControllerAccessibility;
  [(THWPHighlightControllerAccessibility *)&v5 p_addHighlight:a3 forCachedAnnotation:a4];
  [(THWPHighlightControllerAccessibility *)self _thaxAnnotationsDidChange];
}

- (void)p_clearAnnotationCache
{
  v3.receiver = self;
  v3.super_class = (Class)THWPHighlightControllerAccessibility;
  [(THWPHighlightControllerAccessibility *)&v3 p_clearAnnotationCache];
  [(THWPHighlightControllerAccessibility *)self _thaxAnnotationsDidChange];
}

- (void)p_removeCachedAnnotation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWPHighlightControllerAccessibility;
  [(THWPHighlightControllerAccessibility *)&v4 p_removeCachedAnnotation:a3];
  [(THWPHighlightControllerAccessibility *)self _thaxAnnotationsDidChange];
}

- (void)p_removeHighlightForCachedAnnotation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWPHighlightControllerAccessibility;
  [(THWPHighlightControllerAccessibility *)&v4 p_removeHighlightForCachedAnnotation:a3];
  [(THWPHighlightControllerAccessibility *)self _thaxAnnotationsDidChange];
}

- (void)p_removeNoteForCachedAnnotation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWPHighlightControllerAccessibility;
  [(THWPHighlightControllerAccessibility *)&v4 p_removeNoteForCachedAnnotation:a3];
  [(THWPHighlightControllerAccessibility *)self _thaxAnnotationsDidChange];
}

- (BOOL)p_setLineProperties:(id)a3 fromRange:(_NSRange)a4 isUnderline:(BOOL)a5
{
  v8.receiver = self;
  v8.super_class = (Class)THWPHighlightControllerAccessibility;
  BOOL v6 = -[THWPHighlightControllerAccessibility p_setLineProperties:fromRange:isUnderline:](&v8, "p_setLineProperties:fromRange:isUnderline:", a3, a4.location, a4.length, a5);
  [(THWPHighlightControllerAccessibility *)self _thaxAnnotationsDidChange];
  return v6;
}

- (BOOL)p_updateHighlight:(id)a3 toRange:(_NSRange)a4 rect:(CGRect)a5
{
  v8.receiver = self;
  v8.super_class = (Class)THWPHighlightControllerAccessibility;
  BOOL v6 = -[THWPHighlightControllerAccessibility p_updateHighlight:toRange:rect:](&v8, "p_updateHighlight:toRange:rect:", a3, a4.location, a4.length, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  [(THWPHighlightControllerAccessibility *)self _thaxAnnotationsDidChange];
  return v6;
}

- (void)p_updateMarginNoteForCachedAnnotation:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWPHighlightControllerAccessibility;
  [(THWPHighlightControllerAccessibility *)&v4 p_updateMarginNoteForCachedAnnotation:a3];
  [(THWPHighlightControllerAccessibility *)self _thaxAnnotationsDidChange];
}

- (void)p_updateMarginNoteForHighlight:(id)a3
{
  v4.receiver = self;
  v4.super_class = (Class)THWPHighlightControllerAccessibility;
  [(THWPHighlightControllerAccessibility *)&v4 p_updateMarginNoteForHighlight:a3];
  [(THWPHighlightControllerAccessibility *)self _thaxAnnotationsDidChange];
}

- (void)_thaxAnnotationsDidChange
{
  objc_super v3 = objc_opt_class();
  Class v4 = __TSAccessibilityCastAsSafeCategory(v3, (uint64_t)[(THWPHighlightControllerAccessibility *)self tsaxValueForKey:@"parentRep"], 0, 0);

  [(objc_class *)v4 thaxHighlightsDidChange];
}

- (unint64_t)thaxAnnotationCacheVersion
{
  return self->_thaxAnnotationCacheVersion;
}

@end