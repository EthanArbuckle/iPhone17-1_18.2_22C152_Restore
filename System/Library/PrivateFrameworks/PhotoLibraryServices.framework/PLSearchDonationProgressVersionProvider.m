@interface PLSearchDonationProgressVersionProvider
- (PLSearchDonationProgressVersionProvider)init;
- (signed)captionGenerationVersion;
- (signed)characterRecognitionAlgorithmVersion;
- (signed)faceAnalysisVersion;
- (signed)imageEmbeddingVersion;
- (signed)mediaAnalysisImageVersion;
- (signed)sceneAnalysisVersion;
- (signed)stickerConfidenceAlgorithmVersion;
- (signed)vaAnalysisVersion;
- (signed)vaLocationAnalysisVersion;
- (signed)videoEmbeddingVersion;
- (signed)visualSearchAlgorithmVersion;
- (unint64_t)mediaAnalysisVersion;
- (void)setCaptionGenerationVersion:(signed __int16)a3;
- (void)setCharacterRecognitionAlgorithmVersion:(signed __int16)a3;
- (void)setFaceAnalysisVersion:(signed __int16)a3;
- (void)setImageEmbeddingVersion:(signed __int16)a3;
- (void)setMediaAnalysisImageVersion:(signed __int16)a3;
- (void)setMediaAnalysisVersion:(unint64_t)a3;
- (void)setSceneAnalysisVersion:(signed __int16)a3;
- (void)setStickerConfidenceAlgorithmVersion:(signed __int16)a3;
- (void)setVaAnalysisVersion:(signed __int16)a3;
- (void)setVaLocationAnalysisVersion:(signed __int16)a3;
- (void)setVideoEmbeddingVersion:(signed __int16)a3;
- (void)setVisualSearchAlgorithmVersion:(signed __int16)a3;
@end

@implementation PLSearchDonationProgressVersionProvider

- (void)setVisualSearchAlgorithmVersion:(signed __int16)a3
{
  self->_visualSearchAlgorithmVersion = a3;
}

- (signed)visualSearchAlgorithmVersion
{
  return self->_visualSearchAlgorithmVersion;
}

- (void)setVaLocationAnalysisVersion:(signed __int16)a3
{
  self->_vaLocationAnalysisVersion = a3;
}

- (signed)vaLocationAnalysisVersion
{
  return self->_vaLocationAnalysisVersion;
}

- (void)setVaAnalysisVersion:(signed __int16)a3
{
  self->_vaAnalysisVersion = a3;
}

- (signed)vaAnalysisVersion
{
  return self->_vaAnalysisVersion;
}

- (void)setStickerConfidenceAlgorithmVersion:(signed __int16)a3
{
  self->_stickerConfidenceAlgorithmVersion = a3;
}

- (signed)stickerConfidenceAlgorithmVersion
{
  return self->_stickerConfidenceAlgorithmVersion;
}

- (void)setVideoEmbeddingVersion:(signed __int16)a3
{
  self->_videoEmbeddingVersion = a3;
}

- (signed)videoEmbeddingVersion
{
  return self->_videoEmbeddingVersion;
}

- (void)setImageEmbeddingVersion:(signed __int16)a3
{
  self->_imageEmbeddingVersion = a3;
}

- (signed)imageEmbeddingVersion
{
  return self->_imageEmbeddingVersion;
}

- (void)setSceneAnalysisVersion:(signed __int16)a3
{
  self->_sceneAnalysisVersion = a3;
}

- (signed)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (void)setMediaAnalysisVersion:(unint64_t)a3
{
  self->_mediaAnalysisVersion = a3;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
}

- (void)setMediaAnalysisImageVersion:(signed __int16)a3
{
  self->_mediaAnalysisImageVersion = a3;
}

- (signed)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (void)setFaceAnalysisVersion:(signed __int16)a3
{
  self->_faceAnalysisVersion = a3;
}

- (signed)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (void)setCharacterRecognitionAlgorithmVersion:(signed __int16)a3
{
  self->_characterRecognitionAlgorithmVersion = a3;
}

- (signed)characterRecognitionAlgorithmVersion
{
  return self->_characterRecognitionAlgorithmVersion;
}

- (void)setCaptionGenerationVersion:(signed __int16)a3
{
  self->_captionGenerationVersion = a3;
}

- (signed)captionGenerationVersion
{
  return self->_captionGenerationVersion;
}

- (PLSearchDonationProgressVersionProvider)init
{
  v16.receiver = self;
  v16.super_class = (Class)PLSearchDonationProgressVersionProvider;
  v2 = [(PLSearchDonationProgressVersionProvider *)&v16 init];
  if (v2)
  {
    v3 = +[PLMediaAnalysisServiceRequestAdapter currentOCRAlgorithmVersion];
    v2->_characterRecognitionAlgorithmVersion = [v3 shortValue];

    v4 = +[PLMediaAnalysisServiceRequestAdapter currentFaceVersion];
    v2->_faceAnalysisVersion = [v4 shortValue];

    v5 = +[PLMediaAnalysisServiceRequestAdapter currentMediaAnalysisImageVersion];
    v2->_mediaAnalysisImageVersion = [v5 shortValue];

    v6 = +[PLMediaAnalysisServiceRequestAdapter currentMediaAnalysisVersion];
    v2->_mediaAnalysisVersion = [v6 unsignedLongLongValue];

    v7 = +[PLMediaAnalysisServiceRequestAdapter currentSceneVersion];
    v2->_sceneAnalysisVersion = [v7 shortValue];

    v8 = +[PLMediaAnalysisServiceRequestAdapter currentImageEmbeddingVersion];
    v2->_imageEmbeddingVersion = [v8 shortValue];

    v9 = +[PLMediaAnalysisServiceRequestAdapter currentVideoEmbeddingVersion];
    v2->_videoEmbeddingVersion = [v9 shortValue];

    v10 = +[PLMediaAnalysisServiceRequestAdapter currentStickerConfidenceAlgorithmVersion];
    v2->_stickerConfidenceAlgorithmVersion = [v10 shortValue];

    v11 = +[PLMediaAnalysisServiceRequestAdapter currentVaAnalysisAlgorithmVersion];
    v2->_vaAnalysisVersion = [v11 shortValue];

    v12 = +[PLMediaAnalysisServiceRequestAdapter currentVaLocationAnalysisAlgorithmVersion];
    v2->_vaLocationAnalysisVersion = [v12 shortValue];

    v13 = +[PLMediaAnalysisServiceRequestAdapter currentVisualSearchAlgorithmVersion];
    v2->_visualSearchAlgorithmVersion = [v13 shortValue];

    v14 = +[PLMediaAnalysisServiceRequestAdapter currentCaptionGenerationVersion];
    v2->_captionGenerationVersion = [v14 shortValue];
  }
  return v2;
}

@end