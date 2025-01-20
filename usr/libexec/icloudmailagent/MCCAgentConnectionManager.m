@interface MCCAgentConnectionManager
+ (_TtC15icloudmailagent25MCCAgentConnectionManager)sharedInstance;
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (NSXPCListener)secretAgentServiceListener;
- (_TtC15icloudmailagent25MCCAgentConnectionManager)init;
- (void)dealloc;
- (void)setSecretAgentServiceListener:(id)a3;
- (void)start;
- (void)startForTesting;
@end

@implementation MCCAgentConnectionManager

- (NSXPCListener)secretAgentServiceListener
{
  return (NSXPCListener *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                  + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener));
}

- (void)setSecretAgentServiceListener:(id)a3
{
  id v4 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener);
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener) = (Class)a3;
  id v3 = a3;
}

+ (_TtC15icloudmailagent25MCCAgentConnectionManager)sharedInstance
{
  if (qword_100063EE0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_100067A48;

  return (_TtC15icloudmailagent25MCCAgentConnectionManager *)v2;
}

- (_TtC15icloudmailagent25MCCAgentConnectionManager)init
{
  return (_TtC15icloudmailagent25MCCAgentConnectionManager *)sub_10004A66C();
}

- (void)dealloc
{
  v2 = self;
  sub_10004A75C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15icloudmailagent25MCCAgentConnectionManager_secretAgentServiceListener));
}

- (void)start
{
  v2 = self;
  sub_10004A820();
}

- (void)startForTesting
{
  v2 = self;
  sub_10004A820();
}

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10004AAC8(v6, v7);

  return v9 & 1;
}

@end