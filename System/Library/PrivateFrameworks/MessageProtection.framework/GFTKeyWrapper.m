@interface GFTKeyWrapper
+ (id)decrypt:(id)a3 using:(__SecKey *)a4 error:(id *)a5;
+ (id)encrypt:(id)a3 to:(__SecKey *)a4 error:(id *)a5;
+ (id)unwrapWrappedSeed:(id)a3 legacy:(BOOL)a4 using:(__SecKey *)a5 error:(id *)a6;
+ (id)wrapSeed:(id)a3 to:(id)a4 legacy:(BOOL)a5 error:(id *)a6;
- (_TtC17MessageProtection13GFTKeyWrapper)init;
@end

@implementation GFTKeyWrapper

+ (id)unwrapWrappedSeed:(id)a3 legacy:(BOOL)a4 using:(__SecKey *)a5 error:(id *)a6
{
  BOOL v7 = a4;
  id v8 = a3;
  v9 = a5;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  v13 = (void *)specialized static GFTKeyWrapper.unwrapWrappedSeed(_:legacy:using:)(v10, v12, v7, v9);
  outlined consume of Data._Representation(v10, v12);
  return v13;
}

+ (id)encrypt:(id)a3 to:(__SecKey *)a4 error:(id *)a5
{
  return @objc static GFTKeyWrapper.encrypt(_:to:)((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, id))specialized static GFTKeyWrapper.encrypt(_:to:));
}

+ (id)decrypt:(id)a3 using:(__SecKey *)a4 error:(id *)a5
{
  return @objc static GFTKeyWrapper.encrypt(_:to:)((uint64_t)a1, (uint64_t)a2, a3, a4, (uint64_t)a5, (uint64_t (*)(uint64_t, unint64_t, id))specialized static GFTKeyWrapper.decrypt(_:using:));
}

+ (id)wrapSeed:(id)a3 to:(id)a4 legacy:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = static Data._unconditionallyBridgeFromObjectiveC(_:)();
  unint64_t v12 = v11;

  v13 = specialized static GFTKeyWrapper.wrapSeed(_:to:legacy:)(v10, v12, v9, v6);
  outlined consume of Data._Representation(v10, v12);
  return v13;
}

- (_TtC17MessageProtection13GFTKeyWrapper)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for GFTKeyWrapper();
  return [(GFTKeyWrapper *)&v3 init];
}

@end