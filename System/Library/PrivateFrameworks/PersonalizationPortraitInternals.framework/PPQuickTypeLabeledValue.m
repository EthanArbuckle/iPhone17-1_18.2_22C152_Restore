@interface PPQuickTypeLabeledValue
+ (id)labeledValueWithLabel:(id)a3 value:(id)a4;
+ (id)labeledValueWithLabel:(id)a3 value:(id)a4 scoreBoost:(double)a5;
+ (id)labeledValueWithLabel:(id)a3 value:(id)a4 scoreBoost:(double)a5 fields:(unsigned int)a6;
- (NSString)label;
- (NSString)value;
- (PPQuickTypeLabeledValue)initWithLabel:(id)a3 value:(id)a4 scoreBoost:(double)a5 fields:(unsigned int)a6;
- (double)scoreBoost;
- (unsigned)fields;
@end

@implementation PPQuickTypeLabeledValue

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_value, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

- (unsigned)fields
{
  return self->_fields;
}

- (double)scoreBoost
{
  return self->_scoreBoost;
}

- (NSString)value
{
  return self->_value;
}

- (NSString)label
{
  return self->_label;
}

- (PPQuickTypeLabeledValue)initWithLabel:(id)a3 value:(id)a4 scoreBoost:(double)a5 fields:(unsigned int)a6
{
  id v11 = a3;
  id v12 = a4;
  v16.receiver = self;
  v16.super_class = (Class)PPQuickTypeLabeledValue;
  v13 = [(PPQuickTypeLabeledValue *)&v16 init];
  v14 = v13;
  if (v13)
  {
    objc_storeStrong((id *)&v13->_label, a3);
    objc_storeStrong((id *)&v14->_value, a4);
    v14->_scoreBoost = a5;
    v14->_fields = a6;
  }

  return v14;
}

+ (id)labeledValueWithLabel:(id)a3 value:(id)a4 scoreBoost:(double)a5 fields:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[PPQuickTypeLabeledValue alloc] initWithLabel:v10 value:v9 scoreBoost:v6 fields:a5];

  return v11;
}

+ (id)labeledValueWithLabel:(id)a3 value:(id)a4 scoreBoost:(double)a5
{
  id v7 = a4;
  id v8 = a3;
  id v9 = [[PPQuickTypeLabeledValue alloc] initWithLabel:v8 value:v7 scoreBoost:0 fields:a5];

  return v9;
}

+ (id)labeledValueWithLabel:(id)a3 value:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [[PPQuickTypeLabeledValue alloc] initWithLabel:v6 value:v5 scoreBoost:0 fields:0.0];

  return v7;
}

@end