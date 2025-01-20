@interface PHAsset(PUPerspectiveTransform)
- (__n128)pu_vitalityPerspectiveTransform;
@end

@implementation PHAsset(PUPerspectiveTransform)

- (__n128)pu_vitalityPerspectiveTransform
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  v2 = (_OWORD *)MEMORY[0x1E4F14998];
  long long v17 = *MEMORY[0x1E4F14998];
  if (([a1 hasAdjustments] & 1) == 0)
  {
    v3 = [a1 originalImageProperties];
    v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F2FC20]];
    v5 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F15618]];

    if (v5)
    {
      uint64_t v21 = 0;
      [v5 getBytes:&v21 length:8];
      int v6 = v21;
      if (v21 == 1)
      {
        int v20 = 0;
        memset(v19, 0, sizeof(v19));
        objc_msgSend(v5, "getBytes:range:", v19, HIDWORD(v21), 36);
        uint64_t v7 = 0;
        long long v8 = v2[1];
        *(_OWORD *)buf = *v2;
        long long v23 = v8;
        long long v24 = v2[2];
        v9 = v19;
        do
        {
          uint64_t v10 = 0;
          v11 = &buf[16 * v7];
          long long v12 = *(_OWORD *)v11;
          v13 = (int *)v9;
          do
          {
            int v14 = *v13;
            v13 += 3;
            long long v18 = v12;
            *(_DWORD *)((unint64_t)&v18 & 0xFFFFFFFFFFFFFFF3 | (4 * (v10 & 3))) = v14;
            long long v12 = v18;
            ++v10;
          }
          while (v10 != 3);
          *((_DWORD *)v11 + 2) = DWORD2(v18);
          *(void *)v11 = v12;
          ++v7;
          v9 = (_OWORD *)((char *)v9 + 4);
        }
        while (v7 != 3);
        long long v17 = *(_OWORD *)buf;
      }
      else
      {
        v15 = PLLivePhotoPlaybackGetLog();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = 67109120;
          *(_DWORD *)&buf[4] = v6;
          _os_log_impl(&dword_1AE9F8000, v15, OS_LOG_TYPE_ERROR, "Encountered unknown AVStillImageProcessingHomography version %d. Unable to produce vitality transform.", buf, 8u);
        }
      }
    }
  }
  return (__n128)v17;
}

@end