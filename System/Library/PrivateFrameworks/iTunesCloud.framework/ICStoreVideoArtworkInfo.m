@interface ICStoreVideoArtworkInfo
+ (BOOL)supportsSecureCoding;
- (BOOL)isEqual:(id)a3;
- (ICStoreVideoArtworkInfo)initWithCoder:(id)a3;
- (ICStoreVideoArtworkInfo)initWithVideoArtworkResponseDictionary:(id)a3;
- (NSDictionary)responseDictionary;
- (NSString)stringRepresentation;
- (id)CRABSVideoURLMatchingSize:(CGSize)a3;
- (id)HLSVideoURLForAspectRatio:(double)a3;
- (id)_aspectRatioKeyForAspectRatio:(double)a3;
- (id)previewFrameArtworkInfoMatchingAspectRatio:(double)a3;
- (id)supportedSizesForCRABSVideoForAspectRatio:(double)a3;
- (unint64_t)hash;
- (void)encodeWithCoder:(id)a3;
@end

@implementation ICStoreVideoArtworkInfo

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseDictionary, 0);
  objc_storeStrong((id *)&self->_stringRepresentation, 0);
  objc_storeStrong((id *)&self->_aspectRatioToPreviewFrameArtworkInfo, 0);
  objc_storeStrong((id *)&self->_aspectRatioToHLSVideoURL, 0);

  objc_storeStrong((id *)&self->_aspectRatioToCRABSVideoDictionaries, 0);
}

- (NSDictionary)responseDictionary
{
  return self->_responseDictionary;
}

- (NSString)stringRepresentation
{
  return self->_stringRepresentation;
}

- (void)encodeWithCoder:(id)a3
{
}

- (ICStoreVideoArtworkInfo)initWithCoder:(id)a3
{
  v4 = [a3 decodePropertyListForKey:@"responseDictionary"];
  v5 = [(ICStoreVideoArtworkInfo *)self initWithVideoArtworkResponseDictionary:v4];

  return v5;
}

- (unint64_t)hash
{
  uint64_t v3 = MSVHasherSharedSeed();
  uint64_t v5 = v4;
  uint64_t v6 = v3 ^ 0x736F6D6570736575;
  uint64_t v7 = v3 ^ 0x6C7967656E657261;
  uint64_t v8 = v4 ^ 0x646F72616E646F6DLL;
  v9 = (objc_class *)objc_opt_class();
  v10 = NSStringFromClass(v9);
  uint64_t v11 = [v10 hash];
  uint64_t v12 = v5 ^ 0x7465646279746573 ^ v11;
  uint64_t v13 = (v6 + v8) ^ __ROR8__(v8, 51);
  uint64_t v14 = v7 + v12;
  uint64_t v15 = (v7 + v12) ^ __ROR8__(v12, 48);
  uint64_t v16 = v15 + __ROR8__(v6 + v8, 32);
  uint64_t v58 = __ROR8__(v14 + v13, 32);
  uint64_t v60 = v16 ^ __ROR8__(v15, 43);
  uint64_t v17 = v16 ^ v11;
  uint64_t v56 = (v14 + v13) ^ __ROR8__(v13, 47);

  v18 = self->_responseDictionary;
  uint64_t v19 = [(NSDictionary *)v18 hash];
  uint64_t v20 = (v17 + v56) ^ __ROR8__(v56, 51);
  uint64_t v21 = v58 + (v60 ^ v19);
  uint64_t v22 = __ROR8__(v60 ^ v19, 48);
  uint64_t v23 = (v21 ^ v22) + __ROR8__(v17 + v56, 32);
  uint64_t v24 = v23 ^ __ROR8__(v21 ^ v22, 43);
  uint64_t v25 = v21 + v20;
  uint64_t v59 = __ROR8__(v25, 32);
  uint64_t v61 = v24;
  uint64_t v55 = v23 ^ v19;
  uint64_t v57 = v25 ^ __ROR8__(v20, 47);

  uint64_t v26 = (v55 + v57) ^ __ROR8__(v57, 51);
  uint64_t v27 = v59 + (v61 ^ 0x1000000000000000);
  uint64_t v28 = __ROR8__(v61 ^ 0x1000000000000000, 48);
  uint64_t v29 = (v27 ^ v28) + __ROR8__(v55 + v57, 32);
  uint64_t v30 = v29 ^ __ROR8__(v27 ^ v28, 43);
  uint64_t v31 = v27 + v26;
  uint64_t v32 = v31 ^ __ROR8__(v26, 47);
  uint64_t v33 = (v29 ^ 0x1000000000000000) + v32;
  uint64_t v34 = v33 ^ __ROR8__(v32, 51);
  uint64_t v35 = (__ROR8__(v31, 32) ^ 0xFFLL) + v30;
  uint64_t v36 = __ROR8__(v30, 48);
  uint64_t v37 = __ROR8__(v33, 32) + (v35 ^ v36);
  uint64_t v38 = v37 ^ __ROR8__(v35 ^ v36, 43);
  uint64_t v39 = v34 + v35;
  uint64_t v40 = v39 ^ __ROR8__(v34, 47);
  uint64_t v41 = v40 + v37;
  uint64_t v42 = v41 ^ __ROR8__(v40, 51);
  uint64_t v43 = __ROR8__(v39, 32) + v38;
  uint64_t v44 = __ROR8__(v38, 48);
  uint64_t v45 = __ROR8__(v41, 32) + (v43 ^ v44);
  uint64_t v46 = v45 ^ __ROR8__(v43 ^ v44, 43);
  uint64_t v47 = v42 + v43;
  uint64_t v48 = v47 ^ __ROR8__(v42, 47);
  uint64_t v49 = v48 + v45;
  uint64_t v50 = v49 ^ __ROR8__(v48, 51);
  uint64_t v51 = __ROR8__(v47, 32) + v46;
  uint64_t v52 = __ROR8__(v46, 48);
  uint64_t v53 = __ROR8__(v49, 32) + (v51 ^ v52);
  return (v50 + v51) ^ __ROR8__(v50, 47) ^ v53 ^ __ROR8__(v50 + v51, 32) ^ v53 ^ __ROR8__(v51 ^ v52, 43);
}

