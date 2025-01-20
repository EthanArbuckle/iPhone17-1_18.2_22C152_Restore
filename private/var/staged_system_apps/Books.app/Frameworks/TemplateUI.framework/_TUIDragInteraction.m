@interface _TUIDragInteraction
- (TUIActionHandlerDelegate)actionHandlerDelegate;
- (TUIDragControllerDelegate)dragDelegate;
- (void)setActionHandlerDelegate:(id)a3;
- (void)setDragDelegate:(id)a3;
@end

@implementation _TUIDragInteraction

- (TUIActionHandlerDelegate)actionHandlerDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_actionHandlerDelegate);

  return (TUIActionHandlerDelegate *)WeakRetained;
}

- (void)setActionHandlerDelegate:(id)a3
{
}

- (TUIDragControllerDelegate)dragDelegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_dragDelegate);

  return (TUIDragControllerDelegate *)WeakRetained;
}

- (void)setDragDelegate:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dragDelegate);

  objc_destroyWeak((id *)&self->_actionHandlerDelegate);
}

@end