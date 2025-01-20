@interface _UIPresentationControllerVisualStyle
- (UIPresentationController)presentationController;
- (_UIPresentationControllerVisualStyle)initWithPresentationController:(id)a3;
- (id)preferredAnimationControllerForPresentation:(BOOL)a3;
@end

@implementation _UIPresentationControllerVisualStyle

- (_UIPresentationControllerVisualStyle)initWithPresentationController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)_UIPresentationControllerVisualStyle;
  result = [(_UIPresentationControllerVisualStyle *)&v5 init];
  if (result) {
    result->_presentationController = (UIPresentationController *)a3;
  }
  return result;
}

- (id)preferredAnimationControllerForPresentation:(BOOL)a3
{
  return 0;
}

- (UIPresentationController)presentationController
{
  return self->_presentationController;
}

@end