@interface TSUIReferenceLibraryViewControllerAccessibility
+ (BOOL)dictionaryHasDefinitionForTerm:(id)a3;
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
@end

@implementation TSUIReferenceLibraryViewControllerAccessibility

+ (id)tsaxTargetClassName
{
  return @"UIReferenceLibraryViewController";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

+ (BOOL)dictionaryHasDefinitionForTerm:(id)a3
{
  if (UIAccessibilityIsVoiceOverRunning()
    && +[NSThread isMainThread]
    && byte_5739F6 != 0)
  {
    return 1;
  }
  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___TSUIReferenceLibraryViewControllerAccessibility;
  return [super dictionaryHasDefinitionForTerm:a3];
}

@end