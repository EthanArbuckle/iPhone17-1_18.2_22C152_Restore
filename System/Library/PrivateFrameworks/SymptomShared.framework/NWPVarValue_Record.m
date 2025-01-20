@interface NWPVarValue_Record
- (NSNumber)effective_epsilon;
- (NSSecureCoding)value;
- (int64_t)info;
- (void)setEffective_epsilon:(id)a3;
- (void)setInfo:(int64_t)a3;
- (void)setValue:(id)a3;
@end

@implementation NWPVarValue_Record

- (NSSecureCoding)value
{
  return self->_value;
}

- (void)setValue:(id)a3
{
}

- (int64_t)info
{
  return self->_info;
}

- (void)setInfo:(int64_t)a3
{
  self->_info = a3;
}

- (NSNumber)effective_epsilon
{
  return self->_effective_epsilon;
}

- (void)setEffective_epsilon:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_effective_epsilon, 0);
  objc_storeStrong((id *)&self->_value, 0);
}

@end