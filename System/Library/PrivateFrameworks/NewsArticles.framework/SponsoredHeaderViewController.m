@interface SponsoredHeaderViewController
- (_TtC12NewsArticles29SponsoredHeaderViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles29SponsoredHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4;
- (void)viewDidLoad;
@end

@implementation SponsoredHeaderViewController

- (_TtC12NewsArticles29SponsoredHeaderViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_label;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_headerDelegate) = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC12NewsArticles29SponsoredHeaderViewController *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(SponsoredHeaderViewController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addSubview_, *(void *)&v2[OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_label]);
  }
  else
  {
    __break(1u);
  }
}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  double width = a3.width;
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_renderer), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_renderer));
  id v7 = a4;
  v8 = self;
  sub_1BF4E65CC((char *)v8, width);
  id v9 = [(SponsoredHeaderViewController *)v8 view];
  if (v9)
  {
    v11 = v9;
    objc_msgSend(v9, sel_frame);
    CGFloat v13 = v12;
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;

    v21.origin.x = v13;
    v21.origin.y = v15;
    v21.size.double width = v17;
    v21.size.height = v19;
    double Height = CGRectGetHeight(v21);

    return Height;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC12NewsArticles29SponsoredHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC12NewsArticles29SponsoredHeaderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_renderer);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_label));
  id v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles29SponsoredHeaderViewController_headerDelegate;
  sub_1BF4A7CC8((uint64_t)v3);
}

@end