@interface _UIPopoverHostManagerMac
- (BOOL)shouldOccludeDuringPresentationForPopoverWithIdentifier:(id)a3;
- (BOOL)useDefaultPreferredAnimationControllerForDismissalWithPopoverWithIdentifier:(id)a3;
- (BOOL)useDefaultPreferredAnimationControllerForPresentationWithPopoverWithIdentifier:(id)a3;
- (BOOL)useDefaultPresentationViewForPopoverWithIdentifier:(id)a3;
- (id)createPopoverWithConfiguration:(id)a3;
- (id)popoverSceneForPopoverWithIdentifier:(id)a3;
@end

@implementation _UIPopoverHostManagerMac

- (id)createPopoverWithConfiguration:(id)a3
{
  return 0;
}

- (BOOL)shouldOccludeDuringPresentationForPopoverWithIdentifier:(id)a3
{
  return 0;
}

- (BOOL)useDefaultPresentationViewForPopoverWithIdentifier:(id)a3
{
  return 1;
}

- (BOOL)useDefaultPreferredAnimationControllerForPresentationWithPopoverWithIdentifier:(id)a3
{
  return 1;
}

- (BOOL)useDefaultPreferredAnimationControllerForDismissalWithPopoverWithIdentifier:(id)a3
{
  return 1;
}

- (id)popoverSceneForPopoverWithIdentifier:(id)a3
{
  return 0;
}

@end