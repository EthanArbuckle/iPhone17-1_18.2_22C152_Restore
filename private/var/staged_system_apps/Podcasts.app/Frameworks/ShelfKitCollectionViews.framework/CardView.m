@interface CardView
- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView)initWithFrame:(CGRect)a3;
- (void)didTapFrom:(id)a3;
@end

@implementation CardView

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView)initWithFrame:(CGRect)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView *)sub_2A7B88(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView *)sub_2A7CB8(a3);
}

- (void)didTapFrom:(id)a3
{
  id v4 = a3;
  v7 = self;
  if ([v4 state] == (char *)&dword_0 + 3)
  {
    v5 = *(void (**)(uint64_t))((char *)&v7->super.super.super.isa
                                        + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView_tapAction);
    if (v5)
    {
      uint64_t v6 = swift_retain();
      v5(v6);
      sub_27760((uint64_t)v5);
    }
  }
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView_tintView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView_view));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViewsP33_54B016D51452DD2A3640D0E0D7A300B38CardView_tapAction);

  sub_27760(v3);
}

@end