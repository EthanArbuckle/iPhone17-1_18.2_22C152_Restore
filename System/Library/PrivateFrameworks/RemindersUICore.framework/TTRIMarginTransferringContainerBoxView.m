@interface TTRIMarginTransferringContainerBoxView
- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3;
- (_TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView)initWithArrangedSubviews:(id)a3;
- (_TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView)initWithCoder:(id)a3;
- (_TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView)initWithFrame:(CGRect)a3;
- (void)layoutArrangedSubviewsInBounds:(CGRect)a3;
@end

@implementation TTRIMarginTransferringContainerBoxView

- (CGSize)calculateArrangedSizeFittingSize:(CGSize)a3
{
  double v3 = sub_1B9395DCC(self, a3.width, a3.height, (uint64_t)a2, (void (*)(void))sub_1B93958AC, (uint64_t (*)(uint64_t))type metadata accessor for TTRIMarginTransferringContainerBoxView);
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutArrangedSubviewsInBounds:(CGRect)a3
{
}

- (_TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView)initWithFrame:(CGRect)a3
{
  return (_TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView *)sub_1B93961E0((char *)self, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, (uint64_t)a2, &OBJC_IVAR____TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView____lazy_storage___marginTransferHelper, type metadata accessor for TTRIMarginTransferringContainerBoxView);
}

- (_TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView)initWithArrangedSubviews:(id)a3
{
  return (_TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView *)sub_1B93963AC((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR____TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView____lazy_storage___marginTransferHelper, (uint64_t (*)(uint64_t))type metadata accessor for TTRIMarginTransferringContainerBoxView);
}

- (_TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView)initWithCoder:(id)a3
{
  return (_TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView *)sub_1B9396500((char *)self, (uint64_t)a2, (uint64_t)a3, &OBJC_IVAR____TtC15RemindersUICore38TTRIMarginTransferringContainerBoxView____lazy_storage___marginTransferHelper, type metadata accessor for TTRIMarginTransferringContainerBoxView);
}

- (void).cxx_destruct
{
}

@end