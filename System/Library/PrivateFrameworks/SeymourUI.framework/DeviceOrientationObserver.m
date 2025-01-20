@interface DeviceOrientationObserver
- (void)deviceDidRotateWithNotification:(id)a3;
@end

@implementation DeviceOrientationObserver

- (void)deviceDidRotateWithNotification:(id)a3
{
  uint64_t v4 = __swift_instantiateConcreteTypeFromMangledName(&qword_268A12320);
  MEMORY[0x270FA5388](v4 - 8);
  v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  if (a3)
  {
    sub_23A7F5F18();
    uint64_t v7 = sub_23A7F5F48();
    (*(void (**)(char *, void, uint64_t, uint64_t))(*(void *)(v7 - 8) + 56))(v6, 0, 1, v7);
  }
  else
  {
    uint64_t v8 = sub_23A7F5F48();
    (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v8 - 8) + 56))(v6, 1, 1, v8);
  }
  swift_retain();
  sub_239F72528();
  swift_release();
  sub_239F72774((uint64_t)v6);
}

@end