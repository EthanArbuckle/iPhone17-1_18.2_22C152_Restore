@interface FMPhoneNumberUtil
+ (BOOL)isEmailValidWithEmail:(id)a3;
+ (BOOL)isPhoneNumberValidWithPhoneNumber:(id)a3;
+ (id)formatWithPhoneNumber:(id)a3;
+ (id)formattedWithHandle:(id)a3;
+ (id)unformatWithPhoneNumber:(id)a3;
- (_TtC26FindMyNotificationsService17FMPhoneNumberUtil)init;
@end

@implementation FMPhoneNumberUtil

+ (id)formatWithPhoneNumber:(id)a3
{
  return sub_100011EFC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000123D4);
}

+ (id)formattedWithHandle:(id)a3
{
  return sub_100011EFC((uint64_t)a1, (uint64_t)a2, (uint64_t)a3, (void (*)(uint64_t))sub_1000124C4);
}

+ (id)unformatWithPhoneNumber:(id)a3
{
  uint64_t v3 = type metadata accessor for CharacterSet();
  uint64_t v4 = *(void *)(v3 - 8);
  __chkstk_darwin(v3);
  v6 = (char *)&v12 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v7 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;
  static CharacterSet.decimalDigits.getter();
  CharacterSet.insert(_:)();
  swift_bridgeObjectRetain();
  sub_1000125F8(v7, v9, (uint64_t)v6);
  swift_bridgeObjectRelease();
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  swift_bridgeObjectRelease();
  NSString v10 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v10;
}

+ (BOOL)isEmailValidWithEmail:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  if (qword_100028EB0 != -1) {
    swift_once();
  }
  uint64_t v3 = (void *)static String.emailPredicate;
  NSString v4 = String._bridgeToObjectiveC()();
  LOBYTE(v3) = [v3 evaluateWithObject:v4];
  swift_bridgeObjectRelease();

  return (char)v3;
}

+ (BOOL)isPhoneNumberValidWithPhoneNumber:(id)a3
{
  uint64_t v3 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  char v5 = sub_1000127EC(v3, v4);
  swift_bridgeObjectRelease();
  return v5 & 1;
}

- (_TtC26FindMyNotificationsService17FMPhoneNumberUtil)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for FMPhoneNumberUtil();
  return [(FMPhoneNumberUtil *)&v3 init];
}

@end