- (BOOL)isEqual:(id)a3
{
  uint64_t v4 = (ICStoreVideoArtworkInfo *)a3;
  if (self == v4)
  {
    char v7 = 1;
  }
  else if ([(ICStoreVideoArtworkInfo *)v4 isMemberOfClass:objc_opt_class()])
  {
    responseDictionary = self->_responseDictionary;
    uint64_t v6 = [(ICStoreVideoArtworkInfo *)v4 responseDictionary];
    if (responseDictionary == v6) {
      char v7 = 1;
    }
    else {
      char v7 = [(NSDictionary *)responseDictionary isEqual:v6];
    }
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (id)_aspectRatioKeyForAspectRatio:(double)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend(NSNumber, "numberWithDouble:");
  uint64_t v6 = [(NSDictionary *)self->_aspectRatioToCRABSVideoDictionaries objectForKeyedSubscript:v5];

  if (v6)
  {
    id v7 = v5;
  }
  else
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v8 = [(NSDictionary *)self->_aspectRatioToCRABSVideoDictionaries allKeys];
    id v7 = (id)[v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v9 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v8);
          }
          uint64_t v11 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          [v11 doubleValue];
          if (vabdd_f64(v12, a3) <= 0.12)
          {
            id v7 = v11;
            goto LABEL_13;
          }
        }
        id v7 = (id)[v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }

  return v7;
}

- (id)previewFrameArtworkInfoMatchingAspectRatio:(double)a3
{
  uint64_t v4 = [(ICStoreVideoArtworkInfo *)self _aspectRatioKeyForAspectRatio:a3];
  uint64_t v5 = [(NSDictionary *)self->_aspectRatioToPreviewFrameArtworkInfo objectForKeyedSubscript:v4];

  return v5;
}

- (id)HLSVideoURLForAspectRatio:(double)a3
{
  uint64_t v4 = [(ICStoreVideoArtworkInfo *)self _aspectRatioKeyForAspectRatio:a3];
  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)self->_aspectRatioToHLSVideoURL objectForKeyedSubscript:v4];
    uint64_t v6 = [v5 absoluteString];
    uint64_t v7 = [v6 length];

    if (v7) {
      id v8 = v5;
    }
    else {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)CRABSVideoURLMatchingSize:(CGSize)a3
{
  double height = a3.height;
  double width = a3.width;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = [(ICStoreVideoArtworkInfo *)self _aspectRatioKeyForAspectRatio:a3.width / a3.height];
  if (v6)
  {
    uint64_t v29 = v6;
    uint64_t v7 = [(NSDictionary *)self->_aspectRatioToCRABSVideoDictionaries objectForKeyedSubscript:v6];
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v30 = 0;
      uint64_t v10 = *(void *)v32;
      uint64_t v11 = @"width";
      double v12 = @"height";
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v32 != v10) {
            objc_enumerationMutation(v7);
          }
          long long v14 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          long long v15 = [v14 objectForKey:v11];
          long long v16 = [v14 objectForKey:v12];
          [v15 doubleValue];
          double v18 = v17;
          [v16 doubleValue];
          double v20 = vabdd_f64(v19, height);
          if (vabdd_f64(v18, width) <= 0.00000011920929 && v20 <= 0.00000011920929)
          {
            uint64_t v22 = objc_msgSend(v14, "objectForKeyedSubscript:", @"assetUrl", v20);
            [MEMORY[0x1E4F1CB10] URLWithString:v22];
            uint64_t v23 = v12;
            uint64_t v24 = v11;
            v26 = uint64_t v25 = v7;

            uint64_t v30 = (void *)v26;
            uint64_t v7 = v25;
            uint64_t v11 = v24;
            double v12 = v23;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v35 count:16];
      }
      while (v9);
    }
    else
    {
      uint64_t v30 = 0;
    }

    uint64_t v6 = v29;
    uint64_t v27 = v30;
  }
  else
  {
    uint64_t v27 = 0;
  }

  return v27;
}

