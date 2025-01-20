@interface _SRSTServer
- (_SRSTServer)init;
- (_SRSTState)currentState;
- (void)dealloc;
@end

@implementation _SRSTServer

- (_SRSTState)currentState
{
  return (_SRSTState *)@objc CallServer.currentState.getter((char *)self, (uint64_t)a2, &OBJC_IVAR____SRSTServer_stateMachine);
}

- (void)dealloc
{
  v2 = self;
  Server.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

- (_SRSTServer)init
{
  uint64_t ObjectType = swift_getObjectType();
  InstrumentationManager.sharedLogger.unsafeMutableAddressor();
  v3 = *(uint64_t (**)(uint64_t))(ObjectType + 128);
  uint64_t v4 = swift_retain();
  v5 = (_SRSTServer *)v3(v4);
  swift_deallocPartialClassInstance();
  return v5;
}

@end