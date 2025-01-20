@interface URTDefaultDestinationPresentation
- (URTAlert)alert;
- (URTDefaultDestinationPresentation)initWithAlert:(id)a3 forDestination:(int64_t)a4 preferredPresentationStyle:(int64_t)a5;
- (URTDestinationPresentationDelegate)delegate;
- (int64_t)destination;
- (int64_t)preferredPresentationStyle;
- (void)_invokeDelegateForResponseFlags:(unint64_t)a3;
- (void)invalidate;
- (void)present;
- (void)setDelegate:(id)a3;
@end

@implementation URTDefaultDestinationPresentation

- (URTDefaultDestinationPresentation)initWithAlert:(id)a3 forDestination:(int64_t)a4 preferredPresentationStyle:(int64_t)a5
{
  id v9 = a3;
  v10 = [v9 userNotificationRepresentation];
  v13.receiver = self;
  v13.super_class = (Class)URTDefaultDestinationPresentation;
  v11 = [(URTUserNotificationPresentation *)&v13 initWithContents:v10 flags:3];

  if (v11)
  {
    objc_storeStrong((id *)&v11->_alert, a3);
    v11->_destination = a4;
    v11->_preferredPresentationStyle = a5;
  }

  return v11;
}

- (void)invalidate
{
  if (self->_runLoopSource)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopRemoveSource(Main, self->_runLoopSource, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    CFRelease(self->_runLoopSource);
    self->_runLoopSource = 0;
  }
  v4.receiver = self;
  v4.super_class = (Class)URTDefaultDestinationPresentation;
  [(URTUserNotificationPresentation *)&v4 invalidate];
}

- (void)present
{
  v8.receiver = self;
  v8.super_class = (Class)URTDefaultDestinationPresentation;
  [(URTUserNotificationPresentation *)&v8 present];
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x263EF8330];
  v5[1] = 3221225472;
  v5[2] = __44__URTDefaultDestinationPresentation_present__block_invoke;
  v5[3] = &unk_26479A8B8;
  objc_copyWeak(&v6, &location);
  v3 = [(URTUserNotificationPresentation *)self createRunLoopSourceOrdered:0 handler:v5];
  if (v3)
  {
    Main = CFRunLoopGetMain();
    CFRunLoopAddSource(Main, v3, (CFRunLoopMode)*MEMORY[0x263EFFE88]);
    self->_runLoopSource = v3;
  }
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

void __44__URTDefaultDestinationPresentation_present__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _invokeDelegateForResponseFlags:a3];
}

- (void)_invokeDelegateForResponseFlags:(unint64_t)a3
{
  switch(a3 & 3)
  {
    case 2uLL:
      id v6 = [(URTDefaultDestinationPresentation *)self delegate];
      char v7 = objc_opt_respondsToSelector();

      if ((v7 & 1) == 0) {
        return;
      }
      id v10 = [(URTDefaultDestinationPresentation *)self delegate];
      [v10 handleOtherActionForAlertPresentation:self];
      break;
    case 1uLL:
      objc_super v8 = [(URTDefaultDestinationPresentation *)self delegate];
      char v9 = objc_opt_respondsToSelector();

      if ((v9 & 1) == 0) {
        return;
      }
      id v10 = [(URTDefaultDestinationPresentation *)self delegate];
      [v10 handleCancelActionForAlertPresentation:self];
      break;
    case 0uLL:
      objc_super v4 = [(URTDefaultDestinationPresentation *)self delegate];
      char v5 = objc_opt_respondsToSelector();

      if ((v5 & 1) == 0) {
        return;
      }
      id v10 = [(URTDefaultDestinationPresentation *)self delegate];
      [v10 handleDefaultActionForAlertPresentation:self];
      break;
    default:
      return;
  }
}

- (URTAlert)alert
{
  return self->_alert;
}

- (int64_t)destination
{
  return self->_destination;
}

- (URTDestinationPresentationDelegate)delegate
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  return (URTDestinationPresentationDelegate *)WeakRetained;
}

- (void)setDelegate:(id)a3
{
}

- (int64_t)preferredPresentationStyle
{
  return self->_preferredPresentationStyle;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_alert, 0);
}

@end