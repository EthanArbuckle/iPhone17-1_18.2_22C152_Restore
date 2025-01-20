@interface _SRSTSharedState
+ (_SRSTSharedState)passive;
+ (_SRSTSharedState)preparingToServe;
+ (_SRSTSharedState)serving;
+ (_SRSTSharedState)unshared;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)name;
- (_SRSTSharedState)init;
- (id)makeProxy;
- (int64_t)hash;
@end

@implementation _SRSTSharedState

+ (_SRSTSharedState)passive
{
  if (one-time initialization token for passive != -1) {
    swift_once();
  }
  v2 = (void *)static SharedState.passive;
  return (_SRSTSharedState *)v2;
}

- (NSString)name
{
  return (NSString *)@objc CallState.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SRSTSharedState_name);
}

- (NSString)description
{
  return (NSString *)@objc CallState.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SRSTSharedState_name);
}

- (BOOL)isEqual:(id)a3
{
  return @objc CallState.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SharedState.isEqual(_:));
}

- (int64_t)hash
{
  return @objc CallState.hash.getter();
}

- (id)makeProxy
{
  return @objc CallState.makeProxy()(self, (uint64_t)a2, type metadata accessor for SharedStateProxy, &OBJC_IVAR____SRSTSharedStateProxy_state);
}

- (_SRSTSharedState)init
{
  result = (_SRSTSharedState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (_SRSTSharedState)preparingToServe
{
  if (one-time initialization token for preparingToServe != -1) {
    swift_once();
  }
  v2 = (void *)static SharedState.preparingToServe;
  return (_SRSTSharedState *)v2;
}

+ (_SRSTSharedState)unshared
{
  if (one-time initialization token for unshared != -1) {
    swift_once();
  }
  v2 = (void *)static SharedState.unshared;
  return (_SRSTSharedState *)v2;
}

+ (_SRSTSharedState)serving
{
  if (one-time initialization token for serving != -1) {
    swift_once();
  }
  v2 = (void *)static SharedState.serving;
  return (_SRSTSharedState *)v2;
}

@end