@interface PersistentContainer
- (_TtC15ReportingPlugin19PersistentContainer)initWithName:(id)a3 managedObjectModel:(id)a4;
@end

@implementation PersistentContainer

- (_TtC15ReportingPlugin19PersistentContainer)initWithName:(id)a3 managedObjectModel:(id)a4
{
  sub_25B3DCDE8();
  id v6 = a4;
  v7 = (void *)sub_25B3DCDD8();
  swift_bridgeObjectRelease();
  v10.receiver = self;
  v10.super_class = (Class)type metadata accessor for PersistentContainer();
  v8 = [(NSPersistentContainer *)&v10 initWithName:v7 managedObjectModel:v6];

  return v8;
}

@end