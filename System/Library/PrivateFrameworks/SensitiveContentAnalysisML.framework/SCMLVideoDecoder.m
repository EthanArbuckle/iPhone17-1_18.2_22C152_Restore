@interface SCMLVideoDecoder
- (AVAssetReader)assetReader;
- (AVAssetReaderTrackOutput)assetReaderTrack;
- (BOOL)startDecodingVideoURL:(id)a3 error:(id *)a4;
- (BOOL)useKeyFrame;
- (SCMLVideoAnalysisConfiguration)config;
- (SCMLVideoDecoder)initWithConfig:(id)a3;
- (double)durationInSeconds;
- (double)totalFrames;
- (id)nextFrameWithError:(id *)a3;
- (unint64_t)currentFrameIndex;
- (unint64_t)frameLimit;
- (unint64_t)framesPerSync;
- (unint64_t)maxNumFrames;
- (void)reset;
- (void)setAssetReader:(id)a3;
- (void)setAssetReaderTrack:(id)a3;
- (void)setConfig:(id)a3;
- (void)setCurrentFrameIndex:(unint64_t)a3;
- (void)setDurationInSeconds:(double)a3;
- (void)setFrameLimit:(unint64_t)a3;
- (void)setFramesPerSync:(unint64_t)a3;
- (void)setTotalFrames:(double)a3;
@end

@implementation SCMLVideoDecoder

- (SCMLVideoDecoder)initWithConfig:(id)a3
{
  id v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)SCMLVideoDecoder;
  v6 = [(SCMLVideoDecoder *)&v10 init];
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_config, a3);
    v8 = [v5 frameLimit];
    v7->_frameLimit = [v8 unsignedIntValue];

    v7->_framesPerSync = [v5 framesPerSync];
  }

  return v7;
}

- (void)reset
{
  [(SCMLVideoDecoder *)self setAssetReader:0];
  [(SCMLVideoDecoder *)self setAssetReaderTrack:0];
  [(SCMLVideoDecoder *)self setCurrentFrameIndex:0];
  [(SCMLVideoDecoder *)self setDurationInSeconds:0.0];

  [(SCMLVideoDecoder *)self setTotalFrames:0.0];
}

- (unint64_t)maxNumFrames
{
  if ([(SCMLVideoDecoder *)self frameLimit]
    && (double v3 = (double)[(SCMLVideoDecoder *)self frameLimit],
        [(SCMLVideoDecoder *)self totalFrames],
        v4 >= v3))
  {
    return [(SCMLVideoDecoder *)self frameLimit];
  }
  else
  {
    [(SCMLVideoDecoder *)self totalFrames];
    return (unint64_t)v5;
  }
}

- (BOOL)useKeyFrame
{
  v2 = [(SCMLVideoDecoder *)self config];
  BOOL v3 = [v2 framesPerSync] != 0;

  return v3;
}

