@interface TSFeedViewContext
- (BOOL)showSubscribedAlert;
- (NSNumber)displayRank;
- (NSNumber)externalAnalyticsFeedReferrer;
- (NSNumber)feedPickerSection;
- (NSNumber)feedPickerType;
- (NSNumber)maximumAdRequestsForCurrentAdPreviewID;
- (NSNumber)presentationReason;
- (NSNumber)previousArticleVersion;
- (NSString)adPreviewID;
- (NSString)adPreviewSessionID;
- (NSString)adQToken;
- (NSString)previousArticleID;
- (NSString)sourceApplication;
- (NSString)sourceSearchText;
- (NSString)tagName;
- (NSString)title;
- (NSString)userActivityType;
- (NSURL)sourceURL;
- (TSAnalyticsReferral)referral;
- (TSFeedViewContext)init;
- (void)setAdPreviewID:(id)a3;
- (void)setAdPreviewSessionID:(id)a3;
- (void)setAdQToken:(id)a3;
- (void)setDisplayRank:(id)a3;
- (void)setExternalAnalyticsFeedReferrer:(id)a3;
- (void)setFeedPickerSection:(id)a3;
- (void)setFeedPickerType:(id)a3;
- (void)setFeedTagType:(unint64_t)a3;
- (void)setMaximumAdRequestsForCurrentAdPreviewID:(id)a3;
- (void)setPresentationReason:(id)a3;
- (void)setPreviousArticleID:(id)a3;
- (void)setPreviousArticleVersion:(id)a3;
- (void)setReferral:(id)a3;
- (void)setShowSubscribedAlert:(BOOL)a3;
- (void)setSourceApplication:(id)a3;
- (void)setSourceSearchText:(id)a3;
- (void)setSourceURL:(id)a3;
- (void)setTagName:(id)a3;
- (void)setTitle:(id)a3;
- (void)setUserActivityType:(id)a3;
- (void)setWithAdPreviewID:(id)a3;
- (void)setWithAdPreviewSessionID:(id)a3;
- (void)setWithAdQToken:(id)a3;
- (void)setWithDisplayRank:(int64_t)a3;
- (void)setWithExternalAnalyticsFeedReferrer:(int64_t)a3;
- (void)setWithFeedPickerSection:(int)a3;
- (void)setWithFeedPickerType:(int)a3;
- (void)setWithMaximumAdRequestsForCurrentAdPreviewID:(int64_t)a3;
- (void)setWithPresentationReason:(int)a3;
- (void)setWithPreviousArticleID:(id)a3;
- (void)setWithPreviousArticleVersion:(int64_t)a3;
- (void)setWithReferral:(id)a3;
- (void)setWithSourceApplication:(id)a3;
- (void)setWithSourceSearchText:(id)a3;
- (void)setWithSourceURL:(id)a3;
- (void)setWithUserActivityType:(id)a3;
@end

@implementation TSFeedViewContext

- (NSNumber)presentationReason
{
  return (NSNumber *)sub_1DF832898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_presentationReason);
}

- (void)setPresentationReason:(id)a3
{
}

- (NSNumber)feedPickerSection
{
  return (NSNumber *)sub_1DF832898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_feedPickerSection);
}

- (void)setFeedPickerSection:(id)a3
{
}

- (NSNumber)feedPickerType
{
  return (NSNumber *)sub_1DF832898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_feedPickerType);
}

- (void)setFeedPickerType:(id)a3
{
}

- (NSNumber)displayRank
{
  return (NSNumber *)sub_1DF832898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_displayRank);
}

- (void)setDisplayRank:(id)a3
{
}

- (NSNumber)externalAnalyticsFeedReferrer
{
  return (NSNumber *)sub_1DF832898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_externalAnalyticsFeedReferrer);
}

- (void)setExternalAnalyticsFeedReferrer:(id)a3
{
}

- (NSString)previousArticleID
{
  return (NSString *)sub_1DF1AFCDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_previousArticleID);
}

- (void)setPreviousArticleID:(id)a3
{
}

- (NSNumber)previousArticleVersion
{
  return (NSNumber *)sub_1DF832898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_previousArticleVersion);
}

- (void)setPreviousArticleVersion:(id)a3
{
}

- (BOOL)showSubscribedAlert
{
  v2 = (BOOL *)self + OBJC_IVAR___TSFeedViewContext_showSubscribedAlert;
  swift_beginAccess();
  return *v2;
}

- (void)setShowSubscribedAlert:(BOOL)a3
{
  v4 = (BOOL *)self + OBJC_IVAR___TSFeedViewContext_showSubscribedAlert;
  swift_beginAccess();
  BOOL *v4 = a3;
}

- (TSAnalyticsReferral)referral
{
  return (TSAnalyticsReferral *)sub_1DF832898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_referral);
}

- (void)setReferral:(id)a3
{
}

- (NSURL)sourceURL
{
  sub_1DEA3C638();
  MEMORY[0x1F4188790](v3 - 8);
  v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  v6 = (char *)self + OBJC_IVAR___TSFeedViewContext_sourceURL;
  swift_beginAccess();
  sub_1DEAEAE20((uint64_t)v6, (uint64_t)v5);
  uint64_t v7 = sub_1DFDE7220();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1DFDE7130();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSURL *)v9;
}

