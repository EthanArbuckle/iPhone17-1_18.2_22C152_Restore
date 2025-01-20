@interface DOCPlaceholderSearchController
- (_TtC5Files30DOCPlaceholderSearchController)initWithCoder:(id)a3;
- (_TtC5Files30DOCPlaceholderSearchController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC5Files30DOCPlaceholderSearchController)initWithSearchResultsController:(id)a3;
@end

@implementation DOCPlaceholderSearchController

- (_TtC5Files30DOCPlaceholderSearchController)initWithSearchResultsController:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCPlaceholderSearchController();
  return [(DOCPlaceholderSearchController *)&v5 initWithSearchResultsController:a3];
}

- (_TtC5Files30DOCPlaceholderSearchController)initWithNibName:(id)a3 bundle:(id)a4
{
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v6 = a4;
    NSString v7 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v8 = a4;
    NSString v7 = 0;
  }
  v11.receiver = self;
  v11.super_class = (Class)type metadata accessor for DOCPlaceholderSearchController();
  v9 = [(DOCPlaceholderSearchController *)&v11 initWithNibName:v7 bundle:a4];

  return v9;
}

- (_TtC5Files30DOCPlaceholderSearchController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)type metadata accessor for DOCPlaceholderSearchController();
  return [(DOCPlaceholderSearchController *)&v5 initWithCoder:a3];
}

@end