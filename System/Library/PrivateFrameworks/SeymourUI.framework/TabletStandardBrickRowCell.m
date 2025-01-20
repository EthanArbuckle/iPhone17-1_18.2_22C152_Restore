@interface TabletStandardBrickRowCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI26TabletStandardBrickRowCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI26TabletStandardBrickRowCell)initWithFrame:(CGRect)a3;
- (void)prepareForReuse;
- (void)updateFonts:(id)a3;
@end

@implementation TabletStandardBrickRowCell

- (_TtC9SeymourUI26TabletStandardBrickRowCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26TabletStandardBrickRowCell *)sub_23A3B6944(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26TabletStandardBrickRowCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A3B9004();
}

- (void)prepareForReuse
{
  v2 = self;
  sub_23A3B7940();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  v9 = self;
  id v10 = [(TabletStandardBrickRowCell *)v9 contentView];
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

- (void)updateFonts:(id)a3
{
  uint64_t v4 = sub_23A7F5F48();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_23A7F5F18();
  v8 = self;
  sub_23A3B7F38();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26TabletStandardBrickRowCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26TabletStandardBrickRowCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletStandardBrickRowCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletStandardBrickRowCell_captionLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletStandardBrickRowCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletStandardBrickRowCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletStandardBrickRowCell_contentViewBottomConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26TabletStandardBrickRowCell_titleLabelTopConstraint);
}

@end