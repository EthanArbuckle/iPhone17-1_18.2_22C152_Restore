@interface CarPlayInformationView
+ (_TtC5Music22CarPlayInformationView)loading;
+ (id)errorWithTitle:(id)a3 buttonText:(id)a4 buttonAction:(id)a5;
+ (id)noContentWithTitle:(id)a3 subtitle:(id)a4 buttonText:(id)a5 buttonAction:(id)a6;
- (_TtC5Music22CarPlayInformationView)initWithCoder:(id)a3;
- (_TtC5Music22CarPlayInformationView)initWithFrame:(CGRect)a3;
@end

@implementation CarPlayInformationView

+ (_TtC5Music22CarPlayInformationView)loading
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  uint64_t v3 = type metadata accessor for Locale();
  __chkstk_darwin(v3 - 8);
  uint64_t v4 = type metadata accessor for String.LocalizationValue();
  __chkstk_darwin(v4 - 8);
  String.LocalizationValue.init(stringLiteral:)();
  static Locale.current.getter();
  uint64_t v5 = String.init(localized:table:bundle:locale:comment:)();
  uint64_t v7 = v6;
  id v8 = objc_allocWithZone(ObjCClassMetadata);
  id v9 = sub_10022364C(v5, v7, 0, 0, 1, 0, 0, 0, 0);

  return (_TtC5Music22CarPlayInformationView *)v9;
}

+ (id)errorWithTitle:(id)a3 buttonText:(id)a4 buttonAction:(id)a5
{
  ObjCClassMetadata = (objc_class *)swift_getObjCClassMetadata();
  uint64_t v7 = _Block_copy(a5);
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v13 = v12;
  uint64_t v14 = swift_allocObject();
  *(void *)(v14 + 16) = v7;
  id v15 = objc_allocWithZone(ObjCClassMetadata);
  id v16 = sub_10022364C(v8, v10, 0, 0, 0, v11, v13, (uint64_t)sub_100224E18, v14);

  return v16;
}

+ (id)noContentWithTitle:(id)a3 subtitle:(id)a4 buttonText:(id)a5 buttonAction:(id)a6
{
  uint64_t v9 = _Block_copy(a6);
  if (a3)
  {
    uint64_t v10 = static String._unconditionallyBridgeFromObjectiveC(_:)();
    a3 = v11;
    if (a4) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v10 = 0;
    if (a4)
    {
LABEL_3:
      uint64_t v12 = static String._unconditionallyBridgeFromObjectiveC(_:)();
      a4 = v13;
      if (a5) {
        goto LABEL_4;
      }
LABEL_8:
      uint64_t v14 = 0;
      if (v9) {
        goto LABEL_5;
      }
      goto LABEL_9;
    }
  }
  uint64_t v12 = 0;
  if (!a5) {
    goto LABEL_8;
  }
LABEL_4:
  uint64_t v14 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  a5 = v15;
  if (v9)
  {
LABEL_5:
    uint64_t v16 = swift_allocObject();
    *(void *)(v16 + 16) = v9;
    uint64_t v9 = sub_100224CC4;
    goto LABEL_10;
  }
LABEL_9:
  uint64_t v16 = 0;
LABEL_10:
  id v17 = sub_100224B08(v10, (uint64_t)a3, v12, a4, v14, (uint64_t)a5, (uint64_t)v9, v16);
  sub_10006ADFC((uint64_t)v9);
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  return v17;
}

- (_TtC5Music22CarPlayInformationView)initWithCoder:(id)a3
{
  result = (_TtC5Music22CarPlayInformationView *)_assertionFailure(_:_:file:line:flags:)();
  __break(1u);
  return result;
}

- (_TtC5Music22CarPlayInformationView)initWithFrame:(CGRect)a3
{
  result = (_TtC5Music22CarPlayInformationView *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end