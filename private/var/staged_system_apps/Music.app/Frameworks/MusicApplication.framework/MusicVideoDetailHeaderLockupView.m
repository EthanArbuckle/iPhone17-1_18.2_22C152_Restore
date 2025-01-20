@interface MusicVideoDetailHeaderLockupView
- (_TtC16MusicApplication32MusicVideoDetailHeaderLockupView)initWithCoder:(id)a3;
- (_TtC16MusicApplication32MusicVideoDetailHeaderLockupView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation MusicVideoDetailHeaderLockupView

- (_TtC16MusicApplication32MusicVideoDetailHeaderLockupView)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication32MusicVideoDetailHeaderLockupView *)sub_2A56D0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication32MusicVideoDetailHeaderLockupView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2A8350();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2A6510();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_lockupImageArtworkCatalog));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_playButtonHandler));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_buildMenu));
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_artistButtonHandler));
  swift_release();
  sub_1A500((uint64_t)self+ OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_libraryAddKeepLocalStatusControllableDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_libraryAddKeepLocalControl));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_contextualActionsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_headerLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView____lazy_storage___actionableBylineView));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC16MusicApplication32MusicVideoDetailHeaderLockupView_detailLabel);
}

@end