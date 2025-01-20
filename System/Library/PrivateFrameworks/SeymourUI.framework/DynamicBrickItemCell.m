@interface DynamicBrickItemCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI20DynamicBrickItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI20DynamicBrickItemCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation DynamicBrickItemCell

- (_TtC9SeymourUI20DynamicBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI20DynamicBrickItemCell *)sub_23A36254C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI20DynamicBrickItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A36492C();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for DynamicBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(DynamicBrickItemCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI20DynamicBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
  objc_msgSend(*(id *)((char *)&v7->super.super.super.super.super.isa + OBJC_IVAR____TtC9SeymourUI20DynamicBrickItemCell_titleLabel), sel_setAttributedText_, 0);
  objc_msgSend(*(id *)((char *)&v7->super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI20DynamicBrickItemCell_subtitleLabel), sel_setAttributedText_, 0);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(DynamicBrickItemCell *)v9 contentView];
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
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20DynamicBrickItemCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20DynamicBrickItemCell_itemInfo, &qword_268A0E7E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20DynamicBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20DynamicBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20DynamicBrickItemCell_subtitleLabel));
  uint64_t v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC9SeymourUI20DynamicBrickItemCell_layout);
  objc_release(*(id *)((char *)&self->super.super.super._cachedTraitCollection
                     + OBJC_IVAR____TtC9SeymourUI20DynamicBrickItemCell_layout));

  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI20DynamicBrickItemCell_layoutGuide);
}

@end