@interface AppExtensionHostView.HostCoordinator
- (_TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator)init;
- (void)hostViewControllerDidActivate:(id)a3;
- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4;
@end

@implementation AppExtensionHostView.HostCoordinator

- (void)hostViewControllerDidActivate:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_2600D2D6C(v4);
}

- (void)hostViewControllerWillDeactivate:(id)a3 error:(id)a4
{
  v6 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_connection);
  id v10 = a3;
  v7 = self;
  id v8 = a4;
  objc_msgSend(v6, sel_invalidate);
  v9 = *(void (**)(void))((char *)&v7->super.isa
                                     + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_remoteConnectionDidChange);
  if (v9)
  {
    swift_retain();
    v9(0);
    sub_2600D5174((uint64_t)v9);
  }
}

- (_TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator)init
{
  result = (_TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_connection));
  sub_2600D5174(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_remoteConnectionDidChange));
  sub_2600D5280((uint64_t)self + OBJC_IVAR____TtCV21TranslationAPISupport20AppExtensionHostView15HostCoordinator_identity, (uint64_t *)&unk_26A8664D0);
}

@end