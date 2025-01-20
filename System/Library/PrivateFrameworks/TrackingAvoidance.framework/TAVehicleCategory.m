@interface TAVehicleCategory
+ (unint64_t)speculateTAVehicleCategoryTypeFromGeoNavigationNotification:(id)a3;
+ (unint64_t)speculateTAVehicleCategoryTypeFromVehicleStateNotification:(id)a3;
- (NSDate)date;
- (TAVehicleCategory)initWithTAGeoNavigationNotification:(id)a3;
- (TAVehicleCategory)initWithTAVehicularStateNotification:(id)a3;
- (TAVehicleCategory)initWithVehicleCategoryType:(unint64_t)a3 andDate:(id)a4;
- (unint64_t)vehicleCategoryType;
@end

@implementation TAVehicleCategory

+ (unint64_t)speculateTAVehicleCategoryTypeFromVehicleStateNotification:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 vehicularState];
  unint64_t v5 = v4;
  if (v4 != 1)
  {
    if (v4 == 2)
    {
      if (([v3 vehicularHints] & 0x10) != 0)
      {
        unint64_t v5 = 2;
      }
      else if ([v3 operatorState] == 1)
      {
        unint64_t v5 = 3;
      }
      else
      {
        unint64_t v5 = 0;
      }
    }
    else
    {
      unint64_t v5 = 0;
    }
  }

  return v5;
}

+ (unint64_t)speculateTAVehicleCategoryTypeFromGeoNavigationNotification:(id)a3
{
  id v3 = a3;
  if ([v3 navState] == 2) {
    unint64_t v4 = 2 * ([v3 transportType] == 0);
  }
  else {
    unint64_t v4 = 0;
  }

  return v4;
}

- (TAVehicleCategory)initWithVehicleCategoryType:(unint64_t)a3 andDate:(id)a4
{
  id v6 = a4;
  v13.receiver = self;
  v13.super_class = (Class)TAVehicleCategory;
  v7 = [(TAVehicleCategory *)&v13 init];
  v8 = v7;
  if (v7)
  {
    if (!v6)
    {
      v11 = 0;
      goto LABEL_6;
    }
    v7->_vehicleCategoryType = a3;
    uint64_t v9 = [v6 copy];
    date = v8->_date;
    v8->_date = (NSDate *)v9;
  }
  v11 = v8;
LABEL_6:

  return v11;
}

- (TAVehicleCategory)initWithTAVehicularStateNotification:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TAVehicleCategory;
  unint64_t v5 = [(TAVehicleCategory *)&v10 init];
  if (v5)
  {
    v5->_vehicleCategoryType = +[TAVehicleCategory speculateTAVehicleCategoryTypeFromVehicleStateNotification:v4];
    id v6 = [v4 getDate];
    uint64_t v7 = [v6 copy];
    date = v5->_date;
    v5->_date = (NSDate *)v7;
  }
  return v5;
}

- (TAVehicleCategory)initWithTAGeoNavigationNotification:(id)a3
{
  id v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)TAVehicleCategory;
  unint64_t v5 = [(TAVehicleCategory *)&v10 init];
  if (v5)
  {
    v5->_vehicleCategoryType = +[TAVehicleCategory speculateTAVehicleCategoryTypeFromGeoNavigationNotification:v4];
    id v6 = [v4 getDate];
    uint64_t v7 = [v6 copy];
    date = v5->_date;
    v5->_date = (NSDate *)v7;
  }
  return v5;
}

- (NSDate)date
{
  return self->_date;
}

- (unint64_t)vehicleCategoryType
{
  return self->_vehicleCategoryType;
}

- (void).cxx_destruct
{
}

@end