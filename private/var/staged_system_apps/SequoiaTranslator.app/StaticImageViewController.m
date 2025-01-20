@interface StaticImageViewController
- (_TtC17SequoiaTranslator25StaticImageViewController)initWithCoder:(id)a3;
- (_TtC17SequoiaTranslator25StaticImageViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (id)viewForZoomingInScrollView:(id)a3;
- (void)applicationWillSuspend;
- (void)handleKeyboardDidShowWithKeyboardShowNotification:(id)a3;
- (void)scrollViewDidZoom:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4;
- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4;
@end

@implementation StaticImageViewController

- (_TtC17SequoiaTranslator25StaticImageViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1001D0D54();
}

- (void)viewDidLoad
{
  v4.receiver = self;
  v4.super_class = (Class)type metadata accessor for StaticImageViewController();
  id v2 = v4.receiver;
  [(StaticImageViewController *)&v4 viewDidLoad];
  sub_1001C7718();
  sub_1001C7E30();
  id v3 = [self defaultCenter];
  [v3 addObserver:v2 selector:"handleKeyboardDidShowWithKeyboardShowNotification:" name:UIKeyboardDidShowNotification object:0];
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for StaticImageViewController();
  id v2 = v3.receiver;
  [(StaticImageViewController *)&v3 viewDidLayoutSubviews];
  sub_1001C759C();
}

- (void)willTransitionToTraitCollection:(id)a3 withTransitionCoordinator:(id)a4
{
  id v5 = a3;
  swift_unknownObjectRetain();
  v6 = self;
  sub_1001D0E84(v5);

  swift_unknownObjectRelease();
}

- (void)viewWillTransitionToSize:(CGSize)a3 withTransitionCoordinator:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  swift_unknownObjectRetain();
  v8 = self;
  sub_1001C7008(a4, width, height);

  swift_unknownObjectRelease();
}

- (void)applicationWillSuspend
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for StaticImageViewController();
  id v2 = v5.receiver;
  [(StaticImageViewController *)&v5 applicationWillSuspend];
  swift_getKeyPath();
  swift_getKeyPath();
  static Published.subscript.getter();
  swift_release();
  swift_release();
  if (v4 != 5)
  {
    sub_10005477C(v3, v4);
    if (v4 == 1) {
      sub_1001CD1B4();
    }
  }
}

- (void)handleKeyboardDidShowWithKeyboardShowNotification:(id)a3
{
  uint64_t v4 = type metadata accessor for Notification();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v9 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  static Notification._unconditionallyBridgeFromObjectiveC(_:)();
  v8 = self;
  sub_1001CCEA8();

  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);
}

- (_TtC17SequoiaTranslator25StaticImageViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC17SequoiaTranslator25StaticImageViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10010D860(*(id *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_image), self->image[OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_image]);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_conversation));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_favoritesImporter));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_imageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_currentTranslationView));
  swift_release();
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_materialView));
  sub_100013384((uint64_t)self + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_delegate);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_translationHostingController));
  swift_release();
  swift_release();

  swift_release();
}

- (id)viewForZoomingInScrollView:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.isa
                                                 + OBJC_IVAR____TtC17SequoiaTranslator25StaticImageViewController_imageView));
}

- (void)scrollViewDidZoom:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  sub_1001C759C();
}

@end