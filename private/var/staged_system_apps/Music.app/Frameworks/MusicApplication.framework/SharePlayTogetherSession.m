@interface SharePlayTogetherSession
- (BOOL)isEqual:(id)a3;
- (_TtC9MusicCore24SharePlayTogetherSession)init;
- (void)groupSession:(id)a3 didInvalidateWithError:(id)a4;
- (void)groupSession:(id)a3 didUpdateMembers:(id)a4;
- (void)groupSession:(id)a3 didUpdateParticipants:(id)a4;
- (void)groupSession:(id)a3 didUpdatePendingParticipants:(id)a4;
- (void)groupSessionDidConnect:(id)a3;
@end

@implementation SharePlayTogetherSession

- (BOOL)isEqual:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_AB7E30();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v8, 0, sizeof(v8));
    v5 = self;
  }
  char v6 = SharePlayTogetherSession.isEqual(_:)((uint64_t)v8);

  sub_1A538((uint64_t)v8, (uint64_t *)&unk_DEA820);
  return v6 & 1;
}

- (_TtC9MusicCore24SharePlayTogetherSession)init
{
  result = (_TtC9MusicCore24SharePlayTogetherSession *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();

  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__routeSymbolName;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_DEF2C0);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__participants;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_DEF2E0);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  v7 = (char *)self + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__connectedParticipantsCount;
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_DEF2F8);
  v9 = *(void (**)(char *, uint64_t))(*(void *)(v8 - 8) + 8);
  v9(v7, v8);
  v9((char *)self + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__pendingParticipantsCount, v8);
  v10 = (char *)self + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__host;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_DEF320);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  sub_75EAA0(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__qrCode), *(void *)&self->session[OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__qrCode], *(void *)&self->endpoint[OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__qrCode], *(void **)&self->isHost[OBJC_IVAR____TtC9MusicCore24SharePlayTogetherSession__qrCode]);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_release();
}

- (void)groupSessionDidConnect:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_DEA5F0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = sub_AB6C00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  sub_AB6BB0();
  swift_unknownObjectRetain_n();
  v9 = self;
  uint64_t v10 = sub_AB6BA0();
  uint64_t v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = &protocol witness table for MainActor;
  v11[4] = a3;
  v11[5] = v9;
  sub_63C820((uint64_t)v7, (uint64_t)&unk_DEF510, (uint64_t)v11);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)groupSession:(id)a3 didInvalidateWithError:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_DEA5F0);
  __chkstk_darwin(v6 - 8);
  uint64_t v8 = (char *)&v16 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = sub_AB6C00();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 1, 1, v9);
  sub_AB6BB0();
  id v10 = a4;
  uint64_t v11 = self;
  id v12 = v10;
  v13 = v11;
  swift_unknownObjectRetain();
  uint64_t v14 = sub_AB6BA0();
  v15 = (void *)swift_allocObject();
  v15[2] = v14;
  v15[3] = &protocol witness table for MainActor;
  v15[4] = v12;
  v15[5] = v13;
  sub_63C820((uint64_t)v8, (uint64_t)&unk_DEF508, (uint64_t)v15);
  swift_unknownObjectRelease();

  swift_release();
}

- (void)groupSession:(id)a3 didUpdateParticipants:(id)a4
{
}

- (void)groupSession:(id)a3 didUpdatePendingParticipants:(id)a4
{
}

- (void)groupSession:(id)a3 didUpdateMembers:(id)a4
{
}

@end