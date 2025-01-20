@interface NSUserDefaults
- (BOOL)forceDisplayFilenameExtensions;
- (NSArray)DOCSourceOrderKey;
- (void)setDOCSourceOrderKey:(id)a3;
- (void)setForceDisplayFilenameExtensions:(BOOL)a3;
@end

@implementation NSUserDefaults

- (NSArray)DOCSourceOrderKey
{
  v2 = self;
  uint64_t v3 = sub_10004F4C0();

  if (v3)
  {
    v4.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v4.super.isa = 0;
  }

  return (NSArray *)v4.super.isa;
}

- (BOOL)forceDisplayFilenameExtensions
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  id v3 = objc_allocWithZone((Class)NSUserDefaults);
  NSArray v4 = self;
  NSString v5 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();
  v6 = (NSUserDefaults *)[v3 initWithSuiteName:v5];

  if (v6)
  {
    unsigned __int8 v7 = [(NSUserDefaults *)v6 BOOLForKey:DOCUserDefaultsForceShowFilenameExtensionsKey];

    NSArray v4 = v6;
  }
  else
  {
    unsigned __int8 v7 = 0;
  }

  return v7;
}

- (void)setDOCSourceOrderKey:(id)a3
{
  if (a3)
  {
    static Array._unconditionallyBridgeFromObjectiveC(_:)();
    NSArray v4 = self;
    v5.super.isa = Array._bridgeToObjectiveC()().super.isa;
    swift_bridgeObjectRelease();
  }
  else
  {
    v6 = self;
    v5.super.isa = 0;
  }
  id v7 = String._bridgeToObjectiveC()();
  [(NSUserDefaults *)self setValue:v5.super.isa forKey:v7];

  swift_unknownObjectRelease();
}

- (void)setForceDisplayFilenameExtensions:(BOOL)a3
{
}

@end