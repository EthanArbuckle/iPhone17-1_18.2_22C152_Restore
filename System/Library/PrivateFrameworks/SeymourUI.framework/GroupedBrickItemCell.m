@interface GroupedBrickItemCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI20GroupedBrickItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI20GroupedBrickItemCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GroupedBrickItemCell

- (_TtC9SeymourUI20GroupedBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI20GroupedBrickItemCell *)sub_23A399094(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI20GroupedBrickItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A39BAC8();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for GroupedBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(GroupedBrickItemCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(GroupedBrickItemCell *)v9 contentView];
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
  id v5 = a3;
  v6 = self;
  sub_23A399A30(a3);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_stackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_headerLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_container));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_textLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_separator));
  long long v3 = *(_OWORD *)((char *)&self->super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider
                 + 16);
  v7[6] = *(_OWORD *)((char *)&self->super.super.super._viewFlags
                    + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[7] = v3;
  v7[8] = *(_OWORD *)((char *)&self->super.super.super._minimumSafeAreaInsets.top
                    + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  long long v4 = *(_OWORD *)((char *)&self->super.super.super._traitChangeRegistry
                 + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[2] = *(_OWORD *)((char *)&self->super.super.super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[3] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super.super._gestureRecognizers
                 + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[4] = *(_OWORD *)((char *)&self->super.super.super._subviewCache
                    + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[5] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI20GroupedBrickItemCell_styleProvider);
  v7[1] = v6;
  sub_23A39C11C((uint64_t)v7);
}

@end