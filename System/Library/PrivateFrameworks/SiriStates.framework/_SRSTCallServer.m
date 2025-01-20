@interface _SRSTCallServer
- (_SRSTCallServer)init;
- (_SRSTCallState)currentState;
- (void)dealloc;
@end

@implementation _SRSTCallServer

- (_SRSTCallState)currentState
{
  return (_SRSTCallState *)@objc CallServer.currentState.getter((char *)self, (uint64_t)a2, &OBJC_IVAR____SRSTCallServer_stateMachine);
}

- (void)dealloc
{
  v2 = self;
  CallServer.__deallocating_deinit();
}

- (void).cxx_destruct
{
}

- (_SRSTCallServer)init
{
  uint64_t ObjectType = swift_getObjectType();
  InstrumentationManager.sharedLogger.unsafeMutableAddressor();
  v3 = *(uint64_t (**)(uint64_t))(ObjectType + 128);
  uint64_t v4 = swift_retain();
  v5 = (_SRSTCallServer *)v3(v4);
  swift_deallocPartialClassInstance();
  return v5;
}

@end