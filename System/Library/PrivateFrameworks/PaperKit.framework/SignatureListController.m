@interface SignatureListController
- (_TtC8PaperKit23SignatureListController)initWithCoder:(id)a3;
- (_TtC8PaperKit23SignatureListController)initWithNibName:(id)a3 bundle:(id)a4;
@end

@implementation SignatureListController

- (_TtC8PaperKit23SignatureListController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    uint64_t v6 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    uint64_t v8 = v7;
    id v9 = a4;
    v10 = (void *)MEMORY[0x21054D080](v6, v8);
    swift_bridgeObjectRelease();
  }
  else
  {
    id v11 = a4;
    v10 = 0;
  }
  v14.receiver = self;
  v14.super_class = (Class)type metadata accessor for SignatureListController();
  v12 = [(SignatureListController *)&v14 initWithNibName:v10 bundle:a4];

  return v12;
}

- (_TtC8PaperKit23SignatureListController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for SignatureListController();
  return [(SignatureListController *)&v5 initWithCoder:a3];
}

@end