- (id)supportedSizesForCRABSVideoForAspectRatio:(double)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(ICStoreVideoArtworkInfo *)self _aspectRatioKeyForAspectRatio:a3];
  id v23 = [MEMORY[0x1E4F1CA80] set];
  if (v4)
  {
    uint64_t v5 = [(NSDictionary *)self->_aspectRatioToPreviewFrameArtworkInfo objectForKeyedSubscript:v4];
    uint64_t v22 = v4;
    uint64_t v6 = [(NSDictionary *)self->_aspectRatioToCRABSVideoDictionaries objectForKeyedSubscript:v4];
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v25;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void **)(*((void *)&v24 + 1) + 8 * i);
          double v12 = [v11 objectForKey:@"width"];
          uint64_t v13 = [v11 objectForKey:@"height"];
          [v12 doubleValue];
          double v15 = v14;
          [v13 doubleValue];
          double v17 = v16;
          [v5 originalSize];
          if (v15 < v18)
          {
            [v5 originalSize];
            if (v17 < v19)
            {
              double v20 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithCGSize:", v15, v17);
              if (v20) {
                [v23 addObject:v20];
              }
            }
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v8);
    }

    uint64_t v4 = v22;
  }

  return v23;
}

- (ICStoreVideoArtworkInfo)initWithVideoArtworkResponseDictionary:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
  uint64_t v7 = [MEMORY[0x1E4F1CA60] dictionary];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __66__ICStoreVideoArtworkInfo_initWithVideoArtworkResponseDictionary___block_invoke;
  v42[3] = &unk_1E5ACD128;
  uint64_t v8 = self;
  uint64_t v43 = v8;
  id v33 = v5;
  id v9 = v5;
  id v44 = v9;
  id v32 = v6;
  id v36 = v6;
  id v45 = v36;
  id v10 = v7;
  id v46 = v10;
  uint64_t v35 = v4;
  [v4 enumerateKeysAndObjectsUsingBlock:v42];
  uint64_t v11 = [v9 allKeys];
  double v12 = [v11 lastObject];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  uint64_t v13 = [v9 allKeys];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v38 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v39 != v16) {
          objc_enumerationMutation(v13);
        }
        double v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        if ([v18 compare:v12] == 1)
        {
          id v19 = v18;

          double v12 = v19;
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v38 objects:v47 count:16];
    }
    while (v15);
  }

  double v20 = [v10 objectForKeyedSubscript:v12];
  uint64_t v21 = [v20 stringRepresentation];

  uint64_t v22 = [v9 objectForKeyedSubscript:v12];
  id v23 = [v36 objectForKeyedSubscript:v12];
  long long v24 = [v23 absoluteString];

  long long v25 = [v22 lastObject];
  long long v26 = [v25 objectForKeyedSubscript:@"assetUrl"];

  long long v27 = [NSString stringWithFormat:@"pf=%@/hls=%@/crabs=%@", v21, v24, v26];
  v37.receiver = v8;
  v37.super_class = (Class)ICStoreVideoArtworkInfo;
  uint64_t v28 = [(ICStoreVideoArtworkInfo *)&v37 init];
  p_isa = (id *)&v28->super.isa;
  if (v28)
  {
    objc_storeStrong((id *)&v28->_responseDictionary, a3);
    objc_storeStrong(p_isa + 1, v33);
    objc_storeStrong(p_isa + 2, v32);
    objc_storeStrong(p_isa + 3, v7);
    objc_storeStrong(p_isa + 4, v27);
  }
  uint64_t v30 = p_isa;

  return v30;
}

