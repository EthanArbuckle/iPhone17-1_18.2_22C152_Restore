@interface ContinueReadingViewController
- (_TtC7NewsUI229ContinueReadingViewController)initWithCoder:(id)a3;
- (_TtC7NewsUI229ContinueReadingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC7NewsUI229ContinueReadingViewController)initWithRequest:(id)a3;
- (_TtC7NewsUI229ContinueReadingViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5;
- (void)messageViewController:(id)a3 didFailWithError:(id)a4;
- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4;
- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4;
- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4;
- (void)messageViewControllerDidDismiss:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidDisappear:(BOOL)a3;
@end

@implementation ContinueReadingViewController

- (_TtC7NewsUI229ContinueReadingViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.super.super.isa
           + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_relativeTabBarController) = 0;
  id v4 = a3;

  result = (_TtC7NewsUI229ContinueReadingViewController *)sub_1DFDFFBB0();
  __break(1u);
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  uint64_t v3 = a3;
  ObjectType = (objc_class *)swift_getObjectType();
  sub_1DEC10568();
  MEMORY[0x1F4188790](v6 - 8);
  uint64_t v31 = (uint64_t)&v25 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v46.receiver = self;
  v46.super_class = ObjectType;
  v8 = self;
  v32 = v8;
  [(AMSUIBaseMessageViewController *)&v46 viewDidAppear:v3];
  v9 = __swift_project_boxed_opaque_existential_1((Class *)((char *)&v8->super.super.super.super.super.isa+ OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_eventHandler), *(uint64_t *)((char *)&v8->super.super.super._overrideTransitioningDelegate+ OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_eventHandler));
  v10 = (char *)v8 + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content;
  uint64_t v11 = *(uint64_t *)((char *)&v8->super.super.super.super.super.isa
                   + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  uint64_t v12 = *((void *)v10 + 1);
  v13 = (void *)*((void *)v10 + 2);
  uint64_t v14 = *((void *)v10 + 5);
  id v29 = (id)*((void *)v10 + 4);
  uint64_t v15 = *((void *)v10 + 7);
  uint64_t v28 = *((void *)v10 + 6);
  unint64_t v16 = *((void *)v10 + 8);
  LOBYTE(v3) = v10[72];
  uint64_t v17 = *((void *)v10 + 11);
  uint64_t v27 = *((void *)v10 + 10);
  v18 = (void *)*((void *)v10 + 12);
  uint64_t v19 = *((void *)v10 + 13);
  int v26 = v10[112];
  char v20 = v10[24];
  uint64_t v30 = *__swift_project_boxed_opaque_existential_1((void *)(*v9 + 16), *(void *)(*v9 + 40));
  v33[0] = v11;
  v33[1] = v12;
  v33[2] = v13;
  char v34 = v20;
  id v35 = v29;
  uint64_t v36 = v14;
  uint64_t v37 = v28;
  uint64_t v38 = v15;
  unint64_t v39 = v16;
  char v40 = v3;
  uint64_t v41 = v27;
  uint64_t v42 = v17;
  v43 = v18;
  uint64_t v44 = v19;
  char v45 = v26;
  swift_bridgeObjectRetain();
  sub_1DEB2EF54(v13, v20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(v15) = v3;
  sub_1DEB2EF78(v16, v3);
  id v21 = v18;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DEB2EF54(v13, v20);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  sub_1DEB2EF78(v16, v15);
  swift_bridgeObjectRetain();
  id v29 = v21;
  uint64_t v22 = v31;
  sub_1DF0B1AF4((uint64_t)v33, v31);
  uint64_t v23 = type metadata accessor for ContinueReadingPromptExposureData();
  (*(void (**)(uint64_t, void, uint64_t, uint64_t))(*(void *)(v23 - 8) + 56))(v22, 0, 1, v23);
  uint64_t v24 = v30 + OBJC_IVAR____TtC7NewsUI225ContinueReadingInteractor_exposureData;
  swift_beginAccess();
  sub_1DEC105C0(v22, v24);
  swift_endAccess();
  swift_bridgeObjectRelease();
  sub_1DEB2F130(v13, v20);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DEB2F154(v16, v15);

  swift_bridgeObjectRelease();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v35.receiver = self;
  v35.super_class = (Class)swift_getObjectType();
  id v21 = v35.receiver;
  [(ContinueReadingViewController *)&v35 viewDidDisappear:v3];
  id v4 = __swift_project_boxed_opaque_existential_1(&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_eventHandler], *(void *)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_eventHandler + 24]);
  uint64_t v5 = *(void *)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content];
  uint64_t v6 = *(void *)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 8];
  uint64_t v7 = *(void **)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 16];
  uint64_t v8 = *(void *)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 56];
  uint64_t v18 = *(void *)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 48];
  uint64_t v19 = *(void *)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 32];
  unint64_t v9 = *(void *)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 64];
  char v10 = v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 72];
  uint64_t v11 = *(void *)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 88];
  uint64_t v17 = *(void *)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 80];
  uint64_t v12 = *(void **)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 96];
  uint64_t v13 = *(void *)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 104];
  char v16 = v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 112];
  char v14 = v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 24];
  uint64_t v20 = *(void *)&v21[OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content + 40];
  __swift_project_boxed_opaque_existential_1((void *)(*v4 + 16), *(void *)(*v4 + 40));
  v22[0] = v5;
  v22[1] = v6;
  v22[2] = (uint64_t)v7;
  char v23 = v14;
  uint64_t v24 = v19;
  uint64_t v25 = v20;
  uint64_t v26 = v18;
  uint64_t v27 = v8;
  unint64_t v28 = v9;
  char v29 = v10;
  uint64_t v30 = v17;
  uint64_t v31 = v11;
  v32 = v12;
  uint64_t v33 = v13;
  char v34 = v16;
  swift_bridgeObjectRetain();
  sub_1DEB2EF54(v7, v14);
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(v8) = v10;
  sub_1DEB2EF78(v9, v10);
  id v15 = v12;
  swift_bridgeObjectRetain();
  sub_1DFC60978(v22, 2);
  swift_bridgeObjectRelease();
  sub_1DEB2F130(v7, v14);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DEB2F154(v9, v8);

  swift_bridgeObjectRelease();
}

