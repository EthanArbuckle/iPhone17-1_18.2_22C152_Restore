@interface TimeseriesInternal
- (TimeseriesInternal)init;
- (id)runBinomialTestTimeseriesWithSamples:(id)a3 sampleTimestamps:(id)a4 chunkMethod:(id)a5 minimumSampleSize:(id)a6 lastTimestampPreviousTest:(id)a7 significanceLevel:(id)a8 pHypothesis:(id)a9 error:(id *)a10;
- (id)runChangeDetectionWithEvents:(id)a3 test:(id)a4 lastRun:(id)a5;
- (id)runZTestBinomialProportionsTimeseriesWithSamples:(id)a3 sampleTimestamps:(id)a4 chunkMethod:(id)a5 minimumSampleSize:(id)a6 lastTimestampPreviousTest:(id)a7 significanceLevel:(id)a8 error:(id *)a9;
@end

@implementation TimeseriesInternal

- (id)runChangeDetectionWithEvents:(id)a3 test:(id)a4 lastRun:(id)a5
{
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v17 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v10 = sub_2309B5718();
  sub_2309A9E44(0, &qword_268709980);
  uint64_t v11 = sub_2309B56A8();
  if (a5)
  {
    sub_2309B5668();
    uint64_t v12 = sub_2309B5678();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v9, 0, 1, v12);
  }
  else
  {
    uint64_t v13 = sub_2309B5678();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v13 - 8) + 56))(v9, 1, 1, v13);
  }
  v14 = self;
  Timeseries.runChangeDetection(events:test:lastRun:)(v10, v11, (uint64_t)v9);

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_2309A1E94((uint64_t)v9, &qword_268709900);
  v15 = (void *)sub_2309B5698();
  swift_bridgeObjectRelease();
  return v15;
}

- (id)runBinomialTestTimeseriesWithSamples:(id)a3 sampleTimestamps:(id)a4 chunkMethod:(id)a5 minimumSampleSize:(id)a6 lastTimestampPreviousTest:(id)a7 significanceLevel:(id)a8 pHypothesis:(id)a9 error:(id *)a10
{
  v29[1] = a10;
  id v30 = a8;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)v29 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2309A9E44(0, &qword_268709988);
  unint64_t v16 = sub_2309B5718();
  uint64_t v17 = sub_2309B5678();
  uint64_t v18 = sub_2309B5718();
  uint64_t v19 = sub_2309B56D8();
  uint64_t v21 = v20;
  if (a7)
  {
    sub_2309B5668();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 0, 1, v17);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 1, 1, v17);
  }
  v22 = self;
  id v23 = v30;
  id v30 = a6;
  id v24 = v23;
  id v25 = a9;
  v26 = v22;
  Timeseries.runBinomialTestTimeseries(samples:sampleTimestamps:chunkMethod:minimumSampleSize:lastTimestampPreviousTest:significanceLevel:pHypothesis:)(v16, v18, v19, v21, a6, v15, v24, v25);
  sub_2309A1E94((uint64_t)v15, &qword_268709900);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_2309A9E44(0, &qword_2687099E0);
  v27 = (void *)sub_2309B5708();
  swift_bridgeObjectRelease();
  return v27;
}

- (id)runZTestBinomialProportionsTimeseriesWithSamples:(id)a3 sampleTimestamps:(id)a4 chunkMethod:(id)a5 minimumSampleSize:(id)a6 lastTimestampPreviousTest:(id)a7 significanceLevel:(id)a8 error:(id *)a9
{
  v27 = a9;
  uint64_t v13 = __swift_instantiateConcreteTypeFromMangledName(&qword_268709900);
  MEMORY[0x270FA5388](v13 - 8);
  v15 = (char *)&v27 - ((v14 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2309A9E44(0, &qword_268709988);
  unint64_t v16 = sub_2309B5718();
  uint64_t v17 = sub_2309B5678();
  uint64_t v18 = sub_2309B5718();
  uint64_t v19 = sub_2309B56D8();
  uint64_t v21 = v20;
  if (a7)
  {
    sub_2309B5668();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 0, 1, v17);
  }
  else
  {
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v17 - 8) + 56))(v15, 1, 1, v17);
  }
  id v22 = a6;
  id v23 = a8;
  id v24 = self;
  Timeseries.runZTestBinomialProportionsTimeseries(samples:sampleTimestamps:chunkMethod:minimumSampleSize:lastTimestampPreviousTest:significanceLevel:)(v16, v18, v19, v21, a6, (uint64_t)v15, v23);
  sub_2309A1E94((uint64_t)v15, &qword_268709900);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_2309A9E44(0, &qword_2687099D8);
  id v25 = (void *)sub_2309B5708();
  swift_bridgeObjectRelease();
  return v25;
}

- (TimeseriesInternal)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for Timeseries();
  return [(TimeseriesInternal *)&v3 init];
}

@end