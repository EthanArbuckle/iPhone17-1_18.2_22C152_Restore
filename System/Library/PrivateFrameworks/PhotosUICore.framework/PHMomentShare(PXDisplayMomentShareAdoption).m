@interface PHMomentShare(PXDisplayMomentShareAdoption)
- (uint64_t)px_momentShareType;
@end

@implementation PHMomentShare(PXDisplayMomentShareAdoption)

- (uint64_t)px_momentShareType
{
  int v1 = [a1 status];
  if ((v1 - 2) < 2) {
    return 1;
  }
  if (!v1)
  {
    v3 = [MEMORY[0x1E4F28B00] currentHandler];
    v4 = [NSString stringWithUTF8String:"-[PHMomentShare(PXDisplayMomentShareAdoption) px_momentShareType]"];
    [v3 handleFailureInFunction:v4 file:@"PHAsset+PXDisplayAssetAdoption.m" lineNumber:1485 description:@"Code which should be unreachable has been reached"];

    abort();
  }
  return 0;
}

@end