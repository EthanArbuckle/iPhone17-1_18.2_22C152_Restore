@interface FMMapSettingsViewController
- (_TtC6FindMy27FMMapSettingsViewController)initWithCoder:(id)a3;
- (void)attributionPressed;
- (void)selectDefaultOption;
- (void)selectHybridOption;
- (void)selectKMOption;
- (void)selectMilesOption;
- (void)selectSatelliteOption;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillDisappear:(BOOL)a3;
@end

@implementation FMMapSettingsViewController

- (_TtC6FindMy27FMMapSettingsViewController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100108768();
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  id v4 = v5.receiver;
  [(FMMapSettingsViewController *)&v5 viewWillAppear:v3];
  sub_100107BC8();
  sub_100107DA0();
}

- (void)viewWillDisappear:(BOOL)a3
{
  id v4 = self;
  sub_100106398(a3);
}

- (void)selectDefaultOption
{
  uint64_t v2 = (*(void **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_mediator))[7]
     + OBJC_IVAR____TtC6FindMy21FMSelectionController_selectedMapMode;
  *(_WORD *)uint64_t v2 = 0;
  *(unsigned char *)(v2 + 2) = 1;
  BOOL v3 = self;
  swift_retain();
  sub_10024B8C0();
  swift_release();
  sub_100107BC8();
}

- (void)selectHybridOption
{
  uint64_t v2 = (*(void **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_mediator))[7]
     + OBJC_IVAR____TtC6FindMy21FMSelectionController_selectedMapMode;
  *(_WORD *)uint64_t v2 = 1;
  *(unsigned char *)(v2 + 2) = 1;
  BOOL v3 = self;
  swift_retain();
  sub_10024B8C0();
  swift_release();
  sub_100107BC8();
}

- (void)selectSatelliteOption
{
  uint64_t v2 = (*(void **)((char *)&self->super.super.super.super.isa
                   + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_mediator))[7];
  uint64_t v3 = qword_1006AE070;
  v7 = self;
  swift_retain();
  if (v3 != -1) {
    swift_once();
  }
  char v4 = HIBYTE(word_1006D1900);
  char v5 = byte_1006D1902;
  v6 = (unsigned char *)(v2 + OBJC_IVAR____TtC6FindMy21FMSelectionController_selectedMapMode);
  unsigned char *v6 = word_1006D1900;
  v6[1] = v4;
  v6[2] = v5;
  sub_10024B8C0();
  swift_release();
  sub_100107BC8();
}

- (void)selectMilesOption
{
  *(void *)((*(void **)((char *)&self->super.super.super.super.isa
                          + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_mediator))[7]
            + OBJC_IVAR____TtC6FindMy21FMSelectionController_selectedUnit) = 3;
  uint64_t v2 = self;
  swift_retain();
  sub_10024BCB8();
  swift_release();
  sub_100107DA0();
}

- (void)selectKMOption
{
  *(void *)((*(void **)((char *)&self->super.super.super.super.isa
                          + OBJC_IVAR____TtC6FindMy27FMBaseContentViewController_mediator))[7]
            + OBJC_IVAR____TtC6FindMy21FMSelectionController_selectedUnit) = 2;
  uint64_t v2 = self;
  swift_retain();
  sub_10024BCB8();
  swift_release();
  sub_100107DA0();
}

- (void)attributionPressed
{
  uint64_t v2 = self;
  sub_100108240();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_optionPlatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_defaultOption));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_hybridOption));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_satelliteOption));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_distanceOptionPlatter));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_milesOption));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_kmOption));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_attribution));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_attributionButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy27FMMapSettingsViewController_verticalStackView));

  swift_release();
}

@end