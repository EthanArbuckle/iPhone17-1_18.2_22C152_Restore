@interface CRLApplicationAccessibilityValidator
+ (void)performPlatformSpecificValidations;
+ (void)performValidations;
@end

@implementation CRLApplicationAccessibilityValidator

+ (void)performValidations
{
  __CRLAccessibilityValidateInstanceMethodComplete(@"CRLUndoManager", @"undo", "v", v2, v3, v4, v5, v6, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"CRLUndoManager", @"redo", "v", v7, v8, v9, v10, v11, 0);
}

+ (void)performPlatformSpecificValidations
{
  __CRLAccessibilityValidateInstanceMethodComplete(@"UIApplication", @"_localizedApplicationName", "@", v2, v3, v4, v5, v6, 0);
  __CRLAccessibilityValidateInstanceMethodComplete(@"CRLiOSDocumentModeController", @"resetToDefaultModeAnimated:", "v", v7, v8, v9, v10, v11, "B");

  __CRLAccessibilityValidateClass(@"Freeform.CRLBoardItemFactory");
}

@end