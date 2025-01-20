@interface AdPresentationDelegate
- (id)viewControllerToPresentFrom;
@end

@implementation AdPresentationDelegate

- (id)viewControllerToPresentFrom
{
  id v2 = (id)MEMORY[0x1C18C9C60](self->viewController, a2);
  if (!v2) {
    id v2 = objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EC0]), sel_init);
  }
  return v2;
}

@end