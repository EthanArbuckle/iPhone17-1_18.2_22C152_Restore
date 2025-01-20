@interface _SRSTState
+ (_SRSTState)analyzing;
+ (_SRSTState)available;
+ (_SRSTState)disabled;
+ (_SRSTState)postResponse;
+ (_SRSTState)processing;
+ (_SRSTState)responding;
+ (_SRSTState)resting;
+ (_SRSTState)understanding;
- (BOOL)isEqual:(id)a3;
- (NSString)description;
- (NSString)name;
- (_SRSTState)init;
- (id)makeProxy;
- (int64_t)hash;
@end

@implementation _SRSTState

+ (_SRSTState)resting
{
  if (one-time initialization token for resting != -1) {
    swift_once();
  }
  v2 = (void *)static State.resting;
  return (_SRSTState *)v2;
}

+ (_SRSTState)responding
{
  if (one-time initialization token for responding != -1) {
    swift_once();
  }
  v2 = (void *)static State.responding;
  return (_SRSTState *)v2;
}

+ (_SRSTState)available
{
  if (one-time initialization token for available != -1) {
    swift_once();
  }
  v2 = (void *)static State.available;
  return (_SRSTState *)v2;
}

+ (_SRSTState)postResponse
{
  if (one-time initialization token for postResponse != -1) {
    swift_once();
  }
  v2 = (void *)static State.postResponse;
  return (_SRSTState *)v2;
}

- (NSString)name
{
  return (NSString *)@objc CallState.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SRSTState_name);
}

- (NSString)description
{
  return (NSString *)@objc CallState.name.getter((uint64_t)self, (uint64_t)a2, &OBJC_IVAR____SRSTState_name);
}

- (BOOL)isEqual:(id)a3
{
  return @objc CallState.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))State.isEqual(_:));
}

- (int64_t)hash
{
  return @objc CallState.hash.getter();
}

- (id)makeProxy
{
  return @objc CallState.makeProxy()(self, (uint64_t)a2, type metadata accessor for StateProxy, &OBJC_IVAR____SRSTStateProxy_state);
}

- (_SRSTState)init
{
  result = (_SRSTState *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

+ (_SRSTState)disabled
{
  if (one-time initialization token for disabled != -1) {
    swift_once();
  }
  v2 = (void *)static State.disabled;
  return (_SRSTState *)v2;
}

+ (_SRSTState)analyzing
{
  if (one-time initialization token for analyzing != -1) {
    swift_once();
  }
  v2 = (void *)static State.analyzing;
  return (_SRSTState *)v2;
}

+ (_SRSTState)understanding
{
  if (one-time initialization token for understanding != -1) {
    swift_once();
  }
  v2 = (void *)static State.understanding;
  return (_SRSTState *)v2;
}

+ (_SRSTState)processing
{
  if (one-time initialization token for processing != -1) {
    swift_once();
  }
  v2 = (void *)static State.processing;
  return (_SRSTState *)v2;
}

@end