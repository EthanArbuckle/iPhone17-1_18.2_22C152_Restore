@interface SharingBackedAuthenticationPrimitives
- (_TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives)init;
- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4;
- (void)manager:(id)a3 didDisableAuthenticationForSessionWithID:(id)a4;
- (void)manager:(id)a3 didEnableAuthenticationForSessionWithID:(id)a4;
- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didFailToDisableDeviceForSessionWithID:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didFailToEnableDeviceForSessionWithID:(id)a4 error:(id)a5;
- (void)manager:(id)a3 didReceiveRequestToApproveForSessionID:(id)a4 info:(id)a5 completionHandler:(id)a6;
- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4;
@end

@implementation SharingBackedAuthenticationPrimitives

- (_TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives)init
{
  result = (_TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  sub_25BAEA03C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_continuityDevice);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_authenticationManager));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_authenticationQueue));
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_trustDeviceContinuation, &qword_26A537E18);
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_unlockDeviceContinuation, &qword_26A537E18);
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_unlockGeneration, &qword_26A537E20);
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_resetGeneration, &qword_26A537E20);
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_disableDeviceContinuation, &qword_26A537E18);
  v3 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_approveByMacDelegate;
  sub_25BAF3FA4((uint64_t)v3);
}

- (void)manager:(id)a3 didEnableAuthenticationForSessionWithID:(id)a4
{
}

- (void)manager:(id)a3 didFailToEnableDeviceForSessionWithID:(id)a4 error:(id)a5
{
  uint64_t v8 = sub_25BC07818();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BC077E8();
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  sub_25BAF0BD0((uint64_t)v11, v13);

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)manager:(id)a3 didStartAuthenticationForSessionWithID:(id)a4
{
}

- (void)manager:(id)a3 didCompleteAuthenticationForSessionWithID:(id)a4
{
}

- (void)manager:(id)a3 didFailAuthenticationForSessionWithID:(id)a4 error:(id)a5
{
  uint64_t v8 = sub_25BC07818();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BC077E8();
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  sub_25BAF3088((uint64_t)v11, v13, (uint64_t)&OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_unlockDeviceContinuation, &OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_unlockGeneration, "Failed to unlock paired iPhone with error: %{public}s", "Authentication failed for a different unlock generation: %{public}s due to: %{public}s", "unlockDeviceContinuation is not available.");

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

- (void)manager:(id)a3 didReceiveRequestToApproveForSessionID:(id)a4 info:(id)a5 completionHandler:(id)a6
{
  uint64_t v10 = sub_25BC07818();
  uint64_t v11 = *(void *)(v10 - 8);
  MEMORY[0x270FA5388](v10);
  id v13 = (char *)&v19 - ((v12 + 15) & 0xFFFFFFFFFFFFFFF0);
  v14 = _Block_copy(a6);
  sub_25BC077E8();
  uint64_t v15 = swift_allocObject();
  *(void *)(v15 + 16) = v14;
  id v16 = a3;
  id v17 = a5;
  v18 = self;
  sub_25BAF2130((uint64_t)v13, v17, (uint64_t)sub_25BAF3F9C, v15);

  swift_release();
  (*(void (**)(char *, uint64_t))(v11 + 8))(v13, v10);
}

- (void)manager:(id)a3 didDisableAuthenticationForSessionWithID:(id)a4
{
}

- (void)manager:(id)a3 didFailToDisableDeviceForSessionWithID:(id)a4 error:(id)a5
{
  uint64_t v8 = sub_25BC07818();
  uint64_t v9 = *(void *)(v8 - 8);
  MEMORY[0x270FA5388](v8);
  uint64_t v11 = (char *)&v15 - ((v10 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_25BC077E8();
  id v12 = a3;
  id v13 = a5;
  v14 = self;
  sub_25BAF3088((uint64_t)v11, v13, (uint64_t)&OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_disableDeviceContinuation, &OBJC_IVAR____TtC16ScreenSharingKit37SharingBackedAuthenticationPrimitives_resetGeneration, "Failed to disable paired iPhone with error: %{public}s", "Disable device failed for a different reset generation: %{public}s due to: %{public}s", "disableDeviceContinuation is not available.");

  (*(void (**)(char *, uint64_t))(v9 + 8))(v11, v8);
}

@end