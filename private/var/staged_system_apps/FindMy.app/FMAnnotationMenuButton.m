@interface FMAnnotationMenuButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (_TtC6FindMy22FMAnnotationMenuButton)initWithCoder:(id)a3;
- (_TtC6FindMy22FMAnnotationMenuButton)initWithFrame:(CGRect)a3;
- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5;
@end

@implementation FMAnnotationMenuButton

- (void)contextMenuInteraction:(id)a3 willEndForConfiguration:(id)a4 animator:(id)a5
{
  v13.receiver = self;
  v13.super_class = (Class)swift_getObjectType();
  id v8 = a3;
  id v9 = a4;
  v10 = (char *)v13.receiver;
  swift_unknownObjectRetain();
  [(FMAnnotationMenuButton *)&v13 contextMenuInteraction:v8 willEndForConfiguration:v9 animator:a5];
  v11 = *(void (**)(uint64_t))&v10[OBJC_IVAR____TtC6FindMy22FMAnnotationMenuButton_didEndInteraction];
  if (v11)
  {
    uint64_t v12 = swift_retain();
    v11(v12);
    sub_100036B90((uint64_t)v11);
  }
  swift_unknownObjectRelease();
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  id v4 = a3;
  v5 = self;
  [(FMAnnotationMenuButton *)v5 bounds];
  CGFloat MidX = CGRectGetMidX(v10);

  double v7 = 0.0;
  double v8 = MidX;
  result.y = v7;
  result.x = v8;
  return result;
}

- (_TtC6FindMy22FMAnnotationMenuButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  id v9 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC6FindMy22FMAnnotationMenuButton_didEndInteraction);
  *id v9 = 0;
  v9[1] = 0;
  v11.receiver = self;
  v11.super_class = ObjectType;
  return -[FMAnnotationMenuButton initWithFrame:](&v11, "initWithFrame:", x, y, width, height);
}

- (_TtC6FindMy22FMAnnotationMenuButton)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC6FindMy22FMAnnotationMenuButton_didEndInteraction);
  void *v6 = 0;
  v6[1] = 0;
  v8.receiver = self;
  v8.super_class = ObjectType;
  return [(FMAnnotationMenuButton *)&v8 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_100036B90(*(uint64_t *)((char *)&self->super.super.super.super.super.isa
                           + OBJC_IVAR____TtC6FindMy22FMAnnotationMenuButton_didEndInteraction));
}

@end