@interface PHAsset(PXMetadataDetailsContentItem)
- (BOOL)ipx_isRAWOnTop;
- (BOOL)px_isAudio;
- (BOOL)px_isExtendedPropertiesProcessed;
- (BOOL)px_isImage;
- (BOOL)px_isVideo;
- (id)_px_currentRAWResource;
- (id)px_FPS;
- (id)px_ISORating;
- (id)px_aperture;
- (id)px_assetDescription;
- (id)px_bitRate;
- (id)px_codec;
- (id)px_digitalZoomRatio;
- (id)px_exposureBias;
- (id)px_filename;
- (id)px_filesize;
- (id)px_flash;
- (id)px_focalLength;
- (id)px_focalLengthIn35mm;
- (id)px_formattedCameraModel;
- (id)px_lensModel;
- (id)px_make;
- (id)px_meteringMode;
- (id)px_model;
- (id)px_originalTimeZone;
- (id)px_sampleRate;
- (id)px_semanticStylePreset;
- (id)px_shutterSpeed;
- (id)px_timeZone;
- (id)px_title;
- (id)px_whiteBalance;
- (uint64_t)px_audioTrackFormat;
- (uint64_t)px_canUseLocation;
- (uint64_t)px_duration;
- (uint64_t)px_fetchCloudLocalState;
- (uint64_t)px_hasKeywords;
- (uint64_t)px_isH264;
- (uint64_t)px_isHEVC;
- (uint64_t)px_isPanorama;
- (uint64_t)px_isSelfie;
- (uint64_t)px_originalCreationDate;
- (uint64_t)px_originalLocation;
- (uint64_t)px_originalType;
- (uint64_t)px_resolution;
- (uint64_t)px_reverseLocationDataIsValid;
- (uint64_t)px_supportsImageProperties;
- (uint64_t)px_type;
- (unint64_t)px_fileType;
- (unint64_t)px_isActionModeVideo;
- (unint64_t)px_isDepthEffect;
- (unint64_t)px_isScreenRecording;
- (unint64_t)px_isScreenshot;
- (unint64_t)px_isSloMo;
- (unint64_t)px_isTimelapse;
- (unint64_t)px_originalFileType;
@end

@implementation PHAsset(PXMetadataDetailsContentItem)

- (id)px_semanticStylePreset
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  v2 = [v1 semanticStylePreset];

  return v2;
}

- (uint64_t)px_isHEVC
{
  v1 = objc_msgSend(a1, "px_codec");
  v2 = PXStringForOSType(0x68766331u);
  uint64_t v3 = [v1 isEqualToString:v2];

  return v3;
}

- (uint64_t)px_isH264
{
  v1 = objc_msgSend(a1, "px_codec");
  v2 = PXStringForOSType(0x61766331u);
  uint64_t v3 = [v1 isEqualToString:v2];

  return v3;
}

- (unint64_t)px_isTimelapse
{
  return ((unint64_t)[a1 mediaSubtypes] >> 18) & 1;
}

- (unint64_t)px_isSloMo
{
  return ((unint64_t)[a1 mediaSubtypes] >> 17) & 1;
}

- (unint64_t)px_isScreenRecording
{
  return ((unint64_t)[a1 mediaSubtypes] >> 19) & 1;
}

- (unint64_t)px_isScreenshot
{
  return ((unint64_t)[a1 mediaSubtypes] >> 2) & 1;
}

- (uint64_t)px_isSelfie
{
  v1 = [a1 cameraCaptureDeviceProperties];
  uint64_t v2 = [v1 isSelfie];

  return v2;
}

- (uint64_t)px_isPanorama
{
  return [a1 mediaSubtypes] & 1;
}

- (unint64_t)px_isActionModeVideo
{
  return ((unint64_t)[a1 mediaSubtypes] >> 22) & 1;
}

- (unint64_t)px_isDepthEffect
{
  return ((unint64_t)[a1 mediaSubtypes] >> 4) & 1;
}

- (BOOL)ipx_isRAWOnTop
{
  return [a1 RAWBadgeAttributes] == 1;
}

- (uint64_t)px_reverseLocationDataIsValid
{
  v1 = [a1 photosOneUpProperties];
  uint64_t v2 = [v1 reverseLocationDataIsValid];

  return v2;
}

- (uint64_t)px_canUseLocation
{
  uint64_t v2 = [a1 location];

  if (!v2) {
    return 0;
  }
  uint64_t v3 = (void *)MEMORY[0x1E4F8A930];
  v4 = [a1 location];
  [v4 coordinate];
  uint64_t v5 = objc_msgSend(v3, "canUseCoordinate:");

  return v5;
}

- (uint64_t)px_audioTrackFormat
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 trackFormat];
  uint64_t v3 = [v2 unsignedIntValue];

  return v3;
}

- (id)px_whiteBalance
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 whiteBalance];

  return v2;
}

