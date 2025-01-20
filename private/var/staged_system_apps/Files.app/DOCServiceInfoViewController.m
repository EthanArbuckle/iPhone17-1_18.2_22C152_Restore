@interface DOCServiceInfoViewController
- (_TtC5Files28DOCServiceInfoViewController)init;
- (_TtC5Files28DOCServiceInfoViewController)initWithConfiguration:(id)a3 actionReporting:(id)a4 nodes:(id)a5 showTagsOnly:(BOOL)a6;
- (int64_t)modalPresentationStyle;
- (void)doc_startPreheatIfNecessary;
- (void)doneButtonTapped:(id)a3;
- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3;
- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5;
- (void)presentationControllerWillDismiss:(id)a3;
- (void)setModalPresentationStyle:(int64_t)a3;
- (void)traitCollectionDidChange:(id)a3;
- (void)viewDidLoad;
@end

@implementation DOCServiceInfoViewController

- (_TtC5Files28DOCServiceInfoViewController)initWithConfiguration:(id)a3 actionReporting:(id)a4 nodes:(id)a5 showTagsOnly:(BOOL)a6
{
  sub_1000CBE70((uint64_t *)&unk_100706730);
  uint64_t v9 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  id v10 = a3;
  swift_unknownObjectRetain();
  v11 = (_TtC5Files28DOCServiceInfoViewController *)sub_100385FD8(v10, (uint64_t)a4, v9, a6);

  swift_unknownObjectRelease();
  return v11;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100385528();
}

- (void)preferredContentSizeDidChangeForChildContentContainer:(id)a3
{
  swift_unknownObjectRetain();
  v5 = self;
  sub_1003858E4(a3);
  swift_unknownObjectRelease();
}

- (void)traitCollectionDidChange:(id)a3
{
  id v5 = a3;
  v6 = self;
  sub_100385A2C((uint64_t)a3);
}

- (void)doneButtonTapped:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    _bridgeAnyObjectToAny(_:)();
    swift_unknownObjectRelease();
  }
  else
  {
    long long v6 = 0u;
    long long v7 = 0u;
    id v5 = self;
  }
  -[DOCServiceInfoViewController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, 0, v6, v7);

  sub_10006273C((uint64_t)&v6);
}

- (int64_t)modalPresentationStyle
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(DOCServiceInfoViewController *)&v3 modalPresentationStyle];
}

- (void)setModalPresentationStyle:(int64_t)a3
{
  v4 = self;
  sub_100385C50(a3);
}

- (_TtC5Files28DOCServiceInfoViewController)init
{
  result = (_TtC5Files28DOCServiceInfoViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files28DOCServiceInfoViewController_configuration));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files28DOCServiceInfoViewController_infoViewController));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Files28DOCServiceInfoViewController_infoNavigationController);
}

- (void)doc_startPreheatIfNecessary
{
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Files28DOCServiceInfoViewController_infoViewController);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = self;
  v7[4] = sub_100386680;
  v7[5] = v4;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 1107296256;
  v7[2] = sub_1000666D8;
  v7[3] = &unk_1006A57C8;
  id v5 = _Block_copy(v7);
  long long v6 = self;
  swift_release();
  [v3 objc_doc_preheatForPresentingWithCompletion:v5];
  _Block_release(v5);
}

- (void)presentationController:(id)a3 willPresentWithAdaptiveStyle:(int64_t)a4 transitionCoordinator:(id)a5
{
  id v7 = a3;
  swift_unknownObjectRetain();
  v8 = self;
  sub_100386430((void *)a4);

  swift_unknownObjectRelease();
}

- (void)presentationControllerWillDismiss:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_1003864A0(v4);
}

@end