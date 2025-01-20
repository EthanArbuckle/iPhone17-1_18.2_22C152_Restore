@interface StateOfMindOverlayRoomViewController
+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11;
- (BOOL)supportsHealthFactors;
- (_TtC14MentalHealthUI36StateOfMindOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6;
- (_TtC14MentalHealthUI36StateOfMindOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 sleepChartFormatter:(id)a6 addDataViewControllerProvider:(id)a7 preferredOverlay:(int64_t)a8;
- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5;
- (id)controllerTitleWithApplicationItems:(id)a3;
- (id)createChartOverlayViewController;
- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5;
- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4;
- (id)primaryDisplayTypeWithApplicationItems:(id)a3;
- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4;
- (void)dismissAnimated:(id)a3;
- (void)viewDidLoad;
@end

@implementation StateOfMindOverlayRoomViewController

+ (id)createInteractiveChartViewControllerForTypeIdentifier:(id)a3 chartFactory:(id)a4 applicationItems:(id)a5 displayDate:(id)a6 preferredOverlay:(int64_t)a7 restorationUserActivity:(id)a8 trendModel:(id)a9 factorDisplayTypes:(id)a10 additionalChartOptions:(unint64_t)a11
{
  uint64_t v16 = (uint64_t)a10;
  sub_2560E91C4(0, (unint64_t *)&qword_269F44D30, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v17 - 8);
  v19 = (char *)&v28 - v18;
  if (a6)
  {
    sub_256175818();
    uint64_t v20 = sub_256175868();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v19, 0, 1, v20);
  }
  else
  {
    uint64_t v21 = sub_256175868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v21 - 8) + 56))(v19, 1, 1, v21);
  }
  if (a10)
  {
    sub_255FB58F8(0, (unint64_t *)&qword_269F46A00);
    uint64_t v16 = sub_256178008();
  }
  swift_getObjCClassMetadata();
  id v22 = a4;
  id v23 = a5;
  id v24 = a9;
  id v25 = a8;
  v26 = sub_2560E8C48(v22, v23, (uint64_t)v19, a7, (uint64_t)a8, v16, a11);

  swift_bridgeObjectRelease();
  sub_2560240C0((uint64_t)v19);

  return v26;
}

- (_TtC14MentalHealthUI36StateOfMindOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 sleepChartFormatter:(id)a6 addDataViewControllerProvider:(id)a7 preferredOverlay:(int64_t)a8
{
  sub_2560E91C4(0, (unint64_t *)&qword_269F44D30, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v14 - 8);
  uint64_t v16 = (char *)&v22 - v15;
  if (a3)
  {
    sub_256175818();
    uint64_t v17 = sub_256175868();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v16, 0, 1, v17);
  }
  else
  {
    uint64_t v18 = sub_256175868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v18 - 8) + 56))(v16, 1, 1, v18);
  }
  if (a5)
  {
    sub_255FB58F8(0, (unint64_t *)&qword_269F46A00);
    a5 = (id)sub_256178008();
  }
  id v19 = a4;
  id v20 = a6;
  swift_unknownObjectRetain();
  return (_TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *)StateOfMindOverlayRoomViewController.init(displayDate:applicationItems:factorDisplayTypes:sleepChartFormatter:addDataViewControllerProvider:preferredOverlay:)((uint64_t)v16, v19, (uint64_t)a5, v20, (uint64_t)a7, a8);
}

- (void)viewDidLoad
{
  v2 = self;
  sub_2560E2AE0();
}

- (id)controllerTitleWithApplicationItems:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2560E90D8(v4);

  v6 = (void *)sub_256177EA8();
  swift_bridgeObjectRelease();

  return v6;
}

- (id)primaryDisplayTypeWithApplicationItems:(id)a3
{
  return objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.super.super.super.super.isa
                                                 + OBJC_IVAR____TtC14MentalHealthUI36StateOfMindOverlayRoomViewController_stateOfMindInteractiveChartDisplayType));
}

- (id)createChartOverlayViewController
{
  v2 = self;
  id v3 = sub_2560E2DB8();

  return v3;
}

- (id)contextSectionContainersForMode:(int64_t)a3 applicationItems:(id)a4 overlayChartController:(id)a5
{
  if (a3 == 3)
  {
    id v7 = a4;
    id v8 = a5;
    v9 = self;
    sub_2560E36D8(v8);
  }
  sub_255FB58F8(0, &qword_269F46A98);
  v10 = (void *)sub_256177FF8();
  swift_bridgeObjectRelease();

  return v10;
}

- (id)initialSelectedContextForMode:(int64_t)a3 containerIndex:(int64_t)a4
{
  v6 = self;
  id v7 = sub_2560E34E0(a3, a4);

  return v7;
}

- (id)createViewControllerForMode:(int64_t)a3 displayDate:(id)a4 applicationItems:(id)a5
{
  sub_2560E91C4(0, (unint64_t *)&qword_269F44D30, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v6 - 8);
  id v8 = (char *)&v12 - v7;
  if (a4)
  {
    sub_256175818();
    uint64_t v9 = sub_256175868();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v8, 0, 1, v9);
  }
  else
  {
    uint64_t v10 = sub_256175868();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v8, 1, 1, v10);
  }
  sub_2560240C0((uint64_t)v8);

  return 0;
}

- (BOOL)supportsHealthFactors
{
  return 1;
}

- (void)contextView:(id)a3 didTapOnInfoButtonAtIndex:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = self;
  sub_2560E93DC(a4);
}

- (void)dismissAnimated:(id)a3
{
  if (a3)
  {
    id v4 = self;
    swift_unknownObjectRetain();
    sub_2561784B8();
    swift_unknownObjectRelease();
  }
  else
  {
    memset(v6, 0, sizeof(v6));
    v5 = self;
  }
  sub_2560E6128();

  sub_256040650((uint64_t)v6);
}

- (_TtC14MentalHealthUI36StateOfMindOverlayRoomViewController)initWithDisplayDate:(id)a3 applicationItems:(id)a4 factorDisplayTypes:(id)a5 mode:(int64_t)a6
{
  sub_2560E91C4(0, (unint64_t *)&qword_269F44D30, MEMORY[0x263F07490]);
  MEMORY[0x270FA5388](v8 - 8);
  uint64_t v10 = (char *)&v16 - v9;
  if (a3)
  {
    sub_256175818();
    uint64_t v11 = sub_256175868();
    uint64_t v13 = 0;
    uint64_t v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
  }
  else
  {
    uint64_t v11 = sub_256175868();
    uint64_t v12 = (void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56);
    uint64_t v13 = 1;
  }
  (*v12)(v10, v13, 1, v11);
  id v14 = a4;
  result = (_TtC14MentalHealthUI36StateOfMindOverlayRoomViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI36StateOfMindOverlayRoomViewController_sleepChartFormatter));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI36StateOfMindOverlayRoomViewController_preferredOverlayContextLocation));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC14MentalHealthUI36StateOfMindOverlayRoomViewController_stateOfMindInteractiveChartDisplayType));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtC14MentalHealthUI36StateOfMindOverlayRoomViewController_stateOfMindInteractiveChartDisplayTypeWithLegend);
}

@end