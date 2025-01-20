@interface ComposeButton
- (_TtC7JournalP33_08145CDDEA6A92DF1A40BD81AC9894B713ComposeButton)initWithCoder:(id)a3;
- (_TtC7JournalP33_08145CDDEA6A92DF1A40BD81AC9894B713ComposeButton)initWithFrame:(CGRect)a3;
@end

@implementation ComposeButton

- (_TtC7JournalP33_08145CDDEA6A92DF1A40BD81AC9894B713ComposeButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v7 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7JournalP33_08145CDDEA6A92DF1A40BD81AC9894B713ComposeButton_buttonTapped);
  void *v7 = AudioRecordingActivityState.hash(into:);
  v7[1] = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ComposeButton();
  v8 = -[ComposeButton initWithFrame:](&v10, "initWithFrame:", x, y, width, height);
  sub_10002D04C();

  return v8;
}

- (_TtC7JournalP33_08145CDDEA6A92DF1A40BD81AC9894B713ComposeButton)initWithCoder:(id)a3
{
  v4 = (Class *)((char *)&self->super.super.super.super.super.isa
               + OBJC_IVAR____TtC7JournalP33_08145CDDEA6A92DF1A40BD81AC9894B713ComposeButton_buttonTapped);
  void *v4 = AudioRecordingActivityState.hash(into:);
  v4[1] = 0;
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for ComposeButton();
  id v5 = a3;
  v6 = [(ComposeButton *)&v10 initWithCoder:v5];
  v7 = v6;
  if (v6)
  {
    v8 = v6;
    sub_10002D04C();
  }
  return v7;
}

- (void).cxx_destruct
{
}

@end