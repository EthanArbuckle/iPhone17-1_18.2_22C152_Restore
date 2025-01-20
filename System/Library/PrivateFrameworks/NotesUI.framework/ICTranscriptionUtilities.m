@interface ICTranscriptionUtilities
+ (id)parseWebVTTSampleBuffer:(opaqueCMSampleBuffer *)a3;
@end

@implementation ICTranscriptionUtilities

+ (id)parseWebVTTSampleBuffer:(opaqueCMSampleBuffer *)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  v4 = objc_alloc_init(ICWebVTTTranscriptionResult);
  [(ICWebVTTTranscriptionResult *)v4 setIsEmptyCueOut:0];
  DataBuffer = CMSampleBufferGetDataBuffer(a3);
  if (!DataBuffer)
  {
    v11 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v9 = *MEMORY[0x1E4F83668];
    uint64_t v10 = -12705;
    goto LABEL_5;
  }
  v6 = DataBuffer;
  size_t DataLength = CMBlockBufferGetDataLength(DataBuffer);
  OSStatus v8 = CMBlockBufferCopyDataBytes(v6, 0, 8uLL, &destination);
  if (v8)
  {
LABEL_3:
    uint64_t v9 = *MEMORY[0x1E4F83668];
    uint64_t v10 = v8;
    v11 = (void *)MEMORY[0x1E4F28C58];
LABEL_5:
    v12 = [v11 errorWithDomain:v9 code:v10 userInfo:0];
    [(ICWebVTTTranscriptionResult *)v4 setError:v12];

    goto LABEL_6;
  }
  if (v23 == 1668576374 && DataLength >= 0x10)
  {
    CFAllocatorRef v14 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
    size_t v15 = 8;
    size_t v16 = 16;
    do
    {
      OSStatus v8 = CMBlockBufferCopyDataBytes(v6, v15, 8uLL, &destination);
      if (v8) {
        goto LABEL_3;
      }
      uint64_t v17 = bswap32(destination);
      if (v23 == 1819894128)
      {
        size_t v19 = v17 - 8;
        v20 = malloc_type_malloc(v17 - 8, 0xD64750DEuLL);
        OSStatus v8 = CMBlockBufferCopyDataBytes(v6, v16, v19, v20);
        if (v8) {
          goto LABEL_3;
        }
        CFStringRef v21 = CFStringCreateWithBytes(v14, (const UInt8 *)v20, v19, 0x8000100u, 0);
        [(ICWebVTTTranscriptionResult *)v4 setText:v21];
        if (v21) {
          CFRelease(v21);
        }
        uint64_t v18 = 0;
        goto LABEL_16;
      }
      v15 += v17;
      size_t v16 = v15 + 8;
    }
    while (v15 + 8 <= DataLength);
  }
  [(ICWebVTTTranscriptionResult *)v4 setText:0];
  uint64_t v18 = 1;
LABEL_16:
  [(ICWebVTTTranscriptionResult *)v4 setIsEmptyCueOut:v18];
LABEL_6:
  return v4;
}

@end