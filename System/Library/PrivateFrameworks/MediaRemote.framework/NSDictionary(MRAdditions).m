@interface NSDictionary(MRAdditions)
- (BOOL)MR_isEqualToNowPlayingInfo:()MRAdditions;
@end

@implementation NSDictionary(MRAdditions)

- (BOOL)MR_isEqualToNowPlayingInfo:()MRAdditions
{
  v35[2] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  v5 = v4;
  if (v4)
  {
    if (v4 == a1)
    {
      BOOL v18 = 1;
      goto LABEL_26;
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = [a1 count];
      if (v6 == [v5 count])
      {
        v35[0] = @"kMRMediaRemoteNowPlayingInfoTimestamp";
        v35[1] = @"kMRMediaRemoteNowPlayingInfoElapsedTime";
        v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v35 count:2];
        uint64_t v31 = 0;
        v32 = &v31;
        uint64_t v33 = 0x2020000000;
        char v34 = 1;
        uint64_t v24 = MEMORY[0x1E4F143A8];
        uint64_t v25 = 3221225472;
        v26 = __56__NSDictionary_MRAdditions__MR_isEqualToNowPlayingInfo___block_invoke;
        v27 = &unk_1E57D4B38;
        id v8 = v7;
        id v28 = v8;
        id v9 = v5;
        id v29 = v9;
        v30 = &v31;
        [a1 enumerateKeysAndObjectsUsingBlock:&v24];
        if (!*((unsigned char *)v32 + 24))
        {
          BOOL v18 = 0;
LABEL_25:

          _Block_object_dispose(&v31, 8);
          goto LABEL_26;
        }
        v10 = objc_msgSend(a1, "objectForKey:", @"kMRMediaRemoteNowPlayingInfoTimestamp", v24, v25, v26, v27, v28);
        v11 = [v9 objectForKey:@"kMRMediaRemoteNowPlayingInfoTimestamp"];
        v12 = [a1 objectForKey:@"kMRMediaRemoteNowPlayingInfoElapsedTime"];
        uint64_t v13 = [v9 objectForKey:@"kMRMediaRemoteNowPlayingInfoElapsedTime"];
        v14 = (void *)v13;
        if (v10 && v11)
        {
          if (v12 && v13)
          {
            v15 = _MRCreateTemporalContentItemFromNowPlayingInfo(a1);
            v16 = _MRCreateTemporalContentItemFromNowPlayingInfo(v9);
            BOOL IsEqual = MRContentItemCalculatedPlaybackPositionIsEqual(v15, v16);
            *((unsigned char *)v32 + 24) = IsEqual;

LABEL_24:
            BOOL v18 = *((unsigned char *)v32 + 24) != 0;
            goto LABEL_25;
          }
        }
        else if (!v10)
        {
          goto LABEL_19;
        }
        char v19 = _MRNowPlayingValuesAreEqual(v10, v11);
        if (*((unsigned char *)v32 + 24)) {
          char v20 = v19;
        }
        else {
          char v20 = 0;
        }
        *((unsigned char *)v32 + 24) = v20;
LABEL_19:
        if (v12)
        {
          char v21 = _MRNowPlayingValuesAreEqual(v12, v14);
          if (*((unsigned char *)v32 + 24)) {
            char v22 = v21;
          }
          else {
            char v22 = 0;
          }
          *((unsigned char *)v32 + 24) = v22;
        }
        goto LABEL_24;
      }
    }
  }
  BOOL v18 = 0;
LABEL_26:

  return v18;
}

@end