- (void)setSourceURL:(id)a3
{
  sub_1DEA3C638();
  MEMORY[0x1F4188790](v5 - 8);
  uint64_t v7 = (char *)&v12 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_1DFDE7190();
    uint64_t v8 = sub_1DFDE7220();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v7, 0, 1, v8);
  }
  else
  {
    uint64_t v9 = sub_1DFDE7220();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v9 - 8) + 56))(v7, 1, 1, v9);
  }
  v10 = (char *)self + OBJC_IVAR___TSFeedViewContext_sourceURL;
  swift_beginAccess();
  uint64_t v11 = self;
  sub_1DF1B03D0((uint64_t)v7, (uint64_t)v10);
  swift_endAccess();
}

- (NSString)title
{
  return (NSString *)sub_1DF1AFCDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_title);
}

- (void)setTitle:(id)a3
{
}

- (NSString)tagName
{
  return (NSString *)sub_1DF1AFCDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_tagName);
}

- (void)setTagName:(id)a3
{
}

- (NSString)sourceApplication
{
  return (NSString *)sub_1DF1AFCDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_sourceApplication);
}

- (void)setSourceApplication:(id)a3
{
}

- (NSString)userActivityType
{
  return (NSString *)sub_1DF1AFCDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_userActivityType);
}

- (void)setUserActivityType:(id)a3
{
}

- (NSString)sourceSearchText
{
  return (NSString *)sub_1DF1AFCDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_sourceSearchText);
}

- (void)setSourceSearchText:(id)a3
{
}

- (NSString)adPreviewID
{
  return (NSString *)sub_1DF1AFCDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_adPreviewID);
}

- (void)setAdPreviewID:(id)a3
{
}

- (NSString)adPreviewSessionID
{
  return (NSString *)sub_1DF1AFCDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_adPreviewSessionID);
}

- (void)setAdPreviewSessionID:(id)a3
{
}

- (NSString)adQToken
{
  return (NSString *)sub_1DF1AFCDC((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_adQToken);
}

- (void)setAdQToken:(id)a3
{
}

- (NSNumber)maximumAdRequestsForCurrentAdPreviewID
{
  return (NSNumber *)sub_1DF832898((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___TSFeedViewContext_maximumAdRequestsForCurrentAdPreviewID);
}

- (void)setMaximumAdRequestsForCurrentAdPreviewID:(id)a3
{
}

- (void)setWithPresentationReason:(int)a3
{
}

- (void)setWithFeedPickerSection:(int)a3
{
}

- (void)setWithFeedPickerType:(int)a3
{
}

- (void)setWithSourceURL:(id)a3
{
  sub_1DEA3C638();
  MEMORY[0x1F4188790](v4 - 8);
  uint64_t v6 = (char *)&v13 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = sub_1DFDE7220();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  v10 = (char *)&v13 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1DFDE7190();
  (*(void (**)(char *, char *, uint64_t))(v8 + 16))(v6, v10, v7);
  (*(void (**)(char *, void, uint64_t, uint64_t))(v8 + 56))(v6, 0, 1, v7);
  uint64_t v11 = (char *)self + OBJC_IVAR___TSFeedViewContext_sourceURL;
  swift_beginAccess();
  uint64_t v12 = self;
  sub_1DF1B03D0((uint64_t)v6, (uint64_t)v11);
  swift_endAccess();

  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
}

- (void)setWithSourceApplication:(id)a3
{
}

- (void)setWithUserActivityType:(id)a3
{
}

- (void)setWithSourceSearchText:(id)a3
{
}

- (void)setWithAdPreviewID:(id)a3
{
}

- (void)setWithAdPreviewSessionID:(id)a3
{
}

- (void)setWithAdQToken:(id)a3
{
}

- (void)setWithMaximumAdRequestsForCurrentAdPreviewID:(int64_t)a3
{
}

- (void)setWithDisplayRank:(int64_t)a3
{
}

- (void)setWithExternalAnalyticsFeedReferrer:(int64_t)a3
{
}

- (void)setWithReferral:(id)a3
{
  uint64_t v4 = (void **)((char *)&self->super.isa + OBJC_IVAR___TSFeedViewContext_referral);
  swift_beginAccess();
  uint64_t v5 = *v4;
  BOOL *v4 = a3;
  id v6 = a3;
}

- (void)setWithPreviousArticleID:(id)a3
{
}

- (void)setWithPreviousArticleVersion:(int64_t)a3
{
}

- (void)setFeedTagType:(unint64_t)a3
{
  uint64_t v4 = (char *)self + OBJC_IVAR___TSFeedViewContext_feedTagType;
  swift_beginAccess();
  *(void *)uint64_t v4 = a3;
  v4[8] = 0;
}

- (TSFeedViewContext)init
{
  return (TSFeedViewContext *)FeedViewContext.init()();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  sub_1DEB4B7AC((uint64_t)self + OBJC_IVAR___TSFeedViewContext_sourceURL);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___TSFeedViewContext_maximumAdRequestsForCurrentAdPreviewID);
}

@end