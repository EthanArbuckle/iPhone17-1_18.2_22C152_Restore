@interface AIHeaderViewController
- (_TtC12NewsArticles22AIHeaderViewController)initWithCoder:(id)a3;
- (_TtC12NewsArticles22AIHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4;
- (void)viewDidLoad;
@end

@implementation AIHeaderViewController

- (_TtC12NewsArticles22AIHeaderViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_label;
  id v6 = objc_allocWithZone(MEMORY[0x1E4FB1930]);
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_init);
  v8 = (Class *)((char *)&self->super.super.super.isa
               + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_channelName);
  void *v8 = 0;
  v8[1] = 0;
  *(void *)((char *)&self->super.super._responderFlags
            + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_headerDelegate) = 0;
  swift_unknownObjectWeakInit();

  result = (_TtC12NewsArticles22AIHeaderViewController *)sub_1BF7E4948();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(AIHeaderViewController *)&v5 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v5.receiver, v5.super_class);
  if (v3)
  {
    v4 = v3;
    objc_msgSend(v3, sel_addSubview_, *(void *)&v2[OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_label]);
  }
  else
  {
    __break(1u);
  }
}

- (double)sectionItemHeightForSize:(CGSize)a3 traitCollection:(id)a4
{
  double width = a3.width;
  __swift_project_boxed_opaque_existential_1((Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_renderer), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_renderer));
  uint64_t v7 = *(uint64_t *)((char *)&self->super.super.super.isa
                  + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_channelName);
  uint64_t v8 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_channelName);
  swift_bridgeObjectRetain();
  id v9 = a4;
  v10 = self;
  sub_1BF4A6D70((char *)v10, v7, v8, width);
  swift_bridgeObjectRelease();
  id v11 = [(AIHeaderViewController *)v10 view];
  if (v11)
  {
    v13 = v11;
    objc_msgSend(v11, sel_frame);
    CGFloat v15 = v14;
    CGFloat v17 = v16;
    CGFloat v19 = v18;
    CGFloat v21 = v20;

    v23.origin.x = v15;
    v23.origin.y = v17;
    v23.size.double width = v19;
    v23.size.height = v21;
    double Height = CGRectGetHeight(v23);

    return Height;
  }
  else
  {
    __break(1u);
  }
  return result;
}

- (_TtC12NewsArticles22AIHeaderViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  double result = (_TtC12NewsArticles22AIHeaderViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_label));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_renderer);
  swift_bridgeObjectRelease();
  id v3 = (char *)self + OBJC_IVAR____TtC12NewsArticles22AIHeaderViewController_headerDelegate;
  sub_1BF4A7CC8((uint64_t)v3);
}

@end