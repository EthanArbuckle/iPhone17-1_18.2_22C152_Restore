@interface CRLSEiOSMainViewController
- (_TtC24FreeformSharingExtension26CRLSEiOSMainViewController)initWithCoder:(id)a3;
- (_TtC24FreeformSharingExtension26CRLSEiOSMainViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancel:(id)a3;
- (void)collectionView:(id)a3 didSelectItemAtIndexPath:(id)a4;
- (void)dealloc;
- (void)keyboardDidShowWithNotification:(id)a3;
- (void)keyboardWillHideWithNotification:(id)a3;
- (void)loadView;
- (void)observedTraitsDidChange;
- (void)save:(id)a3;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation CRLSEiOSMainViewController

- (void)loadView
{
  v2 = self;
  sub_1000231A8();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1000242C8();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100026220(a3);
}

- (void)viewWillDisappear:(BOOL)a3
{
  v4 = self;
  sub_100026618(a3);
}

- (void)viewDidLayoutSubviews
{
  v2 = self;
  sub_1000266EC();
}

- (void)dealloc
{
  v3 = self;
  v4 = self;
  id v5 = [v3 defaultCenter];
  [v5 removeObserver:v4];

  v6.receiver = v4;
  v6.super_class = (Class)type metadata accessor for CRLSEiOSMainViewController();
  [(CRLSEiOSMainViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  swift_unknownObjectWeakDestroy();
  sub_10001E8C0((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_selectedBoard, &qword_10007D0D8);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController____lazy_storage___extensionContextManager));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerContentSizeObservation));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_scrollView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_sharedTextContent));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_activityIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_boardPickerHeightContraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_contentViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_previewViewHeightConstraint));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24FreeformSharingExtension26CRLSEiOSMainViewController_dataSource);
}

- (void)observedTraitsDidChange
{
  v2 = self;
  sub_100026AF8();
}

- (void)keyboardDidShowWithNotification:(id)a3
{
}

- (void)keyboardWillHideWithNotification:(id)a3
{
}

- (void)save:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10002D638();
}

- (void)cancel:(id)a3
{
  id v4 = a3;
  id v5 = self;
  sub_10002D7BC();
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
  sub_10002BC8C(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (_TtC24FreeformSharingExtension26CRLSEiOSMainViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_10005C810();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC24FreeformSharingExtension26CRLSEiOSMainViewController *)sub_10002C288(v5, v7, a4);
}

- (_TtC24FreeformSharingExtension26CRLSEiOSMainViewController)initWithCoder:(id)a3
{
  return (_TtC24FreeformSharingExtension26CRLSEiOSMainViewController *)sub_10002C4B4(a3);
}

@end