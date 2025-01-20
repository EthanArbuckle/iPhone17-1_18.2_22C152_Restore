@interface CRLiOSFolderGridViewController.ListItem.ListViewController
- (_TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController)init;
- (_TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController)initWithCoder:(id)a3;
- (void)updateViewConstraints;
- (void)viewDidLayoutSubviews;
@end

@implementation CRLiOSFolderGridViewController.ListItem.ListViewController

- (void)updateViewConstraints
{
  v2 = self;
  if (sub_10092123C())
  {
    sub_1009238E8();
    sub_100923B0C();
    sub_10092464C();
    sub_100924890(0);
    sub_100924C2C();
    swift_release();
    v3.receiver = v2;
    v3.super_class = (Class)_s8ListItemC18ListViewControllerCMa();
    [(CRLiOSFolderGridViewController.ListItem.ListViewController *)&v3 updateViewConstraints];
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)_s8ListItemC18ListViewControllerCMa();
  id v2 = v3.receiver;
  [(CRLiOSFolderGridViewController.ListItem.ListViewController *)&v3 viewDidLayoutSubviews];
  sub_100923334(1);
}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController)init
{
  return (_TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController *)sub_100923520();
}

- (_TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController)initWithCoder:(id)a3
{
  return (_TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController *)sub_100923650(a3);
}

- (void).cxx_destruct
{
  sub_100927A6C(*(uint64_t *)((char *)&self->super.super.super.super.isa
                           + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController____lazy_storage___textLayoutBuilder));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_textLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_primaryRowLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_secondaryRowLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_tertiaryRowLayoutGuide));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_isInMultipleSelectionModeConstraint));
  objc_super v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtCCC8Freeform30CRLiOSFolderGridViewController8ListItem18ListViewController_isNotInMultipleSelectionModeConstraint);
}

@end