@interface TabBarButton
- (BOOL)scalesLargeContentImage;
- (BOOL)showsLargeContentViewer;
- (NSString)largeContentTitle;
- (UIImage)largeContentImage;
- (_TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton)initWithCoder:(id)a3;
- (_TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton)initWithFrame:(CGRect)a3;
@end

@implementation TabBarButton

- (BOOL)showsLargeContentViewer
{
  return 1;
}

- (NSString)largeContentTitle
{
  v2 = self;
  id v3 = [(TabBarButton *)v2 accessibilityLabel];
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

  return (NSString *)v5;
}

- (UIImage)largeContentImage
{
  id v2 = [(TabBarButton *)self imageForState:0];

  return (UIImage *)v2;
}

- (BOOL)scalesLargeContentImage
{
  return 1;
}

- (_TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  ObjectType = (objc_class *)swift_getObjectType();
  v9 = (char *)self + OBJC_IVAR____TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton_itemID;
  *(_OWORD *)v9 = 0u;
  *((_OWORD *)v9 + 1) = 0u;
  *((void *)v9 + 4) = 0;
  v10 = (Class *)((char *)&self->super.super.super.super.super.super.isa
                + OBJC_IVAR____TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton_ttriAccessibilityHint);
  void *v10 = 0;
  v10[1] = 0;
  v12.receiver = self;
  v12.super_class = ObjectType;
  return -[TTRIQuickBarDragSelectableButton initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
}

- (_TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton)initWithCoder:(id)a3
{
  ObjectType = (objc_class *)swift_getObjectType();
  v6 = (char *)self + OBJC_IVAR____TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton_itemID;
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((void *)v6 + 4) = 0;
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton_ttriAccessibilityHint);
  void *v7 = 0;
  v7[1] = 0;
  v9.receiver = self;
  v9.super_class = ObjectType;
  return [(TTRIQuickBarDragSelectableButton *)&v9 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1B90CCA68((uint64_t)self + OBJC_IVAR____TtC15RemindersUICoreP33_F67546AE838D2B2D0B8FE7194B3E29A712TabBarButton_itemID, &qword_1EB9B0708);

  swift_bridgeObjectRelease();
}

@end