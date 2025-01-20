@interface TrophyCaseAwardDetailFriendCell
- (_TtC10FitnessApp31TrophyCaseAwardDetailFriendCell)initWithCoder:(id)a3;
- (_TtC10FitnessApp31TrophyCaseAwardDetailFriendCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation TrophyCaseAwardDetailFriendCell

- (_TtC10FitnessApp31TrophyCaseAwardDetailFriendCell)initWithFrame:(CGRect)a3
{
  return (_TtC10FitnessApp31TrophyCaseAwardDetailFriendCell *)sub_1005E4DA4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10FitnessApp31TrophyCaseAwardDetailFriendCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1005E5F70();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_1005E5CDC();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseAwardDetailFriendCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10FitnessApp31TrophyCaseAwardDetailFriendCell_avatarImageView));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10FitnessApp31TrophyCaseAwardDetailFriendCell_fallbackAvatarView);
}

@end