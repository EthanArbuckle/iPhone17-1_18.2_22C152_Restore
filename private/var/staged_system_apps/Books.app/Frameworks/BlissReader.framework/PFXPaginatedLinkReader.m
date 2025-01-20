@interface PFXPaginatedLinkReader
- (id)supportedCssMediaTypes;
@end

@implementation PFXPaginatedLinkReader

- (id)supportedCssMediaTypes
{
  return +[PFXStylesheet paginatedMediaTypes];
}

@end