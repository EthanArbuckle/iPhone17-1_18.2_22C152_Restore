@interface FindDeviceAndPlaySoundIntentHandler
- (_TtC10SiriFindMy35FindDeviceAndPlaySoundIntentHandler)init;
- (id)handlerForIntent:(id)a3;
- (void)confirmFindDeviceAndPlaySound:(id)a3 completion:(id)a4;
- (void)handleFindDeviceAndPlaySound:(id)a3 completion:(id)a4;
- (void)resolveDevicesForFindDeviceAndPlaySound:(id)a3 withCompletion:(id)a4;
@end

@implementation FindDeviceAndPlaySoundIntentHandler

- (id)handlerForIntent:(id)a3
{
  sub_1D459F77C(v5);
  __swift_project_boxed_opaque_existential_1(v5, v5[3]);
  v3 = (void *)sub_1D4640338();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)v5);

  return v3;
}

- (void)resolveDevicesForFindDeviceAndPlaySound:(id)a3 withCompletion:(id)a4
{
}

- (void)confirmFindDeviceAndPlaySound:(id)a3 completion:(id)a4
{
}

- (void)handleFindDeviceAndPlaySound:(id)a3 completion:(id)a4
{
}

- (_TtC10SiriFindMy35FindDeviceAndPlaySoundIntentHandler)init
{
}

- (void).cxx_destruct
{
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy35FindDeviceAndPlaySoundIntentHandler_deviceState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy35FindDeviceAndPlaySoundIntentHandler_appInstalledState);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC10SiriFindMy35FindDeviceAndPlaySoundIntentHandler_deviceLockStateProvider);

  swift_release();
}

@end