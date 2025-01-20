@interface CSDKeychainPasswordItem
+ (NSString)accessGroupName;
+ (NSString)serviceName;
- (BOOL)saveData:(id)a3 error:(id *)a4;
- (BOOL)savePassword:(id)a3 error:(id *)a4;
- (CSDKeychainPasswordItem)init;
- (CSDKeychainPasswordItem)initWithService:(id)a3 account:(id)a4 accessGroup:(id)a5;
- (NSString)account;
- (NSString)description;
- (id)readDataAndReturnError:(id *)a3;
- (id)readPasswordAndReturnError:(id *)a3;
- (void)setAccount:(id)a3;
@end

@implementation CSDKeychainPasswordItem

+ (NSString)accessGroupName
{
  id v2 = sub_10039949C(&qword_100583AB8, (void **)&qword_100594EB0);

  return (NSString *)v2;
}

+ (NSString)serviceName
{
  id v2 = sub_10039949C(&qword_100583AC0, (void **)&qword_100594EB8);

  return (NSString *)v2;
}

- (NSString)account
{
  sub_10039957C();
  NSString v2 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v2;
}

- (void)setAccount:(id)a3
{
  uint64_t v4 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v6 = v5;
  v7 = self;
  sub_100399628(v4, v6);
}

- (CSDKeychainPasswordItem)initWithService:(id)a3 account:(id)a4 accessGroup:(id)a5
{
  uint64_t v5 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v7 = v6;
  uint64_t v8 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v10 = v9;
  uint64_t v11 = static String._unconditionallyBridgeFromObjectiveC(_:)();
  return (CSDKeychainPasswordItem *)sub_100399644(v5, v7, v8, v10, v11, v12);
}

- (id)readPasswordAndReturnError:(id *)a3
{
  v3 = self;
  sub_100399764();

  NSString v4 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return v4;
}

- (BOOL)savePassword:(id)a3 error:(id *)a4
{
  static String._unconditionallyBridgeFromObjectiveC(_:)();
  uint64_t v5 = self;
  sub_100399AE4();
  swift_bridgeObjectRelease();

  return 1;
}

- (id)readDataAndReturnError:(id *)a3
{
  v3 = self;
  uint64_t v4 = sub_100399870();
  unint64_t v6 = v5;

  v7.super.isa = Data._bridgeToObjectiveC()().super.isa;
  sub_1001F7498(v4, v6);

  return v7.super.isa;
}

- (BOOL)saveData:(id)a3 error:(id *)a4
{
  id v5 = a3;
  unint64_t v6 = self;
  uint64_t v7 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v9 = v8;

  sub_100399C08(v7, v9);
  sub_1001F7498(v7, v9);
  return 1;
}

- (NSString)description
{
  NSString v2 = self;
  sub_10039A2C8();

  NSString v3 = String._bridgeToObjectiveC()();
  swift_bridgeObjectRelease();

  return (NSString *)v3;
}

- (CSDKeychainPasswordItem)init
{
}

- (void).cxx_destruct
{
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
}

@end