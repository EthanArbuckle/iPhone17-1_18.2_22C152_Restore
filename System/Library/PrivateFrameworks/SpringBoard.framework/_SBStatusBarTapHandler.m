@interface _SBStatusBarTapHandler
- (BOOL)canRequestUnlock;
- (BOOL)handleTap;
- (void)initWithApplicationDestination:(void *)a1;
- (void)initWithBlock:(void *)a1;
- (void)initWithURL:(void *)a1;
@end

@implementation _SBStatusBarTapHandler

- (BOOL)handleTap
{
  if (a1)
  {
    v2 = (void *)a1[1];
    if (v2)
    {
      SBWorkspaceActivateApplicationFromURL(v2, 0, 0);
    }
    else
    {
      uint64_t v3 = a1[2];
      if (v3)
      {
        (*(void (**)(void))(v3 + 16))();
      }
      else
      {
        v4 = (void *)a1[3];
        if (v4)
        {
          v5 = [v4 bundleIdentifier];
          v6 = SBWorkspaceApplicationForIdentifier(v5);

          if (v6)
          {
            v7 = +[SBWorkspace mainWorkspace];
            v10[0] = MEMORY[0x1E4F143A8];
            v10[1] = 3221225472;
            v10[2] = __35___SBStatusBarTapHandler_handleTap__block_invoke;
            v10[3] = &unk_1E6AF67B0;
            v10[4] = a1;
            id v11 = v6;
            [v7 requestTransitionWithBuilder:v10];
          }
        }
        else
        {
          v8 = [MEMORY[0x1E4F28B00] currentHandler];
          [v8 handleFailureInMethod:sel_handleTap object:a1 file:@"SBStatusBarTapManager.m" lineNumber:441 description:@"not valid to have a tap handler without the ability to handle anything!"];
        }
      }
    }
  }
  return a1 != 0;
}

- (BOOL)canRequestUnlock
{
  if (result) {
    return *(void *)(result + 24) != 0;
  }
  return result;
}

- (void)initWithApplicationDestination:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_SBStatusBarTapHandler;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[3];
      a1[3] = v4;
    }
  }

  return a1;
}

- (void)initWithURL:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_SBStatusBarTapHandler;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[1];
      a1[1] = v4;
    }
  }

  return a1;
}

- (void)initWithBlock:(void *)a1
{
  id v3 = a2;
  if (a1)
  {
    v7.receiver = a1;
    v7.super_class = (Class)_SBStatusBarTapHandler;
    a1 = objc_msgSendSuper2(&v7, sel_init);
    if (a1)
    {
      uint64_t v4 = [v3 copy];
      v5 = (void *)a1[2];
      a1[2] = v4;
    }
  }

  return a1;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_appDestination, 0);
  objc_storeStrong(&self->_block, 0);
  objc_storeStrong((id *)&self->_url, 0);
}

@end