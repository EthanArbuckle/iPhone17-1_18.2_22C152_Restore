@interface _UIKeyShortcutHUDServerSession
- (UIWindow)keyWindow;
- (_UIOServiceConnection)connection;
- (void)setConnection:(id)a3;
- (void)setKeyWindow:(id)a3;
@end

@implementation _UIKeyShortcutHUDServerSession

- (UIWindow)keyWindow
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_keyWindow);
  return (UIWindow *)WeakRetained;
}

- (void)setKeyWindow:(id)a3
{
}

- (_UIOServiceConnection)connection
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_connection);
  return (_UIOServiceConnection *)WeakRetained;
}

- (void)setConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_connection);
  objc_destroyWeak((id *)&self->_keyWindow);
}

@end