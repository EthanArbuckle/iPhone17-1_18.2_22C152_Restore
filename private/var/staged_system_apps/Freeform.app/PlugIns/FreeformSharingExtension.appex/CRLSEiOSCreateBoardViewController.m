@interface CRLSEiOSCreateBoardViewController
- (BOOL)textFieldShouldReturn:(id)a3;
- (_TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController)initWithCoder:(id)a3;
- (_TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)cancel:(id)a3;
- (void)createBoardButtonAction:(id)a3;
- (void)textFieldDidChangeSelection:(id)a3;
- (void)viewDidAppear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CRLSEiOSCreateBoardViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_10002ED24();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_10002F550(a3);
}

- (void)viewDidAppear:(BOOL)a3
{
  v4 = self;
  sub_10002F6C0(a3);
}

- (void)createBoardButtonAction:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_10005CB20();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v12, 0, sizeof(v12));
    v5 = self;
  }
  v6 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField);
  if (v6)
  {
    id v7 = [v6 text];
    if (v7)
    {
      v8 = v7;
      uint64_t v9 = sub_10005C810();
      uint64_t v11 = v10;
    }
    else
    {
      uint64_t v9 = 0;
      uint64_t v11 = 0xE000000000000000;
    }
    sub_10002FB7C(v9, v11);

    swift_bridgeObjectRelease();
    sub_100030738((uint64_t)v12);
  }
  else
  {
    __break(1u);
  }
}

- (void)cancel:(id)a3
{
  id v4 = a3;
  v8 = self;
  v5 = (_TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController *)[(CRLSEiOSCreateBoardViewController *)v8 navigationController];
  if (v5)
  {
    v6 = v5;
    id v7 = [(CRLSEiOSCreateBoardViewController *)v5 popToRootViewControllerAnimated:1];

    id v4 = v7;
    v8 = v6;
  }
}

- (BOOL)textFieldShouldReturn:(id)a3
{
  id v4 = a3;
  v5 = self;
  id v6 = [v4 text];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = sub_10005C810();
    uint64_t v10 = v9;
  }
  else
  {
    uint64_t v8 = 0;
    uint64_t v10 = 0xE000000000000000;
  }
  sub_10002FB7C(v8, v10);

  swift_bridgeObjectRelease();
  return 0;
}

- (void)textFieldDidChangeSelection:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_10002FA18(v4);
}

- (_TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_10005C810();
    *(void *)&self->delegate[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate] = 0;
    swift_unknownObjectWeakInit();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField) = 0;
    id v6 = a4;
    NSString v7 = sub_10005C7D0();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->delegate[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate] = 0;
    swift_unknownObjectWeakInit();
    *(Class *)((char *)&self->super.super.super.isa
             + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField) = 0;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for CRLSEiOSCreateBoardViewController();
  uint64_t v9 = [(CRLSEiOSCreateBoardViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController)initWithCoder:(id)a3
{
  *(void *)&self->delegate[OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate] = 0;
  swift_unknownObjectWeakInit();
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField) = 0;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CRLSEiOSCreateBoardViewController();
  return [(CRLSEiOSCreateBoardViewController *)&v6 initWithCoder:a3];
}

- (void).cxx_destruct
{
  sub_1000307D8((uint64_t)self + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_delegate);
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC24FreeformSharingExtension33CRLSEiOSCreateBoardViewController_newBoardTextField);
}

@end