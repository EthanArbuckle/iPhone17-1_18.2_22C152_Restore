@interface SBLockScreenPluginCallAction
- (BOOL)isCallAction;
- (NSURL)url;
- (SBLockScreenPluginCallAction)initWithURL:(id)a3;
@end

@implementation SBLockScreenPluginCallAction

- (SBLockScreenPluginCallAction)initWithURL:(id)a3
{
  v4 = (objc_class *)MEMORY[0x263F7E230];
  id v5 = a3;
  v6 = (void *)[[v4 alloc] initWithURL:v5];

  if ([v6 isValid])
  {
    v11.receiver = self;
    v11.super_class = (Class)SBLockScreenPluginCallAction;
    v7 = [(SBLockScreenPluginAction *)&v11 init];
    v8 = v7;
    if (v7) {
      objc_storeStrong((id *)&v7->_dialRequest, v6);
    }
    self = v8;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSURL)url
{
  return (NSURL *)[(TUDialRequest *)self->_dialRequest URL];
}

- (BOOL)isCallAction
{
  return 1;
}

- (void).cxx_destruct
{
}

@end