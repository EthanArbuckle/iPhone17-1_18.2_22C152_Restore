@interface TVQueueListHeaderCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (_TtC9SeymourUI21TVQueueListHeaderCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI21TVQueueListHeaderCell)initWithFrame:(CGRect)a3;
- (void)handleMainActionButtonTapped;
@end

@implementation TVQueueListHeaderCell

- (BOOL)canBecomeFocused
{
  return 0;
}

- (NSArray)preferredFocusEnvironments
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_26AF608E0);
  uint64_t v3 = swift_allocObject();
  *(_OWORD *)(v3 + 16) = xmmword_23A810430;
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_mainButton);
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_ellipsisButton);
  *(void *)(v3 + 32) = v4;
  *(void *)(v3 + 40) = v5;
  sub_23A7FFC98();
  id v6 = v4;
  id v7 = v5;
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v8 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v8;
}

- (_TtC9SeymourUI21TVQueueListHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21TVQueueListHeaderCell *)sub_23A6658DC();
}

- (_TtC9SeymourUI21TVQueueListHeaderCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A66713C();
}

- (void)handleMainActionButtonTapped
{
  v2 = self;
  sub_23A663D3C();
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_itemInfo, &qword_268A0E7E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_buttonFocusGuide));
  id v3 = *(UITraitCollection **)((char *)&self->super.super.super._cachedTraitCollection
                             + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_layout);
  v4 = *(id *)((char *)&self->super.super.super._swiftAnimationInfo
             + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_layout);
  objc_release(*(id *)((char *)&self->super.super.super._traitChangeRegistry
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_layout));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_overviewLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_durationLabel));
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_mainButtonAction, (uint64_t *)&unk_268A15C90);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_mainButtonTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_mainButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_ellipsisButton));
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI21TVQueueListHeaderCell_ellipsisButtonContentView);
}

@end