@interface RTFEditingViewController
- (_TtC7JournalP33_52B12D7015364A2A97B4965365E27BCB24RTFEditingViewController)initWithCoder:(id)a3;
- (_TtC7JournalP33_52B12D7015364A2A97B4965365E27BCB24RTFEditingViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)showRTFSheet;
- (void)viewDidLoad;
@end

@implementation RTFEditingViewController

- (void)viewDidLoad
{
  v2 = self;
  sub_1002235F8();
}

- (void)showRTFSheet
{
  v2 = (void *)swift_dynamicCastObjCProtocolConditional();
  if (v2) {
    [v2 _showTextFormattingOptions:0];
  }
}

- (_TtC7JournalP33_52B12D7015364A2A97B4965365E27BCB24RTFEditingViewController)initWithNibName:(id)a3 bundle:(id)a4
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
  return (_TtC7JournalP33_52B12D7015364A2A97B4965365E27BCB24RTFEditingViewController *)sub_1002238CC(v5, v7, a4);
}

- (_TtC7JournalP33_52B12D7015364A2A97B4965365E27BCB24RTFEditingViewController)initWithCoder:(id)a3
{
  uint64_t v5 = OBJC_IVAR____TtC7JournalP33_52B12D7015364A2A97B4965365E27BCB24RTFEditingViewController_cleanTextView;
  type metadata accessor for CleanRTFTextView();
  id v6 = objc_allocWithZone((Class)swift_getObjCClassFromMetadata());
  id v7 = a3;
  id v8 = self;
  *(Class *)((char *)&self->super.super.super.isa + v5) = (Class)[v6 init];

  v11.receiver = v8;
  v11.super_class = (Class)type metadata accessor for RTFEditingViewController();
  v9 = [(RTFEditingViewController *)&v11 initWithCoder:v7];

  return v9;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7JournalP33_52B12D7015364A2A97B4965365E27BCB24RTFEditingViewController_cleanTextView));
}

@end