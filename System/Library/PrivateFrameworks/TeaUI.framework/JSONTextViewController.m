@interface JSONTextViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)textFieldShouldReturn:(id)a3;
- (UIView)inputAccessoryView;
- (_TtC5TeaUI22JSONTextViewController)initWithCoder:(id)a3;
- (_TtC5TeaUI22JSONTextViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)done;
- (void)nextToken;
- (void)previousToken;
- (void)updateSearchResultsForSearchController:(id)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
- (void)willDismissSearchController:(id)a3;
- (void)willPresentSearchController:(id)a3;
@end

@implementation JSONTextViewController

- (_TtC5TeaUI22JSONTextViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1B61542AC();
}

- (void)viewDidLoad
{
  v2 = self;
  JSONTextViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  JSONTextViewController.viewWillAppear(_:)(a3);
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  JSONTextViewController.viewWillLayoutSubviews()();
}

- (UIView)inputAccessoryView
{
  v2 = self;
  id v3 = JSONTextViewController.inputAccessoryView.getter();

  return (UIView *)v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)nextToken
{
  v2 = self;
  sub_1B6154E90(sub_1B616AE30);
}

- (void)previousToken
{
  v2 = self;
  sub_1B6154E90(sub_1B616AF44);
}

- (void)done
{
  v2 = self;
  sub_1B6094260();
}

- (_TtC5TeaUI22JSONTextViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3) {
    sub_1B61B20F0();
  }
  id v5 = a4;
  JSONTextViewController.init(nibName:bundle:)();
}

- (void).cxx_destruct
{
  id v3 = (void *)OUTLINED_FUNCTION_2_150((uint64_t)self + OBJC_IVAR____TtC5TeaUI22JSONTextViewController_textParser);
  sub_1B6155914(v3, v5, v6, v7, v8, v9, v10, v11, *(void *)(v4 + 64), *(void **)(v4 + 72));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___searchToolbar));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___resultsBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___nextTokenBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___previousTokenBarButtonItem));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___doneBarButtonItem));
  v12 = *(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC5TeaUI22JSONTextViewController____lazy_storage___textResizeBarButtonItem);
}

- (void)willPresentSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  JSONTextViewController.willPresentSearchController(_:)((UISearchController *)v5);
}

- (void)willDismissSearchController:(id)a3
{
  id v4 = a3;
  id v5 = self;
  JSONTextViewController.willDismissSearchController(_:)((UISearchController *)v5);
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = JSONTextViewController.textFieldShouldReturn(_:)((UITextField *)v5);

  return self & 1;
}

- (void)updateSearchResultsForSearchController:(id)a3
{
  id v4 = (UISearchController *)a3;
  id v5 = self;
  JSONTextViewController.updateSearchResults(for:)(v4);
}

@end