@interface SharedWithYouHeaderViewController
- (_TtC12NewsArticles33SharedWithYouHeaderViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles33SharedWithYouHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4;
- (void)viewDidLoad;
@end

@implementation SharedWithYouHeaderViewController

- (_TtC12NewsArticles33SharedWithYouHeaderViewController)initWithCoder:(id)a3
{
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_headerDelegate) = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC12NewsArticles33SharedWithYouHeaderViewController *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(SharedWithYouHeaderViewController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addSubview_, *(void *)&v2[OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_attributionView]);
  }
  else
  {
    __break(1u);
  }
}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  double width = a3.width;
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_renderer), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_renderer));
  id v7 = a4;
  v8 = self;
  sub_1BF795FA8((char *)v8, width);
  id v9 = [(SharedWithYouHeaderViewController *)v8 view];
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

- (_TtC12NewsArticles33SharedWithYouHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC12NewsArticles33SharedWithYouHeaderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_attributionView));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_renderer);
  id v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_sharedItem;
  uint64_t v4 = sub_1BF7E2908();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_sharedItemManager);
  objc_super v5 = (char *)self + OBJC_IVAR____TtC12NewsArticles33SharedWithYouHeaderViewController_headerDelegate;
  sub_1BF4A7CC8((uint64_t)v5);
}

@end