- (BOOL)startDecodingVideoURL:(id)a3 error:(id *)a4
{
  v53[1] = *MEMORY[0x263EF8340];
  id v6 = a3;
  [(SCMLVideoDecoder *)self reset];
  v7 = (void *)[objc_alloc(MEMORY[0x263EFA8D0]) initWithURL:v6 options:0];
  v8 = v7;
  if (v7)
  {
    v9 = [v7 tracksWithMediaType:*MEMORY[0x263EF9D48]];
    if ([v9 count])
    {
      memset(&preferredTimescale, 0, sizeof(preferredTimescale));
      [v8 duration];
      CMTime time = preferredTimescale;
      [(SCMLVideoDecoder *)self setDurationInSeconds:CMTimeGetSeconds(&time)];
      id v49 = 0;
      objc_super v10 = [MEMORY[0x263EFA4C0] assetReaderWithAsset:v8 error:&v49];
      id v11 = v49;
      if (v11)
      {
        if (!a4) {
          goto LABEL_28;
        }
        goto LABEL_26;
      }
      [(SCMLVideoDecoder *)self setAssetReader:v10];
      v16 = [v9 objectAtIndexedSubscript:0];
      [v16 nominalFrameRate];
      float v18 = v17;
      [(SCMLVideoDecoder *)self durationInSeconds];
      [(SCMLVideoDecoder *)self setTotalFrames:floor(v19 * v18)];
      CMTime time = preferredTimescale;
      if ([(SCMLVideoDecoder *)self frameLimit])
      {
        if ([(SCMLVideoDecoder *)self frameLimit] >= 2)
        {
          unint64_t v20 = [(SCMLVideoDecoder *)self maxNumFrames];
          if ([(SCMLVideoDecoder *)self framesPerSync] >= 2) {
            unint64_t v20 = vcvtpd_u64_f64((double)v20 / (double)[(SCMLVideoDecoder *)self framesPerSync]);
          }
          [(SCMLVideoDecoder *)self durationInSeconds];
          CMTimeMakeWithSeconds(&time, v21 / ((double)(v20 - 1) + 0.1), preferredTimescale.timescale);
        }
      }
      else
      {
        CMTimeMake(&time, 1, preferredTimescale.timescale);
      }
      CFAllocatorRef v22 = (const __CFAllocator *)*MEMORY[0x263EFFB08];
      CMTime v48 = time;
      CFDictionaryRef v23 = CMTimeCopyAsDictionary(&v48, v22);
      v24 = objc_msgSend(MEMORY[0x263EFF9A0], "dictionaryWithObjectsAndKeys:", &unk_27097A050, *MEMORY[0x263F04180], &unk_27097A068, *MEMORY[0x263F04240], &unk_27097A068, *MEMORY[0x263F04118], 0);
      v47 = v24;
      if ([(SCMLVideoDecoder *)self useKeyFrame])
      {
        v25 = NSNumber;
        v26 = [(SCMLVideoDecoder *)self config];
        v27 = objc_msgSend(v25, "numberWithUnsignedInteger:", objc_msgSend(v26, "framesPerSync"));
        [v47 setObject:v27 forKeyedSubscript:*MEMORY[0x263EFA3B0]];

        v24 = v47;
        v28 = (void *)MEMORY[0x263EFA320];
      }
      else
      {
        if (![(SCMLVideoDecoder *)self frameLimit]) {
          goto LABEL_22;
        }
        double v29 = (double)[(SCMLVideoDecoder *)self frameLimit];
        [(SCMLVideoDecoder *)self totalFrames];
        if (v30 <= v29) {
          goto LABEL_22;
        }
        [v24 setObject:*MEMORY[0x263EFA3C8] forKeyedSubscript:*MEMORY[0x263EFA3C0]];
        v28 = (void *)MEMORY[0x263EFA3F8];
      }
      [v24 setObject:v23 forKeyedSubscript:*v28];
LABEL_22:
      v31 = [MEMORY[0x263EFA4D8] assetReaderTrackOutputWithTrack:v16 outputSettings:v24];
      [(SCMLVideoDecoder *)self setAssetReaderTrack:v31];

      v32 = [(SCMLVideoDecoder *)self assetReaderTrack];
      [v32 setAlwaysCopiesSampleData:0];

      v33 = [(SCMLVideoDecoder *)self assetReaderTrack];
      [v33 setAppliesPreferredTrackTransform:1];

      v34 = [(SCMLVideoDecoder *)self assetReader];
      uint64_t v35 = [(SCMLVideoDecoder *)self assetReaderTrack];
      [v34 addOutput:v35];

      v36 = [(SCMLVideoDecoder *)self assetReader];
      LOBYTE(v35) = [v36 startReading];

      if (v35)
      {
        id v11 = 0;
      }
      else
      {
        v44 = (void *)MEMORY[0x263F087E8];
        v37 = SCMLErrorDomain[0];
        [(SCMLVideoDecoder *)self assetReader];
        v38 = v45 = v16;
        [v38 error];
        v39 = v46 = v10;
        [v39 userInfo];
        v41 = CFDictionaryRef v40 = v23;
        id v11 = [v44 errorWithDomain:v37 code:13 userInfo:v41];

        CFDictionaryRef v23 = v40;
        objc_super v10 = v46;

        v16 = v45;
      }

      if (!a4) {
        goto LABEL_28;
      }
LABEL_26:
      if (v11)
      {
        BOOL v15 = 0;
        *a4 = v11;
LABEL_31:

        goto LABEL_32;
      }
LABEL_28:
      if (v11)
      {
        BOOL v15 = 0;
      }
      else
      {
        v42 = [(SCMLVideoDecoder *)self assetReader];
        BOOL v15 = v42 != 0;
      }
      goto LABEL_31;
    }
  }
  else
  {
    v9 = 0;
  }
  if (a4)
  {
    v12 = (void *)MEMORY[0x263F087E8];
    v13 = SCMLErrorDomain[0];
    uint64_t v52 = *MEMORY[0x263F08320];
    id v11 = [NSString stringWithFormat:@"Failed to load video at %@", v6];
    v53[0] = v11;
    v14 = [NSDictionary dictionaryWithObjects:v53 forKeys:&v52 count:1];
    *a4 = [v12 errorWithDomain:v13 code:13 userInfo:v14];

    BOOL v15 = 0;
LABEL_32:

    goto LABEL_33;
  }
  BOOL v15 = 0;
LABEL_33:

  return v15;
}

