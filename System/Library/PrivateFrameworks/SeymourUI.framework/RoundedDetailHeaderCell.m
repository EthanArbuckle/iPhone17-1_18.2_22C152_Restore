@interface RoundedDetailHeaderCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI23RoundedDetailHeaderCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI23RoundedDetailHeaderCell)initWithFrame:(CGRect)a3;
- (void)didMoveToWindow;
- (void)layoutSubviews;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation RoundedDetailHeaderCell

- (_TtC9SeymourUI23RoundedDetailHeaderCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23RoundedDetailHeaderCell *)sub_23A073BEC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23RoundedDetailHeaderCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A075BEC();
}

- (void)didMoveToWindow
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for RoundedDetailHeaderCell();
  id v2 = v3.receiver;
  [(RoundedDetailHeaderCell *)&v3 didMoveToWindow];
  sub_23A074C88();
}

- (void)layoutSubviews
{
  id v2 = self;
  sub_23A074C88();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for RoundedDetailHeaderCell();
  [(RoundedDetailHeaderCell *)&v3 layoutSubviews];
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for RoundedDetailHeaderCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(RoundedDetailHeaderCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI23RoundedDetailHeaderCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(RoundedDetailHeaderCell *)v9 contentView];
  *(float *)&double v11 = a4;
  *(float *)&double v12 = a5;
  objc_msgSend(v10, sel_systemLayoutSizeFittingSize_withHorizontalFittingPriority_verticalFittingPriority_, width, height, v11, v12);
  double v14 = v13;
  double v16 = v15;

  double v17 = v14;
  double v18 = v16;
  result.double height = v18;
  result.double width = v17;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for RoundedDetailHeaderCell();
  id v4 = a3;
  id v5 = v7.receiver;
  [(RoundedDetailHeaderCell *)&v7 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(v5, sel_traitCollection, v7.receiver, v7.super_class);
  sub_23A074D5C(v6, a3);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23RoundedDetailHeaderCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23RoundedDetailHeaderCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23RoundedDetailHeaderCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23RoundedDetailHeaderCell_shadowView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23RoundedDetailHeaderCell_titleLabel));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI23RoundedDetailHeaderCell_textContainer);
}

@end