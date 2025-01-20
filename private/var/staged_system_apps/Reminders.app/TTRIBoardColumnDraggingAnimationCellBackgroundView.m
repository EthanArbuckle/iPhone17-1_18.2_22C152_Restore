@interface TTRIBoardColumnDraggingAnimationCellBackgroundView
+ (Class)layerClass;
- (_TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView)initWithCoder:(id)a3;
- (_TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation TTRIBoardColumnDraggingAnimationCellBackgroundView

+ (Class)layerClass
{
  sub_1000368FC(0, (unint64_t *)&unk_100797290);

  return (Class)swift_getObjCClassFromMetadata();
}

- (void)layoutSubviews
{
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v2 = (char *)v7.receiver;
  [(TTRIBoardColumnDraggingAnimationCellBackgroundView *)&v7 layoutSubviews];
  [v2 bounds];
  if ((v2[OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_boundsUsedForShapePath + 32] & 1) == 0
    && !CGRectEqualToRect(*(CGRect *)&v3, *(CGRect *)&v2[OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_boundsUsedForShapePath]))
  {
    sub_1002D4180();
  }
  sub_1002D4030();
}

- (_TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_fill);
  void *v9 = 0;
  v9[1] = 0;
  v10 = (char *)self + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_shape;
  *(void *)v10 = 0;
  *((void *)v10 + 1) = 0;
  v10[16] = 1;
  v11 = (char *)self + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_shadow;
  *(_OWORD *)v11 = 0u;
  *((_OWORD *)v11 + 1) = 0u;
  *((void *)v11 + 4) = 0;
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_debugShowsBoundingBox) = 0;
  v12 = (char *)self
      + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_boundsUsedForShapePath;
  *(_OWORD *)v12 = 0u;
  *((_OWORD *)v12 + 1) = 0u;
  v12[32] = 1;
  v14.receiver = self;
  v14.super_class = ObjectType;
  return -[TTRIBoardColumnDraggingAnimationCellBackgroundView initWithFrame:](&v14, "initWithFrame:", x, y, width, height);
}

- (_TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView)initWithCoder:(id)a3
{
  return (_TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView *)sub_1002D49D8(a3);
}

- (void).cxx_destruct
{
  sub_10009F25C(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_fill), *(void **)&self->fill[OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_fill]);
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC9Reminders50TTRIBoardColumnDraggingAnimationCellBackgroundView_shadow);
}

@end