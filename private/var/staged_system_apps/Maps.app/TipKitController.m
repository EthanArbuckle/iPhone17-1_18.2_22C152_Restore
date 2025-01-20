@interface TipKitController
+ (uint64_t)configureTips;
+ (uint64_t)resetDatastore;
+ (void)hideAllTipsForTesting;
+ (void)showAllTipsForTesting;
- (_TtC4Maps16TipKitController)init;
@end

@implementation TipKitController

+ (void)hideAllTipsForTesting
{
}

+ (void)showAllTipsForTesting
{
}

- (_TtC4Maps16TipKitController)init
{
  v3.receiver = self;
  v3.super_class = (Class)swift_getObjectType();
  return [(TipKitController *)&v3 init];
}

+ (uint64_t)resetDatastore
{
  return static Tips.resetDatastore()();
}

+ (uint64_t)configureTips
{
  if (GEOConfigGetBOOL())
  {
    if (qword_1015CBBB0 != -1) {
      swift_once();
    }
    uint64_t v0 = type metadata accessor for Logger();
    sub_1000F2248(v0, (uint64_t)qword_101611448);
    v1 = Logger.logObject.getter();
    os_log_type_t v2 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v1, v2))
    {
      objc_super v3 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)objc_super v3 = 0;
      _os_log_impl((void *)&_mh_execute_header, v1, v2, "Hiding All Tips For Testing", v3, 2u);
      swift_slowDealloc();
    }

    static Tips.hideAllTipsForTesting()();
  }
  else if (GEOConfigGetBOOL())
  {
    if (qword_1015CBBB0 != -1) {
      swift_once();
    }
    uint64_t v4 = type metadata accessor for Logger();
    sub_1000F2248(v4, (uint64_t)qword_101611448);
    v5 = Logger.logObject.getter();
    os_log_type_t v6 = static os_log_type_t.info.getter();
    if (os_log_type_enabled(v5, v6))
    {
      v7 = (uint8_t *)swift_slowAlloc();
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, v6, "Showing All Tips For Testing", v7, 2u);
      swift_slowDealloc();
    }

    static Tips.showAllTipsForTesting()();
  }
  else if (GEOConfigGetBOOL())
  {
    +[TipKitController resetDatastore]_0();
  }

  return sub_1001C12A8();
}

@end