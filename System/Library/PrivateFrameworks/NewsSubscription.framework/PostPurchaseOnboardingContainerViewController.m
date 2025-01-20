@interface PostPurchaseOnboardingContainerViewController
- (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController)init;
- (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController)initWithCoder:(id)a3;
- (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4;
@end

@implementation PostPurchaseOnboardingContainerViewController

- (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController)init
{
  return (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController *)sub_1BFB40094();
}

- (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController)initWithCoder:(id)a3
{
  return [(PostPurchaseOnboardingContainerViewController *)self init];
}

- (void)dismissViewControllerAnimated:(BOOL)a3 completion:(id)a4
{
  BOOL v5 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  v8 = _Block_copy(a4);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1BFB40C5C;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = swift_allocObject();
  swift_unknownObjectWeakInit();
  v11 = (void *)swift_allocObject();
  v11[2] = v10;
  v11[3] = v8;
  v11[4] = v9;
  aBlock[4] = sub_1BFADE108;
  aBlock[5] = v11;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1BFAAED70;
  aBlock[3] = &block_descriptor_15;
  v12 = _Block_copy(aBlock);
  v13 = self;
  sub_1BFA9C504((uint64_t)v8);
  swift_release();
  v14.receiver = v13;
  v14.super_class = ObjectType;
  [(PostPurchaseOnboardingContainerViewController *)&v14 dismissViewControllerAnimated:v5 completion:v12];
  _Block_release(v12);
  sub_1BFA9C2FC((uint64_t)v8);
}

- (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController_lastShownViewController));
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC16NewsSubscription45PostPurchaseOnboardingContainerViewController_onDismissal);
  sub_1BFA9C2FC(v3);
}

@end