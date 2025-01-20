@interface DefaultPINAppletProxy
- (_TtC9SPREngine21DefaultPINAppletProxy)init;
- (void)dealloc;
- (void)secureElementManagerSessionDidEndUnexpectedly:(id)a3;
@end

@implementation DefaultPINAppletProxy

- (void)dealloc
{
  v2 = self;
  sub_100144250();
}

- (void).cxx_destruct
{
  sub_100006520((uint64_t)self + OBJC_IVAR____TtC9SPREngine21DefaultPINAppletProxy_monitorManager);
  sub_100006520((uint64_t)self + OBJC_IVAR____TtC9SPREngine21DefaultPINAppletProxy_systemInfo);
  sub_100006520((uint64_t)self + OBJC_IVAR____TtC9SPREngine21DefaultPINAppletProxy_auditor);
  v3 = (char *)self + OBJC_IVAR____TtC9SPREngine21DefaultPINAppletProxy_secureElement;

  sub_100006520((uint64_t)v3);
}

- (void)secureElementManagerSessionDidEndUnexpectedly:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_100146DB8((uint64_t)v4);
}

- (_TtC9SPREngine21DefaultPINAppletProxy)init
{
  result = (_TtC9SPREngine21DefaultPINAppletProxy *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

@end