@interface _SRSTClient
- (NSString)mostRecentEventName;
- (_SRSTClient)init;
- (_SRSTClientDelegate)delegate;
- (_SRSTState)currentState;
- (void)dealloc;
- (void)dispatchEvent:(int64_t)a3;
- (void)setCurrentState:(id)a3;
- (void)setDelegate:(id)a3;
- (void)stopClient;
@end

@implementation _SRSTClient

- (_SRSTClientDelegate)delegate
{
  v2 = (char *)self + OBJC_IVAR____SRSTClient_delegate;
  swift_beginAccess();
  v3 = (void *)MEMORY[0x223C6C570](v2);
  return (_SRSTClientDelegate *)v3;
}

- (void)setDelegate:(id)a3
{
}

- (_SRSTState)currentState
{
  swift_getKeyPath();
  swift_getKeyPath();
  v3 = self;
  static Published.subscript.getter();
  swift_release();
  swift_release();

  return (_SRSTState *)v5;
}

- (void)setCurrentState:(id)a3
{
  swift_getKeyPath();
  swift_getKeyPath();
  id v5 = a3;
  v6 = self;
  static Published.subscript.setter();
}

- (NSString)mostRecentEventName
{
  v2 = *(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.isa) + 0xB8);
  v3 = self;
  uint64_t v4 = v2();
  if (v5)
  {

    v9 = 0;
  }
  else
  {
    unint64_t v6 = Event.name.getter(v4);
    uint64_t v8 = v7;

    v9 = (void *)MEMORY[0x223C6BB50](v6, v8);
    swift_bridgeObjectRelease();
  }
  return (NSString *)v9;
}

- (void)dispatchEvent:(int64_t)a3
{
  type metadata accessor for NotificationCenterHelper();
  int64_t v5 = a3;
  unint64_t v4 = lazy protocol witness table accessor for type Event and conformance Event();
  static NotificationCenterHelper.dispatch<A>(_:)((uint64_t)&v5, (uint64_t)&type metadata for Event, v4);
}

- (void)dealloc
{
  v2 = self;
  Client.__deallocating_deinit();
}

- (void).cxx_destruct
{
  outlined destroy of weak SharedClientDelegate?((uint64_t)self + OBJC_IVAR____SRSTClient_delegate);
  v3 = (char *)self + OBJC_IVAR____SRSTClient__currentState;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<State?>);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  int64_t v5 = (char *)self + OBJC_IVAR____SRSTClient__mostRecentEvent;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&demangling cache variable for type metadata for Published<Event?>);
  uint64_t v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
}

- (_SRSTClient)init
{
  Client.init()();
  return result;
}

- (void)stopClient
{
  v2 = self;
  Client.stopClient()();
}

@end