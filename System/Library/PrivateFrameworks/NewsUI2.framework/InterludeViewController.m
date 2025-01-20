@interface InterludeViewController
- (_TtC7NewsUI223InterludeViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI223InterludeViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation InterludeViewController

- (_TtC7NewsUI223InterludeViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7NewsUI223InterludeViewController_contentView;
  id v6 = objc_allocWithZone((Class)type metadata accessor for InterludeContentView());
  id v7 = a3;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)objc_msgSend(v6, sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);
  uint64_t v8 = OBJC_IVAR____TtC7NewsUI223InterludeViewController_animationContainer;
  *(Class *)((char *)&self->super.super.super.isa + v8) = (Class)objc_msgSend(objc_allocWithZone(MEMORY[0x1E4FB1EB0]), sel_initWithFrame_, 0.0, 0.0, 0.0, 0.0);

  result = (_TtC7NewsUI223InterludeViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DFBD9274();
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  v2 = (char *)v3.receiver;
  [(InterludeViewController *)&v3 viewDidLayoutSubviews];
  sub_1DEF23FFC(*(char **)&v2[OBJC_IVAR____TtC7NewsUI223InterludeViewController_contentView]);
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v10.receiver = self;
  v10.super_class = (Class)swift_getObjectType();
  v4 = (char *)v10.receiver;
  [(InterludeViewController *)&v10 viewDidAppear:v3];
  uint64_t v5 = __swift_project_boxed_opaque_existential_1(&v4[OBJC_IVAR____TtC7NewsUI223InterludeViewController_animator], *(void *)&v4[OBJC_IVAR____TtC7NewsUI223InterludeViewController_animator + 24]);
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = v4;
  uint64_t v7 = *v5;
  uint64_t v8 = v4;
  if (sub_1DEE5008C(v8))
  {
    uint64_t v9 = *(void *)(v7 + 56);
    *(void *)(v7 + 56) = sub_1DFBD96E8;
    *(void *)(v7 + 64) = v6;
    sub_1DEABEEF0(v9);
    swift_retain();
    sub_1DEE4EE14(v8);
  }
  else
  {
    __swift_project_boxed_opaque_existential_1((void *)(*(void *)&v8[OBJC_IVAR____TtC7NewsUI223InterludeViewController_eventHandler] + 16), *(void *)(*(void *)&v8[OBJC_IVAR____TtC7NewsUI223InterludeViewController_eventHandler] + 40));
    sub_1DF7BF5C8();
  }

  swift_release();
}

- (_TtC7NewsUI223InterludeViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI223InterludeViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223InterludeViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI223InterludeViewController_animationContainer));
  swift_unknownObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI223InterludeViewController_renderer);
  BOOL v3 = (char *)self + OBJC_IVAR____TtC7NewsUI223InterludeViewController_animator;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v3);
}

@end