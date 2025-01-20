@interface SUIBIntelligenceFlowParameterSummaryMutation
- (NSString)value;
- (unint64_t)valueType;
- (void)setValue:(id)a3;
- (void)setValueType:(unint64_t)a3;
@end

@implementation SUIBIntelligenceFlowParameterSummaryMutation

- (NSString)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (unint64_t)valueType
{
  return self->_valueType;
}

- (void)setValueType:(unint64_t)a3
{
  self->_valueType = a3;
}

- (void).cxx_destruct
{
}

@end