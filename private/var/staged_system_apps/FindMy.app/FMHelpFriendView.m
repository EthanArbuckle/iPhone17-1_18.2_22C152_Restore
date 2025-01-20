@interface FMHelpFriendView
- (_TtC6FindMy16FMHelpFriendView)init;
- (_TtC6FindMy16FMHelpFriendView)initWithCoder:(id)a3;
- (_TtC6FindMy16FMHelpFriendView)initWithFrame:(CGRect)a3;
- (void)handleLinkTap;
@end

@implementation FMHelpFriendView

- (_TtC6FindMy16FMHelpFriendView)init
{
  return (_TtC6FindMy16FMHelpFriendView *)sub_1003F4B20();
}

- (_TtC6FindMy16FMHelpFriendView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC6FindMy16FMHelpFriendView_link;
  id v6 = objc_allocWithZone((Class)UIButton);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];
  uint64_t v8 = OBJC_IVAR____TtC6FindMy16FMHelpFriendView_message;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)[objc_allocWithZone((Class)UILabel) init];

  result = (_TtC6FindMy16FMHelpFriendView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC6FindMy16FMHelpFriendView)initWithFrame:(CGRect)a3
{
  result = (_TtC6FindMy16FMHelpFriendView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC6FindMy16FMHelpFriendView_message);
}

- (void)handleLinkTap
{
  uint64_t v0 = sub_10005D034((uint64_t *)&unk_1006AF820);
  __chkstk_darwin(v0 - 8);
  v2 = (char *)&v20 - ((v1 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v3 = type metadata accessor for URL();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  id v6 = (char *)&v20 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  URL.init(string:)();
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v4 + 48))(v2, 1, v3) == 1)
  {
    sub_1000AFBAC((uint64_t)v2);
    if (qword_1006AE190 != -1) {
      swift_once();
    }
    uint64_t v7 = type metadata accessor for Logger();
    sub_1000606BC(v7, (uint64_t)qword_1006D1E98);
    uint64_t v8 = Logger.logObject.getter();
    os_log_type_t v9 = static os_log_type_t.error.getter();
    if (os_log_type_enabled(v8, v9))
    {
      v10 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, v9, "FMHelpFriendView: Cannot go to icloud.com", v10, 2u);
      swift_slowDealloc();
    }
  }
  else
  {
    (*(void (**)(char *, char *, uint64_t))(v4 + 32))(v6, v2, v3);
    if (qword_1006AE190 != -1) {
      swift_once();
    }
    uint64_t v11 = type metadata accessor for Logger();
    sub_1000606BC(v11, (uint64_t)qword_1006D1E98);
    v12 = Logger.logObject.getter();
    os_log_type_t v13 = static os_log_type_t.default.getter();
    if (os_log_type_enabled(v12, v13))
    {
      v14 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, v13, "FMHelpFriendView: User tapped help a friend", v14, 2u);
      swift_slowDealloc();
    }

    id v15 = [self sharedApplication];
    URL._bridgeToObjectiveC()(v16);
    v18 = v17;
    sub_10014C1D0((uint64_t)_swiftEmptyArrayStorage);
    type metadata accessor for OpenExternalURLOptionsKey(0);
    sub_100108710();
    Class isa = Dictionary._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
    [v15 openURL:v18 options:isa completionHandler:0];

    (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  }
}

@end