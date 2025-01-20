@interface RCAssetWriter
- (AVAudioFormat)fileFormat;
- (AVAudioFormat)processingFormat;
- (BOOL)_appendBufferOnQueue:(id)a3 error:(id *)a4;
- (BOOL)startWritingAudioFile:(id *)a3;
- (BOOL)writeFromBuffer:(id)a3 error:(id *)a4;
- (NSDictionary)settings;
- (NSURL)url;
- (id)initForWriting:(id)a3 settings:(id)a4 error:(id *)a5;
- (int64_t)frameCount;
- (void)finishWritingAudioFile:(id)a3;
@end

@implementation RCAssetWriter

- (id)initForWriting:(id)a3 settings:(id)a4 error:(id *)a5
{
  id v9 = a3;
  id v10 = a4;
  uint64_t v11 = *MEMORY[0x1E4F15A78];
  v38.receiver = self;
  v38.super_class = (Class)RCAssetWriter;
  v12 = [(AVAssetWriter *)&v38 initWithURL:v9 fileType:v11 error:a5];
  v13 = v12;
  if (!v12) {
    goto LABEL_7;
  }
  objc_storeStrong((id *)&v12->_url, a3);
  uint64_t v14 = [objc_alloc(MEMORY[0x1E4F153A0]) initWithSettings:v10];
  fileFormat = v13->_fileFormat;
  v13->_fileFormat = (AVAudioFormat *)v14;

  if (!checkAudioFormat((uint64_t)v13->_fileFormat, (uint64_t)v10, a5)
    || (id v16 = objc_alloc(MEMORY[0x1E4F153A0]),
        [(AVAudioFormat *)v13->_fileFormat sampleRate],
        uint64_t v18 = objc_msgSend(v16, "initWithCommonFormat:sampleRate:channels:interleaved:", 1, -[AVAudioFormat channelCount](v13->_fileFormat, "channelCount"), 0, v17), processingFormat = v13->_processingFormat, v13->_processingFormat = (AVAudioFormat *)v18, processingFormat, !checkAudioFormat((uint64_t)v13->_processingFormat, (uint64_t)v10, a5)))
  {
LABEL_13:
    v31 = 0;
    goto LABEL_14;
  }
  objc_storeStrong((id *)&v13->_settings, a4);
  dispatch_queue_t v20 = dispatch_queue_create(0, 0);
  bufferQueue = v13->_bufferQueue;
  v13->_bufferQueue = (OS_dispatch_queue *)v20;

  dispatch_group_t v22 = dispatch_group_create();
  bufferGroup = v13->_bufferGroup;
  v13->_bufferGroup = (OS_dispatch_group *)v22;

  uint64_t v24 = objc_opt_new();
  buffers = v13->_buffers;
  v13->_buffers = (NSMutableArray *)v24;

  uint64_t v26 = [(AVAudioFormat *)v13->_processingFormat formatDescription];
  id formatDescription = v13->_formatDescription;
  v13->_id formatDescription = (id)v26;

  if (!v13->_formatDescription)
  {
    CMAudioFormatDescriptionRef formatDescriptionOut = 0;
    OSStatus v32 = CMAudioFormatDescriptionCreate(0, [(AVAudioFormat *)v13->_processingFormat streamDescription], 0, 0, 0, 0, 0, &formatDescriptionOut);
    if (v32)
    {
      if (a5)
      {
        *a5 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v32 userInfo:0];
      }
      goto LABEL_13;
    }
    id v34 = v13->_formatDescription;
    v13->_id formatDescription = formatDescriptionOut;
  }
  [(AVAudioFormat *)v13->_processingFormat sampleRate];
  v13->_sampleRate = (int)v28;
  uint64_t v29 = [MEMORY[0x1E4F163C0] assetWriterInputWithMediaType:*MEMORY[0x1E4F15BA8] outputSettings:v13->_settings sourceFormatHint:v13->_formatDescription];
  input = v13->_input;
  v13->_input = (AVAssetWriterInput *)v29;

  [(AVAssetWriterInput *)v13->_input setExpectsMediaDataInRealTime:1];
  if (![(AVAssetWriter *)v13 canAddInput:v13->_input])
  {
    if (a5)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F15AC0] code:-11861 userInfo:v10];
      v31 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  [(AVAssetWriter *)v13 addInput:v13->_input];
  CMTimeMakeWithSeconds(&v36, 2.0, kCMDefaultTimeScale);
  CMTime v35 = v36;
  [(AVAssetWriter *)v13 setMovieFragmentInterval:&v35];
