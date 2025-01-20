@interface RevealingVideoMirrorView
- (_TtC8AppStore24RevealingVideoMirrorView)initWithCoder:(id)a3;
- (_TtC8AppStore24RevealingVideoMirrorView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation RevealingVideoMirrorView

- (_TtC8AppStore24RevealingVideoMirrorView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10068D9AC();
}

- (void)layoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RevealingVideoMirrorView();
  id v2 = v3.receiver;
  [(RevealingVideoMirrorView *)&v3 layoutSubviews];
  sub_10068D328();
}

- (_TtC8AppStore24RevealingVideoMirrorView)initWithFrame:(CGRect)a3
{
  result = (_TtC8AppStore24RevealingVideoMirrorView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStore24RevealingVideoMirrorView_videoMirrorView));
  swift_bridgeObjectRelease();
  objc_super v3 = (char *)self + OBJC_IVAR____TtC8AppStore24RevealingVideoMirrorView_pageGrid;

  sub_1000E6FD8((uint64_t)v3);
}

@end