@interface ICAudioAttachmentPlaybackAdaptor
- (_TtC11NotesEditor32ICAudioAttachmentPlaybackAdaptor)init;
- (void)playPauseToggled:(id)a3;
- (void)timeChanged:(id)a3;
@end

@implementation ICAudioAttachmentPlaybackAdaptor

- (void)timeChanged:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  v8 = self;
  sub_20C07DA10((uint64_t)v7);

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)playPauseToggled:(id)a3
{
  uint64_t v4 = sub_20C15F200();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_20C15F1D0();
  v8 = self;
  sub_20C07DF00();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11NotesEditor32ICAudioAttachmentPlaybackAdaptor)init
{
  result = (_TtC11NotesEditor32ICAudioAttachmentPlaybackAdaptor *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NotesEditor32ICAudioAttachmentPlaybackAdaptor_attachment));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11NotesEditor32ICAudioAttachmentPlaybackAdaptor_audioController));
  swift_release();
  swift_release();
  swift_release();
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC11NotesEditor32ICAudioAttachmentPlaybackAdaptor_recordingManager);
}

@end