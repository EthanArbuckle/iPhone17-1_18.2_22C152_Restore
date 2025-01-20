@interface SectionHeaderView
- (SectionHeaderView)initWithCoder:(id)a3;
- (SectionHeaderView)initWithFrame:(CGRect)a3;
@end

@implementation SectionHeaderView

- (SectionHeaderView)initWithFrame:(CGRect)a3
{
  return (SectionHeaderView *)sub_10002C08C();
}

- (SectionHeaderView)initWithCoder:(id)a3
{
  id v3 = a3;
  return (SectionHeaderView *)sub_1000AB8C4(v3, v4, (uint64_t (*)(uint64_t))_s17SectionHeaderViewCMa);
}

@end