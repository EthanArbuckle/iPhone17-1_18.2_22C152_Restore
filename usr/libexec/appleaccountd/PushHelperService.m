@interface PushHelperService
- (_TtC13appleaccountd17PushHelperService)init;
- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
- (void)connectionDidReconnect:(id)a3;
- (void)dealloc;
@end

@implementation PushHelperService

- (void)dealloc
{
  v2 = self;
  sub_1001EA1A8();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC13appleaccountd17PushHelperService____lazy_storage___localQueue));

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1000196A0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC13appleaccountd17PushHelperService_publicToken), *(void *)&self->$__lazy_storage_$_localQueue[OBJC_IVAR____TtC13appleaccountd17PushHelperService_publicToken]);

  swift_bridgeObjectRelease();
}

- (_TtC13appleaccountd17PushHelperService)init
{
  return (_TtC13appleaccountd17PushHelperService *)sub_1001EA3C4();
}

- (void)connection:(id)a3 didReceivePublicToken:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v7 = self;
    id v8 = a4;
    uint64_t v9 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
    unint64_t v11 = v10;
  }
  else
  {
    id v12 = a3;
    v13 = self;
    uint64_t v9 = 0;
    unint64_t v11 = 0xF000000000000000;
  }
  sub_1001EA4C8((uint64_t)a3, v9, v11);
  sub_1000196A0(v9, v11);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  sub_1001EA864((uint64_t)a3, a4);
}

- (void)connection:(id)a3 didChangeConnectedStatus:(BOOL)a4
{
}

- (void)connectionDidReconnect:(id)a3
{
  uint64_t v4 = qword_100320B70;
  id v10 = a3;
  v5 = self;
  if (v4 != -1) {
    swift_once();
  }
  uint64_t v6 = type metadata accessor for Logger();
  sub_100007288(v6, (uint64_t)qword_10033E700);
  id v7 = Logger.logObject.getter();
  os_log_type_t v8 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v7, v8))
  {
    uint64_t v9 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, v8, "AA PushHelperService got reconnected to APS", v9, 2u);
    swift_slowDealloc();
  }
}

@end