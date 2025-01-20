@interface PXMapOptionsChooseMapSheetController
- (PXMapOptionsChooseMapSheetController)init;
- (PXMapOptionsChooseMapSheetController)initWithCoder:(id)a3;
- (PXMapOptionsChooseMapSheetController)initWithNibName:(id)a3 bundle:(id)a4;
- (PXMapOptionsChooseMapViewDelegate)delegate;
- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4;
- (unint64_t)mapStyle;
- (void)handleCloseAction;
- (void)setDelegate:(id)a3;
- (void)setMapStyle:(unint64_t)a3;
- (void)viewDidLoad;
@end

@implementation PXMapOptionsChooseMapSheetController

- (PXMapOptionsChooseMapViewDelegate)delegate
{
  v2 = *(uint64_t (**)(void))((**(void **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR___PXMapOptionsChooseMapSheetController_contentViewController) & *MEMORY[0x1E4FBC8C8])
                           + 0xC8);
  v3 = self;
  v4 = (void *)v2();

  return (PXMapOptionsChooseMapViewDelegate *)v4;
}

- (void)setDelegate:(id)a3
{
  v5 = *(void (**)(id))((**(void **)((char *)&self->super.super.super.isa
                                                + OBJC_IVAR___PXMapOptionsChooseMapSheetController_contentViewController) & *MEMORY[0x1E4FBC8C8])
                                 + 0xD0);
  swift_unknownObjectRetain();
  v6 = self;
  v5(a3);
}

- (unint64_t)mapStyle
{
  v2 = *(uint64_t (**)(void))((**(void **)((char *)&self->super.super.super.isa
                                          + OBJC_IVAR___PXMapOptionsChooseMapSheetController_contentViewController) & *MEMORY[0x1E4FBC8C8])
                           + 0xE0);
  v3 = self;
  unint64_t v4 = v2();

  return v4;
}

- (void)setMapStyle:(unint64_t)a3
{
  unint64_t v4 = *(void (**)(unint64_t))((**(void **)((char *)&self->super.super.super.isa
                                                              + OBJC_IVAR___PXMapOptionsChooseMapSheetController_contentViewController) & *MEMORY[0x1E4FBC8C8])
                                               + 0xE8);
  v5 = self;
  v4(a3);
}

- (PXMapOptionsChooseMapSheetController)init
{
  return (PXMapOptionsChooseMapSheetController *)sub_1AA230AFC();
}

- (PXMapOptionsChooseMapSheetController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1AA231950();
}

- (void)viewDidLoad
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MapOptionsChooseMapSheetController();
  id v2 = v3.receiver;
  [(PXMapOptionsChooseMapSheetController *)&v3 viewDidLoad];
  sub_1AA230DD0();
  sub_1AA230F30();
}

- (void)handleCloseAction
{
  id v2 = *(uint64_t (**)(void))((*MEMORY[0x1E4FBC8C8] & (uint64_t)self->super.super.super.isa) + 0x70);
  v6 = self;
  if (v2())
  {
    uint64_t v4 = v3;
    uint64_t ObjectType = swift_getObjectType();
    (*(void (**)(PXMapOptionsChooseMapSheetController *, uint64_t, uint64_t))(v4 + 8))(v6, ObjectType, v4);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (PXMapOptionsChooseMapSheetController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (PXMapOptionsChooseMapSheetController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PXMapOptionsChooseMapSheetController_contentViewController));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PXMapOptionsChooseMapSheetController_blurredBackgroundView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR___PXMapOptionsChooseMapSheetController_closeButton));
  uint64_t v3 = (char *)self + OBJC_IVAR___PXMapOptionsChooseMapSheetController_controllerDelegate;
  sub_1A9D6D380((uint64_t)v3);
}

- (int64_t)adaptivePresentationStyleForPresentationController:(id)a3 traitCollection:(id)a4
{
  if (objc_msgSend(a4, sel_horizontalSizeClass, a3) == (id)1) {
    return -1;
  }
  else {
    return 2;
  }
}

@end