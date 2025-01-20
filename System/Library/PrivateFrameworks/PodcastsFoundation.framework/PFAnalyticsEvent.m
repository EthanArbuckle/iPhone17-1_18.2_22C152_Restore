@interface PFAnalyticsEvent
+ (PFAnalyticsEvent)globalRetentionPolicy;
+ (id)darkDownloadsChangeWithWasDark:(BOOL)a3 isDark:(BOOL)a4 reason:(unint64_t)a5 previousExit:(id)a6;
+ (id)downloadedFileHasiPodLibraryURLWithDiscoveryPoint:(id)a3 path:(id)a4 source:(id)a5;
+ (id)drmKeyRecoveredWithGenerator:(id)a3;
+ (id)drmKeyRecoveredWithPayload:(id)a3;
+ (id)episodeDurationComparisonWithEpisodeAdamId:(int64_t)a3 duration:(double)a4;
+ (id)episodeDurationComparisonWithMapiProvidedDuration:(double)a3 playerItemDuration:(double)a4;
+ (id)transcriptAlignmentFailedWithReason:(id)a3;
- (NSString)description;
- (NSString)name;
- (PFAnalyticsEvent)init;
- (PFAnalyticsEvent)initWithName:(id)a3 generator:(id)a4;
- (PFAnalyticsEvent)initWithName:(id)a3 payload:(id)a4;
- (id)payloadGenerator;
- (void)setPayloadGenerator:(id)a3;
@end

@implementation PFAnalyticsEvent

- (NSString)name
{
  return (NSString *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                             + OBJC_IVAR___PFAnalyticsEvent_name));
}

- (id)payloadGenerator
{
  v2 = (uint64_t *)((char *)self + OBJC_IVAR___PFAnalyticsEvent_payloadGenerator);
  swift_beginAccess();
  uint64_t v3 = *v2;
  uint64_t v4 = v2[1];
  aBlock[4] = v3;
  aBlock[5] = v4;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 1107296256;
  aBlock[2] = sub_1ACDD55C4;
  aBlock[3] = &block_descriptor_26_4;
  v5 = _Block_copy(aBlock);
  swift_retain();
  swift_release();
  return v5;
}

- (void)setPayloadGenerator:(id)a3
{
  uint64_t v4 = _Block_copy(a3);
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v4;
  v6 = (Class *)((char *)&self->super.isa + OBJC_IVAR___PFAnalyticsEvent_payloadGenerator);
  swift_beginAccess();
  void *v6 = sub_1ACDD60F8;
  v6[1] = v5;
  swift_release();
}

- (PFAnalyticsEvent)initWithName:(id)a3 generator:(id)a4
{
  v6 = _Block_copy(a4);
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  *(Class *)((char *)&self->super.isa + OBJC_IVAR___PFAnalyticsEvent_name) = (Class)a3;
  v8 = (uint64_t (**)())((char *)self + OBJC_IVAR___PFAnalyticsEvent_payloadGenerator);
  *v8 = sub_1ACDD6034;
  v8[1] = (uint64_t (*)())v7;
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for AnalyticsEvent();
  id v9 = a3;
  return [(PFAnalyticsEvent *)&v11 init];
}

- (PFAnalyticsEvent)initWithName:(id)a3 payload:(id)a4
{
  sub_1ACAA3690();
  uint64_t v6 = sub_1ACE75FF8();
  uint64_t v7 = swift_allocObject();
  *(void *)(v7 + 16) = v6;
  v12[4] = sub_1ACDD60F0;
  v12[5] = v7;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 1107296256;
  v12[2] = sub_1ACDD55C4;
  v12[3] = &block_descriptor_16_2;
  v8 = _Block_copy(v12);
  id v9 = a3;
  swift_release();
  v10 = [(PFAnalyticsEvent *)self initWithName:v9 generator:v8];

  _Block_release(v8);
  return v10;
}

- (NSString)description
{
  v2 = self;
  sub_1ACDD5CF4();

  uint64_t v3 = (void *)sub_1ACE76178();
  swift_bridgeObjectRelease();
  return (NSString *)v3;
}

