@interface RecentsListItemViewHelper
- (UIDateLabel)dateLabel;
- (UILabel)extraSubtitleLabel;
- (UILabel)occurrenceCountLabel;
- (UILabel)subtitleLabel;
- (UILabel)titleLabel;
- (void)didTapCallButtonWithSender:(id)a3;
- (void)didTapDetailAccessoryButtonWithSender:(id)a3;
- (void)updateForReducedTransparancy;
@end

@implementation RecentsListItemViewHelper

- (UILabel)titleLabel
{
  return (UILabel *)*(id *)self->titleLabel;
}

- (UILabel)subtitleLabel
{
  return (UILabel *)*(id *)self->subtitleLabel;
}

- (UILabel)extraSubtitleLabel
{
  return (UILabel *)*(id *)self->extraSubtitleLabel;
}

- (UIDateLabel)dateLabel
{
  return (UIDateLabel *)*(id *)self->dateLabel;
}

- (UILabel)occurrenceCountLabel
{
  return (UILabel *)*(id *)self->occurrenceCountLabel;
}

- (void)updateForReducedTransparancy
{
  swift_retain();
  sub_1C2F6AE34();
  swift_release();
}

- (void)didTapDetailAccessoryButtonWithSender:(id)a3
{
  v3 = (uint64_t (*)(uint64_t))*((void *)self->super.isa + 60);
  id v4 = a3;
  uint64_t v5 = swift_retain();
  v6 = (void (*)(void))v3(v5);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    v6();
    sub_1C2F645AC(v7);
  }

  swift_release();
}

- (void)didTapCallButtonWithSender:(id)a3
{
  v3 = (uint64_t (*)(uint64_t))*((void *)self->super.isa + 63);
  id v4 = a3;
  uint64_t v5 = swift_retain();
  v6 = (void (*)(void))v3(v5);
  if (v6)
  {
    uint64_t v7 = (uint64_t)v6;
    v6();
    sub_1C2F645AC(v7);
  }

  swift_release();
}

@end