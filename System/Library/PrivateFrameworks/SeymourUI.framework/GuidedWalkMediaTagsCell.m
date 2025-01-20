@interface GuidedWalkMediaTagsCell
- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5;
- (_TtC9SeymourUI23GuidedWalkMediaTagsCell)initWithCoder:(id)a3;
- (_TtC9SeymourUI23GuidedWalkMediaTagsCell)initWithFrame:(CGRect)a3;
- (void)handleDownloadButtonTapped:(id)a3;
- (void)prepareForReuse;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation GuidedWalkMediaTagsCell

- (_TtC9SeymourUI23GuidedWalkMediaTagsCell)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI23GuidedWalkMediaTagsCell *)sub_23A5E6FFC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI23GuidedWalkMediaTagsCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_23A5E8D18();
}

- (void)prepareForReuse
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A0E7E0);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (objc_class *)type metadata accessor for GuidedWalkMediaTagsCell();
  v11.receiver = self;
  v11.super_class = v6;
  v7 = self;
  [(GuidedWalkMediaTagsCell *)&v11 prepareForReuse];
  uint64_t v8 = type metadata accessor for ShelfCellItemInfo();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v5, 1, 1, v8);
  uint64_t v9 = (uint64_t)v7 + OBJC_IVAR____TtC9SeymourUI23GuidedWalkMediaTagsCell_itemInfo;
  swift_beginAccess();
  sub_239C74F28((uint64_t)v5, v9);
  swift_endAccess();
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)a3 withHorizontalFittingPriority:(float)a4 verticalFittingPriority:(float)a5
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v9 = self;
  id v10 = [(GuidedWalkMediaTagsCell *)v9 contentView];
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
  sub_23A5E7628(a3);
}

- (void)handleDownloadButtonTapped:(id)a3
{
  uint64_t v5 = type metadata accessor for ShelfItemAction();
  __n128 v6 = MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v9 = MEMORY[0x23ECB8640]((char *)self + OBJC_IVAR____TtC9SeymourUI23GuidedWalkMediaTagsCell_delegate, v6);
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
    sub_239C74FFC((uint64_t)v8);
  }
}

- (void).cxx_destruct
{
  sub_239C1AE10((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23GuidedWalkMediaTagsCell_delegate);
  swift_bridgeObjectRelease();
  sub_239C752B4((uint64_t)self + OBJC_IVAR____TtC9SeymourUI23GuidedWalkMediaTagsCell_itemInfo);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI23GuidedWalkMediaTagsCell_downloadButton));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC9SeymourUI23GuidedWalkMediaTagsCell_summaryTextLabel);
}

@end