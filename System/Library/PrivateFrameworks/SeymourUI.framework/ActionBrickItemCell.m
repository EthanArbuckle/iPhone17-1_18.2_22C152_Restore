@interface ActionBrickItemCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI19ActionBrickItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI19ActionBrickItemCell)initWithFrame:(CGRect)a3;
- (void)downloadButtonTapped:(id)a3;
- (void)prepareForReuse;
@end

@implementation ActionBrickItemCell

- (_TtC9SeymourUI19ActionBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI19ActionBrickItemCell *)sub_239C936B4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI19ActionBrickItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239C95954();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_239C9461C();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  id v10 = [(ActionBrickItemCell *)v9 contentView];
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

- (void)downloadButtonTapped:(id)a3
{
  uint64_t v5 = type metadata accessor for ShelfItemAction();
  __n128 v6 = MEMORY[0x270FA5388](v5);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI19ActionBrickItemCell_delegate, v6);
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
    double v13 = self;
    sub_239C831A4(v13, sub_239C75058, &v14 - 6, v10);
    swift_unknownObjectRelease();
    sub_239C958F4((uint64_t)v8, (uint64_t (*)(void))type metadata accessor for ShelfItemAction);
  }
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI19ActionBrickItemCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI19ActionBrickItemCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19ActionBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19ActionBrickItemCell_downloadButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI19ActionBrickItemCell_subtitleLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI19ActionBrickItemCell_titleLabel);
}

@end