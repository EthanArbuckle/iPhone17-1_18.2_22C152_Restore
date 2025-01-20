@interface CMVehicleStateData
+ (BOOL)supportsSecureCoding;
- (CMMotionTimeRange)timeRange;
- (CMVehicleStateData)initWithCoder:(id)a3;
- (CMVehicleStateData)initWithTimeRange:(id)a3 vehicleName:(id)a4 vehicleModelName:(id)a5 vehicleBluetoothAddress:(id)a6;
- (CMVehicleStateData)initWithTimestamp:(id)a3 state:(unint64_t)a4 hints:(unint64_t)a5;
- (NSString)deviceId;
- (NSString)vehicleBluetoothAddress;
- (NSString)vehicleModelName;
- (NSString)vehicleName;
- (id)copyWithZone:(_NSZone *)a3;
- (id)description;
- (unint64_t)vehicularHints;
- (unint64_t)vehicularState;
- (void)dealloc;
- (void)encodeWithCoder:(id)a3;
@end

@implementation CMVehicleStateData

- (CMVehicleStateData)initWithTimeRange:(id)a3 vehicleName:(id)a4 vehicleModelName:(id)a5 vehicleBluetoothAddress:(id)a6
{
  v12.receiver = self;
  v12.super_class = (Class)CMVehicleStateData;
  v10 = [(CMVehicleStateData *)&v12 init];
  if (v10)
  {
    *((void *)v10 + 1) = a3;
    *((void *)v10 + 2) = a4;
    *((void *)v10 + 3) = a5;
    *((void *)v10 + 4) = a6;
    *(_OWORD *)(v10 + 40) = xmmword_101D2E1E0;
  }
  return (CMVehicleStateData *)v10;
}

- (CMVehicleStateData)initWithTimestamp:(id)a3 state:(unint64_t)a4 hints:(unint64_t)a5
{
  v14.receiver = self;
  v14.super_class = (Class)CMVehicleStateData;
  v8 = [(CMVehicleStateData *)&v14 init];
  if (v8)
  {
    v9 = [CMMotionTimeRange alloc];
    [a3 timeIntervalSinceReferenceDate];
    double v11 = v10;
    [a3 timeIntervalSinceReferenceDate];
    v8->fTimeRange = [(CMMotionTimeRange *)v9 initWithStartDate:v11 endDate:v12];
    v8->fVehicleName = 0;
    v8->fVehicleModelName = 0;
    v8->fVehicleBluetoothAddress = 0;
    v8->fVehicularState = a4;
    v8->fVehicularHints = a5;
  }
  return v8;
}

- (void)dealloc
{
  v3.receiver = self;
  v3.super_class = (Class)CMVehicleStateData;
  [(CMVehicleStateData *)&v3 dealloc];
}

- (id)copyWithZone:(_NSZone *)a3
{
  v4 = (char *)[[objc_opt_class() allocWithZone:a3] init];
  if (v4)
  {
    *((void *)v4 + 1) = [(CMMotionTimeRange *)self->fTimeRange copy];
    *((void *)v4 + 2) = [(NSString *)self->fVehicleName copy];
    *((void *)v4 + 3) = [(NSString *)self->fVehicleModelName copy];
    *((void *)v4 + 4) = [(NSString *)self->fVehicleBluetoothAddress copy];
    *(_OWORD *)(v4 + 40) = *(_OWORD *)&self->fVehicularState;
  }
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (CMVehicleStateData)initWithCoder:(id)a3
{
  v6.receiver = self;
  v6.super_class = (Class)CMVehicleStateData;
  v4 = [(CMVehicleStateData *)&v6 init];
  if (v4)
  {
    v4->fTimeRange = (CMMotionTimeRange *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCMVehicleStateDataCodingKeyTimeRange"];
    v4->fVehicleName = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCMVehicleStateDataCodingKeyVehicleName"];
    v4->fVehicleModelName = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCMVehicleStateDataCodingKeyVehicleModelName"];
    v4->fVehicleBluetoothAddress = (NSString *)[a3 decodeObjectOfClass:objc_opt_class() forKey:@"kCMVehicleStateDataCodingKeyVehicleBluetoothAddress"];
    v4->fVehicularState = (unint64_t)[a3 decodeIntegerForKey:@"kCMVehicleStateDataCodingKeyState"];
    v4->fVehicularHints = (unint64_t)[a3 decodeIntegerForKey:@"kCMVehicleStateDataCodingKeyHints"];
  }
  return v4;
}

- (void)encodeWithCoder:(id)a3
{
  [a3 encodeObject:self->fTimeRange forKey:@"kCMVehicleStateDataCodingKeyTimeRange"];
  [a3 encodeObject:self->fVehicleName forKey:@"kCMVehicleStateDataCodingKeyVehicleName"];
  [a3 encodeObject:self->fVehicleModelName forKey:@"kCMVehicleStateDataCodingKeyVehicleModelName"];
  [a3 encodeObject:self->fVehicleBluetoothAddress forKey:@"kCMVehicleStateDataCodingKeyVehicleBluetoothAddress"];
  [a3 encodeInteger:self->fVehicularState forKey:@"kCMVehicleStateDataCodingKeyState"];
  unint64_t fVehicularHints = self->fVehicularHints;

  [a3 encodeInteger:fVehicularHints forKey:@"kCMVehicleStateDataCodingKeyHints"];
}

- (id)description
{
  objc_super v3 = (objc_class *)objc_opt_class();
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"%@,<startDate %@, endDate %@, deviceId %@, vehicleName %@, vehicleModelName %@, vehicleBluetoothAddress %@, state %@, hints %@>", NSStringFromClass(v3), [(CMMotionTimeRange *)[(CMVehicleStateData *)self timeRange] startDate], [(CMMotionTimeRange *)[(CMVehicleStateData *)self timeRange] endDate], [(CMVehicleStateData *)self deviceId], [(CMVehicleStateData *)self vehicleName], [(CMVehicleStateData *)self vehicleModelName], [(CMVehicleStateData *)self vehicleBluetoothAddress], +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [(CMVehicleStateData *)self vehicularState]), +[NSNumber numberWithUnsignedInteger:[(CMVehicleStateData *)self vehicularHints]]);
}

- (CMMotionTimeRange)timeRange
{
  return self->fTimeRange;
}

- (NSString)deviceId
{
  result = self->fVehicleName;
  if (!result) {
    return self->fVehicleBluetoothAddress;
  }
  return result;
}

- (NSString)vehicleName
{
  return self->fVehicleName;
}

- (NSString)vehicleModelName
{
  return self->fVehicleModelName;
}

- (NSString)vehicleBluetoothAddress
{
  return self->fVehicleBluetoothAddress;
}

- (unint64_t)vehicularState
{
  return self->fVehicularState;
}

- (unint64_t)vehicularHints
{
  return self->fVehicularHints;
}

@end