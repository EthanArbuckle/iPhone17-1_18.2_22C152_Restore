@interface CLPVehicleType
- (id)initWithCLMotionActivity:(CLMotionActivity *)a3;
@end

@implementation CLPVehicleType

- (id)initWithCLMotionActivity:(CLMotionActivity *)a3
{
  v16.receiver = self;
  v16.super_class = (Class)CLPVehicleType;
  v13 = [(CLPVehicleType *)&v16 init];
  if (v13)
  {
    BOOL v14 = +[CLPMeta isInIndia]
       && CLMotionActivity::isInVehicle(a3)
       && a3->vehicleType == 3;
    [(CLPVehicleType *)v13 setIsMotorcycle:v14];
  }
  return v13;
}

@end