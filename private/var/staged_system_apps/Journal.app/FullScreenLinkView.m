@interface FullScreenLinkView
- (_TtC7Journal18FullScreenLinkView)initWithCoder:(id)a3;
- (_TtC7Journal18FullScreenLinkView)initWithFrame:(CGRect)a3;
@end

@implementation FullScreenLinkView

- (_TtC7Journal18FullScreenLinkView)initWithCoder:(id)a3
{
  uint64_t v4 = OBJC_IVAR____TtC7Journal18FullScreenLinkView_dateLabel;
  id v5 = objc_allocWithZone((Class)UILabel);
  v6 = self;
  v7 = (objc_class *)[v5 init];
  *(Class *)((char *)&self->super.super.super.isa + v4) = v7;

  type metadata accessor for FullScreenLinkView();
  swift_deallocPartialClassInstance();
  return 0;
}

- (_TtC7Journal18FullScreenLinkView)initWithFrame:(CGRect)a3
{
  result = (_TtC7Journal18FullScreenLinkView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal18FullScreenLinkView_dateLabel);
}

@end