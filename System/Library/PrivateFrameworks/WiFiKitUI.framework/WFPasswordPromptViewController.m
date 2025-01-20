@interface WFPasswordPromptViewController
- (WFPasswordPromptViewController)initWithAlertMessage:(id)a3 joinCompletion:(id)a4;
- (WFPasswordPromptViewController)initWithCoder:(id)a3;
- (WFPasswordPromptViewController)initWithNetworkName:(id)a3 joinCompletion:(id)a4;
- (WFPasswordPromptViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidLoad;
@end

@implementation WFPasswordPromptViewController

- (WFPasswordPromptViewController)initWithNetworkName:(id)a3 joinCompletion:(id)a4
{
  v5 = (uint64_t (*)())_Block_copy(a4);
  v6 = v5;
  if (!a3)
  {
    uint64_t v8 = 0;
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  a3 = (id)sub_225882538();
  uint64_t v8 = v7;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  v6 = sub_225858E0C;
LABEL_6:
  v10 = (WFPasswordPromptViewController *)sub_2258589D8((uint64_t)a3, v8, (uint64_t)v6, v9);
  sub_225858008((uint64_t)v6);
  return v10;
}

- (WFPasswordPromptViewController)initWithAlertMessage:(id)a3 joinCompletion:(id)a4
{
  v5 = (void (*)(uint64_t, uint64_t, uint64_t, uint64_t))_Block_copy(a4);
  v6 = v5;
  if (!a3)
  {
    uint64_t v8 = 0;
    if (v5) {
      goto LABEL_3;
    }
LABEL_5:
    uint64_t v9 = 0;
    goto LABEL_6;
  }
  a3 = (id)sub_225882538();
  uint64_t v8 = v7;
  if (!v6) {
    goto LABEL_5;
  }
LABEL_3:
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v6;
  v6 = sub_225858E04;
LABEL_6:
  v10 = (WFPasswordPromptViewController *)sub_225858AA0((uint64_t)a3, v8, (uint64_t)v6, v9);
  sub_225858008((uint64_t)v6);
  return v10;
}

- (WFPasswordPromptViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFPasswordPromptViewController_networkName);
  void *v4 = 0;
  v4[1] = 0;
  v5 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFPasswordPromptViewController_alertMessage);
  void *v5 = 0;
  v5[1] = 0;
  v6 = (Class *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFPasswordPromptViewController_joinHandler);
  void *v6 = 0;
  v6[1] = 0;
  id v7 = a3;

  result = (WFPasswordPromptViewController *)sub_2258827B8();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  WFPasswordPromptViewController.viewDidLoad()();
}

- (WFPasswordPromptViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (WFPasswordPromptViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.isa + OBJC_IVAR___WFPasswordPromptViewController_joinHandler);
  sub_225858008(v3);
}

@end