@interface MNArrivalInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isInArrivalState;
- (BOOL)isInParkingState;
- (GEOComposedWaypoint)destination;
- (MNArrivalInfo)initWithCoder:(id)a3;
- (MNVehicleParkingInfo)vehicleParkingInfo;
- (id)description;
- (int64_t)arrivalState;
- (unint64_t)legIndex;
- (void)encodeWithCoder:(id)a3;
- (void)setArrivalState:(int64_t)a3;
- (void)setDestination:(id)a3;
- (void)setLegIndex:(unint64_t)a3;
- (void)setVehicleParkingInfo:(id)a3;
@end

@implementation MNArrivalInfo

- (void)setArrivalState:(int64_t)a3
{
  self->_arrivalState = a3;
}

- (void)setLegIndex:(unint64_t)a3
{
  self->_legIndex = a3;
}

- (void)setDestination:(id)a3
{
}

- (void)setVehicleParkingInfo:(id)a3
{
}

- (BOOL)isInArrivalState
{
  return (unint64_t)(self->_arrivalState - 2) < 3;
}

- (BOOL)isInParkingState
{
  return (self->_arrivalState < 7uLL) & (0x62u >> self->_arrivalState);
}

- (id)description
{
  v3 = [MEMORY[0x1E4F1CA48] array];
  unint64_t arrivalState = self->_arrivalState;
  if (arrivalState > 6) {
    v5 = @"MNArrivalState_Unknown";
  }
  else {
    v5 = off_1E60F8560[arrivalState];
  }
  v6 = [NSString stringWithFormat:@"MNArrivalInfo: %@", v5];
  [v3 addObject:v6];

  v7 = objc_msgSend(NSString, "stringWithFormat:", @"legIndex: %d", self->_legIndex);
  [v3 addObject:v7];

  vehicleParkingInfo = self->_vehicleParkingInfo;
  if (vehicleParkingInfo)
  {
    v9 = [(MNVehicleParkingInfo *)vehicleParkingInfo description];
    [v3 addObject:v9];
  }
  v10 = [v3 componentsJoinedByString:@", "];

  return v10;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  int64_t arrivalState = self->_arrivalState;
  id v5 = a3;
  [v5 encodeInteger:arrivalState forKey:@"_arrivalState"];
  [v5 encodeInteger:self->_legIndex forKey:@"_legIndex"];
  [v5 encodeObject:self->_destination forKey:@"_destination"];
  [v5 encodeObject:self->_vehicleParkingInfo forKey:@"_vehicleParkingInfo"];
}

- (MNArrivalInfo)initWithCoder:(id)a3
{
  id v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)MNArrivalInfo;
  id v5 = [(MNArrivalInfo *)&v12 init];
  if (v5)
  {
    v5->_int64_t arrivalState = [v4 decodeIntegerForKey:@"_arrivalState"];
    v5->_legIndex = [v4 decodeIntegerForKey:@"_legIndex"];
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_destination"];
    destination = v5->_destination;
    v5->_destination = (GEOComposedWaypoint *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"_vehicleParkingInfo"];
    vehicleParkingInfo = v5->_vehicleParkingInfo;
    v5->_vehicleParkingInfo = (MNVehicleParkingInfo *)v8;

    v10 = v5;
  }

  return v5;
}

- (int64_t)arrivalState
{
  return self->_arrivalState;
}

- (unint64_t)legIndex
{
  return self->_legIndex;
}

- (GEOComposedWaypoint)destination
{
  return self->_destination;
}

- (MNVehicleParkingInfo)vehicleParkingInfo
{
  return self->_vehicleParkingInfo;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vehicleParkingInfo, 0);
  objc_storeStrong((id *)&self->_destination, 0);
}

@end