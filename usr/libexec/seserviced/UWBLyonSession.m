@interface UWBLyonSession
- (void)session:(id)a3 didPrefetchAcwgUrsk:(unsigned int)a4 error:(id)a5;
- (void)session:(id)a3 didProcessAcwgM1MsgWithResponse:(id)a4 error:(id)a5;
- (void)session:(id)a3 didProcessAcwgM3MsgWithResponse:(id)a4 error:(id)a5;
- (void)session:(id)a3 didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a4 error:(id)a5;
- (void)session:(id)a3 didProcessBluetoothHostTimeSyncWithResponse:(id)a4 error:(id)a5;
- (void)session:(id)a3 didStartAcwgRanging:(int64_t)a4;
- (void)session:(id)a3 didSuspendAcwgRanging:(int64_t)a4;
- (void)session:(id)a3 requestAcwgRangingSessionResume:(unsigned int)a4 withSessionTriggerReason:(int64_t)a5;
- (void)session:(id)a3 requestAcwgRangingSessionSuspend:(unsigned int)a4 withSuspendTriggerReason:(int64_t)a5;
@end

@implementation UWBLyonSession

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  swift_release();

  swift_release();
}

- (void)session:(id)a3 didProcessAcwgM1MsgWithResponse:(id)a4 error:(id)a5
{
}

- (void)session:(id)a3 didProcessAcwgM3MsgWithResponse:(id)a4 error:(id)a5
{
}

- (void)session:(id)a3 didProcessAcwgRangingSessionResumeRequestMsgWithResponse:(id)a4 error:(id)a5
{
}

- (void)session:(id)a3 requestAcwgRangingSessionSuspend:(unsigned int)a4 withSuspendTriggerReason:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = self;
  sub_100206630(v6, a5, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onPauseRequest);
}

- (void)session:(id)a3 requestAcwgRangingSessionResume:(unsigned int)a4 withSessionTriggerReason:(int64_t)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  v9 = self;
  sub_100206630(v6, a5, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onResumeRequest);
}

- (void)session:(id)a3 didStartAcwgRanging:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_100206958(a4, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onRangingStart);
}

- (void)session:(id)a3 didSuspendAcwgRanging:(int64_t)a4
{
  *((unsigned char *)&self->super.super.isa + OBJC_IVAR____TtC10seserviced10UWBSession_state) = 4;
  id v6 = *(void (**)(int64_t, uint64_t))((char *)&self->super.super.isa
                                                      + OBJC_IVAR____TtC10seserviced14UWBLyonSession_onRangingPause);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.isa + OBJC_IVAR____TtC10seserviced10UWBSession_peer);
  id v8 = a3;
  v9 = self;
  swift_retain();
  v6(a4, v7);

  swift_release();
}

- (void)session:(id)a3 didProcessBluetoothHostTimeSyncWithResponse:(id)a4 error:(id)a5
{
}

- (void)session:(id)a3 didPrefetchAcwgUrsk:(unsigned int)a4 error:(id)a5
{
  id v7 = a3;
  id v8 = self;
  id v9 = a5;
  sub_100206958((uint64_t)a5, &OBJC_IVAR____TtC10seserviced14UWBLyonSession_onURSKPrefetch);
}

@end