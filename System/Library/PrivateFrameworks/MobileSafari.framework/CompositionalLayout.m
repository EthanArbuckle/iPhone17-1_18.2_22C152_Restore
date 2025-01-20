@interface CompositionalLayout
- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithCoder:(id)a3;
- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSection:(id)a3;
- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSectionProvider:(id)a3;
- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
@end

@implementation CompositionalLayout

- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSectionProvider:(id)a3
{
  v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemDown) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemUp) = 0;
  aBlock[4] = sub_18C57B734;
  aBlock[5] = v5;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18C579E04;
  aBlock[3] = &block_descriptor_98;
  v6 = _Block_copy(aBlock);
  sub_18C6F7B98();
  swift_release();
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for CompositionalLayout();
  v7 = [(CompositionalLayout *)&v9 initWithSectionProvider:v6];
  swift_release();
  _Block_release(v6);
  return v7;
}

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = sub_18C6F8478();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_18C6F8438();
  v8 = self;
  objc_super v9 = (void *)sub_18C6F8418();
  v10 = (objc_class *)type metadata accessor for CompositionalLayout();
  v13.receiver = v8;
  v13.super_class = v10;
  id v11 = [(CompositionalLayout *)&v13 layoutAttributesForItemAtIndexPath:v9];

  if (v11) {
    sub_18C579BC4(v11);
  }

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v11;
}

- (id)layoutAttributesForElementsInRect:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = self;
  uint64_t v8 = sub_18C57985C(x, y, width, height);

  if (v8)
  {
    sub_18C38D908(0, (unint64_t *)&unk_1E9177A80);
    objc_super v9 = (void *)sub_18C6F99C8();
    swift_bridgeObjectRelease();
  }
  else
  {
    objc_super v9 = 0;
  }

  return v9;
}

- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSection:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemDown) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemUp) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CompositionalLayout();
  return [(CompositionalLayout *)&v5 initWithSection:a3];
}

- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemDown) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemUp) = 0;
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CompositionalLayout();
  return [(CompositionalLayout *)&v7 initWithSection:a3 configuration:a4];
}

- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  uint64_t v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemDown) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemUp) = 0;
  aBlock[4] = sub_18C57A0D4;
  aBlock[5] = v7;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_18C579E04;
  aBlock[3] = &block_descriptor_13;
  uint64_t v8 = _Block_copy(aBlock);
  id v9 = a4;
  sub_18C6F7B98();
  swift_release();
  v12.receiver = self;
  v12.super_class = (Class)type metadata accessor for CompositionalLayout();
  v10 = [(CompositionalLayout *)&v12 initWithSectionProvider:v8 configuration:v9];
  swift_release();

  _Block_release(v8);
  return v10;
}

- (_TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemDown) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC12MobileSafariP33_DA0FD1D9453FFEF6CCD88A7A825CA7EA19CompositionalLayout_isMovingItemUp) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for CompositionalLayout();
  return [(CompositionalLayout *)&v5 initWithCoder:a3];
}

@end