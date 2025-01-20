@interface PlaybackContinuityActivityDelegate
- (_TtC8Podcasts34PlaybackContinuityActivityDelegate)init;
- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5;
- (void)userActivityWasContinued:(id)a3;
- (void)userActivityWillSave:(id)a3;
@end

@implementation PlaybackContinuityActivityDelegate

- (void)userActivityWasContinued:(id)a3
{
  uint64_t v5 = type metadata accessor for Logger();
  uint64_t v6 = *(void *)(v5 - 8);
  __chkstk_darwin(v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v9 = a3;
  v10 = self;
  static Logger.userActivity.getter();
  v11 = Logger.logObject.getter();
  os_log_type_t v12 = static os_log_type_t.default.getter();
  if (os_log_type_enabled(v11, v12))
  {
    v13 = (uint8_t *)swift_slowAlloc();
    *(_WORD *)v13 = 0;
    _os_log_impl((void *)&_mh_execute_header, v11, v12, "Activity was continued", v13, 2u);
    swift_slowDealloc();
  }

  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
}

- (void)userActivityWillSave:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_10029D948(v4);
}

- (void)userActivity:(id)a3 didReceiveInputStream:(id)a4 outputStream:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = self;
  sub_1002A01E0(v10);
}

- (_TtC8Podcasts34PlaybackContinuityActivityDelegate)init
{
  result = (_TtC8Podcasts34PlaybackContinuityActivityDelegate *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end