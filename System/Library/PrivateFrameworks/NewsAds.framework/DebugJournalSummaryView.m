@interface DebugJournalSummaryView
- (_TtC7NewsAds23DebugJournalSummaryView)initWithCoder:(id)a3;
- (_TtC7NewsAds23DebugJournalSummaryView)initWithFrame:(CGRect)a3;
@end

@implementation DebugJournalSummaryView

- (_TtC7NewsAds23DebugJournalSummaryView)initWithFrame:(CGRect)a3
{
  return (_TtC7NewsAds23DebugJournalSummaryView *)DebugJournalSummaryView.init(frame:)(a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (_TtC7NewsAds23DebugJournalSummaryView)initWithCoder:(id)a3
{
  id v3 = a3;
  _s7NewsAds23DebugJournalSummaryViewC5coderACSgSo7NSCoderC_tcfc_0();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifierLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_placementIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifierLabel));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_contentIdentifier));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusLabel));

  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_statusIndicator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_moreDetailsButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapMoreDetails));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_buttonSeparator));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_reportIssueButton));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_onTapReportIssue));
  objc_release(*(id *)((char *)&self->super.super.super.isa
                     + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_topSeparator));
  id v3 = *(Class *)((char *)&self->super.super.super.isa
                + OBJC_IVAR____TtC7NewsAds23DebugJournalSummaryView_bottomSeparator);
}

@end