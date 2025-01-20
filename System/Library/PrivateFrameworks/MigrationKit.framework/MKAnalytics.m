@interface MKAnalytics
+ (id)sharedInstance;
- (MKAnalytics)init;
- (MKPayload)payload;
- (void)createPayload;
- (void)send;
- (void)send:(id)a3 payload:(id)a4;
- (void)setPayload:(id)a3;
@end

@implementation MKAnalytics

+ (id)sharedInstance
{
  block[0] = MEMORY[0x263EF8330];
  block[1] = 3221225472;
  block[2] = __29__MKAnalytics_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken_0 != -1) {
    dispatch_once(&sharedInstance_onceToken_0, block);
  }
  v2 = (void *)sharedInstance_sharedInstance_0;
  return v2;
}

uint64_t __29__MKAnalytics_sharedInstance__block_invoke(uint64_t a1)
{
  sharedInstance_sharedInstance_0 = (uint64_t)objc_alloc_init(*(Class *)(a1 + 32));
  return MEMORY[0x270F9A758]();
}

- (MKAnalytics)init
{
  v5.receiver = self;
  v5.super_class = (Class)MKAnalytics;
  v2 = [(MKAnalytics *)&v5 init];
  v3 = v2;
  if (v2) {
    [(MKAnalytics *)v2 createPayload];
  }
  return v3;
}

- (void)createPayload
{
  v3 = objc_alloc_init(MKPayload);
  [(MKAnalytics *)self setPayload:v3];
}

- (void)send
{
  id v3 = [(MKPayload *)self->_payload dictionary];
  [(MKAnalytics *)self send:@"com.apple.welcomemat" payload:v3];
}

- (void)send:(id)a3 payload:(id)a4
{
  id v5 = a4;
  id v4 = v5;
  AnalyticsSendEventLazy();
}

id __28__MKAnalytics_send_payload___block_invoke(uint64_t a1)
{
  return *(id *)(a1 + 32);
}

- (MKPayload)payload
{
  return self->_payload;
}

- (void)setPayload:(id)a3
{
}

- (void).cxx_destruct
{
}

@end