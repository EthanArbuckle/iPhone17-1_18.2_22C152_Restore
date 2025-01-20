@interface NSXPCConnection
@end

@implementation NSXPCConnection

uint64_t __122__NSXPCConnection_SafariCoreExtras__safari_applicationWithAuditToken_hasApprovedWebCredentialsDomainAssociationForDomain___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isApproved];
}

uint64_t __89__NSXPCConnection_SafariCoreExtras__safari_arrayForEntitlement_containingObjectsOfClass___block_invoke()
{
  return objc_opt_isKindOfClass() & 1;
}

@end