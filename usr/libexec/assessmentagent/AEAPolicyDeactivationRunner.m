@interface AEAPolicyDeactivationRunner
- (BOOL)isFailable;
- (void)deactivateWithCompletion:(id)a3;
@end

@implementation AEAPolicyDeactivationRunner

- (BOOL)isFailable
{
  uint64_t v2 = *(void *)&self->deactivation[24];
  uint64_t v3 = *(void *)&self->deactivation[32];
  sub_100006340(self->deactivation, v2);
  v4 = *(uint64_t (**)(uint64_t, uint64_t))(v3 + 16);
  swift_retain();
  char v5 = v4(v2, v3);
  swift_release();
  return v5 & 1;
}

- (void)deactivateWithCompletion:(id)a3
{
  uint64_t v5 = sub_1000048A0(&qword_1000ADE90);
  __chkstk_darwin(v5 - 8, v6);
  v8 = (char *)&v14 - ((v7 + 15) & 0xFFFFFFFFFFFFFFF0);
  v9 = _Block_copy(a3);
  uint64_t v10 = swift_allocObject();
  *(void *)(v10 + 16) = v9;
  *(void *)(v10 + 24) = self;
  uint64_t v11 = type metadata accessor for TaskPriority();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v11 - 8) + 56))(v8, 1, 1, v11);
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1000ADEA0;
  v12[5] = v10;
  v13 = (void *)swift_allocObject();
  v13[2] = 0;
  v13[3] = 0;
  v13[4] = &unk_1000ADEB0;
  v13[5] = v12;
  swift_retain();
  sub_1000461B0((uint64_t)v8, (uint64_t)&unk_1000ADEC0, (uint64_t)v13);
  swift_release();
}

@end