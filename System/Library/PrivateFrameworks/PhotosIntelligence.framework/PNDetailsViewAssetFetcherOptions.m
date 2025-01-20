@interface PNDetailsViewAssetFetcherOptions
- (BOOL)includeOthersInSocialGroupAssets;
- (PHFetchOptions)fetchOptions;
- (PNDetailsViewAssetFetcherOptions)init;
- (PNDetailsViewAssetFetcherOptions)initWithFetchOptions:(id)a3;
- (int64_t)curationLength;
- (void)setCurationLength:(int64_t)a3;
- (void)setFetchOptions:(id)a3;
- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3;
@end

@implementation PNDetailsViewAssetFetcherOptions

- (void)setIncludeOthersInSocialGroupAssets:(BOOL)a3
{
}

- (void).cxx_destruct
{
}

- (PNDetailsViewAssetFetcherOptions)initWithFetchOptions:(id)a3
{
  return (PNDetailsViewAssetFetcherOptions *)sub_2593557B8((uint64_t)a3);
}

- (PHFetchOptions)fetchOptions
{
  id v2 = sub_2593573A0();
  return (PHFetchOptions *)v2;
}

- (void)setFetchOptions:(id)a3
{
  id v4 = a3;
  v5 = self;
  sub_259627EFC((uint64_t)v4);
}

- (int64_t)curationLength
{
  return sub_259627F34();
}

- (void)setCurationLength:(int64_t)a3
{
}

- (BOOL)includeOthersInSocialGroupAssets
{
  return sub_259627FA4() & 1;
}

- (PNDetailsViewAssetFetcherOptions)init
{
}

@end