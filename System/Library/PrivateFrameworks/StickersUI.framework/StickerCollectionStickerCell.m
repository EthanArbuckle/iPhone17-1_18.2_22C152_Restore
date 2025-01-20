@interface StickerCollectionStickerCell
- (BOOL)canHandleTap;
- (_TtC10StickersUI28StickerCollectionStickerCell)initWithCoder:(id)a3;
- (_TtC10StickersUI28StickerCollectionStickerCell)initWithFrame:(CGRect)a3;
- (void)_bridgedUpdateConfigurationUsingState:(id)a3;
- (void)handleDelete:(id)a3;
- (void)handleLongPress:(id)a3 recognizer:(id)a4;
- (void)handleTap:(id)a3 recognizer:(id)a4;
- (void)handleWillTap:(id)a3;
- (void)layoutSubviews;
- (void)prepareForReuse;
@end

@implementation StickerCollectionStickerCell

- (_TtC10StickersUI28StickerCollectionStickerCell)initWithFrame:(CGRect)a3
{
  return (_TtC10StickersUI28StickerCollectionStickerCell *)sub_25E48157C(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC10StickersUI28StickerCollectionStickerCell)initWithCoder:(id)a3
{
  return (_TtC10StickersUI28StickerCollectionStickerCell *)sub_25E481A8C(a3);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_25E481C14();
}

- (void)_bridgedUpdateConfigurationUsingState:(id)a3
{
  uint64_t v4 = sub_25E4A2050();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x270FA5388](v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25E4A2040();
  v8 = self;
  sub_25E481D04();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_25E482244();
}

- (void)handleDelete:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A6EFD80);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = (char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate;
  if (MEMORY[0x2611D9870]((char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate))
  {
    uint64_t v9 = *((void *)v8 + 1);
    uint64_t ObjectType = swift_getObjectType();
    v11 = *(void (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)self->super.super.super.super.super.isa) + 0xA8);
    id v12 = a3;
    v13 = self;
    v11();
    (*(void (**)(char *, uint64_t, uint64_t))(v9 + 32))(v7, ObjectType, v9);
    swift_unknownObjectRelease();
    sub_25E4417FC((uint64_t)v7, &qword_26A6EFD80);
  }
}

- (void).cxx_destruct
{
  sub_25E4417FC((uint64_t)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_stickerIdentifier, &qword_26A6EFD80);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_msSticker));
  sub_25E43DCDC((uint64_t)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_stickerView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell__rearrangingView));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell____lazy_storage___deleteButton);
}

- (BOOL)canHandleTap
{
  v3 = (char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate;
  if (MEMORY[0x2611D9870]((char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate, a2))
  {
    uint64_t v4 = *((void *)v3 + 1);
    uint64_t ObjectType = swift_getObjectType();
    uint64_t v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 96);
    v7 = self;
    char v8 = v6(ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
    char v8 = 1;
  }
  return v8 & 1;
}

- (void)handleTap:(id)a3 recognizer:(id)a4
{
  v7 = (char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate;
  if (MEMORY[0x2611D9870]((char *)self + OBJC_IVAR____TtC10StickersUI28StickerCollectionStickerCell_delegate, a2))
  {
    uint64_t v8 = *((void *)v7 + 1);
    swift_getObjectType();
    uint64_t v9 = *(void (**)(void))(v8 + 64);
    id v10 = a3;
    id v11 = a4;
    id v12 = self;
    v9();

    swift_unknownObjectRelease();
  }
}

- (void)handleWillTap:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_25E484CE0(v4);
}

- (void)handleLongPress:(id)a3 recognizer:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_25E486268(v7);
}

@end