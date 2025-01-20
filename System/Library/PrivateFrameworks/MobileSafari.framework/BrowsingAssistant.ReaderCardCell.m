@interface BrowsingAssistant.ReaderCardCell
- (_TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell)initWithCoder:(id)a3;
- (_TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell)initWithFrame:(CGRect)a3;
- (void)listenToPage:(id)a3;
- (void)showReader:(id)a3;
- (void)updateTheme;
- (void)updateTitleLabel;
@end

@implementation BrowsingAssistant.ReaderCardCell

- (_TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell)initWithCoder:(id)a3
{
  id v3 = a3;
  sub_18C56AA30();
}

- (_TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell)initWithFrame:(CGRect)a3
{
  return (_TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell *)sub_18C567A84(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)updateTheme
{
  v2 = self;
  sub_18C5688E8();
}

- (void)updateTitleLabel
{
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_titleLabel);
  v6 = self;
  id v3 = [(BrowsingAssistant.ReaderCardCell *)v6 traitCollection];
  id v4 = objc_msgSend(v3, sel_preferredContentSizeCategory);

  LOBYTE(v3) = sub_18C6F9FD8();
  if (v3) {
    uint64_t v5 = 4;
  }
  else {
    uint64_t v5 = 2;
  }
  objc_msgSend(v2, sel_setNumberOfLines_, v5);
}

- (void)listenToPage:(id)a3
{
}

- (void)showReader:(id)a3
{
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_rootStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_titleLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_summaryView));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell____lazy_storage___disclaimerLabel));
  swift_bridgeObjectRelease();
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_buttonsStackView));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_listenToPageButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_showReaderButton));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_listenToPageAction));
  objc_release(*(id *)((char *)&self->super.super.super.super.super.isa
                     + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_showReaderAction));
  id v3 = *(Class *)((char *)&self->super.super.super.super.super.isa
                + OBJC_IVAR____TtCC12MobileSafari17BrowsingAssistant14ReaderCardCell_contextMenuInteraction);
}

@end