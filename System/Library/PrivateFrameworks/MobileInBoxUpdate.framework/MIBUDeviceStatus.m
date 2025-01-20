@interface MIBUDeviceStatus
- (BOOL)isEqual:(id)a3;
- (MIBUDeviceStatus)init;
- (NSDictionary)batteryDetails;
- (NSDictionary)operationDetails;
- (NSDictionary)thermalDetails;
- (NSError)operationError;
- (NSNumber)batteryLevel;
- (unint64_t)operation;
- (unint64_t)state;
- (void)setBatteryDetails:(id)a3;
- (void)setBatteryLevel:(id)a3;
- (void)setOperation:(unint64_t)a3;
- (void)setOperationDetails:(id)a3;
- (void)setOperationError:(id)a3;
- (void)setState:(unint64_t)a3;
- (void)setThermalDetails:(id)a3;
@end

@implementation MIBUDeviceStatus

- (MIBUDeviceStatus)init
{
  v5.receiver = self;
  v5.super_class = (Class)MIBUDeviceStatus;
  v2 = [(MIBUDeviceStatus *)&v5 init];
  v3 = v2;
  if (v2)
  {
    [(MIBUDeviceStatus *)v2 setState:0];
    [(MIBUDeviceStatus *)v3 setOperation:0];
    [(MIBUDeviceStatus *)v3 setOperationDetails:0];
    [(MIBUDeviceStatus *)v3 setOperationError:0];
    [(MIBUDeviceStatus *)v3 setBatteryLevel:0];
    [(MIBUDeviceStatus *)v3 setThermalDetails:0];
    [(MIBUDeviceStatus *)v3 setBatteryDetails:0];
  }
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_10;
  }
  uint64_t v5 = [v4 state];
  if (v5 != [(MIBUDeviceStatus *)self state]) {
    goto LABEL_10;
  }
  uint64_t v6 = [v4 operation];
  if (v6 != [(MIBUDeviceStatus *)self operation]) {
    goto LABEL_10;
  }
  v7 = [v4 operationError];
  v8 = [v7 domain];
  v9 = [(MIBUDeviceStatus *)self operationError];
  v10 = [v9 domain];
  int v11 = [v8 isEqualToString:v10];

  if (!v11) {
    goto LABEL_10;
  }
  v12 = [v4 operationError];
  uint64_t v13 = [v12 code];
  v14 = [(MIBUDeviceStatus *)self operationError];
  uint64_t v15 = [v14 code];

  if (v13 != v15) {
    goto LABEL_10;
  }
  v16 = [v4 batteryLevel];
  v17 = [(MIBUDeviceStatus *)self batteryLevel];
  int v18 = [v16 isEqualToNumber:v17];

  if (!v18) {
    goto LABEL_10;
  }
  v19 = [v4 operationDetails];
  v20 = [(MIBUDeviceStatus *)self operationDetails];
  int v21 = [v19 isEqualToDictionary:v20];

  if (!v21) {
    goto LABEL_10;
  }
  v22 = [v4 thermalDetails];
  v23 = [(MIBUDeviceStatus *)self thermalDetails];
  int v24 = [v22 isEqualToDictionary:v23];

  if (v24)
  {
    v25 = [v4 batteryDetails];
    v26 = [(MIBUDeviceStatus *)self batteryDetails];
    char v27 = [v25 isEqualToDictionary:v26];
  }
  else
  {
LABEL_10:
    char v27 = 0;
  }

  return v27;
}

- (unint64_t)state
{
  return self->_state;
}

- (void)setState:(unint64_t)a3
{
  self->_state = a3;
}

- (unint64_t)operation
{
  return self->_operation;
}

- (void)setOperation:(unint64_t)a3
{
  self->_operation = a3;
}

- (NSError)operationError
{
  return self->_operationError;
}

- (void)setOperationError:(id)a3
{
}

- (NSNumber)batteryLevel
{
  return self->_batteryLevel;
}

- (void)setBatteryLevel:(id)a3
{
}

- (NSDictionary)operationDetails
{
  return self->_operationDetails;
}

- (void)setOperationDetails:(id)a3
{
}

- (NSDictionary)thermalDetails
{
  return self->_thermalDetails;
}

- (void)setThermalDetails:(id)a3
{
}

- (NSDictionary)batteryDetails
{
  return self->_batteryDetails;
}

- (void)setBatteryDetails:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_batteryDetails, 0);
  objc_storeStrong((id *)&self->_thermalDetails, 0);
  objc_storeStrong((id *)&self->_operationDetails, 0);
  objc_storeStrong((id *)&self->_batteryLevel, 0);

  objc_storeStrong((id *)&self->_operationError, 0);
}

@end