@interface STSVehicleReport
+ (BOOL)supportsSecureCoding;
- (BOOL)isFunctionInProgress:(id)a3;
- (BOOL)isFunctionSupported:(id)a3;
- (BOOL)supportsSecureRanging;
- (NFVehicleReport)vehicleReport;
- (NSArray)functionsInProgress;
- (NSArray)supportedFunctions;
- (NSString)keyIdentifier;
- (STSVehicleReport)initWithCoder:(id)a3;
- (id)description;
- (id)getStatusForFunction:(id)a3;
- (id)initVehicleReport:(id)a3;
- (void)encodeWithCoder:(id)a3;
- (void)setVehicleReport:(id)a3;
@end

@implementation STSVehicleReport

- (id)initVehicleReport:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSVehicleReport;
  v6 = [(STSVehicleReport *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_vehicleReport, a3);
  }

  return v7;
}

- (BOOL)isFunctionSupported:(id)a3
{
  id v4 = a3;
  id v5 = [(STSVehicleReport *)self vehicleReport];
  char v6 = [v5 isRKEFunctionSupported:v4];

  return v6;
}

- (NSArray)supportedFunctions
{
  v2 = [(STSVehicleReport *)self vehicleReport];
  v3 = [v2 getSupportedRKEFunctions];

  return (NSArray *)v3;
}

- (BOOL)isFunctionInProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(STSVehicleReport *)self vehicleReport];
  char v6 = [v5 isRKEFunctionInProgress:v4];

  return v6;
}

- (NSArray)functionsInProgress
{
  v2 = [(STSVehicleReport *)self vehicleReport];
  v3 = [v2 getRKEFunctionsInProgress];

  return (NSArray *)v3;
}

- (id)getStatusForFunction:(id)a3
{
  id v4 = a3;
  id v5 = [(STSVehicleReport *)self vehicleReport];
  char v6 = [v5 getStatusForRKEFunction:v4];

  return v6;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(STSVehicleReport *)self vehicleReport];
  [v4 encodeObject:v5 forKey:@"stsVehicleReport"];
}

- (STSVehicleReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)STSVehicleReport;
  id v5 = [(STSVehicleReport *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"stsVehicleReport"];
    vehicleReport = v5->_vehicleReport;
    v5->_vehicleReport = (NFVehicleReport *)v6;
  }
  return v5;
}

- (NSString)keyIdentifier
{
  v2 = [(STSVehicleReport *)self vehicleReport];
  v3 = [v2 keyIdentifier];

  return (NSString *)v3;
}

- (id)description
{
  v2 = [(STSVehicleReport *)self vehicleReport];
  v3 = [v2 description];

  return v3;
}

- (BOOL)supportsSecureRanging
{
  return self->_supportsSecureRanging;
}

- (NFVehicleReport)vehicleReport
{
  return self->_vehicleReport;
}

- (void)setVehicleReport:(id)a3
{
}

- (void).cxx_destruct
{
}

@end