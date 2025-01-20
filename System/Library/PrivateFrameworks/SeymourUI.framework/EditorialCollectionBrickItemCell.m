@interface EditorialCollectionBrickItemCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI32EditorialCollectionBrickItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI32EditorialCollectionBrickItemCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation EditorialCollectionBrickItemCell

- (_TtC9SeymourUI32EditorialCollectionBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI32EditorialCollectionBrickItemCell *)sub_23A4E7748(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI32EditorialCollectionBrickItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A4E8B50();
  return result;
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for EditorialCollectionBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(EditorialCollectionBrickItemCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(EditorialCollectionBrickItemCell *)v9 contentView];
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

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionBrickItemCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionBrickItemCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionBrickItemCell_containerView));
  uint64_t v3 = *(void **)((char *)&self->super.super.super.super._responderFlags
                + OBJC_IVAR____TtC9SeymourUI32EditorialCollectionBrickItemCell_layout);
}

@end