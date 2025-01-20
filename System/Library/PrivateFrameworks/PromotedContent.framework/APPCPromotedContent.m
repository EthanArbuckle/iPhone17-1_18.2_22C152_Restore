@interface APPCPromotedContent
- (APInstallAttribution)installAttribution;
- (APPCCarouselMetricsHelping)metricsHelper;
- (APPCDiagnosticMetricsHelping)diagnosticMetricHelper;
- (APPCMediaMetricsHelping)mediaMetricHelper;
- (APPCMetricEventsTracking)metricEventsTracking;
- (APPCPromotableContentRepresentation)bestRepresentation;
- (APPCPromotableContext)context;
- (APPCPromotedContent)init;
- (BOOL)attachedToView;
- (BOOL)available;
- (BOOL)consumed;
- (BOOL)discarded;
- (BOOL)discardedDueToPolicy;
- (BOOL)isLocationAvailableForAd;
- (BOOL)isMRAID;
- (BOOL)isOutstreamVideoAd;
- (BOOL)isPAAvailableForAd;
- (BOOL)placeholder;
- (BOOL)vended;
- (NSArray)adServerEnvironments;
- (NSArray)representations;
- (NSDate)expirationDate;
- (NSDate)receivedReferenceTime;
- (NSDate)videoRequestStartDate;
- (NSDictionary)metaData;
- (NSDictionary)transparencyDetailsDictionary;
- (NSError)error;
- (NSString)brandName;
- (NSString)campaignText;
- (NSString)debugDescription;
- (NSString)disclosureRendererPayload;
- (NSString)identifier;
- (NSString)journeyIdentifier;
- (NSURL)disclosureURL;
- (NSUUID)contextIdentifier;
- (double)impressionThreshold;
- (int64_t)adType;
- (int64_t)feedMetadataContentProviderID;
- (int64_t)minimumTimeBetweenPresentation;
- (int64_t)numOfArticlesSinceInterstitial;
- (int64_t)serverUnfilledReason;
- (unint64_t)retrieveNetworkType;
- (void)dealloc;
- (void)notifyListenersPCUsedWithPcID:(id)a3;
- (void)registerPromotedContentUsedWithAction:(id)a3;
- (void)replaceMetricsHelperWithNewMetricsHelper:(id)a3;
- (void)setAttachedToView:(BOOL)a3;
- (void)setBestRepresentation:(id)a3;
- (void)setBrandName:(id)a3;
- (void)setCampaignText:(id)a3;
- (void)setConsumed:(BOOL)a3;
- (void)setContext:(id)a3;
- (void)setDiscarded:(BOOL)a3;
- (void)setDiscardedDueToPolicy:(BOOL)a3;
- (void)setDisclosureRendererPayload:(id)a3;
- (void)setDisclosureURL:(id)a3;
- (void)setError:(id)a3;
- (void)setExpirationDate:(id)a3;
- (void)setIdentifier:(id)a3;
- (void)setImpressionThreshold:(double)a3;
- (void)setInstallAttribution:(id)a3;
- (void)setJourneyIdentifier:(id)a3;
- (void)setMediaMetricHelper:(id)a3;
- (void)setMetaData:(id)a3;
- (void)setMetricEventsTracking:(id)a3;
- (void)setMetricsHelper:(id)a3;
- (void)setMinimumTimeBetweenPresentation:(int64_t)a3;
- (void)setRepresentations:(id)a3;
- (void)setServerUnfilledReason:(int64_t)a3;
- (void)setVended:(BOOL)a3;
- (void)setVideoRequestStartDate:(id)a3;
@end

@implementation APPCPromotedContent

- (NSDate)expirationDate
{
  uint64_t v3 = sub_1B5CB3090();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790](v3);
  v6 = (char *)&v10 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  v7 = (char *)self + OBJC_IVAR___APPCPromotedContent_expirationDate;
  swift_beginAccess();
  (*(void (**)(char *, char *, uint64_t))(v4 + 16))(v6, v7, v3);
  v8 = (void *)sub_1B5CB3040();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return (NSDate *)v8;
}

- (NSArray)representations
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  sub_1B5BFE044(&qword_1EB851580);
  v2 = (void *)sub_1B5CB34B0();
  swift_bridgeObjectRelease();
  return (NSArray *)v2;
}

- (APPCPromotableContentRepresentation)bestRepresentation
{
  return (APPCPromotableContentRepresentation *)sub_1B5BF0844();
}

- (APPCDiagnosticMetricsHelping)diagnosticMetricHelper
{
  v2 = (void *)swift_unknownObjectRetain();
  return (APPCDiagnosticMetricsHelping *)v2;
}

