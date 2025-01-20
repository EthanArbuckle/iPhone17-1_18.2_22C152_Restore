@interface AssessmentPayloadStore
+ (_TtC3asd22AssessmentPayloadStore)shared;
- (_TtC3asd22AssessmentPayloadStore)init;
- (void)fetchFor:(NSString *)a3 withBindings:(NSDictionary *)a4 completionHandler:(id)a5;
@end

@implementation AssessmentPayloadStore

+ (_TtC3asd22AssessmentPayloadStore)shared
{
  id v2 = static AssessmentPayloadStore.shared.getter();

  return (_TtC3asd22AssessmentPayloadStore *)v2;
}

- (void)fetchFor:(NSString *)a3 withBindings:(NSDictionary *)a4 completionHandler:(id)a5
{
  v8 = _Block_copy(a5);
  v9 = (void *)swift_allocObject();
  v9[2] = a3;
  v9[3] = a4;
  v9[4] = v8;
  v9[5] = self;
  v10 = a3;
  v11 = a4;
  v12 = self;

  sub_1000B14E8((uint64_t)&unk_10069A490, (uint64_t)v9);
}

- (_TtC3asd22AssessmentPayloadStore)init
{
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC3asd22AssessmentPayloadStore_logger;
  type metadata accessor for Logger();
  sub_1000A62F4();
  (*(void (**)(char *))(v4 + 8))(v3);

  sub_1000A55A8((uint64_t)self + OBJC_IVAR____TtC3asd22AssessmentPayloadStore_assessmentPayloadFilter, (void (*)(void))type metadata accessor for AssessmentPayloadFilter);
}

@end