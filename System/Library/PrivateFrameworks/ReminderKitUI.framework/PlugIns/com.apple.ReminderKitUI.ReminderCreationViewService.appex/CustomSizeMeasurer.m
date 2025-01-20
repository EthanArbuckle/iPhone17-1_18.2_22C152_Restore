@interface CustomSizeMeasurer
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (_TtC51com_apple_ReminderKitUI_ReminderCreationViewServiceP33_D29EB792D2B5D2C81136FF4F45BEA45D18CustomSizeMeasurer)init;
@end

@implementation CustomSizeMeasurer

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  double height = a4.height;
  double width = a4.width;
  id v9 = a3;
  id v10 = a5;
  v11 = self;
  double v12 = sub_10000E754(v10, width, height);
  double v14 = v13;

  double v15 = v12;
  double v16 = v14;
  result.double height = v16;
  result.double width = v15;
  return result;
}

- (_TtC51com_apple_ReminderKitUI_ReminderCreationViewServiceP33_D29EB792D2B5D2C81136FF4F45BEA45D18CustomSizeMeasurer)init
{
  CGSize result = (_TtC51com_apple_ReminderKitUI_ReminderCreationViewServiceP33_D29EB792D2B5D2C81136FF4F45BEA45D18CustomSizeMeasurer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end