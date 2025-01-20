@interface CRLWPEditMenuController
- (BOOL)canCenter;
- (BOOL)isVertical;
- (_TtC8Freeform23CRLWPEditMenuController)init;
- (_TtC8Freeform23CRLWPEditMenuController)initWithICC:(id)a3;
- (void)hide;
- (void)setCanCenter:(BOOL)a3;
- (void)setIsVertical:(BOOL)a3;
- (void)showMenuOn:(id)a3;
@end

@implementation CRLWPEditMenuController

- (BOOL)canCenter
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLWPEditMenuController_canCenter);
}

- (void)setCanCenter:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLWPEditMenuController_canCenter) = a3;
}

- (BOOL)isVertical
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLWPEditMenuController_isVertical);
}

- (void)setIsVertical:(BOOL)a3
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLWPEditMenuController_isVertical) = a3;
}

- (_TtC8Freeform23CRLWPEditMenuController)initWithICC:(id)a3
{
  return (_TtC8Freeform23CRLWPEditMenuController *)sub_100FCB40C((uint64_t)a3);
}

- (void)showMenuOn:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100FCB4DC(v4);
}

- (void)hide
{
  v2 = self;
  sub_100FCB628();
}

- (_TtC8Freeform23CRLWPEditMenuController)init
{
  result = (_TtC8Freeform23CRLWPEditMenuController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC8Freeform23CRLWPEditMenuController_icc);
}

@end