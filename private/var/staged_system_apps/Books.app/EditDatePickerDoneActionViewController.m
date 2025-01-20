@interface EditDatePickerDoneActionViewController
- (_TtC5Books38EditDatePickerDoneActionViewController)initWithCoder:(id)a3;
- (_TtC5Books38EditDatePickerDoneActionViewController)initWithNibName:(id)a3 bundle:(id)a4;
- (void)loadView;
@end

@implementation EditDatePickerDoneActionViewController

- (void)loadView
{
  v2 = self;
  sub_1003D0954();
}

- (_TtC5Books38EditDatePickerDoneActionViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    sub_1007FDC70();
    id v6 = a4;
    NSString v7 = sub_1007FDC30();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for EditDatePickerDoneActionViewController();
  v9 = [(EditDatePickerDoneActionViewController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC5Books38EditDatePickerDoneActionViewController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for EditDatePickerDoneActionViewController();
  return [(EditDatePickerDoneActionViewController *)&v5 initWithCoder:a3];
}

@end