@interface VideoTransportStream
- (_TtC16ScreenSharingKit20VideoTransportStream)init;
- (void)dealloc;
- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3;
- (void)screenCapture:(id)a3 didStart:(BOOL)a4 withError:(id)a5;
- (void)screenCapture:(id)a3 didStop:(BOOL)a4 withError:(id)a5;
- (void)screenCapture:(id)a3 didUpdateAttributes:(id)a4 error:(id)a5;
- (void)serverDidDisconnect:(id)a3;
- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5;
- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5;
- (void)streamDidRTCPTimeOut:(id)a3;
- (void)streamDidServerDie:(id)a3;
- (void)streamDidStop:(id)a3;
@end

@implementation VideoTransportStream

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_remoteVideoClient);
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_remoteVideoClient) = 0;
  v3 = self;

  __swift_instantiateConcreteTypeFromMangledName(&qword_26A537698);
  sub_25BC08968();
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for VideoTransportStream();
  [(VideoTransportStream *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_25BB09100(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_currentState));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_remoteVideoClient));

  v3 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_stateStream;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A5382E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_stateContinuation;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A537698);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream____lazy_storage___screenCapture));

  v7 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit20VideoTransportStream_sessionID;
  uint64_t v8 = sub_25BC07818();
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
}

- (_TtC16ScreenSharingKit20VideoTransportStream)init
{
  result = (_TtC16ScreenSharingKit20VideoTransportStream *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)remoteVideoClientDidReceiveFirstFrame:(id)a3
{
  id v5 = a3;
  uint64_t v6 = self;
  sub_25BBB2250(a3);
}

- (void)stream:(id)a3 didStart:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  v9 = self;
  id v10 = a5;
  sub_25BBB3D50(v6, a5);
}

- (void)streamDidRTCPTimeOut:(id)a3
{
  id v5 = a3;
  BOOL v6 = self;
  sub_25BBB262C(a3);
}

- (void)stream:(id)a3 didPause:(BOOL)a4 error:(id)a5
{
  BOOL v6 = a4;
  id v9 = a3;
  id v10 = self;
  id v11 = a5;
  sub_25BBB29D4(a3, v6, a5);
}

- (void)streamDidStop:(id)a3
{
}

- (void)streamDidServerDie:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_25BBB40D4();
}

- (void)screenCapture:(id)a3 didStart:(BOOL)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = self;
  id v10 = a5;
  sub_25BBB42F8(a4, a5, "ScreenCapture didStart=%{BOOL,public}d withError=%{public}s", 11);
}

- (void)screenCapture:(id)a3 didStop:(BOOL)a4 withError:(id)a5
{
  id v8 = a3;
  id v9 = self;
  id v10 = a5;
  sub_25BBB42F8(a4, a5, "ScreenCapture didStop=%{BOOL,public}d withError=%{public}s", 12);
}

- (void)serverDidDisconnect:(id)a3
{
}

- (void)screenCapture:(id)a3 didUpdateAttributes:(id)a4 error:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = self;
  id v11 = a5;
  sub_25BBB46B0(v9, a5);
}

@end