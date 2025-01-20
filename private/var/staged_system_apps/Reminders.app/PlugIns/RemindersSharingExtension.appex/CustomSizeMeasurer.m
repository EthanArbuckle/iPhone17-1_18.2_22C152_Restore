@interface CustomSizeMeasurer
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (_TtC25RemindersSharingExtensionP33_8326BBA138680702F00C183C494E669A18CustomSizeMeasurer)init;
@end

@implementation CustomSizeMeasurer

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  double v12 = sub_10000FDF0(v10, width, height);
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (_TtC25RemindersSharingExtensionP33_8326BBA138680702F00C183C494E669A18CustomSizeMeasurer)init
{
  CGSize result = (_TtC25RemindersSharingExtensionP33_8326BBA138680702F00C183C494E669A18CustomSizeMeasurer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end