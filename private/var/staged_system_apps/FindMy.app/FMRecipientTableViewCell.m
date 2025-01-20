@interface FMRecipientTableViewCell
- (_TtC6FindMy24FMRecipientTableViewCell)initWithCoder:(id)a3;
- (_TtC6FindMy24FMRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation FMRecipientTableViewCell

- (_TtC6FindMy24FMRecipientTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
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
  return (_TtC6FindMy24FMRecipientTableViewCell *)sub_100488504(a3, (uint64_t)a4, v6);
}

- (_TtC6FindMy24FMRecipientTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10048A378();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100489048();
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell__style);
  v4 = *(void **)&self->_style[OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell__style];
  uint64_t v5 = *(void **)&self->_style[OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell__style + 8];
  uint64_t v6 = *(void **)&self->_style[OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell__style + 16];
  v7 = *(void **)&self->_style[OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell__style + 24];
  swift_bridgeObjectRelease();

  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_monogramImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_nameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_nameLabelLeadingWithoutImageConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_nameLabelLeadingWithImageConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_handleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_isInNetworkOperation));
  v8 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC6FindMy24FMRecipientTableViewCell_recipient);
}

@end