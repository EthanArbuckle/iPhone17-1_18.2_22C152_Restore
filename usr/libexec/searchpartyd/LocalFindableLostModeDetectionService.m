@interface LocalFindableLostModeDetectionService
- (void)findMyOnboardingEndedWithCompletionHandler:(id)a3;
- (void)findMyOnboardingStartedWithCompletionHandler:(id)a3;
- (void)pnpOnboardingEndedWithCompletionHandler:(id)a3;
- (void)pnpOnboardingStartedWithCompletionHandler:(id)a3;
@end

@implementation LocalFindableLostModeDetectionService

- (void)findMyOnboardingStartedWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_101667850;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_101667858;
  v12[5] = v11;
  swift_retain();
  sub_10103831C((uint64_t)v7, (uint64_t)&unk_101667860, (uint64_t)v12);
  swift_release();
}

- (void)findMyOnboardingEndedWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_101667830;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_101667838;
  v12[5] = v11;
  swift_retain();
  sub_10103831C((uint64_t)v7, (uint64_t)&unk_101667840, (uint64_t)v12);
  swift_release();
}

- (void)pnpOnboardingStartedWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_101667810;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_101667818;
  v12[5] = v11;
  swift_retain();
  sub_10103831C((uint64_t)v7, (uint64_t)&unk_101667820, (uint64_t)v12);
  swift_release();
}

- (void)pnpOnboardingEndedWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_10000588C(&qword_10164DBB0);
  __chkstk_darwin(v5 - 8);
  v7 = (char *)&v13 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_1016677E0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10164DC90;
  v12[5] = v11;
  swift_retain();
  sub_10103831C((uint64_t)v7, (uint64_t)&unk_10164DC98, (uint64_t)v12);
  swift_release();
}

@end