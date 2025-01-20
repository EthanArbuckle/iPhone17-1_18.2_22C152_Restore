@interface DeviceResolutionService
- (_TtC27SiriVirtualDeviceResolution23DeviceResolutionService)init;
- (void)homeManagerDidUpdateDataSyncInProgress:(id)a3;
- (void)homeManagerDidUpdateHomes:(id)a3;
@end

@implementation DeviceResolutionService

- (_TtC27SiriVirtualDeviceResolution23DeviceResolutionService)init
{
  return (_TtC27SiriVirtualDeviceResolution23DeviceResolutionService *)sub_1C9DEF4C4();
}

- (void)homeManagerDidUpdateHomes:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C9DFD840();
}

- (void)homeManagerDidUpdateDataSyncInProgress:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_1C9DFD9F4();
}

- (void).cxx_destruct
{
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManagerReadyGroup));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_queue));
  objc_release(*(id *)((char *)&self->super.isa
                     + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_homeManager));
  sub_1C9E026A4((uint64_t)self + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService_endpointUUID, &qword_1EA5C7328);
  v3 = *(Class *)((char *)&self->super.isa
                + OBJC_IVAR____TtC27SiriVirtualDeviceResolution23DeviceResolutionService__xpcConnection);
}

@end