@interface FullScreenAssetView
- (_TtC7Journal19FullScreenAssetView)initWithCoder:(id)a3;
- (_TtC7Journal19FullScreenAssetView)initWithFrame:(CGRect)a3;
- (void)dealloc;
- (void)removeFromSuperview;
@end

@implementation FullScreenAssetView

- (void)removeFromSuperview
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  if (qword_1007F6E98 != -1) {
    swift_once();
  }
  [v5 removeObserver:v4 name:qword_10083D420 object:0];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for FullScreenAssetView();
  [(FullScreenAssetView *)&v6 removeFromSuperview];
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  uint64_t v6 = qword_1007F6E98;
  v7 = v4;
  if (v6 != -1) {
    swift_once();
  }
  [v5 removeObserver:v7 name:qword_10083D420 object:0];

  v8.receiver = v7;
  v8.super_class = (Class)type metadata accessor for FullScreenAssetView();
  [(FullScreenAssetView *)&v8 dealloc];
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal19FullScreenAssetView_delegateStoppableMedia);
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal19FullScreenAssetView_delegate);
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal19FullScreenAssetView_multiPinMapDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal19FullScreenAssetView_journalAssetView));
  sub_10001457C((uint64_t)self + OBJC_IVAR____TtC7Journal19FullScreenAssetView_fullScreenView, &qword_100807600);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal19FullScreenAssetView_childViewController));
  v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7Journal19FullScreenAssetView_journalAsset);
}

- (_TtC7Journal19FullScreenAssetView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal19FullScreenAssetView *)sub_100379668(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal19FullScreenAssetView)initWithCoder:(id)a3
{
  return (_TtC7Journal19FullScreenAssetView *)sub_100379780(a3);
}

@end