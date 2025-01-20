@interface PSOAuthAccountRedirectURLController
+ (id)sharedInstance;
- (BOOL)handleOAuthRedirectURL:(id)a3;
- (NSMapTable)redirectHandlerMap;
- (PSOAuthAccountRedirectURLController)init;
- (id)_redirectURLFromURL:(id)a3;
- (void)registerOAuthClientForRedirectURL:(id)a3 redirectHandler:(id)a4;
- (void)setRedirectHandlerMap:(id)a3;
- (void)unRegisterOAuthClientForRedirectURL:(id)a3;
@end

@implementation PSOAuthAccountRedirectURLController

+ (id)sharedInstance
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __53__PSOAuthAccountRedirectURLController_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_oauthRedirectInstanceToken != -1) {
    dispatch_once(&sharedInstance_oauthRedirectInstanceToken, block);
  }
  v2 = (void *)sharedInstance___instance;
  return v2;
}

uint64_t __53__PSOAuthAccountRedirectURLController_sharedInstance__block_invoke(uint64_t a1)
{
  id v1 = objc_alloc_init(*(Class *)(a1 + 32));
  uint64_t v2 = sharedInstance___instance;
  sharedInstance___instance = (uint64_t)v1;
  return MEMORY[0x1F41817F8](v1, v2);
}

- (PSOAuthAccountRedirectURLController)init
{
  v5.receiver = self;
  v5.super_class = (Class)PSOAuthAccountRedirectURLController;
  uint64_t v2 = [(PSOAuthAccountRedirectURLController *)&v5 init];
  if (v2)
  {
    v3 = [MEMORY[0x1E4F28E10] strongToWeakObjectsMapTable];
    [(PSOAuthAccountRedirectURLController *)v2 setRedirectHandlerMap:v3];
  }
  return v2;
}

- (void)registerOAuthClientForRedirectURL:(id)a3 redirectHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v9 = [(PSOAuthAccountRedirectURLController *)self redirectHandlerMap];
  v8 = (void *)[v6 copy];

  [v9 setObject:v8 forKey:v7];
}

- (void)unRegisterOAuthClientForRedirectURL:(id)a3
{
  id v4 = a3;
  id v5 = [(PSOAuthAccountRedirectURLController *)self redirectHandlerMap];
  [v5 removeObjectForKey:v4];
}

- (BOOL)handleOAuthRedirectURL:(id)a3
{
  id v4 = a3;
  id v5 = [(PSOAuthAccountRedirectURLController *)self _redirectURLFromURL:v4];
  for (id i = 0; ; i)
  {
    id v7 = [(PSOAuthAccountRedirectURLController *)self redirectHandlerMap];
    v8 = [v7 keyEnumerator];
    id v9 = [v8 nextObject];

    if (!v9) {
      break;
    }
    id i = v9;
    if (![i caseInsensitiveCompare:v5])
    {
      v10 = [(PSOAuthAccountRedirectURLController *)self redirectHandlerMap];
      v11 = [v10 objectForKey:i];

      if (v11)
      {
        ((void (**)(void, id))v11)[2](v11, v4);

        break;
      }
    }
  }

  return v9 != 0;
}

- (id)_redirectURLFromURL:(id)a3
{
  id v3 = a3;
  id v4 = [v3 host];
  if (v4)
  {
    id v5 = [v3 host];
  }
  else
  {
    id v6 = [v3 path];
    id v5 = [v6 stringByReplacingOccurrencesOfString:@"/" withString:&stru_1EFB51FD0];
  }
  id v7 = NSString;
  v8 = [v3 scheme];
  id v9 = [v7 stringWithFormat:@"%@://%@", v8, v5];

  return v9;
}

- (NSMapTable)redirectHandlerMap
{
  return self->_redirectHandlerMap;
}

- (void)setRedirectHandlerMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end