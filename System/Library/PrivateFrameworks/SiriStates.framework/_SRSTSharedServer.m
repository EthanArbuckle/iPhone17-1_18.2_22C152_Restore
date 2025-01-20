@interface _SRSTSharedServer
- (_SRSTSharedServer)init;
- (_SRSTSharedState)currentState;
- (void)dealloc;
@end

@implementation _SRSTSharedServer

- (_SRSTSharedState)currentState
{
  return (_SRSTSharedState *)@objc CallServer.currentState.getter((char *)self, (uint64_t)a2, &OBJC_IVAR____SRSTSharedServer_stateMachine);
}

- (void)dealloc
{
  v2 = self;
  SharedServer.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

- (_SRSTSharedServer)init
{
  uint64_t ObjectType = swift_getObjectType();
  InstrumentationManager.sharedLogger.unsafeMutableAddressor();
  v3 = *(uint64_t (**)(uint64_t))(ObjectType + 128);
  uint64_t v4 = swift_retain();
  v5 = (_SRSTSharedServer *)v3(v4);
  swift_deallocPartialClassInstance();
  return v5;
}

@end