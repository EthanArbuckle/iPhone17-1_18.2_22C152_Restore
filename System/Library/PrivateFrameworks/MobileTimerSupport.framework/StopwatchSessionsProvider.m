@interface StopwatchSessionsProvider
- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
@end

@implementation StopwatchSessionsProvider

- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = (uint64_t (*)())_Block_copy(a4);
  if (v11)
  {
    *(void *)(swift_allocObject() + 16) = v11;
    v11 = sub_1BE2B40A4;
  }
  uint64_t v12 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  id v14 = a3;
  swift_retain_n();
  id v15 = v14;
  swift_unknownObjectRetain();
  sub_1BE28D5E4((uint64_t)v10, (uint64_t)&unk_1EA105BF8, (uint64_t)v13);
  swift_release();
  sub_1BE2B3DAC((uint64_t)v11);

  swift_unknownObjectRelease();
  swift_release();
}

- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  v5 = _Block_copy(a4);
  if (v5)
  {
    _Block_release(v5);
  }
}

- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v8 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v8 - 8);
  v10 = (char *)&v16 - ((v9 + 15) & 0xFFFFFFFFFFFFFFF0);
  v11 = _Block_copy(a4);
  if (v11)
  {
    *(void *)(swift_allocObject() + 16) = v11;
    v11 = sub_1BE2B3DF4;
  }
  uint64_t v12 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v12 - 8) + 56))(v10, 1, 1, v12);
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = self;
  v13[5] = a3;
  id v14 = a3;
  swift_retain_n();
  id v15 = v14;
  swift_unknownObjectRetain();
  sub_1BE28D5E4((uint64_t)v10, (uint64_t)&unk_1EA105BE8, (uint64_t)v13);
  swift_release();
  sub_1BE2B3DAC((uint64_t)v11);

  swift_unknownObjectRelease();
  swift_release();
}

@end