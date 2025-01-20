@interface FeatureStoreUtils
+ (id)retrieveFeatureDataWithStreamId:(id)a3 interactionId:(id)a4;
+ (id)retrieveFeatureWithStreamId:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5;
- (_TtC19SiriTasksEvaluation17FeatureStoreUtils)init;
@end

@implementation FeatureStoreUtils

+ (id)retrieveFeatureWithStreamId:(id)a3 interactionId:(id)a4 dataVersion:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  uint64_t v6 = sub_21E6E14A8();
  unint64_t v8 = v7;
  uint64_t v9 = sub_21E6E14A8();
  id v11 = _s19SiriTasksEvaluation17FeatureStoreUtilsC08retrieveD08streamId011interactionI011dataVersionSo20FSFCurareInteraction_pSgSS_SSs6UInt32VtFZ_0(v6, v8, v9, v10, v5);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v11;
}

+ (id)retrieveFeatureDataWithStreamId:(id)a3 interactionId:(id)a4
{
  uint64_t v4 = sub_21E6E14A8();
  unint64_t v6 = v5;
  uint64_t v7 = sub_21E6E14A8();
  _s19SiriTasksEvaluation17FeatureStoreUtilsC08retrieveD4Data8streamId011interactionJ0Say10Foundation0H0VGSS_SStFZ_0(v4, v6, v7, v8);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  uint64_t v9 = (void *)sub_21E6E1548();
  swift_bridgeObjectRelease();

  return v9;
}

- (_TtC19SiriTasksEvaluation17FeatureStoreUtils)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FeatureStoreUtils();
  return [(FeatureStoreUtils *)&v3 init];
}

@end