- (id)px_shutterSpeed
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 shutterSpeed];

  return v2;
}

- (id)px_meteringMode
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 meteringMode];

  return v2;
}

- (id)px_formattedCameraModel
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 formattedCameraModel];

  return v2;
}

- (id)px_model
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 cameraModel];

  return v2;
}

- (id)px_make
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 cameraMake];

  return v2;
}

- (id)px_lensModel
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 lensModel];

  return v2;
}

- (id)px_ISORating
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 iso];

  return v2;
}

- (id)px_digitalZoomRatio
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 digitalZoomRatio];

  return v2;
}

- (id)px_focalLengthIn35mm
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 focalLengthIn35mm];

  return v2;
}

- (id)px_focalLength
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 focalLength];

  return v2;
}

- (id)px_flash
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 flashFired];

  return v2;
}

- (id)px_exposureBias
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 exposureBias];

  return v2;
}

- (id)px_aperture
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 aperture];

  return v2;
}

- (id)px_codec
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 codec];

  return v2;
}

- (id)px_sampleRate
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 sampleRate];

  return v2;
}

- (id)px_bitRate
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 bitrate];

  return v2;
}

- (id)px_FPS
{
  v1 = [a1 photosInfoPanelExtendedProperties];
  uint64_t v2 = [v1 fps];

  return v2;
}

- (uint64_t)px_duration
{
  v1 = NSNumber;
  [a1 duration];
  return objc_msgSend(v1, "numberWithDouble:");
}

- (uint64_t)px_hasKeywords
{
  return 0;
}

- (uint64_t)px_supportsImageProperties
{
  uint64_t result = [a1 mediaType];
  if (result != 1) {
    return [a1 mediaType] == 2;
  }
  return result;
}

- (uint64_t)px_resolution
{
  uint64_t v2 = objc_msgSend(a1, "_px_currentRAWResource");
  uint64_t v3 = v2;
  if (v2)
  {
    uint64_t v4 = [v2 pixelWidth];
    uint64_t v5 = v3;
  }
  else
  {
    uint64_t v4 = [a1 pixelWidth];
    uint64_t v5 = a1;
  }
  [v5 pixelHeight];

  return v4;
}

- (uint64_t)px_fetchCloudLocalState
{
  v1 = [a1 cloudLocalStateProperties];
  uint64_t v2 = [v1 assetCloudLocalState];

  return v2;
}

- (id)px_originalTimeZone
{
  id v4 = 0;
  v1 = [a1 originalCreationDateWithTimeZone:&v4];
  id v2 = v4;
  if (!v2)
  {
    id v2 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  }

  return v2;
}

- (id)px_timeZone
{
  v1 = [a1 originalMetadataProperties];
  id v2 = [v1 timeZone];
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CAF0] localTimeZone];
  }
  uint64_t v5 = v4;

  return v5;
}

- (uint64_t)px_originalLocation
{
  return PHAssetOriginalLocationForAsset();
}

- (uint64_t)px_originalCreationDate
{
  return [a1 originalCreationDateWithTimeZone:0];
}

- (id)px_filesize
{
  id v2 = objc_msgSend(a1, "_px_currentRAWResource");
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v2, "fileSize"));
  }
  else
  {
    [a1 fetchPropertySetsIfNeeded];
    uint64_t v5 = NSNumber;
    v6 = [a1 originalMetadataProperties];
    id v4 = objc_msgSend(v5, "numberWithUnsignedLong:", objc_msgSend(v6, "originalFilesize"));
  }
  return v4;
}

- (id)px_filename
{
  id v2 = objc_msgSend(a1, "_px_currentRAWResource");
  uint64_t v3 = v2;
  if (!v2) {
    id v2 = a1;
  }
  id v4 = [v2 originalFilename];

  return v4;
}

- (BOOL)px_isExtendedPropertiesProcessed
{
  [a1 fetchPropertySetsIfNeeded];
  id v2 = [a1 photosInfoPanelExtendedProperties];
  BOOL v3 = v2 != 0;

  return v3;
}

- (id)px_assetDescription
{
  v1 = [a1 descriptionProperties];
  id v2 = [v1 assetDescription];

  return v2;
}

- (id)px_title
{
  v1 = [a1 descriptionProperties];
  id v2 = [v1 title];

  return v2;
}

- (unint64_t)px_originalFileType
{
  uint64_t v2 = objc_msgSend(a1, "px_originalType");
  return +[PXMetadataUtilities fileTypeForItem:a1 type:v2];
}

- (unint64_t)px_fileType
{
  uint64_t v2 = objc_msgSend(a1, "px_type");
  return +[PXMetadataUtilities fileTypeForItem:a1 type:v2];
}

