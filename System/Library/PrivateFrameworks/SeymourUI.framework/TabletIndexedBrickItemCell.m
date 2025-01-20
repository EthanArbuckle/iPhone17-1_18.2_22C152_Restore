@interface TabletIndexedBrickItemCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI26TabletIndexedBrickItemCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI26TabletIndexedBrickItemCell)initWithFrame:(CGRect)a3;
- (void)handleDownloadButtonTapped;
- (void)prepareForReuse;
- (void)updateFonts:(id)a3;
@end

@implementation TabletIndexedBrickItemCell

- (_TtC9SeymourUI26TabletIndexedBrickItemCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI26TabletIndexedBrickItemCell *)sub_239F5F8E4(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI26TabletIndexedBrickItemCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239F63524();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for TabletIndexedBrickItemCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(TabletIndexedBrickItemCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(TabletIndexedBrickItemCell *)v9 contentView];
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
  uint64_t v8 = self;
  sub_239F60F70();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)handleDownloadButtonTapped
{
  uint64_t v3 = type metadata accessor for ShelfItemAction();
  __n128 v4 = MEMORY[0x270FA5388](v3);
  uint64_t v6 = (char *)&v11 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_delegate, v4);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = swift_storeEnumTagMultiPayload();
    MEMORY[0x270FA5388](v9);
    *(&v11 - 4) = 0;
    *((unsigned char *)&v11 - 24) = 1;
    *(&v11 - 2) = (uint64_t)v6;
    *(&v11 - 1) = v8;
    id v10 = self;
    sub_239C831A4(v10, sub_239C75058, &v11 - 6, v8);
    swift_unknownObjectRelease();
    sub_239C958F4((uint64_t)v6, (uint64_t (*)(void))type metadata accessor for ShelfItemAction);
  }
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_delegate);
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_artworkView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_indexLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_downloadButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_textBoxLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_indexLeadingConstraint));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI26TabletIndexedBrickItemCell_textBoxLayoutGuideLeadingConstraint);
}

@end