@interface FTTranscriptionUtilities
+ (id)parseWebVTTSampleBuffer:(opaqueCMSampleBuffer *)a3;
@end

@implementation FTTranscriptionUtilities

+ (id)parseWebVTTSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(FTWebVTTTranscriptionResult);
  [(FTWebVTTTranscriptionResult *)v4 setIsEmptyCueOut:0];
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  if (DataBuffer)
  {
    v6 = DataBuffer;
    size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
    OSStatus v8 = CMBlockBufferCopyDataBytes(v6, 0, 8uLL, &destination);
    if (v8)
    {
LABEL_3:
      v9 = [MEMORY[0x1E4F28C58] errorWithDomain:callRecordingCompositionDomain code:v8 userInfo:0];
      [(FTWebVTTTranscriptionResult *)v4 setError:v9];

      goto LABEL_12;
    }
    if (v20 == 1668576374 && DataLength >= 0x10)
    {
      CFAllocatorRef v10 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
      size_t v11 = 8;
      size_t v12 = 16;
      do
      {
        OSStatus v8 = CMBlockBufferCopyDataBytes(v6, v11, 8uLL, &destination);
        if (v8) {
          goto LABEL_3;
        }
        uint64_t v13 = bswap32(destination);
        if (v20 == 1819894128)
        {
          size_t v16 = v13 - 8;
          v17 = malloc_type_malloc(v13 - 8, 0x9B3130F9uLL);
          OSStatus v8 = CMBlockBufferCopyDataBytes(v6, v12, v16, v17);
          if (v8) {
            goto LABEL_3;
          }
          CFStringRef v18 = CFStringCreateWithBytes(v10, (const UInt8 *)v17, v16, 0x8000100u, 0);
          [(FTWebVTTTranscriptionResult *)v4 setText:v18];
          if (v18) {
            CFRelease(v18);
          }
          uint64_t v14 = 0;
          goto LABEL_11;
        }
        v11 += v13;
        size_t v12 = v11 + 8;
      }
      while (v11 + 8 <= DataLength);
    }
    [(FTWebVTTTranscriptionResult *)v4 setText:0];
    uint64_t v14 = 1;
LABEL_11:
    [(FTWebVTTTranscriptionResult *)v4 setIsEmptyCueOut:v14];
  }
LABEL_12:

  return v4;
}

@end