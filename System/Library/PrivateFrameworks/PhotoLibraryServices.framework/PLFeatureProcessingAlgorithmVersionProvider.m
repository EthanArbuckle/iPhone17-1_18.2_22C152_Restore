@interface PLFeatureProcessingAlgorithmVersionProvider
+ (id)descriptionForVersionProvider:(id)a3;
+ (id)provider;
- (PLFeatureProcessingAlgorithmVersionProvider)init;
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

@implementation PLFeatureProcessingAlgorithmVersionProvider

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

- (void)setCaptionGenerationVersion:(signed __int16)a3
{
  self->_captionGenerationVersion = a3;
}

- (signed)captionGenerationVersion
{
  return self->_captionGenerationVersion;
}

- (void)setVaLocationAnalysisVersion:(signed __int16)a3
{
  self->_vaLocationAnalysisVersion = a3;
}

- (signed)vaLocationAnalysisVersion
{
  return self->_vaLocationAnalysisVersion;
}

- (void)setMediaAnalysisImageVersion:(signed __int16)a3
{
  self->_mediaAnalysisImageVersion = a3;
}

- (signed)mediaAnalysisImageVersion
{
  return self->_mediaAnalysisImageVersion;
}

- (void)setMediaAnalysisVersion:(unint64_t)a3
{
  self->_mediaAnalysisVersion = a3;
}

- (unint64_t)mediaAnalysisVersion
{
  return self->_mediaAnalysisVersion;
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

- (void)setVisualSearchAlgorithmVersion:(signed __int16)a3
{
  self->_visualSearchAlgorithmVersion = a3;
}

- (signed)visualSearchAlgorithmVersion
{
  return self->_visualSearchAlgorithmVersion;
}

- (void)setCharacterRecognitionAlgorithmVersion:(signed __int16)a3
{
  self->_characterRecognitionAlgorithmVersion = a3;
}

- (signed)characterRecognitionAlgorithmVersion
{
  return self->_characterRecognitionAlgorithmVersion;
}

- (void)setFaceAnalysisVersion:(signed __int16)a3
{
  self->_faceAnalysisVersion = a3;
}

- (signed)faceAnalysisVersion
{
  return self->_faceAnalysisVersion;
}

- (void)setSceneAnalysisVersion:(signed __int16)a3
{
  self->_sceneAnalysisVersion = a3;
}

- (signed)sceneAnalysisVersion
{
  return self->_sceneAnalysisVersion;
}

- (PLFeatureProcessingAlgorithmVersionProvider)init
{
  v6.receiver = self;
  v6.super_class = (Class)PLFeatureProcessingAlgorithmVersionProvider;
  v2 = [(PLFeatureProcessingAlgorithmVersionProvider *)&v6 init];
  v3 = v2;
  if (v2) {
    v4 = v2;
  }

  return v3;
}

+ (id)descriptionForVersionProvider:(id)a3
{
  v24[12] = *MEMORY[0x1E4F143B8];
  v23[0] = @"scene";
  v3 = NSNumber;
  id v4 = a3;
  v22 = objc_msgSend(v3, "numberWithShort:", objc_msgSend(v4, "sceneAnalysisVersion"));
  v24[0] = v22;
  v23[1] = @"face";
  v21 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "faceAnalysisVersion"));
  v24[1] = v21;
  v23[2] = @"ocr";
  v20 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "characterRecognitionAlgorithmVersion"));
  v24[2] = v20;
  v23[3] = @"vsearch";
  v19 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "visualSearchAlgorithmVersion"));
  v24[3] = v19;
  v23[4] = @"sticker";
  v5 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "stickerConfidenceAlgorithmVersion"));
  v24[4] = v5;
  v23[5] = @"va";
  objc_super v6 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "vaAnalysisVersion"));
  v24[5] = v6;
  v23[6] = @"valoc";
  v7 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "vaLocationAnalysisVersion"));
  v24[6] = v7;
  v23[7] = @"media";
  v8 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "mediaAnalysisVersion"));
  v24[7] = v8;
  v23[8] = @"mediai";
  v9 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "mediaAnalysisImageVersion"));
  v24[8] = v9;
  v23[9] = @"caption";
  v10 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "captionGenerationVersion"));
  v24[9] = v10;
  v23[10] = @"embed";
  v11 = objc_msgSend(NSNumber, "numberWithShort:", objc_msgSend(v4, "imageEmbeddingVersion"));
  v24[10] = v11;
  v23[11] = @"vembed";
  v12 = NSNumber;
  uint64_t v13 = [v4 videoEmbeddingVersion];

  v14 = [v12 numberWithShort:v13];
  v24[11] = v14;
  v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:v23 count:12];

  v16 = [MEMORY[0x1E4F28D90] dataWithJSONObject:v15 options:0 error:0];
  v17 = (void *)[[NSString alloc] initWithData:v16 encoding:4];

  return v17;
}

