@interface ScanwaveViewController
- (_TtC20SystemUIAnimationKit22ScanwaveViewController)initWithCoder:(id)a3;
- (_TtC20SystemUIAnimationKit22ScanwaveViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (unint64_t)supportedInterfaceOrientations;
- (void)dealloc;
- (void)settings:(id)a3 changedValueForKeyPath:(id)a4;
- (void)viewDidLayoutSubviews;
- (void)viewDidLoad;
@end

@implementation ScanwaveViewController

- (_TtC20SystemUIAnimationKit22ScanwaveViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = sub_25E75BEB0();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC20SystemUIAnimationKit22ScanwaveViewController *)sub_25E738608(v5, v7, a4);
}

- (_TtC20SystemUIAnimationKit22ScanwaveViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_25E749664();
}

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_prototypeSettings);
  id v3 = self;
  objc_msgSend(v2, sel_removeKeyPathObserver_, v3);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for ScanwaveViewController(0);
  [(ScanwaveViewController *)&v4 dealloc];
}

- (void).cxx_destruct
{
  sub_25E74825C(*(void **)((char *)&self->super.super.super.isa+ OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_imageConfiguration), *(void **)((char *)&self->super.super._responderFlags+ OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_imageConfiguration));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_chromaticAberrationBackdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_chromaticAberrationMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_fillLightView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_fillLightMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_inverseBlurBackdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_inverseBlurMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_mainMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_circleMaskView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_depthDistanceFieldImageView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_meshBackdropView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_sourceImageView));
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  memcpy(__dst, (char *)self + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_componentPrototypeSettings, 0x4D1uLL);
  sub_25E74829C((uint64_t)__dst);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_prototypeSettings));
  swift_release();
  sub_25E7481BC((uint64_t)self + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_rootComponent, type metadata accessor for RootComponent);
  __swift_destroy_boxed_opaque_existential_0((uint64_t)self + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_transactionCommitObserverProvider);
}

- (unint64_t)supportedInterfaceOrientations
{
  return 2;
}

- (void)viewDidLoad
{
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for ScanwaveViewController(0);
  id v2 = v6.receiver;
  [(ScanwaveViewController *)&v6 viewDidLoad];
  id v3 = objc_msgSend(v2, sel_view, v6.receiver, v6.super_class);
  if (v3)
  {
    objc_super v4 = v3;
    id v5 = objc_msgSend(v3, sel_layer);

    objc_msgSend(v5, sel_setAllowsGroupBlending_, 0);
  }
  else
  {
    __break(1u);
  }
}

- (void)viewDidLayoutSubviews
{
  id v2 = self;
  sub_25E738D94();
}

- (void)settings:(id)a3 changedValueForKeyPath:(id)a4
{
  id v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_prototypeSettings);
  id v6 = a3;
  uint64_t v7 = self;
  sub_25E710E88((char *)v5, (uint64_t)v8);
  memcpy(__dst, (char *)v7 + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_componentPrototypeSettings, 0x4D1uLL);
  memcpy((char *)v7 + OBJC_IVAR____TtC20SystemUIAnimationKit22ScanwaveViewController_componentPrototypeSettings, v8, 0x4D1uLL);
  sub_25E74829C((uint64_t)__dst);
  sub_25E73A908();
}

@end