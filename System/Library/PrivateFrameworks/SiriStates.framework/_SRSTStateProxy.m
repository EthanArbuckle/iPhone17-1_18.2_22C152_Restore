@interface _SRSTStateProxy
- (BOOL)isEqual:(id)a3;
- (_SRSTState)state;
- (_SRSTStateProxy)init;
- (_SRSTStateProxy)initWithState:(id)a3;
- (int64_t)hash;
@end

@implementation _SRSTStateProxy

- (_SRSTState)state
{
  return (_SRSTState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                               + OBJC_IVAR____SRSTStateProxy_state));
}

- (_SRSTStateProxy)initWithState:(id)a3
{
  return (_SRSTStateProxy *)@objc CallStateProxy.init(_:)((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____SRSTStateProxy_state);
}

- (_SRSTStateProxy)init
{
  result = (_SRSTStateProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  return @objc CallState.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))StateProxy.isEqual(_:));
}

- (int64_t)hash
{
  return @objc CallStateProxy.hash.getter();
}

@end