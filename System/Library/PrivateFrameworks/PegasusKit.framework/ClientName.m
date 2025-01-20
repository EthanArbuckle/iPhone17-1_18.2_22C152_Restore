@interface ClientName
+ (id)extractClientNameFromString:(id)a3;
+ (id)extractClientNameFromUserAgent:(id)a3 allowAbbreviation:(BOOL)a4;
- (_TtC10PegasusKit10ClientName)init;
@end

@implementation ClientName

+ (id)extractClientNameFromUserAgent:(id)a3 allowAbbreviation:(BOOL)a4
{
  if (a3)
  {
    uint64_t v5 = sub_1B383AD50();
    unint64_t v7 = v6;
  }
  else
  {
    uint64_t v5 = 0;
    unint64_t v7 = 0;
  }
  swift_getObjCClassMetadata();
  static ClientName.extractClientNameFromUserAgent(_:allowAbbreviation:)(v5, v7, a4);
  uint64_t v9 = v8;
  swift_bridgeObjectRelease();
  if (v9)
  {
    v10 = (void *)sub_1B383AD40();
    swift_bridgeObjectRelease();
  }
  else
  {
    v10 = 0;
  }

  return v10;
}

+ (id)extractClientNameFromString:(id)a3
{
  if (a3)
  {
    uint64_t v3 = sub_1B383AD50();
    uint64_t v5 = v4;
  }
  else
  {
    uint64_t v3 = 0;
    uint64_t v5 = 0;
  }
  static ClientName.extractClientNameFromString(_:)(v3, v5);
  uint64_t v7 = v6;
  swift_bridgeObjectRelease();
  if (v7)
  {
    uint64_t v8 = (void *)sub_1B383AD40();
    swift_bridgeObjectRelease();
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (_TtC10PegasusKit10ClientName)init
{
  return (_TtC10PegasusKit10ClientName *)ClientName.init()();
}

@end