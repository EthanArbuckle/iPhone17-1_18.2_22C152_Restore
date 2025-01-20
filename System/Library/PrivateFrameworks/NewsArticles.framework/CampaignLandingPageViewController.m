@interface CampaignLandingPageViewController
- (_TtC12NewsArticles33CampaignLandingPageViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles33CampaignLandingPageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation CampaignLandingPageViewController

- (_TtC12NewsArticles33CampaignLandingPageViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_isImpressionable;
  sub_1BF6AF2CC();
  swift_allocObject();
  id v6 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)sub_1BF7DDBF8();
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_pageDelegate) = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC12NewsArticles33CampaignLandingPageViewController *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (_TtC12NewsArticles33CampaignLandingPageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC12NewsArticles33CampaignLandingPageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  sub_1BF4A7CC8((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_pageDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_articleViewController));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_styler);
  swift_unknownObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC12NewsArticles33CampaignLandingPageViewController_urlHandler);
}

- (void)viewDidLoad
{
  v2 = self;
  CampaignLandingPageViewController.viewDidLoad()();
}

- (void)traitCollectionDidChange:(id)a3
{
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  id v4 = v10.receiver;
  id v5 = a3;
  [(CampaignLandingPageViewController *)&v10 traitCollectionDidChange:v5];
  id v6 = objc_msgSend(v4, sel_traitCollection, v10.receiver, v10.super_class);
  id v7 = objc_msgSend(v4, sel_view);
  if (v7)
  {
    v8 = v7;
    id v9 = objc_msgSend(self, sel_systemBackgroundColor);
    objc_msgSend(v8, sel_setBackgroundColor_, v9);
  }
  else
  {
    __break(1u);
  }
}

@end