@interface IPAVideoAdjustmentStackSerializer_v10
- (id)archiveFromData:(id)a3 error:(id *)a4;
- (id)dataFromArchive:(id)a3 error:(id *)a4;
- (id)dataFromVideoAdjustmentStack:(id)a3 error:(id *)a4;
- (id)videoAdjustmentFromArchive:(id)a3 error:(id *)a4;
- (id)videoAdjustmentStackFromData:(id)a3 error:(id *)a4;
@end

@implementation IPAVideoAdjustmentStackSerializer_v10

- (id)archiveFromData:(id)a3 error:(id *)a4
{
  v5 = +[IPAAdjustmentStackSerializer decompressData:error:](IPAAdjustmentStackSerializer, "decompressData:error:", a3);
  if (v5)
  {
    v6 = +[IPAAdjustmentStackSerializer JSONFromData:v5 error:a4];
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)videoAdjustmentStackFromData:(id)a3 error:(id *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v41 = 0;
  v5 = +[IPAAdjustmentStackSerializer decompressData:a3 error:&v41];
  id v6 = v41;
  if (v5)
  {
    id v40 = v6;
    v7 = +[IPAAdjustmentStackSerializer JSONFromData:v5 error:&v40];
    id v8 = v40;

    id v6 = v8;
  }
  else
  {
    v7 = 0;
  }
  v9 = [v7 objectForKeyedSubscript:@"adjustments"];
  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = [v9 count];
      if (v10)
      {
        v30 = v7;
        v31 = v5;
        v11 = [MEMORY[0x1E4F1CA48] arrayWithCapacity:v10];
        long long v36 = 0u;
        long long v37 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v12 = v9;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
        if (v13)
        {
          uint64_t v14 = v13;
          uint64_t v15 = *(void *)v37;
LABEL_9:
          uint64_t v16 = 0;
          while (1)
          {
            if (*(void *)v37 != v15) {
              objc_enumerationMutation(v12);
            }
            uint64_t v17 = *(void *)(*((void *)&v36 + 1) + 8 * v16);
            id v35 = v6;
            v18 = [(IPAVideoAdjustmentStackSerializer_v10 *)self videoAdjustmentFromArchive:v17 error:&v35];
            id v19 = v35;

            if (v18) {
              [v11 addObject:v18];
            }

            if (v19) {
              break;
            }
            id v6 = 0;
            if (v14 == ++v16)
            {
              uint64_t v14 = [v12 countByEnumeratingWithState:&v36 objects:v42 count:16];
              id v6 = 0;
              id v19 = 0;
              if (v14) {
                goto LABEL_9;
              }
              break;
            }
          }
        }
        else
        {
          id v19 = v6;
        }

        v7 = v30;
        v5 = v31;
        if (v11) {
          goto LABEL_23;
        }
      }
      else
      {
        id v19 = v6;
      }
      v11 = [MEMORY[0x1E4F1C978] array];
LABEL_23:
      v26 = objc_opt_new();
      [v26 setAdjustments:v11];
      id v6 = v11;
      goto LABEL_24;
    }
  }
  objc_opt_class();
  IPAAdjustmentError(1001, @"bad input: archived '%@' missing or wrong type: %@", v20, v21, v22, v23, v24, v25, @"adjustments");
  id v19 = (id)objc_claimAutoreleasedReturnValue();
  v26 = 0;
LABEL_24:

  CMTime v34 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48];
  CFDictionaryRef v27 = [v7 objectForKeyedSubscript:@"naturalDuration"];
  CFDictionaryRef v28 = v27;
  if (v27)
  {
    memset(&v33, 0, sizeof(v33));
    CMTimeMakeFromDictionary(&v33, v27);
    if (v33.flags) {
      CMTime v34 = v33;
    }
  }
  CMTime v32 = v34;
  [v26 setNaturalDuration:&v32];

  return v26;
}

- (id)videoAdjustmentFromArchive:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 objectForKeyedSubscript:@"identifier"];
  v7 = [v5 objectForKeyedSubscript:@"version"];
  if (!v7)
  {
    v7 = [v5 objectForKeyedSubscript:@"formatVersion"];
  }
  id v8 = [v5 objectForKeyedSubscript:@"settings"];
  if (!v6 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0) || ![v6 length])
  {
    uint64_t v31 = objc_opt_class();
    IPAAdjustmentError(1001, @"bad input: identifier missing or wrong type: %@, expected NSString", v17, v18, v19, v20, v21, v22, v31);
    goto LABEL_12;
  }
  if (!v8 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v32 = objc_opt_class();
    IPAAdjustmentError(1001, @"bad input: settings missing or wrong type: %@, expected NSDictionary", v25, v26, v27, v28, v29, v30, v32);
    uint64_t v16 = LABEL_12:;
    uint64_t v23 = 0;
    if (!a4) {
      goto LABEL_15;
    }
    goto LABEL_13;
  }
  if (v7)
  {
    uint64_t v15 = +[IPAAdjustmentVersion versionFromArchivalRepresentation:v7];
    if (v15)
    {
      uint64_t v16 = 0;
    }
    else
    {
      uint64_t v16 = IPAAdjustmentError(1001, @"bad input: invalid formatVersion %@", v9, v10, v11, v12, v13, v14, (uint64_t)v7);
    }
  }
  else
  {
    uint64_t v16 = 0;
    uint64_t v15 = 0;
  }
  uint64_t v23 = objc_opt_new();
  [v23 setIdentifier:v6];
  [v23 setVersion:v15];
  [v23 setSettings:v8];

  if (!a4) {
    goto LABEL_15;
  }
