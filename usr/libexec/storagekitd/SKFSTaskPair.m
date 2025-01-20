@interface SKFSTaskPair
- (FSMessageReceiver)receiver;
- (SKFSTaskMessageHandler)msgHandler;
- (SKFSTaskPair)initWithMessageHandler:(id)a3;
- (void)setMsgHandler:(id)a3;
- (void)setReceiver:(id)a3;
@end

@implementation SKFSTaskPair

- (SKFSTaskPair)initWithMessageHandler:(id)a3
{
  id v5 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SKFSTaskPair;
  v6 = [(SKFSTaskPair *)&v11 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_msgHandler, a3);
    uint64_t v8 = +[FSMessageReceiver receiverWithDelegate:v5];
    receiver = v7->_receiver;
    v7->_receiver = (FSMessageReceiver *)v8;
  }
  return v7;
}

- (SKFSTaskMessageHandler)msgHandler
{
  return (SKFSTaskMessageHandler *)objc_getProperty(self, a2, 8, 1);
}

- (void)setMsgHandler:(id)a3
{
}

- (FSMessageReceiver)receiver
{
  return (FSMessageReceiver *)objc_getProperty(self, a2, 16, 1);
}

- (void)setReceiver:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_receiver, 0);

  objc_storeStrong((id *)&self->_msgHandler, 0);
}

@end