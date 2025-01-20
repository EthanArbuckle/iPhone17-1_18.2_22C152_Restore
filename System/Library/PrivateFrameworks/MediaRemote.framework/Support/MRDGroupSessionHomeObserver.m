@interface MRDGroupSessionHomeObserver
+ (MRDGroupSessionHomeObserver)shared;
- (MRDGroupSessionHomeObserver)init;
- (void)currentHomeUserIdentifiersWithCompletionHandler:(id)a3;
- (void)currentUserHomeIdentifiersWithCompletionHandler:(id)a3;
@end

@implementation MRDGroupSessionHomeObserver

+ (MRDGroupSessionHomeObserver)shared
{
  if (qword_100484200 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1004862C0;

  return (MRDGroupSessionHomeObserver *)v2;
}

- (void)currentHomeUserIdentifiersWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100013A80(&qword_100478720);
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
  v11[4] = &unk_10047CFF0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10047CFF8;
  v12[5] = v11;
  v13 = self;
  sub_10000B340((uint64_t)v7, (uint64_t)&unk_10047D000, (uint64_t)v12);
  swift_release();
}

- (void)currentUserHomeIdentifiersWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_100013A80(&qword_100478720);
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
  v11[4] = &unk_10047CFD0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_10047CFD8;
  v12[5] = v11;
  v13 = self;
  sub_10000B340((uint64_t)v7, (uint64_t)&unk_10047CFE0, (uint64_t)v12);
  swift_release();
}

- (MRDGroupSessionHomeObserver)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  uint64_t v4 = OBJC_IVAR___MRDGroupSessionHomeObserver_managerWrapper;
  sub_100013A80(&qword_10047CF70);
  uint64_t v5 = self;
  *(Class *)((char *)&self->super.isa + v4) = (Class)sub_100326CE4(&unk_10047CF78, 0);

  v7.receiver = v5;
  v7.super_class = ObjectType;
  return [(MRDGroupSessionHomeObserver *)&v7 init];
}

- (void).cxx_destruct
{
}

@end