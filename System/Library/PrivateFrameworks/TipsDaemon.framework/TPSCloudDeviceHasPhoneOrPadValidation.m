@interface TPSCloudDeviceHasPhoneOrPadValidation
- (TPSCloudDeviceHasPhoneOrPadValidation)init;
- (TPSCloudDeviceHasPhoneOrPadValidation)initWithTargetContext:(id)a3;
- (void)validateWithCompletion:(id)a3;
@end

@implementation TPSCloudDeviceHasPhoneOrPadValidation

- (void)validateWithCompletion:(id)a3
{
  v4 = _Block_copy(a3);
  _Block_copy(v4);
  v5 = self;
  sub_1E4515638(v5, (uint64_t)v4);
  _Block_release(v4);
  _Block_release(v4);
}

- (TPSCloudDeviceHasPhoneOrPadValidation)initWithTargetContext:(id)a3
{
  sub_1E451B818();
  v4 = (void *)sub_1E451B7F8();
  swift_bridgeObjectRelease();
  v7.receiver = self;
  v7.super_class = (Class)type metadata accessor for CloudDeviceHasPhoneOrPadValidation();
  v5 = [(TPSTargetingValidation *)&v7 initWithTargetContext:v4];

  return v5;
}

- (TPSCloudDeviceHasPhoneOrPadValidation)init
{
  v3.receiver = self;
  v3.super_class = (Class)type metadata accessor for CloudDeviceHasPhoneOrPadValidation();
  return [(TPSCloudDeviceHasPhoneOrPadValidation *)&v3 init];
}

@end