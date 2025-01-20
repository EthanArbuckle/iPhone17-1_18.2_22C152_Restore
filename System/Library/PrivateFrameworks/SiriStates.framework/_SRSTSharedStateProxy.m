@interface _SRSTSharedStateProxy
- (BOOL)isEqual:(id)a3;
- (_SRSTSharedState)state;
- (_SRSTSharedStateProxy)init;
- (_SRSTSharedStateProxy)initWithState:(id)a3;
- (int64_t)hash;
@end

@implementation _SRSTSharedStateProxy

- (_SRSTSharedState)state
{
  return (_SRSTSharedState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                     + OBJC_IVAR____SRSTSharedStateProxy_state));
}

- (_SRSTSharedStateProxy)initWithState:(id)a3
{
  return (_SRSTSharedStateProxy *)@objc CallStateProxy.init(_:)((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____SRSTSharedStateProxy_state);
}

- (_SRSTSharedStateProxy)init
{
  result = (_SRSTSharedStateProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  return @objc CallState.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))SharedStateProxy.isEqual(_:));
}

- (int64_t)hash
{
  return @objc CallStateProxy.hash.getter();
}

@end