- (id)nextFrameWithError:(id *)a3
{
  unint64_t v5 = [(SCMLVideoDecoder *)self maxNumFrames];
  if ([(SCMLVideoDecoder *)self currentFrameIndex] == v5) {
    goto LABEL_11;
  }
  id v6 = [(SCMLVideoDecoder *)self assetReaderTrack];
  v7 = (void *)[v6 copyNextSampleBuffer];

  if (!v7)
  {
    v9 = [(SCMLVideoDecoder *)self assetReader];
    uint64_t v10 = [v9 status];

    v8 = 0;
    if (v10 == 2 || !a3) {
      goto LABEL_12;
    }
    id v11 = (void *)MEMORY[0x263F087E8];
    v12 = SCMLErrorDomain[0];
    v13 = [(SCMLVideoDecoder *)self assetReader];
    v14 = [v13 error];
    BOOL v15 = [v14 userInfo];
    *a3 = [v11 errorWithDomain:v12 code:13 userInfo:v15];

LABEL_11:
    v8 = 0;
    goto LABEL_12;
  }
  if (!CMSampleBufferGetNumSamples((CMSampleBufferRef)v7) || !CMSampleBufferGetImageBuffer((CMSampleBufferRef)v7))
  {
    CFRelease(v7);
    goto LABEL_11;
  }
  v8 = [[SCMLVideoFrame alloc] initWithFrameBuffer:v7 frameIndex:[(SCMLVideoDecoder *)self currentFrameIndex]];
  CFRelease(v7);
  if (v8) {
    [(SCMLVideoDecoder *)self setCurrentFrameIndex:[(SCMLVideoDecoder *)self currentFrameIndex] + 1];
  }
LABEL_12:

  return v8;
}

- (SCMLVideoAnalysisConfiguration)config
{
  return self->_config;
}

- (void)setConfig:(id)a3
{
}

- (AVAssetReader)assetReader
{
  return self->_assetReader;
}

- (void)setAssetReader:(id)a3
{
}

- (AVAssetReaderTrackOutput)assetReaderTrack
{
  return self->_assetReaderTrack;
}

- (void)setAssetReaderTrack:(id)a3
{
}

- (unint64_t)frameLimit
{
  return self->_frameLimit;
}

- (void)setFrameLimit:(unint64_t)a3
{
  self->_frameLimit = a3;
}

- (unint64_t)framesPerSync
{
  return self->_framesPerSync;
}

- (void)setFramesPerSync:(unint64_t)a3
{
  self->_framesPerSync = a3;
}

- (unint64_t)currentFrameIndex
{
  return self->_currentFrameIndex;
}

- (void)setCurrentFrameIndex:(unint64_t)a3
{
  self->_currentFrameIndex = a3;
}

- (double)durationInSeconds
{
  return self->_durationInSeconds;
}

- (void)setDurationInSeconds:(double)a3
{
  self->_durationInSeconds = a3;
}

- (double)totalFrames
{
  return self->_totalFrames;
}

- (void)setTotalFrames:(double)a3
{
  self->_totalFrames = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_assetReaderTrack, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);

  objc_storeStrong((id *)&self->_config, 0);
}

@end