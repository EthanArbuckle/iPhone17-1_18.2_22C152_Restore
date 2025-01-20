@interface PGSearchEntityAccumulator
- (BOOL)accumulateHolidays:(id)a3 forMomentUUID:(id)a4 error:(id *)a5;
- (BOOL)accumulateHomeAndWorkWithHomeAndWorkKeywords:(id)a3 forMomentUUID:(id)a4 dateInterval:(id)a5 error:(id *)a6;
- (BOOL)accumulateMeanings:(id)a3 forMomentUUID:(id)a4 error:(id *)a5;
- (BOOL)accumulatePersonAndPetRelationshipsFromGraph:(id)a3 progressReporter:(id)a4 error:(id *)a5;
- (BOOL)accumulatePublicEventsInPublicEventKeywords:(id)a3 forMomentUUID:(id)a4 dateInterval:(id)a5 error:(id *)a6;
- (BOOL)accumulateSeasons:(id)a3 forMomentUUID:(id)a4 error:(id *)a5;
- (BOOL)accumulateTrip:(id)a3 forMomentUUID:(id)a4 error:(id *)a5;
- (NSDictionary)relatedPersonAndPetDescriptorByRelatedPersonIdentifier;
- (NSDictionary)searchEntitiesByMomentUUID;
- (PGGraphSearchEntity)mePersonEntity;
- (PGSearchEntityAccumulator)init;
- (PGSearchEntityAccumulator)initWithSynonymsByCategoryMask:(id)a3;
@end

@implementation PGSearchEntityAccumulator

- (NSDictionary)searchEntitiesByMomentUUID
{
  swift_beginAccess();
  swift_bridgeObjectRetain();
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD49368);
  v2 = (void *)sub_1D1EBDCC0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (NSDictionary)relatedPersonAndPetDescriptorByRelatedPersonIdentifier
{
  swift_beginAccess();
  type metadata accessor for RelatedPersonEntityDescriptor();
  swift_bridgeObjectRetain();
  v2 = (void *)sub_1D1EBDCC0();
  swift_bridgeObjectRelease();
  return (NSDictionary *)v2;
}

- (PGGraphSearchEntity)mePersonEntity
{
  return (PGGraphSearchEntity *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                        + OBJC_IVAR___PGSearchEntityAccumulator_internalMePersonEntity));
}

- (PGSearchEntityAccumulator)initWithSynonymsByCategoryMask:(id)a3
{
  sub_1D181F2D8(0, (unint64_t *)&qword_1EBD47720);
  __swift_instantiateConcreteTypeFromMangledName((uint64_t *)&unk_1EBD48158);
  sub_1D181E8A4((unint64_t *)&qword_1EBD47728, (unint64_t *)&qword_1EBD47720);
  uint64_t v3 = sub_1D1EBDCE0();
  return (PGSearchEntityAccumulator *)SearchEntityAccumulator.init(with:)(v3);
}

- (PGSearchEntityAccumulator)init
{
  result = (PGSearchEntityAccumulator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v3 = (char *)self + OBJC_IVAR___PGSearchEntityAccumulator_logger;
  uint64_t v4 = sub_1D1EBDBD0();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

- (BOOL)accumulatePublicEventsInPublicEventKeywords:(id)a3 forMomentUUID:(id)a4 dateInterval:(id)a5 error:(id *)a6
{
  v16[1] = a6;
  uint64_t v17 = sub_1D1EBC320();
  uint64_t v7 = *(void *)(v17 - 8);
  MEMORY[0x1F4188790](v17);
  v9 = (char *)v16 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D181F2D8(0, (unint64_t *)&qword_1EBD47720);
  __swift_instantiateConcreteTypeFromMangledName(&qword_1EBD475D0);
  sub_1D181E8A4((unint64_t *)&qword_1EBD47728, (unint64_t *)&qword_1EBD47720);
  uint64_t v10 = sub_1D1EBDCE0();
  uint64_t v11 = sub_1D1EBDE60();
  uint64_t v13 = v12;
  sub_1D1EBC2B0();
  v14 = self;
  SearchEntityAccumulator.accumulatePublicEvents(in:for:dateInterval:)(v10, v11, v13, (uint64_t)v9);
  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v17);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)accumulateTrip:(id)a3 forMomentUUID:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_1D1EBDE60();
  v9 = v8;
  uint64_t v10 = sub_1D1EBDE60();
  uint64_t v12 = v11;
  uint64_t v13 = self;
  v14._countAndFlagsBits = v7;
  v14._object = v9;
  v15._countAndFlagsBits = v10;
  v15._object = v12;
  SearchEntityAccumulator.accumulateTrip(trip:for:)(v14, v15);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v16)
  {
    if (a5)
    {
      uint64_t v17 = (void *)sub_1D1EBC5F0();

      id v18 = v17;
      *a5 = v17;
    }
    else
    {
    }
  }
  return v16 == 0;
}

- (BOOL)accumulateMeanings:(id)a3 forMomentUUID:(id)a4 error:(id *)a5
{
  uint64_t v7 = sub_1D1EBDCE0();
  uint64_t v8 = sub_1D1EBDE60();
  uint64_t v10 = v9;
  uint64_t v11 = self;
  v12._countAndFlagsBits = v8;
  v12._object = v10;
  SearchEntityAccumulator.accumulateMeanings(meanings:for:)((Swift::OpaquePointer)v7, v12);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  if (v13)
  {
    if (a5)
    {
      Swift::String v14 = (void *)sub_1D1EBC5F0();

      id v15 = v14;
      *a5 = v14;
    }
    else
    {
    }
  }
  return v13 == 0;
}

- (BOOL)accumulateHolidays:(id)a3 forMomentUUID:(id)a4 error:(id *)a5
{
  return sub_1D1A1B338(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t))SearchEntityAccumulator.accumulateHolidays(holidays:for:));
}

- (BOOL)accumulateSeasons:(id)a3 forMomentUUID:(id)a4 error:(id *)a5
{
  return sub_1D1A1B338(self, (uint64_t)a2, (uint64_t)a3, (uint64_t)a4, (uint64_t)a5, (void (*)(uint64_t, uint64_t, uint64_t))SearchEntityAccumulator.accumulateSeasons(seasons:for:));
}

- (BOOL)accumulateHomeAndWorkWithHomeAndWorkKeywords:(id)a3 forMomentUUID:(id)a4 dateInterval:(id)a5 error:(id *)a6
{
  uint64_t v17 = a6;
  uint64_t v7 = sub_1D1EBC320();
  uint64_t v8 = *(void *)(v7 - 8);
  MEMORY[0x1F4188790](v7);
  uint64_t v10 = (char *)&v17 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1D181F2D8(0, (unint64_t *)&qword_1EBD47720);
  sub_1D181E8A4((unint64_t *)&qword_1EBD47728, (unint64_t *)&qword_1EBD47720);
  uint64_t v11 = sub_1D1EBDCE0();
  uint64_t v12 = sub_1D1EBDE60();
  uint64_t v14 = v13;
  sub_1D1EBC2B0();
  id v15 = self;
  SearchEntityAccumulator.accumulateHomeAndWork(with:for:dateInterval:)(v11, v12, v14, (uint64_t)v10);
  (*(void (**)(char *, uint64_t))(v8 + 8))(v10, v7);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return 1;
}

- (BOOL)accumulatePersonAndPetRelationshipsFromGraph:(id)a3 progressReporter:(id)a4 error:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  uint64_t v9 = self;
  SearchEntityAccumulator.accumulatePersonAndPetRelationships(from:progressReporter:)(v7);

  return 1;
}

@end