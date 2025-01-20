@interface CHMindfulnessSessionListTableViewCell
- (CHMindfulnessSessionListTableViewCell)initWithCoder:(id)a3;
- (CHMindfulnessSessionListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)prepareForReuse;
@end

@implementation CHMindfulnessSessionListTableViewCell

- (CHMindfulnessSessionListTableViewCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    a4 = (id)static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v6 = v5;
  }
  else
  {
    uint64_t v6 = 0;
  }
  return (CHMindfulnessSessionListTableViewCell *)sub_100535168(a3, (uint64_t)a4, v6);
}

- (void)prepareForReuse
{
  v2 = self;
  sub_100537814();
}

- (CHMindfulnessSessionListTableViewCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_100537F74();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_mindfulnessSessionViewModel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_insetContentView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_gradientImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_labelStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_titleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_subtitleLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_dateLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_imageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_imageViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_gradientImageViewWidthConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_gradientImageViewHeightConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_labelStackViewLeadingConstraint));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_iconImageViewCenterXConstraint));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa
                + OBJC_IVAR___CHMindfulnessSessionListTableViewCell_iconImageViewLeadingConstraint);
}

@end