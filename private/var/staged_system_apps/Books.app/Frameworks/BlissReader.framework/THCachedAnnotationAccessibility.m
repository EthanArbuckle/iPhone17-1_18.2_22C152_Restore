@interface THCachedAnnotationAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_axShouldTreatAsCustomItemForTextElement;
- (BOOL)isAccessibilityElement;
- (BOOL)thaxHasNote;
- (CGRect)accessibilityFrame;
- (NSString)thaxHighlightStyleDescription;
- (NSString)thaxHighlightedText;
- (NSString)thaxHighlightedTextDescription;
- (NSString)thaxNoteText;
- (_NSRange)thaxAnnotationStorageRange;
- (id)thaxParentHighlightController;
- (id)thaxParentRep;
- (void)thaxSetParentHighlightController:(id)a3;
@end

@implementation THCachedAnnotationAccessibility

+ (id)tsaxTargetClassName
{
  return @"THCachedAnnotation";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (id)thaxParentHighlightController
{
  return __TSAccessibilityGetAssociatedObject(self, &unk_573A71);
}

- (void)thaxSetParentHighlightController:(id)a3
{
}

- (NSString)thaxHighlightedTextDescription
{
  v3 = [(THCachedAnnotationAccessibility *)self thaxHighlightStyleDescription];
  id v4 = [(THCachedAnnotationAccessibility *)self tsaxValueForKey:@"_annotationRepresentativeText"];
  return (NSString *)__TSAccessibilityStringForVariables(1, v3, v5, v6, v7, v8, v9, v10, (uint64_t)v4);
}

- (NSString)thaxHighlightedText
{
  return (NSString *)[(THCachedAnnotationAccessibility *)self tsaxValueForKey:@"_annotationRepresentativeText"];
}

- (_NSRange)thaxAnnotationStorageRange
{
  id v2 = [(THCachedAnnotationAccessibility *)self tsaxRangeValueForKey:@"annotationStorageRange"];
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (NSString)thaxNoteText
{
  char v5 = 0;
  NSUInteger v3 = (objc_class *)objc_opt_class();
  _NSRange result = (NSString *)__TSAccessibilityCastAsClass(v3, (uint64_t)[(THCachedAnnotationAccessibility *)self tsaxValueForKey:@"_annotationNote"], 1, &v5);
  if (v5) {
    abort();
  }
  return result;
}

- (NSString)thaxHighlightStyleDescription
{
  switch([(THCachedAnnotationAccessibility *)self tsaxIntValueForKey:@"_annotationStyle"])
  {
    case 1u:
      unsigned int v3 = [(THCachedAnnotationAccessibility *)self thaxHasNote];
      CFStringRef v4 = @"highlight.color.green";
      CFStringRef v5 = @"highlight.color.green.with.note";
      goto LABEL_8;
    case 2u:
      unsigned int v3 = [(THCachedAnnotationAccessibility *)self thaxHasNote];
      CFStringRef v4 = @"highlight.color.blue";
      CFStringRef v5 = @"highlight.color.blue.with.note";
      goto LABEL_8;
    case 3u:
      unsigned int v3 = [(THCachedAnnotationAccessibility *)self thaxHasNote];
      CFStringRef v4 = @"highlight.color.yellow";
      CFStringRef v5 = @"highlight.color.yellow.with.note";
      goto LABEL_8;
    case 4u:
      unsigned int v3 = [(THCachedAnnotationAccessibility *)self thaxHasNote];
      CFStringRef v4 = @"highlight.color.pink";
      CFStringRef v5 = @"highlight.color.pink.with.note";
      goto LABEL_8;
    case 5u:
      unsigned int v3 = [(THCachedAnnotationAccessibility *)self thaxHasNote];
      CFStringRef v4 = @"highlight.color.purple";
      CFStringRef v5 = @"highlight.color.purple.with.note";
      goto LABEL_8;
    case 6u:
      unsigned int v3 = [(THCachedAnnotationAccessibility *)self thaxHasNote];
      CFStringRef v4 = @"highlight.underlined.text";
      CFStringRef v5 = @"highlight.underlined.text.with.note";
LABEL_8:
      if (v3) {
        uint64_t v6 = (uint64_t)v5;
      }
      else {
        uint64_t v6 = (uint64_t)v4;
      }
      _NSRange result = THAccessibilityLocalizedString(v6);
      if (!result) {
        goto LABEL_12;
      }
      return result;
    default:
LABEL_12:
      if ([(THCachedAnnotationAccessibility *)self thaxHasNote]) {
        CFStringRef v8 = @"highlight.generic.with.note";
      }
      else {
        CFStringRef v8 = @"highlight.generic";
      }
      return THAccessibilityLocalizedString((uint64_t)v8);
  }
}

- (BOOL)thaxHasNote
{
  return [(NSString *)[(THCachedAnnotationAccessibility *)self thaxNoteText] length] != 0;
}

- (id)thaxParentRep
{
  id v2 = [(THCachedAnnotationAccessibility *)self thaxParentHighlightController];

  return [v2 tsaxValueForKey:@"parentRep"];
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (CGRect)accessibilityFrame
{
  uint64_t v25 = 0;
  v26 = (double *)&v25;
  uint64_t v27 = 0x4010000000;
  v28 = &unk_41622E;
  CGSize size = CGRectZero.size;
  CGPoint origin = CGRectZero.origin;
  CGSize v30 = size;
  id v4 = [(THCachedAnnotationAccessibility *)self thaxParentHighlightController];
  id v5 = [(THCachedAnnotationAccessibility *)self thaxParentRep];
  id v6 = objc_msgSend(objc_msgSend(v5, "tsaxValueForKey:", @"canvas"), "tsaxValueForKey:", @"canvasController");
  char v24 = 0;
  uint64_t v7 = objc_opt_class();
  Class v8 = __TSAccessibilityCastAsSafeCategory(v7, (uint64_t)[v6 tsaxValueForKey:@"canvas"], 1, &v24);
  if (v24) {
    abort();
  }
  Class v9 = v8;
  if (v8)
  {
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_29B5C0;
    v23[3] = &unk_46BA00;
    v23[4] = v4;
    v23[5] = self;
    v23[6] = v5;
    v23[7] = &v25;
    if (__TSAccessibilityPerformSafeBlock((uint64_t)v23)) {
      abort();
    }
    -[objc_class tsaxScreenFrameFromUnscaledCanvas:](v9, "tsaxScreenFrameFromUnscaledCanvas:", v26[4], v26[5], v26[6], v26[7]);
    double v11 = v10;
    double v13 = v12;
    double v15 = v14;
    double v17 = v16;
    v18 = v26;
    v26[4] = v10;
    v18[5] = v12;
    v18[6] = v14;
    v18[7] = v16;
  }
  else
  {
    double v11 = v26[4];
    double v13 = v26[5];
    double v15 = v26[6];
    double v17 = v26[7];
  }
  _Block_object_dispose(&v25, 8);
  double v19 = v11;
  double v20 = v13;
  double v21 = v15;
  double v22 = v17;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v20;
  result.origin.x = v19;
  return result;
}

- (BOOL)_axShouldTreatAsCustomItemForTextElement
{
  return 1;
}

@end