@interface JournalSearchViewController
- (_TtC7Journal27JournalSearchViewController)init;
- (_TtC7Journal27JournalSearchViewController)initWithCoder:(id)a3;
- (_TtC7Journal27JournalSearchViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7Journal27JournalSearchViewController)initWithSearchResultsController:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation JournalSearchViewController

- (_TtC7Journal27JournalSearchViewController)init
{
  return (_TtC7Journal27JournalSearchViewController *)sub_1002C8754();
}

- (_TtC7Journal27JournalSearchViewController)initWithCoder:(id)a3
{
  return 0;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1002C8948();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1002C8B44();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for JournalSearchViewController();
  id v4 = v5.receiver;
  [(JournalSearchViewController *)&v5 viewDidAppear:v3];
  [v4 setActive:1];
}

- (_TtC7Journal27JournalSearchViewController)initWithSearchResultsController:(id)a3
{
  id v3 = a3;
  result = (_TtC7Journal27JournalSearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7Journal27JournalSearchViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal27JournalSearchViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7Journal27JournalSearchViewController_resultsViewController));
  swift_release();

  swift_weakDestroy();
}

@end