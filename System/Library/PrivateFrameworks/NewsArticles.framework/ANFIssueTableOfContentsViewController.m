@interface ANFIssueTableOfContentsViewController
- (_TtC12NewsArticles37ANFIssueTableOfContentsViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles37ANFIssueTableOfContentsViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)viewingLocation;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation ANFIssueTableOfContentsViewController

- (_TtC12NewsArticles37ANFIssueTableOfContentsViewController)initWithCoder:(id)a3
{
  result = (_TtC12NewsArticles37ANFIssueTableOfContentsViewController *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1BF5588D8();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v4.receiver = self;
  v4.super_class = (Class)swift_getObjectType();
  [(ANFIssueTableOfContentsViewController *)&v4 viewDidAppear:v3];
}

- (_TtC12NewsArticles37ANFIssueTableOfContentsViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles37ANFIssueTableOfContentsViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles37ANFIssueTableOfContentsViewController_viewController));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles37ANFIssueTableOfContentsViewController_issue);
}

- (unint64_t)viewingLocation
{
  return 3;
}

@end