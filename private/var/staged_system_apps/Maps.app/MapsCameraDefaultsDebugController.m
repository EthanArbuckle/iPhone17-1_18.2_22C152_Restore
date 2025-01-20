@interface MapsCameraDefaultsDebugController
+ (id)navigationDestinationTitle;
- (_TtC4Maps33MapsCameraDefaultsDebugController)initWithCoder:(id)a3;
- (_TtC4Maps33MapsCameraDefaultsDebugController)initWithNibName:(id)a3 bundle:(id)a4;
- (_TtC4Maps33MapsCameraDefaultsDebugController)initWithStyle:(int64_t)a3;
- (void)prepareContent;
@end

@implementation MapsCameraDefaultsDebugController

+ (id)navigationDestinationTitle
{
  NSString v2 = String._bridgeToObjectiveC()();

  return v2;
}

- (void)prepareContent
{
  NSString v2 = self;
  sub_1002604A8();
}

- (_TtC4Maps33MapsCameraDefaultsDebugController)initWithStyle:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(MapsCameraDefaultsDebugController *)&v5 initWithStyle:a3];
}

- (_TtC4Maps33MapsCameraDefaultsDebugController)initWithNibName:(id)a3 bundle:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  if (a3)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();
    id v8 = a4;
    a3 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    id v9 = a4;
  }
  v12.receiver = self;
  v12.super_class = ObjectType;
  v10 = [(MapsCameraDefaultsDebugController *)&v12 initWithNibName:a3 bundle:a4];

  return v10;
}

- (_TtC4Maps33MapsCameraDefaultsDebugController)initWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)swift_getObjectType();
  return [(MapsCameraDefaultsDebugController *)&v5 initWithCoder:a3];
}

@end