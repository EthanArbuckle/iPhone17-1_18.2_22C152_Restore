@interface AngelServer
- (_TtC16ScreenSharingKit11AngelServer)init;
- (void)currentCommandLineSessionStateWithCompletionHandler:(id)a3;
- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5;
- (void)pingWithCompletionHandler:(id)a3;
- (void)stopCommandLineSessionWithCompletionHandler:(id)a3;
@end

@implementation AngelServer

- (void)listener:(id)a3 didReceiveConnection:(id)a4 withContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  swift_unknownObjectRetain();
  v10 = self;
  sub_25BB0D5B8(v9, a5);

  swift_unknownObjectRelease();
}

- (void)pingWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A537E50);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25BC08928();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A538418;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A538420;
  v12[5] = v11;
  v13 = self;
  sub_25BB6B660((uint64_t)v7, (uint64_t)&unk_26A538428, (uint64_t)v12);
  swift_release();
}

- (void)stopCommandLineSessionWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A537E50);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25BC08928();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A5383E0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A5383E8;
  v12[5] = v11;
  v13 = self;
  sub_25BB6B660((uint64_t)v7, (uint64_t)&unk_26A5383F0, (uint64_t)v12);
  swift_release();
}

- (void)currentCommandLineSessionStateWithCompletionHandler:(id)a3
{
  uint64_t v5 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A537E50);
  MEMORY[0x270FA5388](v5 - 8);
  v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  id v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_25BC08928();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  v11 = (void *)swift_allocObject();
  v11[2] = 0;
  v11[3] = 0;
  v11[4] = &unk_26A5383B0;
  v11[5] = v9;
  v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_26A5383B8;
  v12[5] = v11;
  v13 = self;
  sub_25BB6B660((uint64_t)v7, (uint64_t)&unk_26A5383C0, (uint64_t)v12);
  swift_release();
}

- (_TtC16ScreenSharingKit11AngelServer)init
{
  result = (_TtC16ScreenSharingKit11AngelServer *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = *(void **)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_commandLineServiceSpecification
                                                      + 24];
  v4 = *(void **)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_commandLineServiceSpecification
                                                      + 32];
  swift_bridgeObjectRelease();

  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  swift_bridgeObjectRelease();
  sub_25BB27B3C(*(id *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentServerState));
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_telemetryVendor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_signpostVendor);

  swift_bridgeObjectRelease();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_sceneInteractorVendor);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_deviceInformationPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_sessionHistoryTracker);
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_companionDeviceID, &qword_26A537E20);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_bringupMicrophoneDeviceSensorPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_inSessionMicrophoneDeviceSensorPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_cameraDeviceSensorPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_deviceEligibilityPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_deviceRestrictionPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_accessibilityPrimitives);
  swift_release();
  swift_release();
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_continuityDevicePrimitives);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer____lazy_storage___commandLineListener));
  if (*(void *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_displayRegistrarVendor
                                                       + 16])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_displayRegistrarVendor);
  if (*(void *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_screenContinuityLiveActivityVendor
                                                       + 16])
    __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_screenContinuityLiveActivityVendor);
  swift_release();
  uint64_t v5 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer__bringUpDeviceSensorsInUse;
  uint64_t v6 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A537558);
  (*(void (**)(char *, uint64_t))(*(void *)(v6 - 8) + 8))(v5, v6);
  swift_unknownObjectRelease();
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_mediaTransportActivationContinuation, (uint64_t *)&unk_26A538400);
  swift_release();
  swift_release();
  swift_release();
  sub_25BB27E88(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration), *(void *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration], *(void *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 8], *(void *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 16], *(void *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 24], *(void *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 32], *(void *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 40], *(void *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 48], *(void *)&self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration+ 56], *(void *)&self->commandLineConnections[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration], *(void *)&self->currentServerState[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration], *(void *)&self->pongNumber[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration],
    *(void *)&self->telemetryVendor[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_clientConfiguration]);
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentDisplayRegistrar, &qword_26A538740);
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentSceneInteractor, &qword_26A538748);
  sub_25BAC335C((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentContinuityLiveActivity, &qword_26A538750);
  sub_25BB27F04(*(uint64_t *)((char *)&self->super.isa + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentSceneInteractorStep), self->commandLineServiceSpecification[OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_currentSceneInteractorStep]);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_mediaPlaybackStatusPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_taskSleepPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_userDefaultsPrimitives);
  __swift_destroy_boxed_opaque_existential_1((uint64_t)self + OBJC_IVAR____TtC16ScreenSharingKit11AngelServer_powerPrimitives);
  swift_release();
  swift_release();
  swift_release();
  swift_bridgeObjectRelease();
  swift_release();
  swift_release();
}

@end