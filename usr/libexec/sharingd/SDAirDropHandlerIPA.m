@interface SDAirDropHandlerIPA
- (BOOL)canHandleTransfer;
- (BOOL)shouldEndAfterOpen;
- (NSString)singleItemActionTitle;
- (NSString)suitableContentsDescription;
- (_TtC16DaemoniOSLibrary19SDAirDropHandlerIPA)initWithTransfer:(id)a3 bundleIdentifier:(id)a4;
- (int64_t)transferTypes;
- (void)updatePossibleActions;
@end

@implementation SDAirDropHandlerIPA

- (BOOL)canHandleTransfer
{
  v2 = self;
  sub_100340AE4();
  char v4 = v3;

  return v4 & 1;
}

- (int64_t)transferTypes
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return (unint64_t)[(SDAirDropHandler *)&v3 transferTypes] | 0x8000;
}

- (NSString)suitableContentsDescription
{
  v2 = self;
  sub_100341328();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (NSString)singleItemActionTitle
{
  v2 = self;
  NSString v3 = String._bridgeToObjectiveC()();
  id v4 = (id)SFLocalizedStringForKey();

  if (v4)
  {
    static String._unconditionallyBridgeFromObjectiveC(_:)();

    NSString v5 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {

    NSString v5 = 0;
  }

  return (NSString *)v5;
}

- (BOOL)shouldEndAfterOpen
{
  return 1;
}

- (void)updatePossibleActions
{
  v2 = self;
  sub_1003417F0();
}

- (_TtC16DaemoniOSLibrary19SDAirDropHandlerIPA)initWithTransfer:(id)a3 bundleIdentifier:(id)a4
{
  ObjectType = (objc_class *)swift_getObjectType();
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v7 = a3;
  NSString v8 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v11.receiver = self;
  v11.super_class = ObjectType;
  v9 = [(SDAirDropHandler *)&v11 initWithTransfer:v7 bundleIdentifier:v8];

  return v9;
}

@end