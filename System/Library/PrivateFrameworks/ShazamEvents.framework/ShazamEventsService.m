@interface ShazamEventsService
+ (id)machServiceName;
- (SHServiceDelegate)serviceDelegate;
- (_TtC12ShazamEvents19ShazamEventsService)init;
- (void)liveMusicEventWithEventID:(id)a3 completionHandler:(id)a4;
- (void)liveMusicScheduleWithArtistID:(id)a3 startDate:(id)a4 completionHandler:(id)a5;
- (void)liveMusicScheduleWithVenueID:(id)a3 completionHandler:(id)a4;
- (void)setServiceDelegate:(id)a3;
- (void)shutdownService;
@end

@implementation ShazamEventsService

- (SHServiceDelegate)serviceDelegate
{
  v2 = (void *)swift_unknownObjectRetain();

  return (SHServiceDelegate *)v2;
}

- (void)setServiceDelegate:(id)a3
{
  *(Class *)((char *)&self->super.isa + OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_underlyingServiceDelegate) = (Class)a3;
  swift_unknownObjectRetain();

  swift_unknownObjectRelease();
}

+ (id)machServiceName
{
  v2 = (void *)sub_235CDBAB8();

  return v2;
}

- (void)liveMusicEventWithEventID:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268837BC8);
  MEMORY[0x270FA5388](v6 - 8);
  v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = sub_235CDBAC8();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = sub_235CDBBD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  uint64_t v15 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_liveMusicEventFetcher);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v15;
  v16[5] = v10;
  v16[6] = v12;
  v16[7] = sub_235CC3BB8;
  v16[8] = v13;
  v17 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235CC16F8((uint64_t)v8, (uint64_t)&unk_268837C98, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)liveMusicScheduleWithArtistID:(id)a3 startDate:(id)a4 completionHandler:(id)a5
{
  v29 = self;
  uint64_t v7 = __swift_instantiateConcreteTypeFromMangledName(&qword_268837BC8);
  MEMORY[0x270FA5388](v7 - 8);
  v9 = (char *)&v29 - ((v8 + 15) & 0xFFFFFFFFFFFFFFF0);
  v31 = v9;
  uint64_t v32 = sub_235CDB998();
  uint64_t v10 = *(void *)(v32 - 8);
  uint64_t v11 = *(void *)(v10 + 64);
  uint64_t v12 = MEMORY[0x270FA5388](v32);
  uint64_t v13 = (char *)&v29 - ((v11 + 15) & 0xFFFFFFFFFFFFFFF0);
  MEMORY[0x270FA5388](v12);
  uint64_t v15 = (char *)&v29 - v14;
  v16 = _Block_copy(a5);
  uint64_t v30 = sub_235CDBAC8();
  uint64_t v18 = v17;
  sub_235CDB978();
  uint64_t v19 = swift_allocObject();
  *(void *)(v19 + 16) = v16;
  uint64_t v20 = sub_235CDBBD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v20 - 8) + 56))(v9, 1, 1, v20);
  uint64_t v21 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_liveMusicEventFetcher);
  uint64_t v22 = v32;
  (*(void (**)(char *, char *, uint64_t))(v10 + 16))(v13, v15, v32);
  unint64_t v23 = (*(unsigned __int8 *)(v10 + 80) + 56) & ~(unint64_t)*(unsigned __int8 *)(v10 + 80);
  unint64_t v24 = (v11 + v23 + 7) & 0xFFFFFFFFFFFFFFF8;
  v25 = (char *)swift_allocObject();
  *((void *)v25 + 2) = 0;
  *((void *)v25 + 3) = 0;
  uint64_t v26 = v30;
  *((void *)v25 + 4) = v21;
  *((void *)v25 + 5) = v26;
  *((void *)v25 + 6) = v18;
  (*(void (**)(char *, char *, uint64_t))(v10 + 32))(&v25[v23], v13, v22);
  v27 = (uint64_t (**)())&v25[v24];
  *v27 = sub_235CC3EE4;
  v27[1] = (uint64_t (*)())v19;
  v28 = v29;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235CC16F8((uint64_t)v31, (uint64_t)&unk_268837C90, (uint64_t)v25);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  (*(void (**)(char *, uint64_t))(v10 + 8))(v15, v22);
}

- (void)liveMusicScheduleWithVenueID:(id)a3 completionHandler:(id)a4
{
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_268837BC8);
  MEMORY[0x270FA5388](v6 - 8);
  uint64_t v8 = (char *)&v18 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a4);
  uint64_t v10 = sub_235CDBAC8();
  uint64_t v12 = v11;
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = v9;
  uint64_t v14 = sub_235CDBBD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v8, 1, 1, v14);
  uint64_t v15 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_liveMusicEventFetcher);
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = v15;
  v16[5] = v10;
  v16[6] = v12;
  v16[7] = sub_235CC3EE4;
  v16[8] = v13;
  uint64_t v17 = self;
  swift_retain();
  swift_bridgeObjectRetain();
  swift_retain();
  sub_235CC16F8((uint64_t)v8, (uint64_t)&unk_268837C88, (uint64_t)v16);

  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

- (void)shutdownService
{
  uint64_t v3 = __swift_instantiateConcreteTypeFromMangledName(&qword_268837BC8);
  MEMORY[0x270FA5388](v3 - 8);
  v5 = (char *)&v10 - ((v4 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v6 = sub_235CDBBD8();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v6 - 8) + 56))(v5, 1, 1, v6);
  uint64_t v7 = *(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC12ShazamEvents19ShazamEventsService_liveMusicEventFetcher);
  uint64_t v8 = (void *)swift_allocObject();
  v8[2] = 0;
  v8[3] = 0;
  v8[4] = v7;
  v9 = self;
  swift_retain();
  sub_235CC16F8((uint64_t)v5, (uint64_t)&unk_268837C80, (uint64_t)v8);

  swift_release();
}

- (_TtC12ShazamEvents19ShazamEventsService)init
{
  return (_TtC12ShazamEvents19ShazamEventsService *)ShazamEventsService.init()();
}

- (void).cxx_destruct
{
  swift_release();

  swift_unknownObjectRelease();
}

@end