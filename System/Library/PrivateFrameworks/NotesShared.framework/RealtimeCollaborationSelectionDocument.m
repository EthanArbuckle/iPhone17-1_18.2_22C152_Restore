@interface RealtimeCollaborationSelectionDocument
- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)init;
- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)initWithReplica:(id)a3;
- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)initWithVersion:(id)a3 rootObject:(id)a4 replica:(id)a5;
- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6;
- (unint64_t)mergeWithData:(id)a3;
@end

@implementation RealtimeCollaborationSelectionDocument

- (unint64_t)mergeWithData:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = sub_1C3DB8958();
  unint64_t v8 = v7;

  id v9 = RealtimeCollaborationSelectionDocument.merge(with:)();
  sub_1C3C58FC8(v6, v8);

  return (unint64_t)v9;
}

- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)initWithReplica:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6FC060);
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1C3DB8B58();
    uint64_t v7 = sub_1C3DB8B98();
    uint64_t v9 = 0;
    unint64_t v8 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
  }
  else
  {
    uint64_t v7 = sub_1C3DB8B98();
    unint64_t v8 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56);
    uint64_t v9 = 1;
  }
  (*v8)(v6, v9, 1, v7);
  result = (_TtC11NotesShared38RealtimeCollaborationSelectionDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)initWithVersion:(id)a3 rootObject:(id)a4 replica:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6FC060);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a5)
  {
    sub_1C3DB8B58();
    uint64_t v11 = sub_1C3DB8B98();
    uint64_t v13 = 0;
    v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  }
  else
  {
    uint64_t v11 = sub_1C3DB8B98();
    v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = 1;
  }
  (*v12)(v10, v13, 1, v11);
  id v14 = a3;
  id v15 = a4;
  result = (_TtC11NotesShared38RealtimeCollaborationSelectionDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)initWithVersion:(id)a3 startVersion:(id)a4 rootObject:(id)a5 replica:(id)a6
{
  uint64_t v10 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB6FC060);
  MEMORY[0x1F4188790](v10 - 8);
  v12 = (char *)&v20 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a6)
  {
    sub_1C3DB8B58();
    uint64_t v13 = sub_1C3DB8B98();
    uint64_t v15 = 0;
    id v14 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
  }
  else
  {
    uint64_t v13 = sub_1C3DB8B98();
    id v14 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56);
    uint64_t v15 = 1;
  }
  (*v14)(v12, v15, 1, v13);
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  result = (_TtC11NotesShared38RealtimeCollaborationSelectionDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC11NotesShared38RealtimeCollaborationSelectionDocument)init
{
  result = (_TtC11NotesShared38RealtimeCollaborationSelectionDocument *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v2 = (char *)self + OBJC_IVAR____TtC11NotesShared38RealtimeCollaborationSelectionDocument_localParticipantID;
  uint64_t v3 = sub_1C3DB8B98();
  (*(void (**)(char *, uint64_t))(*(void *)(v3 - 8) + 8))(v2, v3);
  swift_bridgeObjectRelease();
}

@end