@interface AMSBannerCell
- (_TtC23ShelfKitCollectionViews13AMSBannerCell)initWithCoder:(id)a3;
- (_TtC23ShelfKitCollectionViews13AMSBannerCell)initWithFrame:(CGRect)a3;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5;
@end

@implementation AMSBannerCell

- (_TtC23ShelfKitCollectionViews13AMSBannerCell)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_objectGraph) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_metricsController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_recentlyUnfollowedTipProvider) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_messageViewController) = 0;
  *(Class *)((char *)&self->super.super.super.super.super.super.isa
           + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_amsDialogRequest) = 0;
  v10.receiver = self;
  v10.super_class = ObjectType;
  return -[AMSBannerCell initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
}

- (_TtC23ShelfKitCollectionViews13AMSBannerCell)initWithCoder:(id)a3
{
  return (_TtC23ShelfKitCollectionViews13AMSBannerCell *)sub_134A34(a3);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.super.isa
                     + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_messageViewController));
  v3 = *(Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC23ShelfKitCollectionViews13AMSBannerCell_amsDialogRequest);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_134FD4((uint64_t)v6, v7);
}

- (void)messageViewController:(id)a3 enqueueEventWithFields:(id)a4 inTopic:(id)a5
{
  uint64_t v8 = sub_384290();
  if (a5)
  {
    uint64_t v9 = sub_3843C0();
    a5 = v10;
  }
  else
  {
    uint64_t v9 = 0;
  }
  id v11 = a3;
  v12 = self;
  sub_136300(v8, v9, (uint64_t)a5);

  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end