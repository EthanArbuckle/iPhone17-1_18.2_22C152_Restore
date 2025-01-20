@interface EndOfArticleViewController
- (BOOL)canBecomeFirstResponder;
- (BOOL)shouldUpdateFocusInContext:(id)a3;
- (NAArticleFooterDelegate)footerDelegate;
- (NAEndOfArticleResultProviderDelegate)resultProviderDelegate;
- (_TtC12NewsArticles26EndOfArticleViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles26EndOfArticleViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4;
- (void)dealloc;
- (void)deselect;
- (void)setFooterDelegate:(id)a3;
- (void)setResultProviderDelegate:(id)a3;
- (void)smartInvertStatusDidChange;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation EndOfArticleViewController

- (NAArticleFooterDelegate)footerDelegate
{
  return (NAArticleFooterDelegate *)sub_1BF5FC6E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_footerDelegate);
}

- (void)setFooterDelegate:(id)a3
{
}

- (NAEndOfArticleResultProviderDelegate)resultProviderDelegate
{
  return (NAEndOfArticleResultProviderDelegate *)sub_1BF5FC6E0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_resultProviderDelegate);
}

- (void)setResultProviderDelegate:(id)a3
{
}

- (_TtC12NewsArticles26EndOfArticleViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1BF5FEF78();
}

- (void)dealloc
{
  ObjectType = (objc_class *)swift_getObjectType();
  v4 = self;
  v5 = self;
  id v6 = objc_msgSend(v4, sel_defaultCenter);
  objc_msgSend(v6, sel_removeObserver_name_object_, v5, *MEMORY[0x1E4FB2450], 0);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  [(EndOfArticleViewController *)&v7 dealloc];
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_styler);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_blueprintViewController));
  sub_1BF4A7CC8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_footerDelegate);
  sub_1BF4A7CC8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_resultProviderDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_overriddenTraitCollection));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_gutterViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_bottomSpacerView));
  id v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_urlHandler;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

- (_TtC12NewsArticles26EndOfArticleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles26EndOfArticleViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  EndOfArticleViewController.viewDidLoad()();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v6.receiver;
  [(EndOfArticleViewController *)&v6 viewWillAppear:v3];
  if (*(void *)&v4[OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_gutterViewController])
  {
    sub_1BF7DFBC8();
    uint64_t v5 = sub_1BF7DF8D8();
    swift_release();
    sub_1BF7E44A8();

    id v4 = (char *)v5;
  }
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v7.receiver;
  [(EndOfArticleViewController *)&v7 viewDidAppear:v3];
  uint64_t v5 = *(void *)(*(void *)&v4[OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_eventHandler] + 40);
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v5 + 48))(ObjectType, v5);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v6 = sub_1BF7DFF28();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x1F4188790](v6);
  v9 = (char *)&v11 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11.receiver = self;
  v11.super_class = ObjectType;
  v10 = self;
  [(EndOfArticleViewController *)&v11 viewDidDisappear:v3];
  (*(void (**)(char *, void, uint64_t))(v7 + 104))(v9, *MEMORY[0x1E4FACE38], v6);
  sub_1BF7DFBE8();
}

- (void)viewWillLayoutSubviews
{
  v2 = self;
  EndOfArticleViewController.viewWillLayoutSubviews()();
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  EndOfArticleViewController.viewDidLayoutSubviews()();
}

- (void)traitCollectionDidChange:(id)a3
{
  v9.receiver = self;
  v9.super_class = (Class)swift_getObjectType();
  id v4 = (char *)v9.receiver;
  id v5 = a3;
  [(EndOfArticleViewController *)&v9 traitCollectionDidChange:v5];
  uint64_t v6 = *(void **)&v4[OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_overriddenTraitCollection];
  if (v6)
  {
    id v7 = *(id *)&v4[OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_overriddenTraitCollection];
  }
  else
  {
    id v7 = objc_msgSend(v4, sel_traitCollection, v9.receiver, v9.super_class);
    uint64_t v6 = 0;
  }
  id v8 = v6;
  sub_1BF5FF044();
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  id v4 = a3;
  id v5 = self;
  LOBYTE(self) = EndOfArticleViewController.shouldUpdateFocus(in:)((UIFocusUpdateContext)v4);

  return self & 1;
}

- (void)smartInvertStatusDidChange
{
  uint64_t ObjectType = (objc_class *)swift_getObjectType();
  id v4 = self;
  id v5 = [(EndOfArticleViewController *)v4 traitCollection];
  v9.receiver = v4;
  v9.super_class = ObjectType;
  [(EndOfArticleViewController *)&v9 traitCollectionDidChange:v5];
  uint64_t v6 = *(Class *)((char *)&v4->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_overriddenTraitCollection);
  if (v6)
  {
    id v7 = *(Class *)((char *)&v4->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles26EndOfArticleViewController_overriddenTraitCollection);
  }
  else
  {
    id v7 = [(EndOfArticleViewController *)v4 traitCollection];
    uint64_t v6 = 0;
  }
  id v8 = v6;
  sub_1BF5FF044();
}

- (void)deselect
{
  v2 = self;
  sub_1BF7DFBC8();
  id v3 = (id)sub_1BF7DF8D8();
  swift_release();
  objc_msgSend(v3, sel_selectItemAtIndexPath_animated_scrollPosition_, 0, 0, 0);
}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  id v5 = a4;
  uint64_t v6 = self;
  sub_1BF7DFBC8();
  id v7 = (void *)sub_1BF7DF8D8();
  swift_release();
  id v8 = objc_msgSend(v7, sel_collectionViewLayout);

  objc_msgSend(v8, sel_collectionViewContentSize);
  double v10 = v9;

  return fmax(v10, 1.0);
}

@end