@interface NSString(SBFFileCache)
- (uint64_t)fileCacheStableDataRepresentation;
@end

@implementation NSString(SBFFileCache)

- (uint64_t)fileCacheStableDataRepresentation
{
  return [a1 dataUsingEncoding:4];
}

@end