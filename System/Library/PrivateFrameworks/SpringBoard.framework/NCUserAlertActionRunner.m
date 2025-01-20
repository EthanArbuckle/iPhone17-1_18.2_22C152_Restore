@interface NCUserAlertActionRunner
- (BOOL)shouldForwardAction;
- (NCUserAlertActionRunner)initWithSBAlertItem:(id)a3;
- (SBAlertItem)alertItem;
- (void)setShouldForwardAction:(BOOL)a3;
@end

@implementation NCUserAlertActionRunner

- (NCUserAlertActionRunner)initWithSBAlertItem:(id)a3
{
  id v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)NCUserAlertActionRunner;
  v5 = [(NCUserAlertActionRunner *)&v8 init];
  v6 = v5;
  if (v5) {
    objc_storeWeak((id *)&v5->_alertItem, v4);
  }

  return v6;
}

- (BOOL)shouldForwardAction
{
  return self->_shouldForwardAction;
}

- (void)setShouldForwardAction:(BOOL)a3
{
  self->_shouldForwardAction = a3;
}

- (SBAlertItem)alertItem
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_alertItem);
  return (SBAlertItem *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end