@interface PVCMSampleBuffer
+ (id)sampleBufferWithPVImageBuffer:(id)a3 timestamp:(id *)a4 frameDuration:(id *)a5;
+ (id)sampleBufferWithPVImageBuffer:(id)a3 timestamp:(id *)a4 frameDuration:(id *)a5 error:(id *)a6;
+ (opaqueCMSampleBuffer)createCMSampleBufferForPVImageBuffer:(id)a3 timingInfo:(id *)a4 error:(id *)a5;
- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp;
- (PVCMSampleBuffer)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3;
- (PVCMSampleBuffer)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4;
- (PVImageBuffer)backingPVImageBuffer;
- (opaqueCMSampleBuffer)sampleBufferRef;
- (void)dealloc;
@end

@implementation PVCMSampleBuffer

+ (opaqueCMSampleBuffer)createCMSampleBufferForPVImageBuffer:(id)a3 timingInfo:(id *)a4 error:(id *)a5
{
  v30[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  v8 = (__CVBuffer *)[v7 cvPixelBuffer];
  if (v8)
  {
    CMVideoFormatDescriptionRef formatDescriptionOut = 0;
    OSStatus v9 = CMVideoFormatDescriptionCreateForImageBuffer(0, v8, &formatDescriptionOut);
    int v10 = v9;
    if (a5 && v9)
    {
      switch(v9)
      {
        case -12718:
          v11 = @"Value Not Available";
          break;
        case -12711:
          v11 = @"Allocation Failed";
          break;
        case -12710:
          v11 = @"Invalid Parameter";
          break;
        default:
          v11 = &stru_1F119C770;
          break;
      }
      v14 = (void *)MEMORY[0x1E4F28C58];
      uint64_t v27 = *MEMORY[0x1E4F28568];
      v15 = [NSString stringWithFormat:@"Failed to create video format description: %@", v11];
      v28 = v15;
      v16 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v28 forKeys:&v27 count:1];
      *a5 = [v14 errorWithDomain:@"com.apple.provideo.PVFrameSet" code:v10 userInfo:v16];
    }
    CMSampleBufferRef sampleBufferOut = 0;
    if (!v10)
    {
      OSStatus v17 = CMSampleBufferCreateReadyWithImageBuffer(0, v8, formatDescriptionOut, (const CMSampleTimingInfo *)a4, &sampleBufferOut);
      int v10 = v17;
      if (a5)
      {
        if (v17)
        {
          v18 = @"Allocation Failed";
          switch(v17)
          {
            case -12744:
              v18 = @"Invalidated";
              break;
            case -12743:
              v18 = @"Invalid Media Format";
              break;
            case -12742:
              v18 = @"Invalid Sample Data";
              break;
            case -12741:
              v18 = @"Invalid Media Type For Operation";
              break;
            case -12740:
              v18 = @"Sample Timing Info Invalid";
              break;
            case -12739:
              v18 = @"Cannot Subdivide";
              break;
            case -12738:
              v18 = @"Invalid Entry Count";
              break;
            case -12737:
              v18 = @"Array Too Small";
              break;
            case -12736:
              v18 = @"Buffer Has No Sample Timing Info";
              break;
            case -12735:
              v18 = @"Buffer Has No Sample Sizes";
              break;
            case -12734:
              v18 = @"Sample Index Out Of Range";
              break;
            case -12733:
              v18 = @"Buffer Not Ready";
              break;
            case -12732:
              v18 = @"Already Has Data Buffer";
              break;
            case -12731:
              v18 = @"Required Parameter Missing";
              break;
            case -12730:
              break;
            default:
              if (v17 == -16751)
              {
                v18 = @"Data Cancelled";
              }
              else if (v17 == -16750)
              {
                v18 = @"Data Failed";
              }
              else
              {
                v18 = &stru_1F119C770;
              }
              break;
          }
          v19 = (void *)MEMORY[0x1E4F28C58];
          uint64_t v25 = *MEMORY[0x1E4F28568];
          v20 = [NSString stringWithFormat:@"Failed to create sample buffer: %@", v18];
          v26 = v20;
          v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
          *a5 = [v19 errorWithDomain:@"com.apple.provideo.PVFrameSet" code:v10 userInfo:v21];

          int v10 = 1;
        }
      }
    }
    if (formatDescriptionOut) {
      CFRelease(formatDescriptionOut);
    }
    if (v10) {
      a5 = 0;
    }
    else {
      a5 = (id *)sampleBufferOut;
    }
  }
  else if (a5)
  {
    v12 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v29 = *MEMORY[0x1E4F28568];
    v30[0] = @"Failed to create sample buffer: CVPixelBuffer is nil.";
    v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v30 forKeys:&v29 count:1];
    *a5 = [v12 errorWithDomain:@"com.apple.provideo.PVFrameSet" code:3 userInfo:v13];

    a5 = 0;
  }

  return (opaqueCMSampleBuffer *)a5;
}

