@interface ASBiomeMaterializedViewer
- (_TtC3asd25ASBiomeMaterializedViewer)init;
- (id)runWithQuery:(id)a3 inputColNames:(id)a4 inputColTypes:(id)a5 error:(id *)a6;
@end

@implementation ASBiomeMaterializedViewer

- (id)runWithQuery:(id)a3 inputColNames:(id)a4 inputColTypes:(id)a5 error:(id *)a6
{
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v9 = v8;
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  static Array._unconditionallyBridgeFromObjectiveC(_:)();
  v10 = self;
  ASBiomeMaterializedViewer.run(query:inputColNames:inputColTypes:)(v7, v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  sub_10002E768(&qword_1006980A8);
  v11.super.isa = Array._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v11.super.isa;
}

- (_TtC3asd25ASBiomeMaterializedViewer)init
{
  return (_TtC3asd25ASBiomeMaterializedViewer *)ASBackgroundActivityManager.init()();
}

@end