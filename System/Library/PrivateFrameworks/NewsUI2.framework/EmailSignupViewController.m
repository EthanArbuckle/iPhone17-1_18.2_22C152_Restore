@interface EmailSignupViewController
- (_TtC7NewsUI225EmailSignupViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI225EmailSignupViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)notNow;
- (void)signup;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillDisappear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation EmailSignupViewController

- (_TtC7NewsUI225EmailSignupViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1DEC776AC();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1DEC753D4();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1DEA07030(0, &qword_1EBAC1348, MEMORY[0x1E4FAC080], MEMORY[0x1E4FBB718]);
  MEMORY[0x1F4188790](v6 - 8);
  v8 = (char *)&v13 - v7;
  v13.receiver = self;
  v13.super_class = ObjectType;
  v9 = self;
  [(EmailSignupViewController *)&v13 viewDidAppear:v3];
  uint64_t v10 = *(void *)((char *)&v9->super.super._responderFlags
                  + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_eventHandler);
  uint64_t v11 = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v10 + 64))(v11, v10);
  uint64_t v12 = sub_1DFDF12C0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v8, 1, 1, v12);
  sub_1DFDF57F0();
  sub_1DEC77B28((uint64_t)v8);
}

- (void)viewWillDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(EmailSignupViewController *)&v7 viewWillDisappear:v3];
  uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_eventHandler + 8];
  uint64_t ObjectType = swift_getObjectType();
  (*(void (**)(uint64_t, uint64_t))(v5 + 72))(ObjectType, v5);
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(EmailSignupViewController *)&v7 viewDidDisappear:v3];
  if (objc_msgSend(v4, sel_isBeingDismissed, v7.receiver, v7.super_class))
  {
    uint64_t v5 = *(void *)&v4[OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_eventHandler + 8];
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(uint64_t, uint64_t))(v5 + 56))(ObjectType, v5);
  }
}

- (void)signup
{
  uint64_t v3 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_eventHandler);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 40);
  uint64_t v6 = self;
  v5(ObjectType, v3);
}

- (void)notNow
{
  uint64_t v3 = *(void *)((char *)&self->super.super._responderFlags
                 + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_eventHandler);
  uint64_t ObjectType = swift_getObjectType();
  uint64_t v5 = *(void (**)(uint64_t, uint64_t))(v3 + 48);
  uint64_t v6 = self;
  v5(ObjectType, v3);
}

- (void)viewWillLayoutSubviews
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  v2 = (char *)v5.receiver;
  [(EmailSignupViewController *)&v5 viewWillLayoutSubviews];
  sub_1DEC761CC();
  sub_1DEC7638C();
  id v3 = objc_msgSend(*(id *)&v2[OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_obController], sel_headerView, v5.receiver, v5.super_class);
  v4 = v2;
  sub_1DEC7783C(v3, (uint64_t)v4, v4);
}

- (void)traitCollectionDidChange:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)swift_getObjectType();
  id v4 = a3;
  objc_super v5 = (char *)v8.receiver;
  [(EmailSignupViewController *)&v8 traitCollectionDidChange:v4];
  id v6 = objc_msgSend(*(id *)&v5[OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_obController], sel_headerView, v8.receiver, v8.super_class);
  objc_super v7 = v5;
  sub_1DEC7783C(v6, (uint64_t)v7, v7);
}

- (_TtC7NewsUI225EmailSignupViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI225EmailSignupViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1DEC77AC8((uint64_t)self + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_model, type metadata accessor for EmailSignupViewModel);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_obController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_micaView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_contentViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_signupButton));
  id v3 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC7NewsUI225EmailSignupViewController_notNowButton);
}

@end