@interface PFXPaginatedStyleReader
- (id)supportedMediaTypes;
@end

@implementation PFXPaginatedStyleReader

- (id)supportedMediaTypes
{
  return +[PFXStylesheet paginatedMediaTypes];
}

@end