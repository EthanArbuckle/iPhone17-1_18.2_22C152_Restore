@interface ICASSwitchSelectionType
- (ICASSwitchSelectionType)initWithSwitchSelectionType:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)switchSelectionType;
@end

@implementation ICASSwitchSelectionType

- (ICASSwitchSelectionType)initWithSwitchSelectionType:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASSwitchSelectionType;
  result = [(ICASSwitchSelectionType *)&v5 init];
  if (result) {
    result->_switchSelectionType = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASSwitchSelectionType *)self switchSelectionType];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"on";
  }
  if (v3 == 2) {
    return @"off";
  }
  else {
    return v4;
  }
}

- (int64_t)switchSelectionType
{
  return self->_switchSelectionType;
}

@end