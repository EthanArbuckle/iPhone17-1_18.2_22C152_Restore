@interface MigrationPolicyAddDefaultTag
- (_TtC28SiriPrivateLearningInference28MigrationPolicyAddDefaultTag)init;
- (id)migrateAndAddDefaultTagWithSource:(id)a3 manager:(id)a4;
@end

@implementation MigrationPolicyAddDefaultTag

- (id)migrateAndAddDefaultTagWithSource:(id)a3 manager:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_21F327674(v7);

  sub_21F2ABFB4(0, &qword_267EC89B0);
  v9 = (void *)sub_21F420338();
  swift_bridgeObjectRelease();
  return v9;
}

- (_TtC28SiriPrivateLearningInference28MigrationPolicyAddDefaultTag)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for MigrationPolicyAddDefaultTag();
  return [(MigrationPolicyAddDefaultTag *)&v3 init];
}

@end