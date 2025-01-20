@interface TTRIStaticTableViewDisclosureTextAccessoryProvider
- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5;
- (_TtC15RemindersUICore50TTRIStaticTableViewDisclosureTextAccessoryProvider)init;
- (void)containerViewDidLayoutArrangedSubviews:(id)a3;
@end

@implementation TTRIStaticTableViewDisclosureTextAccessoryProvider

- (_TtC15RemindersUICore50TTRIStaticTableViewDisclosureTextAccessoryProvider)init
{
  result = (_TtC15RemindersUICore50TTRIStaticTableViewDisclosureTextAccessoryProvider *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1B90D88A0((uint64_t)self + OBJC_IVAR____TtC15RemindersUICore50TTRIStaticTableViewDisclosureTextAccessoryProvider_delegate);
  v3 = *(void **)&self->text[OBJC_IVAR____TtC15RemindersUICore50TTRIStaticTableViewDisclosureTextAccessoryProvider_text
                           + 8];
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC15RemindersUICore50TTRIStaticTableViewDisclosureTextAccessoryProvider_label));

  swift_release();
}

- (CGSize)containerView:(id)a3 systemLayoutSizeFittingSize:(CGSize)a4 forArrangedSubview:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  v9 = self;
  sub_1B922E1A0(v8);
  double v11 = v10;
  double v13 = v12;

  double v14 = v11;
  double v15 = v13;
  result.height = v15;
  result.width = v14;
  return result;
}

- (void)containerViewDidLayoutArrangedSubviews:(id)a3
{
  id v4 = a3;
  v5 = self;
  TTRIStaticTableViewDisclosureTextAccessoryProvider.updateTextBasedOnLabelWidth()();
}

@end