@interface ModalSheet
+ (id)presentableViewController:(id)a3 height:(double)a4;
- (_TtC10PodcastsUI10ModalSheet)initWithCoder:(id)a3;
- (_TtC10PodcastsUI10ModalSheet)initWithNibName:(id)a3 bundle:(id)a4;
- (void)handleButton:(id)a3;
- (void)viewDidLoad;
@end

@implementation ModalSheet

+ (id)presentableViewController:(id)a3 height:(double)a4
{
  id v5 = a3;
  v6 = (void *)_s10PodcastsUI10ModalSheetC25presentableViewController_6heightSo06UIViewG0CAG_12CoreGraphics7CGFloatVtFZ_0(v5, a4);

  return v6;
}

- (_TtC10PodcastsUI10ModalSheet)initWithCoder:(id)a3
{
  id v3 = a3;
  _s10PodcastsUI10ModalSheetC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_1E3D7B8D8();
}

- (void)handleButton:(id)a3
{
  if (a3)
  {
    v4 = self;
    swift_unknownObjectRetain();
    sub_1E3E7DCA0();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    id v5 = self;
  }
  sub_1E3D7B188((uint64_t)v6);

  sub_1E3C2AC28((uint64_t)v6);
}

- (_TtC10PodcastsUI10ModalSheet)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC10PodcastsUI10ModalSheet *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC10PodcastsUI10ModalSheet____lazy_storage___marginGuide);
}

@end