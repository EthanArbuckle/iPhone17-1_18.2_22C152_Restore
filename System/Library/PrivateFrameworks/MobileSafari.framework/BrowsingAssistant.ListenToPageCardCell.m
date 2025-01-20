@interface BrowsingAssistant.ListenToPageCardCell
- (_TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell)initWithCoder:(id)a3;
- (_TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell)initWithFrame:(CGRect)a3;
- (void)playOrPause;
- (void)skipBackward;
- (void)skipForward;
@end

@implementation BrowsingAssistant.ListenToPageCardCell

- (_TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell *)sub_18C5E7790(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18C5EAC90();
}

- (void)playOrPause
{
  v2 = self;
  sub_18C5E9014();
}

- (void)skipBackward
{
}

- (void)skipForward
{
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell_speechRatePicker));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell_backButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell_playButton));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant20ListenToPageCardCell_forwardButton);
}

@end