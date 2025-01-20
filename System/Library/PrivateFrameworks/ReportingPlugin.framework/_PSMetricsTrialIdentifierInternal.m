@interface _PSMetricsTrialIdentifierInternal
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (_PSMetricsTrialIdentifierInternal)init;
- (_PSMetricsTrialIdentifierInternal)initWithExperiment:(id)a3 treatment:(id)a4 deployment:(id)a5;
- (int64_t)hash;
@end

@implementation _PSMetricsTrialIdentifierInternal

- (_PSMetricsTrialIdentifierInternal)initWithExperiment:(id)a3 treatment:(id)a4 deployment:(id)a5
{
  uint64_t v6 = sub_25B3DCDE8();
  uint64_t v8 = v7;
  uint64_t v9 = sub_25B3DCDE8();
  uint64_t v11 = v10;
  uint64_t v12 = sub_25B3DCDE8();
  v13 = (uint64_t *)((char *)self + OBJC_IVAR____PSMetricsTrialIdentifierInternal_experiment);
  uint64_t *v13 = v6;
  v13[1] = v8;
  v14 = (uint64_t *)((char *)self + OBJC_IVAR____PSMetricsTrialIdentifierInternal_treatment);
  uint64_t *v14 = v9;
  v14[1] = v11;
  v15 = (uint64_t *)((char *)self + OBJC_IVAR____PSMetricsTrialIdentifierInternal_deployment);
  uint64_t *v15 = v12;
  v15[1] = v16;
  v18.receiver = self;
  v18.super_class = (Class)type metadata accessor for TrialIdentifier();
  return [(_PSMetricsTrialIdentifierInternal *)&v18 init];
}

- (int64_t)hash
{
  v2 = self;
  int64_t v3 = sub_25B3C41F0();

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  return sub_25B3C4418(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))sub_25B3C42DC);
}

- (_PSMetricsTrialIdentifierInternal)init
{
  result = (_PSMetricsTrialIdentifierInternal *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

- (NSString)description
{
  return (NSString *)sub_25B3C5CB4(self, (uint64_t)a2, (void (*)(void))TrialIdentifier.description.getter);
}

@end