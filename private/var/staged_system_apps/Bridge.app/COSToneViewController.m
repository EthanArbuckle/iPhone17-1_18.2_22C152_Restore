@interface COSToneViewController
- (COSToneViewController)initWithCoder:(id)a3;
- (COSToneViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4;
- (void)viewDidLoad;
@end

@implementation COSToneViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_100137DC0();
}

- (void)tonePickerViewController:(id)a3 selectedToneWithIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
  }
  else
  {
    uint64_t v6 = 0;
    uint64_t v8 = 0;
  }
  id v9 = a3;
  v10 = self;
  sub_1001389D4(a3, v6, v8);

  swift_bridgeObjectRelease();
}

- (COSToneViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    *(void *)&self->PSViewController_opaque[OBJC_IVAR___COSToneViewController_cancellables] = &_swiftEmptyArrayStorage;
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    *(void *)&self->PSViewController_opaque[OBJC_IVAR___COSToneViewController_cancellables] = &_swiftEmptyArrayStorage;
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for ToneViewController();
  id v9 = [(COSToneViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (COSToneViewController)initWithCoder:(id)a3
{
  *(void *)&self->PSViewController_opaque[OBJC_IVAR___COSToneViewController_cancellables] = &_swiftEmptyArrayStorage;
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for ToneViewController();
  return [(COSToneViewController *)&v5 initWithCoder:a3];
}

- (void).cxx_destruct
{
}

@end