+ (id)provider
{
  id v2 = objc_alloc_init((Class)a1);
  v3 = +[PLMediaAnalysisServiceRequestAdapter currentSceneVersion];
  objc_msgSend(v2, "setSceneAnalysisVersion:", objc_msgSend(v3, "shortValue"));

  id v4 = +[PLMediaAnalysisServiceRequestAdapter currentFaceVersion];
  objc_msgSend(v2, "setFaceAnalysisVersion:", objc_msgSend(v4, "shortValue"));

  v5 = +[PLMediaAnalysisServiceRequestAdapter currentOCRAlgorithmVersion];
  objc_msgSend(v2, "setCharacterRecognitionAlgorithmVersion:", objc_msgSend(v5, "shortValue"));

  objc_super v6 = +[PLMediaAnalysisServiceRequestAdapter currentVisualSearchAlgorithmVersion];
  objc_msgSend(v2, "setVisualSearchAlgorithmVersion:", objc_msgSend(v6, "shortValue"));

  v7 = +[PLMediaAnalysisServiceRequestAdapter currentStickerConfidenceAlgorithmVersion];
  objc_msgSend(v2, "setStickerConfidenceAlgorithmVersion:", objc_msgSend(v7, "shortValue"));

  v8 = +[PLMediaAnalysisServiceRequestAdapter currentVaAnalysisAlgorithmVersion];
  objc_msgSend(v2, "setVaAnalysisVersion:", objc_msgSend(v8, "shortValue"));

  v9 = +[PLMediaAnalysisServiceRequestAdapter currentVaLocationAnalysisAlgorithmVersion];
  objc_msgSend(v2, "setVaLocationAnalysisVersion:", objc_msgSend(v9, "shortValue"));

  v10 = +[PLMediaAnalysisServiceRequestAdapter currentMediaAnalysisVersion];
  objc_msgSend(v2, "setMediaAnalysisVersion:", objc_msgSend(v10, "unsignedLongLongValue"));

  v11 = +[PLMediaAnalysisServiceRequestAdapter currentMediaAnalysisImageVersion];
  objc_msgSend(v2, "setMediaAnalysisImageVersion:", objc_msgSend(v11, "shortValue"));

  v12 = +[PLMediaAnalysisServiceRequestAdapter currentCaptionGenerationVersion];
  objc_msgSend(v2, "setCaptionGenerationVersion:", objc_msgSend(v12, "shortValue"));

  uint64_t v13 = +[PLMediaAnalysisServiceRequestAdapter currentVideoEmbeddingVersion];
  objc_msgSend(v2, "setVideoEmbeddingVersion:", objc_msgSend(v13, "shortValue"));

  [v2 setSceneAnalysisVersion:1];
  [v2 setFaceAnalysisVersion:1];
  v14 = +[PLMediaAnalysisServiceRequestAdapter mediaAnalysisEmbeddingChangedVersion];
  objc_msgSend(v2, "setMediaAnalysisVersion:", (int)objc_msgSend(v14, "shortValue"));

  v15 = +[PLMediaAnalysisServiceRequestAdapter mediaAnalysisEmbeddingChangedVersion];
  objc_msgSend(v2, "setMediaAnalysisImageVersion:", objc_msgSend(v15, "shortValue"));

  return v2;
}

@end