@interface VideoBrickContentView
- (_TtC9SeymourUI21VideoBrickContentView)initWithCoder:(id)a3;
- (_TtC9SeymourUI21VideoBrickContentView)initWithFrame:(CGRect)a3;
@end

@implementation VideoBrickContentView

- (_TtC9SeymourUI21VideoBrickContentView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A37E3D8();
}

- (_TtC9SeymourUI21VideoBrickContentView)initWithFrame:(CGRect)a3
{
  result = (_TtC9SeymourUI21VideoBrickContentView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_artworkView));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_fetchArtworkHandler));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_fetchFallbackArtworkHandler));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_completedIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_recencyIconView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_labelLayoutGuide));
  long long v3 = *(_OWORD *)((char *)&self->super._viewFlags + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout + 16);
  v7[6] = *(_OWORD *)((char *)&self->super._viewFlags + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[7] = v3;
  uint64_t v8 = *(void *)((char *)&self->super._minimumSafeAreaInsets.top
                 + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  long long v4 = *(_OWORD *)((char *)&self->super._traitChangeRegistry + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[2] = *(_OWORD *)((char *)&self->super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[3] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super._gestureRecognizers + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[4] = *(_OWORD *)((char *)&self->super._subviewCache + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[5] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[0] = *(_OWORD *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21VideoBrickContentView_layout);
  v7[1] = v6;
  sub_239C96FE8((uint64_t)v7);
}

@end