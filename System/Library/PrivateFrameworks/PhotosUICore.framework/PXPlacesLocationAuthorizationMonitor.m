@interface PXPlacesLocationAuthorizationMonitor
+ (PXPlacesLocationAuthorizationMonitor)sharedInstance;
- (PXPlacesLocationAuthorizationMonitor)init;
- (void)locationManagerDidChangeAuthorization:(id)a3;
@end

@implementation PXPlacesLocationAuthorizationMonitor

+ (PXPlacesLocationAuthorizationMonitor)sharedInstance
{
  if (qword_1E98506A0 != -1) {
    swift_once();
  }
  v2 = (void *)qword_1E9850698;
  return (PXPlacesLocationAuthorizationMonitor *)v2;
}

- (PXPlacesLocationAuthorizationMonitor)init
{
  uint64_t ObjectType = swift_getObjectType();
  v3 = (PXPlacesLocationAuthorizationMonitor *)(*(uint64_t (**)(id))(ObjectType + 128))(objc_msgSend(objc_allocWithZone(MEMORY[0x1E4F1E600]), sel_init));
  swift_deallocPartialClassInstance();
  return v3;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___PXPlacesLocationAuthorizationMonitor__authorizationStatus;
  uint64_t v4 = sub_1AA64A7A0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PXPlacesLocationAuthorizationMonitor_observable);
}

- (void)locationManagerDidChangeAuthorization:(id)a3
{
  id v4 = a3;
  v5 = self;
  _s12PhotosUICore34PlacesLocationAuthorizationMonitorC024locationManagerDidChangeE0yySo010CLLocationH0CF_0();
}

@end