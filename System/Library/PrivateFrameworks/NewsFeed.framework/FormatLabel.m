@interface FormatLabel
- (_TtC8NewsFeed11FormatLabel)initWithCoder:(id)a3;
- (_TtC8NewsFeed11FormatLabel)initWithFrame:(CGRect)a3;
@end

@implementation FormatLabel

- (_TtC8NewsFeed11FormatLabel)initWithFrame:(CGRect)a3
{
  return (_TtC8NewsFeed11FormatLabel *)sub_1BFE6BF98(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8NewsFeed11FormatLabel)initWithCoder:(id)a3
{
  v5 = (Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8NewsFeed11FormatLabel_identifier);
  void *v5 = 0;
  v5[1] = 0xE000000000000000;
  uint64_t v6 = OBJC_IVAR____TtC8NewsFeed11FormatLabel_linkHandler;
  id v7 = objc_allocWithZone((Class)type metadata accessor for FormatLabelLinkHandler());
  id v8 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v6) = (Class)objc_msgSend(v7, sel_init);

  result = (_TtC8NewsFeed11FormatLabel *)sub_1C152040C();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC8NewsFeed11FormatLabel_linkHandler);
}

@end