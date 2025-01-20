@interface SceneHostingViewController
- (BOOL)becomeFirstResponder;
- (BOOL)canBecomeFirstResponder;
- (BOOL)resignFirstResponder;
- (_TtC18PreviewsServicesUI26SceneHostingViewController)initWithCoder:(id)a3;
- (_TtC18PreviewsServicesUI26SceneHostingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation SceneHostingViewController

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)swift_getObjectType();
  id v2 = v6.receiver;
  [(SceneHostingViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    v4 = v3;
    id v5 = objc_msgSend(self, sel_systemBackgroundColor);
    objc_msgSend(v4, sel_setBackgroundColor_, v5);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  SceneHostingViewController.viewDidLayoutSubviews()();
}

- (void)viewDidAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v7.receiver = self;
  v7.super_class = (Class)swift_getObjectType();
  v4 = (char *)v7.receiver;
  [(SceneHostingViewController *)&v7 viewDidAppear:v3];
  id v5 = &v4[OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview];
  swift_beginAccess();
  if (*v5 == 1)
  {
    objc_super v6 = (char *)objc_msgSend(v4, sel_traitCollection);
    objc_msgSend(v6, sel_activeAppearance);

    v4 = v6;
  }
}

- (BOOL)canBecomeFirstResponder
{
  if (!*(Class *)((char *)&self->super.super.super.isa
                 + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host))
    return 0;
  id v2 = (BOOL *)self + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview;
  swift_beginAccess();
  return *v2;
}

- (BOOL)becomeFirstResponder
{
  return sub_23996DA78(self, (uint64_t)a2, (const char **)&selRef_becomeFirstResponder, 1);
}

- (BOOL)resignFirstResponder
{
  return sub_23996DA78(self, (uint64_t)a2, (const char **)&selRef_resignFirstResponder, 0);
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = (char *)self + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_isUserActivePreview;
  swift_beginAccess();
  if (*v5 == 1)
  {
    id v6 = a3;
    objc_super v7 = self;
    id v8 = [(SceneHostingViewController *)v7 traitCollection];
    objc_msgSend(v8, sel_activeAppearance);
  }
}

- (_TtC18PreviewsServicesUI26SceneHostingViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_23997FE30();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC18PreviewsServicesUI26SceneHostingViewController *)SceneHostingViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC18PreviewsServicesUI26SceneHostingViewController)initWithCoder:(id)a3
{
  return (_TtC18PreviewsServicesUI26SceneHostingViewController *)SceneHostingViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  sub_239968FAC(*(uint64_t *)((char *)&self->super.super.super.isa
                           + OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_deactivatedHandler));
  sub_239970800(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_host));
  sub_2399701A0(*(uint64_t *)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest), *(void *)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest), *(uint64_t *)((char *)&self->super.super.__layeringSceneIdentity+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest), *(uint64_t *)((char *)&self->super._overrideTransitioningDelegate+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest), *(uint64_t *)((char *)&self->super._view+ OBJC_IVAR____TtC18PreviewsServicesUI26SceneHostingViewController_currentActivationRequest));

  swift_release();
}

@end