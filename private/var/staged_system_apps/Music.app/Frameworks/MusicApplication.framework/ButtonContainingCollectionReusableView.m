@interface ButtonContainingCollectionReusableView
- (_TtC16MusicApplication38ButtonContainingCollectionReusableView)initWithCoder:(id)a3;
- (_TtC16MusicApplication38ButtonContainingCollectionReusableView)initWithFrame:(CGRect)a3;
- (id)preferredLayoutAttributesFittingAttributes:(id)a3;
- (void)layoutSubviews;
- (void)tintColorDidChange;
@end

@implementation ButtonContainingCollectionReusableView

- (_TtC16MusicApplication38ButtonContainingCollectionReusableView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication38ButtonContainingCollectionReusableView *)sub_3D9A60(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication38ButtonContainingCollectionReusableView)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_textDrawingCache;
  type metadata accessor for TextDrawing.Cache();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.super.isa + v5) = (Class)TextDrawing.Cache.init()();
  v7 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_buttonTitle);
  void *v7 = 0;
  v7[1] = 0xE000000000000000;
  v8 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_buttonSelectionHandler);
  void *v8 = 0;
  v8[1] = 0;

  result = (_TtC16MusicApplication38ButtonContainingCollectionReusableView *)sub_AB8280();
  __break(1u);
  return result;
}

- (id)preferredLayoutAttributesFittingAttributes:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  id v6 = sub_3DA87C(v4);

  return v6;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_3D9EE4();
}

- (void)tintColorDidChange
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for ButtonContainingCollectionReusableView();
  v2 = (char *)v7.receiver;
  [(ButtonContainingCollectionReusableView *)&v7 tintColorDidChange];
  id v3 = [v2 tintColor];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void **)&v2[OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_button];
    [v5 setTitleColor:v3 forState:0];
    id v6 = [v4 colorWithAlphaComponent:0.2];
    [v5 setTitleColor:v6 forState:1];
  }
  else
  {
    __break(1u);
  }
}

- (void).cxx_destruct
{
  swift_release();
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_buttonSelectionHandler));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication38ButtonContainingCollectionReusableView_button);
}

@end