@interface ModalityPickerItemCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI22ModalityPickerItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI22ModalityPickerItemCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
@end

@implementation ModalityPickerItemCell

- (_TtC9SeymourUI22ModalityPickerItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22ModalityPickerItemCell *)sub_23A74D858(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22ModalityPickerItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A74F9A0();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for ModalityPickerItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(ModalityPickerItemCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(ModalityPickerItemCell *)v9 contentView];
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
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_itemInfo);
  long long v3 = *(_OWORD *)((char *)&self->super.super.super._minXVariable
                 + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  v9[10] = *(_OWORD *)((char *)&self->super.super.super._layer
                     + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  v9[11] = v3;
  uint64_t v10 = *(uint64_t *)((char *)&self->super.super.super._boundsWidthVariable
                   + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  long long v4 = *(_OWORD *)((char *)&self->super.super.super._viewFlags
                 + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider
                 + 16);
  v9[6] = *(_OWORD *)((char *)&self->super.super.super._viewFlags
                    + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  v9[7] = v4;
  long long v5 = *(_OWORD *)((char *)&self->super.super.super._minimumSafeAreaInsets.bottom
                 + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  v9[8] = *(_OWORD *)((char *)&self->super.super.super._minimumSafeAreaInsets.top
                    + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  v9[9] = v5;
  long long v6 = *(_OWORD *)((char *)&self->super.super.super._traitChangeRegistry
                 + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  v9[2] = *(_OWORD *)((char *)&self->super.super.super._cachedTraitCollection
                    + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  v9[3] = v6;
  long long v7 = *(_OWORD *)((char *)&self->super.super.super._gestureRecognizers
                 + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  v9[4] = *(_OWORD *)((char *)&self->super.super.super._subviewCache
                    + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  v9[5] = v7;
  long long v8 = *(_OWORD *)((char *)&self->super.super.super.super.__layeringSceneIdentity
                 + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  v9[0] = *(_OWORD *)((char *)&self->super.super.super.super.super.isa
                    + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_styleProvider);
  v9[1] = v8;
  sub_23A74FB40((uint64_t)v9);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22ModalityPickerItemCell_titleLabel));
}

@end