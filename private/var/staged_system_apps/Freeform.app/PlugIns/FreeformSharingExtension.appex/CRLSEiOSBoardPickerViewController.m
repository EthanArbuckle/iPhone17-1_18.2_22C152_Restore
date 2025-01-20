@interface CRLSEiOSBoardPickerViewController
- (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController)initWithCoder:(id)a3;
- (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancel:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)viewDidLoad;
@end

@implementation CRLSEiOSBoardPickerViewController

- (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___shortDateFormatter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___mediumDateFormatter) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter) = 0;
  *(void *)&self->dataSource[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  id v5 = a3;

  result = (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *)sub_10005CC90();
  __break(1u);
  return result;
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100037B70();
}

- (void)cancel:(id)a3
{
  id v4 = a3;
  v8 = self;
  id v5 = (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *)[(CRLSEiOSBoardPickerViewController *)v8 navigationController];
  if (v5)
  {
    v6 = v5;
    id v7 = [(CRLSEiOSBoardPickerViewController *)v5 popToRootViewControllerAnimated:1];

    id v4 = v7;
    v8 = v6;
  }
}

- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4
{
  uint64_t v6 = sub_10005C460();
  uint64_t v7 = *(void *)(v6 - 8);
  __chkstk_darwin(v6);
  v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_10005C440();
  id v10 = a3;
  v11 = self;
  sub_10003AFDC(v10);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_10003C154((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_representedObject, type metadata accessor for CRLSELibraryViewModeItemNode);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_dataSource));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___shortDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___mediumDateFormatter));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController____lazy_storage___localizedDateFormatter));
  v3 = (char *)self + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSBoardPickerViewController_delegate;

  sub_1000307D8((uint64_t)v3);
}

@end