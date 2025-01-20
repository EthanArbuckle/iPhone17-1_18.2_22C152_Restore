@interface PickerView.PickerButton
- (CGPoint)menuAttachmentPointForConfiguration:(id)a3;
- (NSString)accessibilityLabel;
- (NSString)accessibilityValue;
- (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton)init;
- (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton)initWithCoder:(id)a3;
- (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton)initWithFrame:(CGRect)a3;
@end

@implementation PickerView.PickerButton

- (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton)initWithCoder:(id)a3
{
  result = (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton *)sub_258D6FE78();
  __break(1u);
  return result;
}

- (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton)init
{
  return (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton *)sub_258BF2DCC();
}

- (CGPoint)menuAttachmentPointForConfiguration:(id)a3
{
  v5 = (objc_class *)type metadata accessor for PickerView.PickerButton();
  v14.receiver = self;
  v14.super_class = v5;
  id v6 = a3;
  v7 = self;
  [(PickerView.PickerButton *)&v14 menuAttachmentPointForConfiguration:v6];
  double v9 = v8;
  v13.receiver = v7;
  v13.super_class = v5;
  [(PickerView.PickerButton *)&v13 frame];
  CGFloat MaxX = CGRectGetMaxX(v16);

  double v11 = MaxX;
  double v12 = v9;
  result.y = v12;
  result.x = v11;
  return result;
}

- (NSString)accessibilityLabel
{
  uint64_t v3 = sub_258D6B958();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x270FA5388](v3);
  id v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = self;
  sub_258D6B948();
  sub_258D6B938();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);

  double v8 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return (NSString *)v8;
}

- (NSString)accessibilityValue
{
  v2 = self;
  id v3 = [(PickerView.PickerButton *)v2 titleLabel];
  if (v3 && (uint64_t v4 = v3, v5 = objc_msgSend(v3, sel_text), v4, v5))
  {
    sub_258D6F498();
  }
  else
  {
  }
  id v6 = (void *)sub_258D6F458();
  swift_bridgeObjectRelease();

  return (NSString *)v6;
}

- (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton)initWithFrame:(CGRect)a3
{
  CGPoint result = (_TtCV17PasswordManagerUIP33_8E851724D6AC9CB982E7B82E4755373C10PickerView12PickerButton *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end