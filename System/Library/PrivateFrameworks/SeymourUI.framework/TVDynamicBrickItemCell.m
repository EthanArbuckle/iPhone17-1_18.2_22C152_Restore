@interface TVDynamicBrickItemCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI22TVDynamicBrickItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI22TVDynamicBrickItemCell)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation TVDynamicBrickItemCell

- (_TtC9SeymourUI22TVDynamicBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI22TVDynamicBrickItemCell *)sub_239F7ADE4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI22TVDynamicBrickItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F7D8D4();
}

- (void)layoutSubviews
{
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for TVDynamicBrickItemCell();
  v2 = (char *)v13.receiver;
  [(TVDynamicBrickItemCell *)&v13 layoutSubviews];
  id v3 = *(void **)&v2[OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_gradientLayer];
  id v4 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_floatingView], sel_contentView, v13.receiver, v13.super_class);
  objc_msgSend(v4, sel_bounds);
  double v6 = v5;
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;

  objc_msgSend(v3, sel_setFrame_, v6, v8, v10, v12);
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  double v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  double v6 = (objc_class *)type metadata accessor for TVDynamicBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  double v7 = self;
  [(TVFocusableCollectionViewCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
  objc_msgSend(*(id *)((char *)&v7->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_titleLabel), sel_setAttributedText_, 0);
  objc_msgSend(*(id *)((char *)&v7->super.super.super.super.super.super.isa+ OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_subtitleLabel), sel_setAttributedText_, 0);
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(TVDynamicBrickItemCell *)v9 contentView];
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
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_delegate);
  sub_239C25128((uint64_t)self + OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_itemInfo, &qword_268A0E7E0);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_tvArtworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_floatingView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_gradientLayer));
  uint64_t v3 = *(UIWindow **)((char *)&self->super.super.super.super._window
                    + OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_layout);
  objc_release(*(id *)((char *)&self->super.super.super.super._gestureRecognizers
                     + OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_layout));

  uint64_t v4 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI22TVDynamicBrickItemCell_layoutGuide);
}

@end