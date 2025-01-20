@interface SFSSOspreyTTSClientFactory
+ (id)sharedInstance;
- (NSMutableDictionary)ospreyClientFactory;
- (SFSSOspreyTTSClientFactory)init;
- (id)getOspreyClientByUrl:(id)a3;
- (id)getOspreyClientByUrl:(id)a3 useBlazar:(BOOL)a4 enableAuthentication:(BOOL)a5;
- (void)removeAll;
- (void)setOspreyClientFactory:(id)a3;
@end

@implementation SFSSOspreyTTSClientFactory

- (void).cxx_destruct
{
}

- (void)setOspreyClientFactory:(id)a3
{
}

- (NSMutableDictionary)ospreyClientFactory
{
  return self->_ospreyClientFactory;
}

- (void)removeAll
{
}

- (id)getOspreyClientByUrl:(id)a3 useBlazar:(BOOL)a4 enableAuthentication:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v20 = *MEMORY[0x263EF8340];
  id v8 = a3;
  v9 = [(NSMutableDictionary *)self->_ospreyClientFactory allKeys];
  int v10 = [v9 containsObject:v8];

  if (!v10)
  {
    id v13 = v8;
    if ([v13 containsString:@"c02"])
    {
      v14 = @"-c02";
    }
    else
    {
      v15 = v13;
      if (![v13 containsString:@"c03"]) {
        goto LABEL_10;
      }
      v14 = @"-c03";
    }
    v15 = [v13 stringByReplacingOccurrencesOfString:v14 withString:&stru_26DEBFAF8];

LABEL_10:
    v12 = [[SFSSOspreyTTSClient alloc] initWithURL:v15 useBlazar:v6 enableAuthentication:v5];
    if ([v13 containsString:@"c02"])
    {
      v16 = @"2";
    }
    else
    {
      if (![v13 containsString:@"c03"])
      {
LABEL_15:
        [(NSMutableDictionary *)self->_ospreyClientFactory setValue:v12 forKey:v13];

        goto LABEL_16;
      }
      v16 = @"3";
    }
    [(SFSSOspreyTTSClient *)v12 setCarryClusterId:v16];
    goto LABEL_15;
  }
  v11 = SFSSGetLogObject();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v18 = 138412290;
    id v19 = v8;
    _os_log_impl(&dword_22B575000, v11, OS_LOG_TYPE_INFO, "Get TTS Osprey client with URL: %@", (uint8_t *)&v18, 0xCu);
  }

  v12 = [(NSMutableDictionary *)self->_ospreyClientFactory objectForKey:v8];
LABEL_16:

  return v12;
}

- (id)getOspreyClientByUrl:(id)a3
{
  v3 = [(SFSSOspreyTTSClientFactory *)self getOspreyClientByUrl:a3 useBlazar:1 enableAuthentication:1];
  return v3;
}

- (SFSSOspreyTTSClientFactory)init
{
  v6.receiver = self;
  v6.super_class = (Class)SFSSOspreyTTSClientFactory;
  v2 = [(SFSSOspreyTTSClientFactory *)&v6 init];
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x263EFF9A0]);
    ospreyClientFactory = v2->_ospreyClientFactory;
    v2->_ospreyClientFactory = v3;
  }
  return v2;
}

+ (id)sharedInstance
{
  if (+[SFSSOspreyTTSClientFactory sharedInstance]::onceToken != -1) {
    dispatch_once(&+[SFSSOspreyTTSClientFactory sharedInstance]::onceToken, &__block_literal_global_83);
  }
  v2 = (void *)+[SFSSOspreyTTSClientFactory sharedInstance]::__sharedInstance;
  return v2;
}

uint64_t __44__SFSSOspreyTTSClientFactory_sharedInstance__block_invoke()
{
  +[SFSSOspreyTTSClientFactory sharedInstance]::__sharedInstance = objc_alloc_init(SFSSOspreyTTSClientFactory);
  return MEMORY[0x270F9A758]();
}

@end