- (PFAnalyticsEvent)init
{
  result = (PFAnalyticsEvent *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_release();
}

+ (id)drmKeyRecoveredWithGenerator:(id)a3
{
  uint64_t v3 = _Block_copy(a3);
  uint64_t v4 = swift_allocObject();
  *(void *)(v4 + 16) = v3;
  uint64_t v5 = (objc_class *)type metadata accessor for AnalyticsEvent();
  uint64_t v6 = (char *)objc_allocWithZone(v5);
  *(void *)&v6[OBJC_IVAR___PFAnalyticsEvent_name] = @"com.apple.podcasts.DRMKeysRecovered";
  uint64_t v7 = (uint64_t (**)())&v6[OBJC_IVAR___PFAnalyticsEvent_payloadGenerator];
  *uint64_t v7 = sub_1ACDD6034;
  v7[1] = (uint64_t (*)())v4;
  v11.receiver = v6;
  v11.super_class = v5;
  v8 = @"com.apple.podcasts.DRMKeysRecovered";
  id v9 = objc_msgSendSuper2(&v11, sel_init);
  return v9;
}

+ (id)drmKeyRecoveredWithPayload:(id)a3
{
  sub_1ACAA3690();
  uint64_t v3 = sub_1ACE75FF8();
  id v4 = objc_allocWithZone((Class)type metadata accessor for AnalyticsEvent());
  uint64_t v5 = swift_allocObject();
  *(void *)(v5 + 16) = v3;
  v10[4] = sub_1ACDD968C;
  v10[5] = v5;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 1107296256;
  v10[2] = sub_1ACDD55C4;
  v10[3] = &block_descriptor_28_1;
  uint64_t v6 = _Block_copy(v10);
  uint64_t v7 = @"com.apple.podcasts.DRMKeysRecovered";
  swift_bridgeObjectRetain();
  swift_release();
  id v8 = objc_msgSend(v4, sel_initWithName_generator_, v7, v6);

  _Block_release(v6);
  swift_bridgeObjectRelease();
  return v8;
}

+ (id)downloadedFileHasiPodLibraryURLWithDiscoveryPoint:(id)a3 path:(id)a4 source:(id)a5
{
  sub_1ACE761B8();
  sub_1ACE761B8();
  if (a5) {
    sub_1ACE761B8();
  }
  id v6 = _s18PodcastsFoundation14AnalyticsEventC31downloadedFileHasiPodLibraryURL14discoveryPoint4path6sourceACSS_S2SSgtFZ_0();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  return v6;
}

+ (PFAnalyticsEvent)globalRetentionPolicy
{
  v2 = (objc_class *)type metadata accessor for AnalyticsEvent();
  uint64_t v3 = (char *)objc_allocWithZone(v2);
  *(void *)&v3[OBJC_IVAR___PFAnalyticsEvent_name] = @"com.apple.podcasts.downloads.settings.global.retention-policy";
  id v4 = (id (**)())&v3[OBJC_IVAR___PFAnalyticsEvent_payloadGenerator];
  *id v4 = sub_1ACDD8678;
  v4[1] = 0;
  v8.receiver = v3;
  v8.super_class = v2;
  uint64_t v5 = @"com.apple.podcasts.downloads.settings.global.retention-policy";
  id v6 = objc_msgSendSuper2(&v8, sel_init);
  return (PFAnalyticsEvent *)v6;
}

+ (id)episodeDurationComparisonWithEpisodeAdamId:(int64_t)a3 duration:(double)a4
{
  id v4 = _s18PodcastsFoundation14AnalyticsEventC25episodeDurationComparison0E6AdamId8durationACs5Int64V_SdtFZ_0(a3, a4);
  return v4;
}

+ (id)episodeDurationComparisonWithMapiProvidedDuration:(double)a3 playerItemDuration:(double)a4
{
  id v4 = _s18PodcastsFoundation14AnalyticsEventC25episodeDurationComparison012mapiProvidedF0010playerItemF0ACSd_SdtFZ_0(a3, a4);
  return v4;
}

+ (id)darkDownloadsChangeWithWasDark:(BOOL)a3 isDark:(BOOL)a4 reason:(unint64_t)a5 previousExit:(id)a6
{
  uint64_t v9 = sub_1ACE750A8();
  uint64_t v10 = *(void *)(v9 - 8);
  MEMORY[0x1F4188790](v9);
  v12 = (char *)&v15 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1ACE75078();
  id v13 = _s18PodcastsFoundation14AnalyticsEventC19darkDownloadsChange7wasDark02isI06reason12previousExitACSb_SbSo06PFDarkG6ReasonV0B04DateVtFZ_0(a3, a4, a5);
  (*(void (**)(char *, uint64_t))(v10 + 8))(v12, v9);
  return v13;
}

+ (id)transcriptAlignmentFailedWithReason:(id)a3
{
  sub_1ACE761B8();
  id v3 = _s18PodcastsFoundation14AnalyticsEventC25transcriptAlignmentFailed6reasonACSS_tFZ_0();
  swift_bridgeObjectRelease();
  return v3;
}

@end