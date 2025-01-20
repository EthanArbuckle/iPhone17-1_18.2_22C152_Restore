@interface FigCameraBackedDeviceSensorObserver
- (_TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver)init;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4;
- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4;
- (void)dealloc;
@end

@implementation FigCameraBackedDeviceSensorObserver

- (void)dealloc
{
  v2 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver_cameraViewfinder);
  v3 = self;
  objc_msgSend(v2, sel_stop);
  v4.receiver = v3;
  v4.super_class = (Class)type metadata accessor for FigCameraBackedDeviceSensorObserver();
  [(FigCameraBackedDeviceSensorObserver *)&v4 dealloc];
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR____TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver__sensorsInUse;
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_26A537558);
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver_cameraViewfinderDelegateQueue));
  v5 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver_cameraViewfinder);
}

- (_TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver)init
{
  return (_TtC16ScreenSharingKit35FigCameraBackedDeviceSensorObserver *)sub_25BACC98C();
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidBegin:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25BACD1B4(a4);
}

- (void)cameraViewfinder:(id)a3 viewfinderSessionDidEnd:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  sub_25BACD5A4(a4);
}

@end