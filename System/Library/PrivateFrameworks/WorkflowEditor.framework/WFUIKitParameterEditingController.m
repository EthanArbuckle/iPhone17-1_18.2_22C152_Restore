@interface WFUIKitParameterEditingController
- (WFUIKitParameterEditingControllerDelegate)delegate;
- (void)createViewControllerWithInitialState:(id)a3 completionHandler:(id)a4;
- (void)setDelegate:(id)a3;
@end

@implementation WFUIKitParameterEditingController

- (void).cxx_destruct
{
}

- (void)setDelegate:(id)a3
{
}

- (WFUIKitParameterEditingControllerDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (WFUIKitParameterEditingControllerDelegate *)WeakRetained;
}

- (void)createViewControllerWithInitialState:(id)a3 completionHandler:(id)a4
{
}

@end