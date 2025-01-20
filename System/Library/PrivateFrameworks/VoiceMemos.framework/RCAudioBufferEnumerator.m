@interface RCAudioBufferEnumerator
- (RCAudioBufferEnumerator)initWithComposition:(id)a3 processingFormat:(id)a4 startTime:(double)a5 error:(id *)a6;
- (id)nextObject;
@end

@implementation RCAudioBufferEnumerator

- (RCAudioBufferEnumerator)initWithComposition:(id)a3 processingFormat:(id)a4 startTime:(double)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  v35.receiver = self;
  v35.super_class = (Class)RCAudioBufferEnumerator;
  v12 = [(RCAudioBufferEnumerator *)&v35 init];
  if (!v12)
  {
LABEL_9:
    v15 = v12;
    goto LABEL_11;
  }
  uint64_t v13 = [v10 playableAsset:a6];
  asset = v12->_asset;
  v12->_asset = (AVAsset *)v13;

  if (!v12->_asset)
  {
    v15 = 0;
    goto LABEL_11;
  }
  objc_storeStrong((id *)&v12->_processingFormat, a4);
  v15 = (RCAudioBufferEnumerator *)[objc_alloc(MEMORY[0x1E4F16378]) initWithAsset:v12->_asset error:a6];
  if (v15)
  {
    [(AVAsset *)v12->_asset rc_durationInSeconds];
    double v17 = v16;
    v18.n128_f64[0] = a5;
    Float64 v19 = RCTimeRangeMake(v18, v17);
    CMTimeRangeFromRCTimeRange(&v34, v19, v20);
    CMTimeRange v33 = v34;
    [(RCAudioBufferEnumerator *)v15 setTimeRange:&v33];
    v21 = [(AVAsset *)v12->_asset rc_audioTracks];
    v22 = (void *)MEMORY[0x1E4F16380];
    v23 = [v11 settings];
    v24 = [v22 assetReaderAudioMixOutputWithAudioTracks:v21 audioSettings:v23];

    [(AVAssetReaderAudioMixOutput *)v24 setAlwaysCopiesSampleData:0];
    if ((unint64_t)[v21 count] >= 2)
    {
      v25 = objc_opt_new();
      v32[0] = 0;
      v32[1] = v32;
      v32[2] = 0x2020000000;
      v32[3] = 0;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = __80__RCAudioBufferEnumerator_initWithComposition_processingFormat_startTime_error___block_invoke;
      v31[3] = &unk_1E6497070;
      v31[4] = v32;
      v26 = objc_msgSend(v21, "na_map:", v31);
      [v25 setInputParameters:v26];

      [(AVAssetReaderAudioMixOutput *)v24 setAudioMix:v25];
      _Block_object_dispose(v32, 8);
    }
    if ([(RCAudioBufferEnumerator *)v15 canAddOutput:v24])
    {
      [(RCAudioBufferEnumerator *)v15 addOutput:v24];
      [(RCAudioBufferEnumerator *)v15 startReading];
    }
    assetReader = v12->_assetReader;
    v12->_assetReader = (AVAssetReader *)v15;
    v28 = v15;

    mixerOutput = v12->_mixerOutput;
    v12->_mixerOutput = v24;

    goto LABEL_9;
  }
LABEL_11:

  return v15;
}

id __80__RCAudioBufferEnumerator_initWithComposition_processingFormat_startTime_error___block_invoke(uint64_t a1, uint64_t a2)
{
  v3 = [MEMORY[0x1E4F16588] audioMixInputParametersWithTrack:a2];
  v4 = v3;
  uint64_t v5 = *(void *)(*(void *)(a1 + 32) + 8);
  uint64_t v6 = *(void *)(v5 + 24);
  *(void *)(v5 + 24) = v6 + 1;
  double v7 = 0.0;
  if (!v6) {
    *(float *)&double v7 = 1.0;
  }
  long long v9 = *MEMORY[0x1E4F1FA48];
  uint64_t v10 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
  [v3 setVolume:&v9 atTime:v7];
  return v4;
}

- (id)nextObject
{
  uint64_t v3 = [(AVAssetReaderAudioMixOutput *)self->_mixerOutput copyNextSampleBuffer];
  if (v3)
  {
    v4 = (opaqueCMSampleBuffer *)v3;
    uint64_t v5 = self->_processingFormat;
    if (CMSampleBufferGetNumSamples(v4))
    {
      size_t bufferListSizeNeededOut = 0;
      uint64_t v6 = 0;
      if (!CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(v4, &bufferListSizeNeededOut, 0, 0, 0, 0, 0, 0))
      {
        uint64_t v13 = 0;
        v14 = &v13;
        uint64_t v15 = 0x3032000000;
        double v16 = __Block_byref_object_copy__8;
        double v17 = __Block_byref_object_dispose__8;
        id v18 = [MEMORY[0x1E4F1CA58] dataWithLength:bufferListSizeNeededOut];
        double v7 = (AudioBufferList *)[ (id) v14[5] mutableBytes];
        v11[0] = 0;
        v11[1] = v11;
        v11[2] = 0x2020000000;
        CMBlockBufferRef v12 = 0;
        if (CMSampleBufferGetAudioBufferListWithRetainedBlockBuffer(v4, 0, v7, bufferListSizeNeededOut, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, &v12))
        {
          uint64_t v6 = 0;
        }
        else
        {
          id v8 = objc_alloc(MEMORY[0x1E4F153B0]);
          v10[0] = MEMORY[0x1E4F143A8];
          v10[1] = 3221225472;
          v10[2] = __convertSampleBuffer_block_invoke;
          v10[3] = &unk_1E6497110;
          v10[4] = &v13;
          v10[5] = v11;
          uint64_t v6 = (void *)[v8 initWithPCMFormat:v5 bufferListNoCopy:v7 deallocator:v10];
        }
        _Block_object_dispose(v11, 8);
        _Block_object_dispose(&v13, 8);
      }
    }
    else
    {
      uint64_t v6 = 0;
    }

    CFRelease(v4);
  }
  else
  {
    uint64_t v6 = 0;
  }
  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mixerOutput, 0);
  objc_storeStrong((id *)&self->_assetReader, 0);
  objc_storeStrong((id *)&self->_processingFormat, 0);
  objc_storeStrong((id *)&self->_asset, 0);
}

@end