@interface CRLUndoManagerAccessibility
+ (Class)crlaxBaseSafeCategoryClass;
+ (id)crlaxCastFrom:(id)a3;
+ (id)crlaxTargetClassName;
- (BOOL)_crlaxIsPerformingUndoOrRedo;
- (BOOL)crlaxIsPerformingUndoOrRedo;
- (void)_crlaxSetPerformingUndoOrRedo:(BOOL)a3;
- (void)crlaxDidRedo;
- (void)crlaxDidUndo;
- (void)redo;
- (void)undo;
@end

@implementation CRLUndoManagerAccessibility

- (void)crlaxDidUndo
{
  UIAccessibilityNotifications v2 = UIAccessibilityAnnouncementNotification;
  CRLAccessibilityGetUIKitLocalizedString(@"AXTextOperationActionUndo");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);
}

- (void)crlaxDidRedo
{
  UIAccessibilityNotifications v2 = UIAccessibilityAnnouncementNotification;
  CRLAccessibilityGetUIKitLocalizedString(@"AXTextOperationActionRedo");
  id v3 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v3);
}

+ (id)crlaxTargetClassName
{
  return @"CRLUndoManager";
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

- (BOOL)_crlaxIsPerformingUndoOrRedo
{
  return __CRLAccessibilityGetAssociatedBool(self, &unk_1016A9328);
}

- (void)_crlaxSetPerformingUndoOrRedo:(BOOL)a3
{
}

- (BOOL)crlaxIsPerformingUndoOrRedo
{
  return [(CRLUndoManagerAccessibility *)self _crlaxIsPerformingUndoOrRedo];
}

- (void)undo
{
  BOOL v3 = [(CRLUndoManagerAccessibility *)self crlaxIsPerformingUndoOrRedo];
  [(CRLUndoManagerAccessibility *)self _crlaxSetPerformingUndoOrRedo:1];
  v4.receiver = self;
  v4.super_class = (Class)CRLUndoManagerAccessibility;
  [(CRLUndoManagerAccessibility *)&v4 undo];
  [(CRLUndoManagerAccessibility *)self _crlaxSetPerformingUndoOrRedo:v3];
  if ([(CRLUndoManagerAccessibility *)self crlaxRespondsToSelector:"crlaxDidUndo" fromExtrasProtocol:&OBJC_PROTOCOL___CRLUndoManagerAccessibilityExtras])[(CRLUndoManagerAccessibility *)self crlaxDidUndo]; {
}
  }

- (void)redo
{
  BOOL v3 = [(CRLUndoManagerAccessibility *)self crlaxIsPerformingUndoOrRedo];
  [(CRLUndoManagerAccessibility *)self _crlaxSetPerformingUndoOrRedo:1];
  v4.receiver = self;
  v4.super_class = (Class)CRLUndoManagerAccessibility;
  [(CRLUndoManagerAccessibility *)&v4 redo];
  [(CRLUndoManagerAccessibility *)self _crlaxSetPerformingUndoOrRedo:v3];
  if ([(CRLUndoManagerAccessibility *)self crlaxRespondsToSelector:"crlaxDidRedo" fromExtrasProtocol:&OBJC_PROTOCOL___CRLUndoManagerAccessibilityExtras])[(CRLUndoManagerAccessibility *)self crlaxDidRedo]; {
}
  }

@end