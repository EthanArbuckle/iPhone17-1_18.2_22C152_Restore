@interface CEMManagementRefreshStatusCommand
- (BOOL)dmf_requestExecutesWithoutReturning;
- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4;
- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4;
- (id)dmf_statusForResult:(id)a3 context:(id)a4;
@end

@implementation CEMManagementRefreshStatusCommand

- (id)dmf_executeRequestWithContext:(id)a3 error:(id *)a4
{
  return 0;
}

- (id)dmf_executeOperationWithContext:(id)a3 error:(id *)a4
{
  id v4 = a3;
  v5 = objc_opt_new();
  v6 = [v4 organizationIdentifier];

  [v5 setOrganizationIdentifier:v6];

  return v5;
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