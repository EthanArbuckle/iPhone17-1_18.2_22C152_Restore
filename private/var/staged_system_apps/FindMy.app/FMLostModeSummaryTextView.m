@interface FMLostModeSummaryTextView
- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5;
- (_TtC6FindMy25FMLostModeSummaryTextView)init;
- (_TtC6FindMy25FMLostModeSummaryTextView)initWithCoder:(id)a3;
- (void)textViewDidChange:(id)a3;
- (void)textViewDidChangeSelection:(id)a3;
@end

@implementation FMLostModeSummaryTextView

- (_TtC6FindMy25FMLostModeSummaryTextView)init
{
  return (_TtC6FindMy25FMLostModeSummaryTextView *)sub_1002E4778();
}

- (_TtC6FindMy25FMLostModeSummaryTextView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_1002E5FA4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_contentTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_placeholderTextView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_titleView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_lengthCounterView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_headerStackView));
  sub_100068760((uint64_t)self + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_delegate);
  uint64_t v3 = *(uint64_t *)((char *)&self->super.super.super.super.super.isa
                  + OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_validatorType);
  uint64_t v4 = *(void *)&self->super.platter[OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_validatorType];
  char v5 = self->super.footer[OBJC_IVAR____TtC6FindMy25FMLostModeSummaryTextView_validatorType];

  sub_10007F29C(v3, v4, v5);
}

- (void)textViewDidChange:(id)a3
{
  id v4 = a3;
  char v5 = self;
  sub_1002E60F4();
}

- (BOOL)textView:(id)a3 shouldChangeTextInRange:(_NSRange)a4 replacementText:(id)a5
{
  NSUInteger length = a4.length;
  NSUInteger location = a4.location;
  uint64_t v9 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = v10;
  id v12 = a3;
  v13 = self;
  LOBYTE(length) = sub_1002E5A20((uint64_t)v12, location, length, v9, v11);

  swift_bridgeObjectRelease();
  return length & 1;
}

- (void)textViewDidChangeSelection:(id)a3
{
  id v4 = a3;
  char v5 = self;
  sub_1002E6278();
}

@end