@interface IMCommonCoreAccessibility
+ (id)sharedInstance;
- (BOOL)_isAccessibilitySupportLoaded;
- (BOOL)needsAccessibilityAnnouncements;
- (UIColor)preferredSpeakScreenHighlightColor;
- (UIColor)preferredSpeakScreenUnderlineColor;
- (id)preferencesDomain;
- (void)_setAccessibilitySupportLoaded:(BOOL)a3;
- (void)addSafeCategoryNamesToCollection:(id)a3;
- (void)loadAccessibilitySupport;
- (void)performValidation;
- (void)setPreferredSpeakScreenHighlightColor:(id)a3;
- (void)setPreferredSpeakScreenUnderlineColor:(id)a3;
@end

@implementation IMCommonCoreAccessibility

- (UIColor)preferredSpeakScreenHighlightColor
{
  return (UIColor *)__IMAccessibilityGetAssociatedObject(self, &unk_345600);
}

- (void)setPreferredSpeakScreenHighlightColor:(id)a3
{
}

- (UIColor)preferredSpeakScreenUnderlineColor
{
  return (UIColor *)__IMAccessibilityGetAssociatedObject(self, &unk_345601);
}

- (void)setPreferredSpeakScreenUnderlineColor:(id)a3
{
}

- (id)preferencesDomain
{
  return @"com.apple.Accessibility";
}

- (BOOL)needsAccessibilityAnnouncements
{
  return [(IMCommonCoreAccessibility *)self needsAccessibilityElements];
}

+ (id)sharedInstance
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_6F9E8;
  block[3] = &unk_2C3BB8;
  block[4] = a1;
  if (qword_3457A8 != -1) {
    dispatch_once(&qword_3457A8, block);
  }
  v2 = (void *)qword_3457A0;

  return v2;
}

- (void)performValidation
{
  __IMAccessibilityValidateInstanceMethodComplete(@"AEAnnotation", @"annotationIsUnderline", "B", v2, v3, v4, v5, v6, 0);
  __IMAccessibilityValidateProperty(@"AEAnnotation", "annotationRepresentativeText");
  __IMAccessibilityValidateProperty(@"AEAnnotation", "annotationNote");

  __IMAccessibilityValidateProperty(@"AEAnnotation", "annotationStyle");
}

- (void)addSafeCategoryNamesToCollection:(id)a3
{
}

- (void)loadAccessibilitySupport
{
  if (![(IMCommonCoreAccessibility *)self _isAccessibilitySupportLoaded])
  {
    if (IMAccessibilityShouldPerformValidationChecks())
    {
      [(IMCommonCoreAccessibility *)self performValidation];
      if ([(IMCommonCoreAccessibility *)self conformsToProtocol:&OBJC_PROTOCOL___IMCommonCoreAccessibilityExtras])
      {
        if (objc_opt_respondsToSelector()) {
          [(IMCommonCoreAccessibility *)self performExtraValidation];
        }
      }
    }
    id v3 = (id)objc_opt_new();
    -[IMCommonCoreAccessibility addSafeCategoryNamesToCollection:](self, "addSafeCategoryNamesToCollection:");
    if [(IMCommonCoreAccessibility *)self conformsToProtocol:&OBJC_PROTOCOL___IMCommonCoreAccessibilityExtras]&& (objc_opt_respondsToSelector())
    {
      [(IMCommonCoreAccessibility *)self addExtraSafeCategoryNamesToCollection:v3];
    }
    IMAccessibilityInstallSafeCategories(v3);
    [(IMCommonCoreAccessibility *)self _setAccessibilitySupportLoaded:1];
  }
}

- (BOOL)_isAccessibilitySupportLoaded
{
  return self->_accessibilitySupportLoaded;
}

- (void)_setAccessibilitySupportLoaded:(BOOL)a3
{
  self->_accessibilitySupportLoaded = a3;
}

@end