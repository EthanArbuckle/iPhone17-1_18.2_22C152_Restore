@interface SESVehicleReport
+ (BOOL)supportsSecureCoding;
- (BOOL)isRKEFunctionInProgress:(id)a3;
- (BOOL)isRKEFunctionSupported:(id)a3;
- (NSArray)functionsInProgress;
- (NSArray)supportedFunctions;
- (NSDictionary)proprietaryData;
- (NSDictionary)status;
- (NSString)keyIdentifier;
- (NSString)readerIdentifier;
- (SESVehicleReport)initWithCoder:(id)a3;
- (SESVehicleReport)initWithKeyIdentifier:(id)a3 readerIdentifier:(id)a4 supportedFunctions:(id)a5 functionsInProgress:(id)a6 status:(id)a7 proprietaryData:(id)a8;
- (id)description;
- (id)getProprietaryDataForRKEFunction:(id)a3;
- (id)getRKEFunctionsInProgress;
- (id)getStatusForRKEFunction:(id)a3;
- (id)getSupportedRKEFunctions;
- (void)encodeWithCoder:(id)a3;
- (void)setFunctionsInProgress:(id)a3;
- (void)setProprietaryData:(id)a3;
- (void)setStatus:(id)a3;
- (void)setSupportedFunctions:(id)a3;
@end

@implementation SESVehicleReport

- (SESVehicleReport)initWithKeyIdentifier:(id)a3 readerIdentifier:(id)a4 supportedFunctions:(id)a5 functionsInProgress:(id)a6 status:(id)a7 proprietaryData:(id)a8
{
  id v23 = a3;
  id v22 = a4;
  id v21 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  v24.receiver = self;
  v24.super_class = (Class)SESVehicleReport;
  v18 = [(SESVehicleReport *)&v24 init];
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_keyIdentifier, a3);
    objc_storeStrong((id *)&v19->_readerIdentifier, a4);
    objc_storeStrong((id *)&v19->_supportedFunctions, a5);
    objc_storeStrong((id *)&v19->_functionsInProgress, a6);
    objc_storeStrong((id *)&v19->_status, a7);
    objc_storeStrong((id *)&v19->_proprietaryData, a8);
  }

  return v19;
}

- (BOOL)isRKEFunctionSupported:(id)a3
{
  return [(NSArray *)self->_supportedFunctions containsObject:a3];
}

- (id)getSupportedRKEFunctions
{
  return self->_supportedFunctions;
}

- (BOOL)isRKEFunctionInProgress:(id)a3
{
  return [(NSArray *)self->_functionsInProgress containsObject:a3];
}

- (id)getRKEFunctionsInProgress
{
  return self->_functionsInProgress;
}

- (id)getStatusForRKEFunction:(id)a3
{
  return [(NSDictionary *)self->_status objectForKeyedSubscript:a3];
}

- (id)getProprietaryDataForRKEFunction:(id)a3
{
  return [(NSDictionary *)self->_proprietaryData objectForKeyedSubscript:a3];
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (void)encodeWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(SESVehicleReport *)self keyIdentifier];
  [v4 encodeObject:v5 forKey:@"keyIdentifier"];

  v6 = [(SESVehicleReport *)self readerIdentifier];
  [v4 encodeObject:v6 forKey:@"readerIdentifier"];

  v7 = [(SESVehicleReport *)self supportedFunctions];
  [v4 encodeObject:v7 forKey:@"supportedFunctions"];

  v8 = [(SESVehicleReport *)self functionsInProgress];
  [v4 encodeObject:v8 forKey:@"functionsInProgress"];

  v9 = [(SESVehicleReport *)self status];
  [v4 encodeObject:v9 forKey:@"status"];

  id v10 = [(SESVehicleReport *)self proprietaryData];
  [v4 encodeObject:v10 forKey:@"proprietaryData"];
}

- (SESVehicleReport)initWithCoder:(id)a3
{
  id v4 = a3;
  v26.receiver = self;
  v26.super_class = (Class)SESVehicleReport;
  v5 = [(SESVehicleReport *)&v26 init];
  v6 = v5;
  if (v5)
  {
    v7 = [(SESVehicleReport *)v5 keyIdentifier];
    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"keyIdentifier"];
    keyIdentifier = v6->_keyIdentifier;
    v6->_keyIdentifier = (NSString *)v8;

    id v10 = [(SESVehicleReport *)v6 readerIdentifier];
    uint64_t v11 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"readerIdentifier"];
    readerIdentifier = v6->_readerIdentifier;
    v6->_readerIdentifier = (NSString *)v11;

    v13 = [(SESVehicleReport *)v6 supportedFunctions];
    uint64_t v14 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"supportedFunctions"];
    supportedFunctions = v6->_supportedFunctions;
    v6->_supportedFunctions = (NSArray *)v14;

    id v16 = [(SESVehicleReport *)v6 functionsInProgress];
    uint64_t v17 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"functionsInProgress"];
    functionsInProgress = v6->_functionsInProgress;
    v6->_functionsInProgress = (NSArray *)v17;

    v19 = [(SESVehicleReport *)v6 status];
    uint64_t v20 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"status"];
    status = v6->_status;
    v6->_status = (NSDictionary *)v20;

    id v22 = [(SESVehicleReport *)v6 proprietaryData];
    uint64_t v23 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"proprietaryData"];
    proprietaryData = v6->_proprietaryData;
    v6->_proprietaryData = (NSDictionary *)v23;
  }
  return v6;
}

- (id)description
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"KeyID %@; supported %@; in progress %@; status %@",
               self->_keyIdentifier,
               self->_supportedFunctions,
               self->_functionsInProgress,
               self->_status);
}

- (NSString)keyIdentifier
{
  return self->_keyIdentifier;
}

- (NSString)readerIdentifier
{
  return self->_readerIdentifier;
}

- (NSArray)supportedFunctions
{
  return self->_supportedFunctions;
}

- (void)setSupportedFunctions:(id)a3
{
}

- (NSArray)functionsInProgress
{
  return self->_functionsInProgress;
}

- (void)setFunctionsInProgress:(id)a3
{
}

- (NSDictionary)status
{
  return self->_status;
}

- (void)setStatus:(id)a3
{
}

- (NSDictionary)proprietaryData
{
  return self->_proprietaryData;
}

- (void)setProprietaryData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_proprietaryData, 0);
  objc_storeStrong((id *)&self->_status, 0);
  objc_storeStrong((id *)&self->_functionsInProgress, 0);
  objc_storeStrong((id *)&self->_supportedFunctions, 0);
  objc_storeStrong((id *)&self->_readerIdentifier, 0);
  objc_storeStrong((id *)&self->_keyIdentifier, 0);
}

@end