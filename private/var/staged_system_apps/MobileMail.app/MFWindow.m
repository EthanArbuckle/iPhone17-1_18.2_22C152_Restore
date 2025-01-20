@interface MFWindow
- (BOOL)canBecomeFirstResponder;
- (MFWindowDelegate)delegate;
- (id)touchEventListener;
- (id)undoManager;
- (void)_compositionStateChanged:(id)a3;
- (void)becomeKeyWindow;
- (void)resignKeyWindow;
- (void)sendEvent:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setTouchEventListener:(id)a3;
@end

@implementation MFWindow

- (void)becomeKeyWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MFWindow;
  [(MFWindow *)&v4 becomeKeyWindow];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 addObserver:self selector:"_compositionStateChanged:" name:MFMailComposeViewDidShow object:0];
  [v3 addObserver:self selector:"_compositionStateChanged:" name:MFMailComposeViewDidDismiss object:0];
}

- (void)setDelegate:(id)a3
{
}

- (BOOL)canBecomeFirstResponder
{
  return 0;
}

- (void)sendEvent:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)MFWindow;
  [(MFWindow *)&v7 sendEvent:v4];
  touchEventListener = (void (**)(id, void *))self->_touchEventListener;
  if (touchEventListener)
  {
    v6 = [v4 allTouches];
    touchEventListener[2](touchEventListener, v6);
  }
}

- (id)undoManager
{
  v3 = [(MFWindow *)self delegate];
  id v4 = [v3 undoManagerForWindow:self];
  v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MFWindow;
    id v6 = [(MFWindow *)&v9 undoManager];
  }
  objc_super v7 = v6;

  return v7;
}

- (void)resignKeyWindow
{
  v4.receiver = self;
  v4.super_class = (Class)MFWindow;
  [(MFWindow *)&v4 resignKeyWindow];
  v3 = +[NSNotificationCenter defaultCenter];
  [v3 removeObserver:self name:MFMailComposeViewDidShow object:0];
  [v3 removeObserver:self name:MFMailComposeViewDidDismiss object:0];
}

- (void)_compositionStateChanged:(id)a3
{
  id v7 = a3;
  objc_super v4 = [v7 userInfo];
  v5 = [v4 objectForKeyedSubscript:MFMailComposeViewWindowKey];

  if (v5 == self)
  {
    id v6 = [v7 name];
    self->_composeActive = [v6 isEqualToString:MFMailComposeViewDidShow];
  }
}

- (id)touchEventListener
{
  return self->_touchEventListener;
}

- (void)setTouchEventListener:(id)a3
{
}

- (MFWindowDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);

  return (MFWindowDelegate *)WeakRetained;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);

  objc_storeStrong(&self->_touchEventListener, 0);
}

@end