@interface NSURL
@end

@implementation NSURL

uint64_t __61__NSURL_QueryParameters__URLByDeletingQueryParameterWithKey___block_invoke(uint64_t a1, void *a2)
{
  v3 = [a2 name];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)] ^ 1;

  return v4;
}

uint64_t __53__NSURL_TUSanitizedCopying__tu_defaultAllowedSchemes__block_invoke()
{
  tu_defaultAllowedSchemes_defaultAllowedSchemes = [MEMORY[0x1E4F1CAD0] setWithObject:@"https"];

  return MEMORY[0x1F41817F8]();
}

@end