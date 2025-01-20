@interface MRDGroupSessionProxyAuthorizationListener
- (MRDGroupSessionProxyAuthorizationListener)init;
- (MRDGroupSessionProxyAuthorizationListener)initWithDelegate:(id)a3;
- (MRDGroupSessionProxyAuthorizationListenerDelegate)delegate;
- (void)setDelegate:(id)a3;
@end

@implementation MRDGroupSessionProxyAuthorizationListener

- (MRDGroupSessionProxyAuthorizationListenerDelegate)delegate
{
  swift_beginAccess();
  Strong = (void *)swift_unknownObjectWeakLoadStrong();

  return (MRDGroupSessionProxyAuthorizationListenerDelegate *)Strong;
}

- (void)setDelegate:(id)a3
{
}

- (MRDGroupSessionProxyAuthorizationListener)initWithDelegate:(id)a3
{
  return (MRDGroupSessionProxyAuthorizationListener *)sub_10023BB24();
}

- (MRDGroupSessionProxyAuthorizationListener)init
{
  result = (MRDGroupSessionProxyAuthorizationListener *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_1001B9788((uint64_t)self + OBJC_IVAR___MRDGroupSessionProxyAuthorizationListener_delegate);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDGroupSessionProxyAuthorizationListener____lazy_storage___messageQueue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR___MRDGroupSessionProxyAuthorizationListener____lazy_storage___serialQueue));

  swift_bridgeObjectRelease();

  swift_release();
}

@end