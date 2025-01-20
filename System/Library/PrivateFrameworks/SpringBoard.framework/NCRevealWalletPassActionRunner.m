@interface NCRevealWalletPassActionRunner
- (BOOL)shouldForwardAction;
- (id)initWithCardItem:(id *)a1;
- (void)didPresentLockScreenPlugin:(id)a3;
- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7;
- (void)setPluginCompletionBlock:(void *)a1;
- (void)setShouldForwardAction:(BOOL)a3;
@end

@implementation NCRevealWalletPassActionRunner

- (id)initWithCardItem:(id *)a1
{
  id v4 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)NCRevealWalletPassActionRunner;
    v5 = (id *)objc_msgSendSuper2(&v7, sel_init);
    a1 = v5;
    if (v5) {
      objc_storeStrong(v5 + 2, a2);
    }
  }

  return a1;
}

- (void)executeAction:(id)a3 fromOrigin:(id)a4 endpoint:(id)a5 withParameters:(id)a6 completion:(id)a7
{
  newValue = (char *)a7;
  if (self) {
    cardItem = self->_cardItem;
  }
  else {
    cardItem = 0;
  }
  v9 = cardItem;
  v10 = [(SBSCardItem *)v9 userInfo];
  v11 = (void *)MEMORY[0x1E4FA7958];
  v12 = [(SBSCardItem *)v9 bundleName];

  v13 = [v11 contextWithName:v12];

  [v13 setUserInfo:v10];
  [v13 setObserver:self];
  if (self && newValue) {
    objc_setProperty_nonatomic_copy(self, newValue, newValue, 24);
  }
  v14 = +[SBLockScreenManager sharedInstance];
  v15 = [v14 lockScreenEnvironment];
  v16 = [v15 pluginPresenter];
  [v16 enableLockScreenPluginWithContext:v13];
}

- (void)setPluginCompletionBlock:(void *)a1
{
  if (a1) {
    objc_setProperty_nonatomic_copy(a1, newValue, newValue, 24);
  }
}

- (void)didPresentLockScreenPlugin:(id)a3
{
  if (self && self->_pluginCompletionBlock)
  {
    (*((void (**)(void))self->_pluginCompletionBlock + 2))();
    objc_setProperty_nonatomic_copy(self, v4, 0, 24);
  }
}

- (BOOL)shouldForwardAction
{
  return self->_shouldForwardAction;
}

- (void)setShouldForwardAction:(BOOL)a3
{
  self->_shouldForwardAction = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_pluginCompletionBlock, 0);
  objc_storeStrong((id *)&self->_cardItem, 0);
}

@end