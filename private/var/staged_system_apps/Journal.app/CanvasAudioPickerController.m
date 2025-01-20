@interface CanvasAudioPickerController
- (_TtC7Journal27CanvasAudioPickerController)initWithCoder:(id)a3;
- (_TtC7Journal27CanvasAudioPickerController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)audioRecorderDidFinishRecording:(id)a3 successfully:(BOOL)a4;
- (void)dealloc;
- (void)onAudioRecordingCancelNotificationReceived;
- (void)recordButtonTapped;
- (void)viewDidDisappear:(BOOL)a3;
- (void)viewDidLoad;
- (void)viewWillAppear:(BOOL)a3;
@end

@implementation CanvasAudioPickerController

- (void)viewDidLoad
{
  v2 = self;
  sub_10019D270();
}

- (void)viewDidDisappear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CanvasAudioPickerController();
  id v4 = v6.receiver;
  [(CanvasAudioPickerController *)&v6 viewDidDisappear:v3];
  sub_10019ECE0();
  id v5 = [self defaultCenter];
  if (qword_1007F6EA0 != -1) {
    swift_once();
  }
  [v5 removeObserver:v4 name:qword_10083D428 object:0];
}

- (void)viewWillAppear:(BOOL)a3
{
  BOOL v3 = a3;
  v6.receiver = self;
  v6.super_class = (Class)type metadata accessor for CanvasAudioPickerController();
  id v4 = v6.receiver;
  [(CanvasAudioPickerController *)&v6 viewWillAppear:v3];
  id v5 = [self defaultCenter];
  if (qword_1007F6EA0 != -1) {
    swift_once();
  }
  [v5 addObserver:v4 selector:"onAudioRecordingCancelNotificationReceived" name:qword_10083D428 object:0];
}

- (void)dealloc
{
  BOOL v3 = self;
  id v4 = self;
  id v5 = [v3 defaultCenter];
  uint64_t v6 = qword_1007F6EA0;
  v7 = v4;
  if (v6 != -1) {
    swift_once();
  }
  [v5 removeObserver:v7 name:qword_10083D428 object:0];

  v8.receiver = v7;
  v8.super_class = (Class)type metadata accessor for CanvasAudioPickerController();
  [(CanvasAudioPickerController *)&v8 dealloc];
}

- (void).cxx_destruct
{
  sub_1000109BC((uint64_t)self + OBJC_IVAR____TtC7Journal27CanvasAudioPickerController_pickerDelegate);
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal27CanvasAudioPickerController_audioManager));
  swift_release();
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal27CanvasAudioPickerController_recordButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal27CanvasAudioPickerController_tapLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal27CanvasAudioPickerController_pulses1));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7Journal27CanvasAudioPickerController_pulses2));
  BOOL v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7Journal27CanvasAudioPickerController_placeholderAsset);
}

- (void)recordButtonTapped
{
  v2 = self;
  sub_10019E91C();
}

- (void)onAudioRecordingCancelNotificationReceived
{
  v2 = self;
  sub_10019ECE0();
  *((unsigned char *)&v2->super.super.super.isa + OBJC_IVAR____TtC7Journal27CanvasAudioPickerController_didFinishRecording) = 0;
}

- (_TtC7Journal27CanvasAudioPickerController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC7Journal27CanvasAudioPickerController *)sub_10019FED0(v5, v7, a4);
}

- (_TtC7Journal27CanvasAudioPickerController)initWithCoder:(id)a3
{
  return (_TtC7Journal27CanvasAudioPickerController *)sub_1001A01BC(a3);
}

- (void)audioRecorderDidFinishRecording:(id)a3 successfully:(BOOL)a4
{
  uint64_t v5 = (_TtC7Journal27CanvasAudioPickerController *)a3;
  id v8 = self;
  sub_10019EE90(0);
  if ((*((unsigned char *)&v8->super.super.super.isa + OBJC_IVAR____TtC7Journal27CanvasAudioPickerController_didFinishRecording) & 1) == 0)
  {
    uint64_t v6 = *(Class *)((char *)&v8->super.super.super.isa
                  + OBJC_IVAR____TtC7Journal27CanvasAudioPickerController_audioManager);
    if (v6)
    {
      uint64_t v7 = v6;
      sub_1003A72C8();

      uint64_t v5 = v8;
      id v8 = v7;
    }
  }
}

@end