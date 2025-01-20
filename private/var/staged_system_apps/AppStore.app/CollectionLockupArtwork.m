@interface CollectionLockupArtwork
- (CGSize)sizeThatFits:(CGSize)a3;
- (_TtC8AppStore23CollectionLockupArtwork)initWithCoder:(id)a3;
- (_TtC8AppStore23CollectionLockupArtwork)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation CollectionLockupArtwork

- (_TtC8AppStore23CollectionLockupArtwork)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStore23CollectionLockupArtwork *)sub_1006572F8(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStore23CollectionLockupArtwork)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100658F98();
}

- (void)layoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CollectionLockupArtwork();
  id v2 = v5.receiver;
  [(CollectionLockupArtwork *)&v5 layoutSubviews];
  sub_1006577EC(v4);
  sub_100081D90(v4, v4[3]);
  LayoutMarginsAware<>.layoutFrame.getter();
  id v3 = [v2 traitCollection];
  dispatch thunk of Placeable.place(at:with:)();

  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  id v3 = self;
  id v4 = [(CollectionLockupArtwork *)v3 traitCollection];
  sub_1006577EC(v11);
  sub_100081D90(v11, v11[3]);
  dispatch thunk of Placeable.measure(toFit:with:)();
  double v6 = v5;
  double v8 = v7;
  _s8AppStore27ProductRatingsRegularLayoutV7MetricsVwxx_0((uint64_t)v11);

  double v9 = v6;
  double v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8AppStore23CollectionLockupArtwork_icon4);
}

@end