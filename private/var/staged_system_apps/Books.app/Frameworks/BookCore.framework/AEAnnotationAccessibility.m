@interface AEAnnotationAccessibility
+ (Class)imaxBaseSafeCategoryClass;
+ (id)imaxTargetClassName;
- (BOOL)imaxHasNote;
- (BOOL)imaxIsAnnotationDeleted;
- (BOOL)thaxAnnotationIsUnderline;
- (NSString)imaxAnnotationLocation;
- (NSString)imaxAnnotationNote;
- (NSString)imaxAnnotationSelectedText;
- (NSString)imaxAnnotationStyleDescription;
- (NSString)imaxWholeAnnotationDescription;
- (id)accessibilityLabel;
- (id)accessibilityValue;
- (id)imaxLocation;
- (int)thaxAnnotationStyle;
@end

@implementation AEAnnotationAccessibility

+ (id)imaxTargetClassName
{
  return @"AEAnnotation";
}

+ (Class)imaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (NSString)imaxAnnotationLocation
{
  char v7 = 0;
  v3 = (objc_class *)objc_opt_class();
  v4 = [(AEAnnotationAccessibility *)self imaxValueForKey:@"annotationLocation"];
  v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v7);

  if (v7) {
    abort();
  }

  return (NSString *)v5;
}

- (NSString)imaxWholeAnnotationDescription
{
  switch([(AEAnnotationAccessibility *)self thaxAnnotationStyle])
  {
    case 1:
      unsigned int v3 = [(AEAnnotationAccessibility *)self imaxHasNote];
      CFStringRef v4 = @"highlight.color.green";
      CFStringRef v5 = @"highlight.color.green.with.note";
      goto LABEL_9;
    case 2:
      unsigned int v3 = [(AEAnnotationAccessibility *)self imaxHasNote];
      CFStringRef v4 = @"highlight.color.blue";
      CFStringRef v5 = @"highlight.color.blue.with.note";
      goto LABEL_9;
    case 3:
      unsigned int v3 = [(AEAnnotationAccessibility *)self imaxHasNote];
      CFStringRef v4 = @"highlight.color.yellow";
      CFStringRef v5 = @"highlight.color.yellow.with.note";
      goto LABEL_9;
    case 4:
      unsigned int v3 = [(AEAnnotationAccessibility *)self imaxHasNote];
      CFStringRef v4 = @"highlight.color.pink";
      CFStringRef v5 = @"highlight.color.pink.with.note";
      goto LABEL_9;
    case 5:
      unsigned int v3 = [(AEAnnotationAccessibility *)self imaxHasNote];
      CFStringRef v4 = @"highlight.color.purple";
      CFStringRef v5 = @"highlight.color.purple.with.note";
      goto LABEL_9;
    default:
      if (![(AEAnnotationAccessibility *)self thaxAnnotationIsUnderline]) {
        goto LABEL_13;
      }
      unsigned int v3 = [(AEAnnotationAccessibility *)self imaxHasNote];
      CFStringRef v4 = @"highlight.underlined.text";
      CFStringRef v5 = @"highlight.underlined.text.with.note";
LABEL_9:
      if (v3) {
        v6 = (__CFString *)v5;
      }
      else {
        v6 = (__CFString *)v4;
      }
      char v7 = IMCommonCoreAccessibilityLocalizedString(v6);
      if (!v7)
      {
LABEL_13:
        if ([(AEAnnotationAccessibility *)self imaxHasNote]) {
          v8 = @"highlight.generic.with.note";
        }
        else {
          v8 = @"highlight.generic";
        }
        char v7 = IMCommonCoreAccessibilityLocalizedString(v8);
      }
      return (NSString *)v7;
  }
}

- (NSString)imaxAnnotationStyleDescription
{
  unsigned int v3 = [(AEAnnotationAccessibility *)self thaxAnnotationStyle] - 1;
  if (v3 < 5)
  {
    CFStringRef v4 = *(&off_2C83C8 + (int)v3);
LABEL_5:
    CFStringRef v5 = IMCommonCoreAccessibilityLocalizedString(v4);
    goto LABEL_7;
  }
  if ([(AEAnnotationAccessibility *)self thaxAnnotationIsUnderline])
  {
    CFStringRef v4 = @"highlight.underlined.text";
    goto LABEL_5;
  }
  CFStringRef v5 = 0;
LABEL_7:

  return (NSString *)v5;
}

- (NSString)imaxAnnotationNote
{
  char v7 = 0;
  unsigned int v3 = (objc_class *)objc_opt_class();
  CFStringRef v4 = [(AEAnnotationAccessibility *)self imaxValueForKey:@"annotationNote"];
  CFStringRef v5 = __IMAccessibilityCastAsClass(v3, v4, 1, &v7);

  if (v7) {
    abort();
  }

  return (NSString *)v5;
}

- (BOOL)imaxHasNote
{
  v2 = [(AEAnnotationAccessibility *)self imaxAnnotationNote];
  BOOL v3 = [v2 length] != 0;

  return v3;
}

- (BOOL)imaxIsAnnotationDeleted
{
  return [(AEAnnotationAccessibility *)self imaxBoolValueForKey:@"isAnnotationDeleted"];
}

- (id)imaxLocation
{
  return [(AEAnnotationAccessibility *)self imaxValueForKey:@"location"];
}

- (NSString)imaxAnnotationSelectedText
{
  return (NSString *)[(AEAnnotationAccessibility *)self imaxValueForKey:@"annotationSelectedText"];
}

- (id)accessibilityLabel
{
  BOOL v3 = [(AEAnnotationAccessibility *)self imaxWholeAnnotationDescription];
  CFStringRef v4 = [(AEAnnotationAccessibility *)self imaxValueForKey:@"annotationRepresentativeText"];
  v12 = __IMAccessibilityStringForVariables(v3, v5, v6, v7, v8, v9, v10, v11, (uint64_t)v4);

  return v12;
}

- (id)accessibilityValue
{
  v2 = [(AEAnnotationAccessibility *)self imaxValueForKey:@"annotationNote"];
  if ([v2 length])
  {
    BOOL v3 = IMCommonCoreAccessibilityLocalizedString(@"note.format %@");
    CFStringRef v4 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v3, v2);
  }
  else
  {
    CFStringRef v4 = 0;
  }

  return v4;
}

- (int)thaxAnnotationStyle
{
  return [(AEAnnotationAccessibility *)self imaxIntValueForKey:@"annotationStyle"];
}

- (BOOL)thaxAnnotationIsUnderline
{
  v2 = [(AEAnnotationAccessibility *)self imaxValueForKey:@"annotationIsUnderline"];
  unsigned __int8 v3 = [v2 BOOLValue];

  return v3;
}

@end