@interface TintedTitleTrayButton
- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0621TintedTitleTrayButton)initWithCoder:(id)a3;
- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0621TintedTitleTrayButton)initWithFrame:(CGRect)a3;
- (void)tintColorDidChange;
@end

@implementation TintedTitleTrayButton

- (void)tintColorDidChange
{
  v2 = self;
  sub_1AD9BEB6C();
}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0621TintedTitleTrayButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for TintedTitleTrayButton();
  return -[TintedTitleTrayButton initWithFrame:](&v8, sel_initWithFrame_, x, y, width, height);
}

- (_TtC13SleepHealthUIP33_DA67F438C60AD14CEC2DB8E6F6E09D0621TintedTitleTrayButton)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for TintedTitleTrayButton();
  return [(TintedTitleTrayButton *)&v5 initWithCoder:a3];
}

@end