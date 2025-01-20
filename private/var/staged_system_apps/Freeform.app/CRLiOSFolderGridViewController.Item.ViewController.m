@interface CRLiOSFolderGridViewController.Item.ViewController
- (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController)init;
- (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController)initWithCoder:(id)a3;
- (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
- (void)viewDidLoad;
@end

@implementation CRLiOSFolderGridViewController.Item.ViewController

- (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController)init
{
  return (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController *)sub_100D229B0();
}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100D27C1C();
}

- (void)loadView
{
  id v3 = (objc_class *)_s4ItemC14ViewControllerC8ItemViewCMa();
  id v4 = objc_allocWithZone(v3);
  swift_unknownObjectWeakInit();
  swift_unknownObjectWeakAssign();
  v7.receiver = v4;
  v7.super_class = v3;
  v5 = self;
  v6 = -[CRLiOSFolderGridViewController.Item.ViewController initWithFrame:](&v7, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  -[CRLiOSFolderGridViewController.Item.ViewController setView:](v5, "setView:", v6, v7.receiver, v7.super_class);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100D22E3C();
}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_100523398((uint64_t)self + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_owningItem);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_dropShadowView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_roundedCornersContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_thumbnailImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_thumbnailBackdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_thumbnailContainerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_favoriteButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_attributionHostingView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_attributionView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_selectionStateBadge));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_boardTitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_lastEditedTimestampLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_collaboratorNameLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController4Item14ViewController_overrideTraitCollection);
}

@end