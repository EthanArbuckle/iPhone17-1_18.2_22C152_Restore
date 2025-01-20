@interface PHUtilityCollection(PXDisplayAssetAdoption)
- (__CFString)px_symbolImageName;
- (uint64_t)px_isUtilityCollection;
@end

@implementation PHUtilityCollection(PXDisplayAssetAdoption)

- (__CFString)px_symbolImageName
{
  unsigned int v1 = [a1 type] - 1;
  if (v1 > 5) {
    return @"rectangle.stack";
  }
  else {
    return off_1E5DC1328[(unsigned __int16)v1];
  }
}

- (uint64_t)px_isUtilityCollection
{
  return 1;
}

@end