- (APPCCarouselMetricsHelping)metricsHelper
{
  swift_beginAccess();
  v2 = (void *)swift_unknownObjectRetain();
  return (APPCCarouselMetricsHelping *)v2;
}

- (void)setMetricsHelper:(id)a3
{
  uint64_t v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_metricsHelper);
  swift_beginAccess();
  *uint64_t v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (NSString)identifier
{
  return (NSString *)sub_1B5C8F4B0();
}

- (void)setIdentifier:(id)a3
{
}

- (NSString)journeyIdentifier
{
  return (NSString *)sub_1B5C8F4B0();
}

- (void)setJourneyIdentifier:(id)a3
{
}

- (APPCPromotableContext)context
{
  v2 = (char *)self + OBJC_IVAR___APPCPromotedContent_context;
  swift_beginAccess();
  uint64_t v3 = (void *)MEMORY[0x1BA9A9CB0](v2);
  return (APPCPromotableContext *)v3;
}

- (void)setContext:(id)a3
{
}

- (NSDictionary)metaData
{
  v2 = (Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_metaData);
  swift_beginAccess();
  if (*v2)
  {
    swift_bridgeObjectRetain();
    sub_1B5BFE044(&qword_1EB850E28);
    uint64_t v3 = (void *)sub_1B5CB3310();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v3 = 0;
  }
  return (NSDictionary *)v3;
}

- (void)setMetaData:(id)a3
{
  uint64_t v3 = (uint64_t)a3;
  if (a3)
  {
    sub_1B5BFE044(&qword_1EB850E28);
    uint64_t v3 = sub_1B5CB3320();
  }
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_metaData);
  swift_beginAccess();
  *uint64_t v5 = v3;
  swift_bridgeObjectRelease();
}

- (NSURL)disclosureURL
{
  return (NSURL *)sub_1B5C90D78((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_1EB851560, &OBJC_IVAR___APPCPromotedContent_disclosureURL, MEMORY[0x1E4F276F0], MEMORY[0x1E4F276D8]);
}

- (void)setDisclosureURL:(id)a3
{
}

- (NSString)disclosureRendererPayload
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCPromotedContent_disclosureRendererPayload);
}

- (void)setDisclosureRendererPayload:(id)a3
{
}

- (int64_t)minimumTimeBetweenPresentation
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_minimumTimeBetweenPresentation);
  swift_beginAccess();
  return *v2;
}

- (void)setMinimumTimeBetweenPresentation:(int64_t)a3
{
  uint64_t v4 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_minimumTimeBetweenPresentation);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSString)brandName
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCPromotedContent_brandName);
}

- (void)setBrandName:(id)a3
{
}

- (NSString)campaignText
{
  return (NSString *)sub_1B5C83B70((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCPromotedContent_campaignText);
}

- (void)setCampaignText:(id)a3
{
}

- (void)setRepresentations:(id)a3
{
  sub_1B5BFE044(&qword_1EB851580);
  uint64_t v4 = sub_1B5CB34C0();
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_representations);
  swift_beginAccess();
  *uint64_t v5 = v4;
  swift_bridgeObjectRelease();
}

- (APInstallAttribution)installAttribution
{
  return (APInstallAttribution *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCPromotedContent_installAttribution);
}

- (void)setInstallAttribution:(id)a3
{
}

- (void)setBestRepresentation:(id)a3
{
}

- (NSError)error
{
  return (NSError *)sub_1B5C838C0((uint64_t)self, (uint64_t)a2, &OBJC_IVAR___APPCPromotedContent_error);
}

- (void)setError:(id)a3
{
}

- (BOOL)placeholder
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_placeholder);
}

- (void)setExpirationDate:(id)a3
{
  uint64_t v4 = sub_1B5CB3090();
  uint64_t v5 = *(void *)(v4 - 8);
  MEMORY[0x1F4188790](v4);
  v7 = (char *)&v11 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5CB3060();
  v8 = (char *)self + OBJC_IVAR___APPCPromotedContent_expirationDate;
  swift_beginAccess();
  v9 = *(void (**)(char *, char *, uint64_t))(v5 + 40);
  uint64_t v10 = self;
  v9(v8, v7, v4);
  swift_endAccess();
}

- (int64_t)serverUnfilledReason
{
  v2 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_serverUnfilledReason);
  swift_beginAccess();
  return *v2;
}

- (void)setServerUnfilledReason:(int64_t)a3
{
  uint64_t v5 = (int64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_serverUnfilledReason);
  swift_beginAccess();
  *uint64_t v5 = a3;
  uint64_t v6 = MEMORY[0x1BA9A9CB0]((char *)self + OBJC_IVAR___APPCPromotedContent_unfilledReasonDelegate);
  if (v6)
  {
    v7 = (void *)v6;
    v8 = self;
    objc_msgSend(v7, sel_setUnfilledReason_, a3);

    swift_unknownObjectRelease();
  }
}

