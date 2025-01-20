@interface EligibilitySupport
- (_TtC13transparencyd18EligibilitySupport)init;
- (id)eligibilityContainerPathAndReturnError:(id *)a3;
- (void)checkiCloudAnalyticsWithCompletionHandler:(id)a3;
@end

@implementation EligibilitySupport

- (void)checkiCloudAnalyticsWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100080E08(&qword_10031F850);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_100321DE8;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_100321DF8;
  v12[5] = v11;
  v13 = self;
  sub_10008AE84((uint64_t)v7, (uint64_t)&unk_100321E08, (uint64_t)v12);
  swift_release();
}

- (id)eligibilityContainerPathAndReturnError:(id *)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = self;
  sub_1000E8BAC(v7);

  URL._bridgeToObjectiveC()(v9);
  v11 = v10;
  (*(void (**)(char *, uint64_t))(v5 + 8))(v7, v4);

  return v11;
}

- (_TtC13transparencyd18EligibilitySupport)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for EligibilitySupport();
  return [(EligibilitySupport *)&v3 init];
}

@end