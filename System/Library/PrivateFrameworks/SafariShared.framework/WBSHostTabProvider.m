@interface WBSHostTabProvider
- (WBSHostableTab)hostTab;
- (void)_setHostTab:(id)a3;
- (void)setHostTab:(id)a3;
@end

@implementation WBSHostTabProvider

- (void)setHostTab:(id)a3
{
  id v5 = a3;
  [(WBSHostTabProvider *)self _setHostTab:v5];
  if (v5)
  {
    v4 = +[WBSHostTabProviderManager sharedManager];
    [v4 registerHostTab:v5];
  }
}

- (void)_setHostTab:(id)a3
{
  id v5 = (WBSHostableTab *)a3;
  hostTab = self->_hostTab;
  if (hostTab != v5)
  {
    v8 = v5;
    v7 = hostTab;
    objc_storeStrong((id *)&self->_hostTab, a3);
    if (v7) {
      [(WBSHostableTab *)v7 setHostTabProvider:self];
    }
    if (v8) {
      [(WBSHostableTab *)v8 setHostTabProvider:0];
    }

    id v5 = v8;
  }
}

- (WBSHostableTab)hostTab
{
  return self->_hostTab;
}

- (void).cxx_destruct
{
}

@end