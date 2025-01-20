@interface MTStopwatchStorageProxy
- (_TtC18MobileTimerSupport23MTStopwatchStorageProxy)init;
- (void)createStopWatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)deleteStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didAddLap:(id)a3 forStopwatch:(id)a4 withCompletion:(id)a5 source:(id)a6;
- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
- (void)getStopwatchesWitchCompletion:(id)a3;
- (void)registerObserver:(id)a3;
- (void)setSystemReady;
- (void)unregisterObserver:(id)a3;
- (void)updateStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5;
@end

@implementation MTStopwatchStorageProxy

- (_TtC18MobileTimerSupport23MTStopwatchStorageProxy)init
{
  return (_TtC18MobileTimerSupport23MTStopwatchStorageProxy *)MTStopwatchStorageProxy.init()();
}

- (void)getStopwatchesWitchCompletion:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  if (v8)
  {
    uint64_t v9 = swift_allocObject();
    *(void *)(v9 + 16) = v8;
    v8 = sub_1BE30F128;
  }
  else
  {
    uint64_t v9 = 0;
  }
  uint64_t v10 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = v8;
  v11[5] = v9;
  v11[6] = self;
  v12 = self;
  sub_1BE30DFE0((uint64_t)v8);
  sub_1BE28D5E4((uint64_t)v7, (uint64_t)&unk_1EA107220, (uint64_t)v11);
  swift_release();
  sub_1BE2B3DAC((uint64_t)v8);
}

- (void)createStopWatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a5;
  v15[7] = sub_1BE2B40A4;
  v15[8] = v13;
  id v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  id v18 = v16;
  sub_1BE322750();
  sub_1BE28D5E4((uint64_t)v11, (uint64_t)&unk_1EA107218, (uint64_t)v15);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)updateStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a5;
  v15[7] = sub_1BE2B40A4;
  v15[8] = v13;
  id v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  id v18 = v16;
  sub_1BE322750();
  sub_1BE28D5E4((uint64_t)v11, (uint64_t)&unk_1EA107210, (uint64_t)v15);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)deleteStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a4);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v12;
  uint64_t v14 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = a5;
  v15[7] = sub_1BE2B40A4;
  v15[8] = v13;
  id v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  id v18 = v16;
  sub_1BE322750();
  sub_1BE28D5E4((uint64_t)v11, (uint64_t)&unk_1EA107208, (uint64_t)v15);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)didAddLap:(id)a3 forStopwatch:(id)a4 withCompletion:(id)a5 source:(id)a6
{
  uint64_t v11 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v11 - 8);
  uint64_t v13 = (char *)&v23 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v14 = _Block_copy(a5);
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  uint64_t v16 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v16 - 8) + 56))(v13, 1, 1, v16);
  v17 = (void *)swift_allocObject();
  v17[2] = 0;
  v17[3] = 0;
  v17[4] = self;
  v17[5] = a4;
  v17[6] = a3;
  v17[7] = a6;
  v17[8] = sub_1BE2B40A4;
  v17[9] = v15;
  id v18 = a3;
  id v19 = a4;
  swift_unknownObjectRetain_n();
  v20 = self;
  id v21 = v19;
  id v22 = v18;
  sub_1BE322750();
  sub_1BE28D5E4((uint64_t)v13, (uint64_t)&unk_1EA107200, (uint64_t)v17);
  swift_release();
  swift_release();

  swift_unknownObjectRelease();
}

- (void)didClearAllLapsForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t (*)())_Block_copy(a4);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    uint64_t v12 = sub_1BE2B40A4;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  id v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  id v18 = v16;
  sub_1BE30DFE0((uint64_t)v12);
  sub_1BE28D5E4((uint64_t)v11, (uint64_t)&unk_1EA1071F8, (uint64_t)v15);
  swift_release();
  sub_1BE2B3DAC((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)didStartLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t (*)())_Block_copy(a4);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    uint64_t v12 = sub_1BE2B40A4;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  id v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  id v18 = v16;
  sub_1BE30DFE0((uint64_t)v12);
  sub_1BE28D5E4((uint64_t)v11, (uint64_t)&unk_1EA1071F0, (uint64_t)v15);
  swift_release();
  sub_1BE2B3DAC((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)didPauseLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t (*)())_Block_copy(a4);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    uint64_t v12 = sub_1BE2B40A4;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  id v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  id v18 = v16;
  sub_1BE30DFE0((uint64_t)v12);
  sub_1BE28D5E4((uint64_t)v11, (uint64_t)&unk_1EA1071E8, (uint64_t)v15);
  swift_release();
  sub_1BE2B3DAC((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)didLapLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t (*)())_Block_copy(a4);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    uint64_t v12 = sub_1BE2B40A4;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  id v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  id v18 = v16;
  sub_1BE30DFE0((uint64_t)v12);
  sub_1BE28D5E4((uint64_t)v11, (uint64_t)&unk_1EA1071E0, (uint64_t)v15);
  swift_release();
  sub_1BE2B3DAC((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)didResetLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = (uint64_t (*)())_Block_copy(a4);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    uint64_t v12 = sub_1BE2B40A4;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  id v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  id v18 = v16;
  sub_1BE30DFE0((uint64_t)v12);
  sub_1BE28D5E4((uint64_t)v11, (uint64_t)&unk_1EA1071D8, (uint64_t)v15);
  swift_release();
  sub_1BE2B3DAC((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)didResumeLapTimerForStopwatch:(id)a3 withCompletion:(id)a4 source:(id)a5
{
  uint64_t v9 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v9 - 8);
  uint64_t v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v12 = _Block_copy(a4);
  if (v12)
  {
    uint64_t v13 = swift_allocObject();
    *(void *)(v13 + 16) = v12;
    uint64_t v12 = sub_1BE2B3DF4;
  }
  else
  {
    uint64_t v13 = 0;
  }
  uint64_t v14 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  uint64_t v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = self;
  v15[5] = a3;
  v15[6] = v12;
  v15[7] = v13;
  v15[8] = a5;
  id v16 = a3;
  swift_unknownObjectRetain_n();
  v17 = self;
  id v18 = v16;
  sub_1BE30DFE0((uint64_t)v12);
  sub_1BE28D5E4((uint64_t)v11, (uint64_t)&unk_1EA1071D0, (uint64_t)v15);
  swift_release();
  sub_1BE2B3DAC((uint64_t)v12);

  swift_unknownObjectRelease();
}

- (void)registerObserver:(id)a3
{
}

- (void)unregisterObserver:(id)a3
{
}

- (void)setSystemReady
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_1EB8389E0);
  MEMORY[0x1F4188790](v3 - 8);
  uint64_t v5 = (char *)&v9 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_1BE3235E0();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  v7 = (void *)swift_allocObject();
  v7[2] = 0;
  v7[3] = 0;
  v7[4] = self;
  v8 = self;
  sub_1BE304EB4((uint64_t)v5, (uint64_t)&unk_1EA1071B8, (uint64_t)v7);
  swift_release();
  sub_1BE29F8A8((uint64_t)v5, &qword_1EB8389E0);
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  swift_release();
}

@end