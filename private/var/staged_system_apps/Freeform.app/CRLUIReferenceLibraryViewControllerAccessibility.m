@interface CRLUIReferenceLibraryViewControllerAccessibility
+ (BOOL)dictionaryHasDefinitionForTerm:(id)a3;
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
@end

@implementation CRLUIReferenceLibraryViewControllerAccessibility

+ (id)crlaxTargetClassName
{
  return @"UIReferenceLibraryViewController";
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

+ (BOOL)dictionaryHasDefinitionForTerm:(id)a3
{
  id v4 = a3;
  if (!UIAccessibilityIsVoiceOverRunning()
    || (+[NSThread isMainThread] ? (BOOL v5 = byte_1016A9A48 == 0) : (BOOL v5 = 1), v5))
  {
    v8.receiver = a1;
    v8.super_class = (Class)&OBJC_METACLASS___CRLUIReferenceLibraryViewControllerAccessibility;
    unsigned __int8 v6 = [super dictionaryHasDefinitionForTerm:v4];
  }
  else
  {
    unsigned __int8 v6 = 1;
  }

  return v6;
}

@end