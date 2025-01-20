@interface EPSagaOperandDynamic
+ (BOOL)supportsSecureCoding;
- (EPRoutingSlip)routingSlip;
- (EPSagaOperandDynamic)initWithCoder:(id)a3;
- (EPSagaOperandDynamic)initWithEntryName:(id)a3 operandName:(id)a4;
- (NSObject)value;
- (NSString)description;
- (NSString)entryName;
- (NSString)operandName;
- (void)encodeWithCoder:(id)a3;
- (void)setRoutingSlip:(id)a3;
@end

@implementation EPSagaOperandDynamic

- (EPSagaOperandDynamic)initWithEntryName:(id)a3 operandName:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v9 = [(EPSagaOperandDynamic *)self init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_entryName, a3);
    objc_storeStrong((id *)&v10->_operandName, a4);
  }

  return v10;
}

- (NSObject)value
{
  v3 = [(EPSagaOperandDynamic *)self routingSlip];
  v4 = [(EPSagaOperandDynamic *)self entryName];
  v5 = [v3 objectForKeyedSubscript:v4];
  v6 = [(EPSagaOperandDynamic *)self operandName];
  id v7 = [v5 objectForKeyedSubscript:v6];

  return v7;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (EPSagaOperandDynamic)initWithCoder:(id)a3
{
  id v4 = a3;
  v5 = [(EPSagaOperandDynamic *)self init];
  if (v5)
  {
    uint64_t v6 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"entryName"];
    entryName = v5->_entryName;
    v5->_entryName = (NSString *)v6;

    uint64_t v8 = [v4 decodeObjectOfClass:objc_opt_class() forKey:@"operandName"];
    operandName = v5->_operandName;
    v5->_operandName = (NSString *)v8;
  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  entryName = self->_entryName;
  id v5 = a3;
  [v5 encodeObject:entryName forKey:@"entryName"];
  [v5 encodeObject:self->_operandName forKey:@"operandName"];
}

- (NSString)description
{
  v3 = (objc_class *)objc_opt_class();
  id v4 = NSStringFromClass(v3);
  id v5 = [(EPSagaOperandDynamic *)self entryName];
  uint64_t v6 = [(EPSagaOperandDynamic *)self operandName];
  id v7 = [(EPSagaOperandDynamic *)self value];
  uint64_t v8 = +[NSString stringWithFormat:@"%@: %@[%@] = %@", v4, v5, v6, v7];

  return (NSString *)v8;
}

- (EPRoutingSlip)routingSlip
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_routingSlip);

  return (EPRoutingSlip *)WeakRetained;
}

- (void)setRoutingSlip:(id)a3
{
}

- (NSString)entryName
{
  return self->_entryName;
}

- (NSString)operandName
{
  return self->_operandName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_operandName, 0);
  objc_storeStrong((id *)&self->_entryName, 0);

  objc_destroyWeak((id *)&self->_routingSlip);
}

@end