@interface PXStoryNullSongResource
- (NSString)description;
- (NSString)px_storyResourceIdentifier;
- (PXAudioAsset)px_storyResourceSongAsset;
- (PXStoryNullSongResource)init;
- (int64_t)px_storyResourceKind;
@end

@implementation PXStoryNullSongResource

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_asset, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
}

- (PXAudioAsset)px_storyResourceSongAsset
{
  return self->_asset;
}

- (int64_t)px_storyResourceKind
{
  return self->_resourceKind;
}

- (NSString)px_storyResourceIdentifier
{
  return self->_identifier;
}

- (NSString)description
{
  v2 = (void *)[[NSString alloc] initWithFormat:@"No Music"];
  return (NSString *)v2;
}

- (PXStoryNullSongResource)init
{
  v7.receiver = self;
  v7.super_class = (Class)PXStoryNullSongResource;
  v2 = [(PXStoryNullSongResource *)&v7 init];
  v3 = v2;
  if (v2)
  {
    identifier = v2->_identifier;
    v2->_identifier = (NSString *)@"PXStoryNullSongResource";

    asset = v3->_asset;
    v3->_resourceKind = 2;
    v3->_asset = 0;
  }
  return v3;
}

@end