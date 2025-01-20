@interface ALServiceDelegate
- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4;
- (_TtC5ALXPC17ALServiceDelegate)init;
- (void)onData:(id)a3;
- (void)onInterrupt;
@end

@implementation ALServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  char v9 = sub_10034B800(v7);

  return v9 & 1;
}

- (void)onData:(id)a3
{
  id v4 = a3;
  v8 = self;
  uint64_t v5 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v7 = v6;

  sub_10034A7F0(v5, v7);
  sub_10001E3A8(v5, v7);
}

- (void)onInterrupt
{
  uint64_t v3 = type metadata accessor for Logger();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  unint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  unint64_t v7 = self;
  xpclog.getter((uint64_t)v6);
  v8 = Logger.logObject.getter();
  os_log_type_t v9 = static os_log_type_t.info.getter();
  if (os_log_type_enabled(v8, v9))
  {
    v10 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, v9, "service,onInterrupt", v10, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
}

- (_TtC5ALXPC17ALServiceDelegate)init
{
  result = (_TtC5ALXPC17ALServiceDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10001EE50((uint64_t)self + OBJC_IVAR____TtC5ALXPC17ALServiceDelegate__dataService);
}

@end