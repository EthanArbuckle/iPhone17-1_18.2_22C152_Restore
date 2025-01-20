@interface CEMDeviceLockCommand
- (BOOL)dmf_requestExecutesWithoutReturning;
- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4;
- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMDeviceLockCommand

- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4
{
  v5 = objc_opt_new();
  v6 = [(CEMDeviceLockCommand *)self payloadMessage];
  [v5 setMessage:v6];

  v7 = [(CEMDeviceLockCommand *)self payloadPhoneNumber];
  [v5 setPhoneNumber:v7];

  return v5;
}

- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4
{
  return 0;
}

- (BOOL)dmf_requestExecutesWithoutReturning
{
  return 0;
}

- (id)dmf_statusForResult:(id)a3 context:(id)a4
{
  return 0;
}

@end