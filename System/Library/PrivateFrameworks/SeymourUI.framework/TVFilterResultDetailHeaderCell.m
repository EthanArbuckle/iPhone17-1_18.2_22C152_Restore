@interface TVFilterResultDetailHeaderCell
- (BOOL)canBecomeFocused;
- (NSArray)preferredFocusEnvironments;
- (UILabel)accessibilityActionLabel;
- (UILabel)accessibilitySubtitleLabel;
- (UILabel)accessibilityTitleLabel;
- (_TtC9SeymourUI30TVFilterResultDetailHeaderCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI30TVFilterResultDetailHeaderCell)initWithFrame:(CGRect)a3;
- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4;
- (void)prepareForReuse;
- (void)primaryActionButtonPressed:(id)a3;
- (void)secondaryActionButtonPressed:(id)a3;
@end

@implementation TVFilterResultDetailHeaderCell

- (BOOL)canBecomeFocused
{
  v2 = self;
  unsigned __int8 v3 = sub_239EBCB2C();

  return v3 & 1;
}

- (NSArray)preferredFocusEnvironments
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_buttonStackView);
  unsigned __int8 v3 = self;
  id v4 = objc_msgSend(v2, sel_arrangedSubviews);
  sub_239C24FF0(0, (unint64_t *)&qword_268A0EBE0);
  unint64_t v5 = sub_23A7FFC78();

  sub_23A5AD554(v5);
  swift_bridgeObjectRelease();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_268A0E2A0);
  v6 = (void *)sub_23A7FFC58();
  swift_bridgeObjectRelease();

  return (NSArray *)v6;
}

- (_TtC9SeymourUI30TVFilterResultDetailHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI30TVFilterResultDetailHeaderCell *)sub_239EBCD18(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI30TVFilterResultDetailHeaderCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EBF1EC();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  unint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TVFilterResultDetailHeaderCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(TVFilterResultDetailHeaderCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (void)primaryActionButtonPressed:(id)a3
{
  uint64_t v5 = type metadata accessor for ShelfItemAction();
  __n128 v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_delegate, v6);
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = swift_storeEnumTagMultiPayload();
    MEMORY[0x270FA5388](v11);
    *(&v14 - 4) = 0;
    *((unsigned char *)&v14 - 24) = 1;
    *(&v14 - 2) = (uint64_t)v8;
    *(&v14 - 1) = v10;
    id v12 = a3;
    v13 = self;
    sub_239C831A4(v13, sub_239C74FF8, &v14 - 6, v10);
    swift_unknownObjectRelease();
    sub_239C74FFC((uint64_t)v8);
  }
}

- (void)secondaryActionButtonPressed:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_239EBF780();
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_239EBE3F0(v6, (uint64_t)v7);
}

- (UILabel)accessibilityTitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_titleLabel));
}

- (UILabel)accessibilitySubtitleLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_subtitleLabel));
}

- (UILabel)accessibilityActionLabel
{
  return (UILabel *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                            + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_actionLabel));
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_actionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_buttonStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_focusGuide));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI30TVFilterResultDetailHeaderCell_labelStackViewTrailingConstraint);
}

@end