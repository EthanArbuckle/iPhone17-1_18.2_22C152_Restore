@interface THWInteractiveImageWidgetController
- (BOOL)transportControl:(id)a3 isInteractionEnabledForRep:(id)a4;
- (THWInteractiveImageRadioPanelRep)transportControlsRep;
- (THWInteractiveImageWidgetController)initWithLayout:(id)a3;
- (THWInteractiveImageWidgetControllerDelegate)delegate;
- (THWInteractiveImageWidgetLayout)layout;
- (unint64_t)calloutIndex;
- (void)dealloc;
- (void)selectOption:(unint64_t)a3;
- (void)selectOption:(unint64_t)a3 contentOffset:(CGPoint)a4 force:(BOOL)a5 animated:(BOOL)a6;
- (void)selectOption:(unint64_t)a3 force:(BOOL)a4 animated:(BOOL)a5;
- (void)setCalloutIndex:(unint64_t)a3;
- (void)setDelegate:(id)a3;
- (void)setLayout:(id)a3;
- (void)setTransportControlsRep:(id)a3;
- (void)transportControl:(id)a3 calloutOptionSelected:(unint64_t)a4;
@end

@implementation THWInteractiveImageWidgetController

- (THWInteractiveImageWidgetController)initWithLayout:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)THWInteractiveImageWidgetController;
  result = [(THWInteractiveImageWidgetController *)&v5 init];
  if (result) {
    result->_layout = (THWInteractiveImageWidgetLayout *)a3;
  }
  return result;
}

- (void)dealloc
{
  self->_layout = 0;

  self->_transportControlsRep = 0;
  v3.receiver = self;
  v3.super_class = (Class)THWInteractiveImageWidgetController;
  [(THWInteractiveImageWidgetController *)&v3 dealloc];
}

- (void)selectOption:(unint64_t)a3
{
}

- (void)selectOption:(unint64_t)a3 force:(BOOL)a4 animated:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  if (a4) {
    unint64_t v8 = a3;
  }
  else {
    unint64_t v8 = 0;
  }
  unint64_t calloutIndex = self->_calloutIndex;
  layout = self->_layout;
  if (calloutIndex == a3) {
    unint64_t v11 = v8;
  }
  else {
    unint64_t v11 = a3;
  }
  objc_msgSend(objc_msgSend(-[THWInteractiveImageWidgetLayout info](layout, "info"), "calloutAtIndex:", v11), "contentOffset");

  -[THWInteractiveImageWidgetController selectOption:contentOffset:force:animated:](self, "selectOption:contentOffset:force:animated:", v11, v6, v5);
}

- (void)selectOption:(unint64_t)a3 contentOffset:(CGPoint)a4 force:(BOOL)a5 animated:(BOOL)a6
{
  BOOL v6 = a6;
  double y = a4.y;
  double x = a4.x;
  if (!+[NSThread isMainThread]) {
    [+[TSUAssertionHandler currentHandler](TSUAssertionHandler, "currentHandler") handleFailureInFunction:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "-[THWInteractiveImageWidgetController selectOption:contentOffset:force:animated:]") file:+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Alder/bliss/Classes/Widgets/InteractiveImage/THWInteractiveImageWidgetRep.m") lineNumber:2481 description:@"This operation must only be performed on the main thread."];
  }
  if (a5
    || [(THWInteractiveImageWidgetControllerDelegate *)self->_delegate userInteractionEnabled])
  {
    [(THWInteractiveImageWidgetControllerDelegate *)self->_delegate setUserInteractionEnabled:0];
    unint64_t calloutIndex = self->_calloutIndex;
    layout = self->_layout;
    self->_unint64_t calloutIndex = a3;
    [(THWInteractiveImageWidgetLayout *)layout setSelectedCalloutIndex:a3];
    [(THWInteractiveImageWidgetControllerDelegate *)self->_delegate selectedCalloutIndexUpdatedAnimated:v6];
    -[THWInteractiveImageWidgetControllerDelegate changeToViewport:previousCalloutIndex:contentOffset:animated:](self->_delegate, "changeToViewport:previousCalloutIndex:contentOffset:animated:", a3, calloutIndex, v6, x, y);
    transportControlsRep = self->_transportControlsRep;
    [(THWInteractiveImageRadioPanelRep *)transportControlsRep setSelectedCallout:a3];
  }
}

- (void)transportControl:(id)a3 calloutOptionSelected:(unint64_t)a4
{
}

- (BOOL)transportControl:(id)a3 isInteractionEnabledForRep:(id)a4
{
  return [(THWInteractiveImageWidgetControllerDelegate *)self->_delegate userInteractionEnabled];
}

- (THWInteractiveImageWidgetControllerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (THWInteractiveImageWidgetControllerDelegate *)a3;
}

- (THWInteractiveImageRadioPanelRep)transportControlsRep
{
  return self->_transportControlsRep;
}

- (void)setTransportControlsRep:(id)a3
{
}

- (unint64_t)calloutIndex
{
  return self->_calloutIndex;
}

- (void)setCalloutIndex:(unint64_t)a3
{
  self->_unint64_t calloutIndex = a3;
}

- (THWInteractiveImageWidgetLayout)layout
{
  return self->_layout;
}

- (void)setLayout:(id)a3
{
  self->_layout = (THWInteractiveImageWidgetLayout *)a3;
}

@end