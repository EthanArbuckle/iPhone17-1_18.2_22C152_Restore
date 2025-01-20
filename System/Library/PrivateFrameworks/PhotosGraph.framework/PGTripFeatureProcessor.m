@interface PGTripFeatureProcessor
- (PGTripFeatureProcessor)init;
- (PGTripFeatureProcessor)initWithMomentNodes:(id)a3 graph:(id)a4 locationHelper:(id)a5 error:(id *)a6;
- (id)finalScoreByLevelWithError:(id *)a3;
- (id)frequencyPerLocationWithError:(id *)a3;
- (id)getScorePerMoment;
- (id)getScoresByLevelWithError:(id *)a3;
- (id)processTripLocationsWithReporter:(id)a3 error:(id *)a4;
- (void)sendAnalyticsEvent;
@end

@implementation PGTripFeatureProcessor

- (PGTripFeatureProcessor)init
{
}

- (PGTripFeatureProcessor)initWithMomentNodes:(id)a3 graph:(id)a4 locationHelper:(id)a5 error:(id *)a6
{
  return (PGTripFeatureProcessor *)TripFeatureProcessor.init(momentNodes:graph:locationHelper:)(a3, a4, a5);
}

- (id)getScorePerMoment
{
  v2 = self;
  sub_1D1A4C548();

  sub_1D181F2D8(0, (unint64_t *)&qword_1EA65A260);
  sub_1D181E8A4((unint64_t *)&qword_1EA65A268, (unint64_t *)&qword_1EA65A260);
  v3 = (void *)sub_1D1EBDCC0();
  swift_bridgeObjectRelease();
  return v3;
}

- (id)getScoresByLevelWithError:(id *)a3
{
  return sub_1D1A4CCAC((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___PGTripFeatureProcessor_scoresByLevel);
}

- (id)frequencyPerLocationWithError:(id *)a3
{
  if (*(Class *)((char *)&self->super.isa + OBJC_IVAR___PGTripFeatureProcessor_locationFrequency))
  {
    sub_1D181F2D8(0, &qword_1EA65A660);
    sub_1D181E8A4((unint64_t *)&unk_1EA65CDF0, &qword_1EA65A660);
    swift_bridgeObjectRetain();
    v3 = (void *)sub_1D1EBDCC0();
    swift_bridgeObjectRelease();
  }
  else
  {
    sub_1D1A4C428();
    v5 = (void *)swift_allocError();
    *(_OWORD *)uint64_t v6 = 0u;
    *(_OWORD *)(v6 + 16) = 0u;
    *(unsigned char *)(v6 + 32) = 3;
    swift_willThrow();
    if (a3)
    {
      v7 = (void *)sub_1D1EBC5F0();

      id v8 = v7;
      v3 = 0;
      *a3 = v7;
    }
    else
    {

      v3 = 0;
    }
  }
  return v3;
}

- (id)finalScoreByLevelWithError:(id *)a3
{
  return sub_1D1A4CCAC((uint64_t)self, (uint64_t)a2, a3, &OBJC_IVAR___PGTripFeatureProcessor_finalTripLocationScoreByLevel);
}

- (void)sendAnalyticsEvent
{
  v3 = self;
  v4 = self;
  v5 = (void *)sub_1D1EBDE30();
  _s11PhotosGraph24TripTitleAnalyticsHelperC16analyticsPayload3forSDySSSo8NSObjectCGAA0C16FeatureProcessorC_tFZ_0((uint64_t)v4);
  sub_1D181F2D8(0, (unint64_t *)&qword_1EBD47740);
  id v6 = (id)sub_1D1EBDCC0();
  swift_bridgeObjectRelease();
  objc_msgSend(v3, sel_sendEvent_withPayload_, v5, v6);
}

- (id)processTripLocationsWithReporter:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = self;
  sub_1D1A4CF6C((uint64_t)v5);

  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EA65CDE0);
  v7 = (void *)sub_1D1EBE190();
  swift_bridgeObjectRelease();
  return v7;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___PGTripFeatureProcessor_tripDateInterval;
  uint64_t v4 = sub_1D1EBC320();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end