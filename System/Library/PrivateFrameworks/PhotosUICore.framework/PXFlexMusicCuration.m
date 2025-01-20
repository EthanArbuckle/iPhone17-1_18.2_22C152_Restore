@interface PXFlexMusicCuration
- (PXAudioAssetFetchResult)bestSongSuggestions;
- (PXAudioAssetFetchResult)secondarySongSuggestions;
- (PXFlexMusicCuration)init;
- (PXFlexMusicCuration)initWithBestSongSuggestions:(id)a3 secondarySongSuggestions:(id)a4;
@end

@implementation PXFlexMusicCuration

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_secondarySongSuggestions, 0);
  objc_storeStrong((id *)&self->_bestSongSuggestions, 0);
}

- (PXAudioAssetFetchResult)secondarySongSuggestions
{
  return self->_secondarySongSuggestions;
}

- (PXAudioAssetFetchResult)bestSongSuggestions
{
  return self->_bestSongSuggestions;
}

- (PXFlexMusicCuration)init
{
  v4 = [MEMORY[0x1E4F28B00] currentHandler];
  objc_msgSend(v4, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, @"PXFlexMusicCuration.m", 28, @"%s is not available as initializer", "-[PXFlexMusicCuration init]");

  abort();
}

- (PXFlexMusicCuration)initWithBestSongSuggestions:(id)a3 secondarySongSuggestions:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)PXFlexMusicCuration;
  v9 = [(PXFlexMusicCuration *)&v12 init];
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_bestSongSuggestions, a3);
    objc_storeStrong((id *)&v10->_secondarySongSuggestions, a4);
  }

  return v10;
}

@end