@interface CommerceNavigationController
- (_TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController)initWithCoder:(id)a3;
- (_TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation CommerceNavigationController

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CommerceNavigationController();
  v4 = (char *)v6.receiver;
  [(CommerceNavigationController *)&v6 viewDidDisappear:v3];
  v5 = *(void (**)(char *))&v4[OBJC_IVAR____TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController_dismissCallback];
  if (v5)
  {
    swift_retain();
    v5(v4);
    sub_1A528((uint64_t)v5);
  }
}

- (_TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController)initWithNavigationBarClass:(Class)a3 toolbarClass:(Class)a4
{
  v7 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController_dismissCallback);
  v8 = (objc_class *)type metadata accessor for CommerceNavigationController();
  void *v7 = 0;
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = v8;
  return [(NavigationController *)&v10 initWithNavigationBarClass:a3 toolbarClass:a4];
}

- (_TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.super.isa
               + OBJC_IVAR____TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController_dismissCallback);
  void *v4 = 0;
  v4[1] = 0;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for CommerceNavigationController();
  id v5 = a3;
  objc_super v6 = [(NavigationController *)&v8 initWithCoder:v5];

  return v6;
}

- (void).cxx_destruct
{
  sub_1A528(*(uint64_t *)((char *)&self->super.super.super.super.super.super.isa
                       + OBJC_IVAR____TtC16MusicApplicationP33_ACDED154BD7D27D1EDCE9CE66AA9990C28CommerceNavigationController_dismissCallback));
}

@end