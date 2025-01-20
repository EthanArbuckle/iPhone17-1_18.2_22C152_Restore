@interface CEMDeviceRestartCommand
- (BOOL)dmf_requestExecutesWithoutReturning;
- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4;
- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMDeviceRestartCommand

- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4
{
  v4 = objc_opt_new();

  return v4;
}

- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)dmf_requestExecutesWithoutReturning
{
  return 1;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0;
}

@end