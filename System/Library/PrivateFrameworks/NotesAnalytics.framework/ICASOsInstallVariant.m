@interface ICASOsInstallVariant
- (ICASOsInstallVariant)initWithOsInstallVariant:(int64_t)a3;
- (id)toJsonValueAndReturnError:(id *)a3;
- (int64_t)osInstallVariant;
@end

@implementation ICASOsInstallVariant

- (ICASOsInstallVariant)initWithOsInstallVariant:(int64_t)a3
{
  v5.receiver = self;
  v5.super_class = (Class)ICASOsInstallVariant;
  result = [(ICASOsInstallVariant *)&v5 init];
  if (result) {
    result->_osInstallVariant = a3;
  }
  return result;
}

- (id)toJsonValueAndReturnError:(id *)a3
{
  int64_t v3 = [(ICASOsInstallVariant *)self osInstallVariant];
  v4 = @"unknown";
  if (v3 == 1) {
    v4 = @"internal";
  }
  if (v3 == 2) {
    return @"external";
  }
  else {
    return v4;
  }
}

- (int64_t)osInstallVariant
{
  return self->_osInstallVariant;
}

@end