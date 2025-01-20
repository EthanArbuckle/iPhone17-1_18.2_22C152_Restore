@interface TVRootShowcaseCarouselContainerCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI35TVRootShowcaseCarouselContainerCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI35TVRootShowcaseCarouselContainerCell)initWithFrame:(CGRect)a3;
- (id)carouselView:(id)a3 cellForItemAtIndex:(int64_t)a4;
- (int64_t)indexForPreferredCenteredViewInCarouselView:(id)a3;
- (int64_t)numberOfItemsInCarouselView:(id)a3;
- (void)carouselView:(id)a3 didCenterItemAtIndex:(int64_t)a4;
- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(int64_t)a5;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TVRootShowcaseCarouselContainerCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A80FD70;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_carouselView);
  *(void *)(v3 + 32) = v4;
  sub_23A7FFC98();
  id v5 = v4;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI35TVRootShowcaseCarouselContainerCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI35TVRootShowcaseCarouselContainerCell *)sub_239E90D1C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI35TVRootShowcaseCarouselContainerCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239E93EDC();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  id v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVRootShowcaseCarouselContainerCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(TVRootShowcaseCarouselContainerCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void)layoutSubviews
{
  v2 = self;
  sub_239E91C1C();
}

- (void)didMoveToWindow
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TVRootShowcaseCarouselContainerCell();
  v2 = (char *)v5.receiver;
  [(TVRootShowcaseCarouselContainerCell *)&v5 didMoveToWindow];
  uint64_t v3 = (char *)objc_msgSend(v2, sel_window, v5.receiver, v5.super_class);
  if (v3)
  {
    uint64_t v4 = v3;

    v2 = v4;
  }
  else
  {
    *(void *)&v2[OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_impressionElements] = MEMORY[0x263F8EE78];
    swift_bridgeObjectRelease();
    v2[OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_isUpdatingImpression] = 0;
  }
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_itemInfo, &qword_268A0E7E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_carouselView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_pageControl));
  swift_bridgeObjectRelease();
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_onElementAppearance));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_onElementDisappearance));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_onImpressionableBoundsChange));
  sub_239C25118(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_onVisibleBoundsChange));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_leftArrowButton));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_rightArrowButton);
}

- (int64_t)numberOfItemsInCarouselView:(id)a3
{
  return (*(void **)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_items))[2];
}

- (id)carouselView:(id)a3 cellForItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = sub_239E94560(a4);

  return v8;
}

- (int64_t)indexForPreferredCenteredViewInCarouselView:(id)a3
{
  if (*((unsigned char *)&self->super.super.super.super._responderFlags
       + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_preferredCenterIndex) == 1)
    return (int64_t)objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_pageControl), sel_currentPage, a3);
  else {
    return *(int64_t *)((char *)&self->super.super.super.super.super.isa
  }
                             + OBJC_IVAR____TtC9SeymourUI35TVRootShowcaseCarouselContainerCell_preferredCenterIndex);
}

- (void)carouselView:(id)a3 didCenterItemAtIndex:(int64_t)a4
{
  id v6 = a3;
  v7 = self;
  sub_239E94B5C(a4);
}

- (void)carouselView:(id)a3 willDisplayCell:(id)a4 forItemAtIndex:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = self;
  sub_239E94D78(a5);
}

@end