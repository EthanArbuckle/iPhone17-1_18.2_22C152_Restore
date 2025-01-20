@interface TextToolListViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8PaperKit26TextToolListViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit26TextToolListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didTapAddGraphListItemView:(id)a3 forEvent:(id)a4;
- (void)didTapAddShapeListItemView:(id)a3 forEvent:(id)a4;
- (void)didTapAddSignatureListItemView:(id)a3 forEvent:(id)a4;
- (void)didTapAddStickerListItemView:(id)a3 forEvent:(id)a4;
- (void)didTapAddTextBoxListItemView:(id)a3 forEvent:(id)a4;
- (void)didTapAutoFillFormListItemView:(id)a3 forEvent:(id)a4;
- (void)didTapDescriptionListItemView:(id)a3 forEvent:(id)a4;
- (void)didTapOpacityListItemView:(id)a3 forEvent:(id)a4;
- (void)updatePreferredContentSize;
- (void)viewDidLoad;
@end

@implementation TextToolListViewController

- (_TtC8PaperKit26TextToolListViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    uint64_t v7 = 0;
  }
  id v8 = a4;
  return (_TtC8PaperKit26TextToolListViewController *)TextToolListViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (void)viewDidLoad
{
  v2 = self;
  TextToolListViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)updatePreferredContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_stackView);
  double v3 = *MEMORY[0x263F83810];
  double v4 = *(double *)(MEMORY[0x263F83810] + 8);
  uint64_t v6 = self;
  objc_msgSend(v2, sel_systemLayoutSizeFittingSize_, v3, v4);
  if (*(double *)((char *)&v6->super.super.super.isa
                 + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_minimumPreferredContentSizeWidth) > v5)
    double v5 = *(double *)((char *)&v6->super.super.super.isa
                   + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_minimumPreferredContentSizeWidth);
  [(TextToolListViewController *)v6 setPreferredContentSize:v5];
}

- (void)didTapAddTextBoxListItemView:(id)a3 forEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  [(TextToolListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  uint64_t v8 = MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_delegate);
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x210550400](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 64))(10, ObjectType, v10);

      swift_unknownObjectRelease();
    }
    else
    {
    }
    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)didTapAddSignatureListItemView:(id)a3 forEvent:(id)a4
{
}

- (void)didTapAutoFillFormListItemView:(id)a3 forEvent:(id)a4
{
  if (MEMORY[0x210550400]((char *)self + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_delegate, a2, a3, a4))
  {
    swift_unknownObjectRelease();
  }
}

- (void)didTapAddShapeListItemView:(id)a3 forEvent:(id)a4
{
}

- (void)didTapOpacityListItemView:(id)a3 forEvent:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  uint64_t v7 = self;
  [(TextToolListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  if (MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_delegate))
  {
    specialized ToolPickerController.textToolListViewController(_:didSelectOpacityWithEvent:)(v7);

    swift_unknownObjectRelease();
  }
  else
  {
  }
}

- (void)didTapDescriptionListItemView:(id)a3 forEvent:(id)a4
{
}

- (void)didTapAddStickerListItemView:(id)a3 forEvent:(id)a4
{
}

- (void)didTapAddGraphListItemView:(id)a3 forEvent:(id)a4
{
}

- (_TtC8PaperKit26TextToolListViewController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit26TextToolListViewController *)TextToolListViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_stackView));
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)self + OBJC_IVAR____TtC8PaperKit26TextToolListViewController_delegate);
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___addTextBoxListItemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___autoFillFormListItemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___addSignatureListItemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___addStickerListItemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___opacityListItemView));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___descriptionListItemView));
  double v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8PaperKit26TextToolListViewController____lazy_storage___addShapeListItemView);
}

@end