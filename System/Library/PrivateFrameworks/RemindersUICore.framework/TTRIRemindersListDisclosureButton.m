@interface TTRIRemindersListDisclosureButton
- (CGRect)contentRectForBounds:(CGRect)a3;
- (_TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton)initWithCoder:(id)a3;
- (_TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton)initWithFrame:(CGRect)a3;
@end

@implementation TTRIRemindersListDisclosureButton

- (_TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton)initWithFrame:(CGRect)a3
{
  double height = a3.size.height;
  double width = a3.size.width;
  double y = a3.origin.y;
  double x = a3.origin.x;
  v12.receiver = self;
  v12.super_class = (Class)swift_getObjectType();
  v7 = -[TTRIExpandedHitTestButton initWithFrame:](&v12, sel_initWithFrame_, x, y, width, height);
  v8 = self;
  v9 = v7;
  id v10 = objc_msgSend(v8, sel_secondaryLabelColor);
  [(TTRIRemindersListDisclosureButton *)v9 setTintColor:v10];

  return v9;
}

- (_TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton)initWithCoder:(id)a3
{
  result = (_TtC15RemindersUICoreP33_4EB1E94F0FA08F88AB1C838BE39CB2DF33TTRIRemindersListDisclosureButton *)sub_1B99708A0();
  __break(1u);
  return result;
}

- (CGRect)contentRectForBounds:(CGRect)a3
{
  CGFloat height = a3.size.height;
  CGFloat width = a3.size.width;
  CGFloat y = a3.origin.y;
  CGFloat x = a3.origin.x;
  uint64_t v7 = qword_1EB9ACA00;
  v8 = self;
  if (v7 != -1) {
    swift_once();
  }
  CGSize v9 = (CGSize)xmmword_1EB9AC9F0;
  v19.origin.CGFloat x = x;
  v19.origin.CGFloat y = y;
  v19.size.CGFloat width = width;
  v19.size.CGFloat height = height;
  CGFloat v10 = CGRectGetMidX(v19) - v9.width * 0.5;
  v20.origin.CGFloat x = x;
  v20.origin.CGFloat y = y;
  v20.size.CGFloat width = width;
  v20.size.CGFloat height = height;
  v21.origin.CGFloat y = CGRectGetMidY(v20) - v9.height * 0.5;
  v21.origin.CGFloat x = v10;
  v21.size = v9;
  CGRect v22 = CGRectIntegral(v21);
  CGFloat v11 = v22.origin.x;
  CGFloat v12 = v22.origin.y;
  CGFloat v13 = v22.size.width;
  CGFloat v14 = v22.size.height;

  double v15 = v11;
  double v16 = v12;
  double v17 = v13;
  double v18 = v14;
  result.size.CGFloat height = v18;
  result.size.CGFloat width = v17;
  result.origin.CGFloat y = v16;
  result.origin.CGFloat x = v15;
  return result;
}

@end