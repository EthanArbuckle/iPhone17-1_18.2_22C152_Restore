@interface STUIStatusBarVPNItem
- (STUIStatusBarStringView)vpnView;
- (id)dependentEntryKeys;
- (void)_create_vpnView;
- (void)setVpnView:(id)a3;
@end

@implementation STUIStatusBarVPNItem

- (id)dependentEntryKeys
{
  return (id)[MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4FA9808]];
}

- (void).cxx_destruct
{
}

- (STUIStatusBarStringView)vpnView
{
  vpnView = self->_vpnView;
  if (!vpnView)
  {
    [(STUIStatusBarVPNItem *)self _create_vpnView];
    vpnView = self->_vpnView;
  }
  return vpnView;
}

- (void)_create_vpnView
{
  v3 = [STUIStatusBarStringView alloc];
  v4 = -[STUIStatusBarStringView initWithFrame:](v3, "initWithFrame:", *MEMORY[0x1E4F1DB28], *(double *)(MEMORY[0x1E4F1DB28] + 8), *(double *)(MEMORY[0x1E4F1DB28] + 16), *(double *)(MEMORY[0x1E4F1DB28] + 24));
  vpnView = self->_vpnView;
  self->_vpnView = v4;

  [(STUIStatusBarStringView *)self->_vpnView setText:@"VPN"];
  v6 = self->_vpnView;
  [(STUIStatusBarStringView *)v6 setEncapsulated:1];
}

- (void)setVpnView:(id)a3
{
}

@end