@interface ManagedConfigRestrictionProvider
- (_TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332ManagedConfigRestrictionProvider)init;
- (void)dealloc;
- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4;
@end

@implementation ManagedConfigRestrictionProvider

- (_TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332ManagedConfigRestrictionProvider)init
{
  return (_TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332ManagedConfigRestrictionProvider *)sub_1C7CB87FC();
}

- (void)profileConnectionDidReceiveEffectiveSettingsChangedNotification:(id)a3 userInfo:(id)a4
{
  if (a4) {
    sub_1C7D32C60();
  }
  id v6 = a3;
  v7 = self;
  sub_1C7CB8D64();

  swift_bridgeObjectRelease();
}

- (void)dealloc
{
}

- (void).cxx_destruct
{
  swift_release();
  swift_release();
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC11SessionCoreP33_03222CA904BB2C7146C40B12EAF3EEE332ManagedConfigRestrictionProvider_profileConnection));
  swift_bridgeObjectRelease();
}

@end