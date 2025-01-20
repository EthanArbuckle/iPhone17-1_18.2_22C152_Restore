@interface PKSubcredentialPairingAnalyticsReporter
+ (void)beginSubcredentialPairingSessionWithReferralSource:(unint64_t)a3 brandId:(id)a4 page:(int64_t)a5;
+ (void)endSubcredentialPairingSession;
+ (void)sendButtonPressWithButtonTag:(int64_t)a3 page:(int64_t)a4;
+ (void)sendOutcome:(BOOL)a3 errorMessage:(id)a4 page:(int64_t)a5;
+ (void)sendViewDidAppearWithPage:(int64_t)a3;
- (PKSubcredentialPairingAnalyticsReporter)init;
@end

@implementation PKSubcredentialPairingAnalyticsReporter

+ (void)beginSubcredentialPairingSessionWithReferralSource:(unint64_t)a3 brandId:(id)a4 page:(int64_t)a5
{
  if (a4)
  {
    uint64_t v7 = sub_1A03B4988();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  sub_19F8B498C(a3, v7, v9, a5);

  swift_bridgeObjectRelease();
}

+ (void)sendViewDidAppearWithPage:(int64_t)a3
{
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1E949D5F0);
  uint64_t inited = swift_initStackObject();
  v5 = (void **)MEMORY[0x1E4F86308];
  *(_OWORD *)(inited + 16) = xmmword_1A040E960;
  v6 = *v5;
  *(void *)(inited + 32) = *v5;
  *(void *)(inited + 40) = sub_1A03B4988();
  *(void *)(inited + 48) = v7;
  id v8 = v6;
  unint64_t v9 = sub_19FAD9BC4(inited);
  sub_19F8B4604(v9, a3);
  swift_bridgeObjectRelease();
}

+ (void)sendButtonPressWithButtonTag:(int64_t)a3 page:(int64_t)a4
{
}

+ (void)sendOutcome:(BOOL)a3 errorMessage:(id)a4 page:(int64_t)a5
{
  if (a4)
  {
    uint64_t v7 = sub_1A03B4988();
    uint64_t v9 = v8;
  }
  else
  {
    uint64_t v7 = 0;
    uint64_t v9 = 0;
  }
  sub_19F8B4CD4(a3, v7, v9, a5);

  swift_bridgeObjectRelease();
}

+ (void)endSubcredentialPairingSession
{
  v2 = self;
  uint64_t v3 = *MEMORY[0x1E4F86FE8];

  objc_msgSend(v2, sel_endSubjectReporting_, v3);
}

- (PKSubcredentialPairingAnalyticsReporter)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SubcredentialPairingAnalyticsReporter();
  return [(PKSubcredentialPairingAnalyticsReporter *)&v3 init];
}

@end