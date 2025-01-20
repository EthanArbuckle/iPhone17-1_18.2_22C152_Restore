@interface TVRootShowcaseCarouselItemCell
- (BOOL)canBecomeFocused;
- (CGSize)intrinsicContentSize;
- (UILabel)accessibilityCaptionLabel;
- (UILabel)accessibilitySubtitleLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC9SeymourUI30TVRootShowcaseCarouselItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI30TVRootShowcaseCarouselItemCell)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)handleTappedButton:(id)a3;
- (void)prepareForReuse;
- (void)restartVideo;
@end

@implementation TVRootShowcaseCarouselItemCell

- (CGSize)intrinsicContentSize
{
  double v2 = *(double *)((char *)&self->super.super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_layout
                 + 16);
  double v3 = *(double *)((char *)&self->super.super.super.super.super.super.isa
                 + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_layout);
  result.height = v3;
  result.width = v2;
  return result;
}

- (BOOL)canBecomeFocused
{
  return (*(void **)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_buttonActions))[2] == 0;
}

- (_TtC9SeymourUI30TVRootShowcaseCarouselItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI30TVRootShowcaseCarouselItemCell *)sub_23A258434(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI30TVRootShowcaseCarouselItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A25BF2C();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVRootShowcaseCarouselItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(TVFocusableCollectionViewCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void)didMoveToWindow
{
  double v2 = self;
  sub_23A259838();
}

- (void)handleTappedButton:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_23A25AD18((uint64_t)v4);
}

- (void)restartVideo
{
  uint64_t v3 = OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_avPlayer;
  id v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_avPlayer);
  if (v4)
  {
    uint64_t v5 = MEMORY[0x263F010E0];
    uint64_t v6 = *MEMORY[0x263F010E0];
    uint64_t v7 = *(void *)(MEMORY[0x263F010E0] + 16);
    uint64_t v8 = self;
    v11[0] = v6;
    v11[1] = *(void *)(v5 + 8);
    v11[2] = v7;
    objc_msgSend(v4, sel_seekToTime_, v11);
    uint64_t v9 = *(Class *)((char *)&self->super.super.super.super.super.super.isa + v3);
  }
  else
  {
    uint64_t v10 = self;
    uint64_t v9 = 0;
  }
  objc_msgSend(v9, sel_play);
}

- (UILabel)accessibilityCaptionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_captionLabel));
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_titleLabel));
}

- (UILabel)accessibilitySubtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_subtitleLabel));
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_itemInfo, &qword_268A0E7E0);
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_carouselItemDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_avPlayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_avPlayerLayer));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_blurView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_focusContainerGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVRootShowcaseCarouselItemCell_buttonWidthConstraint));
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end