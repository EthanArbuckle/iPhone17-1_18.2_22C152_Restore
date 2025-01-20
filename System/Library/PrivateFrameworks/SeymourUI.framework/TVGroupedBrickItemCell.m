@interface TVGroupedBrickItemCell
- (UILabel)accessibilitySubtitleLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC9SeymourUI22TVGroupedBrickItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI22TVGroupedBrickItemCell)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
@end

@implementation TVGroupedBrickItemCell

- (_TtC9SeymourUI22TVGroupedBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22TVGroupedBrickItemCell *)sub_239CBC9F4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22TVGroupedBrickItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239CBEF20();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVGroupedBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(TVFocusableCollectionViewCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_239CBDE18(v6, (uint64_t)v7);
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_titleLabel));
}

- (UILabel)accessibilitySubtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_subtitleLabel));
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_itemInfo);
  uint64_t v3 = *(void **)((char *)&self->super.super.super.super._viewFlags
                + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_layout);
  objc_release(*(id *)((char *)&self->super.super.super.super._viewFlags
                     + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_layout
                     + 8));

  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_textStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_titleLabel));
  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI22TVGroupedBrickItemCell_subtitleLabel);
}

@end