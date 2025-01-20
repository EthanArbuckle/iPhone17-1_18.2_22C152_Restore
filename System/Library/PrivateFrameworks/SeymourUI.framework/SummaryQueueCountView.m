@interface SummaryQueueCountView
- (CGSize)intrinsicContentSize;
- (_TtC9SeymourUI21SummaryQueueCountView)initWithCoder:(id)a3;
- (_TtC9SeymourUI21SummaryQueueCountView)initWithFrame:(CGRect)a3;
@end

@implementation SummaryQueueCountView

- (CGSize)intrinsicContentSize
{
  v2 = *(Class *)((char *)&self->super.super.super.isa + OBJC_IVAR____TtC9SeymourUI21SummaryQueueCountView_countLabel);
  v3 = self;
  objc_msgSend(v2, sel_frame);
  double Width = CGRectGetWidth(v11);
  if (qword_268A0C920 != -1) {
    swift_once();
  }
  double v5 = Width + *(double *)&qword_268A468E8 + *(double *)&qword_268A468F8;
  objc_msgSend(v2, sel_frame);
  CGFloat v6 = CGRectGetHeight(v12) + *(double *)&qword_268A468E0;
  double v7 = *(double *)&qword_268A468F0;

  double v8 = v6 + v7;
  double v9 = v5;
  result.height = v8;
  result.width = v9;
  return result;
}

- (_TtC9SeymourUI21SummaryQueueCountView)initWithFrame:(CGRect)a3
{
  return (_TtC9SeymourUI21SummaryQueueCountView *)sub_239EFC2FC(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC9SeymourUI21SummaryQueueCountView)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_239EFCA2C();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC9SeymourUI21SummaryQueueCountView_countLabel));
}

@end