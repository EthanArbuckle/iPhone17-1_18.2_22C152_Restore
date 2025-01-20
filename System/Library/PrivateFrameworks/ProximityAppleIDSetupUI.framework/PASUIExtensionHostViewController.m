@interface PASUIExtensionHostViewController
- (_TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController)initWithCoder:(id)a3;
- (_TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)extensionDidFinishWith:(id)a3 context:(id)a4 completion:(id)a5;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
- (void)promptForFlowCancelWithCompletion:(id)a3;
- (void)viewDidLoad;
@end

@implementation PASUIExtensionHostViewController

- (_TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController)initWithCoder:(id)a3
{
  *((unsigned char *)&self->super.super.super.isa
  + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_finished) = 0;
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate) = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___sceneProxy) = 0;
  id v5 = a3;

  result = (_TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController *)sub_22E7F4190();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for PASUIExtensionHostViewController();
  id v2 = v6.receiver;
  [(PASUIExtensionHostViewController *)&v6 viewDidLoad];
  id v3 = sub_22E7DF154();
  id v4 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v4)
  {
    id v5 = v4;
    sub_22E7B52A0(v3, v4);
  }
  else
  {
    __break(1u);
  }
}

- (_TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = (char *)self + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_identity;
  uint64_t v4 = sub_22E7F3040();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_bridgeObjectRelease();
  sub_22E7B4FDC((uint64_t)self + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController_delegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC23ProximityAppleIDSetupUI32PASUIExtensionHostViewController____lazy_storage___exHostViewController));
  swift_release();
}

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_22E7DFC60(v4);
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  id v6 = a3;
  v7 = self;
  id v8 = a4;
  sub_22E7E0FE0(a4);
}

- (void)extensionDidFinishWith:(id)a3 context:(id)a4 completion:(id)a5
{
  id v8 = _Block_copy(a5);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  id v10 = a3;
  id v11 = a4;
  v12 = self;
  sub_22E7E0090(v10, v11, (uint64_t)sub_22E7BE230, v9);

  swift_release();
}

- (void)promptForFlowCancelWithCompletion:(id)a3
{
  id v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  id v6 = self;
  sub_22E7E0760((uint64_t)sub_22E7BE230, v5);

  swift_release();
}

@end