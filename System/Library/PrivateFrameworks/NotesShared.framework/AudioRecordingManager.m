@interface AudioRecordingManager
- (_TtC11NotesShared21AudioRecordingManager)init;
@end

@implementation AudioRecordingManager

- (_TtC11NotesShared21AudioRecordingManager)init
{
  result = (_TtC11NotesShared21AudioRecordingManager *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  v3 = (char *)self + OBJC_IVAR____TtC11NotesShared21AudioRecordingManager__recordingState;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3884B8);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = (char *)self + OBJC_IVAR____TtC11NotesShared21AudioRecordingManager__currentRecordingDuration;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3884D0);
  v7 = *(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8);
  v7(v5, v6);
  v7((char *)self + OBJC_IVAR____TtC11NotesShared21AudioRecordingManager__totalRecordingDuration, v6);
  v8 = (char *)self + OBJC_IVAR____TtC11NotesShared21AudioRecordingManager__samples;
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3884E8);
  (*(void (**)(char *, uint64_t))(*(void *)(v9 - 8) + 8))(v8, v9);
  v10 = (char *)self + OBJC_IVAR____TtC11NotesShared21AudioRecordingManager__recordingStartTime;
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EA3884F8);
  (*(void (**)(char *, uint64_t))(*(void *)(v11 - 8) + 8))(v10, v11);
  swift_release();

  swift_bridgeObjectRelease();
  swift_release();
  v12 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC11NotesShared21AudioRecordingManager_attachmentModel);
}

@end