LABEL_7:
  v31 = v13;
LABEL_14:

  return v31;
}

- (BOOL)startWritingAudioFile:(id *)a3
{
  BOOL v5 = [(AVAssetWriter *)self startWriting];
  if (v5)
  {
    long long v7 = *MEMORY[0x1E4F1FA48];
    uint64_t v8 = *(void *)(MEMORY[0x1E4F1FA48] + 16);
    [(AVAssetWriter *)self startSessionAtSourceTime:&v7];
  }
  else if (a3)
  {
    *a3 = [(AVAssetWriter *)self error];
  }
  return v5;
}

- (BOOL)_appendBufferOnQueue:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id formatDescription = (const opaqueCMFormatDescription *)self->_formatDescription;
  CMTimeMake(&v14, self->_frameCount, self->_sampleRate);
  id v8 = v6;
  CMSampleBufferRef v16 = 0;
  unsigned int v9 = [v8 frameLength];
  CMTime presentationTimeStamp = v14;
  OSStatus v10 = CMAudioSampleBufferCreateWithPacketDescriptions(0, 0, 0, 0, 0, formatDescription, v9, &presentationTimeStamp, 0, &v16);
  if (v10
    || (OSStatus v10 = CMSampleBufferSetDataBufferFromAudioBufferList(v16, (CFAllocatorRef)*MEMORY[0x1E4F1CF80], (CFAllocatorRef)*MEMORY[0x1E4F1CF80], 0, (const AudioBufferList *)[v8 audioBufferList])) != 0|| (OSStatus v10 = CMSampleBufferSetDataReady(v16)) != 0)
  {
    if (v16) {
      CFRelease(v16);
    }

    if (a4)
    {
      [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28760] code:v10 userInfo:0];
      BOOL v11 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v11 = 0;
    }
  }
  else
  {
    CMSampleBufferRef v13 = v16;

    [(AVAssetWriterInput *)self->_input appendSampleBuffer:v13];
    CFRelease(v13);
    self->_frameCount += [v8 frameLength];
    BOOL v11 = 1;
  }

  return v11;
}

- (void)finishWritingAudioFile:(id)a3
{
  id v4 = a3;
  bufferGroup = self->_bufferGroup;
  bufferQueue = self->_bufferQueue;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __40__RCAssetWriter_finishWritingAudioFile___block_invoke;
  v8[3] = &unk_1E6496F68;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_group_notify(bufferGroup, bufferQueue, v8);
}

uint64_t __40__RCAssetWriter_finishWritingAudioFile___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) status] == 1)
  {
    [*(id *)(*(void *)(a1 + 32) + 32) markAsFinished];
    v2 = *(void **)(a1 + 32);
    uint64_t v3 = *(void *)(a1 + 40);
    return [v2 finishWritingWithCompletionHandler:v3];
  }
  else
  {
    BOOL v5 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
    return v5();
  }
}

- (BOOL)writeFromBuffer:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v33 = 0;
  id v34 = &v33;
  uint64_t v35 = 0x2020000000;
  char v36 = 0;
  uint64_t v27 = 0;
  double v28 = &v27;
  uint64_t v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__10;
  v31 = __Block_byref_object_dispose__10;
  id v32 = 0;
  id v7 = self->_input;
  id v8 = self->_bufferGroup;
  id v9 = self->_bufferQueue;
  OSStatus v10 = self->_buffers;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __39__RCAssetWriter_writeFromBuffer_error___block_invoke;
  v19[3] = &unk_1E6497840;
  v19[4] = self;
  v25 = &v27;
  BOOL v11 = v10;
  dispatch_queue_t v20 = v11;
  v12 = v7;
  v21 = v12;
  uint64_t v26 = &v33;
  id v13 = v6;
  id v22 = v13;
  CMTime v14 = v8;
  v23 = v14;
  v15 = v9;
  uint64_t v24 = v15;
  dispatch_sync(v15, v19);
  int v16 = *((unsigned __int8 *)v34 + 24);
  if (a4 && !*((unsigned char *)v34 + 24))
  {
    *a4 = (id) v28[5];
    int v16 = *((unsigned __int8 *)v34 + 24);
  }
  BOOL v17 = v16 != 0;

  _Block_object_dispose(&v27, 8);
  _Block_object_dispose(&v33, 8);

  return v17;
}

