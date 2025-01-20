@interface _SRSTCallStateProxy
- (BOOL)isEqual:(id)a3;
- (_SRSTCallState)state;
- (_SRSTCallStateProxy)init;
- (_SRSTCallStateProxy)initWithState:(id)a3;
- (int64_t)hash;
@end

@implementation _SRSTCallStateProxy

- (_SRSTCallState)state
{
  return (_SRSTCallState *)objc_retainAutoreleaseReturnValue(*(id *)((char *)&self->super.isa
                                                                   + OBJC_IVAR____SRSTCallStateProxy_state));
}

- (_SRSTCallStateProxy)initWithState:(id)a3
{
  return (_SRSTCallStateProxy *)@objc CallStateProxy.init(_:)((char *)self, (uint64_t)a2, a3, &OBJC_IVAR____SRSTCallStateProxy_state);
}

- (_SRSTCallStateProxy)init
{
  result = (_SRSTCallStateProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
}

- (BOOL)isEqual:(id)a3
{
  return @objc CallState.isEqual(_:)(self, (uint64_t)a2, (uint64_t)a3, (uint64_t (*)(_OWORD *))CallStateProxy.isEqual(_:));
}

- (int64_t)hash
{
  return @objc CallStateProxy.hash.getter();
}

@end