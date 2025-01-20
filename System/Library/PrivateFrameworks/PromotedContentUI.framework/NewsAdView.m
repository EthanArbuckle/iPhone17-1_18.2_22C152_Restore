@interface NewsAdView
@end

@implementation NewsAdView

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.super.super.super.isa
                     + OBJC_IVAR____TtC17PromotedContentUI10NewsAdView_newsAdView));
  sub_1B5D10F00((uint64_t)self + OBJC_IVAR____TtC17PromotedContentUI10NewsAdView_oldPercentageTimestamp);
  v3 = (char *)self + OBJC_IVAR____TtC17PromotedContentUI10NewsAdView_newPercentageTimestamp;
  sub_1B5D10F00((uint64_t)v3);
}

@end