- (APPCMediaMetricsHelping)mediaMetricHelper
{
  return (APPCMediaMetricsHelping *)sub_1B5BF0844();
}

- (void)setMediaMetricHelper:(id)a3
{
}

- (BOOL)attachedToView
{
  v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_attachedToView;
  swift_beginAccess();
  return *v2;
}

- (void)setAttachedToView:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_attachedToView;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)vended
{
  v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_vended;
  swift_beginAccess();
  return *v2;
}

- (void)setVended:(BOOL)a3
{
  uint64_t v4 = self;
  sub_1B5C905D0(a3);
}

- (BOOL)discarded
{
  v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_discarded;
  swift_beginAccess();
  return *v2;
}

- (void)setDiscarded:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_discarded;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (BOOL)consumed
{
  v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_consumed;
  swift_beginAccess();
  return *v2;
}

- (void)setConsumed:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_consumed;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (double)impressionThreshold
{
  v2 = (double *)((char *)self + OBJC_IVAR___APPCPromotedContent_impressionThreshold);
  swift_beginAccess();
  return *v2;
}

- (void)setImpressionThreshold:(double)a3
{
  uint64_t v4 = (double *)((char *)self + OBJC_IVAR___APPCPromotedContent_impressionThreshold);
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (NSDate)videoRequestStartDate
{
  return (NSDate *)sub_1B5C90D78((uint64_t)self, (uint64_t)a2, (uint64_t *)&unk_1EB851B10, &OBJC_IVAR___APPCPromotedContent_videoRequestStartDate, MEMORY[0x1E4F27928], MEMORY[0x1E4F278C0]);
}

- (void)setVideoRequestStartDate:(id)a3
{
}

- (BOOL)discardedDueToPolicy
{
  v2 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_discardedDueToPolicy;
  swift_beginAccess();
  return *v2;
}

- (void)setDiscardedDueToPolicy:(BOOL)a3
{
  uint64_t v4 = (BOOL *)self + OBJC_IVAR___APPCPromotedContent_discardedDueToPolicy;
  swift_beginAccess();
  *uint64_t v4 = a3;
}

- (APPCMetricEventsTracking)metricEventsTracking
{
  return (APPCMetricEventsTracking *)sub_1B5BF0844();
}

- (void)setMetricEventsTracking:(id)a3
{
}

- (BOOL)isLocationAvailableForAd
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_isLocationAvailableForAd);
}

- (BOOL)isPAAvailableForAd
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_isPAAvailableForAd);
}

- (NSDate)receivedReferenceTime
{
  uint64_t v3 = sub_1B5BFE044((uint64_t *)&unk_1EB851B10);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1B5C000C4((uint64_t)self + OBJC_IVAR___APPCPromotedContent_receivedReferenceTime, (uint64_t)v5, (uint64_t *)&unk_1EB851B10);
  uint64_t v6 = sub_1B5CB3090();
  uint64_t v7 = *(void *)(v6 - 8);
  v8 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v7 + 48))(v5, 1, v6) != 1)
  {
    v8 = (void *)sub_1B5CB3040();
    (*(void (**)(char *, uint64_t))(v7 + 8))(v5, v6);
  }
  return (NSDate *)v8;
}

- (NSArray)adServerEnvironments
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_adServerEnvironments))
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_1B5CB34B0();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSArray *)v2;
}

- (BOOL)isOutstreamVideoAd
{
  uint64_t v3 = (unint64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_representations);
  swift_beginAccess();
  unint64_t v4 = *v3;
  uint64_t v5 = (uint64_t *)((char *)self + OBJC_IVAR___APPCPromotedContent_identifier);
  swift_beginAccess();
  uint64_t v7 = *v5;
  uint64_t v6 = v5[1];
  v8 = self;
  swift_bridgeObjectRetain();
  swift_bridgeObjectRetain();
  LOBYTE(v7) = sub_1B5BFC12C(v7, v6, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v7 & 1;
}

- (int64_t)numOfArticlesSinceInterstitial
{
  v2 = self;
  id v3 = sub_1B5C919CC();

  return (int64_t)v3;
}

- (BOOL)isMRAID
{
  swift_beginAccess();
  id v3 = self;
  unint64_t v4 = swift_bridgeObjectRetain();
  char v5 = sub_1B5CA6A14(v4);

  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (int64_t)adType
{
  v2 = self;
  id v3 = sub_1B5C91AEC();

  return (int64_t)v3;
}

- (NSUUID)contextIdentifier
{
  uint64_t v3 = sub_1B5BFE044(&qword_1EB851940);
  MEMORY[0x1F4188790](v3 - 8);
  char v5 = (char *)&v11 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = self;
  sub_1B5C91D64((uint64_t)v5);

  uint64_t v7 = sub_1B5CB3100();
  uint64_t v8 = *(void *)(v7 - 8);
  v9 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v8 + 48))(v5, 1, v7) != 1)
  {
    v9 = (void *)sub_1B5CB30C0();
    (*(void (**)(char *, uint64_t))(v8 + 8))(v5, v7);
  }
  return (NSUUID *)v9;
}

