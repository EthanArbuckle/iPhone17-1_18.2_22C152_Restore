@interface VideoAdInteractionPresentationHandler
- (id)viewControllerToPresentFrom;
@end

@implementation VideoAdInteractionPresentationHandler

- (id)viewControllerToPresentFrom
{
  Strong = (void *)swift_unknownObjectUnownedLoadStrong();
  swift_retain();
  id v3 = objc_msgSend(Strong, sel_viewControllerForModalPresentation);
  swift_release();

  return v3;
}

@end