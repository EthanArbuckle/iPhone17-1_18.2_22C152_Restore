@interface FigaroSummaryCell
- (_TtC5JSApp17FigaroSummaryCell)initWithCoder:(id)a3;
- (_TtC5JSApp17FigaroSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4;
- (void)layoutSubviews;
@end

@implementation FigaroSummaryCell

- (_TtC5JSApp17FigaroSummaryCell)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  if (a4)
  {
    uint64_t v4 = sub_86860();
  }
  else
  {
    uint64_t v4 = 0;
    uint64_t v5 = 0;
  }
  return (_TtC5JSApp17FigaroSummaryCell *)sub_80650(v4, v5);
}

- (void)layoutSubviews
{
  v2 = self;
  sub_7E8A0();
}

- (_TtC5JSApp17FigaroSummaryCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_809C0();
}

- (void).cxx_destruct
{
  swift_release();
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5JSApp17FigaroSummaryCell_iconImageView));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5JSApp17FigaroSummaryCell_eventNameLabel));
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC5JSApp17FigaroSummaryCell_pageTypeLabel));
  id v3 = *(Class *)((char *)&self->super.super.super.super.isa + OBJC_IVAR____TtC5JSApp17FigaroSummaryCell_pageIdLabel);
}

@end