@interface ContentCell
- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell)initWithCoder:(id)a3;
- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
@end

@implementation ContentCell

- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100321348();
}

- (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell *)sub_10031CAEC(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  v2 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_titleLabel);
  id v3 = self;
  [v2 setText:0];
  [*(id *)((char *)&v3->super.super.super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_checkmarkButton) setImage:*(Class *)((char *)&v3->super.super.super.super.isa+ OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_notCheckedImage) forStates:0];
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for ContentCell();
  id v6 = v8.receiver;
  [(ContentCell *)&v8 setEditing:v5 animated:v4];
  if (v5) {
    uint64_t v7 = 0;
  }
  else {
    uint64_t v7 = 3;
  }
  [v6 setSelectionStyle:v7];
  sub_10031D6E0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_checkmarkButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_checkmarkImage));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_notCheckedImage));
  sub_100054B1C((uint64_t)self + OBJC_IVAR____TtC8PodcastsP33_D0A2C042165B8B2C72C364035AC57A2311ContentCell_contentData, &qword_1005FDDA0);
}

@end