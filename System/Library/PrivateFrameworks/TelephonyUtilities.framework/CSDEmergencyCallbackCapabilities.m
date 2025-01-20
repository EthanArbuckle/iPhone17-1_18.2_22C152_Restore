@interface CSDEmergencyCallbackCapabilities
- (BOOL)emergencyCallbackPossible;
- (CSDEmergencyCallbackCapabilities)init;
- (CSDEmergencyCallbackCapabilities)initWithQueue:(id)a3;
- (id)emergencyCallbackCapabilitiesDidChange;
- (void)setEmergencyCallbackCapabilitiesDidChange:(id)a3;
@end

@implementation CSDEmergencyCallbackCapabilities

- (BOOL)emergencyCallbackPossible
{
  v2 = self;
  char v3 = sub_100207040();

  return v3 & 1;
}

- (id)emergencyCallbackCapabilitiesDidChange
{
  uint64_t v2 = sub_100207204();
  if (v2)
  {
    v6[4] = v2;
    v6[5] = v3;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 1107296256;
    v6[2] = sub_1002C2C88;
    v6[3] = &unk_10050C868;
    v4 = _Block_copy(v6);
    swift_release();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)setEmergencyCallbackCapabilitiesDidChange:(id)a3
{
  v4 = _Block_copy(a3);
  if (v4)
  {
    uint64_t v5 = swift_allocObject();
    *(void *)(v5 + 16) = v4;
    v4 = sub_1002084D0;
  }
  else
  {
    uint64_t v5 = 0;
  }
  v6 = self;
  sub_1002072EC((uint64_t)v4, v5);
}

- (CSDEmergencyCallbackCapabilities)initWithQueue:(id)a3
{
  return (CSDEmergencyCallbackCapabilities *)sub_10020730C(a3);
}

- (CSDEmergencyCallbackCapabilities)init
{
}

- (void).cxx_destruct
{
  sub_100208490(*(uint64_t *)((char *)&self->super.isa
                           + OBJC_IVAR___CSDEmergencyCallbackCapabilities_emergencyCallbackCapabilitiesDidChange));
  swift_release();
  swift_release();
  swift_release();

  swift_unknownObjectRelease();

  swift_release();
}

@end