@interface ShapeListViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8PaperKit23ShapeListViewController)initWithCoder:(id)a3;
- (_TtC8PaperKit23ShapeListViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)didSelectAddArrow:(id)a3 withEvent:(id)a4;
- (void)didSelectAddArrowShape:(id)a3 withEvent:(id)a4;
- (void)didSelectAddChatBubble:(id)a3 withEvent:(id)a4;
- (void)didSelectAddLine:(id)a3 withEvent:(id)a4;
- (void)didSelectAddOval:(id)a3 withEvent:(id)a4;
- (void)didSelectAddPolygon:(id)a3 withEvent:(id)a4;
- (void)didSelectAddRectangle:(id)a3 withEvent:(id)a4;
- (void)didSelectAddRoundedRect:(id)a3 withEvent:(id)a4;
- (void)didSelectAddStar:(id)a3 withEvent:(id)a4;
- (void)didSelectAddTriangle:(id)a3 withEvent:(id)a4;
- (void)viewDidLoad;
@end

@implementation ShapeListViewController

- (void)viewDidLoad
{
  v2 = self;
  ShapeListViewController.viewDidLoad()();
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)didSelectAddRectangle:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  [(ShapeListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  uint64_t v8 = MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x210550400](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(void, uint64_t, uint64_t))(v10 + 64))(0, ObjectType, v10);

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

- (void)didSelectAddOval:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  [(ShapeListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  uint64_t v8 = MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x210550400](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 64))(1, ObjectType, v10);

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

- (void)didSelectAddTriangle:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  [(ShapeListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  uint64_t v8 = MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x210550400](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 64))(2, ObjectType, v10);

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

- (void)didSelectAddLine:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  [(ShapeListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  uint64_t v8 = MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x210550400](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 64))(3, ObjectType, v10);

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

- (void)didSelectAddChatBubble:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  [(ShapeListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  uint64_t v8 = MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x210550400](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 64))(4, ObjectType, v10);

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

- (void)didSelectAddRoundedRect:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  [(ShapeListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  uint64_t v8 = MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x210550400](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 64))(5, ObjectType, v10);

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

- (void)didSelectAddPolygon:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  [(ShapeListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  uint64_t v8 = MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x210550400](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 64))(6, ObjectType, v10);

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

- (void)didSelectAddStar:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  [(ShapeListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  uint64_t v8 = MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x210550400](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 64))(7, ObjectType, v10);

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

- (void)didSelectAddArrow:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  [(ShapeListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  uint64_t v8 = MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x210550400](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 64))(8, ObjectType, v10);

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

- (void)didSelectAddArrowShape:(id)a3 withEvent:(id)a4
{
  id v12 = a3;
  id v6 = a4;
  v7 = self;
  [(ShapeListViewController *)v7 dismissViewControllerAnimated:1 completion:0];
  uint64_t v8 = MEMORY[0x210550400]((char *)v7 + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate);
  if (v8)
  {
    uint64_t v9 = v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate;
    if (MEMORY[0x210550400](v8 + OBJC_IVAR____TtC8PaperKit20ToolPickerController_delegate))
    {
      uint64_t v10 = *(void *)(v9 + 8);
      uint64_t ObjectType = swift_getObjectType();
      (*(void (**)(uint64_t, uint64_t, uint64_t))(v10 + 64))(9, ObjectType, v10);

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

- (_TtC8PaperKit23ShapeListViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC8PaperKit23ShapeListViewController *)ShapeListViewController.init(nibName:bundle:)(v5, v7, a4);
}

- (_TtC8PaperKit23ShapeListViewController)initWithCoder:(id)a3
{
  return (_TtC8PaperKit23ShapeListViewController *)ShapeListViewController.init(coder:)(a3);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_stackView));
  swift_bridgeObjectRelease();
  v3 = (char *)self + OBJC_IVAR____TtC8PaperKit23ShapeListViewController_delegate;
  outlined destroy of weak AnyContainerCanvasElementView?((uint64_t)v3);
}

@end