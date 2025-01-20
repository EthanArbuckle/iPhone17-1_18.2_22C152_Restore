@interface GMEnrollmentTextModel
- (_TtC14VoiceTriggerUI21GMEnrollmentTextModel)init;
- (_TtC14VoiceTriggerUI21GMEnrollmentTextModel)initWithFont:(id)a3 label:(id)a4 hidden:(BOOL)a5;
@end

@implementation GMEnrollmentTextModel

- (_TtC14VoiceTriggerUI21GMEnrollmentTextModel)initWithFont:(id)a3 label:(id)a4 hidden:(BOOL)a5
{
  uint64_t v8 = sub_2388E0798();
  uint64_t v10 = v9;
  v11 = (objc_class *)a3;
  v12 = self;
  sub_2388DFE08();
  *(Class *)((char *)&v12->super.isa + OBJC_IVAR____TtC14VoiceTriggerUI21GMEnrollmentTextModel__font) = v11;
  v13 = (uint64_t *)((char *)v12 + OBJC_IVAR____TtC14VoiceTriggerUI21GMEnrollmentTextModel__label);
  uint64_t *v13 = v8;
  v13[1] = v10;
  *((unsigned char *)&v12->super.isa + OBJC_IVAR____TtC14VoiceTriggerUI21GMEnrollmentTextModel__hidden) = a5;
  v14 = v11;

  v17.receiver = v12;
  v17.super_class = (Class)type metadata accessor for GMEnrollmentTextModel(0);
  v15 = [(GMEnrollmentTextModel *)&v17 init];

  return v15;
}

- (_TtC14VoiceTriggerUI21GMEnrollmentTextModel)init
{
  result = (_TtC14VoiceTriggerUI21GMEnrollmentTextModel *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();

  v3 = (char *)self + OBJC_IVAR____TtC14VoiceTriggerUI21GMEnrollmentTextModel___observationRegistrar;
  uint64_t v4 = sub_2388DFE18();
  v5 = *(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8);
  v5(v3, v4);
}

@end