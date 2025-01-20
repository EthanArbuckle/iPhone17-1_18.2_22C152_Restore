@interface GroundTruthModelV1toV2CoreDataMigration
- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6;
- (_TtC28SiriPrivateLearningAnalytics39GroundTruthModelV1toV2CoreDataMigration)init;
@end

@implementation GroundTruthModelV1toV2CoreDataMigration

- (BOOL)createDestinationInstancesForSourceInstance:(id)a3 entityMapping:(id)a4 manager:(id)a5 error:(id *)a6
{
  return 1;
}

- (_TtC28SiriPrivateLearningAnalytics39GroundTruthModelV1toV2CoreDataMigration)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GroundTruthModelV1toV2CoreDataMigration();
  return [(GroundTruthModelV1toV2CoreDataMigration *)&v3 init];
}

@end