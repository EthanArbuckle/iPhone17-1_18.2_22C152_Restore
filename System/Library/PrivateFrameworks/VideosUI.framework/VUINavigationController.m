@interface VUINavigationController
- (UITapGestureRecognizer)gesture;
- (VUIDocumentUIConfiguration)configuration;
- (void)setConfiguration:(id)a3;
- (void)setGesture:(id)a3;
- (void)viewDidLayoutSubviews;
@end

@implementation VUINavigationController

- (void)viewDidLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)VUINavigationController;
  [(VUINavigationController *)&v5 viewDidLayoutSubviews];
  [(VUINavigationController *)self setNavigationBarHidden:[(VUIDocumentUIConfiguration *)self->_configuration isNavigationBarHidden]];
  if ([(VUIDocumentUIConfiguration *)self->_configuration isInteractivePopGestureAllowed])
  {
    v3 = [(VUINavigationController *)self interactivePopGestureRecognizer];
    [v3 setDelegate:self];

    v4 = [(VUINavigationController *)self interactivePopGestureRecognizer];
    [v4 setEnabled:1];
  }
}

- (UITapGestureRecognizer)gesture
{
  return self->_gesture;
}

- (void)setGesture:(id)a3
{
}

- (VUIDocumentUIConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_gesture, 0);
}

@end