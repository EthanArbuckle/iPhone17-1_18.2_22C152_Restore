@interface _UIAlertControllerInterfaceActionGroupView
- (BOOL)_shouldInstallContentGuideConstraints;
- (BOOL)_shouldShowSeparatorAboveActionsSequenceView;
- (BOOL)scrollableHeaderViewHasRealContent;
- (UIAlertController)alertController;
- (_UIAlertControllerInterfaceActionGroupView)initWithAlertController:(id)a3 actionGroup:(id)a4 actionHandlerInvocationDelegate:(id)a5;
- (id)_alertController;
- (id)defaultVisualStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4;
- (void)setAlertController:(id)a3;
- (void)setScrollableHeaderViewHasRealContent:(BOOL)a3;
@end

@implementation _UIAlertControllerInterfaceActionGroupView

- (_UIAlertControllerInterfaceActionGroupView)initWithAlertController:(id)a3 actionGroup:(id)a4 actionHandlerInvocationDelegate:(id)a5
{
  id v8 = a3;
  v12.receiver = self;
  v12.super_class = (Class)_UIAlertControllerInterfaceActionGroupView;
  v9 = [(UIInterfaceActionGroupView *)&v12 initWithActionGroup:a4 actionHandlerInvocationDelegate:a5];
  v10 = v9;
  if (v9) {
    [(_UIAlertControllerInterfaceActionGroupView *)v9 setAlertController:v8];
  }

  return v10;
}

- (id)_alertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  return WeakRetained;
}

- (id)defaultVisualStyleForTraitCollection:(id)a3 presentationStyle:(int64_t)a4
{
  id v6 = a3;
  v7 = [(_UIAlertControllerInterfaceActionGroupView *)self _alertController];
  id v8 = [v7 _visualStyle];

  if (v8)
  {
    uint64_t v9 = [v8 interfaceActionVisualStyle];
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)_UIAlertControllerInterfaceActionGroupView;
    uint64_t v9 = [(UIInterfaceActionGroupView *)&v12 defaultVisualStyleForTraitCollection:v6 presentationStyle:a4];
  }
  v10 = (void *)v9;

  return v10;
}

- (BOOL)_shouldShowSeparatorAboveActionsSequenceView
{
  v5.receiver = self;
  v5.super_class = (Class)_UIAlertControllerInterfaceActionGroupView;
  BOOL v3 = [(UIInterfaceActionGroupView *)&v5 _shouldShowSeparatorAboveActionsSequenceView];
  if (v3) {
    LOBYTE(v3) = [(_UIAlertControllerInterfaceActionGroupView *)self scrollableHeaderViewHasRealContent];
  }
  return v3;
}

- (BOOL)_shouldInstallContentGuideConstraints
{
  return 0;
}

- (UIAlertController)alertController
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertController);
  return (UIAlertController *)WeakRetained;
}

- (void)setAlertController:(id)a3
{
}

- (BOOL)scrollableHeaderViewHasRealContent
{
  return self->_scrollableHeaderViewHasRealContent;
}

- (void)setScrollableHeaderViewHasRealContent:(BOOL)a3
{
  self->_scrollableHeaderViewHasRealContent = a3;
}

- (void).cxx_destruct
{
}

@end