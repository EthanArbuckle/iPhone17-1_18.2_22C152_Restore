@interface PXMusicCuratorAudioAssetRequestOptions
- (BOOL)forceMetadataRefetch;
- (NSDictionary)requestOptions;
- (void)setForceMetadataRefetch:(BOOL)a3;
@end

@implementation PXMusicCuratorAudioAssetRequestOptions

- (void)setForceMetadataRefetch:(BOOL)a3
{
  self->_forceMetadataRefetch = a3;
}

- (BOOL)forceMetadataRefetch
{
  return self->_forceMetadataRefetch;
}

- (NSDictionary)requestOptions
{
  v6[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = *MEMORY[0x1E4F8B050];
  v2 = objc_msgSend(NSNumber, "numberWithBool:", -[PXMusicCuratorAudioAssetRequestOptions forceMetadataRefetch](self, "forceMetadataRefetch"));
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return (NSDictionary *)v3;
}

@end