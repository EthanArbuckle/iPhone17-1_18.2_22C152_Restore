@interface AudioTraitDisclosureViewController
- (_TtC5Music34AudioTraitDisclosureViewController)initWithCoder:(id)a3;
- (_TtC5Music34AudioTraitDisclosureViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation AudioTraitDisclosureViewController

- (_TtC5Music34AudioTraitDisclosureViewController)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.isa
               + OBJC_IVAR____TtC5Music34AudioTraitDisclosureViewController_dismissHandler);
  void *v4 = 0;
  v4[1] = 0;
  id v5 = a3;

  result = (_TtC5Music34AudioTraitDisclosureViewController *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(AudioTraitDisclosureViewController *)&v7 viewWillDisappear:v3];
  id v5 = *(void (**)(uint64_t))&v4[OBJC_IVAR____TtC5Music34AudioTraitDisclosureViewController_dismissHandler];
  if (v5)
  {
    uint64_t v6 = swift_retain();
    v5(v6);
    sub_10006ADFC((uint64_t)v5);
  }
}

- (_TtC5Music34AudioTraitDisclosureViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Music34AudioTraitDisclosureViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10006ADFC(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtC5Music34AudioTraitDisclosureViewController_dismissHandler));
}

@end