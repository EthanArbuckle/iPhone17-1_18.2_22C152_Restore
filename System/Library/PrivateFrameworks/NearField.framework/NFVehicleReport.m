@interface NFVehicleReport
+ (BOOL)supportsSecureCoding;
- (BOOL)isRKEFunctionInProgress:(id)a3;
- (BOOL)isRKEFunctionSupported:(id)a3;
- (NFVehicleReport)initWithCoder:(id)a3;
- (NFVehicleReport)initWithSESVehicleReport:(id)a3;
- (NSString)keyIdentifier;
- (SESVehicleReport)vehicleReport;
- (id)description;
- (id)getRKEFunctionsInProgress;
- (id)getStatusForRKEFunction:(id)a3;
- (id)getSupportedRKEFunctions;
- (void)encodeWithCoder:(id)a3;
- (void)setVehicleReport:(id)a3;
@end

@implementation NFVehicleReport

- (NFVehicleReport)initWithSESVehicleReport:(id)a3
{
  id v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFVehicleReport;
  v6 = [(NFVehicleReport *)&v9 init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_vehicleReport, a3);
  }

  return v7;
}

- (BOOL)isRKEFunctionSupported:(id)a3
{
  id v4 = a3;
  id v5 = [(NFVehicleReport *)self vehicleReport];
  char v6 = [v5 isRKEFunctionSupported:v4];

  return v6;
}

- (id)getSupportedRKEFunctions
{
  v2 = [(NFVehicleReport *)self vehicleReport];
  v3 = [v2 getSupportedRKEFunctions];

  return v3;
}

- (BOOL)isRKEFunctionInProgress:(id)a3
{
  id v4 = a3;
  id v5 = [(NFVehicleReport *)self vehicleReport];
  char v6 = [v5 isRKEFunctionInProgress:v4];

  return v6;
}

- (id)getRKEFunctionsInProgress
{
  v2 = [(NFVehicleReport *)self vehicleReport];
  v3 = [v2 getRKEFunctionsInProgress];

  return v3;
}

- (id)getStatusForRKEFunction:(id)a3
{
  id v4 = a3;
  id v5 = [(NFVehicleReport *)self vehicleReport];
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
  id v5 = [(NFVehicleReport *)self vehicleReport];
  [v4 encodeObject:v5 forKey:@"report"];
}

- (NFVehicleReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)NFVehicleReport;
  id v5 = [(NFVehicleReport *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"report"];
    vehicleReport = v5->_vehicleReport;
    v5->_vehicleReport = (SESVehicleReport *)v6;
  }
  return v5;
}

- (NSString)keyIdentifier
{
  v2 = [(NFVehicleReport *)self vehicleReport];
  v3 = [v2 keyIdentifier];

  return (NSString *)v3;
}

- (id)description
{
  v2 = [(NFVehicleReport *)self vehicleReport];
  v3 = [v2 description];

  return v3;
}

- (SESVehicleReport)vehicleReport
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