@interface SDAirDropContactHashManager
+ (NSArray)ContactKeysForChangeHistory;
+ (NSArray)GeneralContactKeysToFetch;
+ (NSString)kStatusContactsHashesChanged;
+ (NSString)kStatusMeCardChanged;
+ (id)btleAdvertisementDataForStrings:(id)a3;
+ (id)obfuscatedMediumHashDataForStrings:(id)a3;
+ (id)obfuscatedShortHashDataForStrings:(id)a3;
+ (id)shared;
- (BOOL)contactsContainsShortHashes:(id)a3;
- (BOOL)dumpDBAtFileURL:(id)a3;
- (NSString)detailedDescription;
- (_TtC16DaemoniOSLibrary27SDAirDropContactHashManager)init;
- (id)contactForCombinedHash:(id)a3;
- (id)contactIdentifierForMediumHashes:(id)a3;
- (id)contactsForCombinedHash:(id)a3;
- (id)emailOrPhoneForCombinedHash:(id)a3;
- (void)cmfSyncAgentBlockListDidChange;
- (void)contactStoreDidChange;
- (void)meCardDidChange;
- (void)rebuildDB;
- (void)setMeCard:(id)a3;
@end

@implementation SDAirDropContactHashManager

- (_TtC16DaemoniOSLibrary27SDAirDropContactHashManager)init
{
  ObjectType = (objc_class *)swift_getObjectType();
  sub_10068D524((uint64_t)v7);
  sub_100567A8C((uint64_t)v7, (uint64_t)v6);
  id v3 = objc_allocWithZone(ObjectType);
  v4 = sub_100558780((uint64_t)v6);
  sub_100567AE8((uint64_t)v7);
  swift_getObjectType();
  swift_deallocPartialClassInstance();
  return (_TtC16DaemoniOSLibrary27SDAirDropContactHashManager *)v4;
}

- (void)cmfSyncAgentBlockListDidChange
{
  v2 = self;
  sub_10055B880("CMFSyncAgentBlockList change handler called", (uint64_t)&unk_1008DF5C8, (uint64_t)sub_100567B3C, (uint64_t)&unk_1008DF5E0);
}

- (void)contactStoreDidChange
{
  v2 = self;
  sub_10055B880("Contact Store change handler called", (uint64_t)&unk_1008DF578, (uint64_t)sub_100567A70, (uint64_t)&unk_1008DF590);
}

- (void)meCardDidChange
{
  v2 = self;
  sub_10055B880("MeCard change handler called", (uint64_t)&unk_1008DF528, (uint64_t)sub_100567A54, (uint64_t)&unk_1008DF540);
}

- (void).cxx_destruct
{
  sub_100567AE8((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_context);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_contactUpdateCoalescer));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_meCardUpdateCoalescer));
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_hashManagerQ));

  sub_10024D338((uint64_t)self + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_contactStore);
  swift_unknownObjectRelease();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_notificationCenter));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_distributedNotificationCenter));
  sub_1005679D8(*(void **)((char *)&self->super.isa
                         + OBJC_IVAR____TtC16DaemoniOSLibrary27SDAirDropContactHashManager_meCardInfo));

  swift_unknownObjectRelease();
}

+ (NSString)kStatusContactsHashesChanged
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (NSString)kStatusMeCardChanged
{
  NSString v2 = String._bridgeToObjectiveC()();

  return (NSString *)v2;
}

+ (id)shared
{
  if (qword_100969F70 != -1) {
    swift_once();
  }
  NSString v2 = (void *)qword_100979398;

  return v2;
}

- (NSString)detailedDescription
{
  NSString v2 = self;
  OS_dispatch_queue.sync<A>(execute:)();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (void)setMeCard:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100562EE4(v4);
}

- (id)contactForCombinedHash:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v3 = self;
  sub_10000A844(&qword_100979498);
  OS_dispatch_queue.sync<A>(execute:)();

  swift_bridgeObjectRelease();

  return v6;
}

- (id)contactsForCombinedHash:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v3 = self;
  sub_10000A844(&qword_100979490);
  OS_dispatch_queue.sync<A>(execute:)();

  swift_bridgeObjectRelease();
  sub_10000B740(0, (unint64_t *)&qword_100977CD0);
  sub_100463298();
  v4.super.isa = Set._bridgeToObjectiveC()().super.isa;
  swift_bridgeObjectRelease();

  return v4.super.isa;
}

- (id)emailOrPhoneForCombinedHash:(id)a3
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  NSString v3 = self;
  sub_10000A844(&qword_10096B540);
  OS_dispatch_queue.sync<A>(execute:)();

  swift_bridgeObjectRelease();
  if (v7)
  {
    NSString v4 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v4 = 0;
  }

  return v4;
}

- (id)contactIdentifierForMediumHashes:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  sub_10000A844(&qword_10096B540);
  OS_dispatch_queue.sync<A>(execute:)();
  sub_100250CC4(v6, v8);

  if (v11)
  {
    NSString v9 = String._bridgeToObjectiveC()();
    swift_bridgeObjectRelease();
  }
  else
  {
    NSString v9 = 0;
  }

  return v9;
}

- (BOOL)contactsContainsShortHashes:(id)a3
{
  id v4 = a3;
  v5 = self;
  uint64_t v6 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v8 = v7;

  OS_dispatch_queue.sync<A>(execute:)();
  sub_100250CC4(v6, v8);

  return v10;
}

+ (NSArray)ContactKeysForChangeHistory
{
  return (NSArray *)sub_10056493C((uint64_t)a1, (uint64_t)a2, &qword_100969F98);
}

+ (NSArray)GeneralContactKeysToFetch
{
  return (NSArray *)sub_10056493C((uint64_t)a1, (uint64_t)a2, &qword_100969FA0);
}

- (BOOL)dumpDBAtFileURL:(id)a3
{
  uint64_t v4 = type metadata accessor for URL();
  uint64_t v5 = *(void *)(v4 - 8);
  __chkstk_darwin(v4);
  unint64_t v7 = &v10[-((v6 + 15) & 0xFFFFFFFFFFFFFFF0)];
  static URL._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v11 = self;
  v12 = v7;
  unint64_t v8 = self;
  OS_dispatch_queue.sync<A>(execute:)();

  LOBYTE(v8) = v13;
  (*(void (**)(unsigned char *, uint64_t))(v5 + 8))(v7, v4);
  return (char)v8;
}

- (void)rebuildDB
{
  NSString v2 = self;
  sub_100564D00();
}

+ (id)btleAdvertisementDataForStrings:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = sub_100567460(v3);
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100250CC4(v4, v6);

  return v7.super.isa;
}

+ (id)obfuscatedShortHashDataForStrings:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = sub_100565244(v3, 2, 4);
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100250CC4(v4, v6);

  return v7.super.isa;
}

+ (id)obfuscatedMediumHashDataForStrings:(id)a3
{
  uint64_t v3 = static Array._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v4 = sub_100565244(v3, 3, 3);
  unint64_t v6 = v5;
  swift_bridgeObjectRelease();
  v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_100250CC4(v4, v6);

  return v7.super.isa;
}

@end