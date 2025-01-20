@interface PFVideoMetadataAudioTrackFormatInfo
+ (id)infoForFirstAudioTrackOfAsset:(id)a3 matchingCodecPredicate:(id)a4;
- (BOOL)channelLayoutUsesChannelDescriptions;
- (BOOL)channelLayoutUsesHOA;
- (BOOL)channelLayoutUsesHigherOrderAmbisonics;
- (BOOL)getHOAChannelCount:(int64_t *)a3 BEDChannelCount:(int64_t *)a4;
- (int64_t)channelCount;
@end

@implementation PFVideoMetadataAudioTrackFormatInfo

- (void).cxx_destruct
{
}

- (BOOL)channelLayoutUsesHigherOrderAmbisonics
{
  return self->_channelLayoutUsesHigherOrderAmbisonics;
}

- (BOOL)getHOAChannelCount:(int64_t *)a3 BEDChannelCount:(int64_t *)a4
{
  *a3 = 0;
  *a4 = 0;
  if ([(PFVideoMetadataAudioTrackFormatInfo *)self channelLayoutUsesChannelDescriptions])
  {
    channelLayout = self->_channelLayout;
    uint64_t mNumberChannelDescriptions = channelLayout->mNumberChannelDescriptions;
    if (mNumberChannelDescriptions)
    {
      uint64_t v9 = 0;
      int64_t v10 = 0;
      mChannelDescriptions = channelLayout->mChannelDescriptions;
      do
      {
        AudioChannelLabel mChannelLabel = mChannelDescriptions->mChannelLabel;
        ++mChannelDescriptions;
        BOOL v13 = (mChannelLabel & 0xFFFF0000) != 0x10000;
        unsigned int v14 = mChannelLabel & 0xFFFE0000;
        if ((mChannelLabel & 0xFFFF0000) == 0x10000) {
          ++v9;
        }
        uint64_t v15 = v14 == 0x20000 && v13;
        v10 += v15;
        --mNumberChannelDescriptions;
      }
      while (mNumberChannelDescriptions);
      if (v10) {
        *a3 = v10;
      }
    }
    else
    {
      uint64_t v9 = 0;
      int64_t v10 = 0;
    }
    *a4 = [(PFVideoMetadataAudioTrackFormatInfo *)self channelCount] - (v9 + v10);
    goto LABEL_16;
  }
  BOOL v16 = [(PFVideoMetadataAudioTrackFormatInfo *)self channelLayoutUsesHOA];
  if (v16)
  {
    *a3 = self->_channelLayout->mChannelLayoutTag;
LABEL_16:
    LOBYTE(v16) = 1;
  }
  return v16;
}

- (BOOL)channelLayoutUsesHOA
{
  channelLayout = self->_channelLayout;
  return channelLayout && (channelLayout->mChannelLayoutTag & 0xFFFE0000) == 12451840;
}

- (BOOL)channelLayoutUsesChannelDescriptions
{
  channelLayout = self->_channelLayout;
  return channelLayout && channelLayout->mChannelLayoutTag == 0;
}

- (int64_t)channelCount
{
  formatListItem = self->_formatListItem;
  if (formatListItem) {
    return formatListItem->mASBD.mChannelsPerFrame;
  }
  else {
    return 0;
  }
}

+ (id)infoForFirstAudioTrackOfAsset:(id)a3 matchingCodecPredicate:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (unsigned int (**)(id, void))a4;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  v7 = +[PFMediaUtilities tracksWithMediaType:*MEMORY[0x1E4F15BA8] forAsset:v5];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v37 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v31;
    id v24 = v5;
    v25 = v7;
    uint64_t v23 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v31 != v10) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        long long v29 = 0u;
        BOOL v13 = [v12 formatDescriptions];
        uint64_t v14 = [v13 countByEnumeratingWithState:&v26 objects:v36 count:16];
        if (v14)
        {
          uint64_t v15 = v14;
          uint64_t v16 = *(void *)v27;
          while (2)
          {
            for (uint64_t j = 0; j != v15; ++j)
            {
              if (*(void *)v27 != v16) {
                objc_enumerationMutation(v13);
              }
              v18 = *(const opaqueCMFormatDescription **)(*((void *)&v26 + 1) + 8 * j);
              uint64_t MediaSubType = CMFormatDescriptionGetMediaSubType(v18);
              if (v6[2](v6, MediaSubType))
              {
                uint64_t v20 = objc_opt_new();
                objc_storeStrong((id *)(v20 + 8), v12);
                *(void *)(v20 + 16) = v18;
                RichestDecodableFormat = CMAudioFormatDescriptionGetRichestDecodableFormat(v18);
                *(void *)(v20 + 24) = RichestDecodableFormat;
                id v5 = v24;
                if (!RichestDecodableFormat && os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412290;
                  id v35 = v24;
                  _os_log_error_impl(&dword_1A41FE000, MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR, "Unable to get richest decodable audio format for asset %@", buf, 0xCu);
                }
                *(void *)(v20 + 32) = CMAudioFormatDescriptionGetChannelLayout(*(CMAudioFormatDescriptionRef *)(v20 + 16), 0);

                v7 = v25;
                goto LABEL_22;
              }
            }
            uint64_t v15 = [v13 countByEnumeratingWithState:&v26 objects:v36 count:16];
            if (v15) {
              continue;
            }
            break;
          }
        }

        v7 = v25;
        uint64_t v10 = v23;
      }
      uint64_t v9 = [v25 countByEnumeratingWithState:&v30 objects:v37 count:16];
      uint64_t v20 = 0;
      id v5 = v24;
    }
    while (v9);
  }
  else
  {
    uint64_t v20 = 0;
  }
LABEL_22:

  return (id)v20;
}

@end