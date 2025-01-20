@interface SASelfLogger
- (SASelfLogger)init;
- (id)collectVMCPUStatsWithStage:(int64_t)a3 requestId:(id)a4;
- (id)getSiriRequestUUIDFor:(id)a3;
- (void)emitMWTCheckPointWithMwtCheckpoint:(int64_t)a3 requestId:(id)a4;
- (void)emitMWTCheckPointWithMwtCheckpoint:(int64_t)a3 requestId:(id)a4 timeStamp:(unint64_t)a5;
- (void)emitMWTMusicMetadata:(id)a3 requestId:(id)a4;
- (void)emitVMCPUStatsWithStage:(int64_t)a3 requestId:(id)a4;
- (void)emitVMCPUStatsWithVmCpuStatsData:(id)a3;
@end

@implementation SASelfLogger

- (SASelfLogger)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for SiriAudioSelfLogger();
  return [(SASelfLogger *)&v3 init];
}

- (void)emitMWTCheckPointWithMwtCheckpoint:(int64_t)a3 requestId:(id)a4
{
}

- (void)emitMWTCheckPointWithMwtCheckpoint:(int64_t)a3 requestId:(id)a4 timeStamp:(unint64_t)a5
{
  uint64_t v8 = sub_2380E2E98();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380E2E78();
  v12 = self;
  id v13 = sub_237F07CA0(a3, (uint64_t)v11);
  if (v13)
  {
    v14 = v13;
    objc_msgSend((id)(*(uint64_t (**)(void))((*MEMORY[0x263F8EED0] & (uint64_t)v12->super.isa) + 0x50))(), sel_emitMessage_timestamp_, v13, a5);

    swift_unknownObjectRelease();
  }
  else
  {
  }
  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (id)getSiriRequestUUIDFor:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26894D0D0);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380E4938();
  v7 = self;
  sub_2380E2E38();

  swift_bridgeObjectRelease();
  uint64_t v8 = sub_2380E2E98();
  uint64_t v9 = *(void *)(v8 - 8);
  uint64_t v10 = 0;
  if ((*(unsigned int (**)(char *, uint64_t, uint64_t))(v9 + 48))(v6, 1, v8) != 1)
  {
    uint64_t v10 = (void *)sub_2380E2E68();
    (*(void (**)(char *, uint64_t))(v9 + 8))(v6, v8);
  }
  return v10;
}

- (void)emitMWTMusicMetadata:(id)a3 requestId:(id)a4
{
  uint64_t v6 = sub_2380E2E98();
  uint64_t v7 = *(void *)(v6 - 8);
  MEMORY[0x270FA5388](v6);
  uint64_t v9 = (char *)&v12 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380E2E78();
  uint64_t v10 = (char *)a3;
  v11 = self;
  sub_23808F5D0(v10, (uint64_t)v9);

  (*(void (**)(char *, uint64_t))(v7 + 8))(v9, v6);
}

- (void)emitVMCPUStatsWithStage:(int64_t)a3 requestId:(id)a4
{
}

- (void)emitVMCPUStatsWithVmCpuStatsData:(id)a3
{
  id v4 = a3;
  uint64_t v8 = self;
  uint64_t v5 = sub_2380E2CE8();
  unint64_t v7 = v6;

  sub_238090F1C();
  sub_237EFD1BC(v5, v7);
}

- (id)collectVMCPUStatsWithStage:(int64_t)a3 requestId:(id)a4
{
  uint64_t v5 = sub_2380E2E98();
  uint64_t v6 = *(void *)(v5 - 8);
  MEMORY[0x270FA5388](v5);
  uint64_t v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_2380E2E78();
  uint64_t v9 = sub_2380985F8(a3, (uint64_t)v8);
  unint64_t v11 = v10;
  (*(void (**)(char *, uint64_t))(v6 + 8))(v8, v5);
  uint64_t v12 = 0;
  if (v11 >> 60 != 15)
  {
    uint64_t v12 = (void *)sub_2380E2CD8();
    sub_237F99F84(v9, v11);
  }
  return v12;
}

@end