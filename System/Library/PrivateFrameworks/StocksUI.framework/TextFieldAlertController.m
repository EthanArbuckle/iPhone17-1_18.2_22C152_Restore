@interface TextFieldAlertController
- (NSArray)keyCommands;
- (_TtC8StocksUI24TextFieldAlertController)initWithCoder:(id)a3;
- (_TtC8StocksUI24TextFieldAlertController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancel;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation TextFieldAlertController

- (_TtC8StocksUI24TextFieldAlertController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_20A65F940();
}

- (void)cancel
{
  v2 = *(void (**)(uint64_t))((char *)&self->super.super.super.isa
                                      + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController_onCancel);
  id v3 = self;
  if (v2)
  {
    uint64_t v4 = sub_20A480ED4((uint64_t)v2);
    v2(v4);
    sub_20A459CA4((uint64_t)v2);
  }
  [(TextFieldAlertController *)self dismissViewControllerAnimated:1 completion:0];
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20A65EB3C();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = v7.receiver;
  [(TextFieldAlertController *)&v7 viewDidAppear:v3];
  id v5 = sub_20A65E68C();
  objc_msgSend(v5, sel_setEnabled_, 1, v7.receiver, v7.super_class);

  id v6 = sub_20A65E68C();
  objc_msgSend(v6, sel_becomeFirstResponder);
}

- (_TtC8StocksUI24TextFieldAlertController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8StocksUI24TextFieldAlertController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_20A459CA4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController_configureTextField));
  sub_20A459CA4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController_onSubmit));
  sub_20A459CA4(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController_onCancel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___messageLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___textFieldLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___textField));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___cancelButton));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8StocksUI24TextFieldAlertController____lazy_storage___submitButton);
}

- (NSArray)keyCommands
{
  if (sub_20A65FA18())
  {
    sub_20A42CFF0(0, &qword_26AC82FE8);
    v2 = (void *)sub_20A8CE5D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }

  return (NSArray *)v2;
}

@end