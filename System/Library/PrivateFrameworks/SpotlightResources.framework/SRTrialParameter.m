@interface SRTrialParameter
- (BOOL)hasValueFromTrial;
- (SRParameter)parameter;
- (SRTrialParameter)initWithParameter:(id)a3;
- (id)description;
- (void)setHasValueFromTrial:(BOOL)a3;
@end

@implementation SRTrialParameter

- (SRTrialParameter)initWithParameter:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)SRTrialParameter;
  v5 = [(SRTrialParameter *)&v9 init];
  if (v5)
  {
    uint64_t v6 = [v4 copy];
    parameter = v5->_parameter;
    v5->_parameter = (SRParameter *)v6;

    v5->_hasValueFromTrial = 0;
  }

  return v5;
}

- (id)description
{
  v3 = NSString;
  uint64_t v4 = [(SRParameter *)self->_parameter description];
  v5 = (void *)v4;
  if (self->_hasValueFromTrial) {
    uint64_t v6 = @"YES";
  }
  else {
    uint64_t v6 = @"NO";
  }
  v7 = [v3 stringWithFormat:@"parameter = (%@), hasValueFromTrial = %@", v4, v6];

  return v7;
}

- (SRParameter)parameter
{
  return self->_parameter;
}

- (BOOL)hasValueFromTrial
{
  return self->_hasValueFromTrial;
}

- (void)setHasValueFromTrial:(BOOL)a3
{
  self->_hasValueFromTrial = a3;
}

- (void).cxx_destruct
{
}

@end