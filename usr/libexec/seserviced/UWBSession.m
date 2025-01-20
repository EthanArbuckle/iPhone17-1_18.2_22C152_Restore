@interface UWBSession
- (_TtC10seserviced10UWBSession)init;
- (void)session:(id)a3 didInvalidateWithError:(id)a4;
- (void)session:(id)a3 suspendedWithReason:(int64_t)a4;
- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5;
- (void)sessionDidStartRunning:(id)a3;
@end

@implementation UWBSession

- (_TtC10seserviced10UWBSession)init
{
  result = (_TtC10seserviced10UWBSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC10seserviced10UWBSession_session);
}

- (void)sessionDidStartRunning:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100205A80();
}

- (void)session:(id)a3 didInvalidateWithError:(id)a4
{
  id v6 = a3;
  id v8 = a4;
  v7 = self;
  sub_100205C30((uint64_t)v8);
}

- (void)session:(id)a3 suspendedWithReason:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_100205EA4(a4);
}

- (void)session:(id)a3 suspensionReasonEnded:(int64_t)a4 isNoLongerSuspended:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  v9 = self;
  sub_100206088(a4, v5);
}

@end