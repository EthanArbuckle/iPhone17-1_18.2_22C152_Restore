@interface UIWebRotatingNodePopover
- (CGPoint)presentationPoint;
- (DOMNode)node;
- (UIPopoverController)popoverController;
- (UIWebRotatingNodePopover)initWithDOMNode:(id)a3;
- (UIWebRotatingNodePopoverDelegate)dismissDelegate;
- (unint64_t)popoverArrowDirections;
- (void)dealloc;
- (void)didRotate:(id)a3;
- (void)dismissPopoverAnimated:(BOOL)a3;
- (void)popoverControllerDidDismissPopover:(id)a3;
- (void)presentPopoverAnimated:(BOOL)a3;
- (void)setDismissDelegate:(id)a3;
- (void)setNode:(id)a3;
- (void)setPopoverController:(id)a3;
- (void)setPresentationPoint:(CGPoint)a3;
- (void)willRotate:(id)a3;
@end

@implementation UIWebRotatingNodePopover

- (UIWebRotatingNodePopover)initWithDOMNode:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)UIWebRotatingNodePopover;
  v5 = [(UIWebRotatingNodePopover *)&v10 init];
  v6 = v5;
  if (v5)
  {
    [(UIWebRotatingNodePopover *)v5 setNode:v4];
    -[UIWebRotatingNodePopover setPresentationPoint:](v6, "setPresentationPoint:", *MEMORY[0x1E4F1DAD8], *(double *)(MEMORY[0x1E4F1DAD8] + 8));
    v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 addObserver:v6 selector:sel_willRotate_ name:@"UIWindowWillRotateNotification" object:0];
    [v7 addObserver:v6 selector:sel_didRotate_ name:@"UIWindowDidRotateNotification" object:0];
    v8 = v6;
  }
  return v6;
}

- (void)dealloc
{
  v6[2] = *MEMORY[0x1E4F143B8];
  [(UIWebRotatingNodePopover *)self setNode:0];
  [(UIPopoverController *)self->_popoverController dismissPopoverAnimated:1];
  [(UIPopoverController *)self->_popoverController setDelegate:0];
  [(UIWebRotatingNodePopover *)self setPopoverController:0];
  v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  v6[0] = @"UIWindowWillRotateNotification";
  v6[1] = @"UIWindowDidRotateNotification";
  id v4 = [MEMORY[0x1E4F1C978] arrayWithObjects:v6 count:2];
  -[NSNotificationCenter _uiRemoveObserver:names:](v3, self, v4);

  v5.receiver = self;
  v5.super_class = (Class)UIWebRotatingNodePopover;
  [(UIWebRotatingNodePopover *)&v5 dealloc];
}

- (void)setPopoverController:(id)a3
{
  objc_super v5 = (UIPopoverController *)a3;
  popoverController = self->_popoverController;
  if (popoverController != v5)
  {
    v7 = v5;
    [(UIPopoverController *)popoverController setDelegate:0];
    objc_storeStrong((id *)&self->_popoverController, a3);
    [(UIPopoverController *)self->_popoverController setDelegate:self];
    objc_super v5 = v7;
  }
}

- (unint64_t)popoverArrowDirections
{
  return 15;
}

- (void)presentPopoverAnimated:(BOOL)a3
{
  BOOL v3 = a3;
  WebThreadLock();
  objc_super v5 = [(DOMNode *)self->_node ownerDocument];
  v6 = [v5 webFrame];

  v7 = +[UIWebBrowserView getUIWebBrowserViewForWebFrame:v6];
  unint64_t v8 = [(UIWebRotatingNodePopover *)self popoverArrowDirections];
  [(UIPopoverController *)self->_popoverController _setAllowsPopoverPresentationToAdapt:0];
  [(UIWebRotatingNodePopover *)self presentationPoint];
  if (v10 == *MEMORY[0x1E4F1DAD8] && v9 == *(double *)(MEMORY[0x1E4F1DAD8] + 8))
  {
    node = self->_node;
    if (node)
    {
      [(DOMNode *)node absoluteQuad];
    }
    else
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
    }
    [v7 convertRect:v6 fromFrame:quadBoundingBox((double *)&v21)];
    popoverController = self->_popoverController;
    CGRect v26 = CGRectIntegral(v27);
    v18 = popoverController;
  }
  else
  {
    [v7 _documentScale];
    double v13 = v12;
    v14 = self->_popoverController;
    [(UIWebRotatingNodePopover *)self presentationPoint];
    CGFloat v16 = v15 * v13;
    [(UIWebRotatingNodePopover *)self presentationPoint];
    v25.origin.y = v17 * v13;
    v25.size.width = 1.0;
    v25.size.height = 1.0;
    v25.origin.x = v16;
    CGRect v26 = CGRectIntegral(v25);
    v18 = v14;
  }
  -[UIPopoverController presentPopoverFromRect:inView:permittedArrowDirections:animated:](v18, "presentPopoverFromRect:inView:permittedArrowDirections:animated:", v7, v8, v3, v26.origin.x, v26.origin.y, v26.size.width, v26.size.height, v21, v22, v23, v24);
}

- (void)dismissPopoverAnimated:(BOOL)a3
{
}

- (void)willRotate:(id)a3
{
  self->_isRotating = 1;
  [(UIPopoverController *)self->_popoverController dismissPopoverAnimated:0];
}

- (void)didRotate:(id)a3
{
  self->_isRotating = 0;
  [(UIWebRotatingNodePopover *)self presentPopoverAnimated:0];
}

- (void)popoverControllerDidDismissPopover:(id)a3
{
  if (!self->_isRotating) {
    [(UIWebRotatingNodePopoverDelegate *)self->_dismissDelegate popoverWasDismissed:self];
  }
}

- (DOMNode)node
{
  return self->_node;
}

- (void)setNode:(id)a3
{
}

- (CGPoint)presentationPoint
{
  double x = self->_presentationPoint.x;
  double y = self->_presentationPoint.y;
  result.double y = y;
  result.double x = x;
  return result;
}

- (void)setPresentationPoint:(CGPoint)a3
{
  self->_presentationPoint = a3;
}

- (UIPopoverController)popoverController
{
  return self->_popoverController;
}

- (UIWebRotatingNodePopoverDelegate)dismissDelegate
{
  return self->_dismissDelegate;
}

- (void)setDismissDelegate:(id)a3
{
  self->_dismissDelegate = (UIWebRotatingNodePopoverDelegate *)a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_popoverController, 0);
  objc_storeStrong((id *)&self->_node, 0);
}

@end