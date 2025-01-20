@interface FCAMSPushHandler
- (BOOL)shouldHandleNotification:(id)a3;
- (BOOL)shouldHandleNotificationResponse:(id)a3;
- (FCAMSPushHandler)init;
- (NFLazy)lazyHandler;
- (void)handleNotification:(id)a3;
- (void)handleNotificationResponse:(id)a3;
- (void)setLazyHandler:(id)a3;
@end

@implementation FCAMSPushHandler

- (FCAMSPushHandler)init
{
  v6.receiver = self;
  v6.super_class = (Class)FCAMSPushHandler;
  v2 = [(FCAMSPushHandler *)&v6 init];
  if (v2)
  {
    uint64_t v3 = [objc_alloc(MEMORY[0x1E4F81BD0]) initWithConstructor:&__block_literal_global_93];
    lazyHandler = v2->_lazyHandler;
    v2->_lazyHandler = (NFLazy *)v3;
  }
  return v2;
}

id __24__FCAMSPushHandler_init__block_invoke()
{
  id v0 = objc_alloc_init(MEMORY[0x1E4F4DDF8]);
  [v0 setUserNotificationExtensionId:@"extension-marketing"];
  id v1 = objc_alloc(MEMORY[0x1E4F4DE00]);
  v2 = +[FCAMSBag bag];
  uint64_t v3 = (void *)[v1 initWithConfiguration:v0 bag:v2];

  return v3;
}

- (BOOL)shouldHandleNotification:(id)a3
{
  id v4 = a3;
  v5 = [(FCAMSPushHandler *)self lazyHandler];
  objc_super v6 = [v5 value];
  char v7 = [v6 shouldHandleNotification:v4];

  return v7;
}

- (void)handleNotification:(id)a3
{
  id v4 = a3;
  id v6 = [(FCAMSPushHandler *)self lazyHandler];
  v5 = [v6 value];
  [v5 handleNotification:v4];
}

- (BOOL)shouldHandleNotificationResponse:(id)a3
{
  return [MEMORY[0x1E4F4DE98] shouldHandleNotificationResponse:a3];
}

- (void)handleNotificationResponse:(id)a3
{
  id v6 = a3;
  uint64_t v3 = (void *)MEMORY[0x1E4F4DE98];
  id v4 = +[FCAMSBag bag];
  id v5 = (id)[v3 handleNotificationResponse:v6 bag:v4];
}

- (NFLazy)lazyHandler
{
  return self->_lazyHandler;
}

- (void)setLazyHandler:(id)a3
{
}

- (void).cxx_destruct
{
}

@end