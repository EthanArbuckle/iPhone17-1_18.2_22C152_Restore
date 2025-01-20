@interface EmptyViewController
- (_TtC13TranslationUI19EmptyViewController)init;
- (_TtC13TranslationUI19EmptyViewController)initWithCoder:(id)a3;
- (_TtC13TranslationUI19EmptyViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation EmptyViewController

- (_TtC13TranslationUI19EmptyViewController)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EmptyViewController();
  return [(EmptyViewController *)&v3 initWithNibName:0 bundle:0];
}

- (_TtC13TranslationUI19EmptyViewController)initWithCoder:(id)a3
{
  result = (_TtC13TranslationUI19EmptyViewController *)sub_1DB1F1B90();
  __break(1u);
  return result;
}

- (void)loadView
{
  id v3 = objc_allocWithZone(MEMORY[0x1E4FB1EB0]);
  v4 = self;
  id v5 = objc_msgSend(v3, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  [(EmptyViewController *)v4 setView:v5];
}

- (_TtC13TranslationUI19EmptyViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC13TranslationUI19EmptyViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end