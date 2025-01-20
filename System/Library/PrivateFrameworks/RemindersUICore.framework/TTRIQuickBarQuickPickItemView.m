@interface TTRIQuickBarQuickPickItemView
- (BOOL)accessibilityActivate;
- (BOOL)isAccessibilityElement;
- (BOOL)scalesLargeContentImage;
- (BOOL)showsLargeContentViewer;
- (NSArray)accessibilityElements;
- (UIImage)largeContentImage;
- (_TtC15RemindersUICore29TTRIQuickBarQuickPickItemView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore29TTRIQuickBarQuickPickItemView)initWithFrame:(CGRect)a3;
- (char)accessibilityLabel;
- (unint64_t)accessibilityTraits;
@end

@implementation TTRIQuickBarQuickPickItemView

- (_TtC15RemindersUICore29TTRIQuickBarQuickPickItemView)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_itemID;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_button) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_label) = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = -[TTRIQuickBarQuickPickItemView initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  sub_1B93461DC();

  return v10;
}

- (_TtC15RemindersUICore29TTRIQuickBarQuickPickItemView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore29TTRIQuickBarQuickPickItemView *)sub_1B9346980(a3);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (NSArray)accessibilityElements
{
  return (NSArray *)0;
}

- (unint64_t)accessibilityTraits
{
  v2 = self;
  unint64_t v3 = sub_1B9346A9C();

  return v3;
}

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (char)accessibilityLabel
{
  v1 = *(void **)&result[OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_label];
  if (v1)
  {
    v2 = result;
    id v3 = objc_msgSend(v1, sel_text);
    if (v3)
    {
      v4 = v3;
      sub_1B996E9F0();

      v5 = (void *)sub_1B996E9B0();
      swift_bridgeObjectRelease();
    }
    else
    {

      v5 = 0;
    }
    return (char *)v5;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (UIImage)largeContentImage
{
  result = *(UIImage **)((char *)&self->super.super.super.isa
                       + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_button);
  if (result)
  {
    id v3 = [(UIImage *)result imageForState:0];
    return (UIImage *)v3;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_button);
  if (v2)
  {
    objc_msgSend(v2, sel_sendActionsForControlEvents_, 0x2000);
    LOBYTE(v2) = 1;
  }
  else
  {
    __break(1u);
  }
  return (char)v2;
}

- (void).cxx_destruct
{
  sub_1B9346D24((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_itemID);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_button));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICore29TTRIQuickBarQuickPickItemView_label);
}

@end