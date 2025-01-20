@interface MediaAssetGridView
- (_TtC7Journal18MediaAssetGridView)initWithCoder:(id)a3;
- (_TtC7Journal18MediaAssetGridView)initWithFrame:(CGRect)a3;
- (void)playAction:(id)a3;
@end

@implementation MediaAssetGridView

- (_TtC7Journal18MediaAssetGridView)initWithFrame:(CGRect)a3
{
  return (_TtC7Journal18MediaAssetGridView *)sub_10021DDC4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7Journal18MediaAssetGridView)initWithCoder:(id)a3
{
  return (_TtC7Journal18MediaAssetGridView *)sub_10021E04C(a3);
}

- (void)playAction:(id)a3
{
  uint64_t v5 = sub_100010218(&qword_1007FA1D0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 1, 1, v8);
  type metadata accessor for MainActor();
  v9 = self;
  id v10 = a3;
  uint64_t v11 = static MainActor.shared.getter();
  v12 = (void *)swift_allocObject();
  v12[2] = v11;
  v12[3] = &protocol witness table for MainActor;
  v12[4] = v9;
  sub_100328A60((uint64_t)v7, (uint64_t)&unk_100803D80, (uint64_t)v12);
  swift_release();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18MediaAssetGridView_playbackButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18MediaAssetGridView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18MediaAssetGridView_artistLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18MediaAssetGridView_categoryLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal18MediaAssetGridView_mediaIndicator));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC7Journal18MediaAssetGridView_artBlurView);
}

@end