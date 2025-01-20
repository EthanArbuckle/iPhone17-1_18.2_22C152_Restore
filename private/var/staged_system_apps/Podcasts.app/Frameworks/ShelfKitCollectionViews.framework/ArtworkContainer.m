@interface ArtworkContainer
- (UIView)accessibilityContextButton;
- (UIView)accessibilityPlayButton;
- (_TtC23ShelfKitCollectionViews16ArtworkContainer)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews16ArtworkContainer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation ArtworkContainer

- (_TtC23ShelfKitCollectionViews16ArtworkContainer)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_2ECB70();
}

- (UIView)accessibilityPlayButton
{
  return (UIView *)sub_2EBAFC(self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_playButton);
}

- (UIView)accessibilityContextButton
{
  return (UIView *)sub_2EBAFC(self, (uint64_t)a2, &OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_contextButton);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_2EBB40();
}

- (_TtC23ShelfKitCollectionViews16ArtworkContainer)initWithFrame:(CGRect)a3
{
  result = (_TtC23ShelfKitCollectionViews16ArtworkContainer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_libraryActionController, &qword_4800A8);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_legibilityGradientView));
  uint64_t v3 = *(void *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle
                                               + 16];
  uint64_t v4 = *(void *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle
                                               + 24];
  uint64_t v5 = *(void *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle
                                               + 32];
  uint64_t v6 = *(void *)&self->artworkView[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle];
  uint64_t v7 = *(void *)&self->legibilityGradientView[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle];
  uint64_t v8 = *(void *)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle];
  uint64_t v9 = *(void *)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle + 8];
  v10 = *(void **)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle + 16];
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_mt_hoverStyle));
  sub_EB49C(v3, v4, v5, v6, v7, v8, v9, v10);
  sub_EB410(*(char **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle), *(void *)&self->episodePlayStateController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle], *(void *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle], *(void *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle+ 8], *(void *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle+ 16], *(void *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle+ 24], *(void *)&self->libraryActionController[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle+ 32], *(void *)&self->artworkView[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle], *(void *)&self->legibilityGradientView[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle], *(void *)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle], *(void *)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle + 8], *(void **)&self->mt_hoverStyle[OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_defaultStyle + 16]);
  sub_154940((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_delegate);
  sub_E179C((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_playState);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_playButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_contextButton));
  swift_release();
  sub_27760(*(uint64_t *)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC23ShelfKitCollectionViews16ArtworkContainer_playHandler));
  swift_release();

  swift_release();
}

@end