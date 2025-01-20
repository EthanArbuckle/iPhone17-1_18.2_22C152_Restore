@interface PKProvisioningCarKeyStepTrackKeyTrackedPass
+ (BOOL)supportsSecureCoding;
+ (void)setSupportsSecureCoding:(BOOL)a3;
- (PKProvisioningCarKeyStepTrackKeyTrackedPass)init;
- (PKProvisioningCarKeyStepTrackKeyTrackedPass)initWithCoder:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKProvisioningCarKeyStepTrackKeyTrackedPass

+ (BOOL)supportsSecureCoding
{
  return byte_1E92BE4E0;
}

+ (void)setSupportsSecureCoding:(BOOL)a3
{
  byte_1E92BE4E0 = a3;
}

- (PKProvisioningCarKeyStepTrackKeyTrackedPass)initWithCoder:(id)a3
{
  return (PKProvisioningCarKeyStepTrackKeyTrackedPass *)ProvisioningCarKeyStepTrackKey.TrackedPass.init(coder:)(a3);
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_190FB87F8(v4);
}

- (PKProvisioningCarKeyStepTrackKeyTrackedPass)init
{
  result = (PKProvisioningCarKeyStepTrackKeyTrackedPass *)_swift_stdlib_reportUnimplementedInitializer();
  __break(1u);
  return result;
}

- (void).cxx_destruct
{
  v3 = (char *)self + OBJC_IVAR___PKProvisioningCarKeyStepTrackKeyTrackedPass_passURL;
  uint64_t v4 = sub_1915EEAA0();
  (*(void (**)(char *, uint64_t))(*(void *)(v4 - 8) + 8))(v3, v4);
  v5 = *(Class *)((char *)&self->super.isa + OBJC_IVAR___PKProvisioningCarKeyStepTrackKeyTrackedPass_subcredential);
}

@end