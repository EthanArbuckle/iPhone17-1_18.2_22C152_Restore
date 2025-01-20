@interface ProvisioningUICoordinator
- (_TtC9PassKitUI25ProvisioningUICoordinator)init;
- (id)provisionedPass;
- (id)topViewController;
- (void)continueWithFieldModel:(id)a3;
- (void)dealloc;
- (void)disambiguationViewController:(id)a3 didSelectProduct:(id)a4;
- (void)disambiguationViewControllerSetUpLater:(id)a3;
- (void)pushViewController:(id)a3 animated:(BOOL)a4;
- (void)terminate;
@end

@implementation ProvisioningUICoordinator

- (void)dealloc
{
  v2 = self;
  sub_19FBA606C();
  v3.receiver = v2;
  v3.super_class = (Class)type metadata accessor for ProvisioningUICoordinator();
  [(ProvisioningUICoordinator *)&v3 dealloc];
}

- (void).cxx_destruct
{
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_delegate);
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_manualEntryDelegate);
  swift_unknownObjectWeakDestroy();
  sub_19F482DB0((uint64_t)self + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_renderer);
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();

  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_passcodeController));
  objc_super v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_reporter);
}

- (void)continueWithFieldModel:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_19FBA451C(v4);
}

- (void)terminate
{
  v2 = self;
  sub_19FBA51C8();
}

- (id)provisionedPass
{
  v2 = *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_provisionedPasses);
  if (v2)
  {
    objc_super v3 = self;
    id v4 = v2;
    v2 = (void *)sub_1A03AFB88();
  }

  return v2;
}

- (_TtC9PassKitUI25ProvisioningUICoordinator)init
{
  result = (_TtC9PassKitUI25ProvisioningUICoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)disambiguationViewController:(id)a3 didSelectProduct:(id)a4
{
  if (a4)
  {
    id v6 = a3;
    v8 = self;
    id v7 = a4;
    sub_19FBABA48(v7);
  }
  else
  {
    __break(1u);
  }
}

- (void)disambiguationViewControllerSetUpLater:(id)a3
{
  if (a3)
  {
    v8 = self;
    id v4 = a3;
    v5 = (_TtC9PassKitUI25ProvisioningUICoordinator *)objc_msgSend(v4, sel_navigationController);
    if (v5)
    {
      id v6 = v5;
      id v7 = [(ProvisioningUICoordinator *)v5 popViewControllerAnimated:1];

      id v4 = v7;
      v8 = v6;
    }
  }
  else
  {
    __break(1u);
  }
}

- (id)topViewController
{
  v2 = (void *)MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_viewController, a2);

  return v2;
}

- (void)pushViewController:(id)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  id v7 = (void *)MEMORY[0x1A6224F80]((char *)self + OBJC_IVAR____TtC9PassKitUI25ProvisioningUICoordinator_viewController, a2);
  id v8 = a3;
  v9 = self;
  id v10 = objc_msgSend(v7, sel_navigationController);

  objc_msgSend(v10, sel_pushViewController_animated_, v8, v4);
}

@end