- (uint64_t)px_originalType
{
  v1 = (void *)MEMORY[0x1E4F8CDF8];
  uint64_t v2 = [MEMORY[0x1E4F38EB8] originalUniformTypeIdentifierForAsset:a1];
  BOOL v3 = [v1 typeWithIdentifier:v2];

  if ([v3 conformsToType:*MEMORY[0x1E4F44410]])
  {
    uint64_t v4 = 0;
  }
  else
  {
    uint64_t v5 = [MEMORY[0x1E4F8CDF8] avifType];
    char v6 = [v3 conformsToType:v5];

    if (v6)
    {
      uint64_t v4 = 11;
    }
    else if ([v3 conformsToType:*MEMORY[0x1E4F44568]])
    {
      uint64_t v4 = 1;
    }
    else if ([v3 conformsToType:*MEMORY[0x1E4F44498]])
    {
      uint64_t v4 = 2;
    }
    else if ([v3 conformsToType:*MEMORY[0x1E4F443D0]])
    {
      uint64_t v4 = 3;
    }
    else if ([v3 conformsToType:*MEMORY[0x1E4F44460]])
    {
      uint64_t v4 = 4;
    }
    else if ([v3 conformsToType:*MEMORY[0x1E4F444E0]])
    {
      uint64_t v4 = 5;
    }
    else if ([v3 conformsToType:*MEMORY[0x1E4F44450]])
    {
      uint64_t v4 = 6;
    }
    else
    {
      v7 = [MEMORY[0x1E4F8CDF8] adobePhotoshopType];
      char v8 = [v3 conformsToType:v7];

      if (v8)
      {
        uint64_t v4 = 7;
      }
      else
      {
        v9 = [MEMORY[0x1E4F8CDF8] jpeg2000Type];
        char v10 = [v3 conformsToType:v9];

        if (v10)
        {
          uint64_t v4 = 8;
        }
        else if ([v3 conformsToType:*MEMORY[0x1E4F44330]])
        {
          uint64_t v4 = 9;
        }
        else if ([v3 conformsToType:*MEMORY[0x1E4F44448]])
        {
          uint64_t v4 = 10;
        }
        else
        {
          uint64_t v4 = 12;
        }
      }
    }
  }

  return v4;
}

- (uint64_t)px_type
{
  uint64_t v2 = [a1 RAWBadgeAttributes];
  char v3 = [a1 isJPEG];
  uint64_t result = 0;
  if ((v3 & 1) == 0 && v2 != 2)
  {
    if ([a1 isHEIF])
    {
      return 1;
    }
    else
    {
      char v5 = [a1 isRAW];
      uint64_t result = 2;
      if ((v5 & 1) == 0 && v2 != 1)
      {
        if ([a1 isAnimatedGIF])
        {
          return 3;
        }
        else if ([a1 isPNG])
        {
          return 4;
        }
        else if ([a1 isTIFF])
        {
          return 5;
        }
        else if ([a1 isPDF])
        {
          return 6;
        }
        else if ([a1 isPSD])
        {
          return 7;
        }
        else if ([a1 isJPEG2000])
        {
          return 8;
        }
        else if ([a1 isAudio])
        {
          return 9;
        }
        else if ([a1 isVideo])
        {
          return 10;
        }
        else
        {
          return 12;
        }
      }
    }
  }
  return result;
}

- (BOOL)px_isAudio
{
  return [a1 mediaType] == 3;
}

- (BOOL)px_isVideo
{
  return [a1 mediaType] == 2;
}

- (BOOL)px_isImage
{
  return [a1 mediaType] == 1;
}

- (id)_px_currentRAWResource
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend(a1, "ipx_isRAWOnTop"))
  {
    objc_getAssociatedObject(a1, (const void *)_px_currentRAWResource_PXSelectionProviderContentItemCurrentRawResourceKey);
    id v2 = (id)objc_claimAutoreleasedReturnValue();
    if (!v2)
    {
      [MEMORY[0x1E4F38F60] assetResourcesForAsset:a1];
      long long v8 = 0u;
      long long v9 = 0u;
      long long v10 = 0u;
      long long v11 = 0u;
      id v3 = (id)objc_claimAutoreleasedReturnValue();
      id v2 = (id)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v2)
      {
        uint64_t v4 = *(void *)v9;
        while (2)
        {
          for (i = 0; i != v2; i = (char *)i + 1)
          {
            if (*(void *)v9 != v4) {
              objc_enumerationMutation(v3);
            }
            char v6 = *(void **)(*((void *)&v8 + 1) + 8 * i);
            if (objc_msgSend(v6, "type", (void)v8) == 4)
            {
              id v2 = v6;
              objc_setAssociatedObject(a1, (const void *)_px_currentRAWResource_PXSelectionProviderContentItemCurrentRawResourceKey, v2, (void *)1);
              goto LABEL_14;
            }
          }
          id v2 = (id)[v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
          if (v2) {
            continue;
          }
          break;
        }
      }
LABEL_14:
    }
  }
  else
  {
    id v2 = 0;
  }
  return v2;
}

@end