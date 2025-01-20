@interface TRIExternalParameterGuardedData
- (id)description;
@end

@implementation TRIExternalParameterGuardedData

- (id)description
{
  return (id)[NSString stringWithFormat:@"<%@,Siri device aggregation ID rotation date:%@>", objc_opt_class(), self->guardedSiriDeviceAggregationIdRotationDate];
}

- (void).cxx_destruct
{
}

@end