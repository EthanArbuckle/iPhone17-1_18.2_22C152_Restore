@interface NSURL(TSUUTIUtilities)
- (uint64_t)tsu_UTI;
- (uint64_t)tsu_conformsToUTI:()TSUUTIUtilities;
@end

@implementation NSURL(TSUUTIUtilities)

- (uint64_t)tsu_UTI
{
  v1 = (void *)[a1 path];
  return objc_msgSend(v1, "tsu_pathUTI");
}

- (uint64_t)tsu_conformsToUTI:()TSUUTIUtilities
{
  v4 = (void *)[a1 pathExtension];
  return objc_msgSend(v4, "tsu_pathExtensionConformsToUTI:", a3);
}

@end