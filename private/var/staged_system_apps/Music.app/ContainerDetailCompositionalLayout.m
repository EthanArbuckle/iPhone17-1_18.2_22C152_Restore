@interface ContainerDetailCompositionalLayout
- (_TtC5Music34ContainerDetailCompositionalLayout)initWithCoder:(id)a3;
- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSection:(id)a3;
- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4;
- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5;
- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSectionProvider:(id)a3;
- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4;
- (id)layoutAttributesForElementsInRect:(CGRect)a3;
- (id)layoutAttributesForItemAtIndexPath:(id)a3;
@end

@implementation ContainerDetailCompositionalLayout

- (id)layoutAttributesForItemAtIndexPath:(id)a3
{
  uint64_t v4 = type metadata accessor for IndexPath();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static IndexPath._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  Class isa = IndexPath._bridgeToObjectiveC()().super.isa;
  v10 = (objc_class *)type metadata accessor for ContainerDetailCompositionalLayout();
  v14.receiver = v8;
  v14.super_class = v10;
  id v11 = [(ContainerDetailCompositionalLayout *)&v14 layoutAttributesForItemAtIndexPath:isa];

  v12 = *(void (**)(id, char *))((char *)&v8->super.super.super.isa
                                          + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  if (v12)
  {
    swift_retain();
    v12(v11, v7);
    sub_10006ADFC((uint64_t)v12);
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
  unint64_t v8 = sub_10064161C(x, y, width, height);

  if (v8)
  {
    sub_100057778(0, (unint64_t *)&qword_1010AC360);
    v9.super.Class isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v9.super.Class isa = 0;
  }

  return v9.super.isa;
}

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSection:(id)a3
{
  uint64_t v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  uint64_t v6 = (objc_class *)type metadata accessor for ContainerDetailCompositionalLayout();
  *uint64_t v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(ContainerDetailCompositionalLayout *)&v8 initWithSection:a3];
}

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSection:(id)a3 configuration:(id)a4
{
  v7 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  objc_super v8 = (objc_class *)type metadata accessor for ContainerDetailCompositionalLayout();
  void *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return [(ContainerDetailCompositionalLayout *)&v10 initWithSection:a3 configuration:a4];
}

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSectionProvider:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  *uint64_t v6 = 0;
  v6[1] = 0;
  aBlock[4] = sub_100648358;
  aBlock[5] = v5;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10050AE20;
  aBlock[3] = &unk_100FE3308;
  v7 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ContainerDetailCompositionalLayout();
  objc_super v8 = [(ContainerDetailCompositionalLayout *)&v10 initWithSectionProvider:v7];
  swift_release();
  _Block_release(v7);
  return v8;
}

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSectionProvider:(id)a3 configuration:(id)a4
{
  uint64_t v6 = _Block_copy(a3);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  objc_super v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  void *v8 = 0;
  v8[1] = 0;
  aBlock[4] = sub_100648358;
  aBlock[5] = v7;
  aBlock[0] = _NSConcreteStackBlock;
  aBlock[1] = 1107296256;
  aBlock[2] = sub_10050AE20;
  aBlock[3] = &unk_100FE32B8;
  NSArray v9 = _Block_copy(aBlock);
  id v10 = a4;
  swift_retain();
  swift_release();
  v13.receiver = self;
  v13.super_class = (Class)type metadata accessor for ContainerDetailCompositionalLayout();
  id v11 = [(ContainerDetailCompositionalLayout *)&v13 initWithSectionProvider:v9 configuration:v10];
  swift_release();

  _Block_release(v9);
  return v11;
}

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithCoder:(id)a3
{
  uint64_t v5 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes);
  uint64_t v6 = (objc_class *)type metadata accessor for ContainerDetailCompositionalLayout();
  *uint64_t v5 = 0;
  v5[1] = 0;
  v8.receiver = self;
  v8.super_class = v6;
  return [(ContainerDetailCompositionalLayout *)&v8 initWithCoder:a3];
}

- (_TtC5Music34ContainerDetailCompositionalLayout)initWithSection:(id)a3 sectionProvider:(id)a4 configuration:(id)a5
{
  uint64_t v7 = _Block_copy(a4);
  if (v7)
  {
    uint64_t v8 = swift_allocObject();
    *(void *)(v8 + 16) = v7;
    uint64_t v7 = sub_100644988;
  }
  else
  {
    uint64_t v8 = 0;
  }
  id v9 = a3;
  return (_TtC5Music34ContainerDetailCompositionalLayout *)sub_100641CC4(a3, (uint64_t)v7, v8, a5);
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC5Music34ContainerDetailCompositionalLayout_willLayoutAttributes));
}

@end