- (_TtC7NewsUI229ContinueReadingViewController)initWithRequest:(id)a3
{
  id v3 = a3;
  result = (_TtC7NewsUI229ContinueReadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7NewsUI229ContinueReadingViewController)initWithRequest:(id)a3 bag:(id)a4 account:(id)a5
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = a5;
  result = (_TtC7NewsUI229ContinueReadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (_TtC7NewsUI229ContinueReadingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7NewsUI229ContinueReadingViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  id v3 = *(FBSSceneIdentityToken **)((char *)&self->super.super.super.super.__layeringSceneIdentity
                                 + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  unint64_t v4 = *(unint64_t *)((char *)&self->super.super.super._navigationItem
                           + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  char v5 = *((unsigned char *)&self->super.super.super._toolbarItems
       + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  id v6 = *(NSBundle **)((char *)&self->super.super.super._nibBundle
                    + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  char v7 = *((unsigned char *)&self->super.super.super._overrideTransitioningDelegate
       + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_content);
  swift_bridgeObjectRelease();
  sub_1DEB2F130(v3, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1DEB2F154(v4, v5);
  swift_bridgeObjectRelease();

  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_eventHandler);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_dialogRequestFactory);
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_relativeTabBarController));
  uint64_t v8 = (char *)self + OBJC_IVAR____TtC7NewsUI229ContinueReadingViewController_styler;
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v8);
}

- (void)messageViewController:(id)a3 didSelectActionWithDialogResult:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1DEC0F924((uint64_t)v6, v7);
}

- (void)messageViewController:(id)a3 didLoadDialogRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = self;
  sub_1DEC1005C((uint64_t)v6, v7);
}

- (void)messageViewController:(id)a3 didUpdateSize:(CGSize)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1DEC101F8();
}

- (void)messageViewController:(id)a3 didFailWithError:(id)a4
{
  id v6 = a3;
  id v7 = self;
  id v8 = a4;
  sub_1DEC103A8((uint64_t)v6, a4);
}

- (void)messageViewControllerDidDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1DEC0FD3C((uint64_t)v4);
}

@end