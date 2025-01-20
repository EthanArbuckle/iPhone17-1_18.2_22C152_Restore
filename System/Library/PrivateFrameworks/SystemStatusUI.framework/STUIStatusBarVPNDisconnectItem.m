@interface STUIStatusBarVPNDisconnectItem
- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4;
- (NSTimer)slashBeginTimer;
- (STUIStatusBarVPNDisconnectView)disconnectView;
- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4;
- (id)dependentEntryKeys;
- (void)_create_disconnectView;
- (void)setDisconnectView:(id)a3;
- (void)setSlashBeginTimer:(id)a3;
@end

@implementation STUIStatusBarVPNDisconnectItem

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA9808]];
}

- (BOOL)canEnableDisplayItem:(id)a3 fromData:(id)a4
{
  v4 = [a4 valueForKey:*MEMORY[0x1E4FA9808]];
  v5 = v4;
  if (v4) {
    int v6 = [v4 isEnabled] ^ 1;
  }
  else {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (STUIStatusBarVPNDisconnectView)disconnectView
{
  disconnectView = self->_disconnectView;
  if (!disconnectView)
  {
    [(STUIStatusBarVPNDisconnectItem *)self _create_disconnectView];
    disconnectView = self->_disconnectView;
  }
  return disconnectView;
}

- (void)_create_disconnectView
{
  v3 = [STUIStatusBarVPNDisconnectView alloc];
  v4 = -[STUIStatusBarVPNDisconnectView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  disconnectView = self->_disconnectView;
  self->_disconnectView = v4;
  MEMORY[0x1F41817F8](v4, disconnectView);
}

- (id)applyUpdate:(id)a3 toDisplayItem:(id)a4
{
  id v6 = a3;
  v13.receiver = self;
  v13.super_class = (Class)STUIStatusBarVPNDisconnectItem;
  id v7 = a4;
  v8 = [(STUIStatusBarItem *)&v13 applyUpdate:v6 toDisplayItem:v7];
  int v9 = objc_msgSend(v7, "isEnabled", v13.receiver, v13.super_class);

  if (v9 && [v6 dataChanged])
  {
    v10 = [(STUIStatusBarVPNDisconnectItem *)self disconnectView];
    [v10 resetSlashForUpdate:v6];

    v11 = [(STUIStatusBarVPNDisconnectItem *)self disconnectView];
    [v11 animateSlashForUpdate:v6];
  }
  return v8;
}

- (void)setDisconnectView:(id)a3
{
}

- (NSTimer)slashBeginTimer
{
  return self->_slashBeginTimer;
}

- (void)setSlashBeginTimer:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_slashBeginTimer, 0);
  objc_storeStrong((id *)&self->_disconnectView, 0);
}

@end