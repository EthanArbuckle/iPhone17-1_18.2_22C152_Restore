@interface PKFelicaShinkansenTrain
+ (BOOL)supportsSecureCoding;
- (NSData)destinationStation;
- (NSData)originStation;
- (NSNumber)arrivalTime;
- (NSNumber)carNumber;
- (NSNumber)departureTime;
- (NSNumber)seatNumber;
- (NSNumber)seatRow;
- (NSString)trainName;
- (PKFelicaShinkansenTrain)init;
- (PKFelicaShinkansenTrain)initWithCoder:(id)a3;
- (PKFelicaShinkansenTrain)initWithDictionary:(id)a3;
- (void)encodeWithCoder:(id)a3;
@end

@implementation PKFelicaShinkansenTrain

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (PKFelicaShinkansenTrain)init
{
  return 0;
}

- (PKFelicaShinkansenTrain)initWithDictionary:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v44.receiver = self;
    v44.super_class = (Class)PKFelicaShinkansenTrain;
    v5 = [(PKFelicaShinkansenTrain *)&v44 init];
    if (v5)
    {
      v6 = [v4 objectForKeyedSubscript:@"NFTrainName"];
      if (v6)
      {
        uint64_t v7 = [[NSString alloc] initWithData:v6 encoding:8];
        trainName = v5->_trainName;
        v5->_trainName = (NSString *)v7;
      }
      else
      {
        trainName = v5->_trainName;
        v5->_trainName = 0;
      }

      v10 = [v4 objectForKeyedSubscript:@"NFStartStationData"];
      uint64_t v11 = [v10 copy];
      originStation = v5->_originStation;
      v5->_originStation = (NSData *)v11;

      v13 = [v4 objectForKeyedSubscript:@"NFEndStationData"];
      uint64_t v14 = [v13 copy];
      destinationStation = v5->_destinationStation;
      v5->_destinationStation = (NSData *)v14;

      v16 = [v4 objectForKeyedSubscript:@"NFDepartureHour"];
      v17 = [v4 objectForKeyedSubscript:@"NFDepartureMinute"];
      v18 = [v4 objectForKeyedSubscript:@"NFArrivalHour"];
      uint64_t v19 = [v4 objectForKeyedSubscript:@"NFArrivalMinute"];
      v20 = (void *)v19;
      if (v16 || v17 || v18 || v19)
      {
        v43 = v6;
        v21 = NSNumber;
        id v22 = v17;
        uint64_t v23 = [v16 integerValue];
        uint64_t v24 = [v22 integerValue];

        uint64_t v25 = [v21 numberWithInteger:v24 + 60 * v23];
        departureTime = v5->_departureTime;
        v5->_departureTime = (NSNumber *)v25;

        v27 = NSNumber;
        id v28 = v20;
        uint64_t v29 = [v18 integerValue];
        uint64_t v30 = [v28 integerValue];

        v6 = v43;
        uint64_t v31 = [v27 numberWithInteger:v30 + 60 * v29];
        arrivalTime = v5->_arrivalTime;
        v5->_arrivalTime = (NSNumber *)v31;
      }
      v33 = [v4 objectForKeyedSubscript:@"NFCarNumber"];
      uint64_t v34 = [v33 copy];
      carNumber = v5->_carNumber;
      v5->_carNumber = (NSNumber *)v34;

      v36 = [v4 objectForKeyedSubscript:@"NFSeatNumber"];
      uint64_t v37 = [v36 copy];
      seatRow = v5->_seatRow;
      v5->_seatRow = (NSNumber *)v37;

      v39 = [v4 objectForKeyedSubscript:@"NFSeatType"];
      uint64_t v40 = [v39 copy];
      seatNumber = v5->_seatNumber;
      v5->_seatNumber = (NSNumber *)v40;
    }
    self = v5;
    v9 = self;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (PKFelicaShinkansenTrain)initWithCoder:(id)a3
{
  id v4 = a3;
  v23.receiver = self;
  v23.super_class = (Class)PKFelicaShinkansenTrain;
  v5 = [(PKFelicaShinkansenTrain *)&v23 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"originStationCode"];
    originStation = v5->_originStation;
    v5->_originStation = (NSData *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"destinationStationCode"];
    destinationStation = v5->_destinationStation;
    v5->_destinationStation = (NSData *)v8;

    uint64_t v10 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"departureTime"];
    departureTime = v5->_departureTime;
    v5->_departureTime = (NSNumber *)v10;

    uint64_t v12 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"arrivalTime"];
    arrivalTime = v5->_arrivalTime;
    v5->_arrivalTime = (NSNumber *)v12;

    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"trainName"];
    trainName = v5->_trainName;
    v5->_trainName = (NSString *)v14;

    uint64_t v16 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"carNumber"];
    carNumber = v5->_carNumber;
    v5->_carNumber = (NSNumber *)v16;

    uint64_t v18 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seatRow"];
    seatRow = v5->_seatRow;
    v5->_seatRow = (NSNumber *)v18;

    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"seatNumber"];
    seatNumber = v5->_seatNumber;
    v5->_seatNumber = (NSNumber *)v20;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  originStation = self->_originStation;
  id v5 = a3;
  [v5 encodeObject:originStation forKey:@"originStationCode"];
  [v5 encodeObject:self->_destinationStation forKey:@"destinationStationCode"];
  [v5 encodeObject:self->_departureTime forKey:@"departureTime"];
  [v5 encodeObject:self->_arrivalTime forKey:@"arrivalTime"];
  [v5 encodeObject:self->_trainName forKey:@"trainName"];
  [v5 encodeObject:self->_carNumber forKey:@"carNumber"];
  [v5 encodeObject:self->_seatRow forKey:@"seatRow"];
  [v5 encodeObject:self->_seatNumber forKey:@"seatNumber"];
}

- (NSData)originStation
{
  return self->_originStation;
}

- (NSData)destinationStation
{
  return self->_destinationStation;
}

- (NSNumber)departureTime
{
  return self->_departureTime;
}

- (NSNumber)arrivalTime
{
  return self->_arrivalTime;
}

- (NSString)trainName
{
  return self->_trainName;
}

- (NSNumber)carNumber
{
  return self->_carNumber;
}

- (NSNumber)seatRow
{
  return self->_seatRow;
}

- (NSNumber)seatNumber
{
  return self->_seatNumber;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_seatNumber, 0);
  objc_storeStrong((id *)&self->_seatRow, 0);
  objc_storeStrong((id *)&self->_carNumber, 0);
  objc_storeStrong((id *)&self->_trainName, 0);
  objc_storeStrong((id *)&self->_arrivalTime, 0);
  objc_storeStrong((id *)&self->_departureTime, 0);
  objc_storeStrong((id *)&self->_destinationStation, 0);
  objc_storeStrong((id *)&self->_originStation, 0);
}

@end