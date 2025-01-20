@interface SWWeakMessageHandler
+ (id)handlerWithMessageHandler:(id)a3;
- (SWMessageHandler)messageHandler;
- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4;
@end

@implementation SWWeakMessageHandler

+ (id)handlerWithMessageHandler:(id)a3
{
  id v3 = a3;
  v4 = (id *)objc_alloc((Class)objc_opt_class());
  objc_storeWeak(v4 + 1, v3);

  return v4;
}

- (void)didReceiveMessage:(id)a3 securityOrigin:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(SWWeakMessageHandler *)self messageHandler];
  [v8 didReceiveMessage:v7 securityOrigin:v6];
}

- (SWMessageHandler)messageHandler
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_messageHandler);
  return (SWMessageHandler *)WeakRetained;
}

- (void).cxx_destruct
{
}

@end