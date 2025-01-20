@interface HomePodUIManager
- (_TtC12mediaremoted16HomePodUIManager)init;
- (void)beginObservingSession:(id)a3;
- (void)dismissJoinRequest:(id)a3;
- (void)displayDiscoveredSession:(id)a3 dismissalHandler:(id)a4;
- (void)displayJoinRequest:(id)a3 handler:(id)a4;
- (void)openMusicForDiscoveredSession:(id)a3 foreground:(BOOL)a4 completion:(id)a5;
- (void)openMusicParticipantManagementWithCompletion:(id)a3;
@end

@implementation HomePodUIManager

- (void)displayJoinRequest:(id)a3 handler:(id)a4
{
  v6 = _Block_copy(a4);
  *(void *)(swift_allocObject() + 16) = v6;
  id v7 = a3;
  v8 = self;
  sub_10023EA6C(v7, (void (*)(uint64_t))sub_10023F8A8);

  swift_release();
}

- (void)dismissJoinRequest:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10023F058((uint64_t)v4);
}

- (void)displayDiscoveredSession:(id)a3 dismissalHandler:(id)a4
{
  id v4 = _Block_copy(a4);

  _Block_release(v4);
}

- (void)openMusicForDiscoveredSession:(id)a3 foreground:(BOOL)a4 completion:(id)a5
{
  id v7 = _Block_copy(a5);
  if (v7)
  {
    v8 = (void (**)(void, void))v7;
    type metadata accessor for MRGroupSessionError(0);
    uint64_t v10 = v9;
    v16[0] = 9;
    id v11 = a3;
    v12 = self;
    _Block_copy(v8);
    uint64_t v13 = sub_10023F828(&qword_1004786A0, type metadata accessor for MRGroupSessionError);
    sub_1002483C4((uint64_t)v16, 0xD00000000000001FLL, 0x80000001003B6740, 0, v10, v13);
    v14 = (void *)v16[1];
    v15 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))v8)[2](v8, v15);

    _Block_release(v8);
    _Block_release(v8);
  }
}

- (void)openMusicParticipantManagementWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  if (v4)
  {
    v5 = (void (**)(void, void))v4;
    type metadata accessor for MRGroupSessionError(0);
    uint64_t v7 = v6;
    v12[0] = 9;
    v8 = self;
    _Block_copy(v5);
    uint64_t v9 = sub_10023F828(&qword_1004786A0, type metadata accessor for MRGroupSessionError);
    sub_1002483C4((uint64_t)v12, 0xD00000000000001FLL, 0x80000001003B6740, 0, v7, v9);
    uint64_t v10 = (void *)v12[1];
    id v11 = (void *)_convertErrorToNSError(_:)();
    ((void (**)(void, void *))v5)[2](v5, v11);

    _Block_release(v5);
    _Block_release(v5);
  }
}

- (void)beginObservingSession:(id)a3
{
  v5 = *(void (**)(id))((swift_isaMask & (uint64_t)self->super.isa) + 0x68);
  swift_unknownObjectRetain_n();
  uint64_t v6 = self;
  v5(a3);
  swift_unknownObjectRelease();
}

- (_TtC12mediaremoted16HomePodUIManager)init
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12mediaremoted16HomePodUIManager_currentSession) = 0;
  *(Class *)((char *)&self->super.isa
           + OBJC_IVAR____TtC12mediaremoted16HomePodUIManager____lazy_storage___proxyAuthorizationSender) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for HomePodUIManager();
  return [(HomePodUIManager *)&v3 init];
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_release();
}

@end