@interface CRLiOSFolderGridViewController.GridItem.GridViewController
- (_TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController)init;
- (_TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController)initWithCoder:(id)a3;
- (void)viewDidLoad;
@end

@implementation CRLiOSFolderGridViewController.GridItem.GridViewController

- (void)viewDidLoad
{
  swift_getObjectType();
  v5.receiver = self;
  v5.super_class = (Class)_s8GridItemC18GridViewControllerCMa();
  v3 = self;
  [(CRLiOSFolderGridViewController.Item.ViewController *)&v5 viewDidLoad];
  sub_1005057FC((uint64_t *)&unk_10168D9A0);
  uint64_t v4 = swift_allocObject();
  *(_OWORD *)(v4 + 16) = xmmword_10117D8C0;
  *(void *)(v4 + 32) = type metadata accessor for UITraitUserInterfaceLevel();
  *(void *)(v4 + 40) = &protocol witness table for UITraitUserInterfaceLevel;
  *(void *)(v4 + 48) = type metadata accessor for UITraitUserInterfaceStyle();
  *(void *)(v4 + 56) = &protocol witness table for UITraitUserInterfaceStyle;
  UIViewController.registerForTraitChanges<A>(_:handler:)();

  swift_bridgeObjectRelease();
  swift_unknownObjectRelease();
}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController)init
{
  uint64_t v3 = OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController_labelBackdropView;
  id v4 = objc_allocWithZone((Class)UIView);
  objc_super v5 = self;
  *(Class *)((char *)&self->super.super.super.super.isa + v3) = (Class)[v4 initWithFrame:0.0, 0.0, 0.0, 0.0];
  *(Class *)((char *)&v5->super.super.super.super.isa
           + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController_attributionViewBottomConstraint) = 0;

  v7.receiver = v5;
  v7.super_class = (Class)_s8GridItemC18GridViewControllerCMa();
  return [(CRLiOSFolderGridViewController.Item.ViewController *)&v7 init];
}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController)initWithCoder:(id)a3
{
  return (_TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController *)sub_1005D830C(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController_labelBackdropView));
  uint64_t v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8GridItem18GridViewController_attributionViewBottomConstraint);
}

@end