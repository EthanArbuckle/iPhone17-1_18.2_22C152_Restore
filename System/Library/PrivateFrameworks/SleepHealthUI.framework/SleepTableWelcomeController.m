@interface SleepTableWelcomeController
- (_TtC13SleepHealthUI27SleepTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5;
- (_TtC13SleepHealthUI27SleepTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (_TtC13SleepHealthUI27SleepTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5;
- (_TtC13SleepHealthUI27SleepTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6;
- (void)viewDidLayoutSubviews;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation SleepTableWelcomeController

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SleepTableWelcomeController();
  id v2 = v3.receiver;
  [(OBTableWelcomeController *)&v3 viewDidLayoutSubviews];
  sub_1AD885B90();
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3 = self;
  sub_1AD885B90();
}

- (_TtC13SleepHealthUI27SleepTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5
{
  result = (_TtC13SleepHealthUI27SleepTableWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUI27SleepTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5
{
  id v5 = a5;
  result = (_TtC13SleepHealthUI27SleepTableWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUI27SleepTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 symbolName:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  result = (_TtC13SleepHealthUI27SleepTableWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC13SleepHealthUI27SleepTableWelcomeController)initWithTitle:(id)a3 detailText:(id)a4 icon:(id)a5 adoptTableViewScrollView:(BOOL)a6
{
  id v6 = a5;
  result = (_TtC13SleepHealthUI27SleepTableWelcomeController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end