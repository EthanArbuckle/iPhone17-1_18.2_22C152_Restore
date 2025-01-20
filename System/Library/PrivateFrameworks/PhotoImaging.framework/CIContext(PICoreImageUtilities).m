@interface CIContext(PICoreImageUtilities)
- (id)pi_createColorCubeDataForFilters:()PICoreImageUtilities dimension:colorSpace:;
@end

@implementation CIContext(PICoreImageUtilities)

- (id)pi_createColorCubeDataForFilters:()PICoreImageUtilities dimension:colorSpace:
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  unint64_t v9 = a4 * a4;
  v10 = [MEMORY[0x1E4F1CA58] dataWithLength:a4 * a4 * 4 * a4];
  if (v10)
  {
    v49 = v10;
    id v11 = v10;
    v12 = (unsigned char *)[v11 mutableBytes];
    if (a4)
    {
      unint64_t v13 = 0;
      float v14 = (float)(a4 - 1);
      do
      {
        unint64_t v15 = 0;
        float v16 = 255.0;
        float v17 = (float)((float)((float)v13 / v14) * 255.0) + 0.5;
        if (v17 < 255.0) {
          float v16 = (float)((float)((float)v13 / v14) * 255.0) + 0.5;
        }
        int v18 = (int)v16;
        if (v17 < 0.0) {
          LOBYTE(v18) = 0;
        }
        do
        {
          unint64_t v19 = 0;
          float v20 = 255.0;
          float v21 = (float)((float)((float)v15 / v14) * 255.0) + 0.5;
          if (v21 < 255.0) {
            float v20 = (float)((float)((float)v15 / v14) * 255.0) + 0.5;
          }
          int v22 = (int)v20;
          if (v21 < 0.0) {
            LOBYTE(v22) = 0;
          }
          do
          {
            float v23 = 255.0;
            float v24 = (float)((float)((float)v19 / v14) * 255.0) + 0.5;
            if (v24 < 255.0) {
              float v23 = (float)((float)((float)v19 / v14) * 255.0) + 0.5;
            }
            int v25 = (int)v23;
            if (v24 < 0.0) {
              LOBYTE(v25) = 0;
            }
            unsigned char *v12 = v25;
            v12[1] = v22;
            v12[2] = v18;
            v12[3] = -1;
            v12 += 4;
            ++v19;
          }
          while (a4 != v19);
          ++v15;
        }
        while (v15 != a4);
        ++v13;
      }
      while (v13 != a4);
    }
    uint64_t v48 = a4 * a4 * 4 * a4;
    v46 = a1;
    double v26 = (double)a4;
    double v27 = (double)v9;
    uint64_t v45 = 4 * a4;
    unsigned int v44 = *MEMORY[0x1E4F1E2F0];
    uint64_t v47 = a5;
    objc_msgSend(MEMORY[0x1E4F1E050], "imageWithBitmapData:bytesPerRow:size:format:colorSpace:", v11, 4 * a4, (double)a4, (double)v9);
    id v28 = (id)objc_claimAutoreleasedReturnValue();
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v50 = v8;
    id v29 = v8;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v51 objects:v55 count:16];
    v31 = v28;
    if (v30)
    {
      uint64_t v32 = v30;
      uint64_t v33 = *(void *)v52;
      uint64_t v34 = *MEMORY[0x1E4F1E480];
      v31 = v28;
      do
      {
        uint64_t v35 = 0;
        v36 = v31;
        do
        {
          if (*(void *)v52 != v33) {
            objc_enumerationMutation(v29);
          }
          v37 = *(void **)(*((void *)&v51 + 1) + 8 * v35);
          v38 = [v37 valueForKey:v34];
          [v37 setValue:v36 forKey:v34];
          v31 = [v37 outputImage];

          [v37 setValue:v38 forKey:v34];
          ++v35;
          v36 = v31;
        }
        while (v32 != v35);
        uint64_t v32 = [v29 countByEnumeratingWithState:&v51 objects:v55 count:16];
      }
      while (v32);
    }

    v39 = [MEMORY[0x1E4F1CA58] dataWithLength:v48];
    v40 = v39;
    if (v39)
    {
      id v41 = v39;
      objc_msgSend(v46, "render:toBitmap:rowBytes:bounds:format:colorSpace:", v31, objc_msgSend(v41, "mutableBytes"), v45, v44, v47, 0.0, 0.0, v26, v27);
      id v42 = v41;
    }

    v10 = v49;
    id v8 = v50;
  }
  else
  {
    v40 = 0;
  }

  return v40;
}

@end