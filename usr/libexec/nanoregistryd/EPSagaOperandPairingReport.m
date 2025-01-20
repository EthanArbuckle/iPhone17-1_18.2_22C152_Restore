@interface EPSagaOperandPairingReport
+ (BOOL)supportsSecureCoding;
- (EPRoutingSlip)routingSlip;
- (EPSagaOperandPairingReport)initWithCoder:(id)a3;
- (EPSagaOperandPairingReport)initWithPairingReport:(id)a3;
- (NRPairingReport)pairingReport;
- (NSObject)value;
- (NSString)description;
- (void)encodeWithCoder:(id)a3;
@end

@implementation EPSagaOperandPairingReport

- (EPSagaOperandPairingReport)initWithPairingReport:(id)a3
{
  id v5 = a3;
  v6 = [(EPSagaOperandPairingReport *)self init];
  v7 = v6;
  if (v6) {
    objc_storeStrong((id *)&v6->_pairingReport, a3);
  }

  return v7;
}

- (NSObject)value
{
  return self->_pairingReport;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EPSagaOperandPairingReport)initWithCoder:(id)a3
{
  id v4 = a3;
  id v5 = [(EPSagaOperandPairingReport *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"pairingReport"];
    pairingReport = v5->_pairingReport;
    v5->_pairingReport = (NRPairingReport *)v6;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(EPSagaOperandPairingReport *)self pairingReport];
  uint64_t v6 = +[NSString stringWithFormat:@"%@: %@", v4, v5];

  return (NSString *)v6;
}

- (EPRoutingSlip)routingSlip
{
  return 0;
}

- (NRPairingReport)pairingReport
{
  return self->_pairingReport;
}

- (void).cxx_destruct
{
}

@end