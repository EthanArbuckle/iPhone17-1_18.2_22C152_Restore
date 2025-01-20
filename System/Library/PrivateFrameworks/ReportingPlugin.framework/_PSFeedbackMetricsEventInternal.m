@interface _PSFeedbackMetricsEventInternal
- (BOOL)airdropOptionPresent;
- (NSString)description;
- (NSString)engagedSuggestionId;
- (NSString)id;
- (NSString)trialDeploymentId;
- (NSString)trialExperimentId;
- (NSString)trialTreatmentId;
- (_PSFeedbackMetricsEventInternal)init;
- (_PSFeedbackMetricsEventInternal)initWithId:(id)a3 type:(int64_t)a4 engagedSuggestionId:(id)a5 airdropOptionPresent:(BOOL)a6 visiblePeopleSuggestionCount:(unsigned __int8)a7 visibleAppSuggestionCount:(unsigned __int8)a8 trialExperimentId:(id)a9 trialTreatmentId:(id)a10 trialDeploymentId:(id)a11 peopleSuggestionsTimeoutOccurred:(BOOL)a12;
- (int64_t)type;
- (unsigned)visibleAppSuggestionCount;
- (unsigned)visiblePeopleSuggestionCount;
@end

@implementation _PSFeedbackMetricsEventInternal

- (NSString)id
{
  return (NSString *)sub_25B3C3330();
}

- (int64_t)type
{
  return *(int64_t *)((char *)&self->super.isa + OBJC_IVAR____PSFeedbackMetricsEventInternal_type);
}

- (NSString)engagedSuggestionId
{
  if (*(void *)&self->id[OBJC_IVAR____PSFeedbackMetricsEventInternal_engagedSuggestionId])
  {
    swift_bridgeObjectRetain();
    v2 = (void *)sub_25B3DCDD8();
    swift_bridgeObjectRelease();
  }
  else
  {
    v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)airdropOptionPresent
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____PSFeedbackMetricsEventInternal_airdropOptionPresent);
}

- (unsigned)visiblePeopleSuggestionCount
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____PSFeedbackMetricsEventInternal_visiblePeopleSuggestionCount);
}

- (unsigned)visibleAppSuggestionCount
{
  return *((unsigned char *)&self->super.isa + OBJC_IVAR____PSFeedbackMetricsEventInternal_visibleAppSuggestionCount);
}

- (NSString)trialExperimentId
{
  return (NSString *)sub_25B3C3330();
}

- (NSString)trialTreatmentId
{
  return (NSString *)sub_25B3C3330();
}

- (NSString)trialDeploymentId
{
  return (NSString *)sub_25B3C3330();
}

- (_PSFeedbackMetricsEventInternal)initWithId:(id)a3 type:(int64_t)a4 engagedSuggestionId:(id)a5 airdropOptionPresent:(BOOL)a6 visiblePeopleSuggestionCount:(unsigned __int8)a7 visibleAppSuggestionCount:(unsigned __int8)a8 trialExperimentId:(id)a9 trialTreatmentId:(id)a10 trialDeploymentId:(id)a11 peopleSuggestionsTimeoutOccurred:(BOOL)a12
{
  uint64_t v13 = sub_25B3DCDE8();
  uint64_t v30 = v14;
  uint64_t v31 = v13;
  if (a5)
  {
    a5 = (id)sub_25B3DCDE8();
    uint64_t v16 = v15;
  }
  else
  {
    uint64_t v16 = 0;
  }
  uint64_t v17 = sub_25B3DCDE8();
  uint64_t v19 = v18;
  uint64_t v20 = sub_25B3DCDE8();
  uint64_t v22 = v21;
  uint64_t v23 = sub_25B3DCDE8();
  uint64_t v25 = v24;
  if (a12) {
    v26 = &unk_2708ED280;
  }
  else {
    v26 = (void *)MEMORY[0x263F8EE78];
  }
  id v27 = objc_allocWithZone((Class)type metadata accessor for PeopleSuggesterFeedbackEvent());
  v28 = (_PSFeedbackMetricsEventInternal *)sub_25B3C359C(v31, v30, a4, (uint64_t)a5, v16, a6, a7, a8, v17, v19, v20, v22, v23, v25, (uint64_t)v26);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return v28;
}

- (_PSFeedbackMetricsEventInternal)init
{
  result = (_PSFeedbackMetricsEventInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_25B3C5CB4(self, (uint64_t)a2, (void (*)(void))PeopleSuggesterFeedbackEvent.description.getter);
}

@end