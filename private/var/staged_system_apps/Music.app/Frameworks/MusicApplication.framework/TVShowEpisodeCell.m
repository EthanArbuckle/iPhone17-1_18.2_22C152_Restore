@interface TVShowEpisodeCell
+ (unint64_t)visualContentInsets;
- (CGRect)bounds;
- (CGRect)frame;
- (NSString)descriptionText;
- (NSString)headline;
- (NSString)title;
- (UIImageView)accessibilityChevronImageView;
- (_TtC16MusicApplication13TextStackView)accessibilityDescriptionTextStackView;
- (_TtC16MusicApplication13TextStackView)accessibilityHeadlineTextStackView;
- (_TtC16MusicApplication13TextStackView)accessibilityTextStackView;
- (_TtC16MusicApplication17TVShowEpisodeCell)initWithCoder:(id)a3;
- (_TtC16MusicApplication17TVShowEpisodeCell)initWithFrame:(CGRect)a3;
- (_TtC16MusicApplication21VideoHeaderLockupView)accessibilityHeaderLockupView;
- (void)clearArtworkCatalogs;
- (void)layoutSubviews;
- (void)setBounds:(CGRect)a3;
- (void)setDescriptionText:(id)a3;
- (void)setFrame:(CGRect)a3;
- (void)setHeadline:(id)a3;
- (void)setTitle:(id)a3;
@end

@implementation TVShowEpisodeCell

- (_TtC16MusicApplication17TVShowEpisodeCell)initWithFrame:(CGRect)a3
{
  return (_TtC16MusicApplication17TVShowEpisodeCell *)sub_484E50(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC16MusicApplication17TVShowEpisodeCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_4875B4();
}

- (NSString)headline
{
  return (NSString *)sub_42EA8();
}

- (void)setHeadline:(id)a3
{
}

- (NSString)title
{
  return (NSString *)sub_42EA8();
}

- (void)setTitle:(id)a3
{
}

- (NSString)descriptionText
{
  return (NSString *)sub_42EA8();
}

- (void)setDescriptionText:(id)a3
{
}

- (void)clearArtworkCatalogs
{
  v2 = self;
  sub_4861C8();
}

- (CGRect)frame
{
  sub_486338(self, (uint64_t)a2, (SEL *)&selRef_frame);
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
  v7 = self;
  sub_486408((SEL *)&selRef_frame, (SEL *)&selRef_setFrame_, x, y, width, height);
}

- (CGRect)bounds
{
  sub_486338(self, (uint64_t)a2, (SEL *)&selRef_bounds);
  result.size.double height = v5;
  result.size.double width = v4;
  result.origin.double y = v3;
  result.origin.double x = v2;
  return result;
}

- (void)setBounds:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  sub_486408((SEL *)&selRef_bounds, (SEL *)&selRef_setBounds_, x, y, width, height);
}

- (void)layoutSubviews
{
  double v2 = self;
  sub_486514();
}

- (_TtC16MusicApplication21VideoHeaderLockupView)accessibilityHeaderLockupView
{
  return (_TtC16MusicApplication21VideoHeaderLockupView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                                  + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_headerLockupView));
}

- (_TtC16MusicApplication13TextStackView)accessibilityHeadlineTextStackView
{
  return (_TtC16MusicApplication13TextStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_headlineTextStackView));
}

- (_TtC16MusicApplication13TextStackView)accessibilityTextStackView
{
  return (_TtC16MusicApplication13TextStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_textStackView));
}

- (_TtC16MusicApplication13TextStackView)accessibilityDescriptionTextStackView
{
  return (_TtC16MusicApplication13TextStackView *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                                                          + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_descriptionTextStackView));
}

- (UIImageView)accessibilityChevronImageView
{
  double v2 = self;
  id v3 = sub_486A08();

  return (UIImageView *)v3;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_playHandler));
  sub_9289C((uint64_t)self + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_artworkCornerTreatment);
  sub_34BEC(*(void **)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_artworkPlaceholder), *(void **)&self->headline[OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_artworkPlaceholder], *(void **)&self->headline[OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_artworkPlaceholder + 8], *(void **)&self->title[OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_artworkPlaceholder]);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_lockupImageArtworkCatalog));
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_headerLockupView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_headlineTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_descriptionTextStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell____lazy_storage___chevronImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC16MusicApplication17TVShowEpisodeCell_bottomHairlineView));

  swift_release();
}

+ (unint64_t)visualContentInsets
{
  sub_4871F4();
  unint64_t v1 = v0;
  if (qword_DBDD80 != -1) {
    swift_once();
  }
  if (!(v1 >> 62))
  {
    uint64_t v2 = *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8));
    swift_bridgeObjectRetain();
    if (v2) {
      goto LABEL_5;
    }
LABEL_12:
    swift_bridgeObjectRelease();
    goto LABEL_13;
  }
  swift_bridgeObjectRetain();
  uint64_t v2 = sub_AB8300();
  if (!v2) {
    goto LABEL_12;
  }
LABEL_5:
  unint64_t result = v2 - 1;
  if (__OFSUB__(v2, 1))
  {
    __break(1u);
    goto LABEL_15;
  }
  if ((v1 & 0xC000000000000001) != 0)
  {
LABEL_15:
    sub_AB8090();
    goto LABEL_10;
  }
  if ((result & 0x8000000000000000) != 0)
  {
    __break(1u);
  }
  else if (result < *(void *)((char *)&dword_10 + (v1 & 0xFFFFFFFFFFFFFF8)))
  {
    swift_retain();
LABEL_10:
    swift_bridgeObjectRelease();
    swift_beginAccess();
    swift_release();
LABEL_13:
    swift_bridgeObjectRelease();
    swift_release();
    swift_release();
    return swift_release();
  }
  __break(1u);
  return result;
}

@end