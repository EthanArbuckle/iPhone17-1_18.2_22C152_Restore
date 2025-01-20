@interface GraphCanvasElementViewController
- (BOOL)_canShowWhileLocked;
- (_TtC8PaperKitP33_34A094740B6BACFE09E8AB9B5463AD5F32GraphCanvasElementViewController)initWithCoder:(id)a3;
- (_TtC8PaperKitP33_34A094740B6BACFE09E8AB9B5463AD5F32GraphCanvasElementViewController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation GraphCanvasElementViewController

- (_TtC8PaperKitP33_34A094740B6BACFE09E8AB9B5463AD5F32GraphCanvasElementViewController)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8PaperKitP33_34A094740B6BACFE09E8AB9B5463AD5F32GraphCanvasElementViewController_calculateGraph) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8PaperKitP33_34A094740B6BACFE09E8AB9B5463AD5F32GraphCanvasElementViewController_hostingController) = 0;
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8PaperKitP33_34A094740B6BACFE09E8AB9B5463AD5F32GraphCanvasElementViewController_graphView) = 0;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for GraphCanvasElementViewController();
  return [(GraphCanvasElementViewController *)&v5 initWithCoder:a3];
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (_TtC8PaperKitP33_34A094740B6BACFE09E8AB9B5463AD5F32GraphCanvasElementViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC8PaperKitP33_34A094740B6BACFE09E8AB9B5463AD5F32GraphCanvasElementViewController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8PaperKitP33_34A094740B6BACFE09E8AB9B5463AD5F32GraphCanvasElementViewController_hostingController));
  v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC8PaperKitP33_34A094740B6BACFE09E8AB9B5463AD5F32GraphCanvasElementViewController_graphView);
}

@end