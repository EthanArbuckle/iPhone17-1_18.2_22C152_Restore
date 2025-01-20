@interface MockIDSEventReportingManager
- (_TtC13transparencyd28MockIDSEventReportingManager)init;
- (void)reportResultWithSuccess:(NSNumber *)a3 startFrom:(double)a4 completionHandler:(id)a5;
@end

@implementation MockIDSEventReportingManager

- (_TtC13transparencyd28MockIDSEventReportingManager)init
{
  *((unsigned char *)&self->super.isa + OBJC_IVAR____TtC13transparencyd28MockIDSEventReportingManager_rec) = 0;
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MockIDSEventReportingManager();
  return [(MockIDSEventReportingManager *)&v3 init];
}

- (void)reportResultWithSuccess:(NSNumber *)a3 startFrom:(double)a4 completionHandler:(id)a5
{
  uint64_t v9 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v9 - 8);
  v11 = (char *)&v19 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  v12 = _Block_copy(a5);
  uint64_t v13 = swift_allocObject();
  *(void *)(v13 + 16) = a3;
  *(double *)(v13 + 24) = a4;
  *(void *)(v13 + 32) = v12;
  *(void *)(v13 + 40) = self;
  uint64_t v14 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v14 - 8) + 56))(v11, 1, 1, v14);
  v15 = (void *)swift_allocObject();
  v15[2] = 0;
  v15[3] = 0;
  v15[4] = &unk_10031F860;
  v15[5] = v13;
  v16 = (void *)swift_allocObject();
  v16[2] = 0;
  v16[3] = 0;
  v16[4] = &unk_10031F868;
  v16[5] = v15;
  v17 = a3;
  v18 = self;
  sub_10008AE84((uint64_t)v11, (uint64_t)&unk_10031F870, (uint64_t)v16);
  swift_release();
}

@end