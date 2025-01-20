@interface InformationCell
- (_TtC23ShelfKitCollectionViews15InformationCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews15InformationCell)initWithFrame:(CGRect)a3;
- (void)traitCollectionDidChange:(id)a3;
@end

@implementation InformationCell

- (void)traitCollectionDidChange:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  id v5 = v6.receiver;
  [(InformationCell *)&v6 traitCollectionDidChange:v4];
  sub_1697DC();
}

- (_TtC23ShelfKitCollectionViews15InformationCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_kind) = 14;
  v9 = (char *)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_info;
  uint64_t v10 = sub_37FF60();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v9, 1, 1, v10);
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_shouldShowChevron) = 0;
  *((unsigned char *)&self->super.super.super.super.super.super.isa
  + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_shouldShowDownwardChevron) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_objectGraph) = 0;
  v11 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_reload);
  void *v11 = 0;
  v11[1] = 0;
  v13.receiver = self;
  v13.super_class = ObjectType;
  return -[InformationCell initWithFrame:](&v13, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews15InformationCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews15InformationCell *)sub_16A9EC(a3);
}

- (void).cxx_destruct
{
  sub_E544((uint64_t)self + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_info, &qword_4786A0);
  swift_release();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                  + OBJC_IVAR____TtC23ShelfKitCollectionViews15InformationCell_reload);

  sub_27760(v3);
}

@end