void __39__RCAssetWriter_writeFromBuffer_error___block_invoke(uint64_t a1)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 80);
  if (v2)
  {
    objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 80) + 8) + 40), v2);
  }
  else
  {
    uint64_t v3 = [*(id *)(a1 + 40) count];
    if (v3 || ![*(id *)(a1 + 48) isReadyForMoreMediaData])
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = 1;
      id v8 = *(void **)(a1 + 40);
      id v9 = (void *)[*(id *)(a1 + 56) copy];
      [v8 addObject:v9];

      dispatch_group_enter(*(dispatch_group_t *)(a1 + 64));
      if (!v3)
      {
        OSStatus v10 = *(void **)(a1 + 48);
        uint64_t v11 = *(void *)(a1 + 72);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = __39__RCAssetWriter_writeFromBuffer_error___block_invoke_2;
        v14[3] = &unk_1E64967F8;
        id v15 = v10;
        id v12 = *(id *)(a1 + 40);
        uint64_t v13 = *(void *)(a1 + 32);
        id v16 = v12;
        uint64_t v17 = v13;
        id v18 = *(id *)(a1 + 64);
        [v15 requestMediaDataWhenReadyOnQueue:v11 usingBlock:v14];
      }
    }
    else
    {
      id v4 = *(void **)(a1 + 32);
      uint64_t v5 = *(void *)(a1 + 56);
      uint64_t v6 = *(void *)(*(void *)(a1 + 80) + 8);
      id v19 = *(id *)(v6 + 40);
      char v7 = [v4 _appendBufferOnQueue:v5 error:&v19];
      objc_storeStrong((id *)(v6 + 40), v19);
      *(unsigned char *)(*(void *)(*(void *)(a1 + 88) + 8) + 24) = v7;
    }
  }
}

uint64_t __39__RCAssetWriter_writeFromBuffer_error___block_invoke_2(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) isReadyForMoreMediaData];
  if (result)
  {
    do
    {
      uint64_t result = [*(id *)(a1 + 40) count];
      if (!result) {
        break;
      }
      uint64_t v3 = [*(id *)(a1 + 40) firstObject];
      if (v3)
      {
        id v4 = *(void **)(a1 + 48);
        id v8 = 0;
        char v5 = [v4 _appendBufferOnQueue:v3 error:&v8];
        id v6 = v8;
        id v7 = v8;
        if ((v5 & 1) == 0) {
          objc_storeStrong((id *)(*(void *)(a1 + 48) + 80), v6);
        }
        [*(id *)(a1 + 40) removeObjectAtIndex:0];
        dispatch_group_leave(*(dispatch_group_t *)(a1 + 56));
      }
      uint64_t result = [*(id *)(a1 + 32) isReadyForMoreMediaData];
    }
    while ((result & 1) != 0);
  }
  return result;
}

- (NSDictionary)settings
{
  return self->_settings;
}

- (AVAudioFormat)fileFormat
{
  return self->_fileFormat;
}

- (AVAudioFormat)processingFormat
{
  return self->_processingFormat;
}

- (NSURL)url
{
  return self->_url;
}

- (int64_t)frameCount
{
  return self->_frameCount;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_url, 0);
  objc_storeStrong((id *)&self->_processingFormat, 0);
  objc_storeStrong((id *)&self->_fileFormat, 0);
  objc_storeStrong((id *)&self->_appendError, 0);
  objc_storeStrong((id *)&self->_buffers, 0);
  objc_storeStrong((id *)&self->_bufferGroup, 0);
  objc_storeStrong((id *)&self->_bufferQueue, 0);
  objc_storeStrong((id *)&self->_input, 0);
  objc_storeStrong(&self->_formatDescription, 0);

  objc_storeStrong((id *)&self->_settings, 0);
}

@end