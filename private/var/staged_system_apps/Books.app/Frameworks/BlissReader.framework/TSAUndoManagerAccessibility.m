@interface TSAUndoManagerAccessibility
+ (Class)tsaxBaseSafeCategoryClass;
+ (id)tsaxTargetClassName;
- (BOOL)_tsaxIsPerformingUndoOrRedo;
- (BOOL)tsaxIsPerformingUndoOrRedo;
- (void)_tsaxSetPerformingUndoOrRedo:(BOOL)a3;
- (void)redo;
- (void)tsaxDidRedo;
- (void)tsaxDidUndo;
- (void)undo;
@end

@implementation TSAUndoManagerAccessibility

- (void)tsaxDidUndo
{
  UIAccessibilityNotifications v2 = UIAccessibilityAnnouncementNotification;
  UIKitLocalizedString = TSAccessibilityGetUIKitLocalizedString(@"AXTextOperationActionUndo");

  UIAccessibilityPostNotification(v2, UIKitLocalizedString);
}

- (void)tsaxDidRedo
{
  UIAccessibilityNotifications v2 = UIAccessibilityAnnouncementNotification;
  UIKitLocalizedString = TSAccessibilityGetUIKitLocalizedString(@"AXTextOperationActionRedo");

  UIAccessibilityPostNotification(v2, UIKitLocalizedString);
}

+ (id)tsaxTargetClassName
{
  return @"TSAUndoManager";
}

+ (Class)tsaxBaseSafeCategoryClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_tsaxIsPerformingUndoOrRedo
{
  return __TSAccessibilityGetAssociatedBool(self, &unk_5738D5);
}

- (void)_tsaxSetPerformingUndoOrRedo:(BOOL)a3
{
}

- (BOOL)tsaxIsPerformingUndoOrRedo
{
  return [(TSAUndoManagerAccessibility *)self _tsaxIsPerformingUndoOrRedo];
}

- (void)undo
{
  BOOL v3 = [(TSAUndoManagerAccessibility *)self tsaxIsPerformingUndoOrRedo];
  [(TSAUndoManagerAccessibility *)self _tsaxSetPerformingUndoOrRedo:1];
  v4.receiver = self;
  v4.super_class = (Class)TSAUndoManagerAccessibility;
  [(TSAUndoManagerAccessibility *)&v4 undo];
  [(TSAUndoManagerAccessibility *)self _tsaxSetPerformingUndoOrRedo:v3];
  if ([(TSAUndoManagerAccessibility *)self tsaxRespondsToSelector:"tsaxDidUndo" fromExtrasProtocol:&OBJC_PROTOCOL___TSAUndoManagerAccessibilityExtras])[(TSAUndoManagerAccessibility *)self tsaxDidUndo]; {
}
  }

- (void)redo
{
  BOOL v3 = [(TSAUndoManagerAccessibility *)self tsaxIsPerformingUndoOrRedo];
  [(TSAUndoManagerAccessibility *)self _tsaxSetPerformingUndoOrRedo:1];
  v4.receiver = self;
  v4.super_class = (Class)TSAUndoManagerAccessibility;
  [(TSAUndoManagerAccessibility *)&v4 redo];
  [(TSAUndoManagerAccessibility *)self _tsaxSetPerformingUndoOrRedo:v3];
  if ([(TSAUndoManagerAccessibility *)self tsaxRespondsToSelector:"tsaxDidRedo" fromExtrasProtocol:&OBJC_PROTOCOL___TSAUndoManagerAccessibilityExtras])[(TSAUndoManagerAccessibility *)self tsaxDidRedo]; {
}
  }

@end