LABEL_13:
  if (v16) {
    *a4 = v16;
  }
LABEL_15:

  return v23;
}

- (id)dataFromArchive:(id)a3 error:(id *)a4
{
  id v5 = +[IPAAdjustmentStackSerializer dataFromJSON:error:](IPAAdjustmentStackSerializer, "dataFromJSON:error:", a3);
  if (v5)
  {
    id v6 = +[IPAAdjustmentStackSerializer compressData:v5 error:a4];
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)dataFromVideoAdjustmentStack:(id)a3 error:(id *)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v32 = objc_opt_new();
  CMTime v34 = v4;
  id v35 = objc_opt_new();
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v5 = [v4 adjustments];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    id v8 = "-[IPAVideoAdjustmentStackSerializer_v10 dataFromVideoAdjustmentStack:error:]";
    uint64_t v9 = "/Library/Caches/com.apple.xbs/Sources/Photos/lib/photosimagingfoundation/source/adjustments/serialization/seria"
         "lizers/video/IPAVideoAdjustmentStackSerializer_v10.m";
    uint64_t v10 = *(void *)v41;
    do
    {
      uint64_t v11 = 0;
      uint64_t v36 = v7;
      do
      {
        if (*(void *)v41 != v10) {
          objc_enumerationMutation(v5);
        }
        uint64_t v12 = *(void **)(*((void *)&v40 + 1) + 8 * v11);
        uint64_t v13 = objc_msgSend(v12, "identifier", v30);
        if (v13)
        {
          uint64_t v14 = [v12 version];
          uint64_t v15 = v14;
          if (v14)
          {
            uint64_t v16 = [v14 archivalRepresentation];
            if (v16)
            {
              uint64_t v17 = v10;
              uint64_t v18 = v5;
              uint64_t v19 = v9;
              uint64_t v20 = v8;
              uint64_t v21 = [v12 settings];
              if (v21)
              {
                uint64_t v22 = objc_opt_new();
                [v22 setObject:v13 forKeyedSubscript:@"identifier"];
                [v22 setObject:v16 forKeyedSubscript:@"formatVersion"];
                [v22 setObject:v21 forKeyedSubscript:@"settings"];
                [v35 addObject:v22];
              }
              else
              {
                uint64_t v30 = v12;
                _PFAssertContinueHandler();
              }

              id v8 = v20;
              uint64_t v9 = v19;
              id v5 = v18;
              uint64_t v10 = v17;
              uint64_t v7 = v36;
            }
            else
            {
              uint64_t v30 = v15;
              _PFAssertContinueHandler();
            }
          }
          else
          {
            uint64_t v30 = v12;
            _PFAssertContinueHandler();
          }
        }
        else
        {
          uint64_t v30 = v12;
          _PFAssertContinueHandler();
        }

        ++v11;
      }
      while (v7 != v11);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v40 objects:v44 count:16];
    }
    while (v7);
  }

  [v32 setObject:v35 forKeyedSubscript:@"adjustments"];
  memset(&v39, 0, sizeof(v39));
  if (v34
    && ([v34 naturalDuration], (v39.flags & 0x1D) == 1)
    && (time1 = v39, CMTime time2 = *(CMTime *)*(void *)&MEMORY[0x1E4F1FA48], CMTimeCompare(&time1, &time2) > 0))
  {
    CMTime time1 = v39;
    uint64_t v23 = CMTimeCopyAsDictionary(&time1, 0);
    uint64_t v24 = a4;
    if (v23) {
      [v32 setObject:v23 forKeyedSubscript:@"naturalDuration"];
    }
  }
  else
  {
    uint64_t v23 = IPAAdjustmentGetLog();
    uint64_t v24 = a4;
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      CMTime time1 = v39;
      uint64_t v25 = (__CFString *)CMTimeCopyDescription((CFAllocatorRef)*MEMORY[0x1E4F1CF80], &time1);
      LODWORD(time1.value) = 138412290;
      *(CMTimeValue *)((char *)&time1.value + 4) = (CMTimeValue)v25;
      _os_log_impl(&dword_1DD3FD000, v23, OS_LOG_TYPE_DEBUG, "invalid natural duration %@ on persist", (uint8_t *)&time1, 0xCu);
    }
  }

  id v37 = 0;
  uint64_t v26 = [(IPAVideoAdjustmentStackSerializer_v10 *)self dataFromArchive:v32 error:&v37];
  id v27 = v37;
  uint64_t v28 = v27;
  if (v24 && v27) {
    *uint64_t v24 = v27;
  }

  return v26;
}

@end