- (BOOL)available
{
  v2 = self;
  char v3 = sub_1B5C91F88();

  return v3 & 1;
}

- (NSDictionary)transparencyDetailsDictionary
{
  v2 = self;
  sub_1B5C921A8();

  char v3 = (void *)sub_1B5CB3310();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v3;
}

- (int64_t)feedMetadataContentProviderID
{
  v2 = self;
  id v3 = sub_1B5C924C8();

  return (int64_t)v3;
}

- (NSString)debugDescription
{
  v2 = self;
  sub_1B5C928C4();

  id v3 = (void *)sub_1B5CB33B0();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (void)dealloc
{
  v2 = self;
  PromotedContent.__deallocating_deinit();
}

- (void).cxx_destruct
{
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_1B5C16D70((uint64_t)self + OBJC_IVAR___APPCPromotedContent_context);
  swift_bridgeObjectRelease();
  sub_1B5C2434C((uint64_t)self + OBJC_IVAR___APPCPromotedContent_disclosureURL, (uint64_t *)&unk_1EB851560);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_unknownObjectRelease();
  id v3 = (char *)self + OBJC_IVAR___APPCPromotedContent_expirationDate;
  uint64_t v4 = sub_1B5CB3090();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  swift_unknownObjectRelease();
  sub_1B5C2434C((uint64_t)self + OBJC_IVAR___APPCPromotedContent_videoRequestStartDate, (uint64_t *)&unk_1EB851B10);
  swift_unknownObjectRelease();
  sub_1B5C2434C((uint64_t)self + OBJC_IVAR___APPCPromotedContent_receivedReferenceTime, (uint64_t *)&unk_1EB851B10);
  swift_bridgeObjectRelease();
  sub_1B5C16D70((uint64_t)self + OBJC_IVAR___APPCPromotedContent_unfilledReasonDelegate);
  swift_bridgeObjectRelease();
  sub_1B5C2434C((uint64_t)self + OBJC_IVAR___APPCPromotedContent__contextIdentifier, &qword_1EB851940);
  swift_unknownObjectRelease();
  swift_unknownObjectRelease();
  swift_bridgeObjectRelease();
}

- (void)replaceMetricsHelperWithNewMetricsHelper:(id)a3
{
  uint64_t v4 = (id *)((char *)&self->super.isa + OBJC_IVAR___APPCPromotedContent_metricsHelper);
  swift_beginAccess();
  *uint64_t v4 = a3;
  swift_unknownObjectRetain();
  swift_unknownObjectRelease();
}

- (unint64_t)retrieveNetworkType
{
  v2 = self;
  unint64_t v3 = sub_1B5BFC4E8();

  return v3;
}

- (void)registerPromotedContentUsedWithAction:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  uint64_t v6 = swift_allocObject();
  *(void *)(v6 + 16) = sub_1B5C999A4;
  *(void *)(v6 + 24) = v5;
  uint64_t v7 = (void **)((char *)self + OBJC_IVAR___APPCPromotedContent_onPromotedContentComplete);
  swift_beginAccess();
  uint64_t v8 = *v7;
  v9 = self;
  swift_retain();
  char isUniquelyReferenced_nonNull_native = swift_isUniquelyReferenced_nonNull_native();
  void *v7 = v8;
  if ((isUniquelyReferenced_nonNull_native & 1) == 0)
  {
    uint64_t v8 = sub_1B5C0DFEC(0, v8[2] + 1, 1, v8);
    void *v7 = v8;
  }
  unint64_t v12 = v8[2];
  unint64_t v11 = v8[3];
  if (v12 >= v11 >> 1)
  {
    uint64_t v8 = sub_1B5C0DFEC((void *)(v11 > 1), v12 + 1, 1, v8);
    void *v7 = v8;
  }
  v8[2] = v12 + 1;
  v13 = &v8[2 * v12];
  v13[4] = sub_1B5C99B5C;
  v13[5] = v6;
  swift_endAccess();

  swift_release();
}

- (void)notifyListenersPCUsedWithPcID:(id)a3
{
  uint64_t v4 = sub_1B5CB33C0();
  uint64_t v6 = v5;
  uint64_t v7 = self;
  sub_1B5C953BC(v4, v6);

  swift_bridgeObjectRelease();
}

- (APPCPromotedContent)init
{
  result = (APPCPromotedContent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end