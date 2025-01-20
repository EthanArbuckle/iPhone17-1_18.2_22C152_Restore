@interface SubmitButtonContainer
- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4;
- (_TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer)initWithCoder:(id)a3;
- (_TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer)initWithFrame:(CGRect)a3;
- (void)layoutSubviews;
@end

@implementation SubmitButtonContainer

- (_TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer)initWithFrame:(CGRect)a3
{
  return (_TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer *)sub_1007472F0(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer)initWithCoder:(id)a3
{
  *(Class *)((char *)&self->super.super.super.isa
           + OBJC_IVAR____TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer_submitButton) = 0;
  id v4 = a3;

  result = (_TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (JUMeasurements)measurementsWithFitting:(CGSize)a3 in:(id)a4
{
  swift_unknownObjectRetain();
  v5 = self;
  double v6 = sub_10074A49C();
  double v8 = v7;
  double v10 = v9;
  double v12 = v11;
  swift_unknownObjectRelease();

  double v13 = v6;
  double v14 = v8;
  double v15 = v10;
  double v16 = v12;
  result.var3 = v16;
  result.var2 = v15;
  result.var1 = v14;
  result.var0 = v13;
  return result;
}

- (void)layoutSubviews
{
  v2 = self;
  sub_100747538();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC8AppStoreP33_5C0EFAE2C001F32C54795036AF9AFFE421SubmitButtonContainer_submitButton));
}

@end