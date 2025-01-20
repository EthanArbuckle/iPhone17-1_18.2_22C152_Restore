@interface FolderComposerParticipantCell
- (_TtC11MobileNotes29FolderComposerParticipantCell)initWithCoder:(id)a3;
- (_TtC11MobileNotes29FolderComposerParticipantCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
@end

@implementation FolderComposerParticipantCell

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = type metadata accessor for UICellConfigurationState();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static UICellConfigurationState._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_10036A908();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC11MobileNotes29FolderComposerParticipantCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_participant) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_unknownParticipant) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_showCheckmark) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_avatarSize) = (Class)0x403C000000000000;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell____lazy_storage___emptyAvatarImage) = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for FolderComposerParticipantCell();
  return -[FolderComposerParticipantCell initWithFrame:](&v8, "initWithFrame:", x, y, width, height);
}

- (_TtC11MobileNotes29FolderComposerParticipantCell)initWithCoder:(id)a3
{
  return (_TtC11MobileNotes29FolderComposerParticipantCell *)sub_10036B860(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_participant));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell_unknownParticipant));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC11MobileNotes29FolderComposerParticipantCell____lazy_storage___emptyAvatarImage);
}

@end