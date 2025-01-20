@interface AVAsset(PhotoLibraryServices)
- (id)plVideoCodecFourCharCodeString;
- (id)plVideoCodecName;
@end

@implementation AVAsset(PhotoLibraryServices)

- (id)plVideoCodecFourCharCodeString
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:a1];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v14 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v6 isEnabled])
        {
          v8 = [v6 formatDescriptions];
          if ([v8 count])
          {
            v9 = [v8 firstObject];

            FourCharCode MediaSubType = CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v9);
            v12[0] = HIBYTE(MediaSubType);
            v12[1] = BYTE2(MediaSubType);
            v12[2] = BYTE1(MediaSubType);
            v12[3] = MediaSubType;
            v12[4] = 0;
            v7 = (void *)[[NSString alloc] initWithCString:v12 encoding:30];
          }
          else
          {
            v7 = 0;
          }

          goto LABEL_14;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
  v7 = 0;
LABEL_14:

  return v7;
}

- (id)plVideoCodecName
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  [MEMORY[0x1E4F8CC38] tracksWithMediaType:*MEMORY[0x1E4F15C18] forAsset:a1];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v2 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v2)
  {
    uint64_t v3 = v2;
    uint64_t v4 = *(void *)v11;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v11 != v4) {
          objc_enumerationMutation(v1);
        }
        v6 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v6 isEnabled])
        {
          v7 = [v6 formatDescriptions];
          if ([v7 count])
          {
            v8 = [v7 firstObject];

            CMFormatDescriptionGetMediaType((CMFormatDescriptionRef)v8);
            CMFormatDescriptionGetMediaSubType((CMFormatDescriptionRef)v8);
            MTCopyStringsForMediaTypeAndSubType();
          }

          goto LABEL_13;
        }
      }
      uint64_t v3 = [v1 countByEnumeratingWithState:&v10 objects:v14 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  return 0;
}

@end