@interface BubbleTipCell
- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4;
- (_TtC23ShelfKitCollectionViews13BubbleTipCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews13BubbleTipCell)initWithFrame:(CGRect)a3;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)prepareForReuse;
@end

@implementation BubbleTipCell

- (void)prepareForReuse
{
  v2 = self;
  sub_FE04();
}

- (_TtC23ShelfKitCollectionViews13BubbleTipCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13BubbleTipCell_objectGraph) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13BubbleTipCell_messageViewController) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[BubbleTipCell initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews13BubbleTipCell)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13BubbleTipCell_objectGraph) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13BubbleTipCell_messageViewController) = 0;
  v7.receiver = self;
  v7.super_class = ObjectType;
  return [(BubbleTipCell *)&v7 initWithCoder:a3];
}

- (void).cxx_destruct
{
  swift_release();
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews13BubbleTipCell_messageViewController);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_107B8(v6, v7);
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_123C0((uint64_t)a4);
}

- (BOOL)messageViewController:(id)a3 shouldEnqueueMetricsForDialogResult:(id)a4
{
  return 0;
}

@end