@interface BrowsingAssistant.ConsentCardCell
- (_TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell)initWithCoder:(id)a3;
- (_TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell)initWithFrame:(CGRect)a3;
@end

@implementation BrowsingAssistant.ConsentCardCell

- (_TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18C6F2EE0();
}

- (_TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell *)sub_18C6F1608(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_notNowButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_continueButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_learnMoreButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_notNowAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_continueAction));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant15ConsentCardCell_learnMoreAction);
}

@end