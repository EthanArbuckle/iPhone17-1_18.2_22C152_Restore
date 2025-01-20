@interface PUTemporaryImageTable
- (int)nextCacheIndex;
@end

@implementation PUTemporaryImageTable

- (int)nextCacheIndex
{
  return atomic_fetch_add((atomic_uint *volatile)&self->super._imageFormatID + 1, 1u) + 1;
}

@end