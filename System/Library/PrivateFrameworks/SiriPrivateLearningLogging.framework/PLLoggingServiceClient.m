@interface PLLoggingServiceClient
+ (id)makeClient;
- (NSXPCConnection)clientConnection;
- (OS_dispatch_queue)serialQueue;
- (PLLoggingServiceClient)init;
- (void)setClientConnection:(id)a3;
- (void)setSerialQueue:(id)a3;
- (void)storeInstrumentationWithEvents:(id)a3 completion:(id)a4;
@end

@implementation PLLoggingServiceClient

- (PLLoggingServiceClient)init
{
  v3.receiver = self;
  v3.super_class = (Class)PLLoggingServiceClient;
  return [(PLLoggingServiceClient *)&v3 init];
}

- (OS_dispatch_queue)serialQueue
{
  return self->_serialQueue;
}

- (void)setSerialQueue:(id)a3
{
}

- (NSXPCConnection)clientConnection
{
  return self->_clientConnection;
}

- (void)setClientConnection:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientConnection, 0);
  objc_storeStrong((id *)&self->_serialQueue, 0);
}

+ (id)makeClient
{
  id v2 = _sSo22PLLoggingServiceClientC26SiriPrivateLearningLoggingE04makeC0AByFZ_0();
  return v2;
}

- (void)storeInstrumentationWithEvents:(id)a3 completion:(id)a4
{
  v5 = _Block_copy(a4);
  sub_21C97C1A8(0, (unint64_t *)&qword_267C93530);
  unint64_t v6 = sub_21C9844D8();
  if (v5)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v5;
    v8 = sub_21C97A860;
  }
  else
  {
    v8 = 0;
    uint64_t v7 = 0;
  }
  v9 = self;
  PLLoggingServiceClient.storeInstrumentation(events:completion:)(v6, (uint64_t)v8, v7);
  sub_21C97A818((uint64_t)v8);

  swift_bridgeObjectRelease();
}

@end