void __66__ICStoreVideoArtworkInfo_initWithVideoArtworkResponseDictionary___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (_NSIsNSDictionary())
  {
    uint64_t v5 = [v4 objectForKeyedSubscript:@"previewFrame"];
    if (_NSIsNSDictionary())
    {
      uint64_t v6 = [[ICStoreArtworkInfo alloc] initWithArtworkResponseDictionary:v5];
      if (v6)
      {
        uint64_t v7 = [v5 objectForKeyedSubscript:@"width"];
        uint64_t v8 = [v5 objectForKeyedSubscript:@"height"];
        if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
        {
          uint64_t v43 = a1;
          [v7 doubleValue];
          double v10 = v9;
          [v8 doubleValue];
          double v12 = v10 / v11;
          uint64_t v13 = [NSNumber numberWithDouble:v12];
          uint64_t v14 = [v4 objectForKeyedSubscript:@"video"];
          long long v40 = v6;
          long long v41 = v5;
          long long v38 = v8;
          long long v39 = v7;
          id v36 = (void *)v14;
          objc_super v37 = (void *)v13;
          if (_NSIsNSString())
          {
            uint64_t v34 = [MEMORY[0x1E4F1CB10] URLWithString:v14];
          }
          else
          {
            uint64_t v34 = 0;
          }
          id v42 = v4;
          uint64_t v15 = objc_msgSend(v4, "objectForKeyedSubscript:", @"videoFile", v34);
          id v44 = [MEMORY[0x1E4F1CA48] array];
          long long v47 = 0u;
          long long v48 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v16 = v15;
          uint64_t v17 = [v16 countByEnumeratingWithState:&v47 objects:v59 count:16];
          if (v17)
          {
            uint64_t v18 = v17;
            uint64_t v19 = *(void *)v48;
            double v20 = @"height";
            id v46 = v16;
            do
            {
              for (uint64_t i = 0; i != v18; ++i)
              {
                if (*(void *)v48 != v19) {
                  objc_enumerationMutation(v16);
                }
                uint64_t v22 = *(void **)(*((void *)&v47 + 1) + 8 * i);
                if (_NSIsNSDictionary())
                {
                  id v23 = [v22 objectForKey:@"width"];
                  long long v24 = [v22 objectForKey:v20];
                  if (objc_opt_respondsToSelector() & 1) != 0 && (objc_opt_respondsToSelector())
                  {
                    long long v25 = v20;
                    long long v26 = [v22 objectForKey:@"assetUrl"];
                    if (_NSIsNSString() && [v26 length])
                    {
                      long long v27 = [MEMORY[0x1E4F1CB10] URLWithString:v26];
                      if (v27)
                      {
                        [v23 floatValue];
                        double v29 = v28;
                        [v24 floatValue];
                        double v31 = v29 / v30;
                        if (vabdd_f64(v12, v31) <= 0.12)
                        {
                          [v44 addObject:v22];
                          double v12 = v31;
                        }
                        else
                        {
                          log = os_log_create("com.apple.amp.iTunesCloud", "StoreArtworkInfo");
                          if (os_log_type_enabled(log, OS_LOG_TYPE_ERROR))
                          {
                            uint64_t v32 = *(void *)(v43 + 32);
                            *(_DWORD *)buf = 134218754;
                            uint64_t v52 = v32;
                            __int16 v53 = 2048;
                            double v54 = v31;
                            __int16 v55 = 2048;
                            double v56 = v12;
                            __int16 v57 = 2112;
                            uint64_t v58 = v22;
                            _os_log_impl(&dword_1A2D01000, log, OS_LOG_TYPE_ERROR, "NSURL: %p -initWithMasterPlaylistURL: Omitting video dictionary [received video dictionary with inconsistent aspect ratio] currentAspectRatio=%f aspectRatio=%f videoDictionary=%@", buf, 0x2Au);
                          }
                        }
                      }
                    }
                    double v20 = v25;
                    id v16 = v46;
                  }
                }
              }
              uint64_t v18 = [v16 countByEnumeratingWithState:&v47 objects:v59 count:16];
            }
            while (v18);
          }

          [*(id *)(v43 + 40) setObject:v44 forKeyedSubscript:v37];
          if (v35)
          {
            [*(id *)(v43 + 48) setObject:v35 forKeyedSubscript:v37];
          }
          else
          {
            id v33 = [MEMORY[0x1E4F1CB10] URLWithString:&stru_1EF5F5C40];
            [*(id *)(v43 + 48) setObject:v33 forKeyedSubscript:v37];
          }
          uint64_t v6 = v40;
          uint64_t v5 = v41;
          uint64_t v8 = v38;
          uint64_t v7 = v39;
          [*(id *)(v43 + 56) setObject:v40 forKeyedSubscript:v37];

          id v4 = v42;
        }
      }
    }
  }
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end