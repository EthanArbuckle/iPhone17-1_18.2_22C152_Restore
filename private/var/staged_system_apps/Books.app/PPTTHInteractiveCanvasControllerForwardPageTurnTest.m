@interface PPTTHInteractiveCanvasControllerForwardPageTurnTest
- (void)turnPage;
@end

@implementation PPTTHInteractiveCanvasControllerForwardPageTurnTest

- (void)turnPage
{
  id v2 = [(PPTBasicTest *)self bookController];
  +[THTestDriver turnPageWithBookController:v2 direction:1];
}

@end