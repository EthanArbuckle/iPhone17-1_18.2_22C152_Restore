@interface iOSLinkAcceleratorViewController
- (_TtC11NotesEditor32iOSLinkAcceleratorViewController)init;
- (_TtC11NotesEditor32iOSLinkAcceleratorViewController)initWithCoder:(id)a3;
- (void)dealloc;
- (void)viewDidLoad;
@end

@implementation iOSLinkAcceleratorViewController

- (void)dealloc
{
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11NotesEditor32iOSLinkAcceleratorViewController_kvoToken);
  v4 = self;
  if (v3)
  {
    id v5 = v3;
    sub_20C15F3A0();
  }
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for iOSLinkAcceleratorViewController();
  [(iOSLinkAcceleratorViewController *)&v6 dealloc];
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC11NotesEditor32iOSLinkAcceleratorViewController_collectionViewController));
  v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR____TtC11NotesEditor32iOSLinkAcceleratorViewController_kvoToken);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_20BFF9A50();
}

- (_TtC11NotesEditor32iOSLinkAcceleratorViewController)init
{
  return (_TtC11NotesEditor32iOSLinkAcceleratorViewController *)iOSLinkAcceleratorViewController.init()();
}

- (_TtC11NotesEditor32iOSLinkAcceleratorViewController)initWithCoder:(id)a3
{
  return (_TtC11NotesEditor32iOSLinkAcceleratorViewController *)sub_20BFFA568(a3);
}

@end