@interface PuzzleHintAccessoryView
- (_TtC8NewsFeed23PuzzleHintAccessoryView)initWithCoder:(id)a3;
- (_TtC8NewsFeed23PuzzleHintAccessoryView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation PuzzleHintAccessoryView

- (void)layoutSubviews
{
  v2 = self;
  PuzzleHintAccessoryView.layoutSubviews()();
}

- (_TtC8NewsFeed23PuzzleHintAccessoryView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1C1389E7C();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  v9.is_nil = (char)v6;
  v7 = v6;
  v9.value.super.isa = (Class)a3;
  PuzzleHintAccessoryView.traitCollectionDidChange(_:)(v9);
}

- (_TtC8NewsFeed23PuzzleHintAccessoryView)initWithFrame:(CGRect)a3
{
  result = (_TtC8NewsFeed23PuzzleHintAccessoryView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC8NewsFeed23PuzzleHintAccessoryView_sceneProvider);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed23PuzzleHintAccessoryView_leftButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed23PuzzleHintAccessoryView_rightButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8NewsFeed23PuzzleHintAccessoryView_hintButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8NewsFeed23PuzzleHintAccessoryView_keyboardButton);
}

@end