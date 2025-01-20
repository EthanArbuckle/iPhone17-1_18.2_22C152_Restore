@interface MLHostAPSListener
- (_TtC7mlhostd17MLHostAPSListener)init;
- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4;
- (void)connection:(id)a3 didReceivePublicToken:(id)a4;
@end

@implementation MLHostAPSListener

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
  if (qword_100064F68 != -1) {
    swift_once();
  }
  uint64_t v14 = type metadata accessor for Logger();
  sub_100010174(v14, (uint64_t)qword_1000667D0);
  v15 = Logger.logObject.getter();
  os_log_type_t v16 = static os_log_type_t.debug.getter();
  if (os_log_type_enabled(v15, v16))
  {
    v17 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v17 = 0;
    _os_log_impl((void *)&_mh_execute_header, v15, v16, "Received public push token", v17, 2u);
    swift_slowDealloc();
  }

  sub_10001025C(v9, v11);
}

- (void)connection:(id)a3 didReceiveIncomingMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = self;
  sub_10000FA38(a4);
}

- (_TtC7mlhostd17MLHostAPSListener)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = (Class *)((char *)&self->super.isa + OBJC_IVAR____TtC7mlhostd17MLHostAPSListener_handleMessage);
  void *v4 = nullsub_1;
  v4[1] = 0;
  v6.receiver = self;
  v6.super_class = ObjectType;
  return [(MLHostAPSListener *)&v6 init];
}

- (void).cxx_destruct
{
}

@end