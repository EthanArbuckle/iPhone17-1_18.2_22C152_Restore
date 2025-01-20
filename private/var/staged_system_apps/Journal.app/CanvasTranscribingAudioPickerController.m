@interface CanvasTranscribingAudioPickerController
- (_TtC7Journal39CanvasTranscribingAudioPickerController)initWithCoder:(id)a3;
- (_TtC7Journal39CanvasTranscribingAudioPickerController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewIsAppearing:(BOOL)a3;
- (void)viewWillAppear:(BOOL)a3;
- (void)viewWillLayoutSubviews;
@end

@implementation CanvasTranscribingAudioPickerController

- (_TtC7Journal39CanvasTranscribingAudioPickerController)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_10031725C();
}

- (void)viewDidLoad
{
  v2 = self;
  sub_100313AB0();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CanvasTranscribingAudioPickerController();
  v4 = (char *)v6.receiver;
  [(CanvasTranscribingAudioPickerController *)&v6 viewDidDisappear:v3];
  uint64_t v5 = OBJC_IVAR____TtC7Journal39CanvasTranscribingAudioPickerController_notificationsTask;
  if (*(void *)&v4[OBJC_IVAR____TtC7Journal39CanvasTranscribingAudioPickerController_notificationsTask])
  {
    swift_retain();
    Task.cancel()();
    swift_release();
  }
  *(void *)&v4[v5] = 0;

  swift_release();
}

- (void)viewWillAppear:(BOOL)a3
{
  v4 = self;
  sub_100313D10(a3);
}

- (void)viewIsAppearing:(BOOL)a3
{
  v4 = self;
  sub_100313EBC(a3);
}

- (void)viewWillLayoutSubviews
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CanvasTranscribingAudioPickerController();
  id v2 = v3.receiver;
  [(CanvasTranscribingAudioPickerController *)&v3 viewWillLayoutSubviews];
  sub_1003155B4();
}

- (_TtC7Journal39CanvasTranscribingAudioPickerController)initWithNibName:(id)a3 bundle:(id)a4
{
  id v4 = a4;
  result = (_TtC7Journal39CanvasTranscribingAudioPickerController *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal39CanvasTranscribingAudioPickerController_asset));
  objc_super v3 = (char *)self + OBJC_IVAR____TtC7Journal39CanvasTranscribingAudioPickerController_logger;
  uint64_t v4 = type metadata accessor for Logger();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal39CanvasTranscribingAudioPickerController____lazy_storage___fullScreenHostingViewController));
  uint64_t v5 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal39CanvasTranscribingAudioPickerController____lazy_storage___journalAssetView);
}

@end