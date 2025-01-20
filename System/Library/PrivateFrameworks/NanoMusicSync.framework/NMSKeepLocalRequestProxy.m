@interface NMSKeepLocalRequestProxy
- (NMSKeepLocalRequestProxy)initWithModelObject:(id)a3 enableState:(int64_t)a4;
- (void)performWithOptions:(id)a3 completion:(id)a4;
@end

@implementation NMSKeepLocalRequestProxy

- (NMSKeepLocalRequestProxy)initWithModelObject:(id)a3 enableState:(int64_t)a4
{
  v8.receiver = self;
  v8.super_class = (Class)NMSKeepLocalRequestProxy;
  v4 = [(NMSKeepLocalRequest *)&v8 initWithModelObject:a3 enableState:a4];
  if (v4)
  {
    v5 = objc_alloc_init(NMSMediaSyncService);
    mediaSyncService = v4->_mediaSyncService;
    v4->_mediaSyncService = v5;
  }
  return v4;
}

- (void)performWithOptions:(id)a3 completion:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  if ([(NMSKeepLocalRequest *)self enableState] == 1)
  {
    if ([v12 requiresValidation])
    {
      v7 = [v12 cellularBundleIdentifier];

      if (!v7)
      {
        id v11 = [MEMORY[0x263EFF940] exceptionWithName:*MEMORY[0x263EFF4A0] reason:@"Required cellular bundle identifier missing during KeepLocalRequest validation." userInfo:0];
        objc_exception_throw(v11);
      }
    }
  }
  mediaSyncService = self->_mediaSyncService;
  int64_t v9 = [(NMSKeepLocalRequest *)self enableState];
  v10 = [(NMSKeepLocalRequest *)self modelObject];
  [(NMSMediaSyncService *)mediaSyncService performKeepLocalRequestWithEnableState:v9 modelObject:v10 options:v12 completion:v6];
}

- (void).cxx_destruct
{
}

@end