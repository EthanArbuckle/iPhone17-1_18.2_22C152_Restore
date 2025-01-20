@interface PKStoreId
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (NSNumber)numberValue;
- (NSString)stringValue;
- (PKStoreId)init;
- (PKStoreId)initWithCoder:(id)a3;
- (PKStoreId)initWithInteger:(int64_t)a3;
- (PKStoreId)initWithNumber:(id)a3;
- (PKStoreId)initWithString:(id)a3;
- (int64_t)longValue;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKStoreId

- (PKStoreId)initWithString:(id)a3
{
  uint64_t v3 = sub_23F0BF6A0();
  return (PKStoreId *)StoreId.init(value:)(v3, v4);
}

- (PKStoreId)initWithInteger:(int64_t)a3
{
  return (PKStoreId *)StoreId.init(value:)(a3);
}

- (PKStoreId)initWithNumber:(id)a3
{
  return (PKStoreId *)StoreId.init(value:)(a3);
}

- (NSNumber)numberValue
{
  v2 = self;
  sub_23F0AB018();
  uint64_t v4 = v3;

  return (NSNumber *)v4;
}

- (NSString)stringValue
{
  swift_bridgeObjectRetain();
  v2 = (void *)sub_23F0BF690();
  swift_bridgeObjectRelease();
  return (NSString *)v2;
}

- (int64_t)longValue
{
  v2 = self;
  sub_23F0AB3A0();
  int64_t v4 = v3;

  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return byte_268C34000;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_268C34000 = a3;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  v6 = (void *)sub_23F0BF690();
  id v7 = (id)sub_23F0BF690();
  objc_msgSend(v4, sel_encodeObject_forKey_, v6, v7);
}

- (PKStoreId)initWithCoder:(id)a3
{
  return (PKStoreId *)StoreId.init(coder:)(a3);
}

- (PKStoreId)init
{
  result = (PKStoreId *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

@end