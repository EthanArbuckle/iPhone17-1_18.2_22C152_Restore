@interface MNNavigationServiceCallback_DidUpdateVehicleParkingInfo
+ (BOOL)supportsSecureCoding;
- (MNNavigationServiceCallback_DidUpdateVehicleParkingInfo)initWithCoder:(id)a3;
- (MNVehicleParkingInfo)vehicleParkingInfo;
- (unint64_t)type;
- (void)encodeWithCoder:(id)a3;
- (void)setVehicleParkingInfo:(id)a3;
@end

@implementation MNNavigationServiceCallback_DidUpdateVehicleParkingInfo

- (unint64_t)type
{
  return 13;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  v5.receiver = self;
  v5.super_class = (Class)MNNavigationServiceCallback_DidUpdateVehicleParkingInfo;
  id v4 = a3;
  [(MNNavigationServiceCallbackParameters *)&v5 encodeWithCoder:v4];
  objc_msgSend(v4, "encodeObject:forKey:", self->_vehicleParkingInfo, @"_vehicleParkingInfo", v5.receiver, v5.super_class);
}

- (MNNavigationServiceCallback_DidUpdateVehicleParkingInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)MNNavigationServiceCallback_DidUpdateVehicleParkingInfo;
  objc_super v5 = [(MNNavigationServiceCallbackParameters *)&v10 initWithCoder:v4];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_vehicleParkingInfo"];
    vehicleParkingInfo = v5->_vehicleParkingInfo;
    v5->_vehicleParkingInfo = (MNVehicleParkingInfo *)v6;

    v8 = v5;
  }

  return v5;
}

- (MNVehicleParkingInfo)vehicleParkingInfo
{
  return self->_vehicleParkingInfo;
}

- (void)setVehicleParkingInfo:(id)a3
{
}

- (void).cxx_destruct
{
}

@end