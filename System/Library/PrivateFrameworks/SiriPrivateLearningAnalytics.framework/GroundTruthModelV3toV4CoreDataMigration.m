@interface GroundTruthModelV3toV4CoreDataMigration
- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (_TtC28SiriPrivateLearningAnalytics39GroundTruthModelV3toV4CoreDataMigration)init;
@end

@implementation GroundTruthModelV3toV4CoreDataMigration

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v12 = self;
  sub_1D2FF2880(v9, v10, v11);

  return 1;
}

- (_TtC28SiriPrivateLearningAnalytics39GroundTruthModelV3toV4CoreDataMigration)init
{
  return (_TtC28SiriPrivateLearningAnalytics39GroundTruthModelV3toV4CoreDataMigration *)sub_1D2FF310C();
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
}

@end