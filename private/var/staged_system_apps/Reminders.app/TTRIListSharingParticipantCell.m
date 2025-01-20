@interface TTRIListSharingParticipantCell
- (UILabel)detailLabel;
- (UILabel)mainLabel;
- (UIView)avatarContainerView;
- (_TtC9Reminders30TTRIListSharingParticipantCell)initWithCoder:(id)a3;
- (_TtC9Reminders30TTRIListSharingParticipantCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)awakeFromNib;
- (void)setAvatarContainerView:(id)a3;
- (void)setDetailLabel:(id)a3;
- (void)setMainLabel:(id)a3;
@end

@implementation TTRIListSharingParticipantCell

- (void)awakeFromNib
{
  v2 = self;
  sub_100583C44();
}

- (UIView)avatarContainerView
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UIView *)Strong;
}

- (void)setAvatarContainerView:(id)a3
{
}

- (UILabel)mainLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setMainLabel:(id)a3
{
}

- (UILabel)detailLabel
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (UILabel *)Strong;
}

- (void)setDetailLabel:(id)a3
{
}

- (_TtC9Reminders30TTRIListSharingParticipantCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (_TtC9Reminders30TTRIListSharingParticipantCell *)sub_100583F98(a3, (uint64_t)a4, v6);
}

- (_TtC9Reminders30TTRIListSharingParticipantCell)initWithCoder:(id)a3
{
  return (_TtC9Reminders30TTRIListSharingParticipantCell *)sub_1005840C4(a3);
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  swift_unknownObjectWeakDestroy();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC9Reminders30TTRIListSharingParticipantCell_avatarViewController);
}

@end