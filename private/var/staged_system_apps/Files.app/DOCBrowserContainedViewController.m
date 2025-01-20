@interface DOCBrowserContainedViewController
- (BOOL)allowsPickingMultipleItems;
- (BOOL)forceEditingMode;
- (BOOL)hidesNavigationBackButton;
- (BOOL)isInUserTriggeredSelectionMode;
- (BOOL)wantsAppearanceOverride;
- (NSArray)additionalLeadingNavigationBarButtonItems;
- (NSArray)additionalTrailingNavigationBarButtonItems;
- (_TtC5Files18DOCDocumentManager)documentManager;
- (_TtC5Files33DOCBrowserContainedViewController)initWithCoder:(id)a3;
- (_TtC5Files33DOCBrowserContainedViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtP5Files34DOCBrowserContainedActionReporting_)actionReporting;
- (void)effectiveAppearanceDidChange:(id)a3;
- (void)setActionReporting:(id)a3;
- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3;
- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3;
- (void)setAllowsPickingMultipleItems:(BOOL)a3;
- (void)setEditing:(BOOL)a3 animated:(BOOL)a4;
- (void)setForceEditingMode:(BOOL)a3;
- (void)viewDidLoad;
@end

@implementation DOCBrowserContainedViewController

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_configuration));
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_eventReporting);
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_viewReusing);
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_actionReporting);
  sub_10003A094((uint64_t)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_overlayDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_documentManager));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_actionManager));
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_containerNavigationItem));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_uipDocLandingBackground);
}

- (void)effectiveAppearanceDidChange:(id)a3
{
  id v4 = a3;
  v5 = self;
  DOCBrowserContainedViewController.effectiveAppearanceDidChange(_:)(v4);
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for DOCBrowserContainedViewController();
  id v2 = v3.receiver;
  [(DOCBrowserContainedViewController *)&v3 viewDidLoad];
  sub_1000A6988();
  sub_1000457E8(0);
}

- (BOOL)hidesNavigationBackButton
{
  objc_super v3 = (char *)self + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_overlayDelegate;
  if (!swift_unknownObjectWeakLoadStrong())
  {
    v11 = self;
    unint64_t v8 = (unint64_t)_swiftEmptyArrayStorage;
    if (!((unint64_t)_swiftEmptyArrayStorage >> 62)) {
      goto LABEL_3;
    }
LABEL_6:
    swift_bridgeObjectRetain();
    uint64_t v9 = _CocoaArrayWrapper.endIndex.getter();

    swift_bridgeObjectRelease();
    goto LABEL_4;
  }
  uint64_t v4 = *((void *)v3 + 1);
  uint64_t ObjectType = swift_getObjectType();
  v6 = *(uint64_t (**)(uint64_t, uint64_t))(v4 + 48);
  v7 = self;
  unint64_t v8 = v6(ObjectType, v4);
  swift_unknownObjectRelease();
  if (v8 >> 62) {
    goto LABEL_6;
  }
LABEL_3:
  uint64_t v9 = *(void *)((v8 & 0xFFFFFFFFFFFFFF8) + 0x10);

LABEL_4:
  swift_bridgeObjectRelease();
  return v9 > 0;
}

- (BOOL)wantsAppearanceOverride
{
  return 0;
}

- (void)setEditing:(BOOL)a3 animated:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)type metadata accessor for DOCBrowserContainedViewController();
  id v6 = v9.receiver;
  [(DOCBrowserContainedViewController *)&v9 setEditing:v5 animated:v4];
  sub_10009E6C4(0, (unint64_t *)&unk_100711B80);
  v7 = (void *)UIViewController.doc_nearestAncestor<A>(ofType:searchPresentingHierarchy:)();
  if (v7)
  {
    unint64_t v8 = v7;
    [v7 setEditing:v5 animated:v4];

    id v6 = v8;
  }
}

- (_TtP5Files34DOCBrowserContainedActionReporting_)actionReporting
{
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (_TtP5Files34DOCBrowserContainedActionReporting_ *)Strong;
}

- (void)setActionReporting:(id)a3
{
}

- (_TtC5Files18DOCDocumentManager)documentManager
{
  return (_TtC5Files18DOCDocumentManager *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.isa
                                                                                   + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_documentManager));
}

- (BOOL)allowsPickingMultipleItems
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_allowsPickingMultipleItems);
}

- (void)setAllowsPickingMultipleItems:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v4 = self;
  sub_1000A6864(v3);
}

- (BOOL)forceEditingMode
{
  return *((unsigned char *)&self->super.super.super.super.isa
         + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_forceEditingMode);
}

- (void)setForceEditingMode:(BOOL)a3
{
  *((unsigned char *)&self->super.super.super.super.isa
  + OBJC_IVAR____TtC5Files33DOCBrowserContainedViewController_forceEditingMode) = a3;
  if (a3) {
    [(DOCBrowserContainedViewController *)self setEditing:1 animated:0];
  }
}

- (BOOL)isInUserTriggeredSelectionMode
{
  id v2 = self;
  if ([(DOCBrowserContainedViewController *)v2 isEditing])
  {
    char v3 = (*(uint64_t (**)(void))((swift_isaMask & (uint64_t)v2->super.super.super.super.isa) + 0x168))();

    char v4 = v3 ^ 1;
  }
  else
  {

    char v4 = 0;
  }
  return v4 & 1;
}

- (NSArray)additionalLeadingNavigationBarButtonItems
{
  return (NSArray *)sub_100240570();
}

- (void)setAdditionalLeadingNavigationBarButtonItems:(id)a3
{
}

- (NSArray)additionalTrailingNavigationBarButtonItems
{
  return (NSArray *)sub_100240570();
}

- (void)setAdditionalTrailingNavigationBarButtonItems:(id)a3
{
}

- (_TtC5Files33DOCBrowserContainedViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002408E0();
}

- (_TtC5Files33DOCBrowserContainedViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC5Files33DOCBrowserContainedViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end