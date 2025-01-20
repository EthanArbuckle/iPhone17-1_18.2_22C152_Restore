@interface SNConnectionInternal
- (BOOL)startAndReturnError:(id *)a3;
- (SNConnectionDelegateInternal)delegate;
- (SNConnectionInternal)init;
- (SNConnectionInternal)initWithConnectionInfo:(id)a3 connectionQueue:(id)a4;
- (SNConnectionInternal)initWithConnectionInfo:(id)a3 connectionQueue:(id)a4 networkManager:(id)a5 networkAnalytics:(id)a6;
- (void)barrierWith:(id)a3;
- (void)cancelSynchronously:(BOOL)a3 isOnConnectionQueue:(BOOL)a4 with:(id)a5;
- (void)dealloc;
- (void)getSNConnectionAnalysisInfo:(id)a3;
- (void)getSNConnectionMetrics:(BOOL)a3 with:(id)a4;
- (void)probeConnection;
- (void)sendCommand:(id)a3 with:(id)a4;
- (void)sendCommands:(id)a3 with:(id)a4;
- (void)sendData:(id)a3 with:(id)a4;
- (void)setDelegate:(id)a3;
- (void)setSendPings:(BOOL)a3;
@end

@implementation SNConnectionInternal

- (SNConnectionDelegateInternal)delegate
{
  v2 = (void *)Connection.delegate.getter();

  return (SNConnectionDelegateInternal *)v2;
}

- (void)setDelegate:(id)a3
{
  swift_unknownObjectRetain();
  v4 = self;
  Connection.delegate.setter();
}

- (SNConnectionInternal)initWithConnectionInfo:(id)a3 connectionQueue:(id)a4
{
  return (SNConnectionInternal *)Connection.init(connectionInfo:connectionQueue:)(a3, a4);
}

- (SNConnectionInternal)initWithConnectionInfo:(id)a3 connectionQueue:(id)a4 networkManager:(id)a5 networkAnalytics:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  Connection.init(connectionInfo:connectionQueue:networkManager:networkAnalytics:)();
  return result;
}

- (void)dealloc
{
  v2 = self;
  Connection.__deallocating_deinit();
}

- (void).cxx_destruct
{
  outlined destroy of weak ConnectionProviderDelegate?((uint64_t)self + OBJC_IVAR___SNConnectionInternal_delegate);
  memcpy(__dst, (char *)self + OBJC_IVAR___SNConnectionInternal_connectionConfiguration, 0x204uLL);
  outlined release of ConnectionConfiguration(__dst);

  swift_release();
  outlined consume of ConnectionPolicyRoute?(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR___SNConnectionInternal_activeRoute), *(void *)&self->delegate[OBJC_IVAR___SNConnectionInternal_activeRoute]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (BOOL)startAndReturnError:(id *)a3
{
  v4 = self;
  Connection.start()();

  if (v5)
  {
    if (a3)
    {
      v6 = (void *)_convertErrorToNSError(_:)();

      id v7 = v6;
      *a3 = v6;
    }
    else
    {
    }
  }
  return v5 == 0;
}

- (void)sendData:(id)a3 with:(id)a4
{
  v5 = (uint64_t (*)())_Block_copy(a4);
  swift_unknownObjectRetain();
  v6 = self;
  _bridgeAnyObjectToAny(_:)();
  swift_unknownObjectRelease();
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v5 = thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ()partial apply;
  }
  Connection.sendData(_:with:)();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v5);

  __swift_destroy_boxed_opaque_existential_0((uint64_t)&v7);
}

- (void)sendCommand:(id)a3 with:(id)a4
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v5 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned NSError?) -> ();
  }
  swift_unknownObjectRetain();
  v6 = self;
  Connection.sendCommand(_:with:)();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v5);
  swift_unknownObjectRelease();
}

- (void)sendCommands:(id)a3 with:(id)a4
{
  v5 = _Block_copy(a4);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&demangling cache variable for type metadata for SNSessionObject & SNThunking);
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  if (v5)
  {
    *(void *)(swift_allocObject() + 16) = v5;
    v5 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned SNSessionObject?, @unowned NSError?) -> ();
  }
  v6 = self;
  Connection.sendCommands(_:with:)();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v5);

  swift_bridgeObjectRelease();
}

- (void)setSendPings:(BOOL)a3
{
  v4 = self;
  Connection.setSendPings(_:)(a3);
}

- (void)cancelSynchronously:(BOOL)a3 isOnConnectionQueue:(BOOL)a4 with:(id)a5
{
  v6 = _Block_copy(a5);
  if (v6)
  {
    *(void *)(swift_allocObject() + 16) = v6;
    v6 = _sIeyB_Ieg_TRTA_0;
  }
  uint64_t v7 = self;
  Connection.cancelSynchronously(_:isOnConnectionQueue:with:)();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v6);
}

- (void)getSNConnectionMetrics:(BOOL)a3 with:(id)a4
{
  BOOL v4 = a3;
  v6 = _Block_copy(a4);
  if (v6)
  {
    uint64_t v7 = swift_allocObject();
    *(void *)(v7 + 16) = v6;
    v6 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned SNLinkRecommendationInfo?) -> ();
  }
  else
  {
    uint64_t v7 = 0;
  }
  v8 = self;
  Connection.getSNConnectionMetrics(_:with:)(v4, (uint64_t)v6, v7);
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v6);
}

- (void)getSNConnectionAnalysisInfo:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = thunk for @escaping @callee_unowned @convention(block) (@unowned SNLinkRecommendationInfo?) -> ()partial apply;
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  Connection.getSNConnectionAnalysisInfo(_:)();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v5);
}

- (void)probeConnection
{
  v2 = self;
  Connection.probeConnection()();
}

- (void)barrierWith:(id)a3
{
  BOOL v4 = _Block_copy(a3);
  if (v4)
  {
    *(void *)(swift_allocObject() + 16) = v4;
    v5 = partial apply for thunk for @escaping @callee_unowned @convention(block) (@unowned ObjCBool) -> ();
  }
  else
  {
    v5 = 0;
  }
  v6 = self;
  Connection.barrier(with:)();
  outlined consume of (@escaping @callee_guaranteed (@guaranteed SNLinkRecommendationInfo?) -> ())?((uint64_t)v5);
}

- (SNConnectionInternal)init
{
}

@end