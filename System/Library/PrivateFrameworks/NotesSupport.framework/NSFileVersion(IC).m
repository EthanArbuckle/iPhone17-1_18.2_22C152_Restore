@interface NSFileVersion(IC)
+ (uint64_t)ic_addVersionOfItemAtURL:()IC withContentsOfURL:options:error:;
@end

@implementation NSFileVersion(IC)

+ (uint64_t)ic_addVersionOfItemAtURL:()IC withContentsOfURL:options:error:
{
  return [a1 _addVersionOfItemAtURL:a3 withContentsOfURL:a4 options:a5 temporaryStorageIdentifier:0 error:a6];
}

@end