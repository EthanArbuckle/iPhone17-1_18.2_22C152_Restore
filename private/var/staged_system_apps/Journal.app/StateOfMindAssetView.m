@interface StateOfMindAssetView
- (CGRect)frame;
- (_TtC7Journal20StateOfMindAssetView)initWithCoder:(id)a3;
- (_TtC7Journal20StateOfMindAssetView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)setFrame:(CGRect)a3;
- (void)userInterfaceStyleChanged;
@end

@implementation StateOfMindAssetView

- (CGRect)frame
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for StateOfMindAssetView();
  [(StateOfMindAssetView *)&v6 frame];
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for StateOfMindAssetView();
  v7 = (char *)v10.receiver;
  -[StateOfMindAssetView setFrame:](&v10, "setFrame:", x, y, width, height);
  [v7 layoutIfNeeded];
  v8 = *(void **)&v7[OBJC_IVAR____TtC7Journal20StateOfMindAssetView_fullScreenSnapshotView];
  if (v8)
  {
    v9 = v8;
    [v7 bounds];
    [v9 setFrame:];

    v7 = v9;
  }
}

- (_TtC7Journal20StateOfMindAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal20StateOfMindAssetView *)sub_1000147B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal20StateOfMindAssetView)initWithCoder:(id)a3
{
  return (_TtC7Journal20StateOfMindAssetView *)sub_1000149C8(a3);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_1000153EC();
}

- (void)userInterfaceStyleChanged
{
  double v2 = self;
  sub_100015650();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20StateOfMindAssetView_primaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20StateOfMindAssetView_secondaryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20StateOfMindAssetView_typeLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20StateOfMindAssetView_footnoteLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20StateOfMindAssetView_valenceImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20StateOfMindAssetView_gradientLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal20StateOfMindAssetView_stateOfMindAsset));
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal20StateOfMindAssetView_latestImageRequestID, &qword_100800950);
  double v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal20StateOfMindAssetView_fullScreenSnapshotView);
}

@end