+ (id)sampleBufferWithPVImageBuffer:(id)a3 timestamp:(id *)a4 frameDuration:(id *)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = *a4;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v7 = *a5;
  v5 = [a1 sampleBufferWithPVImageBuffer:a3 timestamp:&v8 frameDuration:&v7 error:0];

  return v5;
}

+ (id)sampleBufferWithPVImageBuffer:(id)a3 timestamp:(id *)a4 frameDuration:(id *)a5 error:(id *)a6
{
  v24[1] = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  if (!v11)
  {
    if (!a6) {
      goto LABEL_9;
    }
    v14 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = *MEMORY[0x1E4F28568];
    v24[0] = @"Image must not be nil.";
    v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v24 forKeys:&v23 count:1];
    *a6 = [v14 errorWithDomain:@"com.apple.provideo.PVFrameSet" code:1 userInfo:v15];

    goto LABEL_8;
  }
  *(void *)v20 = a5->var3;
  long long v19 = *(_OWORD *)&a5->var0;
  *(_OWORD *)&v20[8] = *(_OWORD *)&a4->var0;
  *(void *)&v20[24] = a4->var3;
  v17[0] = v19;
  v17[1] = *(_OWORD *)v20;
  long long v21 = *(_OWORD *)&v20[8];
  uint64_t v22 = *(void *)&v20[24];
  uint64_t v18 = *(void *)&v20[24];
  v17[2] = *(_OWORD *)&v20[16];
  v17[3] = *(_OWORD *)&v20[8];
  v12 = (const void *)[a1 createCMSampleBufferForPVImageBuffer:v11 timingInfo:v17 error:a6];
  if (!v12)
  {
LABEL_8:
    a6 = 0;
    goto LABEL_9;
  }
  a6 = [[PVCMSampleBuffer alloc] initWithSampleBuffer:v12 error:a6];
  CFRelease(v12);
  if (a6)
  {
    objc_storeStrong(a6 + 2, a3);
    v13 = a6;
  }

LABEL_9:

  return a6;
}

- (PVCMSampleBuffer)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  return [(PVCMSampleBuffer *)self initWithSampleBuffer:a3 error:0];
}

- (PVCMSampleBuffer)initWithSampleBuffer:(opaqueCMSampleBuffer *)a3 error:(id *)a4
{
  v12[1] = *MEMORY[0x1E4F143B8];
  if (!a3)
  {

    if (!a4) {
      return 0;
    }
    $3CC8671D27C23BF42ADDB32F2B5E48AE v8 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v11 = *MEMORY[0x1E4F28568];
    v12[0] = @"Sample buffer must not be nil.";
    backingPVImageBuffer = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:&v11 count:1];
    [v8 errorWithDomain:@"com.apple.provideo.PVFrameSet" code:2 userInfo:backingPVImageBuffer];
    v5 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_6;
  }
  v10.receiver = self;
  v10.super_class = (Class)PVCMSampleBuffer;
  v5 = [(PVCMSampleBuffer *)&v10 init];
  if (v5)
  {
    CFRetain(a3);
    backingPVImageBuffer = v5->_backingPVImageBuffer;
    v5->_sampleBufferRef = a3;
    v5->_backingPVImageBuffer = 0;
LABEL_6:
  }
  return v5;
}

- (void)dealloc
{
  CFRelease(self->_sampleBufferRef);
  backingPVImageBuffer = self->_backingPVImageBuffer;
  self->_backingPVImageBuffer = 0;

  v4.receiver = self;
  v4.super_class = (Class)PVCMSampleBuffer;
  [(PVCMSampleBuffer *)&v4 dealloc];
}

- ($3CC8671D27C23BF42ADDB32F2B5E48AE)presentationTimeStamp
{
  return ($3CC8671D27C23BF42ADDB32F2B5E48AE *)CMSampleBufferGetPresentationTimeStamp((CMTime *)retstr, self->_sampleBufferRef);
}

- (opaqueCMSampleBuffer)sampleBufferRef
{
  return self->_sampleBufferRef;
}

- (PVImageBuffer)backingPVImageBuffer
{
  return self->_backingPVImageBuffer;
}

- (void).cxx_destruct
{
}

@end